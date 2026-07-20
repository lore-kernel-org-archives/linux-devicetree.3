Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAC83AFD01;
	Mon, 20 Jul 2026 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528949; cv=none; b=jq/+cDbMXI5C4SZqPSPsK5t8dTKCVJfXKBiKexizq6XUumHEg71QQsFkdnnHwOWuh3/TnQZMBiva2QRA/Sv50UKCwVl4Jm8IRO8M7XS6YzrZydpPaJWvriPp+vz3zgizZrBOiFu1RR+r4rxnX1TPOeaIPhOO3OrIaA4IhwZxZqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528949; c=relaxed/simple;
	bh=yfsVzJZoxKOmotRG5Co7zwd3WiizVX7Adnc8AZ4LkfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFspiH2q0yYTCSC8gdBDVo9iZ4qLjgsXZ9lL9reAxK5gh6YNrqWAhclIMbtcgSKdPTnZmdPd+/Gj20w7e92bAercm1ye5SLpQCcv2Zv5G3YGYIB9buBeFSVidRkWhQISQQ+Rj24lwONMjulYksGB5NYy5Axm4RzZcfmXWFmmo3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0792F1A000C;
	Mon, 20 Jul 2026 08:28:59 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C2DA31A0013;
	Mon, 20 Jul 2026 08:28:58 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B33F11800088;
	Mon, 20 Jul 2026 14:28:56 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Mon, 20 Jul 2026 15:28:53 +0900
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX952 FRDM board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-imx952_frdm-v1-1-6d145eaaa5c4@nxp.com>
References: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
In-Reply-To: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 qijian.guo@oss.nxp.com, justin.jiang@nxp.com, joy.zou@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784528934; l=821;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=yfsVzJZoxKOmotRG5Co7zwd3WiizVX7Adnc8AZ4LkfI=;
 b=bh9r0oonXiQwzq4N8pCtHqD4SmdNvYW7CA9YV9fwVPR0jZ2h3EtLBSd7ICXVGnur0axEhfFIp
 6GFamEanO9xCo+8rfwuP25l9Aiu9ZEsBuQr+LfCgPETiVSIi3RQR/e2
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

Add DT compatible string for NXP i.MX952 FRDM board.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7b57a6ee1b50dc22ece292d6d9b53b5aa834ee96..f67b3f6d57d3623d41364f852a64802ad2217560 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1536,6 +1536,7 @@ properties:
         items:
           - enum:
               - fsl,imx952-evk            # i.MX952 EVK Board
+              - fsl,imx952-frdm           # i.MX952 FRDM Board
           - const: fsl,imx952
 
       - description: PHYTEC i.MX 95 FPSC based Boards

-- 
2.34.1

