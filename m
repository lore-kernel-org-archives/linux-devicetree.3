Received: from mail-m15572.qiye.163.com (mail-m15572.qiye.163.com [101.71.155.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6540E3A7F55;
	Tue, 12 May 2026 09:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579835; cv=none; b=qfZ7XTxNoXHveGlgR0gJN5KTRm1mlatwdpU9YjFFi4jJmK/koEDwVPrfPBz2BXY0xfh06OkaXuwOtTO+SjsdUfFfiwPYfmsqrSynC8m6G4egKdZGaW0p1ldNfUwlA+pXZtafNIJEPVmiJUfbFLd0R70tOu+Tf7tmWzkUltFdRAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579835; c=relaxed/simple;
	bh=WA/CFGEEGaJWPdaxZ9XBEitqQJGpzHyUj9VuHqnBlCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HuQFRdg7EhKO4LqiDRfl7Ep/VjylaDuI+JfKN2Hmm2cPacveV4GcHIJy8PZc7wH8P590UglJecY4aeQ86hDzYueyU/2eJzdjKb1vtNyfbGQMb11hYEkXjkUs/9MJORn6P5YtYzLPnyQLIlVoSCB+GUilNBwVJyVC4yvts0hPlS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=LbU4h/h4; arc=none smtp.client-ip=101.71.155.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="LbU4h/h4"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e183031f;
	Tue, 12 May 2026 17:56:59 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 06/10] dt-bindings: display: rockchip: analogix-dp: Add support for RK3576
Date: Tue, 12 May 2026 17:56:40 +0800
Message-Id: <20260512095644.1946084-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512095644.1946084-1-damon.ding@rock-chips.com>
References: <20260512095644.1946084-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e1b9e4bfb03a3kunm05d2ddd612905e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTB5NVk8dTkxLGE1PTR5PGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=LbU4h/h44S0w0U3+jvXhWob6RXY+nkx/PXRHtS0tmLLZF02rX85tVOR1FRdVHkJQbnqjutznNdnEysDMjcuaxRSG5Vp8/sSagtyQ6FyD+5+0jB3fdV/4If4D4jCS/fLNjrKxuOlXJuDFEmU+JDmaKo2Swb3sx1cGPgIBzhVscZw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=u3Ub0MOcEoV/P7hRBpGOubTy1PBdqYsLj3Tc5K+7Cwc=;
	h=date:mime-version:subject:message-id:from;

RK3576 integrates an eDP TX controller compatible with the existing
RK3588 hardware design, reuse the same binding configuration directly.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Split out a separate patch to add the "hclk" clock reference.

Chanegs in v4:
- Modify the commit msg.
---
 .../bindings/display/rockchip/rockchip,analogix-dp.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index 0651853a7a5d..7568044a5b2f 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - rockchip,rk3288-dp
       - rockchip,rk3399-edp
+      - rockchip,rk3576-edp
       - rockchip,rk3588-edp
 
   clocks:
@@ -70,6 +71,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3576-edp
               - rockchip,rk3588-edp
     then:
       properties:
-- 
2.34.1

