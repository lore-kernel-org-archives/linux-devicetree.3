Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDC239FCC7;
	Mon, 20 Apr 2026 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689686; cv=none; b=a2E+5zOedqIoVoXnC3a8OoJCiInY7JBJzlHm2qYwI2jg0jxQeWzU+Nbrku2k60/k87/ceIvIZWwSv2TOxm3Xp8sEuYDWDgVdxvbBslYLdycxsO1vy93aJ5jGgmpRUtWH4/kKm8Uyvsr3aV2fNLz0VxPtb6pxonP0tFIwoAdIghk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689686; c=relaxed/simple;
	bh=pkHYfXpvclqEJ8daziW3Dv34yzf0Pm9I5IrucwaeY60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wzo6wj+ehsLOYqtSJ4k+T72xTEa0msIY9pA5ZHvNVbmfSsfNKSbbl/8/Gx7tyWG30SSHgm85/UR8730GnQu/0xog7RJgqJLlLtDlrAPwMUCqPNOuTJeg0jox2ST0aVXmFn5dUXyuzrmmbb/jJF7mViqZMYvDqk/U0eucQYVNq84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hcX0kIze; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hcX0kIze"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 414CC2B57;
	Mon, 20 Apr 2026 14:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776689584;
	bh=pkHYfXpvclqEJ8daziW3Dv34yzf0Pm9I5IrucwaeY60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hcX0kIzeHJPqq+bdxH6vuMZV/5Fqk0oaBjfvMvD11TFgqMTmWPP3D/Qni3wUvl8oh
	 46KlH4DsRpVYQ4kgVr/T/tgLNkAMSDKRTEL3IzUQW+go1FnhrknJYg/ujt1kem4e14
	 9dQX+IidMxqWdsaTcGa0v9jF55R0/YBtyXsFIKg8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 20 Apr 2026 15:54:13 +0300
Subject: [PATCH 06/15] drm/tidss: Remove extra pm_runtime_mark_last_busy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-beagley-ai-display-v1-6-f628543dfd14@ideasonboard.com>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
In-Reply-To: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=713;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=pkHYfXpvclqEJ8daziW3Dv34yzf0Pm9I5IrucwaeY60=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp5iIFk/3ZtYJiRZQy+gQj1AkKOh0XebZylKJX1
 kqy6mxF8tiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeYiBQAKCRD6PaqMvJYe
 9WJhD/9zKPK6I0cpMtb6xyjqzCbLCtxPLZsEvRbOwj8SIStgYripUBMf0Ib6O1EBb73bFWNvC3I
 gyR3PnKQsddT6j/+SW/SVd04FpqlrrXc1U8kPWA32E4lufTOPy/zBxAbEki2YScso1zqPiP0kp7
 YOdSlB+gq4E9RCUC27lEONeM7IL/jEXGrYUXBkLyDj566aHS7lNnJMf9FhCfS8bXbS92BPOcLRQ
 gO+xfAjxgOh9KQG/76LdTPcArSYTh7BgemefE4uEbvQs1AOK1ig5q3i9RXDgw1CeL5/Rtzl7dlC
 wiQBSqRZJ/9VpTA/cv2NQgh8C7fxJlb0AH52EjUra4VQd4qse6HHpZYj/pxxib5n0v+yZ1EiEhH
 z9wbH75pRKUD59t09QTdA4cgSNfci9jiwqfeQ+9RaSqm+h3Hl9SSE2wH20iCfuUkZuialzWf4ic
 SIOISc0iCSTbopyfqBm0vjAGsEPHGfZ4M0EYBo9pRv8VVxVXq5sohLFhxe86iXDDNoiFQb1ZyWQ
 VjSdilj94IzIS0L9aOHqTahVhiG656mDTTNSnmdFrQWJmK7hkSIVyKzQ91LtgQfqG6zdIizMIo8
 ranSO/QGUNJsQA8XNl4zDIFsYoV6trk8A8nAegrzMCTJlZhxUDkMgGzsdymF29nLmrNvjlEO74t
 xVd99F+UZo4fApw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

pm_runtime_put_autosuspend() calls pm_runtime_mark_last_busy(), so no
need to call pm_runtime_mark_last_busy() explicitly in the driver.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 1c8cc18bc53c..5cb3e746aeb3 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -42,8 +42,6 @@ void tidss_runtime_put(struct tidss_device *tidss)
 {
 	int r;
 
-	pm_runtime_mark_last_busy(tidss->dev);
-
 	r = pm_runtime_put_autosuspend(tidss->dev);
 	WARN_ON(r < 0);
 }

-- 
2.43.0

