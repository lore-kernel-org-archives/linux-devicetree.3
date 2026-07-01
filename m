Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA7448C8AE
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912958; cv=none; b=MgCBJljw45LEPfaaqn1DbJYv3ia8zg+UEy7k838yUNi2qWhaAHowmJp1865XGCEkbeihRdX8zEPNBQ1tyStRhBnaDltaSnQUf8GY9hzQMYMUdjkQXZWkOQ469OBKbEsuSwxItLd5cWsndi1h1rAWR9DutzxP6vKtnINNWdNxuWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912958; c=relaxed/simple;
	bh=6DJigN4I4SAlN7nMr118xnnj9J041tKQeW4PuGMliso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X0bqQ9jt4/jCXgPAzkKRckI1k8KoQGeFR0j1WxKQbureZ5uCM+y1so6p2HGvHjCdqTAbwPcp4K3xzNaUVGP19czgw3pyBCc+IJI1uWcr/98grcf3zZFDyolfv45RyjMh4vJ2WsYGc46AimvMm88SgCP99jRA2EhxGSsq61puy0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D5XddRBu; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D5XddRBu"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782912942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3U5I5+kmoGCK4gGnO/dG/F8gz5KLK0+aaV/C/LxSk6Q=;
	b=D5XddRBux8wC/vqh8JsVO2WHl/FYKMO1VA+ky2XLT5HZ7+b2xJNyWUgFd/SARHt6jEJqpG
	EYEIqL2hw/+/4QRDuGDt4Ouj92pxKmyMggxphd67XNuX3nQQ3tAOLiQoAQZRnZdF7ZILeg
	ZYgShhd2S17ahPLv/ahTBMjTV1IcfNI=
From: Junjie Cao <junjie.cao@linux.dev>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	caojunjie650@gmail.com,
	junjie.cao@linux.dev
Subject: [PATCH] MAINTAINERS: update my email address for the AW99706 backlight driver
Date: Wed,  1 Jul 2026 21:35:33 +0800
Message-ID: <20260701133533.32585-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Switch my maintainer entry for the Awinic AW99706 WLED backlight
driver from my personal Gmail address to junjie.cao@linux.dev.

Update both MAINTAINERS and the device-tree binding maintainers field.

Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
 .../devicetree/bindings/leds/backlight/awinic,aw99706.yaml      | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
index f48ce7a3434d..60eae50ff742 100644
--- a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Awinic AW99706 6-channel WLED Backlight Driver
 
 maintainers:
-  - Junjie Cao <caojunjie650@gmail.com>
+  - Junjie Cao <junjie.cao@linux.dev>
 
 allOf:
   - $ref: common.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 0dfad67f66c0..8dc6da0b8055 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4296,7 +4296,7 @@ F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
 F:	drivers/iio/adc/hx711.c
 
 AWINIC AW99706 WLED BACKLIGHT DRIVER
-M:	Junjie Cao <caojunjie650@gmail.com>
+M:	Junjie Cao <junjie.cao@linux.dev>
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
 F:	drivers/video/backlight/aw99706.c
-- 
2.43.0

