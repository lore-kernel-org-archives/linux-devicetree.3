Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B395C3D1AA4
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880367; cv=none; b=PsUerg8C7BJmzdXCmcJKcH32RpkDgT2W76oLNxYsRayx/Y8aVSuFvAksnLMnTn/J4Qb+FuTkOoyS23UM0iyDFBzFd5CwyiuO+fZkjZC9NG9UKe63uS9IFF+jN6EoHDZCFbmnV22ZYPaSVLZ5EEn11Hag8uDB69m6NY/qVel6Xl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880367; c=relaxed/simple;
	bh=wZ33HmVJ/5Act5G23FfyEoldMO69+O+FCZBZLHA6YUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJbEMxYG+WQH6DbKc96LaVVY1cJvtVzxTI14iUELWhXbiUE1x02sgzySSZm2YrTWe0BcoaDOR5rNJVz0nA2EgtGl3sFln+UNBizF3ucKTNNZQwqzyds09I8Ds/vsbEYoiM0/vdzspzGAgdVqNpaKAiPkOdGvDV6a4YIxSGzj/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7nND1Pj; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7nND1Pj"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso15050715ad.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880365; x=1790485165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYHqvApWBxaD4bUAOaE882+EY9mUZ0r309+FWLunq88=;
        b=g7nND1PjQ9wD9XeWJspCo3QVuJmVc5fe2c7Npa0as0MJt3vkRwy9C4VwnmpHXsgI47
         nWfNSIz4XhQdCvOlX2FddeU0HDd5543UtxwRqn8yiwRrovNCK+tkHw377HBkFpP3j/Xa
         PDztO78pU7GjPN3xFZ7S666QbnBtKR3lAyXKsSlqrorEQ9C6nhcirJ4+1dGxTtyudJVf
         JZVQz7DCZXx9Rjs9aF9PJCOwxgKzTLpzdjLZD3K1TxSysAD9R8+gXRPpWZDDB5+8jYub
         ppbe7rtAfNd0Z0TqZvmKArYOOMgOIIiW1rFVe/FHaA1fkz3Po9zKWkSRNIDS4Gmeyo9v
         me4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880365; x=1790485165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYHqvApWBxaD4bUAOaE882+EY9mUZ0r309+FWLunq88=;
        b=r5MPc/3DKEajHrI/5ysS2yuCdkomACsvsP3bX6jFTQe5YJ9RmqfInxQzlcsGHSo6mg
         2+FeSdDmDJde1C5CnEZcYza6frRZXgQefae4PLBEK1Xa1TdWvmo2fpqWWsb1dywCEdH9
         n71NWC79kCeMLCgkcP2Tz2jU7HkPHf7MQ/Nl/s6SM04++s4rVrLtLUof3kAP7rx7kkuY
         1XeawJvYpVRBXWVqTkfujJkkHDxhbFfaefqw6vMSFk91z/9XqRVYeqXD8d9urlIQMuFh
         h0Y26HkoQzmsUU4pAuktsxq0mOqhLgDAP0tYOwvW8tFs7PhZPkjTXoyZBwx5KZl+wTqI
         /+ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzV9MXcY5A9FtPPeO2qthh1I6JOuTQrsYxB4NXLTNHGFTVrRJ7grtBgmx7T1qTMa7kjJ6oV6EyEQmcH@vger.kernel.org
X-Gm-Message-State: AFuF++k14x0WTIt9TGXDEwpN3CCwo4LTCQthdExYWXLTmlUzsIU/guHl
	BwIpHxGo8RzOzDRtERHsqfWOLrrnWvQZoPrpnqd0vUW+Rf+kPSEbcNcT
X-Gm-Gg: AYBFou1txq60Sxih86ej129UnX6oYt4ZG87ge8Cofuu7vqWt1H/Tr/CiwuB8iLVM8bn
	cO1Q9wxeStaKXNs3hEkOhEjbahzbSVF8UttGIClBSWiWMaOUPwPOH7yDpxq/Q0lm3klPHD+Jn6v
	W3xcxRVrW8Z6BSeGpZdQ68fFDdxyI5V6YWB6sy7vSEZseObNii3uAbIgf2ImFH1ETRh/QzMER3f
	xc7Ef+i+L/zTsvgjAr4HLu8MJ2eoYNXnIwovag1/S7ZPXw2Q50TeD88vuswVBUGD1mspHPbtaXM
	Y2EcDyZtbQicpBTNweZkyVzhIJTYQBPRZMii5HNNf1Yxu/btDtrqLhXzBrwJnDOLgM5VyCl6yBm
	9M5cG4HlLu8ROm5jbguD6ucskLDsdfU7qpl1mhaDRNy0Hgk/YPZ5a4llZ8lQGkH9nsAW5Usd9Dj
	oPG2Z0I2gWV+Lq1TTimoDE+UqvhfUPoO0/P8GyxMDHC14U45aVGfmiBvlOBFGEomlq9+EF8KB24
	FlXrRutBfyM2K125l1x/c+rhst4quTObZHROBrIqB+bm/Uzm40bcEnrPmcpNdQlXTFaZGs48UdL
	T9ZBhDIrtYr8qb1YqGXhG9atszCuZsZbCq4lB4AWOwKdQIU=
X-Received: by 2002:a17:902:d4cb:b0:2dd:c053:e0f7 with SMTP id d9443c01a7336-2ddc053e14amr57727015ad.38.1789880364897;
        Sat, 19 Sep 2026 21:59:24 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:59:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:07 +1000
Subject: [PATCH 28/28] arm64: dts: apple: t602x-j47x: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-28-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2560;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=wZ33HmVJ/5Act5G23FfyEoldMO69+O+FCZBZLHA6YUE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VFbxtZ2sxO6rz5yvjZ5FtlffdnP/XfybTQ3vFf9
 vQgWa01HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKlebcbIsNF/880JArN/VbEXGrKU3y9d/+feZy3e5XYinUf3PvpbEcvwv3o111H
 9zCXse1hj/pyY9fsPb83NyDkbHzH1O+07w70vhgkA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
 .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
 .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
 .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..e79315b15f11 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio", "apple,macaudio";
+	model = "Mac Studio J473";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..8aecd23e0ac3 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..91ba7c1d2612 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.55.0

