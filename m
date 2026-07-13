Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F223E5598;
	Mon, 13 Jul 2026 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936736; cv=none; b=ZuQMWsvPcxyrD0Bw8gE/74zzPNRFHOtQFutFfgMTZknRr4tJpyhsLqzNnYGOVz1EK42870UK3lIpvPV9A2ZFisCrkJ7qJNgboQJnKpNxQvBWdwcuebZ092UNbCKazpW5A2j0VlpFjxbbV75wlvutDgo3jcO2iTZLlatbVYANpX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936736; c=relaxed/simple;
	bh=+1IMus2mrgKgBZBYS1iIfAgpNfuoFnLk9RiPJiZi4LU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pDPBfiPJbd8DykkJnhmiovU7ikRolOoiOmTEwMEEh5mAwWy5b0J+1yMiJbnpYgTMjKTgxzsVxMZU9mTfs8v3zXCijzReOdCnqMRxdV85lbRcBGsrnAPhFvlpEykc0UIvhGUMJtMl7S3sgIZWBN9NAnv4DBI0Fsuz0usMbw3wSyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MczT9WRb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MczT9WRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783936733;
	bh=+1IMus2mrgKgBZBYS1iIfAgpNfuoFnLk9RiPJiZi4LU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MczT9WRbTbCsqjMp5vSHiucbPL5Cs1Rubk5Eu031T5z0ccy6b8l1601kYbIYRrd9q
	 LPOTobYg1jozA3qmf8scQORu20asJtGOBB0PGE8AnyRYI/+/hjd0Eb4fg9pS8M1RuC
	 zhTacXNx+Pz+nKjgXrmWOGb3DBL1K+ywSl2GGgr8byf/Fz5UoE+djFMwnBWBHw8wPN
	 lb8ITAcEYv/wb5YHVZumXFdwQP+JpTHi41ggaWhJAe2V1sI5EiwWz/6Ca38y4wRhbg
	 z88lqaTnhIK/9bK5MtXQ3pn34dvOI3GemA7T6nsl+5G7U/Si3j9LlwXa3XtUKLDWdN
	 MPh7yaamcHgBA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5CAE17E0DD8;
	Mon, 13 Jul 2026 11:58:52 +0200 (CEST)
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
Subject: [PATCH v2 09/10] dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
Date: Mon, 13 Jul 2026 11:58:36 +0200
Message-ID: <20260713095837.16590-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
References: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
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

