Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF523344D80
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894657; cv=none; b=cCCGZtyB5LwROP3jv+QB+0g7E6gZfR0XRZswqhGMKcWDVAt4yVuxUS9ZZtZWUkQTSUc6sxxyE5t5TDv+HqKEobSuYcYm/QIszW/TMedJ4FkYlelQ9stuJhsjIWqshviXZTXnd1OclfJGA5Uef/8s5lA5ZO3jpXJs9lv9TG92BPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894657; c=relaxed/simple;
	bh=tJ7+6MByt1nyT31HcUe58b7rgwBTJK3odAjzUrII9Ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FO9GI8VTbLf00yW1yx6+AAHkWOwsj/+eaq/9VuV5u6vzWqlVvZZE/0psECxcnnJXITSdmYIP49tl9YEZR345VtAiwdH2ZmnINJTZtJn/Q48oVTqZ6+AsbdQccLyVQeD7jr8kH1m/mr7bvB4nYTPimZf3fxkNsp5B8lhrIqRYK4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1weqLE-00051f-KD; Wed, 01 Jul 2026 10:30:44 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 01 Jul 2026 10:30:22 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add compatible for new Skov
 I.MX8MP variant
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-1-d74f7e3f8293@pengutronix.de>
References: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de>
In-Reply-To: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=tJ7+6MByt1nyT31HcUe58b7rgwBTJK3odAjzUrII9Ac=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ5bLBePAT7ervQ3Yv4sJ7D5wb9eGC3dvNasv9vv/+fmaU
 HP25C2mHaUsDGJcDLJiiiwqCyv4RD0+eEZOE+GCmcPKBDKEgYtTACYiwMjI0J4vHW2pfcflMUcE
 x/WAK0ZcvZsmPzo10eVbru4CG7kd9Qz/XXSqL51bF32jUnTDeT3li3fq/nhI3dlio+jxfevdu0U
 afAA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
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
index 86876311ec59a..402f140fb5170 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1147,6 +1147,7 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
+              - skov,imx8mp-skov-revc-jutouch-jt070tm041 # SKOV i.MX8MP climate control with 7" JuTouch panel
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
               - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board

-- 
2.51.0

