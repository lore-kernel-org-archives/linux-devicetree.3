Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61C43947A4
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239075; cv=none; b=VVMk323F+p1Bmv7VZ4GvbpR07SgzFojyJ+vxItlzrQeHN7IobYaKk4nPBVKKpAD49jIZ63d9zwR4vzpRqSusHZE3V3pUVI8uUAqqiwZmDNJ5j62h8L/kqp0psavWyvNsq73jlC5L2RlLwX3MEWjTmtzuKE8SEFiaaJk+eEym1/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239075; c=relaxed/simple;
	bh=C7OdMfskX1yrAh3+I7YrVhMxB61DSFtW1LvR/WZMIrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Seu6xen2mNb2s9mdrBP2PVbzucycRmsY6ht0Gom30hfOkrbMLOjpdE9YCSEuJrGQHHIxON9DXJqeC/6uWNfuHttqgqDgD9eMgwdYjrybo7j8qwHblahUcHmm2u3bMx8Qujvx+5Bf9iDHlGgA7l3zC9qN7o0RXO+czvcs8k11gxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITVf5MUF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITVf5MUF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d7645adbdso1110226f8f.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778239071; x=1778843871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39w49gZKpFRzhgKjJD0rTXzt/7rwWxh4HEQyrYnkNBo=;
        b=ITVf5MUFk40pa11mzI8mybuavlrncSTBVb+JMrRh9ybkpSXDKzIJhJpZ4pkP0b8vqy
         rbt+duMoCMr4Z1xrYmcCKcLMV18jsJa2C/cRHFsIDfIN+lwtOoyZfRYuRqqHpOtGBBQm
         nlSFJlYK5T50Z0HMY9ldQglgLLH/fd+td6DnWtmJduqOazNHl5nFk5jo2+K3XYTJQfKp
         EqcrGo75KO264I9OQWwchX0pFrIi5sd7p3na8T3mm9pK7PG7X7P5M8Bhg1R6+BvAfPj9
         V+PV3JqwtE6dSEv1Ahf+R6npYO3n+T20dekyW/MmX28/NVgh29mL6WdMxmCzJ42EhqEb
         4vWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239071; x=1778843871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39w49gZKpFRzhgKjJD0rTXzt/7rwWxh4HEQyrYnkNBo=;
        b=CMD5oqXSWv1eMMo/TQF1/Hsm3AHdQra/WCtMfv3WIRjWqyFFRCtyHfJ43CHIqTm6OT
         k6eDwOVZQgfWeVu78E5LwTwV3+YhgrxSx+wSQVT189ulLDQqjUrlahBMEly8/gX885SV
         XuZ3CYErUDXUsctX999sQ07vn7x13yD80GhPTtTYiCY0TftzwWob8EOsqVMhpKQr8sLr
         Mo4C0INBzeWXX59UFxK+xm7swr+9OtvpCJYNai4nOFyCxQ67QEQc7KkvPhrutoKDanrb
         qAVn95y5ViIUWdCnCpQhp4S2favf18EdsW2eip5o7aJoGQxRym9duhCApixejwRNdv3T
         KRZA==
X-Forwarded-Encrypted: i=1; AFNElJ9BurMMDoAeNsoF1/qkQOZJ3ZfN2Vc4QWCPBwfqVTwdeQJ1rYFBsNbDi1C2pv7ksJsdDltPbfaMfaq5@vger.kernel.org
X-Gm-Message-State: AOJu0YyZGDcjIYD/fvqmIT+MQw+V/d5MHNMHXy+BcUhe2SrvrDmoUhxI
	IBzdinRBdoHYnjonnv5ftkbCaNKeOOhz1R/PQCnGqQ8kQIkzr4bZ+FN8
X-Gm-Gg: Acq92OG3UEDzRnKetOBbiB7W+wO777e3qEQqdAu0+ecnmnp6v2E+m4OQ/nXUqPblXiT
	uLONFQ6z7iKGhrXTLblEJrKollTbkc0YZi0aJ80Txd2CbKYVQ6eXSZjLAag5KqHKJAyVXmqsPLj
	H/joBjFtEo8iKge9QBUhMFsbrhq471ve93lEEq8ZPezmGtrmdik4GglmhLhSAgTmjWKprpBRqHk
	LCeCYrAgR02m9kF6P6hM/QskvqFKp4U8BM+A7IvjVLU9IOCPaFSPl+j+jfauKfC+n6T8itoQbqd
	U7l8KwDi/1XjLb5bpCtsVeoUyreqrQCmIqutJPruUyh8QWhRYZsi3qa4LTK2XaqKQTR5lApK7SZ
	d/gF7EjXtMPFm+1547s6Z4xwkpNI7kbqSA+Y2dD0H5/R0orz4Q2K2uoJ8DSmYOyEkY3JepUOjWY
	Lo+rqCx4+VuhsTjmx7UhG2r4SyImBBX6StazUB9Mki2HC7cWAJvB4Qd15TBBSngDq4FQL/wDz9e
	JDfb/cSo+GCXYgEGpKoDU/pf/0sjn7B9Ci//WHc5xmcTsTV
X-Received: by 2002:a05:6000:40c7:b0:448:7420:9ada with SMTP id ffacd0b85a97d-4515b0570fcmr17977390f8f.9.1778239070587;
        Fri, 08 May 2026 04:17:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:74ae:919a:e57c:bd9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454916df968sm3535563f8f.25.2026.05.08.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:17:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/4] drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
Date: Fri,  8 May 2026 12:17:42 +0100
Message-ID: <20260508111744.771659-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508111744.771659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260508111744.771659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the DU CRTC initialisation to request the reset control using
devm_reset_control_get_optional_shared(). On RZ/T2H SoCs the DU block does
not expose a reset line, and treating the reset as mandatory prevents the
driver from probing on those platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v1->v2:
- Added Reviewed-by tag from Laurent Pinchart.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 26b95153ce88..48065f4952a3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -380,7 +380,7 @@ int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
 	struct drm_plane *primary;
 	int ret;
 
-	rcrtc->rstc = devm_reset_control_get_shared(rcdu->dev, NULL);
+	rcrtc->rstc = devm_reset_control_get_optional_shared(rcdu->dev, NULL);
 	if (IS_ERR(rcrtc->rstc)) {
 		dev_err(rcdu->dev, "can't get cpg reset\n");
 		return PTR_ERR(rcrtc->rstc);
-- 
2.54.0

