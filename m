Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660750;
	b=CEVenauVZPwsBRiOM9PD0BIuU6TfaBDLPV6tHglqZgLlKnc+BHxLlMHfm23C+Jj3fNnH
	 9NUpITnKSu1YCPExJBWW4z2H1ZJf6ekoear3FddEzr5nGpL/1DA+KYgMGWl0+3kynzVDn
	 TWm0xFG6NqyEFT07KV1GkFASzgeD8gQQPoYRWxhJLnPthahXBz0HWa9EZ70zt6sP94ACf
	 feToTj6QOOa5GRsNMUDcB1BKJGvmX7SGTlE3TOl/819xl85H9KIUACxT3q3HV/ow/ULJc
	 a08prYYkwMraJzH5dg28IL1XGkrYYLcKpORmhoMdzCufk7db3uWSYNkudS/LPVpy1vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MlNq259fQdyBNl1lJWVsWFfj9prUCecygCmOZDgOoHQ=;
	b=o22Vi/ghnnJmTZgQfPv9uDE6KcX0TtT/Qsgg2d5RjojFN+NskCUyTaPDRkQAwSpVCkVZ
	 3QGC3LA2NuuwwGIpVfBSkql0/MRSq0PRDx6ZBlh+rp0WJgDTCSEcNo06kvaCPXaCedSjc
	 pCdUpgU1VlbaH6u7z9/HeqhhZAnuexbW3UQB3QA6s0EelWcHz8Gl4LCMCPPLiV3FXvJDP
	 aaG98+Vw/FNo1gxKh0c00yrTFz6cvZaPz0NhbxMiprxe5wAAWjk3jCOmGHwwY1yqHEQPQ
	 ORvvfH9aHWav3NOXc98muXZn0tsX1nbeivkXBOVzxudtKd1PJ+TUocqKvto3CMj4+Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mcM9HObN;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E64606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E64606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mcM9HObN
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so3206032b3a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660750; x=1796265550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlNq259fQdyBNl1lJWVsWFfj9prUCecygCmOZDgOoHQ=;
        b=mcM9HObNgNc5qPZr4l6HmJmTIemuMh2dNxGxEhSpq5o5jqdMFU9dEn0QLNVsVIMpE6
         MRF33XdfJ3xVdYkuSHAviaX8OfLMyZ/Cg8Ax2VlTcMIpQt8YYZ+8+XX/5TFwaFqFSw8q
         rF2L9EZUQNekJ1LOZf2CD4NPb8PMOyNpBN3KOk5tV7Y3EMSqqF/RgXWfcs5z1STIFlnA
         C0FujaeuLPM+BMbLe5h8QWH2cWNHc3Cqg2GBZvjnZiiTEai9SP59QNgFGamkFYmN49Rr
         IdUNepIhdwzdKUUu/QDWbVw8980ysOlnwsCqq37niDnhBdZtEBQwBKvbPrkuOgDvDDGa
         gh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660750; x=1796265550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlNq259fQdyBNl1lJWVsWFfj9prUCecygCmOZDgOoHQ=;
        b=SDUkdLBjUlaE0kseycXHYK6ERK9i36wfv8ZYtcQuYq/iwj+gvIJFmetm6tb76ncnbO
         cUlAyOvRNtWQUZ7++UTErx03+OGo5SX22NQosOkUD9/w6I2MuR42hHHdCE+6QS7XrlOT
         6OxV2LAZZU8N37ydfvK7D2UAiiyfVtC0GU32Ng1MnYm324ElxkrG3ncteBdcuKLJiidh
         koaUrXR1OIkkCtdgwbgp/6N60nusWZjvOXWtEzZlhC8puUGPfT/vEM//qfgY+2NAiU5u
         Di5AdxhX5BwJc6TUi/VACR4hhIB5PImDrQ4dAFH4wzHIMzzxgAgsoNZJsogJXk5ORXuS
         S77Q==
X-Gm-Message-State: APuU4Z+s8UC6QRXjcOvSl4SHAPwOgzVBc3CRL9nLlPkIXCcpTmmjrrRS
	2PywQUIRm4Qmfl6Moi5g03loI/KIj+tpCnwQMUt5YwDcVd8/tjg2kv4/uJ/VHw==
X-Gm-Gg: AZFdTZdRICtDKfByuVcCpBjYZxRaDnn+WD10g/lrHGV311WRW9hJvmI5+q0og8zzF8D
	5i31PojFhZRZIiDZpEUpgfAEaqpLYYkYPI3TZxUj/HzP/vXZrCg1SFRKwMemntFzlCiDa51Nlzo
	FJUofru6sUW8R5ZApePTbvjY03sk6Wt1UVM1bUz7mbr9X8/+K6xVt+AAZU1Gb2VI8HHykKpAp2+
	X2d/CKKtEYzTsNn0ZTzZldinGK2Wd2/ygluXXT/DVUJ6xXh3crZ/C8vU2XSpDS+bilxW7Lswmlo
	vdDrNClTecCVSk4Uc8CCeYXpw+dbwkYKZMthHrkv8sYGFY12pWi3W5NgGT9fIaCc7SzRtTuf761
	YjLdcXrforLGi8yXO8JarzhTlaF73xZJNBdCVL/CvioksNWYOn0Funvzmyaoujjl6G57AXEc16f
	FpY0xaLY6MztolAOlDTyJ830qglZOCZt2OAyg4ISh/CRLYrd7FD/t7n7IKCCVE1XMnbvbsxbYqn
	HCHPzhO80jXZLSdVnKGOo7JMDNY6/lqzkYlmEC9JpbJstKzFNFy8o/hwo6H6Ccw56XBRS3esoOe
	FACWBHRG5qwjgVR2VeLFp8xU1B9Ua6Nk0B/SW+G+ZUal7+ekeWrZYjv8IId1Hn9di43OvjSQKLH
	uqDjP8+vHBuWSpDKvr7KwQQyNqv01oNd1o/TnHsU/43rDqItgGKy8OIPkdYzNsMn7GFPnhDZWbj
	zQ1A==
X-Received: by 2002:a05:6a21:170f:b0:3e2:7643:3098 with SMTP id adf61e73a8af0-4014c34e75amr21652736637.67.1795660749742;
        Wed, 25 Nov 2026 18:39:09 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:09 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 7/7] ARM: dts: helios4: describe LED color and function
Date: Wed, 25 Nov 2026 18:38:56 -0800
Message-ID: <20261126023856.767961-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add color and function properties to all seven LEDs, matching the
schematic: green status LED (LED1, MPP24), red fault LED (LED2, MPP25),
four green SATA activity LEDs (LED3-LED6) and a green USB LED (LED7).

The deprecated label properties are kept on purpose. They take
precedence over color/function when the LED class device is named, so
the existing sysfs names (helios4:red:fault and friends), which board
support scripts rely on, stay unchanged.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/marvell/armada-388-helios4.dts   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index b62730b949a4..46ff69c3426b 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -10,6 +10,7 @@
 /dts-v1/;
 #include "armada-388.dtsi"
 #include "armada-38x-solidrun-microsom.dtsi"
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Helios4";
@@ -75,6 +76,8 @@ system-leds {
 
 		status-led {
 			label = "helios4:green:status";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio0 24 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 			default-state = "on";
@@ -82,6 +85,8 @@ status-led {
 
 		fault-led {
 			label = "helios4:red:fault";
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_FAULT;
 			gpios = <&gpio0 25 GPIO_ACTIVE_LOW>;
 			default-state = "keep";
 		};
@@ -94,30 +99,44 @@ io-leds {
 
 		sata1-led {
 			label = "helios4:green:ata1";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK;
+			function-enumerator = <1>;
 			gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata1";
 			default-state = "off";
 		};
 		sata2-led {
 			label = "helios4:green:ata2";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK;
+			function-enumerator = <2>;
 			gpios = <&gpio1 18 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata2";
 			default-state = "off";
 		};
 		sata3-led {
 			label = "helios4:green:ata3";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK;
+			function-enumerator = <3>;
 			gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata3";
 			default-state = "off";
 		};
 		sata4-led {
 			label = "helios4:green:ata4";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK;
+			function-enumerator = <4>;
 			gpios = <&gpio1 21 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata4";
 			default-state = "off";
 		};
 		usb-led {
 			label = "helios4:green:usb";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_USB;
 			gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "usb-host";
 			default-state = "off";
-- 
2.56.1

