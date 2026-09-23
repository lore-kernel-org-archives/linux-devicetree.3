Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D1857F738
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194273; cv=none; b=CnxcgDeJbQNECDzdslrjrWP/ieMO0vgRp/EwJh2mG7WsTbmjRse3eIJl98VHJ8paERynESKLRVKaVAMfaY8A2oClvvaMNli8X+7BJ7nJEcJWlM1RZoSAhbTLYE7NnUiymqDnXkkcgOBLoRURK+u2vSR0jeslChXWyO6AKdEOp4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194273; c=relaxed/simple;
	bh=MGegY49PyrX5dI2WXMEBmc92kvSEAfIxTrxpSA/jTWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V3t6d4ZX7iIOBBLWpX2dOwOMZn4tDZJ9AuYdejV7Pk0LYURmyvbT7iT9byH93P2Wku57jVJKUouhAVXVRYJZdEX/GNLBbckr7auUFHkQexcObBCD86wgKywCZj2xk4RePhq/MsYqU6EyKQUwNNa71raiJzIn0z9gsXiljnN1eNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJV3KT2J; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJV3KT2J"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so4984595e9.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194254; x=1790799054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzWnvXvBcRYh23VzcFk9fIrKKbovPKtd+dDK4CYg1CA=;
        b=sJV3KT2JPwcsLZnEEveDSmtWGeXz57ilHAD+b+Wet1VQ4DqqSxWM+d9Y5RyRr/6Ycz
         vPaN7To38SaSL5d5TKit7/AWP664F62EALQjtRpyt42TNgc8suM2LIVWwFuwuW4SWBWk
         BP4Z6b2CcLF+vMKFhe2rH2OUCH49n4C4ttIJOQ8jHNLHEZCuQhlny0B1OmUWlBEeT3nL
         rTFheIzbz406WgABzHlrMA/6aMC4Ob4sUcfWrEo7tW8JNmW5AerlgpIm/pWduIm7eq9Q
         w+xD4opCXuZX3WhVxMaWKWsy7eZNvKu2vJ5jGwrvSmFaIjJm9EpJeKblSCQ3qxtj5pFn
         jQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194254; x=1790799054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzWnvXvBcRYh23VzcFk9fIrKKbovPKtd+dDK4CYg1CA=;
        b=m4pFZa2BAbzSLswSyjiRDfXtfpRj4+8wKoYtIqRvpbiaDlHcAmI3uRd20FrvJos8zG
         k1qVWRC8WXzbiXBb+2Qued8vpVjRJYlkp5uRFzv9HBxfXcOfvlyIgxJEfL/BDvwx0/gh
         Dfg9RnBTPWhGOW0RTJqDebFxKcA+RzBZDC/QW7LgXlqbhGH0mW5XOfui6PrS4qZgum8t
         xLr9coOQBnobWmLA181hOw4nN7ZetEcrhvgcl2W0dK9GPayOtgT7dFguSasDVZkZeMtf
         K77xnxTu1ByRGddl1QALUA00pZ4JQgfm6sN5FACnsfEzsSunJlNEHzkO4mt8JIQiszry
         fIFg==
X-Forwarded-Encrypted: i=1; AKwUvByD74NbgCZx8FhzDBWXMqNx9yk2MVt/ZmZIfyksa8KQv8L2BXGRlvOUu8sYhXZHERyxGnY6Q1nx3m9v@vger.kernel.org
X-Gm-Message-State: AFuF++n/nTPrWN2W8b7blah9f+FFVrbk8UZLm8WxN/G7rtCOEGmGj3FB
	uUNw7m0SsDRxbISP4p/koQmOvccl0Mn8c+KCkvjqAok4f8FvsDyzmFPX
X-Gm-Gg: AYBFou1/2Ida+KR0Bwc0v1CZ4kcJmWNCUH6/Q48jvVj2X3wtzXNyE5j3BZ8bo4PoHG8
	QcMDllkfo1Q8xz/EKr/HjqKVw3YWSg1txAYj785+zh20mu4PvytH0uYGX2Q2+hwggb4IPj/6ex4
	Oql1xJpI4FytZB/WEXoEMlsZx997OuKcnFIriign7tj/9PHVdiHO1gk8b1DfLK76ngD2P1/jIfc
	86YrTE5w9hX0r0GJkN+1Kx6WcbIyVUK4MPeBq5VEnk8vw255+tz1DCGRVlDm8omJFXYT49KrVfX
	6BvNPbNCw4uWoaivriKFuMImIzHGek//vIDojCmzBOVBLEEK7qydLQLM/mlJzjgo2PHEET10aQj
	WEx8CRfO7lhDhvuSp1SNc1TPbjviO0P2hKzz12WvtxlcgB9mnssfMy665SCHPosg9T1xtGTT2Mu
	dXD4AKsbKtzcFMbcq7+oTuC8Vfo188bquOePXiV2c+K36rrqwowL/yrlkQRIUiFQLC7RbECdBhe
	+UsSkX8G6/iSlInP8pWnToVBObO+zHhTlU=
X-Received: by 2002:a05:600c:4705:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fe66d03b6mr4620805e9.5.1790194253946;
        Wed, 23 Sep 2026 13:10:53 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm13559295e9.3.2026.09.23.13.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:10:53 -0700 (PDT)
From: Max Pedraza <maximpedraza@gmail.com>
To: Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-fbdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Max Pedraza <maximpedraza@gmail.com>
Subject: [PATCH v3 1/7] fbdev: describe where the boot logo goes in one place
Date: Wed, 23 Sep 2026 22:10:29 +0200
Message-Id: <20260923201035.51007-2-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260923201035.51007-1-maximpedraza@gmail.com>
References: <20260923201035.51007-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fb_prepare_logo() works out how many rows to keep clear for the logo and
fb_show_logo_line() works out where to draw it, and both of them open code
the same decision: centred if fb_center_logo, top left otherwise. The two
calculations have to agree, because fbcon erases whatever falls outside the
rows that were reserved, and nothing makes them.

Give the position a small structure of its own, with -1 on an axis meaning
centre on that axis, and have both callers ask for it. fb_center_logo
becomes {-1, -1} rather than a second path, and the arithmetic lives in one
function that both use, so they cannot end up disagreeing.

The structure and logo_place_axis() go in linux_logo.h rather than in the
frame buffer code, since where a logo goes is a property of the logo, not
of the one thing that draws it today.

logo_place_axis() also clamps, which the open coded version did not: the
result is now always a position at which the logo lies entirely on screen.
That is not reachable today, since the only positions are the two the
console offers, but it stops being something the next caller has to
remember.

No functional change intended.

Signed-off-by: Max Pedraza <maximpedraza@gmail.com>
---
 drivers/video/fbdev/core/fb_logo.c | 58 +++++++++++++++++++-----------
 include/linux/linux_logo.h         | 29 +++++++++++++++
 2 files changed, 67 insertions(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_logo.c b/drivers/video/fbdev/core/fb_logo.c
index 0bab8352b6..5ec9f9554f 100644
--- a/drivers/video/fbdev/core/fb_logo.c
+++ b/drivers/video/fbdev/core/fb_logo.c
@@ -8,6 +8,17 @@
 bool fb_center_logo __read_mostly;
 int fb_logo_count __read_mostly = -1;
 
+/*
+ * The placement in effect, as asked for on the console command line.
+ */
+static const struct logo_placement *fb_logo_placement(void)
+{
+	static const struct logo_placement centred = { .x = -1, .y = -1 };
+	static const struct logo_placement top_left = { };
+
+	return fb_center_logo ? &centred : &top_left;
+}
+
 static inline unsigned int safe_shift(unsigned int d, int n)
 {
 	return n < 0 ? d >> -n : d << n;
@@ -281,7 +292,11 @@ static int fb_show_logo_line(struct fb_info *info, int rotate,
 {
 	u32 *palette = NULL, *saved_pseudo_palette = NULL;
 	unsigned char *logo_new = NULL, *logo_rotate = NULL;
+	const struct logo_placement *p;
+	unsigned int xres = info->var.xres;
+	unsigned int yres = info->var.yres;
 	struct fb_image image;
+	unsigned int block;
 
 	/* Return if the frame buffer is not mapped or suspended */
 	if (logo == NULL || info->state != FBINFO_STATE_RUNNING ||
@@ -322,26 +337,22 @@ static int fb_show_logo_line(struct fb_info *info, int rotate,
 		fb_set_logo(info, logo, logo_new, fb_logo.depth);
 	}
 
-	if (fb_center_logo) {
-		int xres = info->var.xres;
-		int yres = info->var.yres;
+	image.width = logo->width;
+	image.height = logo->height;
 
-		if (rotate == FB_ROTATE_CW || rotate == FB_ROTATE_CCW) {
-			xres = info->var.yres;
-			yres = info->var.xres;
-		}
+	if (rotate == FB_ROTATE_CW || rotate == FB_ROTATE_CCW)
+		swap(xres, yres);
 
-		while (n && (n * (logo->width + 8) - 8 > xres))
-			--n;
-		image.dx = (xres - (n * (logo->width + 8) - 8)) / 2;
-		image.dy = y ?: (yres - logo->height) / 2;
-	} else {
-		image.dx = 0;
-		image.dy = y;
-	}
+	while (n && (n * (logo->width + 8) - 8 > xres))
+		--n;
 
-	image.width = logo->width;
-	image.height = logo->height;
+	/* The copies are drawn in a row, so they are centred as one block */
+	block = n ? n * (logo->width + 8) - 8 : logo->width;
+
+	p = fb_logo_placement();
+	image.dx = logo_place_axis(p->x, xres, block);
+	/* A stacked logo goes where the caller put it */
+	image.dy = y ? y : logo_place_axis(p->y, yres, image.height);
 
 	if (rotate) {
 		logo_rotate = kmalloc_array(logo->width, logo->height,
@@ -418,6 +429,7 @@ static int fb_show_extra_logos(struct fb_info *info, int y, int rotate)
 int fb_prepare_logo(struct fb_info *info, int rotate)
 {
 	int depth = fb_get_color_depth(&info->var, &info->fix);
+	const struct logo_placement *p;
 	unsigned int yres;
 	int height;
 
@@ -480,9 +492,15 @@ int fb_prepare_logo(struct fb_info *info, int rotate)
 		}
 	}
 
-	height = fb_logo.logo->height;
-	if (fb_center_logo)
-		height += (yres - fb_logo.logo->height) / 2;
+	/*
+	 * fbcon only leaves the first @height rows of the screen alone, so a
+	 * logo placed further down would be drawn and then immediately
+	 * cleared. Ask the same placement fb_show_logo_line() will use, so
+	 * that the two cannot disagree.
+	 */
+	p = fb_logo_placement();
+	height = logo_place_axis(p->y, yres, fb_logo.logo->height) +
+		 fb_logo.logo->height;
 #ifdef CONFIG_FB_LOGO_EXTRA
 	height = fb_prepare_extra_logos(info, height, yres);
 #endif
diff --git a/include/linux/linux_logo.h b/include/linux/linux_logo.h
index 1e727a2cb4..b3b15d3800 100644
--- a/include/linux/linux_logo.h
+++ b/include/linux/linux_logo.h
@@ -13,6 +13,8 @@
  */
 
 #include <linux/init.h>
+#include <linux/minmax.h>
+#include <linux/types.h>
 
 
 #define LINUX_LOGO_MONO		1	/* monochrome black/white */
@@ -36,6 +38,33 @@ extern const struct linux_logo logo_linux_clut224;
 extern const struct linux_logo logo_spe_clut224;
 
 extern const struct linux_logo *fb_find_logo(int depth);
+
+/*
+ * Where a boot logo goes. A coordinate of -1 centres the logo on that axis.
+ * Whatever draws the logo describes its placement this way and computes it
+ * with logo_place_axis(), so that no two places can end up disagreeing about
+ * where the logo is.
+ */
+struct logo_placement {
+	s32 x, y;
+};
+
+/*
+ * Place a logo along one axis. @pos is the coordinate asked for, or -1 to
+ * centre on that axis. The result is clamped so that the logo always lies
+ * entirely within the screen: the drawing code does not clip, so asking for
+ * more than that would otherwise scribble past the end of the frame buffer.
+ */
+static inline int logo_place_axis(s32 pos, unsigned int span, unsigned int size)
+{
+	int last = (int)span - (int)size;
+
+	if (size > span)
+		return 0;
+
+	return pos == -1 ? last / 2 : clamp(pos, 0, last);
+}
+
 #ifdef CONFIG_FB_LOGO_EXTRA
 extern void fb_append_extra_logo(const struct linux_logo *logo,
 				 unsigned int n);
-- 
2.39.5

