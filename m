Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B67209F43
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786889167; cv=none; b=F8wb/LJI1rdEOrm/kfQ931Iz9IN3cC2mfSdUewvMwmXSJNPwBOsn7NpgBlcTC5pChGFNx3aiPe5BAlFOfEn2iOMskcuRxdRdyYyvG8bALI9++HnhLMXr5N/T1YuSgzUUfyhmmzL90U3TqiTYsd8imOVI0ZtD0nuFbhLmysShrEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786889167; c=relaxed/simple;
	bh=nuaMYYTQqhqKJlPaF30SikTyAbBlUrVsMa8qr5TuWQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHFeUlr1cPXoHCWvViCPnQ2Xv1rPh/lQF+1s5jS/vGQeKrSbmCWigKWyKWgSSGUq9Yv9dVmz4K7v9fskA/OplbGm6nAg8YSBPq2u/+gYuCH1JOmCj8PzhrtIenUhljM7QqYC7WpRDQzR/aKRelZtdCIZkuG3zBq5xGwMRmDpHhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=EUeKhmBH; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="EUeKhmBH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=ySmnWO3XBpCyGmRmqJ/3VJ0DyjSd0CyWUVKuIAJPxQA=; b=EUeKhmBHdTI3GQh50iJI+1DD3x
	FdmxLfejc5u1j+gVHq/KAQHeboTMFJLyU9guKoAM+ztORGP5cgvfOGilTWuZ0c8vAlwz5rqKJZPtY
	3wlYcACMf9od3SHZKIB0cS6xIKLFwDXy0MirLeAqczBYd/o2Abuo514iePwYds1jL2fZzOvS21SbK
	700ZCbP5kvWhcZPI2o/kCkAFJUaT/vVyBrvQQ80Cd8VdZUJJRSTzht3ui2TyvmR4i3Xu9YB4Kyl05
	U5cZG5F2jfEtlTvfR8pJ/9hRevYphjN10rxSP59UF7FmuQp9qfxBzVWbPyjZ3EYpq1CZd6RX6EZ9w
	Dl/5pwCQ==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvbUp-002tuI-9v; Sun, 16 Aug 2026 16:05:55 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 16 Aug 2026 11:05:40 -0300
Subject: [PATCH 1/4] drm/vc4: Drop the undocumented brcm,vc4-v3d compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260816-vc4-reset-control-v1-1-896444373716@igalia.com>
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
In-Reply-To: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=nuaMYYTQqhqKJlPaF30SikTyAbBlUrVsMa8qr5TuWQw=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBqgcO4xQgyy+Sd0RwL+2JuA7vOYeeRX5MzP8osz
 8qfiCfLgReJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaoHDuAAKCRA/8w6Kdoj6
 qiG3B/4k2ZV0kbJKQ8+DXSOrcbsRJl4t7l9wsGcIFFXPrnUG0pjHTTFB3E/cGDy55tvX60jAQC7
 nWuCPpgxp5DLpAJyFLS4sKh3mIpDtUanp8FFtL1SnGukXNC/piw+7zqMq6zFAz9kSTEXIPOXxxq
 UDCuPO6CA+UISwThAOMYYgMWPC0JQMK8YyvlUki+Re/lbsWzGro5zUj7xYlIyX6ngOg7hJNWrRb
 cPDnoX78Cr94Rfald1BVdB/64M7i2CncxJvFG8YIN42N6Fq14Qp/RPWP5gI4AMOKrY+r3IZARtW
 Rm5izgR4NhxHpfWRXgc57zTZG8oTX42qYwyB8adaKgdBdhET
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

"brcm,vc4-v3d" is the compatible string V3D support originally shipped
with in commit d3f5168a0810 ("drm/vc4: Bind and initialize the V3D
engine."). Commit 90d7116061f8 ("drm/vc4: Recognize a more specific
compatible string for V3D.") added "brcm,bcm2835-v3d" in v4.6 and kept
the original one around, because the Raspberry Pi firmware was shipping
device trees that used it.

That string was never part of the binding: the documentation added in
commit 4653f22e9ab0 ("dt-bindings: Add binding docs for V3D.") describes
only "brcm,bcm2835-v3d", and no upstream device tree has ever used
"brcm,vc4-v3d": the first in-tree V3D node, from commit 49ac67e0c39c
("ARM: bcm2835: Add VC4 to the device tree."), already carried the
specific name. The firmware device trees the compatible was kept for
predate v4.6, released in 2016.

Drop it from both match tables.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 1 -
 drivers/gpu/drm/vc4/vc4_v3d.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 616caf9d9915..eb859c65a453 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -279,7 +279,6 @@ static const struct of_device_id vc4_dma_range_matches[] = {
 	{ .compatible = "brcm,bcm2835-hvs" },
 	{ .compatible = "brcm,bcm2835-v3d" },
 	{ .compatible = "brcm,cygnus-v3d" },
-	{ .compatible = "brcm,vc4-v3d" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index d31b906cb8e7..379ab77243ad 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -531,7 +531,6 @@ static void vc4_v3d_dev_remove(struct platform_device *pdev)
 const struct of_device_id vc4_v3d_dt_match[] = {
 	{ .compatible = "brcm,bcm2835-v3d" },
 	{ .compatible = "brcm,cygnus-v3d" },
-	{ .compatible = "brcm,vc4-v3d" },
 	{}
 };
 

-- 
2.55.0

