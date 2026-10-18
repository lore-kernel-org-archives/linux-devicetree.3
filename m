Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316D21684B0
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303066; cv=none; b=CPX4N6DaV5gwxNSsuTa8XV198ddPq8AlT911l1IhIRXDviFOSJ4ZJxrB57EMVkqQaneLtzutQ8gjCDGJsrIW64v58zKlbMhX/HdD3ebD7aPDPnDfLnpIi55n8gy9VktyZsou/rEBfunH2mxtdJIQ/0AZQh4oLlmW0JiwbMBx3Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303066; c=relaxed/simple;
	bh=4umqbHnPcmDvTKDGGgoaHBxvCxbbxjsr11wiU95vPB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuBwVJl6qTmWZJGUZv8cjmo3ZzqcGsEBzfF+ePh38O47D6DiwDFuH4UHYpcOWEJuGOp7vRMYt4mpGQYW3dGbpMNFNafS1v8xZCUMy0Z2j6SaJaI0q1tFZurLE7gqOvEAZQN4/cLl3Ey95Iz/ngfbmDWMYaCormBKjyyUtfBKKYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rp97e0w3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rp97e0w3"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so891622a91.3
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 22:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303064; x=1792907864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDf0EybxbEMPZU9VxQSFE/nCsO169lfCLx83ijqsYSY=;
        b=rp97e0w3X4d32rSgyKAGGKFj+0azKL/K7kh3cgSVKu8GVsXI5EjnFoM9kYkIFVYszO
         8zIdfJtKsMRz/zqWR1pQCi6tTuzKVFim+Ka1Gqp/qAZ6H+G+jGTWifJaW0NY2T3m/TlP
         6RKbiu5BUWjJP0fmzHIfjceUvk4ZHGcTPQILh6hd6AiSqhl7RlpOYQ13iS8yjMpzUYjs
         rWhMmPWbFCTncCZ181Qrbu8oqBHdLMk8IUcRTY62E0ViBTfdnn5Kv763ubzVaYX7Z0OE
         59cYd3u5TWpirwo9AqkJ5TnyOChQMNi1uAoI/zzhm2HpaqGRyGuUkDTD2XbFj4IkeAVS
         zYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303064; x=1792907864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDf0EybxbEMPZU9VxQSFE/nCsO169lfCLx83ijqsYSY=;
        b=KZkgNmzXuonezlwb8mQs0Gh9EU6k1nnyQzS9SME4RGuMvwsFw7iMHHAraBMtGTnUlS
         +IURB3LYeKl+qTBMs88/p0RcW/9gCRbFNWrZdDmsc8N3tzJpBnDrtlNfrsPLlLgXWYwc
         dhwHjFSOuYYhem8X/vDpu113l4M0OtY7WQQr+ugj8sDcDCV1270Mx4eDQnqcKPzM2kGp
         wN3GbAJiAC7lNlybF7u7H3Phk2iEXXBSzqqHvlu23p37T2yIDlNksS6kPTB7VlIrgb82
         uVo6eMRd4Ox6Hmc0nxi5L3kMAhmNiPgMPcodWbfqMghk93S/wmifHY7TJZQ4MNLY03kE
         Qqdw==
X-Forwarded-Encrypted: i=1; AKwUvBzA1hhZW9+LostnNpmLHOpiUadnMoco2ucYM8fs5fii0aOT53laCg1JTgGRnKWwdYuIGuL5pA4NAJGw@vger.kernel.org
X-Gm-Message-State: AFq9FYLEMUiDE7RdKqm3KVK7rjU9UIVsp5DH6RjRxpc2vnKKvB1pNonU
	1MZgeg5EMYwe23lZC3HK2q3pk+/jNCizrZe3GxaBILXHJ7V2ntVCIaRJ
X-Gm-Gg: AYBFou2lP0gwrbnvjPwEgP6sq856HnQhLgvBzrP2FgsQAx4obcNR1mU6awcEh/zle1b
	j7xevJ8gykTfhGM+YZNWmAe3+3XM287PYvcz2UtqR3QxjyYW+NJ44YxKnkd+JRNVObMFeKIb2qv
	5yG3cIjXsmHyIw5jiIRqXzyJ22XzM3tn/X/LpeJN9HeBvZjToMIxWm1bdqxTEXMYPzIHjqmC7Xm
	iBb2uGexwoiRuho08+KrfXCetb+kQGJcHi0SMAbQRaK1wZl6gzP4CwtiSoN2W/vBViSTVjKpVNJ
	0gLMaxjW6Yxy049rDUbBnmglckSWCP+w6kHwERoJcOZ5PpshrGZCk65YRCKLp5JW4EtpdWkOhYd
	FAqpzuEraTaAQYhquM8xSmu3vBANkoHD44SX3DCFMPEyHgqyGeW9flpVJklscl01ZbGzj/oc8lZ
	gDQyoI2sG5PCeD5VuiCad9fMLg2D38cPo1xG93tvYHapD911RtBPb38gFskULgpAL4B54Kb3TLq
	EjrQ8SPNfp7K5VT4zz0Q16NNFN6hRiDenFIXD+fZ8Jp+5AEuWOizIAZaMwA4aUBOnotKePy/u1L
	ThWSv6XWwlf3g8lr+GBpbWDJFnzXiXApECfALTFTyc0NzA==
X-Received: by 2002:a17:90b:1d4d:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3acef5f0687mr3345724a91.64.1792303064515;
        Sat, 17 Oct 2026 22:57:44 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:14 +1000
Subject: [PATCH v3 20/21] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-20-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3704;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=4umqbHnPcmDvTKDGGgoaHBxvCxbbxjsr11wiU95vPB0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vl8PtYHuD+eEiw6QW/zjcuLwwLOnjK6MtFAdca+J
 OFmLv0bHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKl+ocfwP2qvi6NfdVpUzax1+SV/rKyM/zzf3fDra8ud4yf895leMWP4Z9/W3rb
 3QsqbCfUhy1efkTi6uDKdv+Rc04NNLtdCO2LkGQE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j414s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6020-j416s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j414c.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j416c.dts |  5 ++++
 .../boot/dts/apple/t602x-j414-j416.dtsi  | 35 +++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
index 631c54c5f03d..2df6a39c719d 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..7f3f0d6eee87 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..ec4050ec0ecf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0037346959a5 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..852fbcd6277a 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -43,3 +43,38 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&speaker_left_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.56.0

