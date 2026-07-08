Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D8D434E50
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522169; cv=none; b=SQC07YvgaIh1rTorC1vfgalfkxa2T4nCvYemQFEOZaGJepLiIRWoX0WHZL9WbrtROh2/Iskf1dBmKzcLGwJt8enyXfJcD3GWlzfGO6q5XVB8kvexlwdD0LJxNtUsrAjxMZXrmEgGc1FLR8VvmTmIKcFcobv5wFOzUW0pCiEqRAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522169; c=relaxed/simple;
	bh=HkxE7QDh3kVaBT0axp9IR5qPsGPYXHxX+yr5prLaKjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxFNPKTU/KnitG4xiCG4qT1ovNotuczCgQIrKKNcUdGTLckBnugYNdAwBIFrKTpD6qrl3dB4w5YOrhyFKMiKTq6OmewsVOYmqnlJZT9hM5Z9exjGutsuHxkLYD3K+nnG2xob8quhHu7hdr1N3k/GkaB29eMegTYT8QFI1pXNqwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Hj37vLOj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Hj37vLOj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso8041385e9.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522159; x=1784126959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eznbuB8Cf+t+hvmFqCai3LuNPnGzE5omPSOsh6CmaE0=;
        b=Hj37vLOjeZ7jbyWdqakFad9/Qbf8T+venr92kA+UQriuHPKJ6nwnB5cyVPsFF5/jJm
         rgVZfDLD4LgZNhjxQt0QQ3ExSu4LLP5qeQpeGfexMat67kNkmnZwTo0Dwr2hSgoB7jjF
         /ijKCWBmG+ZITrkcGm79A2QDYozr8BXK3pGhm857XKQjJvou1z3ZUiPqhm/PG6R4Ykuj
         yE9Wz3NrHLwmV14ruAo5S6oPsZRy3GzgsD5oRuz7CHBQ53orAaLtyXoyNL0wxAI8RKIf
         WLXDzOEja/rQeIMps2DmYQcrhgDbDFGqHahbpczGH9mqcrLL//k21c6WDqPsSD2ni/rw
         wlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522159; x=1784126959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eznbuB8Cf+t+hvmFqCai3LuNPnGzE5omPSOsh6CmaE0=;
        b=ImFXK0fIqDZ54dpPaveZYK/rnPM91tCkPxwzkVCV9BINkf0ELU+PS3eEq8icp4+iGI
         4Aqb1bEaOgrDYmNw7m8RtV/viETsnmYN361BxsgvqjT/lCSJP5pX5d3NiG61woZ7FWiC
         AHcMExDedP1HXIlDDIKhU0nPscG9tl38Bf7b9XV5dH4Fp9h5HMOXPsLFT2YaxPhwZt10
         UrN8gJ6sVANWHGl0DFApu0W/1myFvU5S5co8LB+EyDDmxb7upHGu67E5A1zvtAgUesQe
         PhlAWJHMv4H5RVieV5EyPuT+osSGqBddWdtlgDffB7R3bp1LTUBTCeNK2HH4+c+HXujm
         68vQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYx1J7Hj4J1h/iA64bYZbR2Bg3jzIHcsWxIarvEicxjcY5BruVXctpM0xU4yFlIRMunkgKBjyMinXf@vger.kernel.org
X-Gm-Message-State: AOJu0YweQdjvFX3z8bVQt7mcsx+NT65ATtJQoTVVZ9d2ljt0hMJ74ZL1
	8+jQeFE2ipsKqZDBUikdimQgaS2Mg0oG0byiN+HICmv4i91gib/+YLFZDzJ9pNi00Hc=
X-Gm-Gg: AfdE7cnx7rPNTpEV2ZltE9iZ1j1UJ+NWSLE1eDGgAkhsU6xM65SPAKvr3Ex2FS+nwxk
	Ifp5CeXmLkaPdujhh626+yc7/AyvtGYHbjAG/GxSA6rTYOS+EHF6CxYRnJEFbvdxttV1S+WHF8K
	7z1C1I0AzfQzNgtgomMAyEndkK60xs7ELQDCMSGlqtXOMu6o++nKnFEb17w9EPhBXRZz+Ol40M0
	9mU2pjOujv0spf39Zg/ugMSDs7EgxhX0+svIFgjXXmYJgZ+sBHRB9Y0yNseJYnZfGlcGiy8iq1N
	tNO3uZSQ2o6tKfGJlB4O7LQC7V/6/cN3By3bF/0oqGw5bpZyqmHQnrDYGcYYmBY/HYaJeBMwYbm
	ZjULDPvqY7+8z7Ger3J5vbRBAbkY424hSBKGqWsBXa2UtlY13Hk46ikG5Noi1QgxiWl7YWmO5il
	iy05B91HNo6mayl6piZ6C6NwqlVF7wR+bMWuWFUjde4N12SbWz5px/CoITw6KdH9rchJTf85Y2t
	FA=
X-Received: by 2002:a05:600c:e558:10b0:493:e57e:7aa5 with SMTP id 5b1f17b1804b1-493e68c6e63mr19742845e9.22.1783522158971;
        Wed, 08 Jul 2026 07:49:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:18 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:48 +0100
Subject: [PATCH v3 12/20] media: imx355: Use pm_runtime autosuspend_delay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-12-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
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

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index ee1f41a66a0b..f01a1a5ae7c9 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1073,7 +1073,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		imx355_stop_streaming(imx355);
-		pm_runtime_put(imx355->dev);
+		pm_runtime_put_autosuspend(imx355->dev);
 	}
 
 	/* vflip and hflip cannot change during streaming */
@@ -1085,7 +1085,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(imx355->dev);
+	pm_runtime_put_autosuspend(imx355->dev);
 err_unlock:
 	mutex_unlock(&imx355->mutex);
 
@@ -1436,6 +1436,8 @@ static int imx355_probe(struct i2c_client *client)
 	pm_runtime_set_active(imx355->dev);
 	pm_runtime_enable(imx355->dev);
 	pm_runtime_idle(imx355->dev);
+	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
+	pm_runtime_use_autosuspend(imx355->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
 	if (ret < 0)
@@ -1446,6 +1448,7 @@ static int imx355_probe(struct i2c_client *client)
 error_media_entity_runtime_pm:
 	pm_runtime_disable(imx355->dev);
 	pm_runtime_set_suspended(imx355->dev);
+	pm_runtime_dont_use_autosuspend(imx355->dev);
 	media_entity_cleanup(&imx355->sd.entity);
 
 error_handler_free:
@@ -1476,6 +1479,8 @@ static void imx355_remove(struct i2c_client *client)
 		pm_runtime_set_suspended(imx355->dev);
 	}
 
+	pm_runtime_dont_use_autosuspend(imx355->dev);
+
 	mutex_destroy(&imx355->mutex);
 }
 

-- 
2.34.1

