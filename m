Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591A83CEBA5
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438354; cv=none; b=d9UsM/Hndelw+YQ/JaQZ1HPXlQXStGLzUfHKbG3VtJBFcnEli5nY4wwLI3rcdcPw782Lm2V8KpGnjYmETbq/PVZFMSeSpJCvByjHHjfPpSbiTyN+nNsKbROhbXwGfZwrUvC2xgp7X1uOrGppbvzWtdmMJVxcmg0gqakkROeDe6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438354; c=relaxed/simple;
	bh=6asgsNJtNzqMYXCTCShnu8Ynt63KMbLBDHWMKz336dA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eIx3UEkIA+BZTpkEiCBWuGQcmalbptRZCvbynQUfynZVe11sMzuz/fgDWEQmoAE60u4W1EmbrOp1cynm/oXdepX4FPXFTBOCxDUWA5at2k/huV3WVaL2tyXikx2+0B3fbAA1cxVHAKG2LCehyznDJ8QteqgUCPQE0mESkjuA8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1w5MT8-0005WU-Uq; Wed, 25 Mar 2026 12:32:14 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 25 Mar 2026 12:32:01 +0100
Subject: [PATCH 3/4] dt-bindings: arm: fsl: add compatible for new Skov
 I.MX8MP variant
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-3-10255d236439@pengutronix.de>
References: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
In-Reply-To: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

In preparation for adding a new device tree variant with a different 7"
panel, describe the DT compatible in the binding.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292cf..84ebc8c28b70a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1122,6 +1122,7 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
+              - skov,imx8mp-skov-revc-jutouch-jt070tm041 # SKOV i.MX8MP climate control with 7" JuTouch panel
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
               - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board

-- 
2.51.0

