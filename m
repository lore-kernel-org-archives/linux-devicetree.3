Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE9D43F4DA
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443989; cv=none; b=ZbrgxAP8JpCQDyS5OYieroJ3GOUu0GYPrl1U38bpBTL3cCxzRksVY6MHOh5mMjYgbDLhDQ58z1uPOSr4svEFurNJ4daK2dYrKgzV29R+ny54xQUWM1Y0rJEYmusXiVQig7XwxYOSN0dzKkzIlgfgEihtaOylV5hTtLXk7Pl1Flg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443989; c=relaxed/simple;
	bh=hWwgN1rgVsfG+IOsHmaNkfe5uTyIFqLWbVzU5xF9EH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svoFlUZMYbgSTWn4k8ah4j92E2URq5QP91g0tnR2lAZZJYBNlu0dPwRWinTGuPaTtfHl6FU13NtzOecqjCvjXuQ0xniU4Y3mp3EGcWp8kpzshwyQauCfgJqzoJ9a4vHVhyCiiIaG92JFT+Hua2/3BobECZZx8wfcaq0joYnhq7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KdZjC0LE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KdZjC0LE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so31067765e9.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443985; x=1784048785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bccJ1ASu8G06+vHF+5rGf8wvqN3zM9iJAYG4lPkCziY=;
        b=KdZjC0LEKB8k3h+kGOIZCFRqoLh4OLIu9XiO9FGRTOizWdHd3ppCLGuJ7Mxvwxv9ex
         QrvXX2gVE5V7xsYGhYjLo0swvJ9T6dd4zHEbUyaAHhL1Af5oyBJou5a4Fuo26UkoMuM2
         jLtk0/JTpz8RdG1FipLQe8zTIvF8Zsv84mIetLDuECC8qcZoE8Z1U1VlnsW47Q6Q9UEN
         qaLn8/T0U+tDWLRyQQ/6MgRErqkLiIhJakrTsFy9pTTpD6lnGzuf2Z11Ht6moV5NkGye
         PZp6BXwD4lGvRdLmaYpsEldMGvbFtnQQWdjRe0DXV7TJu4lCo2FJFfoSh68nangAdxmK
         yZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443985; x=1784048785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bccJ1ASu8G06+vHF+5rGf8wvqN3zM9iJAYG4lPkCziY=;
        b=ce1ko48SE/UvSFShwlWpq0q+AA2z4xRQ9lcyaFnn4InVqGCSMltsOOAVx7PzJDaSd8
         OUpqVm+2qF5tnb5sLc7IFuQZ15DOm2m/lLevODp6ZEZxRnJrJN3bxK8mcuydVfY58CgU
         8ahf0MPSKTqPDaMtjkrrLuB1LvwyJbhJLFUFW5OFM+S1zQ7z1Cm9T7tt5GjuTY8i44mT
         P5FwuYHQNVdgxf2j4GQbz0G5/7n7f/imzYxmEUM5p9rl+436pOdMdy8sgOkb2qRxMNmX
         VlWrN/graR5DRVuv2QruniDDec+zzpIlw7Zb7D9OG90WPUYOMqLmtrK7Tgbu/jzE4RzV
         TL+w==
X-Forwarded-Encrypted: i=1; AHgh+RrrntU5sWdafbqUUiUuSLMiTrh8c3Yy8V0Dz7ZDAa7GaZfXf7ZmadWkX+gEODV9+XAHBJKX00fV2bvq@vger.kernel.org
X-Gm-Message-State: AOJu0YzTCDf4tRuqFluQRpwZwl2I0kRaZ0ZhD7TPWRX6z0G/N3Xv0XNO
	TKKoi+QK56gGQOea4bftY5jaBhPv4eE1pCvwIqoFgNP7rCIqc4YVT1Z+izWG8dH9H5E=
X-Gm-Gg: AfdE7cmsYDkSvEP5i6qvdceW95SNkkUAWZvGItnVfWWSx5mz8TUikXCDdEL2YgCzff7
	whO3mdgBhgIZRaWPSlXtyfmvqQvSvCeAJe/7SArKF+Fqcn5ShsbJVVXQO093Rctf2HyUdbvvPyU
	fs/QdZQenk/0K1XqlAun2z+TMP/SiTY6TaVYp9F3rpeIeoYwlRSqcR35gZTon3PJorBUFUWGbEI
	9I2ovGGXHmv8Vy3gCiSaHXvcUHgOLs7NCb/CsJ8MaCbXaA0m13v6dHgdkee7vSjSDTdTQ6ZNqci
	Yt5aNNj4rIWsmiVcPKzg8ZZt0l4Eb+uJsBc/MFj3h7yq3HhfT4RGcmcVvnB8cfL4fUa8ORwOLnD
	pfE9qGBO0gsM+AiAfAY/z44S5wP4/KzrZyFVAUQV7KqIq1dwKRRUQLXlQAjNLs9/uMrdbcpgCvD
	+7IX+xfsabyeu0qSiGf5dUW3sNki7S4RuTMda+kYh75Enzrnomgy9k9SClkBdCRZj+
X-Received: by 2002:a05:600c:46c8:b0:493:c3cb:409e with SMTP id 5b1f17b1804b1-493df0405a2mr70145955e9.15.1783443985579;
        Tue, 07 Jul 2026 10:06:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:25 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:44 +0100
Subject: [PATCH v2 12/20] media: imx355: Use pm_runtime autosuspend_delay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-12-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Avoid powering the sensor up and down unnecessarily by using
pm_runtime's autosuspend_delay feature.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 0f5fbe21d7fb..c7a24c69c0df 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1067,7 +1067,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		imx355_stop_streaming(imx355);
-		pm_runtime_put(imx355->dev);
+		pm_runtime_put_autosuspend(imx355->dev);
 	}
 
 	/* vflip and hflip cannot change during streaming */
@@ -1079,7 +1079,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(imx355->dev);
+	pm_runtime_put_autosuspend(imx355->dev);
 err_unlock:
 	mutex_unlock(&imx355->mutex);
 
@@ -1430,6 +1430,8 @@ static int imx355_probe(struct i2c_client *client)
 	pm_runtime_set_active(imx355->dev);
 	pm_runtime_enable(imx355->dev);
 	pm_runtime_idle(imx355->dev);
+	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
+	pm_runtime_use_autosuspend(imx355->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
 	if (ret < 0)

-- 
2.34.1

