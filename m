Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0187242925
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286426; cv=none; b=DXAO+lbHItX+khb5CPBa4qn9lsjoUOebzx1F+pzOPjzFvRUDFShkYJutJKkcub0p9F7tN9tXI6/tSpbY6ekXhA28rT48tgae8I922Vg+B88jNdeIHqkPLXfyq6mtjuoJtNCbWDTB3XVje8skd13GAcPCbGvS0AghUwYDS6yFOYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286426; c=relaxed/simple;
	bh=sJB8a2Uid+eUS/2yZz14rm+h24VJn2Vq54W8G0uPAe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRwXfbFuoy2E5lnxbX3bJY3bemy961yHJZGH0v9o+Vi8I+b/kvs+KInwyI7CfuYttCF9T+1Is5B8UhVcaWLCqe6R8zS7tX9AZTc21wwfL5MYxIYt/8g/Gt5stP1uNkGUN4KYkMrVMDo41agVFVHnSwqbakeX8Ayl1Q8Ayf0Drz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qh2UR+x5; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qh2UR+x5"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144efd1ea76so197579c88.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 14:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286424; x=1790891224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vmbHwdbLykki4BBoXNNKdYpZGlaAV7d37IywwLOJY5w=;
        b=Qh2UR+x5m/X4zSjGTGkjLEAzXh7blP+yv5NC8iaE59/fOuLmKYAj50+YCa5mWeghAW
         Y9lQV3xNhbJk0iW5A6clsA7/ePLmPnepinKo8Z9vWJ+2vq7QRMPlmwsRYGIdqPxD4SQj
         Fnn25jwqDCN/vn8I91wUeMYr6JMhxIRlnVPzQ0plLWjzg7Kp9dKSj4MHY9+4TYCfDeQg
         o8Y7kD1/CP3+kaNPljiZflKCF1JBDGpHaIxFZgkDwVjg8dlOYq3IsLJ25XGPo+GHZUqf
         SupBVE+aq1/+BJte3J65BDBcEA3lhwXvOd+nXevBvvajhla55/RruF3U/tOVv0X0jHuN
         g6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286424; x=1790891224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmbHwdbLykki4BBoXNNKdYpZGlaAV7d37IywwLOJY5w=;
        b=kXLvCESGhd1SNxGPrGEH/Yqx3SGNeEcEpFNmvS5Zjw83d05r0IqhWGBWO1hvpYFNw4
         PO916Mo03ePkZKM+cBSvIfq9I9j0w1j1jwukZdTweExHz64y5B+/qgA01Pun0/i8XIHN
         bFQIs7MJG4Mxphv+wPwUQrRhKQiGK0Ud0BDwYhMrSW8Y0g26idL4vS6cdY0ygbGMIYor
         BlHHoH8+c4xYWW1WbizfTGPG4n+w34mv709wYNoVkNr6LI70Y/owCEyX3HpjUZyrwhGz
         A99rzSqyVEvQLZaqTKQN1yWC+W9td8YMgWXzj9UgAIT+fo98/XZlSsU8/zIdtPT9UxVg
         f3fA==
X-Forwarded-Encrypted: i=1; AKwUvBxxPTk+qlQ73sI1+g7JxgNLebifMMT2MMkEl58+up/hV/py0g0R3M5DOmYwNlIVLpzpn+GVa9t6AWPK@vger.kernel.org
X-Gm-Message-State: AFuF++nO16iJBRsvDTz4GKr2mGU5Sj/bkbrQUdHerHr8b/tu5VBWBOKx
	u+OiRmZGcnxHKKdnYEhMMsWZRcBaU5ioDdQIJQ0oD8X12KIZAIrBGPA=
X-Gm-Gg: AYBFou0UbFQIWcDQK+myysC4zPXyTojBbXS5JyooCyNqAv2tgtQIBv9SzE/aqEV3F7K
	pH6gZ3ErryDyl2Imv5yunCaZiGwsmDPk33f/xwPdICvZcHAtFm5S4v4PGiU/0rEOKhuLV9bscNY
	n3kl4wgfg8exkgQkFp9Y639PmXWHPXOZkMUpkJRA6bP3DzfRVxh58eYMxJN8ssqDxav19aogDvL
	UjyfKC0K4XLbszPr0vfZ02wUZ+J3x+m76N9jfilGb4Dfhgh1L+lAfe1Sn4SGM2fBmM85AlTmcoN
	m2fJk590XsU5aUEW+ViADys0mqVkmbslkUOtBWwnA67ZpWUS3yf0rbf9OofacTI6B8TWhWAyhGG
	Ybl3YqNmQV126MOPQr2yN8/BM+Beh8Xfw6G9CH63gz4D57sE3nVN0s7zS+meqWpMrVVyqIWw+V8
	H+v7KmGbuhR2R1MhHS+wSQpZPRR3MkVn4y3vwv9BWEyFBCYJLz/HIUAQWsteTp0/QGaq+SvQLZf
	9kmJUbDcoIEGHfk1t0G1guGq9V9Vo3ff7GlAWu5uQr7C7Wdlg==
X-Received: by 2002:a05:7022:3b0c:b0:143:761a:863e with SMTP id a92af1059eb24-145040d406amr4150298c88.44.1790286423822;
        Thu, 24 Sep 2026 14:47:03 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm1171577c88.7.2026.09.24.14.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:47:03 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: nico.antinori.7@gmail.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: christophe.jaillet@wanadoo.fr,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jkoolstra@xs4all.nl,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org
Subject: [PATCH] fixup: remove uninitialized variable bl
Date: Thu, 24 Sep 2026 18:45:57 -0300
Message-ID: <20260924214640.6149-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <29b7f9786f08989c8f941ab85a76c62d1f5ee43b.1790200427.git.nico.antinori.7@gmail.com>
References: <29b7f9786f08989c8f941ab85a76c62d1f5ee43b.1790200427.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the uninitialized variable bl and fix the IS_ERR check.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Small follow-up patch that fixes usage of unintialized variable.

Apologies for this oversight!

 drivers/gpu/drm/tiny/ch1115-i2c.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ch1115-i2c.c b/drivers/gpu/drm/tiny/ch1115-i2c.c
index cb6198a8e55b..631dd25e7dcc 100644
--- a/drivers/gpu/drm/tiny/ch1115-i2c.c
+++ b/drivers/gpu/drm/tiny/ch1115-i2c.c
@@ -751,7 +751,6 @@ static int ch1115_probe(struct i2c_client *client)
 {
 	struct ch1115_device *ch1115;
 	struct device *dev;
-	struct backlight_device *bl;
 	int ret;

 	dev = &client->dev;
@@ -802,8 +801,8 @@ static int ch1115_probe(struct i2c_client *client)

 	ch1115->bl_dev = devm_backlight_device_register(dev, dev_name(dev), dev, ch1115,
 							&ch1115_bl_ops, &bl_props);
-	if (IS_ERR(bl))
-		return dev_err_probe(dev, PTR_ERR(bl),
+	if (IS_ERR(ch1115->bl_dev))
+		return dev_err_probe(dev, PTR_ERR(ch1115->bl_dev),
 				     "Unable to register backlight device\n");

 	// DRM
--
2.47.3

