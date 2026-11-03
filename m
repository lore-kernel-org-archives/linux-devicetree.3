Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691776;
	b=UcXl5av38hHv6z3IZEONH9e8hgv76DuRVO4y59iBtOpGffA55Xcu8CbNJZoUx8Rxc21w
	 +eFw4lvxCBmv9u/dzcBJLwaE5Zkv6UNBUgsbmLot1iinkax5YVgLNVvqLBCq+cYLWqWB/
	 1BTuX2sz+KUovj6Cvjnrkj+bK8Ai3ytvT3KT3Ivl2y80ucnQ8M9cOXg8X+RAxcezqDScN
	 lqiAQbU8cvMjC26JwuvpFjX1zBXLzCTUKEnXQ+jSb+SkYAJlh+EIHQippnGm16tFTDz1y
	 1luXJjIekFFXMee5Z5uhh9pEhxkT8rulQpx1f7B05tK5X3QvNRlNYls5dqF9vixim2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=;
	b=2KfJvj0GtQpowA+TZzxA6jlJUSLnXqC800aWPCKwTOnDqXTmehKLlVNshzaVSI5tVYaa
	 wzmeFPtpS5wHpgQjfSSMFp+squKr76phk+lFtNV3kjTPlAIvbTfULSUuv2gOFPT1XLAon
	 v5jsHQd89jS80S3Bfgj68yj/ZTl0GPfmhr545bxCkHiQHvSka3QspP+DHg0AqBILGSAAc
	 YzYNmLOutV1moT2uxM4TKDB+mtU2LmjI3q9q9uXTD3vG3RRHea7T7IK25gYDd4GoJEQGC
	 5j7ugKxgTHM9OZazCc+JOehV03h0Ev3s/EyNv1Zs127ly3OV0sVx8WwFOIQnEn7E9Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gw8PZgoq;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17232606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17232606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gw8PZgoq
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so702991a12.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691775; x=1794296575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=;
        b=Gw8PZgoqJD4QiK0LqF8tOHuiysqhwOePkJ4fMkpXfCjBv90RuxABqVctUnujZz6BJd
         QRdvGVfjqrAtxFrVitfHOPFxHJ+YiF7pQWBBOZ3HulYkuTcd7V3V6/SGnltluwSba5DR
         cH4ojHGoFBB+qJhNS0ZgEwFrVEWLU0trl04SgxULgx6ChIlj+5jTZ8dWGnZuI5YIM3sQ
         litUqNWDUErgv2PBp0A+qqSwIju/yfdxY2Dh5nKv9DkoE/RkiQY1vUdtyU7YDoS3sq0r
         4lIhSoei09vevN1oNwx9QJvHTnNJozyN79TRMy1qSWITU1vGc6rlwMGdmfMBsGQ8e6j8
         Drag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691775; x=1794296575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=;
        b=L0/ZD/9z20NG34OvZXnDNKYNgY5iCRYOjA0/ttYTbECo/wlnsRFSkBQwxsuDo43cmu
         biYUmkjH8bx1Dslp0OhuaCtUpWj9GV6LmuU+VWybKDysB9TMOmkfU/N0JKDhQX5fTo8x
         3xJEXvSBfdXRKuXiFbBvxcyZuVdKYPsZxRfh9s+ZdYAn243mfPDh8lrQG2QNVJPGYhWp
         J4T6f9LYJ1hXi0kO/jqzi2GHO6Fbh+iuTI3KbY9hXIsbwgexLMaB7sMTU2yOdJB3EeXT
         d0eCkz1mGShl5FOHpF/v6Q5vWdqBfi3QMiD9aJ9+7hYhGxTY2MoIpEOS7K4iKuUNz2D5
         L6Ng==
X-Forwarded-Encrypted: i=1; AKwUvBzHyCGu2/93DJM87jmC4UYTE5D6t6QreTop4ecsVLvXyYZP5+ogUD4BMJe04dt6eqLwkVa92B45eT6l@vger.kernel.org
X-Gm-Message-State: APuU4Z9SkDcbAkTMunYQEwO51nNwOHJ15i/SpNZgF8wkeH9I03rLTdBK
	OMJX3ukyw+4+oaqHsg79cZC/X3poKmOGjoYZnC1ANvubuTfzHzNQE8t0rmbavQ==
X-Gm-Gg: AYBFou06daUO+xRtGnLL4oaRsy5E2vrNP+YDQJXO05aZyz54GwB+PpHEwoYd6yG95fb
	gSsljZVjUCjvv3Ppte1FDAaaBMMODlLYTDVo3OoFbFD0sGu/jz5X6SaCjmeUKvy9MYfUqgY0QaM
	yPYFALcctk3u7DnN22hii696pFJe3dFk8/yRDGQY/Lg6pPohOXTzDZ0tAGGC7s+BUIrpMfJ71HO
	91S+5ikqpG0+BQKfV+sMVh63ebs7xAVeVtWlq2hNCxHuFzidlWFlAYqZZplAyw1E0JKuTBjAWii
	fYBvpPRLhxoM1GP/xs8HYFcK3hS2cKFS01uvM9AQCSP5Ez/a+/YsYDZNBT/vIfMqUczJUajldEQ
	kkQTzVRUpzSU3CTwGeRizttuJmz3YfPV3XGeGSeOXw/oWR8Fn0CO1fFysVFzejIZW93fYVeaRRH
	TQ8mPK43CKJPJrdEUEfYxkvoInEx3f19Wa32de09tuQ0DvJ11/tOSNbS11z70qVtIzslevBH3ZD
	0t1t2LmY0UzcP+p17D3o8WAQ1wrHMxTo8o3G0LAEOuo4diIjyXSi+Lw3wXz0JWhuaLiIG3TZIoZ
	zhjs6Au/q2tOutjn0wjwR+D4JMn4vZ77iFqmLaR9rSFL+WuBbcij34VjZ/AkFx6QVeFxP5Fex9g
	AwOcNPeyHXGa7MbNAIFC68y0NmkAdkiRwWbzJTPSZN1w84WDGswtYCo7Rs0SJIYVW3d0/UdGfkf
	TaEKE=
X-Received: by 2002:a17:90b:48c6:b0:3ac:9717:afd1 with SMTP id 98e67ed59e1d1-3ae897e07b5mr10233118a91.63.1793691775441;
        Mon, 02 Nov 2026 23:42:55 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:07 +1000
Subject: [PATCH v4 19/22] arm64: dts: apple: t600x-j31x: Add
 speaker/headset jack nodes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-19-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6072;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=tVHb04ag/03f/ScM4f2Yc2EXk5oXeWx+RtEiWeg1z4A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y+Uvl+YaXR70WTZzRaW6iUV04JTViSs3a/08tnvn
 A+7twW86JjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1nx4jw68f0oJpvl+nGCW1Leae+nJ7j/aOBx5r53e83PGJJVpS+RnDP5ujN2b
 37Hh4UPJNm1TuI4GLOdcmrdrYcGzClL131U62WPACAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Pro/Max MacBooks integrate Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6000-j314s.dts      |   5 +
 arch/arm64/boot/dts/apple/t6000-j316s.dts      |   5 +
 arch/arm64/boot/dts/apple/t6001-j314c.dts      |   5 +
 arch/arm64/boot/dts/apple/t6001-j316c.dts      |   5 +
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 131 +++++++++++++++++++++++++
 5 files changed, 151 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6000-j314s.dts b/arch/arm64/boot/dts/apple/t6000-j314s.dts
index 1430b91ff1b1..63ae47ea46e6 100644
--- a/arch/arm64/boot/dts/apple/t6000-j314s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j314s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6000-j316s.dts b/arch/arm64/boot/dts/apple/t6000-j316s.dts
index da0cbe7d9673..c8428fbf9244 100644
--- a/arch/arm64/boot/dts/apple/t6000-j316s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j316s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j314c.dts b/arch/arm64/boot/dts/apple/t6001-j314c.dts
index c37097dcfdb3..05066cbde96b 100644
--- a/arch/arm64/boot/dts/apple/t6001-j314c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j314c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j316c.dts b/arch/arm64/boot/dts/apple/t6001-j316c.dts
index 3bc6e0c3294c..ee0339b61713 100644
--- a/arch/arm64/boot/dts/apple/t6001-j316c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j316c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index caded1636f3d..5237cb39491f 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -169,6 +169,94 @@ hpm5: usb-pd@3a {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_woof2: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+
+	speaker_left_tweet: codec@3a {
+		compatible = "ti,sn012776";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_woof2: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
+	};
+
+	speaker_right_tweet: codec@3d {
+		compatible = "ti,sn012776";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+};
+
 &nco_clkref {
 	clock-frequency = <1068000000>;
 };
@@ -366,6 +454,49 @@ &atcphy3 {
 	status = "disabled";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+
+		speaker-dai-link {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-3 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+			dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof1>,
+					    <&speaker_left_tweet>,
+					    <&speaker_left_woof2>,
+					    <&speaker_right_woof1>,
+					    <&speaker_right_tweet>,
+					    <&speaker_right_woof2>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "spi1-nvram.dtsi"
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan-dual.dtsi"

-- 
2.56.0

