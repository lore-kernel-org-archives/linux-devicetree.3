Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7CB40FD81
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482025; cv=none; b=pIdekZR/RrSp+R4llM1HB8s5Jx6SGgkTNTpC3Yq5nIFfYzDiG73+45YUn8Zc6ae0otoj8DsL0tB2eFR8hIKW8CicTZGFbgcQ1vszUcxma4J4gPDMvavVagjAFLz6gmn1ndlNz/b/p+W0fgMO9ZrxWvuSkhM9bv0dHOPX5YCtuwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482025; c=relaxed/simple;
	bh=+SN/B0HL5voOgs8H1z2+q5XkZCu6QjgCLQ7MpeWtcac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjBMDOo2yZFkNLuYXfPKiEtLfufj64rO+9XmQLJVQvMjF0uz/ENSRAnnRrKVAa8tzam0uD4HSpYUr4QrLOY/nN1D5nsAEEWx+GjRHahgOqkMdruHLX7L6dcKBZ6FiutaHVQBbtDSn9iHN85Yz7HrdjbSvCeCpLe9XsqfmOZqmQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3fl2gm5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3fl2gm5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so185115e9.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482021; x=1778086821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuDLjeXf2+QKCuCo/9df2ZiinICm/jlzSdG09cp5d58=;
        b=E3fl2gm5sYF3X6DxFMkicnZWywPsEjFJWPITZ7qQQSKqcfKMQJkzmjyVcKd2hImZ+3
         ZSAlJ7yJbcsE+27VUOK3YKO4wL76fIhOboKKy7NZFFC0iFYUw4GGfV2rfnOYGMirOgA1
         LA2SBYf+fg5hdkdLRtFgKFzTqvJEX+KTa+Md67ufG/ye9lKQ0VVJsntFEKgq/GenKwtj
         nb8Cl+6KQDMBmLHR1jJCPgApL9AeDxvRecEDJtQFC0wuqVmygNjhLKZ3p1M0w6cherCL
         ccadohMOONTpfWhnOznUTAPftG2WD27u3T3Dx9iZ6IARi0lM0gtkyMmCLzFzUNPYwadw
         XQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482021; x=1778086821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fuDLjeXf2+QKCuCo/9df2ZiinICm/jlzSdG09cp5d58=;
        b=rSsQ3Bu6Z9HdWfpt4HR/fcZYRkfcwM7qBWoKO9aCqTeflep+wN89C/h98xkR9U4Dm5
         HJjwtjjgUIP0Ym6e7xILIawWk+pWPoGQcJubm8JpKbH1QjWfWDJRxk5Qu74idKTXIR1L
         bIx8W3whrQ/tmGS1dlUSxBd8dzTFTUwKrd+G5+B/6aotNEgi2ZOTXOb+h2jNa9ThYgi0
         T9AmRaDcbNxIcPl63/UWxSqJGgz+W9C78gbicC4BK1d6TRBE8fGRLjeM+ARxiIPcaMgT
         5AcUDvAFAde0JPGMzs6q6bdpvBJ1cObMAA5hSFzUZr6l2VzC4LkxFcvv7tcdNNSxgjBv
         LIHA==
X-Forwarded-Encrypted: i=1; AFNElJ+6VIl/GVP2G6VQ6y6MBR40rztyZwjqTzsYNuhaDMmw4MKPOz7ud82XtnXjbRpdtN2mF4QvDlSPZzn6@vger.kernel.org
X-Gm-Message-State: AOJu0YzX9trEwES5volB6TIMGM+3LANLNyTncwk2l+QCf+JNu5Y1jMdR
	8WisTxa/TF3VSRdQp60z6KhH09CBbOic1Vq6Mv7Wh1sEaSf6JksCqGM6
X-Gm-Gg: AeBDievVFOCTAHlLtRK5dqD1aXHVOe0Rdt/yLemFADavdBFh17po0hloQZQdC4YCUOR
	ex8lb0JTVybbnAAOrmg7+TL0VIvxjnulk9C3Z8m8JZ7GVwBY0DW5WdhLED/tOXEXKxQB3eDRS5h
	xL0nUsiyLCOx9NisdWEcpzseeFkSUG9DSeGlLpadm1yLEsS6Qz+VyoMEEXfnWTbBUfyOyG+QsVi
	jamssAgjNxSdrIlehJATTf7H3bIb97Twx8K+iR21Gq46Cu9l0omDkuItxIyUIr9hkyl9wFE6ez1
	DAc9MAGhu2fXYZvChBg2NaroqIk6EcWIinX/k+y1OulMKkXzrObzgTwsloTxgGv89uwe5FQLTIc
	Oq0wUw7cVL1jdvIGU5eH0y9MfbpqhsYkuk5Iv3rG3xfWPM3wljsEdPRVgs0meeCXBMoKj9LAsnw
	SqEB2v13SPaIho5uc4X+r3cHhdW6ooXkZlfzFYmLxbY++8Xo/naREO34P5hmimxrnD/imF4X9uz
	Vda8bfQZXB811nXLiJwZuVZ0XPoOTIR8i06zg3I6I2Hpm9A
X-Received: by 2002:a05:600c:a404:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48a7bfa1982mr56450465e9.7.1777482021011;
        Wed, 29 Apr 2026 10:00:21 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:212b:3a69:4f2c:3897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm4809755e9.6.2026.04.29.10.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:00:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
Date: Wed, 29 Apr 2026 18:00:10 +0100
Message-ID: <20260429170012.366537-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the DU CRTC initialisation to request the reset control using
devm_reset_control_get_optional_shared(). On RZ/T2H SoCs the DU block does
not expose a reset line, and treating the reset as mandatory prevents the
driver from probing on those platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 18e2b981b691..2b772a11c7ee 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -380,7 +380,7 @@ int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
 	struct drm_plane *primary;
 	int ret;
 
-	rcrtc->rstc = devm_reset_control_get_shared(rcdu->dev, NULL);
+	rcrtc->rstc = devm_reset_control_get_optional_shared(rcdu->dev, NULL);
 	if (IS_ERR(rcrtc->rstc)) {
 		dev_err(rcdu->dev, "can't get cpg reset\n");
 		return PTR_ERR(rcrtc->rstc);
-- 
2.54.0

