/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package des;

import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;


/**
 
 * @author Yash
 */
public class DES {

    Cipher ecipher;
    Cipher dcipher;
    public DES(SecretKey desKey, String algorithm)
    {
        try{
        ecipher=Cipher.getInstance(algorithm);
        dcipher=Cipher.getInstance(algorithm);
        ecipher.init(Cipher.ENCRYPT_MODE, desKey);
        dcipher.init(Cipher.DECRYPT_MODE, desKey);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
    public String encrypt(String str)
    {
        try
        {
        byte[] utf8=str.getBytes("UTF-8");
        byte[] enc=ecipher.doFinal(utf8);
        return new sun.misc.BASE64Encoder().encode(enc);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
        
        
    }
    public String decrypt(String str)
    {
        try
        {
            byte[] dec=new sun.misc.BASE64Decoder().decodeBuffer(str);
            byte[] utf8=dcipher.doFinal(dec);
            return new String(utf8,"UTF-8");
            
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) throws NoSuchAlgorithmException {
        String secString="welcome to the world of cryptography";
        SecretKey desKey=KeyGenerator.getInstance("AES").generateKey();
        DES obj=new DES(desKey,desKey.getAlgorithm());
        String enc=obj.encrypt(secString);
        String dec=obj.decrypt(enc);
        System.out.println(desKey+" "+desKey.getAlgorithm());
        System.out.println(secString+" "+enc+ " "+dec);
        
        
    }
    
}
