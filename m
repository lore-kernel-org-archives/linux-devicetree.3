Received: from mail-m3287.qiye.163.com (mail-m3287.qiye.163.com [220.197.32.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7673A4274;
	Thu, 21 May 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351252; cv=none; b=u9fy93ibr8ghxCLCtaZWvri8j2CBVn4lDGnEMBwUyEJ6TYG7rrOfokyr0cQW5Cy5BGcYy/eXt3sYu9872pofsJh39Cm5T/ZQYZJQfnfwTsnpL1KSS/7giBGeDcmPYpV42J3kzDsoRWnLZCkly+pEUY4kGLZCwS59UvqoJuyEvt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351252; c=relaxed/simple;
	bh=du66qZCJlaezefOTzsGFML0++6jPdQb/bElksWgYxfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rE2SIUQMGvP6sI3W+0mXp4qJKJb7PNAbEBxejrbc9knUJvpABlk9YSjp13fpVF1ZSW4AOhKvJM2R+QqcnvcYsDrKozcNPlIRFaPQisODID6xkMfpiXeMjduPdrGESWZtJaKa+Y1CvE+gMAhJNMTUgQnX4xhjDFTRXkMoYSSwmmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=V8Lwnjn7; arc=none smtp.client-ip=220.197.32.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="V8Lwnjn7"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f48aae53;
	Thu, 21 May 2026 16:08:56 +0800 (GMT+08:00)
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
Subject: [PATCH v6 01/10] dt-bindings: display: rockchip: analogix-dp: Fix hclk as third clock for RK3588
Date: Thu, 21 May 2026 16:08:26 +0800
Message-Id: <20260521080835.1362416-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521080835.1362416-1-damon.ding@rock-chips.com>
References: <20260521080835.1362416-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e49949c4b03a3kunm810e96ea5eb82
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHx5MVkwaGB9PHkNOSExCQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=V8Lwnjn7cMrj1VyEvwMNYEZYAWFwjbiIUr37Y03qe2oqY2pKrePyCupVIXuvGVgeQjm6TP+V52YMU7Fvxntne2vvnr1dz0YNYCFCyAsu5z9rY+N2xby/A9FO5ROLc/CRyl+1P7weYfEFtMOpG7ee/b4GGIrPlL3yMgaHU0idvhw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nJs4taRf7N5/wuHuZ/5m8+pCqz6LN5YWjrrLCHGC1Q0=;
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

