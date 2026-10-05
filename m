Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FA12E266C
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226132; cv=none; b=khRQlJNnLGGg7G1nDNBPbdU5EdpEHe0u7aHob9msftDSNJX3n5QPz0UZ9Q3/vu5eBgtiEP2zR5pAime5C56x4EBQShxRGj/dvBHGcVrFkreiaMIQKUkQdlKA0eksAvpROQBtNeeMNqOSJxMpIr/mmMaGFPtp24hf0oHVzkc/UFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226132; c=relaxed/simple;
	bh=SiHM1PRYsvygtLybyGR+m5aXZqnmKZZpS31AOqR5oqA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ttvFw51Q88gz0ImGx+4qHBd1766zRYKrxUjYC2Dg/fSE9EjZbxVsH4EudJRY2cQUrPWPqnm/2ZXJORMJH/bXHKAN91V2FwOU+iULOlM0pUkIoaQEQzK7jKcMjy9LSE3HbzOa/8eL7zUUPLgQVmsXsg30L4jJwqItgSIn7K5LLt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dC9FfOWc; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dC9FfOWc"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-3511e727e66so880260eec.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226131; x=1791830931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOgbWILBmA1EDd62aOZ6WfyN7vNlPpZv9jEP/DVTRhA=;
        b=dC9FfOWcRlH01HnayDHIxqx4fAKNJ2sHClul2Wv7yiJV9RauObKew5LEknarxcixo8
         xTK5PTcTsYNNFmk0tee336Cu2Z+TY7BT99j4m572IBXFYuVAaiCQ8Izu7Wav5ZUNVygv
         pDAXyyAGaoaxjVXI6NeczKCf7TLYQhmbNVcxaNO5bYJcTD73nv5kFF6MCAKBoYvuHIdG
         +FsXMpjcBMwaCIfLLb+J2M2A3xL04TKfT3YWaF6kQcpJGublOccWw3F5CzbfQcutf69p
         H2u8/tt3KP9Tn4ng5tsM0379Hz23DJEEZY1e3c4U82iFJVXfJQ5sycvPLTiHdzsGl7xo
         JALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226131; x=1791830931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOgbWILBmA1EDd62aOZ6WfyN7vNlPpZv9jEP/DVTRhA=;
        b=doiAUbyWdwrAt4n2hZEzwhm9BJRSUCbHSPE9uBzDYNT06ovNmCH8EK5QbV1Ri/5eRm
         mken+pfNzhu3VYtV/j59KvBf0BcOq6Tw/4KRyMiTxMCOLviy68DVOYt0tHoSvjf6YHd2
         IA4uJPiUtni6O9A1fk905murM/K9bnDHdziJAYsTru9TidpM56QhmOWEDEQO68p4YNGx
         3GLAQ26d758btuloP+VrxG1THe2j4K64x/5TABtKl9kYvC/yPNqekyGSQspUqPbyfCPF
         VHzZdk16A7xfIEftHazDsZt7lbJHh0aiYpUHZry4lGHVly0Bojq+fxHZJfVOzL/53X03
         PcuA==
X-Forwarded-Encrypted: i=1; AKwUvBxgalPRNeqdp64DCI4XLCyc3eQ1RUUP3+FQfJ6BIO03OHKjshR4WJPA0b/qlyZ+ZFxhzfS/9r854n5C@vger.kernel.org
X-Gm-Message-State: AFuF++nQWQC3g53NkMPAMXLAmnxOpJjP7bSlyh55p64GaZskoxDDfDQZ
	XpRiwDjf0qe/D1fM6WO81G4f6suuJlD6yp50W/gSdW31LM01geHHfLAidVWiHFzozmI=
X-Gm-Gg: AYBFou34yUYKGZ+beu4R85kyYAJN3SXwmcgARMk7YfAnvwjTy1jveZSrcuB2s5MQ8nq
	H3vfix0AEWgYUeIpVO7uE0pCaTtv3YFxuFJijySquchF6VpIxq89GutgDV4AqFnVuZLn4CzKBaV
	06enN5v6qrmCtLFFXpy4iYYEJxvX09Yi8q24yMtxLQc0iBxzo9TzAtjFYv0ks5rx9HuIZ7h5P/r
	AqplsD0kRRSM3WKCYWcc0Sr4se3mfX00JtBeL+URAO+Ie4Fc7GrGQRqjPrZd9nMHCRCUiyYbrcj
	bjxxUgf33ZGDinpUFx7kO4kp9O3Vkls5MBEfbRcoNhsV6nX19jIOq5p3dc7af2kHGY3bt7kRgw6
	EdPOQG/6kgNwnhjANB+WJjNFpbKAKoECmfvtq5rRPDBwouMo40XA5wnwHL6cXsSja2lde+6vMkM
	VmgWIOZCJkyw5HuFiLP3OEBiomDVRYioFhHqROpr8iFiMTFjEeNkvlJW0WUkYltupwB1k40IX4G
	ODig/NGwIA5T2+c0/MyREDBOXawdng=
X-Received: by 2002:a05:7301:6184:10b0:33c:e72:5b3b with SMTP id 5a478bee46e88-34f2185899bmr14499131eec.25.1791226130364;
        Mon, 05 Oct 2026 11:48:50 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:bc23:13ce:62d6:5ad0:c521])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a297b0sm216369eec.11.2026.10.05.11.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:48:49 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 2/2] ARM: dts: kirkwood: Rename netxbig LED child nodes to led-*
Date: Tue,  6 Oct 2026 00:17:46 +0530
Message-Id: <20261005184746.252723-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the LED child nodes in kirkwood-netxbig.dtsi and
kirkwood-net5big.dts from descriptive names (e.g. blue-power, red-sata0)
to generic led-* names to match the new YAML binding schema.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 arch/arm/boot/dts/marvell/kirkwood-net5big.dts  | 14 +++++++-------
 arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
index 2497ad26b5b6..49deeb40f4e2 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
@@ -85,8 +85,8 @@ g762_clk: g762-oscillator {
 		};
 	};
 
-	netxbig-leds {
-		blue-sata2 {
+	leds {
+		led-0 {
 			label = "netxbig:blue:sata2";
 			mode-addr = <5>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -96,7 +96,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata2 {
+		led-1 {
 			label = "netxbig:red:sata2";
 			mode-addr = <5>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -105,7 +105,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata3 {
+		led-2 {
 			label = "netxbig:blue:sata3";
 			mode-addr = <6>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -115,7 +115,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata3 {
+		led-3 {
 			label = "netxbig:red:sata3";
 			mode-addr = <6>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -124,7 +124,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata4 {
+		led-4 {
 			label = "netxbig:blue:sata4";
 			mode-addr = <7>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -134,7 +134,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata4 {
+		led-5 {
 			label = "netxbig:red:sata4";
 			mode-addr = <7>;
 			mode-val = <NETXBIG_LED_OFF 0
diff --git a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi b/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
index d4edf2727388..23e8e8b4597d 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
@@ -115,7 +115,7 @@ &gpio1 13 GPIO_ACTIVE_HIGH
 		enable-gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
 	};
 
-	netxbig-leds {
+	leds {
 		compatible = "lacie,netxbig-leds";
 
 		gpio-ext = <&netxbig_gpio_ext>;
@@ -123,7 +123,7 @@ netxbig-leds {
 		timers = <NETXBIG_LED_TIMER1 500 500
 			  NETXBIG_LED_TIMER2 500 1000>;
 
-		blue-power {
+		led-0 {
 			label = "netxbig:blue:power";
 			mode-addr = <0>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -133,7 +133,7 @@ NETXBIG_LED_TIMER1 3
 			bright-addr = <1>;
 			max-brightness = <7>;
 		};
-		red-power {
+		led-1 {
 			label = "netxbig:red:power";
 			mode-addr = <0>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -142,7 +142,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <1>;
 			max-brightness = <7>;
 		};
-		blue-sata0 {
+		led-2 {
 			label = "netxbig:blue:sata0";
 			mode-addr = <3>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -152,7 +152,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata0 {
+		led-3 {
 			label = "netxbig:red:sata0";
 			mode-addr = <3>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -161,7 +161,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata1 {
+		led-4 {
 			label = "netxbig:blue:sata1";
 			mode-addr = <4>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -171,7 +171,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata1 {
+		led-5 {
 			label = "netxbig:red:sata1";
 			mode-addr = <4>;
 			mode-val = <NETXBIG_LED_OFF 0
-- 
2.34.1

