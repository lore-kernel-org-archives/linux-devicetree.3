Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA417275870
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444462; cv=none; b=aPz1oQEjqvXz5vaS5hYp+aN2e1cdef4ZBlLG/u4OL0mEcp86C+FuEVg2zsk6/6tF1f3eQm5wlLib53GR/1pSZFI4NH20Z9qbAMbXJb+9AYx9ppTiQByMUEhBJUs8Q3SVK5+wMUzBvhR+XusAlXen0WDiA+2hD+fy77XpTd6GIAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444462; c=relaxed/simple;
	bh=wtlP5mDXTH5K/7QxsvRUAfm1OYc62utepzzfVM0/B50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OMjk+Se/Iu54ZF65ZiZNqZATNP5HzFyOEfWapc9Bku/F6AD39f9Uw72eRlCj/qYyyqMKdB+EpI2pVxgVPW6Am/XVoBuNPd1kt8vG8HhwFv+uiOvTUO/A9Tr6DjTTdr/IzpBqIXebiVFxI9YPa9+fhX9tMMhElziNFDAVl1dO+dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVtIpJAJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVtIpJAJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2baef9f5ecdso57590495ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444460; x=1780049260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tej9iGmEeYL0OIyPsT8v8gtxkPYs+lwa2cRb16j1/fA=;
        b=HVtIpJAJP7JuJhFLOpWzztZBCOGkxMQ/hBZpvQhFOpnPnPK1z57kV6lASb5Np8Vkad
         OLCt0j1/GzkYCkP9lIfYoI+Mnad2Gf7Dl1J14YC4bud6QI3TJNjJZFH/T+6rvmSTFwyG
         4qTQscsG0eTB7l9i8gw8c3xDSncoII1OL93x46pLueb3Z510xwOPTTTlX+dkPQxg25kY
         puSiKKRyCyAUPH1CZqGcCTlRJl7LRMN6VYpS9SmdisLBBYMZHepDovAPUN2cd+gDAQV1
         kOsIuUFZDbPqyLSECesLK8fC2rjSDLB7lFAod7HDhsBLFfo/awt8Sw9/0yjmjZvJ+61q
         HYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444460; x=1780049260;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tej9iGmEeYL0OIyPsT8v8gtxkPYs+lwa2cRb16j1/fA=;
        b=VRh9f0zHaHM6K0WDcTMNyKVFWJyJDcjLE6RYiocRHLkiw/RMoqrcve3dfOugQQ55Qp
         RKjYxKkxUznvXkRym9fURQMTnSOvbygBRt+k+/PFZR7LZpJbdP48uee/1/b3J8JaHqr0
         NtVOQpYFs0jRjsPY47uftRQYm3xMCm2xqbunjtsWwesFDw2WAWjYliY5dnVgGXtdwIun
         5w2+pn6Uue0/bEhslxWgfo9XEO6f9dvGYVf26UNScVnyv+FDwZiLuvV6KINOl8mWRw4p
         450fgTnb8aWuz2trh9sY6AKTM9zaJYMBmRSPTgMOLeLKagUy0TuMQMrhKTG8aqtoDesV
         MBcg==
X-Gm-Message-State: AOJu0YyEZ0jsjBLzZnNLFoSGSzC194LmgNC2F6dnX4/NVXE8E60mjwzZ
	E0174G3L5zq5nj1Z+UiC77fkPNkSSaDzotSduWjhz6Kjp+R/vGC1McxS
X-Gm-Gg: Acq92OHCo7VN8O7rOklqP2jvnG0aWKHfXiW/wzmwIzYJArwWZuMgO4skb+x7FqC2CSk
	0OXpKxwLNTrPjJqV4mpcYPL5iDHr++5kfCckCKG/3fK46t+9N9sBwLZY8QxFjdYO7asLvgMqnR6
	dtwFjZXNKhQBbz0gSpcYFL050yyolMKzXpu91IEBcANGokKXZ3h5LmLPtGJGEIzKQdFL/9NVbQD
	lAqmxIi35BVz4oZ+WhOLZ805+mGsRg7RuvYMriwIspadjPtwU6c/zGZH8PBuEFpR87NzNIRJQDp
	w0JzgYzjLx6xjDBRVgYwnPm2djcVRgYEGBfI7XXk68EjhkfTQHoCN9cBjdLXxjWHwCVXCbiqv0C
	wSRqW3Kbm4snZMvS1XIhDLc/3iXbkX+pI6lkdIolRLrEL6q3uhyVu/gCH7O46Vei15xhBsp3+qN
	pnQ1qzb6JHS9K8PZCvS2pu7jQ1tMQA2JFC1qB0rkN9yYfJ9jFUG6ITSJFAcv7JWdxRYn8=
X-Received: by 2002:a17:902:da83:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2beb06a5ebdmr30510285ad.18.1779444460119;
        Fri, 22 May 2026 03:07:40 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ca7fcsm12578965ad.27.2026.05.22.03.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:07:39 -0700 (PDT)
From: Mike Hsieh <mike.quanta.115@gmail.com>
Date: Fri, 22 May 2026 18:07:59 +0800
Subject: [PATCH] ARM: dts: aspeed: clemente: Remove IOB NIC TMP421 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-clemente-dts-remove-iob-nic-tmp421-v1-1-ee2509a71502@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP4qEGoC/x2NwQqDMBAFf0X23AWzWKv9leJBk9e60CSSBBHEf
 2/ocWCYOSkjKTI9m5MSds0aQwVza8iuc/iA1VUmaaVv7yJsv/AIBexK5gQf96rEhYNaLn7rxPA
 wiphlHnvnHlRDW8Jbj//kNV3XDx3uQYl0AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Mike Hsieh <mike_hsieh@quantatw.com>, 
 Mike Hsieh <mike.quanta.115@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444505; l=2434;
 i=mike.quanta.115@gmail.com; s=20260522; h=from:subject:message-id;
 bh=wtlP5mDXTH5K/7QxsvRUAfm1OYc62utepzzfVM0/B50=;
 b=KLgj3/Kt/F4ZL7TX8xSgNpcSgNFF5ozk+usyLONCgjiPTj8WwcI44UHldShUeFupva5JOA4mc
 aO2epW3mC0lBf/O70Ti3tjy+UUJ7hC8IXmOe9+Kts9QgvR2Hyd6G8Bl
X-Developer-Key: i=mike.quanta.115@gmail.com; a=ed25519;
 pk=DRIErV0xX0KMBlR/irAsbuN4L3egitHbC8FHruUH4HE=

Remove the TMP421 sensor entry from the DTS, as it is no longer the
primary telemetry source.

Accessing the CX8 NIC via I2C while it is powered off causes voltage
leakage on the bus, leading to EEPROM corruption on shared I2C devices.
Removing this node prevents the BMC from initiating traffic to the NIC
during initialization, protecting the integrity of the shared bus.

Signed-off-by: Mike Hsieh <mike.quanta.115@gmail.com>
---
Remove the TMP421 sensor entry from the DTS, as it is no longer the
primary telemetry source.

Accessing the CX8 NIC via I2C while it is powered off causes voltage
leakage on the bus, leading to EEPROM corruption on shared I2C devices.
Removing this node prevents the BMC from initiating traffic to the NIC
during initialization, protecting the integrity of the shared bus.
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 2aff21442f11..820d39a92974 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -443,11 +443,6 @@ i2c0mux2ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
-			// IOB0 NIC0 TEMP
-			temperature-sensor@1f {
-				compatible = "ti,tmp421";
-				reg = <0x1f>;
-			};
 		};
 
 		i2c0mux2ch1: i2c@1 {
@@ -466,11 +461,6 @@ i2c0mux2ch3: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
-			// IOB0 NIC1 TEMP
-			temperature-sensor@1f {
-				compatible = "ti,tmp421";
-				reg = <0x1f>;
-			};
 		};
 	};
 
@@ -637,11 +627,6 @@ i2c0mux5ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
-			// IOB1 NIC0 TEMP
-			temperature-sensor@1f {
-				compatible = "ti,tmp421";
-				reg = <0x1f>;
-			};
 		};
 
 		i2c0mux5ch1: i2c@1 {
@@ -666,11 +651,6 @@ i2c0mux5ch3: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
-			// IOB1 NIC1 TEMP
-			temperature-sensor@1f {
-				compatible = "ti,tmp421";
-				reg = <0x1f>;
-			};
 		};
 	};
 };

---
base-commit: 6779b50faa562e6cca1aa6a4649a4d764c6c7e28
change-id: 20260522-clemente-dts-remove-iob-nic-tmp421-89221ba96dd7

Best regards,
-- 
Mike Hsieh <mike.quanta.115@gmail.com>

