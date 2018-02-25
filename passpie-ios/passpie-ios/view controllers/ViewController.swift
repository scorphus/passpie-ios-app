//
//  ViewController.swift
//  passpie-ios
//
//  Created by Harjas Monga on 2/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit
import Yaml
import ObjectivePGP

class ViewController: UIViewController {

    @IBOutlet weak var accessTokenField: UITextField!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var repoField: UITextField!
    var items: [RepoItem]?
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view, typically from a nib.
        let yamlString = "password: '-----BEGIN PGP MESSAGE-----\n\nVersion: GnuPG v2\n\n\nhQEMA99VVXka2/4BAQf+JFibxEQj93dWJvSI8G7Ak5HbgfoSQ2ST5Wwl+tCPzBkE\n\niixUEt/yiFw68OX64+hKmmXeV+dKpj/T53DFCfX6CuYq352QuZKOYhPbRtR4ztXE\n\nhdk0F/8LC8v+2V3AE7DU9H6J9pKtfJZQKUpTgXXJCyxJZMxl72KH726TDMYRANsv\n\n0GmfO30jDiXPiDlJSjCj6PWelh5vejeLIc2IWiAqs+9eumts/nyEMAMT0w2u6OMN\n\nT66y1DdTsCD8X7jtPUoVjsNO+2CwYeuWX7QZ3QkBIZnIzdu14F1+1kJ9HptjPufT\n\nNqobXWKYtoZ/x6krasWNwwTy0s/DNuvaFwUtDfVVg9JbAWWR2TPuFAjqt2zbrjs0\n\nRlrDRTrX7pmhX+v6lNvdxxIWIxuFEO+m5tQv8EZ4L79G0QuSH8ipzBZnLbQTrCGa\n\nABjWg7kLw37BRBDXJjUlvtC3EyxfNd4F+IZ7FQ==\n\n=khE1\n\n-----END PGP MESSAGE-----\n\n'\n"
        
        print(yamlString)
        var yamlData = try! Yaml.load(yamlString)
        let encrypted = yamlData["password"].string
        let keys = try ObjectivePGP.readKeys(from:"-----BEGIN PGP PUBLIC KEY BLOCK-----\r\n" +
            "mQINBFayWs4BEACl0lSslmNepPqyhgIBfzScq3oe8KkkbYeAhzmZN6Z5zsskH+8T\r\n" +
            "quLJ0GMWiO+Q2lqr6nX9hrfXkTyjtsWwB43wrBMFunTKt8VoABcs+tvhQZ8ggWgQ\r\n" +
            "htmetNmRqzR5w25MeUr+6ifjwwcoHDGql+X/LViF0sn7O9rjqg28gBigneBrqI+e\r\n" +
            "VXrOdu9QkXiiD63B5FwI53pw08bbhwXYfRZqui0dsNeIk4KHckq/gkKByyZh8zRs\r\n" +
            "RWxn2RzUuNWWfJi/eSm122IiEnjiqVlrUa2Mh+/bh5Jv+v7ZZIW15a9S5ytoX1/C\r\n" +
            "sGzGScsI9rrETB7eSzh9ba4r/c0tzkcjtt3ekUOv5uOMnjpIeC1Qiw/jQ1J3gfKD\r\n" +
            "p5VTNVWVLBo+9/l6hzB2HejeC0QrjALo6+0PIALF2EmeWRvFdgQb6fEtW4TwEVVs\r\n" +
            "ZTsf+YbWAu7fRnSiIlv1Eu++uLVV53avvyYS7LJx4imlkHs/WyqTEGP+8sVXnlZG\r\n" +
            "kTO6QGCK9FpRaw5HDs19htJDTYrPhf5CObhzJjE3IOn7Sv7zonGObWYF/khUD/YV\r\n" +
            "gv3NT2gFfI3ICMxGJY+5VSVooEA/JYExgUfjDqTN9rpgyGU8Sjc1okhcHxUYWkfE\r\n" +
            "Df9VXRvJnhIxxjsHmzXh0POzxRh+RWGegHZ5u6liFnNuXRoYpyYdzzfVeQARAQAB\r\n" +
            "tDNQYXNzcGllIChBdXRvLWdlbmVyYXRlZCBieSBQYXNzcGllKSA8cGFzc3BpZUBs\r\n" +
            "b2NhbD6JAjkEEwEIACMFAlayWs4CGy8HCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIX\r\n" +
            "gAAKCRAq6pB48p+nOuHpD/4slwLIGnCHSPevLDzk2Hnhrpm/QfdDs6mPJpom8dNg\r\n" +
            "ir/YkFLLuIxP1M7d8XsVbZLJUyKFwNC1s65p5RDZTSy/Hktri3xh5d2k+QDv+4FY\r\n" +
            "AMuGJ9El6g24yWWRjeevD/3J4dt8+HZmb+wffUGpaFjX8MHBJypxwc7pwVWpM+7M\r\n" +
            "Oc8PwNxVhmiLaIVH40L9wjG0/t5v3nQ136XZcnOcHLZzICdrYw82zoop+7Y3Kc1R\r\n" +
            "kvPI9in/TqGBrVAIxxZVO/heOBW3upuDGmjuaAug2pxZJOPqpstSAGm2AD+ij76n\r\n" +
            "6DMa8zzL8GgVRGDNFC0Px09QHnS5x0kzHStNLuIiwHotq8vIQWtyhiRfg6v6UERg\r\n" +
            "Noamp9DKS6CUKLZ29KCUNKO54z+wLEK/GF6wAg9E+5Wsv3Ogl8E2fnWP5qVbAtIV\r\n" +
            "4LtHLmdQ5hB5q/1amLHyEBYEVXRFyou6idKj2qMyqa9FwlvZdSLGDSfAmoxLTAWB\r\n" +
            "OrFqdsyPK5Ra0T2XLLXuH5MqATg7WWPTT6r1qER/kIAqrUjAYT4jywNumo1YEYTd\r\n" +
            "VGUjKmdZrPhbDJxgTdKA9WjQdI6xyVdYWxClE9zuz8qq6qZM0e0cle27FHykk9zn\r\n" +
            "5y5Kn7+l/CwDFc8UvRkh1/sxZ0fFe9jZ94OeiB7gRqX8JsJTIKMOg3oMJ8M+0cYw\r\n" +
            "M7kBDQRWslrOAQgAuGEATzGkMmmCjLHCCA9WTrfPLZTx21RY+q1IzB52pgp87spJ\r\n" +
            "PCk8C5SSy2e0sga5znm8n2CUfevfSabn8KtTj24s5J6e4i09vCI4cJymJhrXbapc\r\n" +
            "atOf36dk7g8BgUXvW77DG227s6oNtYqDEM7rpilIEFqJ2iuRYJopXOn4h+zRSjI7\r\n" +
            "WQgIUgcKdj11n8GcouyftPONphdN0DeLixWSd53V9LZLJ5maR3CWC5s5tDuMEfGX\r\n" +
            "wk16Zb1xE+RHCPDOXZwDn+/OmkKWjUd/T2QbIv+5PswYD61h4QTpBa1lfIN9PZbh\r\n" +
            "vecxfvOA3MWcO+oym4WNH5dyPWb6mvizqW5S/wARAQABiQM+BBgBCAAJBQJWslrO\r\n" +
            "AhsuASkJECrqkHjyn6c6wF0gBBkBCAAGBQJWslrOAAoJEN9VVXka2/4BCjEH/1Sb\r\n" +
            "+PqGpb1HVcpjckpwwxRwzaDl74kbJyxTO6jhmti/Oyabf+FIg7dJvRUGejReV39e\r\n" +
            "wrGbiq7RWjcnae2nZny02cpbfsN8Sg9Im5G7oguOOMnjt2CdA1yxyxPzXqoKfEcQ\r\n" +
            "z/sm1Ctydl4lN5gLrI0SQ/zAn97QhMLLJbg2bjJrMoiKAVKobLFIh7R26F5IXUhU\r\n" +
            "qlaNYZkCCHNE2YTHuxB0uKJMN0xBLLCSQLSQrT6KoVhsb+coFZgEyQdV87O1vZ8Z\r\n" +
            "h3iUBSV4s+4R165qh4DhcOkL4HnJ9VtTQp3GsWpeHLZfDliQASUfPqrT93/Q9Hqr\r\n" +
            "Vo4allA6NU0Iuzw/f0EtIBAAiXvw5+SMTDLPv7hLGHOiLHsDk13adJ7Be9C/yVI1\r\n" +
            "jxVWgA5T5GwIHQ5FYkJog0fL8xDjKqIC8BEsEiWUAlwIMDNneQOMp43HkUHjL1HD\r\n" +
            "qMDeZrQw3V5wbE9aq/kzOVvdPq/cjwmofN+eJNRs9qiT6rahoBLURLu9lGEHCYL3\r\n" +
            "DjxK9UEEhMVBV4A7pPcnOvF0PdZyQmWu5kdKmKbEW4HY2GOc1Cd1HjszGgATeTdO\r\n" +
            "4x6YbTKTfu0h+X874nqloTvjUJKcy/4EOsIkQQXjktHjeSzWuK+msMJyogspczDI\r\n" +
            "6GUkOYtIZY2n42IquOcOnk7aeUjB1kUle34n9ytkMnTBX1UjENJECdJCYiq/OvNF\r\n" +
            "wUVUNAGbtU/ooA+5vlz5wDyr94Nts7Wqz83F6G3kkyGekm1aHGJyjz+wj9l8edwi\r\n" +
            "7jCPQKSuONPejDGUbvB6b9MkMe388kASVf5J+64LN0te76Q/uWb08Wq5FGdw3drB\r\n" +
            "/7a17Qv/JhU056VuzCVggSUvV/Av1+mU18yJCkSLpPaS/MEekBh0vqCSUPzHDJMa\r\n" +
            "oD5DwwFfNSaiDcybKRTdyaACn6spdP6OKzQr2HOA9mNPh1Q7KiANJJR+Feemrgpz\r\n" +
            "xGkwtiBAZFCf552/D1gQDELqhjNs4CBsOjdYiAJv5xHAP9Imu/F3v+u0Px/ECa9W\r\n" +
            "i+0=\r\n" +
            "=+muV\r\n" +
            "-----END PGP PUBLIC KEY BLOCK-----\r\n" +
            "-----BEGIN PGP PRIVATE KEY BLOCK-----\r\n" +
            "lQc+BFayWs4BEACl0lSslmNepPqyhgIBfzScq3oe8KkkbYeAhzmZN6Z5zsskH+8T\r\n" +
            "quLJ0GMWiO+Q2lqr6nX9hrfXkTyjtsWwB43wrBMFunTKt8VoABcs+tvhQZ8ggWgQ\r\n" +
            "htmetNmRqzR5w25MeUr+6ifjwwcoHDGql+X/LViF0sn7O9rjqg28gBigneBrqI+e\r\n" +
            "VXrOdu9QkXiiD63B5FwI53pw08bbhwXYfRZqui0dsNeIk4KHckq/gkKByyZh8zRs\r\n" +
            "RWxn2RzUuNWWfJi/eSm122IiEnjiqVlrUa2Mh+/bh5Jv+v7ZZIW15a9S5ytoX1/C\r\n" +
            "sGzGScsI9rrETB7eSzh9ba4r/c0tzkcjtt3ekUOv5uOMnjpIeC1Qiw/jQ1J3gfKD\r\n" +
            "p5VTNVWVLBo+9/l6hzB2HejeC0QrjALo6+0PIALF2EmeWRvFdgQb6fEtW4TwEVVs\r\n" +
            "ZTsf+YbWAu7fRnSiIlv1Eu++uLVV53avvyYS7LJx4imlkHs/WyqTEGP+8sVXnlZG\r\n" +
            "kTO6QGCK9FpRaw5HDs19htJDTYrPhf5CObhzJjE3IOn7Sv7zonGObWYF/khUD/YV\r\n" +
            "gv3NT2gFfI3ICMxGJY+5VSVooEA/JYExgUfjDqTN9rpgyGU8Sjc1okhcHxUYWkfE\r\n" +
            "Df9VXRvJnhIxxjsHmzXh0POzxRh+RWGegHZ5u6liFnNuXRoYpyYdzzfVeQARAQAB\r\n" +
            "/gMDAuncodQR2yfc2Qfj73pRiK2Ws7/lt7ycZMahxVVkCJuwKAhqbZ8mSmRwmaXw\r\n" +
            "7heRtLRj8nURyy66GIe1UofpZMUbw+rQVRMOvry+4lgJBrhPUZf5S3hbJJBzc71S\r\n" +
            "DxVzUzD0fd7LEeYrfoZ9UGl8mciB6coe1xHsP1b1E9AhTxRf9eamMxEA/7kT8pfJ\r\n" +
            "hQ4ElPHfwLHHru9o7wUvWOrTU7I0anj86AKt2mgR63ss5giN39en3MXTuMldTVVg\r\n" +
            "UqaXofL7WKJDBTc5F4Z/SUIAuJkWntaCHc249DUuEbt7j6TdwBr9ov7/6Rn60D9K\r\n" +
            "0B0pbe39z/kraSdhc9RbuXthByyYTTuT6Mh22qaLqyLDXf3pMbETtyQOWIo36MLu\r\n" +
            "Xl7P9NA8vPdbKDfUxF+2kbsEPULfApViHWgVvCCpG1jipUI82JlK1qf14YBcj3ek\r\n" +
            "8rvqX1wEYj24BmXLNovqMcBnzgp2+W9vhKo7sTTOk+YFbgojOXIynEPnU5mTNZzW\r\n" +
            "jxV8l7vlZwKKUq5qavfQ2G0S6StLI+qs973NMkq7aSsgGtWkigz7StH8t5EWEe0z\r\n" +
            "ofcikdc4fxh7IBlKLeIoNa6szKRzgMyCoc/IWznNTXiy32UqUM+TnWYPyCiKYcEa\r\n" +
            "ZsF26WwNDARixvmudKnUHdz6lzcL3PikgbMvALda/VsSyAx1GLTxsSmCmk8YAOqB\r\n" +
            "lC6guOhGxl6vsYv6g0/19ak30rO3zpkcw3tnUy0n/BA5N9f4/o772ji9ChitRW3X\r\n" +
            "f51H7yDIrRNKREsGCWT8vRuWDqTMW9f3tg1e0//A0U+Kx/9JYEseh+1n/nhBed9Y\r\n" +
            "Z3QiCj+BzmECWP3mEHvTpQZ70AKX+VEL8MsV+6HE5MICd+fvj3xv02pRkbd/Rc6a\r\n" +
            "A6IKTaibS+szqttw7wZgexW+LgMNvNFCBXZoDffOKlxDHZoeRbEsm7DeoDrBjIpZ\r\n" +
            "y20Hhze9CvE0RMDwmhUOJ4xWn9r0OHjB3WBRnl3nAwpvrmq3hChVddKTxzs5/Oxz\r\n" +
            "iq61VkjSkcfZcR3pKfeds+INnWWbt3H1/UFEe/jzoNwTgJo/2cM1zreuE5sI86IR\r\n" +
            "iw+FXLqj7p00QBeOeCUqNObYk6t0+E76afm8INHx7x10pVfmABtJ9TB1BiYdyUjj\r\n" +
            "nHdrfVQeKgHZFZPmvfSUXKHVqrzgrORIn/zAe3t6m5KnHj9gzC2zDiBf1pUiqN9Q\r\n" +
            "vdeful6zde2inCPnu1VsbVZgR5uoVO+omRw6Y/LviNZLVaaUxNBVJtSsYBHhAVcV\r\n" +
            "UUY8eDQXwgG3LHfvXOnugeZj7+XJtEf5Q3HXjYTy5KnquxebgBcW6XtHmoL0AweL\r\n" +
            "39N2y+01ieSUzU4V6svUqhVQU7iRj5FOcdFc7bSzHqkgsDl66RkNcFXi3xt/FL7R\r\n" +
            "+wbA4oKWXrSu1l//DbUSjLiLSp6wywXn+7dRp8naA2+oLDGdf5yOK60UCajvgahe\r\n" +
            "mrS7zzriPxSQ+gSqzBJEWbdC3/jVdsvS7HWiyrUHim341ihROy3MZuYcc/Z7ByJs\r\n" +
            "j7gXAQtFGSSQeLKzzUZQ57OaZHsCkJ3U+MS2amR6vkxCXDnNBuL2E0VinD6B/ur3\r\n" +
            "3v9MqULUQenKbCPBCRFaAElAYCiDjdsvWr5MXd6N1QajAMI9L954AM2O1DJDWJF5\r\n" +
            "aP8C7IOCNrI8/jTnar+9OLPSzmY2NVypj832EUgMZD/TP3MGU1bqzaFe2/cWI/EP\r\n" +
            "RSndR6I7AaEpkUc+U4OrOkDkIvZYBuooggXCayAK6p+otDNQYXNzcGllIChBdXRv\r\n" +
            "LWdlbmVyYXRlZCBieSBQYXNzcGllKSA8cGFzc3BpZUBsb2NhbD6JAjkEEwEIACMF\r\n" +
            "AlayWs4CGy8HCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRAq6pB48p+nOuHp\r\n" +
            "D/4slwLIGnCHSPevLDzk2Hnhrpm/QfdDs6mPJpom8dNgir/YkFLLuIxP1M7d8XsV\r\n" +
            "bZLJUyKFwNC1s65p5RDZTSy/Hktri3xh5d2k+QDv+4FYAMuGJ9El6g24yWWRjeev\r\n" +
            "D/3J4dt8+HZmb+wffUGpaFjX8MHBJypxwc7pwVWpM+7MOc8PwNxVhmiLaIVH40L9\r\n" +
            "wjG0/t5v3nQ136XZcnOcHLZzICdrYw82zoop+7Y3Kc1RkvPI9in/TqGBrVAIxxZV\r\n" +
            "O/heOBW3upuDGmjuaAug2pxZJOPqpstSAGm2AD+ij76n6DMa8zzL8GgVRGDNFC0P\r\n" +
            "x09QHnS5x0kzHStNLuIiwHotq8vIQWtyhiRfg6v6UERgNoamp9DKS6CUKLZ29KCU\r\n" +
            "NKO54z+wLEK/GF6wAg9E+5Wsv3Ogl8E2fnWP5qVbAtIV4LtHLmdQ5hB5q/1amLHy\r\n" +
            "EBYEVXRFyou6idKj2qMyqa9FwlvZdSLGDSfAmoxLTAWBOrFqdsyPK5Ra0T2XLLXu\r\n" +
            "H5MqATg7WWPTT6r1qER/kIAqrUjAYT4jywNumo1YEYTdVGUjKmdZrPhbDJxgTdKA\r\n" +
            "9WjQdI6xyVdYWxClE9zuz8qq6qZM0e0cle27FHykk9zn5y5Kn7+l/CwDFc8UvRkh\r\n" +
            "1/sxZ0fFe9jZ94OeiB7gRqX8JsJTIKMOg3oMJ8M+0cYwM50DvgRWslrOAQgAuGEA\r\n" +
            "TzGkMmmCjLHCCA9WTrfPLZTx21RY+q1IzB52pgp87spJPCk8C5SSy2e0sga5znm8\r\n" +
            "n2CUfevfSabn8KtTj24s5J6e4i09vCI4cJymJhrXbapcatOf36dk7g8BgUXvW77D\r\n" +
            "G227s6oNtYqDEM7rpilIEFqJ2iuRYJopXOn4h+zRSjI7WQgIUgcKdj11n8Gcouyf\r\n" +
            "tPONphdN0DeLixWSd53V9LZLJ5maR3CWC5s5tDuMEfGXwk16Zb1xE+RHCPDOXZwD\r\n" +
            "n+/OmkKWjUd/T2QbIv+5PswYD61h4QTpBa1lfIN9PZbhvecxfvOA3MWcO+oym4WN\r\n" +
            "H5dyPWb6mvizqW5S/wARAQAB/gMDAuncodQR2yfc2deAm/itHVcB7C0w9xUhAdHU\r\n" +
            "dh68DRHPvYZ/8KG/WtfkB/gnj8uKu+QKREXPCcgpNaqX7lMstzC1TIZcncN3omuG\r\n" +
            "Erc460tPGLtfyRI47owVzmlMTkPSSQ7sm/97wM58Quvrt1hJdxLVvbucl0GPTmg8\r\n" +
            "2qReZD1LysF9eWTC5nIRwYkUhY8GIzJZSUMWPQMMGIZTB8RKcHU3EvTvOXQD++gE\r\n" +
            "6lR2umqglT78/uUfkzKesqwVVkB60/oI/4OoX51SbvnJ5E4OuMBJiKjv7g0twNKs\r\n" +
            "XhyO5vxudJdWRY1Kn3SSsTPTSHpaz0vdWpO3HMVJ/EijrcZudvcotJfLbwaJT93C\r\n" +
            "UPMA6cp1yofiA1NNy9yo7Q19bK710HKvfkKqvm45o9TxTCW4Y82rCIcG6UIvE5q2\r\n" +
            "LotYHeC9HC0Et7mNmBxKVmX9b4asNCBnCapU4w0ST4nlJ5nrxK3aNJ5+UPd8ytur\r\n" +
            "LWes5xAAfSC4GkRxfj+wMrq4v4o89+u8FOPvriDDpBvN2s0Zc7X0/eriIxmwpf8Y\r\n" +
            "lkWd/DykdDsmlkwnGasgV43BwIyFMJ3zm6hsd3cZINuTWWhxkOK+h9eBzkcYsdBL\r\n" +
            "KhNkIS3KSq5zKVl8oUgmzaCXfhyde3V64QBH7DUvkFUS2rWU3bI+jpIWU9kj0/jd\r\n" +
            "eDsDD8bL5Kx0V+auuCcrZ73Ml5iD1xkXGAwhVRF2DyunTzC5aWCAqnZb6DnP3tNC\r\n" +
            "ce88SMcKaU9S60/xuQ4Jm+9FSQ7yc68zYNujAUZ8VTulIc+vENNkn8gOECz0Ph4M\r\n" +
            "6+4Xwsm17WtXq752+NndAJQ1CIurXNBiIrSXzT+RjeH0CokqBVccmXvWKC2ByOwQ\r\n" +
            "dtByXXr8dtmPlT4VazMyHJGa1zJFIwKxv1OMvObzXtER1l+JAz4EGAEIAAkFAlay\r\n" +
            "Ws4CGy4BKQkQKuqQePKfpzrAXSAEGQEIAAYFAlayWs4ACgkQ31VVeRrb/gEKMQf/\r\n" +
            "VJv4+oalvUdVymNySnDDFHDNoOXviRsnLFM7qOGa2L87Jpt/4UiDt0m9FQZ6NF5X\r\n" +
            "f17CsZuKrtFaNydp7admfLTZylt+w3xKD0ibkbuiC444yeO3YJ0DXLHLE/Neqgp8\r\n" +
            "RxDP+ybUK3J2XiU3mAusjRJD/MCf3tCEwssluDZuMmsyiIoBUqhssUiHtHboXkhd\r\n" +
            "SFSqVo1hmQIIc0TZhMe7EHS4okw3TEEssJJAtJCtPoqhWGxv5ygVmATJB1Xzs7W9\r\n" +
            "nxmHeJQFJXiz7hHXrmqHgOFw6Qvgecn1W1NCncaxal4ctl8OWJABJR8+qtP3f9D0\r\n" +
            "eqtWjhqWUDo1TQi7PD9/QS0gEACJe/Dn5IxMMs+/uEsYc6IsewOTXdp0nsF70L/J\r\n" +
            "UjWPFVaADlPkbAgdDkViQmiDR8vzEOMqogLwESwSJZQCXAgwM2d5A4ynjceRQeMv\r\n" +
            "UcOowN5mtDDdXnBsT1qr+TM5W90+r9yPCah8354k1Gz2qJPqtqGgEtREu72UYQcJ\r\n" +
            "gvcOPEr1QQSExUFXgDuk9yc68XQ91nJCZa7mR0qYpsRbgdjYY5zUJ3UeOzMaABN5\r\n" +
            "N07jHphtMpN+7SH5fzvieqWhO+NQkpzL/gQ6wiRBBeOS0eN5LNa4r6awwnKiCylz\r\n" +
            "MMjoZSQ5i0hljafjYiq45w6eTtp5SMHWRSV7fif3K2QydMFfVSMQ0kQJ0kJiKr86\r\n" +
            "80XBRVQ0AZu1T+igD7m+XPnAPKv3g22ztarPzcXobeSTIZ6SbVocYnKPP7CP2Xx5\r\n" +
            "3CLuMI9ApK44096MMZRu8Hpv0yQx7fzyQBJV/kn7rgs3S17vpD+5ZvTxarkUZ3Dd\r\n" +
            "2sH/trXtC/8mFTTnpW7MJWCBJS9X8C/X6ZTXzIkKRIuk9pL8wR6QGHS+oJJQ/McM\r\n" +
            "kxqgPkPDAV81JqINzJspFN3JoAKfqyl0/o4rNCvYc4D2Y0+HVDsqIA0klH4V56au\r\n" +
            "CnPEaTC2IEBkUJ/nnb8PWBAMQuqGM2zgIGw6N1iIAm/nEcA/0ia78Xe/67Q/H8QJ\r\n" +
            "r1aL7Q==\r\n" +
            "=wOND\r\n" +
            "-----END PGP PRIVATE KEY BLOCK-----\r\n")
        print("Keys")
        print(keys)
        print(encrypted!)
        let decrypted = try! ObjectivePGP.decrypt(encrypted!.data(using: String.Encoding.utf8)!, using: keys, passphrase: "s3cr3t")
        print(decrypted)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func getRepo(_ sender: Any) {
        User.userName = userField.text!
        User.repoName = repoField.text!
        User.accessToken = accessTokenField.text!
        User.saveUser()
        performSegue(withIdentifier: "showRepo", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showRepo" {
//            let navigationController = segue.destination as! UINavigationController
//            let repoViewController = navigationController.childViewControllers[0] as! RepoViewController
//            repoViewController.items = self.items
//        }
    }

}

