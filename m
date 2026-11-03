Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691759;
	b=SoJ21eBziNe6pOLVzxB9BesT76VBWI93RKjikUjelZDKAt+UZN0kVTZGPvgJN1Wi75yU
	 i45iXiyZG3IJpaRDSVfIz7YfKUclH1kUt3zi93Xy3cRA9R4kNvZvN4ZoopYgNk6EERVOS
	 R2bF6S8BMmcu3iaTIpadqRt5LPipT3wTSap08IZg0pO7KpojFArCRtcASb0BY+EWMWVQg
	 hqU0FESiT4GrU3zDghtiikB4puEsN1RI2e83hE8vjkB6dHN5IKqMZ8fENWkOStuTdRHMz
	 yKRNlNOqQv5xNhIIpHCrl/uViw8bKoIbCyTwVuNujQpq3FovQOJtzGFN68zT2wulWpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
	b=RAMkO+dKane69k9ITGK1fPcQq/dipmrI4Ea/VlRxGcMBe2c0BEhaEISibRRJXla6XVgO
	 kK+0+CBj34FBi/AXV6Fr80RlGyPuBgR1L7xrvCImsYzT29LIqvkdjhBLspslL4jPcyEB6
	 4f4NfsIs+J51StOspbpZDV6OuWvYNB7j/qSGGdUxI1uUpIC+aeftxIYLTgZvFJina+6tI
	 4pvIwL58sW0qrUfUZV/2hTx7VBEhHaU/QhR+cw6/oV7VAzg+xpwB5tczXd8oG4/u2B4K0
	 nXSoZsVAb+dte7Q2/lNseWVFARhv69KGsJZDoHim3W4ClESdhvncOUiDLjSjXUDj0mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iuunEE49;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF739606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF739606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iuunEE49
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so1754725a91.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691758; x=1794296558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=iuunEE49RrUD7Hpbjb2aUZpMRRiSomZtYuMEEtERJOZbiR8kxx+YH+vYOgQ+YsCWbt
         RsF5/PphdWanvJKIjgCMNn4vM9DbkCJKhZtZ9hAP2PKwsN6RQB3LyzjOTJN9Uz12zspn
         wQKnLLHKrUnZI9+WVFKGNdXV68ubmPNmgnrIpClrPBHHe71Mc3eYtnTRYAFI+SBMVsVE
         eoCi+ADQcSzmgeidNnoJee61DeNBSqPhDcI+waf46+C9jdmMY+2y/q7HHlrHbOtDYKgp
         fOW9O5KtKB3aOtgcG9FG0vIWslBcbeyGNqxA7aaXqTVouumvhsScGaKv+vE0rzIVoqeA
         8/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691758; x=1794296558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=ZfGnPLj2r7lUjMFp/nM3o32lV8npbKbwEqBBX7w+Td2fQQQhB2Z+P/GC0ZHfAYSHMw
         BtzGfa3bxY998+zsVRsoE85mJAunkFuF7jNywnMK7OAbsZoRcJa72v1MqplUWsMTlIp2
         g0/GF15xGA+iuwLa4Iq2jjwVhTbNcKpRibEzO9sRb4Lijvrn6b4zfQJjlPTxiz9zF68r
         HMnbLgORC/MdZ64KBbmdVw6ZMBqngto3AKLTfQOoGkjn9pEwkNosRCe0jAIXvkLstV13
         wYKvO6TaqZay22VIEXv68Gvg60L1bicN2Z1bx9Z3UUPxsH7RrUJ7GWnx8jmQNvkUlgwR
         b6ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzZGrmsOjXb9/A6YGVllC0FCQwfDhSFmyTNBsNu9e1VtvNRc0czT6uI0jlMsRjKdBb7TKwsVUMnMXVf@vger.kernel.org
X-Gm-Message-State: APuU4Z+dXajVuhDq27m0Wknkc4ahLtfADVAi8k17grwP2hETs+C5Ezht
	LHaWBKHFwRe/cb13bi5LV7WxXb3AFzSHXtdnTnkioMR6KYiTI4vP/Lbd
X-Gm-Gg: AYBFou0ITGrZ/rup9WUHHA0RGtIpWtPKHplJXqQydESbairKR1qwA2bgCASQ8QoD4zd
	1APE8DplRjx6zjGFwxckD25FRk6v9kwpeIElk8B5G65tj7HP/FwhdCOYUzFNLJPf2pLAeecNltw
	Gt7mmMIeLOPwnTaHrAgBe0SDvLLhoOZn7h3xR6hzWQUj4Ys5vhfjhgbBsqY3MzRYSFVgGdJrKnT
	4BrCN2NUNEzFvJ5LcCerdbYGwbal/GRETUXSvCMgQshKV2E0BqL38znIhy+SSUy71EvAyF8fHTN
	1iO2lFbZ+SwYV6sLENaCzbjNNIW7zSiNpcrrsvG9YOLybqFEIsQ8QQ8sTR5Ywa57xJoiwijePrt
	H3AvVMHCM8T45F2aM3TlljJidkdiVRqKe5GF8JspWBt1vshhWO4kueP2gmL0t/g61r78L6mExmL
	FcC9ewc6F3K3In5C/y3xSzx81+vScIMMgtdRxYoD9fG+CfHFHHvkIWO5u6ciqq4Gzodp8M+MED1
	/QfFy04WfJJfFG4Lo2DGlzd7sccASNRmNICCUihOJvXKwgLT39xH+ohYFH32T54m0JPiGeXr1Wt
	S/DaMtdSkCaB97CDjI9i/qGdUzGX+G1c16JGqWHKEd7/VGiQ7hd12yFSEsgkIpHIVW5Sbt0a0M+
	ZkTxtWv2MraHFfdA9YKMyZ0DSCNc/jXNrEyMKLsBgMmAHzyXTZM1Vx2h8nrlFyf2zVSFcM2VxE+
	RtCXw=
X-Received: by 2002:a17:90b:4483:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ae8979ba8emr10104416a91.39.1793691758138;
        Mon, 02 Nov 2026 23:42:38 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:05 +1000
Subject: [PATCH v4 17/22] arm64: dts: apple: t8112-j473: Add
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
Message-Id: <20261103-macaudio-v4-17-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KxdvsBHCHsOgUdKIYNQ3yP4bIh+4Vy0Oz8XtoAQOVeo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89Xx62O3jC1V+SyUKnljuUFkfUzbs2NS1jV+n2zh
 uF0wYv7OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFO97DIjw47K7990qu8sXTpV40lwXnSeuuYVy6OzqzYf1q1SUq3je8Pwz9zvc/D
 7CTr8d4OP+Apqzq+on+4kU1LvfPuwfrGark0hHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..6d79164cea89 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,62 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
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
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.56.0

