Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3AB2A1B2
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 06:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408608; cv=none; b=PaesGUg8f+Ku4YvgZ498fGgC6GvU5QeKaGwKrleuRjddUs47ACgfFhpSKOLVfY83hiFS0qLo7EFAUSNN0w9XX6Us1FQ/tm8ydnxOtLfGhTDJaLoIzuTo+PA1vqgV1Rk5MC9ocW/GRYg9+t0Q9dtwljv81ZFBNzD9vN1+qbQ8oYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408608; c=relaxed/simple;
	bh=S4OFXIKh0uO0e82KZw2bvPmaW0Sotg07BRAdX+aGqKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6+dckOXbjdppy/58a6/p5ySt0ceCfZ/FVMG5l1A9YuRe2gGyzDsu2R8VoWOiRlzlXktmXPSsC/6QcBuhnw7aSQta2mHRvqZwU3Mvu5yHyOHLBtiCgtBDiU+ycexsEe1gt5Oixn/tQBZrjdQOjBkFOlG90zPT29mwJodkqQ5taA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtZfDzfG; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtZfDzfG"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so327576e87.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 23:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776408606; x=1777013406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkFD0nTtiMecWdiMYsq45f5KZ8ZJ53Zo2JaKZseIkhs=;
        b=AtZfDzfGinw302R+/nls4nBWKCOY+vYJaJp8thNQ7KwBBivJ6hPFus54zYXuqa7Xkb
         WOO3iWPRNJs9IXoyHyFmovynk5fq0rbmjA9QMBXe5B26g5+fxl8C3IEABJ2YPdYnFhsZ
         1gv8DoliJDKfvQlML8y2GVlKqUVap5jdCN6L8p213BTrnDwf85SZAFy4rY11LXNWX6j8
         re11Y6VKitIv/8wu7VcylozPqKA0SjOFyiqOvCpyFehNkDDSgFjrxb+YKBW2+XWxGouY
         FlduJQSjVzAtUAmveIf3W1eqn5DwdsyxnslICFpP8zreYQ+mzTX9JvA7iyoGM7+T47Nq
         p9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408606; x=1777013406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rkFD0nTtiMecWdiMYsq45f5KZ8ZJ53Zo2JaKZseIkhs=;
        b=jZqdgFvK8rMDDFtaVtFOrMppsnQOTGWHhU1eSn/nixw/m9yfk6qt846ejwLF6aXN9P
         bdiLwI3sTXIMoNnFh7Jle7XK/SCP4vX3zJzVYJ/DqWiDMTNtKptNK5r5pOq4/bKzFos4
         tHWPNVL8ZJzP8+apj3e/q0adpEiCMLeDMgeRZ8L6dgl8yPJEeBjgosgU+1PoVUYMoWyd
         zaDKOgx+eu6BFrFkZDrcwYNS2JmY3lgLqP3mVhKGs9NqdWRspSy6ZvcJ1O0roiT6B5AB
         m8YDCl3dqHdLk/D3QXxMwBO7NiCnGbStbo8t+pH0N244CrkbzYyC6Bjy7NWb2A+EzVqb
         Ge2w==
X-Forwarded-Encrypted: i=1; AFNElJ8VjC6U+hS619mXuw+cVQaRejxiKf/wfODFQGtrRuqd0u/huwBdJ1uJQgGLYncLKrZo9L2qJd/G32aj@vger.kernel.org
X-Gm-Message-State: AOJu0YzHjJAPqdmyVmnIjTtrxodpC0QtXfRHqFbuaoUO48K4tKZIuUJr
	7eMKvkKnXWUVcWgPRdQqGzlkEzJSz/4o9F97xPiy1bxxVNTC466zfscG
X-Gm-Gg: AeBDieutAFR9+S4BARDw9EQeIzMuNu4xc48AN0HDISibs/BN/Q+/wWW7lWp8vLQLQbq
	ZZiTEZDRaJoy1jMDBoSkr5ab248Es/z1PC3dNnq0dedpcIa5UqqfbdX8kneoW4bIJ6AAa36hrWb
	1V5xp9/RufZHiX9ypUbmxbfmEsgAh0jF67aLFKen2vyCUgLEagNFnHmb5OJ5gIce2HbqVsH6GGu
	EJinLlpToQKSY28Beq21t46OokxtmPJ8za4RkL1Sn2QzUExZY0sP+QcX7jQ7+4koIREFtxe/FEP
	CA88b+o7wl3t/487IxHUAQPKFQ5Vmn3+23rfEDmO4fmd3x530UIXRFSy+0VHA3qrzHeoK3F+RJJ
	IT2V5+0pXAMOjMyfF7ZhB7TrpciWrjMegwk5on8kdh46R0Tmf90r0BuuNsCwzEhnLn7jQxZ30GF
	K/RZlPVSMlMtt25VHQ2+VXIu8=
X-Received: by 2002:a05:6512:3ca7:b0:5a4:d34:5b38 with SMTP id 2adb3069b0e04-5a4172b7ba1mr423053e87.2.1776408605519;
        Thu, 16 Apr 2026 23:50:05 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm153202e87.7.2026.04.16.23.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:50:05 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3 RESEND] drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1
Date: Fri, 17 Apr 2026 09:49:53 +0300
Message-ID: <20260417064953.20511-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417064953.20511-1-clamor95@gmail.com>
References: <20260417064953.20511-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxim Schwalm <maxim.schwalm@gmail.com>

A simple HDMI bridge used in ASUS Transformer AiO P1801-T.

Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 8aa31ca3c72d..cc13c98f9be6 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
 		.data = &(const struct simple_bridge_info) {
 			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
 		},
+	}, {
+		.compatible = "mstar,tsumu88adt3-lf-1",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "parade,ps185hdm",
 		.data = &(const struct simple_bridge_info) {
-- 
2.51.0

