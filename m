Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3083BB13F;
	Fri, 29 May 2026 08:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044463; cv=none; b=t2ymLxNG8mhcFumDxbQ71UhxUWN01bD9VQtr3iHGfaoS9om8hs7h/q5K95fGx+L48kwk/0WFKwIo5yb2P4bgE3uMi/uvrrwaXfUxGHJzr5b5wpzzIqc+B1pJVjGLiDXROLrv59cjwvX1ogk9DGpmVfOKy2Mqyb87vATbl7H/hcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044463; c=relaxed/simple;
	bh=7Kq5ctr2zF2W69THhXrq0QBJ23m1uyPy7zIOXMhkLEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4tvsWGvg4AdLFhNdetErF6FZIrdpU9X021p4VSoH3c1ElGoARS7XJU5xaQQ+QgvRHrddhCybDsVTVTM2blL+AMmmOePhA1NKtZ97+hwXd5tT/11o0szXA2RGWdNjqrwZLtdTZExqh1r0za8RYR/e5qeFLc2DFy1ggusUKidYpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eZG/ZNXA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eZG/ZNXA"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B84C4227C;
	Fri, 29 May 2026 10:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044421;
	bh=7Kq5ctr2zF2W69THhXrq0QBJ23m1uyPy7zIOXMhkLEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eZG/ZNXAfl7bnNiUPEgcQ0ECSqyzMg1KefvVWDy/S5Yhldonitv6OpWPxg/zU6YYi
	 +sJ1QWHDgGummTUEkyLrvmOHnRwb9a8mSofP4HOAjvYUz6XiwgXf8xRRs9DZLpmBwV
	 wCIbqegY06sWRbAF6dplT3NZrvjZCpjU1nwt5BbM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:36 +0300
Subject: [PATCH v3 06/15] drm/tidss: Remove extra pm_runtime_mark_last_busy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-6-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
In-Reply-To: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=754;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=7Kq5ctr2zF2W69THhXrq0QBJ23m1uyPy7zIOXMhkLEE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKNTJ4fTgJ5gD/d+Zr5V6tnn1Mr+F1HwSqe4
 QuiwdQdRvKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSjQAKCRD6PaqMvJYe
 9QRRD/9CAsn+XdBkkLHKZTZ410UIFK74/ErvcBkGDuPyqCcRJw8lEwRIB2cNUu7u6mEB9sDtW0C
 xuESrqQ+hzuHmupiDo/V01e+rZ3LwreY3TcmKmZHOIiVzSH79P6KWXhh4Q03vaDHnr8CBb8lvIb
 3ZQV+G1egX+6Fa0fAuS2eqS+DRWsye6NZIoHL9im4imGuFFu0D0r74zHRUeU6etI4e3resDHdk/
 breUxZVu8Wj1/uASTHkbQGabWRHRuv6cNiPAogQiKTBMGncaZRjwfLGupOWTua8ZhTBFxmRUCwy
 D9NPI9IuSQmHkMsj4D+jN20g1MM21mHvRA7U6TTz/qhq3PmqdwgKT1UGxwZgfD3PiHbc/dibE/6
 2mISeUOu9Ft7ZG8PXAmf04loDnoUrjs9waX3sexBgxhztSuHq0zxBIVHKg7MfUacnkthtONFRWl
 6DP3jH8NE/4u3Vomli/FsrK4C5Wi03pswEQSNiVcDFtBGyCAglufJJJH0kPOoWgxydCkg8ZqOch
 bAxmwLFdvioYvGSEFu81gJuZ1hr3rHVmlus1XHE0yoXBuCwVoT9uhT3711jI+h0h4vQ1gnP/ssJ
 rSXWxJl0W7fk95U8l8sJ4D0lja3udsJ6rttF/McDkDrHZndtKvNWyFI/EHACOAP5o4YaDtVuw48
 cBuPpWpSU4dcLZQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

pm_runtime_put_autosuspend() calls pm_runtime_mark_last_busy(), so no
need to call pm_runtime_mark_last_busy() explicitly in the driver.

Tested-by: Swamil Jain <s-jain1@ti.com>
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

