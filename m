Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0D3161BF
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201592; cv=none; b=mbaFGRC9hBQx8VHLNYyrzvKXpUPqbc9TTTiP3wkPCaFWBrvcTRLXpODyURSjecoR3V6DLCSZ0eV/dJWkz4jV0PCi0JtvVJuSHkQVgLggPsU4DSThdY0z0+Rtho3mtmHWFroifPCfDNKYRcqM+jnTtthOM04uysc6UERA4yBwsh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201592; c=relaxed/simple;
	bh=yhiGW+BamBre+FTmJNxSqskC0ympU0V8SkDlwE7b0zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VytUVatLmOb9Q7SO44uwXl1mrP8kYFVZRUOpE4Df+JVk4lqxbuj2VqjIsThDZT1NG49RclJsh0Yta346B1PsZFj0PGAYUGWjoWmxPVIBXOrskg8vLsVCkDf2M/mWcBsZI99HhedT24fGUzLNQN2SrCBTAfO14J97DOwB08P9Olg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wXjtM-0003nV-U3; Thu, 11 Jun 2026 20:12:36 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wXjtM-002Fqw-17;
	Thu, 11 Jun 2026 20:12:36 +0200
Received: from [::1] (helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wXjtM-00000003Ffp-13AL;
	Thu, 11 Jun 2026 20:12:36 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 11 Jun 2026 20:12:35 +0200
Subject: [PATCH 3/3] ARM: dts: stm32: fairytux2: change stdout-path baud
 rate from 9600 to 115200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-lxa-stdout-path-baudrate-v1-3-59b60a5069ff@pengutronix.de>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
In-Reply-To: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

The default baud rate when none is specified is up to the DT consumer.

In the case of the Linux STM32 serial driver, it defaults to 9600 baud,
which differs from the 115200 baud that this board's barebox bootloader
configured.

This went unnoticed, because barebox automatically fixes up a console=
command-line option that looks like this on the LXA boards:

  console=ttySTM0,115200n8

This had precedence over the 9600 fallback baud rate.

But when EFI booting a kernel via GRUB, we run into this issue, because
the barebox-provided command-line is disregarded by GRUB.

Fix this by explicitly setting the baud rate to the correct 115200.

Fixes: 8c6d469f5249 ("ARM: dts: stm32: lxa-fairytux2: add Linux Automation GmbH FairyTux 2")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
index 7d3a6a3b5d09..d30b626a18c2 100644
--- a/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
@@ -28,7 +28,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = &uart4;
+		stdout-path = "serial0:115200n8";
 	};
 
 	backlight: backlight {

-- 
2.47.3

