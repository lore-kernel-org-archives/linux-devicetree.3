Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8778E2C15A9;
	Wed, 22 Apr 2026 21:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776892104; cv=none; b=o7zkZpiY/PSgtYS0jkaHNEN8iJiuMOFOd6DaOwVgVhfQhfLWmPTxMdQoNvTPE+GnotMmM2DzDV7CjKi/b9i2buVaE3G5TFe3olswaLwQhMhLN+1XH00+XmNFf1qPM9tw5cubN2qxMc62kTYucg0oCaz4pLsWq85i5FjaoSxOM4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776892104; c=relaxed/simple;
	bh=FN+f0G9nCsY/gUP+tHl5fE3xiPBFKSs+iMJGsXMspaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5FA9MZNZfEjLoNQL6gP4P1KDwM4DbNHIV7vgZYK/zaU3TZ5Y+MMyt2DggSm5/VM6MSs8gcs5IrhW9Z+fZfG7mukAdsooNspr5OHP+lGIOC9Kab2J5bq1kVhm+P4K45U8HzX57ENNDY/6ZOYCY+rNFA6GNpwoxgXVv+7phGrd+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=HQQh5p+t; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="HQQh5p+t"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6672114A90;
	Wed, 22 Apr 2026 23:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1776892099; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=HjmnKNM37fm6w755PgZH/lD1zoBOPUZWIJ4A0qH84ws=;
	b=HQQh5p+twdo0EV3++xC4i1o9q4rND9TiRedEge3SUvimGZxWT9GrPXbl+5inMlr3t6kH9/
	lAIFw1TOyw4il3ZZrGTR5CmHiKoh1bVcKDEAlzTuOcu1OHpzptsl4PwaV3/Gkfu6QxC/HI
	gfLu+HtmMC7LsNmYTpGPysH4hDWae9tUqN5VmLB80KFGU0OuY87KDQWy0vFvhkzcM2y/UY
	88377k4Pja1Sil4fxjXFKjdscth2f9T9ean0lQDEJl1h+ca0UvP2sv6OOfG+NH91Rs2Uj/
	jqlYQWLxsWZDYpXKGr95vJEmYkDcGrL+yhaUzQsPNxTH2si1zjRfCL1jhiMroA==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Displaytech Ltd.
Date: Wed, 22 Apr 2026 23:07:23 +0200
Message-ID: <20260422210806.80948-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add "displaytech" vendor prefix for Displaytech Ltd. .

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: "Kael D'Alcamo" <dev@kael-k.io>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7ba..11c55b5df0e4c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -437,6 +437,8 @@ patternProperties:
     description: Diodes, Inc.
   "^dioo,.*":
     description: Dioo Microcircuit Co., Ltd
+  "^displaytech,.*":
+    description: Displaytech Ltd.
   "^djn,.*":
     description: Shenzhen DJN Optronics Technology Co., Ltd
   "^dlc,.*":
-- 
2.53.0

