Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DBA414416
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883993; cv=none; b=fg+eWs3azREx4pkUxlvxmNCVqs9TkloHJczf43hLySOSxfGWDSM2nieaglqR36UEl6FyRbeswZMvFIKz/QjNTikIfP4CGO/MUFIQ6cBRTWDBCntT0+fZdGvGHyKIUVe2fuaSdHYJGCM1KCXp1sBC2val4Q6+wOuy1y9uqKCS0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883993; c=relaxed/simple;
	bh=R5d61cBjlmI8uZAYwWmWvsr2JGajaUnhrCAJQgi3A6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fJtICUXXIQJ2+Mhkovq36H/utY4poah5U7JI5n30lOfFalPBCGj0DHM1i3K9hI6TjPeGwOMehZUdG8H8KJ4ipHJ2riDFLbvf5f9Ij9BJv9Gr+8z9K8Bp2UWiZvFRDx+qwVgf6Q7anL68Jkh8tBZoL8sYi5AWIyBCB/pRY93KEl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIgC1X/B; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIgC1X/B"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c02782159so1645725f8f.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883985; x=1792488785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xsGsod/8Ns3+BDNQx7Seu3RbdQl0ClLIgl4wgQX5q9E=;
        b=AIgC1X/BFvrzxulDKIWvqEZTHcc/O9ZLro/9Q0uI2AQYyb99laB9ic1NKwcExVJ3W/
         nqqaMXf1kmI2aX18Abb1yxkWwz4tUPRCqVi2FILNohTRfcjLTYCVxWj+wQN257p0qdU2
         FOtSDuyt4zpt8tJ2KXD4qO5Z51P2E2VwNv6lSRV8RqGm+AZMOEgjBDnfOiSNAB/57Le/
         okFOSyia8taRg+8dvL99+HtDhbSv4caPLLP0rB1twoAOIlau4fUk69ilqh7PvQgUPEyr
         0yVj0ypqXwqRxKbbLJzhc9sAR+9AMwue4E2muHQODLQkO16e5/FThpRnecjCzsclRgKn
         LN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883985; x=1792488785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsGsod/8Ns3+BDNQx7Seu3RbdQl0ClLIgl4wgQX5q9E=;
        b=P1ij8zG1bZKweVKu6A5/S7yxmtl7CFWtfVX6p6V0w8TY3LQv6h3bnzDpUH/NaNX+bj
         zgxW7oMZNqEUHh2KCzAWWpvXjFzAE6j9f5EkxXOer/m6wP8Zb2Rcp7f09/PIV9RRnFVf
         ODM+6wJE87l7YGdW9YehtscAV1MI7li7L9OoUqsaEOdl7cIQx76J8NIq9wC2Fqgr4Tna
         FFzxD7l3AiNawjH/6fcIMfA7aV4gGoXZGW36pTxJRE/IZHNSXLpLP2rFa+N/kVti4cyO
         IZewrpJ0OfX9ew/VHDWyVG2okKgTwcIXxcyhpXqHGePiN0vJGuCGQMFgxRFCrO2nWJ63
         eg/A==
X-Forwarded-Encrypted: i=1; AKwUvBzV5WbNomAloiWCBJQkW+zeA1tqBPvpCYhnzjzbNR1DgXQfX5sz7tC0u+bBJJs3vdgqxQO9D2xO/pNe@vger.kernel.org
X-Gm-Message-State: AFq9FYKHKy0PwYmwy8qAo9/mBL4OJleHt9tpqj/CxcqPXPbTtlD8HDl0
	BXJJwD36/gqOtV69m24+9GcDgWLXIo3586+nMBt96S4h5PTWmI2zsJkW
X-Gm-Gg: AYBFou1adwS0Xz/RvMTKHV83jlGOFxYQJgq2YCz5AfKeLj1z875gvmhFrogq1N3GXjq
	VmBiKntnGfBwFLHBNftxvqHUP4iM25sVRLAKhxeshGOe5v1GJYpTOn+hr60BDX0XNl60uaFu49q
	SDjvvtb+U+l3yXXYpurly04+mwuqJJH8VW+p/pZ3zMJudoo8ZGxSQ9DBfl9ZnbZXwwCBhB99M4q
	rPxce2GSzvrS5Vhr8q92GdfJJ6BaacOfd1BNgZE/sVEOG1RG/+fGQs9O2Bl1hBfOosazMKlUPX8
	9dv5x7qMi8ZPoIYWgVfan/sKlFn1qLqCLi0fEbaFHu6P/hIV94IOfsjBaxd76qb+bGy3BCFc9Hz
	L10ltjVIxd+7cLB4t43kP6SEkGKFBWv+iyx4dZ67oCWpd2qBUNzqqqlqvKP9eqo3h8C6g/zHrZt
	/BfqaklS16+YqTaD6xDUgpLX4FT0A7hSJXa68JSRyaTgrswVIWjsK1keevU7YoQUhDy63zAEK4E
	dSgv+urnExP067oKOCTsiJ8
X-Received: by 2002:a5d:420f:0:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48dbacf46e9mr16300132f8f.48.1791883984846;
        Tue, 13 Oct 2026 02:33:04 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:33:04 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/13] drm/client: splash: add a device tree image source
Date: Tue, 13 Oct 2026 11:32:37 +0200
Message-Id: <20261013093243.505776-8-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013093243.505776-1-maximpedraza@gmail.com>
References: <20261013093243.505776-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Embedded products often share one kernel image and one board support
package across several models that differ in branding. The splash
client can show the firmware's BGRT image or a BMP loaded as firmware,
but a device tree system has no BGRT, and a BMP loaded as firmware is
either built into the kernel, which means one kernel per logo, or read
from a filesystem that is not there yet when the display comes up. With
U-Boot's Falcon mode the SPL starts the kernel directly, and the device
tree is the only thing that reaches it.

Add a source that takes the image from a "boot-logo" node under /chosen.
The BMP either sits in the node itself, in an "image" property that dtc
fills in with /incbin/, or in a reserved memory region the bootloader
loaded it into, named by "memory-region". Exactly one of the two must be
present; a node with both or neither is ignored with a warning.

The image in the node is used where it is: the device tree stays in
memory, so there is nothing to copy or release. The region is mapped
like the BGRT image, and the BMP header is checked against its size.

A node is only there if someone put it there for that board, so the
device tree goes first, then the BGRT, then the BMP loaded as firmware.
The boolean that chose between the latter two becomes an enum naming
the one source in use.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/Kconfig      |  15 +++
 drivers/gpu/drm/clients/drm_splash.c | 166 ++++++++++++++++++++++++---
 2 files changed, 165 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index cbe271c3a23f..aef3781cc110 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -108,6 +108,21 @@ config DRM_CLIENT_SPLASH_BACKGROUND_COLOR
 	  The color can be overridden through the drm_client_lib.splash_color
 	  kernel command line parameter.
 
+config DRM_CLIENT_SPLASH_SRC_DT
+	bool "Device tree as splash source"
+	depends on DRM_CLIENT_SPLASH
+	depends on OF
+	select DRM_CLIENT_SPLASH_BMP_SUPPORT
+	help
+	  Use a BMP image described by a "boot-logo" node under /chosen in
+	  the device tree, either carried in the node itself or placed by the
+	  bootloader in a reserved memory region. This lets one kernel image
+	  show a different logo on each board or product, chosen by the
+	  device tree it boots with.
+
+	  When present, the device tree image is preferred over the other
+	  sources.
+
 config DRM_CLIENT_SPLASH_SRC_BGRT
 	bool "EFI BGRT as splash source"
 	depends on DRM_CLIENT_SPLASH
diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index a7d627954158..50842922a7f8 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -9,9 +9,12 @@
 #include <linux/efi-bgrt.h>
 #include <linux/firmware.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/iosys-map.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/overflow.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
@@ -71,6 +74,14 @@ struct bmp_dib_header {
 	__le32 colors_important;
 } __packed;
 
+/* Where the image comes from, in order of preference */
+enum drm_splash_source {
+	DRM_SPLASH_SRC_NONE,
+	DRM_SPLASH_SRC_DT,
+	DRM_SPLASH_SRC_BGRT,
+	DRM_SPLASH_SRC_BMP,
+};
+
 struct drm_splash_scanout {
 	int id;
 	/* Modesets scanning this buffer out, by position in the list */
@@ -110,7 +121,7 @@ struct drm_splash {
 	bool render_done;
 	void *map_data;
 
-	bool use_bgrt;
+	enum drm_splash_source src;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -212,6 +223,114 @@ static int drm_splash_fw_request_bmp(struct drm_splash *splash)
 }
 #endif // CONFIG_DRM_CLIENT_SPLASH_SRC_BMP
 
+#if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_DT)
+#define DRM_SPLASH_DT_COMPATIBLE "boot-logo"
+
+/*
+ * The boot logo node, if the device tree has a usable one. Only a child of
+ * /chosen is considered, not anything compatible anywhere in the tree: the
+ * image is configuration handed over by the firmware, not a device.
+ */
+static struct device_node *drm_splash_dt_node(struct drm_splash *splash)
+{
+	struct drm_client_dev *client = &splash->client;
+	struct device_node *np;
+	bool image, region;
+
+	np = of_get_compatible_child(of_chosen, DRM_SPLASH_DT_COMPATIBLE);
+	if (!np)
+		return NULL;
+
+	if (!of_device_is_available(np))
+		goto out_put;
+
+	image = of_property_present(np, "image");
+	region = of_property_present(np, "memory-region");
+	if (image == region) {
+		drm_warn(client->dev,
+			 "splash: %pOF needs exactly one of image or memory-region",
+			 np);
+		goto out_put;
+	}
+
+	return np;
+
+out_put:
+	of_node_put(np);
+	return NULL;
+}
+
+static bool drm_splash_dt_available(struct drm_splash *splash)
+{
+	struct device_node *np = drm_splash_dt_node(splash);
+
+	of_node_put(np);
+
+	return np;
+}
+
+static int drm_splash_dt_load(struct drm_splash *splash, const u8 **data,
+			      size_t *size)
+{
+	struct drm_client_dev *client = &splash->client;
+	struct device_node *np;
+	struct resource res;
+	const void *prop;
+	int len, ret = 0;
+
+	np = drm_splash_dt_node(splash);
+	if (!np)
+		return -ENOENT;
+
+	/*
+	 * An image in the node is used in place: the device tree stays in
+	 * memory for as long as the system runs, so there is nothing to copy
+	 * and nothing to release.
+	 */
+	prop = of_get_property(np, "image", &len);
+	if (prop) {
+		*data = prop;
+		*size = len;
+		goto out_put;
+	}
+
+	/* Otherwise the bootloader loaded it into a reserved region */
+	ret = of_reserved_mem_region_to_resource(np, 0, &res);
+	if (ret) {
+		drm_warn(client->dev, "splash: %pOF: no usable memory-region: %d",
+			 np, ret);
+		goto out_put;
+	}
+
+	splash->map_data = memremap(res.start, resource_size(&res),
+				    MEMREMAP_WB);
+	if (!splash->map_data) {
+		drm_warn(client->dev, "splash: failed to map %pR", &res);
+		ret = -ENOMEM;
+		goto out_put;
+	}
+
+	/* The BMP header, checked against this size, says how much is image */
+	*data = splash->map_data;
+	*size = resource_size(&res);
+
+out_put:
+	of_node_put(np);
+	return ret;
+}
+#else
+static bool drm_splash_dt_available(struct drm_splash *splash)
+{
+	return false;
+}
+
+static int drm_splash_dt_load(struct drm_splash *splash,
+			      const u8 **data, size_t *size)
+{
+	return -EOPNOTSUPP;
+}
+#endif // CONFIG_DRM_CLIENT_SPLASH_SRC_DT
+
 static bool drm_splash_bgrt_available(struct drm_splash *splash)
 {
 	struct drm_client_dev *client = &splash->client;
@@ -489,7 +608,7 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		return -EINVAL;
 	}
 
-	if (splash->use_bgrt) {
+	if (splash->src == DRM_SPLASH_SRC_BGRT) {
 		x_pad = efi_bgrt_image_offset_x();
 		y_pad = efi_bgrt_image_offset_y();
 
@@ -582,19 +701,34 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
 				 size_t *img_data_len)
 {
-	int ret = 0;
-
-	if (splash->use_bgrt) {
-		ret = drm_splash_bgrt_load(splash, img_data, img_data_len);
-		if (ret)
-			splash->use_bgrt = false;
+	switch (splash->src) {
+	case DRM_SPLASH_SRC_DT:
+		return drm_splash_dt_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_BGRT:
+		return drm_splash_bgrt_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_BMP:
+		return drm_splash_fw_load(splash, img_data, img_data_len);
+	default:
+		return -ENOENT;
 	}
+}
 
-	/* BGRT failed to load */
-	if (!splash->use_bgrt)
-		ret = drm_splash_fw_load(splash, img_data, img_data_len);
-
-	return ret;
+/*
+ * Pick the one source the image will come from. A device tree node is only
+ * there if someone put it there for this board, so it goes first; the BGRT
+ * is whatever the firmware shows, and the BMP loaded as firmware is the
+ * fallback. With none of them, only the background colour is drawn.
+ */
+static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
+{
+	if (drm_splash_dt_available(splash))
+		return DRM_SPLASH_SRC_DT;
+	if (drm_splash_bgrt_available(splash))
+		return DRM_SPLASH_SRC_BGRT;
+	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
+		return DRM_SPLASH_SRC_BMP;
+
+	return DRM_SPLASH_SRC_NONE;
 }
 
 static void drm_splash_image_cleanup(struct drm_splash *splash)
@@ -909,10 +1043,10 @@ static int drm_splash_client_hotplug(struct drm_client_dev *client)
 	get_task_struct(thread);
 	splash->thread = thread;
 
-	splash->use_bgrt = drm_splash_bgrt_available(splash);
+	splash->src = drm_splash_pick_source(splash);
 
-	/* If no other image has been loaded, try to load a BMP as firmware */
-	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP) && !splash->use_bgrt) {
+	/* The BMP loaded as firmware is the only source that arrives later */
+	if (splash->src == DRM_SPLASH_SRC_BMP) {
 		WRITE_ONCE(splash->fw_pending, true);
 		ret = drm_splash_fw_request_bmp(splash);
 		splash->fw_requested = !ret;
-- 
2.39.5

