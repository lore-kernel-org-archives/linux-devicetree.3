Received: from mail-m82123.xmail.ntesmail.com (mail-m82123.xmail.ntesmail.com [156.224.82.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA94A372EC0;
	Wed, 27 May 2026 02:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.224.82.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779849887; cv=none; b=Z7eMAOhimwbL/3tNx/2l40hOYnHuLtoiSrx965NUxvdMY3LFUKMJysAjpS/JFntzYuDYQxzDe4BnHEbY23LEmUYdpZhB4g1i3NgocFPWcrhmhTaWJxQiIMrk9UhbTEL5kQLFxzAZhBaTNgNooXCY3bIC3FxSdMM942VCQzjWHTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779849887; c=relaxed/simple;
	bh=rXPzhdx3TNyffecCGe0qNpwi1Rwwg/sWBvYXjRoCFd4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kHB6MJP05G41K+QaR89joKci9fytGWwUvHGhd49zABmB0CHis2Ekvh60URJKb2oVvnVwwxKmiFb7re4wNRvbTnAxJmWKajdjNcww1fJ877oKVWCRAR/aqNoo51UPPDKCfZUC32O7NMfiUflqOgfBd99mfXIH7nmFtGhxnia043o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=O8L6ZY4m; arc=none smtp.client-ip=156.224.82.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="O8L6ZY4m"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3ff559ad6;
	Wed, 27 May 2026 10:44:36 +0800 (GMT+08:00)
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
	Damon Ding <damon.ding@rock-chips.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 06/10] dt-bindings: display: rockchip: analogix-dp: Add support for RK3576
Date: Wed, 27 May 2026 10:43:32 +0800
Message-Id: <20260527024336.191433-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527024336.191433-1-damon.ding@rock-chips.com>
References: <20260527024336.191433-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e6751d59603a8kunm8053ce91bcedd9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGktLVkJMGR1NSkxIHhkZH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=O8L6ZY4m4YLl0t54JYHqNqglRt3olotXvIrU28Lrqq/NIR6LtGo+G8qi8AzkcOORAJvMmg0cWfS8xgzNYL/y1wJOQJM/uhogm/3qAj5xTjQ9yqaPf4baNiHwcDHG9GBqT5nW4ttMp8VtkFUPuc9w1Ij5TTkG6Hd4fKfNE9vLy3I=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=L7BWWruHRLZlJcC+r2h5wBipdDLTE8Qif+DZ/KL3zR0=;
	h=date:mime-version:subject:message-id:from;

RK3576 integrates an eDP TX controller compatible with the existing
RK3588 hardware design, reuse the same binding configuration directly.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Split out a separate patch to add the "hclk" clock reference.

Chanegs in v4:
- Modify the commit msg.

Changes in v5:
- Add Acked-by tag.
---
 .../bindings/display/rockchip/rockchip,analogix-dp.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index 1ef1d56ef6e2..6548f157fd96 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - rockchip,rk3288-dp
       - rockchip,rk3399-edp
+      - rockchip,rk3576-edp
       - rockchip,rk3588-edp
 
   clocks:
@@ -99,6 +100,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3576-edp
               - rockchip,rk3588-edp
     then:
       properties:
-- 
2.34.1

