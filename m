Received: from mail-m3290.qiye.163.com (mail-m3290.qiye.163.com [220.197.32.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D59626ED25;
	Thu, 21 May 2026 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372494; cv=none; b=Hc+v1SUBvTMOeMNgFrQymZlP/ymMj+eCf//QzBKUVLnW5+blNL8r4L1tCC1xZR62jVhL0GDaf20SaXTIAI5zVPalD6RJhtmiD3u/ZaB/mxdJPlmQUn3kFr0wbOwOWn7B//GeQ+fUlN7WF/srUCkXG52p7Vqbyfzqs8hf3npkoQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372494; c=relaxed/simple;
	bh=PzCfdeMgxHZUAy6GyRAEU851bWonkK4ZMObu0m3qBQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TMot0GFubomhXyZYoh5JKK7h7iPZA5Ow0y8uoclm5xu3cZR/kMW77nQvQjYxBCK2M1cosLknms1kLx9V1bcRkaattesncm9HJxVmDVEvLMuWPE72JwFIj/0KeqXgR0Gs/D/asbH8s3gbkJOLgW2yApb6DKTLBdWJlQWMuo2cCsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=hqdjcljG; arc=none smtp.client-ip=220.197.32.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="hqdjcljG"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f5009432;
	Thu, 21 May 2026 19:45:13 +0800 (GMT+08:00)
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
Subject: [PATCH v2 1/3] dt-bindings: display: bridge: analogix-dp: Add data-lanes support for endpoint
Date: Thu, 21 May 2026 19:44:57 +0800
Message-Id: <20260521114459.1394264-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521114459.1394264-1-damon.ding@rock-chips.com>
References: <20260521114459.1394264-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e4a5a9f7303a3kunmad9184e677768
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGkJLVk1DSEkeGB4YTE1IS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=hqdjcljGsxyTmfX06y3C3Se7JNYUa+1+U/AnCJYEDwzLTCpDOT65czKGEl1ajeT5UUJVHGeGEaCZOT8rG6eXZGp4wldTEtvfJpmFZiJWLK5rpYSJjz3ceQxw1sNTIjH3lYKxznkaWp+TX4cBZxcT70HqGZOwHTE7k97Tu7CU8O8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Xu79CGy7oXgHkId0a/dytBXCz0cn2ptJALLOPB88Bf8=;
	h=date:mime-version:subject:message-id:from;

Add data-lanes property support to the port@1 endpoint for physical
lane mapping configuration.

Lane mapping is mainly used for below scenarios:
1. Correct PCB lane swap and differential line routing crossover
   without hardware changes;
2. Adapt mismatched lane pin definitions between SoC and eDP panel;
3. Support multiple panel hardware variants on the same board
   by configuring data-lanes in device tree only.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Add lane mapping application scenarios in commit message.
- Remove redundant deprecated property 'data-lanes' for eDP node.
- Update port@1 $ref to /schemas/graph.yaml#/$defs/port-base.
---
 .../bindings/display/bridge/analogix,dp.yaml    | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
index 62f0521b0924..e34fdb21adb4 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
@@ -42,13 +42,20 @@ properties:
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description:
-          Input node to receive pixel data.
+        description: Input node to receive pixel data.
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          Port node with one endpoint connected to a dp-connector node.
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Port node with one endpoint connected to sink device node.
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  enum: [ 0, 1, 2, 3 ]
 
     required:
       - port@0
-- 
2.34.1

