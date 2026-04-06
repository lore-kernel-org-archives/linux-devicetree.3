Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8251B371054
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461197; cv=none; b=euvKaBmcAnqYDBJi3cYUJGb/tn2F1BdzZcD0ErNYh4M/9UfEMzWz3Qtzjh7NkruHJul6r4ICSmbUbqhD+3OWRwtkp0UR6XboLNbH7vGoSzN2QPgELVUEcpNbnAk7RyJnRj1u1Tl9u3wXH6neMY1ePSXY16gRA/UY1WEk89Edojo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461197; c=relaxed/simple;
	bh=S4OFXIKh0uO0e82KZw2bvPmaW0Sotg07BRAdX+aGqKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9YRi+pwIGM0p+WLkFkEvft073oxqWcdPTt8EjyT6kzPo7Kfj/qZgMBduIrljiweh1dWl43qxgeuRR6rgJjJMPkqjNGxXu/3ll3+e6Gvzd4p7N7TX9Cj3lBm1AsU9+zfho76EQePTFZKj5PE7bFj3vJTt5PRmT5KFzMZCphaFsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LudMyhr3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LudMyhr3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso32469125e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 00:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775461195; x=1776065995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkFD0nTtiMecWdiMYsq45f5KZ8ZJ53Zo2JaKZseIkhs=;
        b=LudMyhr3O65YZC5vWDkAaLzIwDB/aOuhE7KjT35777AuTk4zMlHjtSZln2c6Rsw2UT
         NIYxRMIgKrEpJfTkCbd1Ae5ljkvLY4qG0qY/CU/dtS/HpQz3UdMithMVLxwOdDHlmlWF
         AhVNgJ74vjJQFinQ4K2Mh2kfxXWsUPSVb8fgAKXnjMVljyUgNNK+LBGg2X7QLU0YxUN0
         fIILfRww44zmJ2Iu0K5N4+aZb1AYvH5cpRyMGbC8l+hIcsu11DzRwr5RV507rR62HN6r
         ptLV2FH+b8H7jEYxYCD3v8EMspDnR7llmKxY7Mq2QHwsykQDzTr095j4bO0G4PewP5dP
         s2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775461195; x=1776065995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rkFD0nTtiMecWdiMYsq45f5KZ8ZJ53Zo2JaKZseIkhs=;
        b=jgnN1dBBxYNZiOLcFNjEXGkHJppcWY4CHck8+uV+8KEa9wIxKhoAewQMahRUcv4dNx
         VkKjcw6L6wSRoEmRVBlrLpKttjYMMA6wKvjvOyD6xGeFVIDkxeyHv4E0PlulupKGr1O4
         BidlYQ8QWN3vYDe6IVq42Zj94QXfnHuF4gwUl6K/r4SUXWlGMaFjVkph9ZHamQ5MaaJk
         npGM8SzMqbvwGxn+FAZrHygotILNfBX6V5Zfts7BLdWTYI2NiE6kn8Z7X+FLFOYz3s4v
         rSAfJqrGi67OwJAPqtW6YPqCxG41lG2QB146OgljEEBL5H47sCi75bWUwrmYyVX6GzkR
         zHvw==
X-Forwarded-Encrypted: i=1; AJvYcCWU4ZZAZJiUZkHg0zYRLUOLKvWoiRobx3/OGVtZOlmAKFRV6ZWa4jjegHxRlQxLVZdj/OauBTqUoG76@vger.kernel.org
X-Gm-Message-State: AOJu0YzIpGX+g/dkFowUwv31Z+i9cO5dytZZclu7iYk5uNUSRn/J9rup
	U8HmrFWd5z7yWPosHyOsQ2o17HHUMxWL9t4HEB64R5ZX7iAG5hUMynqg
X-Gm-Gg: AeBDies9WM4Di8+5tS38DDqfubkVYkFR2maZ1YEB/qrFnOaOLyuaUzUsb152aokuJCd
	Gm3ORoJgYSTilp4Ms9V5EB5xQ/9iR1t52w0KTFk0txehYeelJjs8tfDJnGwAMQ3X6t7FTy9Orma
	ssan/kL/QOy4ED/R7CMYj6S14asqV1iCngzMOA48TK3qdLYBF53RNCyzXRxdOLT/IcPWqXNNbIF
	FCmy6pb712hpelcvKczGIfe9XnduV0lPhvLhZ6esXuM0XuaR2ydRYR9L4qIDcFrymbBfb5eDNcT
	V8ro++5zlwnqwr3Q6u2tUU/n+NtDrsByMnrIM8wJqCD4rxldGBQd+ehpbgVzcryqXVuANtCnQ4l
	Tkr7clMp1u8N1V6dUY8Q5SVBsgWkB+7HSIJ0pnHTuFUHmnD10BcTaeLLPYNAOA3JloKb/3Cerua
	isqoUol47jTJVl
X-Received: by 2002:a05:600c:3b18:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-4889970dbc6mr158926595e9.10.1775461194921;
        Mon, 06 Apr 2026 00:39:54 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83e906sm527201325e9.8.2026.04.06.00.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:39:54 -0700 (PDT)
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
Date: Mon,  6 Apr 2026 10:39:29 +0300
Message-ID: <20260406073930.24662-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406073930.24662-1-clamor95@gmail.com>
References: <20260406073930.24662-1-clamor95@gmail.com>
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

