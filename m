Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831114;
	b=mOQxRmGbPq9+mwaDQFmbwmxGK62ozzgQ3tluAhE+4RKNq45nEW6xnPDaW6nOEar6/wRC
	 jcpJ9f7Zgr1lgU60xYQyFhK7s8SGrWSCpGkYuHQ0hiQTsx57LYKE8lMMXo8XPGdzw0U+E
	 PQoMc5TfsnpvM5lJzlQTSLHVfMXkxKLKzGqftaBZBsNul3vJxd/bLUCgXLxyeRmY012e+
	 pbzo0uhrXHcT+QAVPckGQAspYy1rqF6k2oWsK+7AG3yY/UNZMAVbOamjRcg7hwI3eFj6V
	 hPTmWN6UfKOjcDoI0zi/wSDVVmbi/1kVNG9mAgIf8LprTad+QKCiprradym/I/Z8pzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=;
	b=TGPNhystYUXrUKoQTw8hfQOIemD/O5kMP3k119MlGSby/nQ/ghYYvDDRFy/kL0wOx9Wc
	 hHWSeGhCRv8Ay6ARCLn/aFOsxPFfwIg7aWHkU4JluhNGAYpMHEDzU3e4U03vuKjPQxAFp
	 oyVzYjnggJz0uTcyiP7A40jDI0sEEkbO/O4IVQLlWZIMsxfWNuAvRvZoqwF/pDYYoWfqr
	 QpeXJ54aK41ClvkRzaCgq50zAaGJ7nhXX/G6hJBQTdWxeewn8e3FrSkDLcrr1IqxPmQZy
	 GwtWj7JEepMOLfzKIIhwXwh7FhcQMxixVDBOXXVVzhKXQWwjdIn5fFIqH6y0+drjmTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q40GqGxB;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83657606A33A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83657606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q40GqGxB
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso21631245e9.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 04:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831113; x=1795435913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=;
        b=q40GqGxBY91fwja9SiTLKYD6GacL3GB3R7Jr4Hf1bn3XzfYIdPsNtJFtKfupT5VB46
         5fIXJZhYDxGpiWH3uLJkpzwjhembeQLZKpAYiq/ubhBS7pMXR+BJ3OcOACJEPE6i4Lzc
         CMPwvar1HAP7itOVoc/8REnDxrLkGsCWmlHtf2MrFbxcwzrlBurjsJWrZXT1miDQTx6w
         e99T3hRQDQwdQu6zzh2fgnLFhstPVma8QtRkk9hseXI3edbZ2RRxauCkVeYbSl7O4Tcf
         u8DFLa8nos+MfwxEIkIwo2QAJxxyLBF+8aRYXxkJ9Or4T+p+adBv4iqaC68DSHyqgOgI
         knrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831113; x=1795435913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=;
        b=sqGeuurd2e65yST7hbfYDhLbn2KrGbwFJM1eEitHa7iLTTRVO54g0wi/180L07PWW5
         xkkuAsqwE7UI3EthdBcEgVhtiIm2F6J8QMie9f+xNtecmViLPS9BaMYWKfMy7fCG4gbj
         NNtnc74bFVBMwbxdy4o3A0n09lqNvZ+4WBYjp3Up7EIo6EPW8rHvwtRlYuBdeI1OiZV5
         rtYcHZVZhj9pzHMzTUhX2WYTk/spFa7OqYs6DeY+kzMdco6dwVkusmdc4LwN32TEbzTs
         UCXCzU90ceHvGL0jcSyKgWAjxC9kgEmnB6mz+r6w/QjAgY3mu6FPAK1V6iVmuj6UUlry
         E3Uw==
X-Forwarded-Encrypted: i=1; AL+hErErwjbp9pu07tThrk+lnvMJ0F54bA5Pa/URM+26Jzw9k6DfxEkWN6WuoYB9jTJafe+9AhtSLJmtMBga@vger.kernel.org
X-Gm-Message-State: APuU4Z/xJ7SV0oD3NDmu0bVmK9GEa0pLrAzykqPvxloWb8DopZs8vQo1
	LxMCnMlvFnfwxQydX3kNK4NXwAIQ+opU7HbvVgXVq9RyBGJYe27gnSI6PUCzcwd6v9w=
X-Gm-Gg: AYBFou1/svnt6JsKtMY2mbSyHqmLyIMUhNrbBNdnWnvEMytsnHRDL4L9zWTcQ/Ptgf1
	HsXKQ7TSZeXIf7S2Pmn515fqJdtXsOt7IjL+dy//CBnxn5k+LGbJOfpcPm91lhdpqG8heDaaiL5
	qpJN3n1oBqeEQ2vtzxlOQy7raYnQwGb91YfT3Xz2cz4QcqCywoZXsPxbea75uRDEBEYJ8DP3Gj0
	jvb8qH81tWyk4iZds1qjPyzq+7r3nODJsNBkO3PDv8/vd8cwiWPPIZtseIyE3CLaMMKjdntOHlK
	TTlZ3bJf6kOoDFxYDbYCMdWnJCS4sxrYacHOTXq/O+E9Us3/LDnqUeZZxq1RX9x3MkjDkNuhAsp
	BLfY9bqu3RPrrJ6a3uKRVMICtIlKa/esNdnGN/CnO+U4ujyZN6eLFzqTrB/pmYPgtDgU/50gRiV
	W+Y9F/Vv/GGraPgxEgk3Jbn+VJOC5/QhbVDeh7xohid35paTtsbq3Unzbi7V8quynw6kljksxdo
	SP8SvXs140ffF3cv0Qb5yf3vvuioj97Evuo0Li4BqDfkGXU6nRpEbSKZagwSHaxD79WI0zNalAk
	DC1g7iGHRCmUKtKflrdX5DB7XDsb4oWgTV+qm7cN/ScF/XTuV8NSRR1aLqGIZ6sjzHtrI6o6vMD
	r/PSGn/G/tpIJuE4LZhH450xOiy3vD9GtiawKqaeVJdjDMVFeqhlVqXb35k5+Okbfo+m7MuuO
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb69b2d82fmr91695095e9.25.1794831112818;
        Mon, 16 Nov 2026 04:11:52 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:52 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 16 Nov 2026 13:11:48 +0100
Subject: [PATCH 1/2] drm/panel-edp: Fix Innolux N125HCE-GN1 mode
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

The mode has a pixel clock of 162 MHz, which is 70 Hz. The EDID of the
panel only has 60 Hz and 40 Hz. Output of edid-decode:

  DTD 1:  1920x1080   60.001038 Hz  16:9     66.721 kHz    138.780000 MHz
               Hfront   46 Hsync  30 Hback   84 Hpol P
               Vfront    2 Vsync   4 Vback   26 Vpol N
  DTD 2:  1920x1080   40.000692 Hz  16:9     44.481 kHz     92.520000 MHz
               Hfront   46 Hsync  30 Hback   84 Hpol P
               Vfront    2 Vsync   4 Vback   26 Vpol N

On the MNT Reform 2 with i.MX8MQ the picture flickers at 70 Hz. Use the
60 Hz timing from the EDID.

Fixes: a14c6b0eef77 ("panel-simple: add Innolux N125HCE-GN1")
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f7add22ccf69..0ebd756d14d0 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1364,15 +1364,16 @@ static const struct panel_desc innolux_n116bge = {
 };
 
 static const struct drm_display_mode innolux_n125hce_gn1_mode = {
-	.clock = 162000,
+	.clock = 138780,
 	.hdisplay = 1920,
-	.hsync_start = 1920 + 40,
-	.hsync_end = 1920 + 40 + 40,
-	.htotal = 1920 + 40 + 40 + 80,
+	.hsync_start = 1920 + 46,
+	.hsync_end = 1920 + 46 + 30,
+	.htotal = 1920 + 46 + 30 + 84,
 	.vdisplay = 1080,
-	.vsync_start = 1080 + 4,
-	.vsync_end = 1080 + 4 + 4,
-	.vtotal = 1080 + 4 + 4 + 24,
+	.vsync_start = 1080 + 2,
+	.vsync_end = 1080 + 2 + 4,
+	.vtotal = 1080 + 2 + 4 + 26,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 
 static const struct panel_desc innolux_n125hce_gn1 = {

-- 
2.56.0

