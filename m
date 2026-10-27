Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109249;
	b=RLmAlnfXzxzmCGtZwG83PcqTTPwpZWNiZApLJQKFZDCmd7HDMusFCC5H6SzwaBMraXpK
	 EXJnL7TIgC8LK5cH1DAUt0U4sHFMZt39+D+g2K6jU6eDzeFgg/joUIYEYOL4IBzsDyj9K
	 XInCXBtsBxsgGJhZoZNQhOe/lFiUvzT49g0gMgWr43TcyT0gi/qaUABPrZUxP3yh1LGHQ
	 XQQS4YS3yd4XHBDb/GUkF6q/l+6BSmzqiWFfQ3YFy8KQ6zr+VzYueeedHPtLPbx91rrAu
	 /h24F5+TpMUuUGMoU6WCkJxsolAanKqBemeJxOPhW2FgWbElEvuTnMpdlQP9Dpeyy6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6lxw1iuNNrtlMKIOLDxkCcdbesSM+n1C5OuxVBL0d7w=;
	b=QwwTYKeifJvxybaMXraWulaP6wfophJjTQra7t09nPnrRvIzJzVxxR5w5r/RyiLySdK1
	 2tTbF9B3Np9SD018taW3G6/jFXKdnp1i/Lv5/WCfrtWo2/cMqchc0dUe+e2kXJOQRBIMR
	 47CCGdvOs9OYSt6/oloWPJEHEn3Negx6349k4fpbAHW7YddEsUCM3FGcJxNzJwMLntPM/
	 A3sykAJv9rah1RgFwQUIbmtIKWdwDNpilklycgPmfGMu8z8MusMyhmTMkcG5wcqKq+411
	 Bv6mT+ab2YJdzM1T1Q482/dHkh5/Nc+E8moQRvegahIYPisbi2Pdof+34g7gsaVOxfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Lv/KihTD";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0FB60A5BC2
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D0FB60A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lv/KihTD
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so36752965e9.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109247; x=1793714047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6lxw1iuNNrtlMKIOLDxkCcdbesSM+n1C5OuxVBL0d7w=;
        b=Lv/KihTDv4ZuF0uHfiMF+UsmNr8uP302NeDnP9Y/JPCCSU9xlEpnPGt/HDM41zfZcJ
         wSNmWVZvO3B2gQ4GBjgT/muZ9qsLlNlGKfNzVPEfFFYBgs33zLogdCgxDzGEt1RyAAlO
         a25V+g9rzv46FFLO37BtxXU/vrFzfuyKUdxLCcA7jnKVocIFL/iceE313/ZgSnGzyeQt
         xCNs9f+VVIbeCiYA9u84IYLBCJSfhnWkX+cI6kUNo9hu5looW69GgBt5Lh4k6a/QjK9W
         pEhfGaXNQUZ5Sfj8j/XohWlCySac69mJI1Vl/byYUqXEDKi4C+c7BlCXyLVlqxzHRLwP
         Fv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109247; x=1793714047;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lxw1iuNNrtlMKIOLDxkCcdbesSM+n1C5OuxVBL0d7w=;
        b=OyNUd3/wlqhFJShAZX3KPZY/TlIPStSsQy7Ck5yhs85AltPmawUjE6ryTlLQ+PNbak
         4LCRNpbKF8/ZJlwlXyLXMUuYAWF4FZRw4WsxU631n9DAauxcjJ9QXp//6bDsVAGNoiWC
         ZwC2W87qUnGQIQX0/0BpCh/JyWAP+Q073ZwUlyGi2zgU5d9PcR2uEIou38IKsN0euGGe
         fIjuZvf0ERzTOXlJqAl6NZFrYTU4+vLLr/9IW80SUiwuR+dSy0UXsBwEeCuO2KAkEji8
         gOnpDWc40mEF1UpBjNCifK9WGuY8HYFLQHJfyICWppCAZKyxoyb7BbDs/2PFMx+kBxEi
         P4oA==
X-Forwarded-Encrypted: i=1; AKwUvBxEo9eoIC38WPVCQgkMOfXBNPixToNinPATFS2OStX56kFRsy7QcZ7u/mJ194P0uaGNvkdROuAGCPrc@vger.kernel.org
X-Gm-Message-State: AFq9FYIMiHUFEQqQEp0yAnWhRefKNkZzJQp4go1BWIZSXMBPKEfzHkmv
	r+9Nnqbdt64tJJYXOd46FdJC2tNyDjcrxyAuAcCXupqpOr+I50WjmH3x
X-Gm-Gg: AYBFou3IbznByFYw4w3+SLNI4BDuj1NAXZ+ryXCW17PRgTHuCvY0E8xJg64XAHtewZH
	LeFtTgzo7DYaHLCYaq3F5WmOJULOlnyilMmmgyOVAerUuv/jgWB2JxELd6ctZhkKNtKu3snEPWl
	uZO6BEwufgFbWECZRDttYh494CvrTbuw+eWGAUpOp8FbHajXMpCBQiYYWkzZrFX66KT/BxvAjhn
	MqFlOpLEqLS9lsSSdhivCi8W9ZfC45zB47kE0P6rN2OJR0/70zQzhy20KsV3u6+4YtEb/tGGh93
	fPZYUo4kAra//5gBC0+1x0unaGBJPWaPvCU8BQWgmpcRDrYSeKcJcJ//ZRc36kNmR7Sp9pRDpoA
	MVIbmlj1k0cYqdIEdCSuiyoqFW/Bnqp+YuPdfHi6NgOH7/XiLeaSTPaJQZeIyC4KYvBmz0QIkQc
	XP0u8ZfrTnPMadRgqVFWZ+xbdD6vvgb7S7w1OMr5+7EkJIzMuNRVQuUQhP+8Hw0VdUXgku0k1Cg
	vEny+qkVbjz5X+/GkdDapi3F4sUJTXyasW5PaF0ZDFmsi77lHzzZWcoVpPcAaz/lB2aiQpvb6ng
	aHq44Ec=
X-Received: by 2002:a05:600c:4e87:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a35acaa6c3mr197755335e9.30.1793109246811;
        Tue, 27 Oct 2026 06:54:06 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:06 -0700 (PDT)
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
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
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
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/15] drm/client: splash: add a device tree image source
Date: Tue, 27 Oct 2026 14:53:36 +0100
Message-Id: <20261027135342.2003632-10-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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
The BMP either sits in the node itself, in a "logo-image" property that
dtc fills in with /incbin/, or in a reserved memory region the
bootloader loaded it into, named by "memory-region". Exactly one of the
two must be present; a node with both or neither is ignored with a
warning.

The image in the node is used where it is, with nothing to copy; the
client holds the node, or keeps the region mapped, for as long as it is
there, so that an output plugged in later gets the image too. The region
is mapped like the BGRT image, and the BMP header is checked against its
size. The image is found when the source is picked: a node whose image
cannot be had, because its region does not resolve or cannot be mapped,
or because reading a region takes CONFIG_OF_RESERVED_MEM and it is not
there, is skipped with a warning, so that the other sources still get
their turn.

A node is only there if someone put it there for that board, so the
device tree goes first, then the BGRT, then the BMP loaded as firmware.

The source is built with CONFIG_DRM_CLIENT_SPLASH_SRC_DT, which needs
CONFIG_OF.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/Kconfig      |  15 +++
 drivers/gpu/drm/clients/drm_splash.c | 142 ++++++++++++++++++++++++++-
 2 files changed, 154 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index 51ae6c6bd89b..172781bbc2d7 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -106,6 +106,21 @@ config DRM_CLIENT_SPLASH_BACKGROUND_COLOR
 	help
 	  The splash background color, in RGB888 format.
 
+config DRM_CLIENT_SPLASH_SRC_DT
+	bool "Device tree as splash source"
+	depends on DRM_CLIENT_SPLASH
+	depends on OF
+	select DRM_CLIENT_SPLASH_BMP_SUPPORT
+	help
+	  Use a BMP image described by a node compatible with "boot-logo"
+	  under /chosen in the device tree, either carried in the node itself
+	  or placed by the bootloader in a reserved memory region. This lets
+	  one kernel image show a different logo on each board or product,
+	  chosen by the device tree it boots with.
+
+	  When present, the device tree image is preferred over the other
+	  sources.
+
 config DRM_CLIENT_SPLASH_SRC_BGRT
 	bool "EFI BGRT as splash source"
 	depends on DRM_CLIENT_SPLASH
diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 911149b92a52..618c060f33d5 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -8,9 +8,12 @@
 #include <linux/efi-bgrt.h>
 #include <linux/firmware.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/iosys-map.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -45,6 +48,7 @@
  */
 enum drm_splash_source {
 	DRM_SPLASH_SRC_NONE,
+	DRM_SPLASH_SRC_DT,
 	DRM_SPLASH_SRC_BGRT,
 	DRM_SPLASH_SRC_BMP,
 };
@@ -96,6 +100,10 @@ struct drm_splash {
 	 */
 	const struct firmware *fw;
 	void *map_data;
+	/* The device tree node, and where in it or in its region the image is */
+	struct device_node *dt_np;
+	const u8 *dt_data;
+	size_t dt_len;
 
 	enum drm_splash_source src;
 };
@@ -185,6 +193,127 @@ static int drm_splash_fw_request_bmp(struct drm_splash *splash)
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
+	image = of_property_present(np, "logo-image");
+	region = of_property_present(np, "memory-region");
+	if (image == region) {
+		drm_warn(client->dev,
+			 "splash: %pOF needs exactly one of logo-image or memory-region\n",
+			 np);
+		goto out_put;
+	}
+
+	/* Without it the region can never be read: let the other sources go */
+	if (region && !IS_ENABLED(CONFIG_OF_RESERVED_MEM)) {
+		drm_warn(client->dev,
+			 "splash: %pOF needs CONFIG_OF_RESERVED_MEM for memory-region\n",
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
+/*
+ * Find the image when the source is picked, and keep it for the outputs
+ * plugged in later. A node whose image cannot be had leaves the other
+ * sources their turn.
+ */
+static bool drm_splash_dt_open(struct drm_splash *splash)
+{
+	struct drm_client_dev *client = &splash->client;
+	struct device_node *np;
+	struct resource res;
+	const void *prop;
+	int len, ret;
+
+	np = drm_splash_dt_node(splash);
+	if (!np)
+		return false;
+
+	/*
+	 * An image in the node is used in place, with nothing to copy: the
+	 * node is held until the image is cleaned up.
+	 */
+	prop = of_get_property(np, "logo-image", &len);
+	if (prop) {
+		splash->dt_data = prop;
+		splash->dt_len = len;
+		goto out_keep;
+	}
+
+	/* Otherwise the bootloader loaded it into a reserved region */
+	ret = of_reserved_mem_region_to_resource(np, 0, &res);
+	if (ret) {
+		drm_warn(client->dev, "splash: %pOF: no usable memory-region: %d\n",
+			 np, ret);
+		goto out_put;
+	}
+
+	splash->map_data = memremap(res.start, resource_size(&res),
+				    MEMREMAP_WB);
+	if (!splash->map_data) {
+		drm_warn(client->dev, "splash: failed to map %pR\n", &res);
+		goto out_put;
+	}
+
+	/* The BMP header, checked against this size, says how much is image */
+	splash->dt_data = splash->map_data;
+	splash->dt_len = resource_size(&res);
+
+out_keep:
+	splash->dt_np = np;
+	return true;
+
+out_put:
+	of_node_put(np);
+	return false;
+}
+
+static int drm_splash_dt_load(struct drm_splash *splash, const u8 **data,
+			      size_t *size)
+{
+	*data = splash->dt_data;
+	*size = splash->dt_len;
+	return 0;
+}
+#else
+static bool drm_splash_dt_open(struct drm_splash *splash)
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
@@ -509,6 +638,8 @@ static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
 				 size_t *img_data_len)
 {
 	switch (splash->src) {
+	case DRM_SPLASH_SRC_DT:
+		return drm_splash_dt_load(splash, img_data, img_data_len);
 	case DRM_SPLASH_SRC_BGRT:
 		return drm_splash_bgrt_load(splash, img_data, img_data_len);
 	case DRM_SPLASH_SRC_BMP:
@@ -521,12 +652,15 @@ static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
 }
 
 /*
- * Pick the one source the image will come from: the BGRT is whatever the
- * firmware shows, and the BMP loaded as firmware is the fallback. With
- * neither, only the background colour is drawn.
+ * Pick the one source the image will come from. A device tree node is only
+ * there if someone put it there for this board, so it goes first; the BGRT
+ * is whatever the firmware shows, and the BMP loaded as firmware is the
+ * fallback. With none of them, only the background colour is drawn.
  */
 static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
 {
+	if (drm_splash_dt_open(splash))
+		return DRM_SPLASH_SRC_DT;
 	if (drm_splash_bgrt_available(splash))
 		return DRM_SPLASH_SRC_BGRT;
 	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
@@ -540,6 +674,8 @@ static void drm_splash_image_cleanup(struct drm_splash *splash)
 {
 	memunmap(splash->map_data);
 	splash->map_data = NULL;
+	of_node_put(splash->dt_np);
+	splash->dt_np = NULL;
 	release_firmware(splash->fw);
 	splash->fw = NULL;
 }
-- 
2.39.5

