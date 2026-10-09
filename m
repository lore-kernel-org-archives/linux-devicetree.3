Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF502F7EF2
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 00:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507375; cv=none; b=K7l2Dma6nN0hgnwkglJWbfEVDyNSAOD6EUKizYfAPGFOXv9T9f6FX9k/1ZfmZQZ4kxY2wBgtEm+QFNmYVifK5ZStTCzcxFPiTPCuDKXQk9HoT44m8SZGnHf5TU/VqT9XU6vGghpdqpn4+yXXMEX4uPRLDEhSvGvgIvoXUxdDAes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507375; c=relaxed/simple;
	bh=3dS5bZTVOT7DSHDRVN8MKXXtvwU8qyib2hA3utIdjME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lpxvU4iEf5HBdZ2V2fLnlLRSGKx4zm2TZZtKqq3+eybulSNnqXJA8I3NHVmDb2c/wc+97i9s+l66ZanXVrtixIPqyprZMp/SZMb5RoO5LUFlyh99TP1Tdkl8PCCENudCGV4fV29Qdq0AwgiBl2LZIuPdC9RNqUq84o221kXjlHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Mppaamx1; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Mppaamx1"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so2729173eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 17:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507368; x=1792112168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8PlKZWA7ABkYR4Ifs3ujznF9xvsTKqdGNGAzO86F2w=;
        b=Mppaamx1MF1+rCGnnt0y03i85TmVgqZew6U1RC7kwN4yqalSPlVzHVk4BoTqZ6HLg8
         M4oaYapYQNAglozi37t65tZtUUiLmP39Jc2e3ho99KxVw9TabzOK8LClF8Oow9Cy14nr
         tWUEPSiOPa6UaDQnMz9+Jm2Qhk38+h/2hAIWFDv/9sYgxq0uwOMLk2QQ8RUjBD1rC/8p
         xbVsTp6fLwIHF2s7Rdg2FRyFfVSt1ieK78z0BPid0qcIaPWlQwwbvAC33JCyz+30O8RP
         wQsy8PWEbD+2x/HS20squP0EMEXzzlOsALUhrgMsOyZXUwC5QucSg/Rv7QecWL/gGIJL
         zhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507368; x=1792112168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8PlKZWA7ABkYR4Ifs3ujznF9xvsTKqdGNGAzO86F2w=;
        b=l504vXoi2HeKEm1Y6LTnec5ncEzxRqNgDV8mt3M6wYjuosh8D5NO14BSfBT4FlXxM3
         ssrOQLC/36zWl7PsAzlidwq3yRHrP5O7utBm56eHumt9jo2j0oVNTJQHmnU82Dq/KM4B
         f4h9ImPgO3N6CU8jA/vZrdSgcpSpXt1FsJa1S1oTQybZqPt0ZpfkXGQ5aVPBx5AjkL44
         WnMdCeHJvPQJsptNP6w7GzzxnIKaTNMpUZxW4nSrnKVtVPRp2d5mgr5w0jXAkGtq3K03
         KyJXFh/1qIqeZVQYIIffIsyL+ojCgtT4JPmO6lPwvwJUbjBE6pP7h43oVNXXx9EUJWfE
         dwxg==
X-Gm-Message-State: AFq9FYL2J5k6ODGsH9v6jg5JoIU17YgohS0m70C+Orn8I34ztCVvk8ye
	oCG0ZU/zqb9fmm99/rMjcDNEyGMZigzITlk8Jfa2eVmq8n6H/MZA8DkiFCABIDwwyUlRXq/J295
	qUjGFMKA=
X-Gm-Gg: AYBFou1M39BYOrtDVbN6Xmxn5dH5LAAa0Resm0dzX+gswJrK/zKjDeSJaV3Chuvk8qI
	cSMJzlj0ONbmBV2MXhhs9BdXF82HdX0VJfr5I6iY+dbVzc5ZdsXyfQRU06pFPvMrZ7oJcjJMn8U
	F+lU3LjGuDlDQfCyPzHZEntgHH1tfItL+9HVUy1fBDgWUoh/V60pSJB3QkobnajPGxKXJpa05Gh
	HRmdAVaGzSOEbxvop5JomDH5qAQ6EiVClJOQEWrAMdBlNfzhcYFG+veGTyVGRNASGmOFfEROsvZ
	Ni459RkZg4gpaiOKr0KlfFbYR179icXFbdRMYQIPlNIFSP6xzJ22gOVVz98FBMa8IFC7PUVH+V9
	OqcRPjV9l+ZsCZQCJOilSiE0zI+SzClg5IioTnrE6NiNbZ7LCXn049IcPy2+afXM3Lpagxp/NzQ
	o753nixETMeBMMD4XyYsHSYiPwlm94Hwl7CIYDaQEbUMNo1XzFbNd6VvnKlBw0o5AzHD8t3sHVm
	g==
X-Received: by 2002:a05:7300:b905:b0:353:7e33:665a with SMTP id 5a478bee46e88-3537e3368b8mr878553eec.37.1791507368107;
        Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:07 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 08 Oct 2026 17:56:03 -0700
Subject: [PATCH 2/3] dt-bindings: trivial-devices: Add TDK FS1412
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-2-0ae7e5ee4e41@nexthop.ai>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=987;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=3dS5bZTVOT7DSHDRVN8MKXXtvwU8qyib2hA3utIdjME=;
 b=vzUnvSUv3IoTSrnibtT+Ynn8TjePYTpUjU6Onw2MLiS5CNXbQqXQmR8VDQfcG+iwtB0heUIfO
 3b3ce8E/f3qD0eboKIKiUVS81szS0bkKWWglyR5jP7cfLrdVc5JSccw
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 is a 12A uPOL regulator with a PMBus interface. It needs
only a reg property, so document it as a trivial device.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..d2dfde1344e5 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -469,6 +469,8 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1412 12A uPOL regulator with PMBus
+          - tdk,fs1412
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.54.0

