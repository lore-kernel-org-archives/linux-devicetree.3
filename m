Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110886;
	b=zgNBuPflK0F2o0y/K7MhcNp1nNVJDXKC4g3/VOXWG+AdRqXNTDukxusABm/UGdU/smvE
	 7ansOR844i+rNHWst0+6/GxVyDVxpHur3+d10hFQuJd55LN6RIblMMh29WwpZiPABqvmM
	 +FNufllDaS8T0XiqZjZ6HxrktQhYyu3jZmuvAUHwyEwgzJY3V1OvAXikik1rjy0/ye8O2
	 mdftDIh+OZ7c60YKVeyGUl8P6Ro8Y0Mw+MeZZgcSyJovngvcrrozd0RyxbQj8XzJIieHs
	 EHZ6uzdl0MMw9XNeL/y+oLsRJ8nygjpWT5+yScUiREbBoe+zIx/yOmdrJ9Uc3b0yA7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=;
	b=cIFSrGfOAIU1fV0ClWPCkO+YH8D9n4NYeWPm5jfCU6wdOKbHDYXWY8QLs98whq79DAZB
	 3jOVecBuTX+FJMwlgwRf1rkxQJ/T5BD3ycjaUltiD26uHK7vObnmIL6gjVsetq/y2QMe+
	 03qvd4EI3gU8Qk9FkE+Cm+wLnDj7cyunuQKFmoaFopyxZ99igBqKp4Y8ClGklZXtFic3F
	 Y8Ah1rVm/bs/+d6CtqVATUipQ7lcWBP3tUFgbJnPqHbwTC6nxo8L4pYzkUnZaGdBdqgSw
	 bNHLLKtBNVYM0GdTLaTZLTZPLAisnbdN5D8k9/0tbqWAnN51nhtANP0qThYcuKWH/ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D0bF1RMy;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7222606A33C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7222606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D0bF1RMy
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so27228625e9.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110884; x=1795715684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=;
        b=D0bF1RMySG0igrY+lp6ja8i1eRHHIL3f9FkIKp/XjvghQpY2iw+7/QzA9wyhKPojBt
         dPqm1x+vDf3Hx9rLBRMHXvTBbfMxaUT38hH1PI4NoiKlPOhU2pUWnEUl6InKsNi/MWQR
         ejVhQbGUQ5DYl9N6BIrKlcjajZ9L2Vyqj1v2NHVvm1uFpucD6/Hyg8rPinDWxtIxMOXC
         x4ekNVuUVsB2VqjVanzoAgonjsn14TZgE0UjagZQOhRMuaKiQJ5FMOI/OE2IGc4je8xw
         Hvs0Qf2hQIHMGR8tSDt/jEavgMv+4jCx5ufyksIvSN+RsAAA5jEUaYHVN4BMbuEvkdX+
         +9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110884; x=1795715684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=;
        b=0TZ+ixE5N4B4bzc6ztJN+JSaqpv1pcrfdgVrD2C9SuAaM6ljKHpJxvNHGMqzsdMhUm
         cGtzm+ki5ziW4qLpgceGC0leFWKLC4A2c7gstpP7vN76VDnvmjVIw05kmj0SXxOHjMtu
         mGyhhOrriO2QOjbTULFRgOd/LptHPKp3dz8GOTXAxEgsrjjkx+3cp8IbYkjHgRQkQ8Mh
         8Yar0pSBTSKjqVuS/ub1A9pDDlSyGmHhE+DLqIn4L0hFO8Y86wegvOGR+aloFZ1vh2Bj
         c+t3F1pDJUKWC/HEcYDgdcuBl9TAoavS8pgp96YUHs9dwOf04bFLEQXtmusseb27EDf9
         MjuQ==
X-Forwarded-Encrypted: i=1; AL+hErG3Se6DXbWORmxF93o/O3J8vz2T+ZQj1a16g0lHpQY453m7sK8B56lvLFCGOUIfR1woPn2slVxUbEId@vger.kernel.org
X-Gm-Message-State: APuU4Z+8AHFmI8v4FDD9ZiHIA3yojLy91C7aPrrZzVl90xoa4e6Zvw1V
	MuOROcu7RHkEXoFfAGUwGQMQgYNUY5oeKZrI+hYF8vpmRbfAOv6SxNlc
X-Gm-Gg: AYBFou28BEAhJ8frJkOb5Y2cp23dZPezvC5LKfdOLDphgVUb7rg/DwVQBPZ5LYMlWUY
	4fz/7vO7bY9Fcm7vpQhATrpjDLzYIKteSW2xveFeBcBkbtofXJDFrSkkasb8f7BDeWzHJCdmbiW
	yE/xL8i4Hb0xycmpaWjspANcVmLhf+e9qFOlPl6ESqQYnaZSlZOmhpm09vb8XlDXVupibVqyVw+
	AjQ3OPkKhSohK6JwOXI0Ld83lD7OJTmXgoWeqNqVyt2RMK66sC0u3echcv7SqPqYiAzro/XsZKz
	DcEIyAtihvDDGTBoipBHrlXpddDTxvcPxRuMtBelIX0vSqH0bA+0X+yy8ERCFkDSXAOrA+a5hK6
	NAZHyLMO10/JLUSGkT0t//BT5qHWqigbYDqG/7HbTs4xTGfG41UqPA0ylwO8IdHTW9ciqLXlKFx
	QZnGdofo593OWD5Po0LLU+u46EDAWaLDIG6uz6qS5Xbjq7hnRs96FdypM9bgZI0+aEhHAvM6FHY
	SKkdw114U1Narays8oEmlpqM7t6UMs6uj83Vty/yPUXuY5j0dSYVduDANGzljEMkwyTf0luvj5N
	bJv7TOUx7HYRPjiVufiQYj+K0GmRovb9hbBb1s6rhMYLyQAVnChnuMBYEstqDHbPTNG4dEvrtix
	SS1g+DmE/tP2gGDvrNmQr6d83RFBoKZ+4uJaBjs4+TxxBo5dfWK1lN25LtIVTpPyg0hQUTx86UI
	WwqEa1xoIZzS4ZcmfLBW5zaLoyTo1YMmEfgbMyKQjth3DICgKzOXL7WRHp92m23Ut7bjyxE00ff
	uujCqdum5LcV12ckZgWCc4mDyvJoF6FGDBL3mL8tOnwVGr1nlwMh8Hu
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr8512525e9.3.1795110884056;
        Thu, 19 Nov 2026 09:54:44 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:42 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] drm/sun4i: Reject fractional source coordinates without scaler
Date: Thu, 19 Nov 2026 18:54:33 +0100
Message-ID: <20261119175437.2520400-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The layer code programs the scaler whenever the source rectangle has a
fractional offset, since only the scaler can apply a sub-pixel phase.
drm_atomic_helper_check_plane_state() with DRM_PLANE_NO_SCALING doesn't
catch that: it only compares the scaling factor, which may still be
exactly 1.0 with fractional source coordinates.

Channels without a scaler would thus have the non-existent scaler
programmed instead of an error being returned. Reject fractional source
coordinates on such channels.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 24 ++++++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 24 ++++++++++++++++++++----
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index cf66f676824e..f9c7f28f9fa2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -179,10 +179,26 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 		max_scale = SUN8I_UI_SCALER_SCALE_MAX;
 	}
 
-	return drm_atomic_helper_check_plane_state(new_plane_state,
-						   crtc_state,
-						   min_scale, max_scale,
-						   true, true);
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  min_scale, max_scale,
+						  true, true);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fractional source coordinates can only be handled by the scaler,
+	 * so reject them on channels without one.
+	 */
+	if (new_plane_state->visible &&
+	    !(layer->cfg->scaler_mask & BIT(layer->channel)) &&
+	    ((new_plane_state->src.x1 | new_plane_state->src.y1 |
+	      new_plane_state->src.x2 | new_plane_state->src.y2) & 0xffff)) {
+		DRM_DEBUG_DRIVER("Fractional source coordinates need scaler\n");
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 09d94f7f9977..4d3fc03f9877 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -259,10 +259,26 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 		max_scale = SUN8I_VI_SCALER_SCALE_MAX;
 	}
 
-	return drm_atomic_helper_check_plane_state(new_plane_state,
-						   crtc_state,
-						   min_scale, max_scale,
-						   true, true);
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  min_scale, max_scale,
+						  true, true);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fractional source coordinates can only be handled by the scaler,
+	 * so reject them on channels without one.
+	 */
+	if (new_plane_state->visible &&
+	    !(layer->cfg->scaler_mask & BIT(layer->channel)) &&
+	    ((new_plane_state->src.x1 | new_plane_state->src.y1 |
+	      new_plane_state->src.x2 | new_plane_state->src.y2) & 0xffff)) {
+		DRM_DEBUG_DRIVER("Fractional source coordinates need scaler\n");
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
-- 
2.43.0

