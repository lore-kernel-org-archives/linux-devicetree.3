Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A593341168B
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094038; cv=none; b=EbpaEvGTAr0bb/8VUtIzjbUIggG//miMNhPjdpTAolax8qBMvx4B3W4WdmOCdgmE5Ioo0L09JXzY4M26tOdzp+TG1D2ussCG0akKrEWLgwtr67HwGhh8tVL+T6oUrwpOK+EaWqBvPDVIjtMvCrneWHVI5I2ka568qecgo/EzkLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094038; c=relaxed/simple;
	bh=j+2mD3Lw4/MJvYfFqphn19jd5ntuiOHqc4m1K2MPqJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFcyIXJpq+tqhTO/f/TSKVnhHIFCkyhGN4HujvOgyp3AJXsnJW8e+atD1/nExAjqfwGZ/9+IhNhGZoovp6dP1EXhV0RSuSkFpWuwF35I+fQV3+WFrB81SN/Osn8beJ/eM3Owtkxp5adA2mFfDccB6de86lIXZ4g2OSroYuTAIzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzPnLf1U; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzPnLf1U"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a7d7287703so121553a91.2
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 23:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094036; x=1791698836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzaFTmYz+CkkadaQPdQFMgjPkjJonjXtWn2mskY5OKw=;
        b=hzPnLf1UAeUQh+tNxlKZP7VWMSTVYs4PhOeEg71KFKO7EHGgiAQW+tdBeBAZlXUbs+
         oQ6tst3fjTyiEYeAggWwkN9h3XbCw2g9WCsZ2IdqW+4ja3vPaCRcYVJ/Xdw1UnsB3y6f
         xmq68vLR1g0r1yr5ggJNZp8Xn+IGa31F22CU8mYe6gL2C8OFg+5HEwQ+7HJ715EXk+wC
         +sPRkpP9GaV5GTpQSeHYS3hli9/6WLoKA/RulhXx4g6xIILtbLGMjCSZN7afk73Ojm1V
         e8uLE9beH571ytRuULxMOwWKWp8+ZSRUF8nb6jCNHV1NknDD8Wf06BQNYSk6O2Vli4A/
         a55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094036; x=1791698836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzaFTmYz+CkkadaQPdQFMgjPkjJonjXtWn2mskY5OKw=;
        b=SdJTThlBpoRnA7hKMaVjOM76rGvwHTR3NfqDz/vi0hK8sui1EEuNz200f23ZrF1QR/
         Rllzt/hrT9HutWXBquFdIV7nJZfzahenI911O2YfKaFIjjzDuTvuRaONEItpMkok2+VY
         DgudcwcM9/D0JYR0g4OmwkhYYfbQK85hf0SzaYn3443ULQn0tJbeVICilZ1tBCB60lq4
         k9K6opBPEaqhN7fyPgk8tz7devIa122rPytF87szc5cfL0B78MMhHKn0qD9LDnYB8k/9
         VKbjZQAPCiatcQRsTBGT6uXJyv2H26kMU9BJEur6PFiSREEhskkk/QTmTKP7/L1cofMQ
         rZ4A==
X-Forwarded-Encrypted: i=1; AKwUvBwCLMGyq6fVm9jGR9ZCMO3Jd9EonkO+HTzgzkDDQRlBjys26DH/Qi/SSh+2F6LVoAjWfVcjlB95ZbCF@vger.kernel.org
X-Gm-Message-State: AFq9FYLZZjHYXmmEzLAE34N50hnRyuIS3eCyWE7f3RZsmRzfIXYwA7dA
	8QNfnK5+X1fmkiB9b8m7SCOR8Qd19LvngkBTE+sKy+EVWWy6sHGykrYy
X-Gm-Gg: AYBFou0N2lHvVOosc6jJbs5lLmUlg796IzA6+KkLxwOieDtITWYEJaUXQThEv8JrR/x
	avI4BmVCTo6HnOyJfMw0CiyQDGXZxK2BPqIRiWZGST4o7dVwR5KzHk4fu/jQJaOFIL5nxcImHGt
	Ix+KbgwoJp0TTlQrzf3XYnA94hlIK5FuuH6zdi2sMpUEWeOY/aQ2mjdQxC31/226ZaKLVUUSyQK
	/yTb/JVng0W0wZ9dknUbyDx5+NFNJf13si9njH0r6Rptc8qKW7xmXWTEEb5pKPGB5C1YDa/wf2b
	vI6l0M7dsF+JRn0bdl8hzlqQ2MnL7qyRq3TLaLjhJ0sN1Yox58x826XW2T5bQKbfNMExpbuaUni
	E6U1t//MNz/3GxzvS2lTveL1qL9IYvVZke2qC45DNJyJJZMzKQhxXoy8vIOij7zo9y4dxip0NoE
	Ah+DUPXXGX+p1NcaWlzvyCahiUzXas3Skd8CNtzGBjU+rUDb390+vce+0LRCdZDcd1kTCcjoQRT
	p+toBIgVujeazW6+VswUMZJ1A0ZCG8K5nwkydBNrX9Z8AxSsLz8RmGtj47REZXWYGRAwPRoXz9N
	34VwwSdt/WNpqr3h+dNTIMmbhk4O4WgyGNoQcN+EW9b9CZ8=
X-Received: by 2002:a17:90a:c2cc:b0:3a4:e89a:21bf with SMTP id 98e67ed59e1d1-3a7873db396mr2837779a91.39.1791094036003;
        Sat, 03 Oct 2026 23:07:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:48 +1000
Subject: [PATCH v2 21/21] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=j+2mD3Lw4/MJvYfFqphn19jd5ntuiOHqc4m1K2MPqJs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Rf2a8aUrExzb1QOepzh8zJfDu2xPAy/q8rvjbJZ
 8xfeqK1YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNW/tzAyTH/13rXH33uWx1NR3gB53XwtpaUvo/kPyArq3Wd/sm35NEaGnR6/n6y
 /xiJSZzNZ7uVUVp0VBRsfaWW1plgdP7/06ZMTLAA=
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
index e3c2635d84fa..7b4c4ef471be 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J473";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..f8f776f9eb1e 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..153899f1569b 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
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

