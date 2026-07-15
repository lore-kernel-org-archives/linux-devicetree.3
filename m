Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4EF32B126;
	Wed, 15 Jul 2026 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123841; cv=none; b=Z1Ldfs5xS4qXu1PP608A1BbrrFgCBJFdKxmCAyHdt8YR8TgbimfSgNKJQth/tZyWF3G4fG7lzcQio+YdPTbt8tyN8JSaRZB/buhj5KQexcBDz8zAHWluE+dkd3ZqAbAl0EeZonYegjs5IgnJS3BwzXZr/3DY2+5vSOASSmxsIfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123841; c=relaxed/simple;
	bh=bJzAHl9f6sAB3taHCcx3NvxV8sE5Sshyk4ygxObu7Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hz3QUicl905QItuHYV/m8DKSMaCEFeJAIEFcy/XpB8Cv8OXZo/YdC4ieYz7rwYJu3WabXm9atZaTC66o1y4dItTk/HiqUli5B73YiV3wPnxATGpzNIDQ5k0TFFexlveULoQrB8teE4881Xx/fbTTwhOrspafuoQve8WPUU8Uy2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aDu95W8l; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aDu95W8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784123838;
	bh=bJzAHl9f6sAB3taHCcx3NvxV8sE5Sshyk4ygxObu7Ow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aDu95W8lFANfM6Ry9GE0d7ECh3bNk9fgIs2wGemrtraUhvmiuuWCylIi2G4DKXBOT
	 L2iwePIhkTD9yqiPHH5J6oZ66/e8JiMxrQCI/wWda78x7txeHpy8txWx6Z317trp4t
	 MNJHAUhz+MgV/Bzp+D4FxQuPO8QNJ9EEs3Pbu4wxj2ILu1OIuhFl+SocURAFgA1H2n
	 +bima9a7GgvYm9pno3dV0xsPyHVYPf7970W+J9+8qNqBrVFLLeoxu4btshAgwj6HX0
	 cv+V0hsCxnuSD+ILFrSMvHcfPHMUUOo9AinLHFdVrplKnM2ZtRNA70KCP1DhHvC8X2
	 hJIbIwEqA0f7w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAFAD17E0E4C;
	Wed, 15 Jul 2026 15:57:17 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 10/11] dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
Date: Wed, 15 Jul 2026 15:57:02 +0200
Message-ID: <20260715135703.46540-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
References: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple MediaTek SoCs have the Write DMA hardware in their Display
Controller: add the missing compatibles for Dimensity 1200 (MT6893)
and for Kompanio 500/520/820/1200 (MT8183/MT8186/MT8192/MT8195).

Note that MT6893 is not compatible with MT8173 as it introduces
support for destination addresses larger than 32 bits by adding
one additional register for the upper 32 bits of the address.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index 97d052b0fb61..c3ed867d058d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -22,11 +22,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6893-disp-wdma
           - mediatek,mt8173-disp-wdma
       - items:
           - enum:
               - mediatek,mt6795-disp-wdma
               - mediatek,mt8167-disp-wdma
+              - mediatek,mt8183-disp-wdma
+              - mediatek,mt8186-disp-wdma
+              - mediatek,mt8192-disp-wdma
+              - mediatek,mt8195-disp-wdma
           - const: mediatek,mt8173-disp-wdma
 
   reg:
-- 
2.54.0

