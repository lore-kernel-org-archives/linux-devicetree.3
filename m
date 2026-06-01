Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F963B994F;
	Mon,  1 Jun 2026 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323362; cv=none; b=vBmEbyhBgbgixfHcosw5LHGa7lsEVTl9UVsdnjN51dqLqbrxAle6LT75MynX3zEv9/KKwDYC/OuR8TpLT56srmnBdR6uMrj+JCUhltfRS2Esw6gX2jsEFiehbHtEAuAMizcpH/c9tJqe1d7v4YOqwkKqXZE4qLkI8XNRktCOo0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323362; c=relaxed/simple;
	bh=Pa+PA8v51EYbf+V47125p/KH0Zpl+EITvm6DO69UpXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZ+ZvcGdRgcCXp6PIBifR/0LLRt3MDCuzPBxBLdnGWbw7qmDvh16M+XVkMvq6V0bH8FzUvGIFLfY7lVoB8LyPwZVMXJ+QzHfa3z8ezG02Ib1Gy+MjIBZzbVih6KIFl7FUAvuNM238d/UXtA6aLETRlyGizzFDgG3f03YEEKDIiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VL5BVZVP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VL5BVZVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780323359;
	bh=Pa+PA8v51EYbf+V47125p/KH0Zpl+EITvm6DO69UpXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VL5BVZVPqG2laTq6+DfN5rpqUnzegz0cO+UcSH+j1Spr44Uq/VR5j+dyRkNGKCF2K
	 0Mbh3hBG4gWhFomw21/Jcn2HnVN8Cm8oGr/G5AkAILwUoB/+DWuWF+/cKkbzx+MEJR
	 axVJ8vuzZ45baaU4QdysNKQ3WXE8L1MEd+H112+CUpizo2waAswoz7nmgqJJW/jQZq
	 PPYkmWCL4686s3RbWZ3lSvZJUvXnbbQeHVBsl2QFyZ/z0xlajhkrX0VA20i4rKReQc
	 NwNcVgu9ktnrypvjCUC3+bElNuY9j1Hix1GsE0+liIm1E2FCixZrp8Mb7OkpzzNPHb
	 ytMXGEd+ToLog==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA78117E0DE6;
	Mon,  1 Jun 2026 16:15:58 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 01 Jun 2026 16:15:47 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8395-radxa-nio-12l: Add MT6365
 PMIC supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-mtk-genio-mt6359-pmic-supplies-v1-3-05750080ba59@collabora.com>
References: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
In-Reply-To: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780323355; l=1493;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Pa+PA8v51EYbf+V47125p/KH0Zpl+EITvm6DO69UpXA=;
 b=vd1g1BQrXWu7S6wkbp9pfGNOg+4EN626LfvC7QvQkYRAguFuisrhS9dDeldeCPENvlGj+IiSj
 cy6hUlRirh/AOiaQuLoo9d03GcDgE8/Y52eLvY5BLm+gik6NfZbQ5do
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Radxa NIO-12L EVK board integrates a MT6365 PMIC, that has a number of
power inputs for its various buck and LDO regulators.

Add the supplies for this PMIC regulators to the board devicetree file.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index b279eed1bfc3..9cf0315da035 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -1033,6 +1033,23 @@ &pciephy {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&vsys>;
+	vsys-vcore-supply = <&vsys>;
+	vsys-vgpu11-supply = <&vsys>;
+	vsys-vgpu12-supply = <&vsys>;
+	vsys-vpa-supply = <&vsys>;
+	vsys-vproc1-supply = <&vsys>;
+	vsys-vproc2-supply = <&vsys>;
+	vsys-vpu-supply = <&vsys>;
+	vsys-vs1-supply = <&vsys>;
+	vsys-vs2-supply = <&vsys>;
+	vsys-vmodem-supply = <&vsys>;
+	vsys-ldo1-supply = <&vsys_buck>;
+	vsys-ldo2-supply = <&vsys_buck>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 
 	mt6365keys: keys {
 		compatible = "mediatek,mt6365-keys", "mediatek,mt6359-keys";

-- 
2.54.0

