Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF523D6691;
	Tue, 14 Apr 2026 10:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162842; cv=none; b=lN/2MzaCV/kfXtMJT1VY2gfoPfoExyo+pw9ajGt1DL+YeK7CwGLfC3YRNZUerRP+Fu936mWSLgbxtDSAFcfOcECCt6RHDHPMxpPb2gxvAkpiY4iCTgDHLG2ZWu34VfqyH74nnpTAL2gJe7a8w20sIOEiLq2pUdLAyPC1j0leac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162842; c=relaxed/simple;
	bh=KWcYLXR3SCPD4C4XGxkdTEzImPQ+OVS9H3Ad1rh1FyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQbeFUDq0LJ/saDq3y/wRQyKly8gvqcXcH/gqQO4GcY17M01XYUMunqgRSSVZULz3ibS6jra1DUMvGOn6KUxfAclDA3ynVReeO2jjX99X7jHt/DSMkOXW4GdHzqAVtwiONCb/bjTSyRTDwEh57vKnpyz0EA4pds9LW3TLm4Xmck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mO+YCPRQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mO+YCPRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776162827;
	bh=KWcYLXR3SCPD4C4XGxkdTEzImPQ+OVS9H3Ad1rh1FyA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mO+YCPRQY0Um27I97agmSipFvat9xgRgWeZT5YVVyjbLYVxla161R75A6KtT+yV7E
	 0DZACVmJ+8Wg4B7AXfyXAK432iYxWWm+XCbWXNXyxJWuegCWpBKFRQcU3n2MrXef+Z
	 kdUz2WnA4HGYW8Es9K4evCrHcMadq9sIkqgsxNHbMVSFDd6OMAwCBQbBQloYb+uo0/
	 N5gb3fsxvPQZe3EIPskycMo7reNqd6KKSWcMY0CFrr44A8meJNb4P8fiNh2mgKPGXQ
	 Uj70dglaRGzpwjBNlTjX5j+bjpsgAd97EkTUfSWTdS3/9GohSo+Ru440a5ByIxP3An
	 MKGl4KB4h55Pw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F377217E137E;
	Tue, 14 Apr 2026 12:33:46 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 14 Apr 2026 12:33:32 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8390-genio-common: add CPU
 power supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-mtk-g510-700-cpu-supplies-v1-2-3b8313e5ca8d@collabora.com>
References: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
In-Reply-To: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776162824; l=1691;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=KWcYLXR3SCPD4C4XGxkdTEzImPQ+OVS9H3Ad1rh1FyA=;
 b=SSSvq5wiJytbcW9kvgsxYNwvEhUVwkMIDeNUu3F0c+VEXNOkB//PxCKZmiDmGa9QYaYqXJ2xm
 f+jBDRpcUDTDD7ZmE6EYVSxuX0tS68QXobkWZrVynQfqu805tIV66ly
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Mediatek Genio 510-EVK (MT8370) and 700-EVK (MT8390) devicetrees are
missing power supply definitions for all their CPU cores.

On the boards, the big core power is supplied by a MT6319 (sub PMIC),
and little core power by a MT6365 (main PMIC).

MT8370 and MT8390 SoC have the same core type (little cores are ARM
Cortex A55, big ones are A72), the same big core number (2) but MT8390
SoC has more little cores (6) than MT8370 SoC (only 4).

To handle the little core number difference, add in the board common
dtsi the power supply definitions for the common CPU core nodes (0-3,
6 and 7).
The power supplies for the additional MT8390 CPU core nodes (4 and 5)
will be added for the Genio 700 in a separate commit.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index aab474d6c5f8..9ebb222a877f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -285,6 +285,30 @@ &afe {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu6 {
+	cpu-supply = <&mt6319_vbuck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6319_vbuck1>;
+};
+
 &disp_dsi0 {
 	#address-cells = <1>;
 	#size-cells = <0>;

-- 
2.53.0

