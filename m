Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88647481A9A
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497454; cv=none; b=XP+YPk2MIa07a2hgCCVxHDHDyMNSs+xmT4e6t76LYl5hYkzvZRGYpcc7+WUooY5F28lUY57Pwx/Lr46DLIMAUEtMPobfOTLV1tibv7OxF1vpkgiLQqtnpj9NZuH6yJKWjLdSARqd4QzCADpxGZeCPH984QZUTfi/nq6JWvbBfHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497454; c=relaxed/simple;
	bh=PsnoS8jV5ypMZlSsSe5qNmVHEBcbuKb5Cl/F5V0ZrFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avoxEJ6j4P9BaLxCQbFYw6I2b03C9ebiwG84igHgnCzYHJI1Xjc4dAS5pHV0QcxWAqSxeRxWfzWL0GKZSA0xhfq0+NdKT+igjlDglS5I1nXs9GEv8Q1dRbwPlhhc7feUOGQavHW9a65MeXG8pyMEs41PnWTlZdOhczSppGDKOXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbzwKra2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbzwKra2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b64c8311so12275725e9.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497451; x=1781102251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaiAmYFlpvqj20dmoy65KKCZhRIv0Jj8RmELXA9gRCA=;
        b=JbzwKra2eFjhKMxKT5re9ajpPnvdT6Xb0thpYcIxS848VCBVrBNPFf/uCWVEvKOtR5
         cykwYv9mpPNveHEIKUDrEBXOlu6pALfKiiP5XB2368rLR1sii/g68hxsJoBfxIT06OWn
         b5rCXm0bzXe9G1Gy7lVz+9pT5sbO3veQUJ+Tyb3YiWatkPgezakSXnbZnTB3j2Ajyzkz
         U4buQp4dW6QUA5TIfvF3JNOUMXDueeTNblpiJNGGs+26q36l73EA2ruDBXNUSBIOtLl6
         FKRm3FcGkDmBwtK0EgHnDMRVCHOA9N7nq8Wg9BX8kWwtidHOcT4lAVsL0gn99dL5AmZ6
         DObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497451; x=1781102251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iaiAmYFlpvqj20dmoy65KKCZhRIv0Jj8RmELXA9gRCA=;
        b=W/RKsThldgq6vOAcqvdCrPZ2KOxeqk0TJkrGKGmsTPq++/hlZIdRIh1HZ7D7kh/A5k
         1Yim3/dALTgp89Dshdx/nUIEjtE+rTru6HI4pklFcU2shW5uFMIcRZRouSDBUZGMIBGD
         itCfMNZASXR30rlssUy1Nn/dJsQuxibng0Q3wsZZv3T1w1/tbne+3oZ0rd7Q7J3Qu1L9
         dfXXDS7rbDBQg0whsP0AJJD3oa2eo+9d2AoYG+K4B/oFLAstEEYXFYT9azdXv4nDk1i0
         k31jVip3aRFWKmMxRN87BlqfBICNAh+j6S1FXOQrLHe1xf033iOF5XL8U9oqAoNTgNeG
         PssA==
X-Forwarded-Encrypted: i=1; AFNElJ8s2R9XJvoTV/z9w4UH9v9kouJAhmk5/CgyeJfKliXPrpBHRlH9hQuOPXc1UzoSeDgPyUMqt1OXRpUz@vger.kernel.org
X-Gm-Message-State: AOJu0YzRtoXCrVTCR8619hnC12BntEyizkMt22TfqkmtlZUz6pNALO1b
	fC1nRV1TINVTUJVCF0pyTdlOx4ShELbWIL315yUV4I2082sSiA1+o+lz
X-Gm-Gg: Acq92OEri9Al/TVBO7FiJ2dI/Q9HUvlF2is6jupHNSGN31shEaHgUSJ9ZKSkHM9Bh/q
	5rTW36iPaT2KNPOoTSm6VbKDCi3dTvCHTXGfeHz4ul43rMir+z6l4ONzigsNr8MfhjERXEjeVO5
	IypB2ncAQQOzekacnNPRyGTsuAqGv1A7A8mFzP15xpshqgF2eNNXgYMa5uPXePRxVxDYRZFM9kd
	h/FxBc2mNy7sQDyk+5uQ8Wc6qUBUHzfx/RZaI/ZVM5s+ZBI3Gr0/mNg1CDDNy/SLEVQnn1SMFY8
	NGhCN49rDGduBNJFaNMtEbxnmzKaarbhEtsxHtNT6isfDi0DUMQ2ITCQrBEpFK+bkw5lq4FMK4I
	QzEBZXIWTKWrD9g3zDy5qXon4ClNtf5OuGXUFGBXbvZJq6S6i2b3l71yVfK4m7jikCOuKzPPwyw
	cFhV3mUvg0+pBxm1CK5Q342ETW71CE9JcxqLnyGeIUq/ehenBsb2GbPB0Ntn7wcnZ3flKRAo1ay
	q4483Qvi9NIAcipHlNeOPyUH02uzO3F5wuh4fZs66qG/bn4
X-Received: by 2002:a05:600c:4586:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490b5fda716mr63616595e9.27.1780497450787;
        Wed, 03 Jun 2026 07:37:30 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:30 -0700 (PDT)
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
Subject: [PATCH v3 04/14] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Wed,  3 Jun 2026 16:37:11 +0200
Message-ID: <7758fd3b241c8e09e8b0f4b3224220325f8a069a.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 6c19a63ce405..b15ca44b9a92 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

