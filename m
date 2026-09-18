Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CF63AAF7A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700523; cv=none; b=f4GkUMMzk6f1+kYzgbFIZ0q74YaJZCIkUEXITQjIk1mwWzGETKgEiWjSGbwM+K1ykJ9hM+DbkzHoxTadh3/bp+zC0sXEOnhDuAcBS++fKhFx8gg66N5x1UPxwgn2h0wEktzRA9fUDQ1SM4HSuYTNguLOLs+3RPaeOJ31LWLSxDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700523; c=relaxed/simple;
	bh=2fOXWQ+D606ZEtKoesxi3yPFiMCtrfZbrG+MPby33tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMOR/dBSnxNyGsqiGzU1YE3iOLMWZ3GxGBOgC1gxfuAGoGClNgBIP6l5h+WuzmwyTCn0FMPH2b4A6XbNAxyk9IxRfGGimr0Xdjq75tSmU3Z8pNvcyYTfr0lPvpMOu7E0yNj5nRhgogzRsAgy3W9f42rmt6Lh2MF40AtQOvtpffk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsKRVJnd; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsKRVJnd"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so119340a12.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700518; x=1790305318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f70EL2u57AlsQGuy6taCWBcjNOQfxHMXhBaDu9pSD1s=;
        b=JsKRVJndOYWb2b+t2ClORDriyvRVT4cWddvK9hMcag6logGlpJEFu5AKTR37yKinZo
         WWpOa/deBeB/nqKQSM12VL8XHgRlKu8jvA4ugBKwoNKKcEPVz/MfmNGKiBnPDpSQ9R9H
         iO7NaAYUxIJjjxl3ISTL73nENkwZY8AZF58nVBO43lxyhTgxpHeGEBM8ilv0eFZQvGA7
         yfFGGUzFV1HYOUmzwUW4Gqb3FU99SY+r16kNto6awkiv74K29qIaFyLb728rbxaB/HDe
         4nMEd0Zaz20tcJvEYruah+FQWNSyaHKVNtJJNkkGdHmDcdv/VGbovwCy4oXApRdZrbJk
         AXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700518; x=1790305318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f70EL2u57AlsQGuy6taCWBcjNOQfxHMXhBaDu9pSD1s=;
        b=m1dIV9B2xlcedCXe6iHhlDiPL8yBSQFd7CD9qd7aRUXaIwmGYWS+FeojbNb4MOZkGA
         3TjgR28wS+JGwANJXzv8YXh21l/oDQDkHnuVU7vjRE3avbZrwHcXjI1MuCBSFimd5dvs
         eWTr3YuPWTbDBK1BZnPlbutJXyHTEHXoJa+fmpgaB44kVQciEb+9K8/gxzD9j+kUUsXG
         vm/fgVosrcX+OX3NaJMcZxmIi1dzk5rS6az87WYRDX55eY9JhTddeiogCwhAJYZQX7G4
         CuRwmTsrOHd0h/OvgoR3efIUFYQ1sLD1/RDaFDwSjs+kGjbK3osSkgfmQzQxtT5m+mJQ
         YPAA==
X-Forwarded-Encrypted: i=1; AKwUvBweIgtTx2SfPySo4VeY2sGctw/s1tQhp1dI9BT9OP1YLvnqpEhI9QLTEqzQlaNSpzl9xt+GiEg8cCV+@vger.kernel.org
X-Gm-Message-State: AFuF++kOWHYIHdVUMjYBOwJ3FgGmu93eq+Waa876zcURE38/UiiJGYRQ
	tw+o9vyUS41TxgexGy6/IBDE3RHRFupA9cnle5+Pn9SLJp3J3RW3DeW0
X-Gm-Gg: AYBFou0VdqorXBqE5w/b/yQEybQwPMMgjwnMkhr6LHjEA0U0Fv2OTiqlSIcEQRfGcdl
	lUFl2DyjY92MVT4POxGJWIy4w9nwSSdfKfvhnU7bueetn2TU8BBoEJuDfDtBPoK+ajmt43TnWor
	DrAhlVhSrLJ8/jh+z6AUhf9JYajkTohjy2iCh7lgtWW9tzYvlA0SOYD5jL/bLCi5a8noFmGJdC4
	+8rXS+H39N75pKFExyxazVq5RC/+Vl27IZ+XR08WW2eG7rQ67VVMQOy9F7mMydPxWMZAGfM+Tjz
	wH5lQHwANwdSGGziNOfAI6fSymcucW6khHAmKP2A4ocq1J4DTkOYn1mDbc8d+0tG695B1YoFbJV
	GTqqUrtqMUvoe5ViEX5aG54Fh3iY6nsRP4J0mI39hrZsIu0xmmJ138nmaRw4XO/72eMvrEtSfPK
	l7Ftf0nHilNrlXq2ex6k2D4ViVULBllyAyRjGqy8S9DaYIbZpmGD0gzu/ubtgDiGYHVBSKFyzk9
	wFk5LNRNXLHJ4XKwwjy/W3oc/cG7WW8Ncw/CrFdMvszGvc2auH6wUxW8nYB4xs=
X-Received: by 2002:a17:90b:1644:b0:39e:2ea1:e2a9 with SMTP id 98e67ed59e1d1-39e54d8b0ecmr2306119a91.8.1789700518239;
        Thu, 17 Sep 2026 20:01:58 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:57 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane disable clearing FB_EN
Date: Fri, 18 Sep 2026 11:01:25 +0800
Message-ID: <20260918030125.315978-8-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vs_dc8200_primary_plane_disable_ex() calls regmap_set_bits() on
VSDC_FB_CONFIG_EX_FB_EN instead of regmap_clear_bits(), so disabling
the primary plane on DC8200-family hardware actually leaves the
framebuffer enable bit instead of clearing it.

This bug predates this series: it was carried over unchanged from
vs_primary_plane_atomic_disable() when patch "drm/verisilicon:
introduce per-variant hardware ops table" split the DC8200-specific
implementation out into vs_dc8200.c.

Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon display controllers")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_dc8200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c b/drivers/gpu/drm/verisilicon/vs_dc8200.c
index f72da10295e1b..25b5906a1c5fc 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc8200.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
@@ -70,8 +70,8 @@ static void vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc, unsigned int out
 
 static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc, unsigned int output)
 {
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			  VSDC_FB_CONFIG_EX_FB_EN);
 
 	vs_dc8200_plane_commit(dc, output);
 }
-- 
2.43.0

