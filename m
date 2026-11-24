Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.121.34.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508309;
	b=BMvhvJcfxEeSBIYzDoxldqYpNn0GTk/QnWn9xT5j2+ekIGzC+zf5u1aLTsq/SRXuz5hO
	 1GoEPDTMEynnap9QpzYyRwLC9wbHg4ZN2iTgfOxCm0HrqOslBLbzxSdyGjN9hWkLkKNYU
	 xdGrzMAqMJE+oXGT5wYCVOPFuu9lm5hJgvSAZDSozMM9hgd1jGLJTqoLursjGFmBd9E5N
	 LOQMXnmKhO4JN5N+Wu3evtuK5PJmvLq903FTcAKfsg2GWgGLOTH2SoX8ol5L2u87H+NRc
	 R5yi3dzfKT80tg/6rVurqdSZpjrtar3DmC8SLU5B8rpUIaFNVoM/ibPLOGhQPBamc4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508309;
	h=DMARC-Filter:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Virus-Scanned;
	bh=hqRSb0ylNLV6vD4z5XoIrPEgClP+9sq7dQZHqPqG42s=;
	b=jY9wVOr4ELu39NCZOBFgxBoFiu1Sk0vxR6x4YPzRE+gLgaT4ucjn8xRib+esC5v3/7Fc
	 jGKaMNkUBcqt+d4LnV6htZ6swDcsIXyNjegAPLy8i28JbNwojGxrG06wmdV2sjzDa9jWe
	 BQiFiMp7OMg71ycn0MhnKdaKFuQoHCYrNsPmNZ/eGJvnjcDGx8v3RZUM/x/auQKifsgHk
	 lteutkrxT4UGxgvI37do6tXd8jtAzp2lStM56Jz7hcUhWaWLnNhq+noutUpUGqbU3tP+t
	 z/lIBh6FlkDXCy8Jsq0XERHq3sUusJD+u8cYddl57jx26dd91ABXvWHyc0YecpltpgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	arc=none smtp.remote-ip=92.121.34.21
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB794606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB794606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5140320002A;
	Tue, 24 Nov 2026 09:18:21 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1C83E200006;
	Tue, 24 Nov 2026 09:18:21 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 410751800088;
	Tue, 24 Nov 2026 16:18:19 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Tue, 24 Nov 2026 17:18:17 +0900
Subject: [PATCH] arm64: dts: imx8mp-frdm: Remove unused realtek properties
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
Message-Id: <20261124-8mp_realtek-v1-1-3da734007eff@nxp.com>
X-B4-Tracking: v=1; b=H4sIAEhIBWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMTXYvcgvii1MScktRs3TRjc9PkVLPURMukVCWgjoKi1LTMCrBp0bG
 1tQC3X75iXQAAAA==
X-Change-ID: 20261124-8mp_realtek-f375ce6ea9be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Fabian Pfitzner <f.pfitzner@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795508299; l=1058;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=rgm1aRFFWQrRE+f1gbnVp8iVbSLtNQiOlcAcqDGTNSo=;
 b=huXENi4J/NRcZn+qh5ZNfDIYqfwdL1TrFbkTbT7+Enlszgg2W075eII+8gJVXzB8nAH2isvE9
 GBfijoG8qgBA3hAP6xdbst13yNT/N45SI9Ejc81GNSpKYsXw9LE/4Tq
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

FRDM-IMX8MP use Motorcomm phy instead of Realtek PHY.
Remove realtek specific properties as it is unused.

Fixes: 95d7d7d2ad27 ("arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb and hdmi support")

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
index f43330d1ff8b63a86d84bb6e5cbba72b313eb634..e621b6fdaa77996b0837a3545e1d92e0cb44015f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -233,8 +233,6 @@ ethphy1: ethernet-phy@1 {
 			reset-gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
-			realtek,aldps-enable;
-			realtek,clkout-disable;
 		};
 	};
 };

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261124-8mp_realtek-f375ce6ea9be

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

