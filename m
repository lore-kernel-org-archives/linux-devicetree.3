Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507983D5648
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050727; cv=none; b=LIZo609tUvFySqwbZROWgRKn4+TlHC4+hw30zjoY8HfTC9E1/gtkkGe5NKUi7j8Y0uzFZYydJPDDMZ1Ctngmp1HfcexXjy/VEIdKObdLf4mq0MjyMISboOnBaZH0K3mN5ThOl17fELgsbErTpCahS1wPShY+oUumNhQqnRS4bNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050727; c=relaxed/simple;
	bh=g9m9+6NRdwUwaTmmaAQNYjvkbYeWVUTBiijRvF+0Fis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G4gzO2bvfFD5qo/Q8CSKpW7aeLDD1IFNRTZ6iOYugPx3S7Vb8evSUowiuDRzhV40R5sOpRB80a4eOom67HI+oXjz7GK57PthFJz64C9SWvSI/d6+M3jXUe6eXKKTixPOffFD+VrQbkMnhtxGycWmdiLXb0p++7PONzIoM+WuHi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtiKI2fF; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtiKI2fF"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-836ebdeb969so6103828b3a.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780050717; x=1780655517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wnSFbHu6NNjWF/TbmbEaSgsNm0hwZHiTpIBFqP4Jso=;
        b=WtiKI2fFtQDF+4yy2sm1rnRL/Vzohtamxx5RomU4ffGPiyNAEWK8oQuhvUA9HPczXi
         Yk89llKU0Boh7FK6eP0aXBVV8K9pdZi9S5Dr/UcC+URDehQr4TIC2CV93Kj61c6x/ofQ
         yVv20cN22HxSsU3YJFuEppRcfaSh1flWUu28WcDLNXUr9PvEqtGprXgCzXfNeE+2Ughd
         n6kYjR8cBQxyJx3WSa22wraay2Ej94yjceuTJoIHmuPo9T6MxOzzXgqQyORC0Gsx1a60
         FwkupaFdsYysHTrODhn6IE8Y8EUQ5+Y/ihnnm/w1JDskYrqnXJ5lCPpTwaH0pqwoQx0f
         pKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050717; x=1780655517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1wnSFbHu6NNjWF/TbmbEaSgsNm0hwZHiTpIBFqP4Jso=;
        b=IHqmhN0c3p3l6tX1BIi4rLN0vpy4Hz+WPn4VoxDWbqnAoxcEIUhmVfBjryBdgiD0Of
         V952YG4kUJF+FZDdlmuZ0FkptwXVhUtHZDMdvPikV8Wv4kwsGhHuNSt43ZVJoe0Ifu0K
         /swHGV6f8w9/C52Iz8DgyCd2qyu0eTNDmFJT7v+s0+7zjf6BxDtTYCReFetM0BlHe5ec
         VRkOOdURhSdGdExFCQVyhWN6qKc9EjXiTkRthzMnVXkcn6Qu41v3/xJdERd8P2GDqw7s
         qrExShkTyKMPQWFMUlUEgVQXy8grbZJAoNWmPnDgt0HDNlIjIPp8Zy5ALkQneZCOqHFR
         3G3A==
X-Forwarded-Encrypted: i=1; AFNElJ9HHtOdqnvlFkasGi4ZLaZs0H1tR02ROQszYvOHr6vOSREkrg+HwWPUauIdYxMdpHC2aswQP7rqWImK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6dlhPg5+EOXx/8lor2rslZhihDB++WuUV4pg+HZ4eC3ICeMUC
	IQ3oySLgKgm3hX/TviyQtNGoKMuJBkIiWNtStQeI/IY2y+VJiGwFjBbC
X-Gm-Gg: Acq92OEX6/F54KC17dYUuWPyjONIQtIXaRAAv7n6UCl41nn5uFwHm65Dqhw+wkoZaa/
	bBX7osRu/0wvxXmS9TXccnIJwnJMuhnFcnlMs6RB09E89PjoJXcQMoxoMtoGYffhF0CL3QxyTBC
	7s7/ClfJgvihhS3cr7tMbl/Py+b3cHVmqyMasllMReRAmAWsFc+n2yAJrSUmerVEt0WR+vpb4dJ
	FrLMtCf0IPCDNPVtmDYmeWzk6Wep9Ee+usb/fOtFNiDEKccrZnPa/mxAvoN8qRKC+3Z6kgZl2Xk
	JjLvVO6AGYJVXySAEA5nh0/vi4lwvIBAgo0NBvvrouBY4zYGvzhI1z0H0QSfDCo12DgrltvYEKE
	D8RLR+Pg8IbBG5+CdLT5sitXXGricEAHTtuG5K+1Jfq/Mhr18yDre7om8JQDXvyuS7gIpl784TG
	RhR1EdGCGJ/fVUBZ4J2k6ZqR0+Cffv8hdpqnb0i2PgzhDPlyllktp3oBhn9927/yUDA+mCyJq1G
	0gj/63CmFylNwmeKG8hDg==
X-Received: by 2002:a05:6a00:6c9e:b0:837:666f:8fcb with SMTP id d2e1a72fcca58-84212c38b01mr2540661b3a.5.1780050717326;
        Fri, 29 May 2026 03:31:57 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b30711sm1418512b3a.16.2026.05.29.03.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:31:56 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 29 May 2026 18:31:51 +0800
Subject: [PATCH v3 1/2] dt-bindings: display: mayqueen,pixpaper: add
 pixpaper-426m
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-bar-v3-1-5c2ac1c751ee@gmail.com>
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com>
In-Reply-To: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, LiangCheng Wang <zaq14760@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780050713; l=2115;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=g9m9+6NRdwUwaTmmaAQNYjvkbYeWVUTBiijRvF+0Fis=;
 b=yce1xB25ZrB2pve/MPW9tT4u0W4HKp43LjwEY+8Tjlc1RJexIjjLBY9jnb7BH2S5Mv6viRWtY
 WApzVgwHHkoDNMAznw7y/7bg8CVQRNErpMd/Eb1mYxnGlHNCjHJHNO7
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

Add the compatible string for the PIXPAPER 4.26 monochrome
e-ink panel to the Mayqueen Pixpaper binding.

The new panel uses the same SPI and GPIO properties as the
existing Pixpaper panel, but it is not software-compatible with
it. The 4.26-inch panel requires different panel-specific
initialization and update command sequences, so use a distinct
compatible string.

Document the new compatible string and update the binding
description accordingly.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/mayqueen,pixpaper.yaml      | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
index cd27f8ba5ae1d94660818525b5fa71db98c8acb7..68a6157114604a8308259191e55d1e2d15d76c11 100644
--- a/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
+++ b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
@@ -4,22 +4,25 @@
 $id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mayqueen Pixpaper e-ink display panel
+title: Mayqueen Pixpaper e-ink display panels
 
 maintainers:
   - LiangCheng Wang <zaq14760@gmail.com>
 
 description:
-  The Pixpaper is an e-ink display panel controlled via an SPI interface.
-  The panel has a resolution of 122x250 pixels and requires GPIO pins for
-  reset, busy, and data/command control.
+  Mayqueen Pixpaper e-ink display panels are controlled via an SPI interface
+  and require GPIO pins for reset, busy, and data/command control. Different
+  panel models use model-specific command sequences selected via their
+  compatible strings.
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
-    const: mayqueen,pixpaper
+    enum:
+      - mayqueen,pixpaper
+      - mayqueen,pixpaper-426m
 
   reg:
     maxItems: 1

-- 
2.34.1

