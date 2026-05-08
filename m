Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502D3398903
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239604; cv=none; b=g2SaKTsWC+R8wqGGvwp+YzGmUHtAjON4ZDQX9KwywyY5LAZQu1GdUqsMzGvMZkVOKqBdB0G5Ta7Bl0DS9c6qLATAVrEKZ2UztZnAvLRLDSVVVtI0NeFgqN6SFh6k//G3XO17LrqosVecfpfJX5wF+vZVqpU76Q5jKBxqh7jgUEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239604; c=relaxed/simple;
	bh=QE7XiNGp11ntZ8cY+ErYOWVQH1yYu1BzYi3BRu8v/Cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VgxIfbi4Zg6ZkR9vU4vzQKi8Zya+Rss257xx/W6CssQJv18NEenQaANOcX4quuCiUIby9Vo6FwEUni0dhUySOrx/sX+8pdOz8Dt+0JXPEIrVkewW3g80LBKJXqnRkWstSF0SS4oA6FR8dFKwwWWvgZ/4VeXVigAX4f7j0jFjk38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkBqQiqE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkBqQiqE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso18890905e9.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778239601; x=1778844401; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwMAiJr6rLTnqtrgyITSok37EhglhZRyua+A57fW1fo=;
        b=lkBqQiqEs1ccKrtR6+X81sc7xRQ5pRolhVGapBBSeNlyzv8xgp3ur/1Ugr0+60qf3I
         LBQ3BTMiZf1bZqRSfMA1AE18OyAT4/7eJi8UZIxpVIE6NwOYKi8EUsxxm4YQj3hBhh4y
         DCHTVLjs6eZCnw8V3tzmNyGxqo2SSUn/PiuEZzghYEvF1OkPgIf3qRgrgwMmoq7s0YK/
         gPZugPk3weuscAoVl7csIaIMhFpiwTzo8xTQO3bqk1KNGeglgkaSTLHP7le0yZUDM5mS
         gtnVui18EjjhUf97/VbJOLe/kLYmRGAsP87pXoWBeuTbJcx+k+PYk3QnhCJ8jqC0YO3f
         JFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239601; x=1778844401;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwMAiJr6rLTnqtrgyITSok37EhglhZRyua+A57fW1fo=;
        b=Z0f/M7Yk3V+NG8obrhEmeSATKjqX9gMf/jd2742qPWa/mskg5YcgpYSUBN2SOuZTAH
         xKJ2VF+Ear8mtdh2P4x7tzLrV7zEM3qIi/V+vKZiNDKEKecrBDk6+rwuSIlRnwtftYKL
         LhD3ec4E25ZZsTNdUO2o207sDT68OggiklcRbsZogSdUL0weyREnu1GhQdwRIYt20wpg
         SOGkeWYzME6xfg98lSej2pFxIPZ/GHDzjrguQCAgS2G4AGhOa3e7UXGXZRp/+sGm3XU9
         IiaSs7OizUaCEaS8cYVv2MkTpXideLtkmwsNRX5gmK0+ehnTfizToPTV1UP1YSPhpuQw
         Pw7w==
X-Gm-Message-State: AOJu0Yync/KKP6UbN+jbcWWiDS1fIxgSD4kwn+d6+B3i4xGfuicChoT7
	uYzo9TQMQp3uZ7osUf0gL6kJrgRXN9oVT9aGv9e8xRGY10loOWC5Rjwj
X-Gm-Gg: AeBDietz8SdZRi8VLUvVCyQChEcZe8PaSmWxM1sWTiOqLwBhaV8w+fL377oXkgHsNEi
	+7t/ZjWAtSyPDibGUKYC5xjf6e4x0gJIYsulj+dDlshvNP3oKweTk2STsOOH1yRxL+w2HgDctUf
	ld/bOTZyNRxEEgAQosNi3aBKDojsbwcTzYomr8CdSYHf3BVHRPQlPBhW4arjh8T+Pgie8eJh3pP
	6YAt2PkN02X36OmXjg5GjPti03t1X6LVNKGWR7WoMYESx2Dza1fAQ+7gqg1bnC8s6URUXjEE4xe
	Vs3Djd5VfKmaNQj1ubwXq4qc9MPJxCGoFitE3ydlSjsEjSTDB07VOcOWvu2QMQ+hsYmV1lQsNjY
	tL5/mE0G0LT/iQhssAGblXJGBJwr/cEtokJo1SmkbQ52ON0Glw3IK1NfQV5eBwnccaeeziiI3GZ
	fGTOa65iFXUzL98vg7WnwFI3g4SQjxWaVn6E16Jyl9TxcIpgOjH5J9P2tG9qzIYMd8HmeV0fARG
	eq8EVpSAmg8MEl7brXl2Zmy65X8IcfoEFy6vS3ucF0x3WiOs3o=
X-Received: by 2002:a05:600c:3548:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-48e51e097a2mr188764295e9.1.1778239600520;
        Fri, 08 May 2026 04:26:40 -0700 (PDT)
Received: from [10.0.1.145] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68edca90sm58547205e9.5.2026.05.08.04.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:26:39 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Fri, 08 May 2026 13:26:36 +0200
Subject: [PATCH] arm64: dts: freescale: imx95-toradex-smarc: replace
 deprecated gpio property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-replace-gpio-property-v1-1-ec67cc64e576@toradex.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAxG4atI1gbSEUV6ldKFHX81UJyQKaKId
 +/g8lu8d1KGKzI9q5Mcm2ZNa8GjriguwzqDdSymIKGTVnp22HeI4Nk0sXky+O/gsQufRgRxaoR
 Ka45J9/v7el/XH5R0UcFnAAAA
X-Change-ID: 20260508-replace-gpio-property-d62b300ecf30
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=AB5PPdLVkqMs1sCS4RHSNfyDkv2JV7ytgY+zBknYgik=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj8eyI/eeLEqoz2PwW+K+TerhSMbTm52LC6oSnAW2BCx
 PSwshPVHaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgInY5zMyzNbV9tFsTAvgXb5S
 lXdmpsGr09s4RT9JxixdvnOuAEtXNcN/X1GXxEDZZWkn7l6RO+hUlKvxrLl9h+5jTvnUd8HSBdf
 YAQ==
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Replace deprecated "gpio" property with "gpios" in
regulator-vmmc-usdhc2 fixed regulator node.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 8eef26eb0f87..7d760470201f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -113,7 +113,7 @@ reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usdhc2_pwr_en>;
-		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		off-on-delay-us = <100000>;
 		regulator-max-microvolt = <3300000>;

---
base-commit: d570a0d019a3d84832bfc6867647d3581b0052f3
change-id: 20260508-replace-gpio-property-d62b300ecf30

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>

