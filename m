Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0F38A700;
	Tue, 14 Jul 2026 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029490; cv=none; b=auEEpApOVimcEJAjz82zY1oAXksRQV3bHoJxpu2y26fUfdeQXs9AAyXo287gUAQuxkpBVMCKQn4wSfkzhFhw/Cimp/ACdZREvPP1geTM45YaR+qSxbl7BF1oIrpdKLNIblOxH0hpnxTQKf358Gh6HC83nqj0m/0bTrCLFHDlQr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029490; c=relaxed/simple;
	bh=o8YYKxiHeKp1LzjoQjOrfXbhQoZHP34rBrUqNiu0F80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBrw9e00T5vu8woLjAwKpaohwuiOq0GDN/zDYDCrvUqj2S7VNEdtEy6qkyWfqvBw0g6+DV4k8bFiEsys0ICffYr7/IPdOrUcaZb26OFFfkmUaAJ/z4efijFV9CRK3vY/fBeewObedf8nvGvuYfrgDodAYT4oorbOixk5aT7z65k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ACH7/Kgh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ACH7/Kgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029484;
	bh=o8YYKxiHeKp1LzjoQjOrfXbhQoZHP34rBrUqNiu0F80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ACH7/KghPskErSaYSNY5ctnedsi9Xx7ix6ZVXYmtihF293LEdkHL/qlmNvegIMDz2
	 a2N7jxftmz8qdeeGnxFKBTjFGwX/8U6kppYQ5NPNlziSGTg+Jm5XiG6SgHW/+fAOEa
	 lzgHwe2HmkRgHPV/pneROJ7EtE96YvNI+B+JwLNCIpqWAYDRGo+IEDgVn6mQ/EjykK
	 pYQZx/+3+dJ/cMckEsVeNLci4TZNnOikuUCjdf1YPltJMFhJVvmrjsWGwU4Oq0ZlFi
	 JaLeY+5CDcP3KAqW5i8WgpJKj86rGdmqW7h+2Cqw7P7PDWKjYEbMSmnANAMlbp5906
	 ZBshSGXp0wDvA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18AB617E0B89;
	Tue, 14 Jul 2026 13:44:44 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 12/46] dt-bindings: soc: mediatek: mutex: Allow #trigger-source-cells
Date: Tue, 14 Jul 2026 13:43:40 +0200
Message-ID: <20260714114414.184512-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This hardware controls trigger sources, and there's even a generic
binding just for that: allow #trigger-source-cells in MuteX, so
that this is allowed to provide triggers to external HW.

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 5267cfe92572..886e6f904b78 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -54,6 +54,9 @@ properties:
     items:
       - description: MUTEX Clock
 
+  '#trigger-source-cells':
+    const: 1
+
   mediatek,gce-events:
     description:
       The event id which is mapping to the specific hardware event signal
@@ -116,6 +119,7 @@ examples:
             interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
             power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
             clocks = <&mmsys CLK_MM_MUTEX_32K>;
+            #trigger-source-cells = <1>;
             mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
                                   <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
         };
-- 
2.54.0

