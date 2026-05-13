Received: from mail-m3295.qiye.163.com (mail-m3295.qiye.163.com [220.197.32.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FD637F746;
	Wed, 13 May 2026 07:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658587; cv=none; b=G326URDgqM+NACogMZD87v7Nicj+E1H5GVRVfzLFJI6SnWxj/u1rsJsE4ad4c5O94EPd0SvyqnYxopsFE333QmpF0r4JuBSpuLlQvqsodfKZTgrtOc8DPbJSLKgEKacPAFDqrBiDbYw/PIVQnmp0Lu5rUNqqBZCGrBGeofuxMn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658587; c=relaxed/simple;
	bh=uiBaeRuwX6d1yQNRGSrErjpp58MBZHGk3N9rMmzc5rU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y2u+8TuLXuityk3i2r2xMHkjtFHwcbCbOeMRi+v1KV0yAwdJDA/RiANJVkMG4p0geVMAvINWR1sobLYXhce1/6uqAKF8kqn1gf0/jCDveRDp6pN7qormoSQbtVJn3zkpR5DlSoNBD6iPWpdYQygjetmwAiNKhXvyiz+Ho13BSKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ffmp9B74; arc=none smtp.client-ip=220.197.32.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ffmp9B74"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e3a94ca1;
	Wed, 13 May 2026 15:44:24 +0800 (GMT+08:00)
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
Subject: [PATCH v5 01/10] dt-bindings: display: rockchip: analogix-dp: Fix hclk as third clock for RK3588
Date: Wed, 13 May 2026 15:44:05 +0800
Message-Id: <20260513074414.2053435-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513074414.2053435-1-damon.ding@rock-chips.com>
References: <20260513074414.2053435-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e204b43e603a3kunm7763bb98560af
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHkMZVhpMGUlMTktOHkMZTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ffmp9B74H7E8xEHpgZzT9wQNwDiZK7mcB+pVe2pSNKi40b/m5SL7H0gRzofUwoIjchYYCBizY6++3oKmXwaGG6zah1L5SJEaRgz/wgmf3DY3+YmFvA2sL6kPhSVpH8Sx8D+DUO4lClnQZrC+ESW7JowwDJT1B1X+VNM6abamOc4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=s0H+jTBh6HzhJTEMD0zzMObmLU//UpQjlUmHCRbCXx4=;
	h=date:mime-version:subject:message-id:from;

RK3588 eDP controller requires HCLK_VO1 (video output bus clock)
to access the VO1 GRF registers and enable the video datapath.

Previously, the clock was enabled implicitly via the 'rockchip,vo-grf'
phandle reference, which allowed the eDP to work without explicitly
managing the hclk_vo1 clock. However, this is not safe or explicit.

Enforce the correct third clock name on a per-compatible basis to
standardize clock requirements per SoC. This makes the clock
dependency clear and removes reliance on implicit clock enablement
from GRF phandle.

Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Modify the commit msg.

Changes in v5:
- Enforce the correct third clock name on a per-compatible basis.
- Modify the commit msg simultaneously.
---
 .../rockchip/rockchip,analogix-dp.yaml        | 37 +++++++++++++++++--
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index d99b23b88cc5..8001c1facf98 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -23,10 +23,7 @@ properties:
 
   clock-names:
     minItems: 2
-    items:
-      - const: dp
-      - const: pclk
-      - const: grf
+    maxItems: 3
 
   power-domains:
     maxItems: 1
@@ -60,6 +57,33 @@ required:
 allOf:
   - $ref: /schemas/display/bridge/analogix,dp.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3288-dp
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: dp
+            - const: pclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3399-edp
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: dp
+            - const: pclk
+            - const: grf
+
   - if:
       properties:
         compatible:
@@ -68,6 +92,11 @@ allOf:
               - rockchip,rk3588-edp
     then:
       properties:
+        clock-names:
+          items:
+            - const: dp
+            - const: pclk
+            - const: hclk
         resets:
           minItems: 2
         reset-names:
-- 
2.34.1

