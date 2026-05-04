Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0EB30B51A
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 20:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777926113; cv=none; b=RkuMWCsaJmnjQEqwVV8bcCLjM37D/aWfbXEd9fiKIlyhAjTf0bPxQG6d47GZfTM5LHy7prTVCliaWz6vVdwPgbBUDwDuVeTDW1Rsw4gbowTUyk8adCQzCAClt3EOVtMTn7L/Witq5z+9HotGD1OjA0C2fzm90LvhnbZ6DEHobOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777926113; c=relaxed/simple;
	bh=JBXh0MAQ8V1ccen8UjIjb4VYbbrO/eE5v6/Dls6nvzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=suQh6cUDSvHDRWbk65fMryT/AhuuZV/UFfkzBHD8FuztZagfYf1ac84xm1GbQ6+QehxdSGlKkbFt6qZGLrv3v5R03zAP3MZqN9nXvRSYUBxUPE3e4oVxPLQs6wGgosQXBlJojHqYPcfmqIf+cXix/zdk5ay/mR5GwUdfZHB0/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1wJznX-0007WV-Kh; Mon, 04 May 2026 22:21:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 04 May 2026 22:21:44 +0200
Subject: [PATCH 4/4] arm64: dts: imx8mp: remove LDB reg and reg-names
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-v7-1-topic-ldb-fixes-v1-4-0125d937ff7f@pengutronix.de>
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
In-Reply-To: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com, 
 victor.liu@nxp.com
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

The blk-ctrl syscon device(s) have a very loose register definition, e.g
one register configures the USB PHY clock source, the PCIe EP ready bit
and enables PCIe and USB clocks. This would lead into multiple
sub-devices which use the same 'reg' which is wrong.

Instead of specifying the 'reg' in the OF each sub-device driver needs
to handle the correct bits on their own. Therefore drop the 'reg' and
'reg-names' porperty from the bridge node as well as the '@5c' register
suffix.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 90d7bb8f5619e50d9fd65bcf18c083affe15e6f9..41649afff813833aeb1c0355827597578048b037 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1999,10 +1999,8 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
 						       <1039500000>;
 				#power-domain-cells = <1>;
 
-				lvds_bridge: bridge@5c {
+				lvds_bridge: bridge {
 					compatible = "fsl,imx8mp-ldb";
-					reg = <0x5c 0x4>, <0x128 0x4>;
-					reg-names = "ldb", "lvds";
 					clocks = <&clk IMX8MP_CLK_MEDIA_LDB_ROOT>;
 					clock-names = "ldb";
 					assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>;

-- 
2.47.3

