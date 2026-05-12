Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C243BB694
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596905; cv=none; b=H+JGxjwjktrFDH9GsjD0cX7W/AchqsruyxfxENhDaVb/aepauY/it7lML3/TZomjmathayOyxeCk1u84QSjuuAENZBwTowge7xP7tlTiDZ25sLCgbkKK8RxDpl8TUnVLbG3cfqGOS9wCX65RbuDUKeBJqi8umFr7gSkEaN5UBuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596905; c=relaxed/simple;
	bh=RE1FnXeJKmLcxnjfLZPE+aA4Er7Xf4f5w7XRhWJ2yG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b63OLuQhpRChIGKEXs3dK4WzsDiPurYUcxb1BHbtkcQYYuvxfHeXzDJrG4PfmCGLcOz7/hjwa9s+8gC3QGinUZEanjAsUGDmVgMSkhA9X1fKZSF/QMuPMYs700PPwVpIeXOwE2xiy01YJrvHuCE3Ss+xzyadRddS5HA2egR/kgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1q0Rg11; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1q0Rg11"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4585a116a4aso1828912f8f.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596902; x=1779201702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0HvXZD2JH3Hm4dxIzGecREAhsQ21ewQFNBJt/muUZQ=;
        b=X1q0Rg11rqEnmW7xVD7XGEeuKfMJc4d6EosDo10YOEQVguH2kmg6/Rsa8/b2DWRWuF
         BU6vrWp+LNMa31yMey30tT82A0/eW1aGY5bjktN9Qy4qhwGkm/zuGCnfnTxjmGnfgHVY
         tAm4m90G0+Xc30GqM0v+oNicqrdxeSVBOdsYVFZI1DJVLbyfhxsROvQFlVnZm5acetx7
         ulLE++/TNZ5V4kBncYVb9qICU9ENcqrPiFkwS72kLSNqOoQS0DA83gF08woCnb0ZVb7f
         sE/w9mJWV2sGRls+1alrIViIysu4YX+tgCWN1gYd3sRGyPw5S5VEWshuBzImZEYJ/jZC
         XfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596902; x=1779201702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K0HvXZD2JH3Hm4dxIzGecREAhsQ21ewQFNBJt/muUZQ=;
        b=WteOqDzmvDdbqVkcGg27OStbFBV0asQjRqSaxKsXy1DGj3h1m0R4mdNA0oZyX0vh0b
         3mGaKDM0qAG9LGqLFpv4M6UWozwTNeXP5ldpWD4AidXfFrWAvuZ7D/qEi3qomz7zK7hZ
         ib+1hozsat9PR4zzEem5aegw+KgIXNt3Xz6M5FHIDtQxQ8H6IK3A1cVBjXIfnkq/hmbE
         KtoQ1i9y63vmqLTn1BLtXBxmp5ZN2Jo7+e9RciDjolylMZaJWDJMu/ZI3rWeaYcNVyl5
         sobRyLBsZxdaJvQYjHH3uIUFpHt0HSf52F/mLnYI70x6Gnnny0jUZTmTxmE0Hlpd+MNy
         Vx4w==
X-Forwarded-Encrypted: i=1; AFNElJ9rl2GYovGA1YWVjD4RUx4hov8imZB3xZduwLpE5pT2FjQ76NjM3wccqGc2c8/Xh/TUC7uD7UVwrbWH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkt9GjcfBqdDQE9dXjqJ1E1jtv0fMDCyr/aURvfKpHi9rvvAU+
	nyRNQgWIfv8UVZ385SZUfpv/O6sWxjunjSif6y80u6ErgK6hD+kyvimo
X-Gm-Gg: Acq92OHSTR3ch6UnPuVO6yBYSJhNPO/LqfXCWIhvDpKYQOOE4wRi3QidHXeTwXiaECN
	aPc2MKNEivJGmZUP8WAHq405vbs4De0Ia5M9dEuhKtJCB9X9QlKXYyWDSwUNY66w7b+wNqXX5Bv
	W3eo2k9c/R30P85Df+vcpLV4PgGfTX6YGgHq1me6mEZuDcws1vcpMLP3ccgTPNe/bTichpOd8wE
	FbIlNWFBiXZuYXnuKCbrtjOJy1H+rvAO8GVd4Y7zL9UpZxj9QvD1w9fQJ/o3PSm01EFPd1d/dhb
	veAnr+cAWdHJQXZgWyPtGRc4tOJkcFdDgdWVjGu1a5A6JQ8Kl8UhiX+2QtJGd9xSgbaGY0Znzha
	eYNEXfQXfyUh8TZ/VKK9UHeDyvdWmeCxd9wXi+EUj0EnqKpe9WucUnPCnnowuwjl3kOzcaQDk7s
	binh5jsu9bRrBAYf7803g0DumFHn7h1n/nx9E8Fc2FtfkmF1lI8WiVn94C8ZO4lc6v6scnngTL3
	D4vOKs1WD8BxAzaDSBhRqFVPvr++THG4xk=
X-Received: by 2002:a05:6000:200c:b0:441:36b7:725f with SMTP id ffacd0b85a97d-4515b056aa0mr45843437f8f.5.1778596901460;
        Tue, 12 May 2026 07:41:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491cab9c2sm34978713f8f.31.2026.05.12.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:41:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/5] drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
Date: Tue, 12 May 2026 15:41:02 +0100
Message-ID: <20260512144104.761531-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3:
- No change

v1->v2:
- Added Reviewed-by tag from Laurent Pinchart.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 26b95153ce88..48065f4952a3 100644
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

