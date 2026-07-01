Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5B348165B;
	Wed,  1 Jul 2026 12:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908451; cv=none; b=ftOODSeEuQjTf5aXz9mx/f/WkIQYyjusyduCptmI2v7HGUlIqt7g8RMM1bhQfZYa6pBCtSbB0RSpaFPS3typOwtR6NFwamdzpSvZKCnRXtQ873MeZBy3hXKqKvtr89y3PLUVP0utZM2bgpXHqJuR0VpjgMeEeX0gCQXHlMLBydU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908451; c=relaxed/simple;
	bh=wgHgcm8xmrhSZqBKw4j7YQgDPCGbEX4RDBXbqihHAaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbqmXPtQGAN4MZG0aRjqCWqvAELQDA4GAAh42LZZdrHqA8JM30u5eqOR/8zN7NqGCeqoqBuyn4h0VCTqKqp8baBqaut2xB+RqaAjNBpO5xhnZ0chQFiidPrlu3wvydC/lXJsr8Sru3vHapDbGybGhtvs+FBUtI6iZwPmHqtjBSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z0SLQdhS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z0SLQdhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908449;
	bh=wgHgcm8xmrhSZqBKw4j7YQgDPCGbEX4RDBXbqihHAaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z0SLQdhSwyJDbeiKvQ+HrIpTUxzjvAh0AcbNdueDIZSowjEUHOYjSYGxglQmEumKU
	 KPSvzcVFxC0eFa6W+31sk7e3oWPUQM5zsYoh+h7tLjjxf95WIyt6utg/hWq9YmjqFG
	 QvCNvCCYWffKv8ESM+vDbZtK+WWSCC5Vedq3t5QMNysXlxERskkI4Y7qnhpLaJOEiO
	 ePcbSt60kXV72W4i39Q54yZQkqBXHfqBwAX37QLO5Jx8zSjjnDEEjDHb8UDD5HLiaq
	 /KTLPKC7aMMka9VzSWl3/TYLfAL1P/oBdEO5/CNnzufbLu4RsluuEFixa382hfSP+8
	 zyBpU2nwIjF6w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 25B3817E0CF4;
	Wed,  1 Jul 2026 14:20:48 +0200 (CEST)
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
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andi.shyti@kernel.org,
	djakov@kernel.org,
	broonie@kernel.org,
	jitao.shi@mediatek.com,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 2/6] dt-bindings: soc: mediatek: mutex: Allow #trigger-source-cells
Date: Wed,  1 Jul 2026 14:20:39 +0200
Message-ID: <20260701122043.19612-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 1ba086ad749d..429ea149068e 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -57,6 +57,9 @@ properties:
     items:
       - description: MUTEX Clock
 
+  '#trigger-source-cells':
+    const: 1
+
   mediatek,gce-events:
     description:
       The event id which is mapping to the specific hardware event signal
@@ -119,6 +122,7 @@ examples:
             interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
             power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
             clocks = <&mmsys CLK_MM_MUTEX_32K>;
+            #trigger-source-cells = <1>;
             mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
                                   <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
         };
-- 
2.54.0

