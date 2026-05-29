Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BD036E49B
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051974; cv=none; b=VbOWXYA5YQ/7n5c5vGgfUBw53PQTKa6j66sUH1vCmBEpCOPHuYRiaOBUaJWoyCjOlXdB14S26yV7Bi7D7/NgKtGFSV810XabMROYbBcjvr7nWeBkqQSgL4lnbIpwJHaLuQ7fFzZCjYaGrIHQYuUs80e5qyhzQghkM5sqE+7atog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051974; c=relaxed/simple;
	bh=bVslPCSnmT70LCYLKEcEI3c7suTV0ChRZWluuR68gV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNLwliajTBhvgm1NeYA2YJVa+0pc5aqkteTIqN6Aud2geFao1AU1PMvJ/KBEHU77aSt3kVKYtRoM6h4ZBZC8MJdX2lzwgDw3z8E8HHoBLOIjF/I8peb/wXYcBIktAF+qDHI5uNL03stvieHORifxPcppk2xasz66/lUgDFVEJwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRIRmOQx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRIRmOQx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso71629965e9.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051972; x=1780656772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWz1bxcbCKnB1qui3eEEw2DsDlA+ORcLDTKiyWMH2XQ=;
        b=ZRIRmOQx9th2i0M+pSwjmHjev8/qBsA19oyyuiaQhP8iIaCwZdGDtozhFWa3xTvpxo
         2WwGhlzDdBARN1zJ+seFWedmarIT420+uHxXBXHB5M84UqHrdQOBDwxKZUUsr4XEJUle
         bs/M3jL+qCcsH2LSDoIjyAz7o3sdR9UWSoXUvHNrPUKQRmcKx7dEFns+d8HBWtXMyWb6
         wnbgugY2ywvYR2Dp3yUFlToO4Tn25bot1oWUFrYCszoSc1q2CVLtR3G/beBc1c+ybJ4v
         meNp9Ss3jdggeAReDs+KlRFi66MMm6M0LQOMXSX5PowDn1zBfbUiwTJlBIclnVktUuo5
         bWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051972; x=1780656772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWz1bxcbCKnB1qui3eEEw2DsDlA+ORcLDTKiyWMH2XQ=;
        b=Spp3Rt3RkydZWQrp8cmpEMx2536PBDizZUEHh7OZLyHPfMz+QCu2uYTs7uqpjZ28eB
         nCA7GbsGy8AtuHSwE4HsX4bQbATiq/9iNcbkONquaVSXVMyBxqKovojwBH6QMAld36+Q
         YXjwaRmlpNm1xSZYIJbCT3U//9gRAC61L1QKXD40sdYfS5U1rnqD9C0kTBbxhkj/bzk+
         MDrDGPgpvOUPrBhMWtxwaS52+da60ITZjV5XRFzj2hI6rb3WjHJNS/+2OIC68epasnK2
         BEN1O3b4SwO8hLeKurnV/eVSszd2BQAOWfSkoR2iCFJbtygY7MjbJRGjg6P/zxQUT20J
         zB9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+07oaa4AbQAu5Snw/AHn6s5KkWtsNCchlb+54r4MQTPAPeuwHHtNyhkbG1Db25e7CkUzhOV5wgmFzN@vger.kernel.org
X-Gm-Message-State: AOJu0YyERK1ZAhRz1QSw84fqezefwlaTMezUKhj26zdmvjkKKZNOPfSQ
	6aBNwXjr934js97/4pxSqoiRFc2tMb7cZ1xgAh/ZVN3H3pG2DnoyY+r/
X-Gm-Gg: Acq92OGGM6yFnBxzIWA+VAFHHRRRIgZRs/ARojisOhvXv4tFOyYEAkF9ERkFWa/ewCe
	uJwYkBpmpyA/dohC2WceYWxa/E1kaNyh8M7TJ2eZa1BbW5PUfg3b+v+CTeezlDskE7e6UAjGTSq
	7OxkQug0/blSyw88ZXcmzTOaW/0DzcOeVzGrBtWEP0r89GCMvlIaVU5wdcxHb9PsbIbyFu1avZH
	gi+s1wAI9oX88yxGgICEs6Krb1PH0J/oehh1U94LEtTvxzbd9SPiAnwW6xaXkyTNPxRxVSzMfLZ
	BZXK1ET6RoR/cQGufZecFLG4MIIojVFpgXfSlsgRaa1ot3uyJzXqQVEtXMrqgcUtMbSTnTUK4e9
	tBbOqiQVgHTa2H2LDhLfSH4pC6G1JtOMVOJr/oqsmuqzNwSeZHK8bSxBai0Azo4na3CR5zqmdDk
	Ls5qN0NtbY0vQfjVgtNu+1jnda8lDErfk0+DoX2UtHBEwClyJYRZss7XgPeox7o0DuZNvndUmcI
	Jnie/5/GHtEDEitrFM72h9AkwQLl9Y5cx/THS7ufaqLHYVYxsd7z6rQDg==
X-Received: by 2002:a05:600c:a08c:b0:490:9d1b:2033 with SMTP id 5b1f17b1804b1-4909d1b228fmr42473415e9.9.1780051971822;
        Fri, 29 May 2026 03:52:51 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:51 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/4] arm64: dts: imx93-var-som-symphony: add TPM support
Date: Fri, 29 May 2026 12:52:44 +0200
Message-ID: <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051874.git.stefano.r@variscite.com>
References: <cover.1780051874.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM enable line is a board-level signal driven through the PCAL6408
GPIO expander. Keep it asserted with a GPIO hog so the TPM is enabled on
this board.

The TPM binding does not provide a dedicated enable GPIO or supply
property, so this cannot currently be expressed as a direct TPM
dependency.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

 .../dts/freescale/imx93-var-som-symphony.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c0842fb3cfa3..f541308ebf6b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -208,6 +208,26 @@ &lpi2c1 {
 	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		status = "okay";
+
+		tpm-enable-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "tpm_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3

