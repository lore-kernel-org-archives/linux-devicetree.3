Received: from mail-m49219.qiye.163.com (mail-m49219.qiye.163.com [45.254.49.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170F1A0BD0;
	Mon,  1 Jun 2026 06:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296981; cv=none; b=iOfJZd6I7jaLAuOx85TTZz8MKIrlCiofYfVp1HImhp4sdzEeqAeWFUczUvesJdnhmzuZR5PGSo5gyVGQUldLcpXJ2vzUQOX9KGH3SN0OHtFjpyeE/mhoYIK3uST64QMDXts8Tx8S1SzFKFzsISkWhrnkA8CRVrjI/6m321ugj+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296981; c=relaxed/simple;
	bh=yntiNHkuywyx2b9C6p8W5/vqocfDIG+OonI/dNtwDqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JnUcgdDEY2koghEbMUQ6bXnb/it8ftJ7xuWsXK+jt9xhmpNm3L1FMpjTjljkiM2hnsSk77d3ab5KM1oIDSh7/wqAHCA1MC0ojPx4l92pVsZo6hZ1xqZu3YQ+3om3cqU8pEfz9JED1OmFvuDIyQLHHnJCozc31JjsHoozNdxO1/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=B3K04ss7; arc=none smtp.client-ip=45.254.49.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="B3K04ss7"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 408ded050;
	Mon, 1 Jun 2026 14:51:05 +0800 (GMT+08:00)
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
Subject: [PATCH v10 01/11] dt-bindings: display: rockchip: analogix-dp: Fix hclk as third clock for RK3588
Date: Mon,  1 Jun 2026 14:50:50 +0800
Message-Id: <20260601065100.1103873-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601065100.1103873-1-damon.ding@rock-chips.com>
References: <20260601065100.1103873-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e81f34a4803a8kunm111da268257de7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUJKVklOQ04ZTU9JTEoaGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=B3K04ss7d3MgFXSvuGvot9Gb/oUqpM31+R3q0K3kLtpUL5JQu9bIJk/XRzlKZgSdSb1KQ7zGe1hd6mXi55LSlwt9HfAZ+HPZtpDSMf5N62YRUc8R1U6ldjGgoj+1TqeX/1FGMHvEfcApST2NQsTFIrplozIf/rb9ysRN+w11/Ug=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=JCOiC5xHahz6m4GJmafwimWE7DoGsWs8/hxxzpCEUwk=;
	h=date:mime-version:subject:message-id:from;

RK3588 eDP controller requires HCLK_VO1 to access the VO1 GRF
registers and enable the video datapath.

Previously, the clock was enabled implicitly via the 'rockchip,vo-grf'
phandle reference, which allowed the eDP to work without explicitly
managing the hclk_vo1 clock. However, this is not safe or explicit.

To make the clock dependency explicit, enforce per-SoC clock-names
requirements:
 - RK3288: 2 clocks (dp, pclk)
 - RK3399: 3 clocks (dp, pclk, grf)
 - RK3588: 3 clocks (dp, pclk, hclk)

Do not reuse the 'grf' clock name for RK3588 because it represents
a different clock with distinct control logic:
- The 'grf' clock is only for GRF register access and is toggled
  dynamically during register access.
- The 'hclk' clock controls both GRF access and video datapath
  gating, and must remain enabled during probe.

Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Modify the commit msg.

Changes in v5:
- Enforce the correct third clock name on a per-compatible basis.
- Modify the commit msg simultaneously.

Changes in v6:
- Expand more detail commit msg about using hclk instead of grf clock.

Changes in v7:
- List all valid clock names at the top level, and constrain the clock
  count for each platform with minItems/maxItems in allOf.

Changes in v8:
- Fix indentation to 10 for enum in clock-names property.

Changes in v9:
- Restore the explicit clock-names for RK3399 and RK3588.
---
 .../rockchip/rockchip,analogix-dp.yaml        | 40 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index d99b23b88cc5..6643889f2a9c 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -26,7 +26,9 @@ properties:
     items:
       - const: dp
       - const: pclk
-      - const: grf
+      - enum:
+          - grf
+          - hclk
 
   power-domains:
     maxItems: 1
@@ -60,6 +62,35 @@ required:
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
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3399-edp
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          items:
+            - const: dp
+            - const: pclk
+            - const: grf
+
   - if:
       properties:
         compatible:
@@ -68,6 +99,13 @@ allOf:
               - rockchip,rk3588-edp
     then:
       properties:
+        clocks:
+          minItems: 3
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

