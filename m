Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B03377016;
	Fri, 17 Jul 2026 05:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265130; cv=none; b=NWAdu5IXJxGfJ8StX5mPqDcYbwp0zjnLT3+Z4+qVt7yN5ZE+6EMEpP8FtWE8Ey33RBxAhIeEtro4pnD/V197rCdmItyjPS42/hQtH4OJqE5FuMR35awhzU6qtB0NuhakhFY3TvXZRkWJeAeDr2ysVrHRbfFCg0Rw8QTPJvLDQSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265130; c=relaxed/simple;
	bh=Ymma+ccm4S0berqOzybvR9sNfmMtutF/oYLFF+cWTDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMwOH+zWMMpoLvks+8vKsTrV37ph4Y+fBXDWwbrZIdo/PSAtn6Pkr5yqsJEllVeKBlSCFwNmDwRYNDXTqtw2ZHo0ziQeD3+5zGf4w5BqOkvzEhEtnHykm9Xh2dODDuOATBo/hVOIbxhJ/JtXI62d2/t6IZjx9rMdIrPwENWjwPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9C62C200189;
	Fri, 17 Jul 2026 07:11:59 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 65E18200181;
	Fri, 17 Jul 2026 07:11:59 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8CD7B18000B0;
	Fri, 17 Jul 2026 13:11:57 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Fri, 17 Jul 2026 14:11:53 +0900
Subject: [PATCH 2/3] dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-imx93w_frdm-v1-2-0cca6c0ba2f5@nxp.com>
References: <20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com>
In-Reply-To: <20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784265114; l=1272;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=Ymma+ccm4S0berqOzybvR9sNfmMtutF/oYLFF+cWTDs=;
 b=kwKiZuqV5B1EXnRLWzugN2GW9NQB79ME75Fg92uDHnTRPRbqcU7Ax1uY7umdgBDaRc7MXKEFG
 T4Gxd36rficB32GOo1+3cRKxyk9gTCVtYFQA80TuGimJGK5SAWQvU/9
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

Add DT compatible string for NXP i.MX93 Wireless FRDM board.

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless FRDM board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 FRDM board, with some minor
functional and pin connection differences.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7b57a6ee1b50dc22ece292d6d9b53b5aa834ee96..9ab7af8c02d68c7f95cccfb5071662eafc8f93a0 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1513,6 +1513,7 @@ properties:
               - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
               - fsl,imx93-wireless-evk    # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP EVK Board
+              - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
       - description: i.MX94 based Boards

-- 
2.34.1

