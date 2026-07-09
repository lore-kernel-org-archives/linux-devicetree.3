Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5083EDE76;
	Thu,  9 Jul 2026 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588835; cv=none; b=sXkhAAw2FCghk/nQP/dJILaUdRp0dm8vjKJK17lUtOzqAfXHYUDjw5iLaQScrpvzBM0kd8pthC2dxBij/mjdufkcdEhuQRpc9v1X1N1mPayNUWIeQIbBytl1MbkEhS5hRmZkGe9cAKPVcpWeTXMsoj3wLP5DF+NdFHL8aAOjx7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588835; c=relaxed/simple;
	bh=IUXue47GQ8Gj1555jbfNOvhmcryaDDAxPK4/yzK/6hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jdqhymB/odtklOxcti3j5/pGu241Uv99gvl0Gw59P0WOqS/VyIzE4z6S5Bah7Ojtwi6/gy1gWa+sbJol8XVdiFPKvOQUGalMfUbkaasCfeVCMiLUHU1FetXRXeN3hvXe0l7HHQGICQiW5OU5HlH4Zmpup32oje2LvpKcBKEJlj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KLL1Y9QI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KLL1Y9QI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783588827;
	bh=IUXue47GQ8Gj1555jbfNOvhmcryaDDAxPK4/yzK/6hQ=;
	h=From:To:Cc:Subject:Date:From;
	b=KLL1Y9QIwZMKAm/vyXLdVsnTvvPMQtUUuk2Gs5/L2ivp5UJUbwq2PgnxN5Jf0Zc2M
	 XHTEEQZmyjwE5ISAlVf6RzcLmzLbHdgWskrbxkhX/LY2+oKPs7q6nG3YDEOCUNQOuS
	 BQ/FxMOaS/YtM7rlrr3Jz9aepeRYLtlGE4vGjwO5ZN30M//dYcemYYfyB4X36CadMw
	 ILpbKXYz58+2G1m0M33FNS6iih5RDgIN5PfPClnkhqlKSXmbODo+hKVwOzP4hVGIQY
	 i+MsAsJ8UdGoRDzsKbLyPw+Nx1kz6iy7EV3X0fEDkHmTk5fq+1Shj1SHepwbVsVsWd
	 ydq/xq7oIq8Hg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC52B17E0564;
	Thu, 09 Jul 2026 11:20:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bisson.gary@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: tungsten-smarc: Remove unnecessary cells
Date: Thu,  9 Jul 2026 11:20:21 +0200
Message-ID: <20260709092021.34023-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary address and size cells from both the disp_dsi0
and the xhci2's ethernet usb device subnode to fix a dtbs_check
warning for avoid_unnecessary_addr_size.

Fixes: 9fda4a8a479f ("arm64: dts: mediatek: add device tree for Tungsten 510 board")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index 9f5a0ec563e8..8256279c5629 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -265,8 +265,6 @@ &disp_pwm0 {
 };
 
 &disp_dsi0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	status = "okay";
 
 	ports {
@@ -1049,8 +1047,6 @@ &xhci2 {
 	ethernet@1 {
 		compatible = "usb424,7850";
 		reg = <1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		mdio {
 			#address-cells = <1>;
-- 
2.54.0

