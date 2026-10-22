Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690490;
	b=QOHpeWlApssZpn7eLUYAbM5kLmGG18oGqQTV1TVx5R1dXoiY+o7LU3BQzfXxTZugAYJR
	 ovJhOuhqH7VP22xGKC6pT8oo23khDovO+GvuPEA8xXfNncI4Nq+EsClam1E0+cfgMosM+
	 23QVyx5ASeIFUdh5SvQ90UM6sPEzb50hvT+wJ8jGs/GfRvkYEDGPfj73RdPnaCSP3pX2r
	 dXLrkGLKlHfw7rUYsC5Wi71JO4cRL/bWtDBF8r3uu0IX6Qz8FkIZyQv6zX4GP5TXoVp3g
	 6t5jwhwHphySFSPT2Xyy5KUAsQPWm5+OjjIjQ/Agd+gVr3lks03IRglV41+HbLhhCHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
	b=oe9ZSnfrzgbjNXshqre6+4eidWzi5Es5RICAYtHssvCT+tEgcw7nyi/PI7szDXYH2huQ
	 yNzpwZ59/l0/GdYdwFbbkQoJgWcpTloY21RGwW7FqronAwbdeNFzvziLELBATw+eWmrPu
	 0GX/DoKofo+RlhN0koyAlLL6Yc/mHRLdqg6aU3YOV1ab/xJTDTBMlQlboEMsP0vmnSRbW
	 wzxpKH6fMiGKI2RngqREZI7Jlnd0oxa+gby7KScBdAma8oyBXx8hDKZrSpOStRzUWsU9z
	 +0AYecFoJJIX0QPKEvsJhEFes8AUXn6CwKjogkqWpn1kGcBFqWTm8qfl2xUb0+VguBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=mGUd1+4c;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A2860A3810
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A2860A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=mGUd1+4c
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so629395e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690477; x=1793295277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=mGUd1+4cfXktWsyBYNjeYK+/XNNw5ptG4mkEeyVNHplldJVcnfS7V1k7FwPVTelFtS
         NfdmKEquC3VhjCJ2XsyWQOYIxgam7Z6MeSbLuWn5T4yJptEdxmE/RM7owSIg1ynA1FcY
         DPxaX81GlTdZ8GF9IWL/MQ18HQoolQoOv+OeHiNvV8aWaO9Kj4W+IfIH5kgAQHH5uaVf
         vagzqS7tHTLRTIc0Xkeh1qOiWEmLkG9FM8UQdlIEEf/X0jEzWlpxIqVRITZEKhAtO8SW
         nsSLmYtbaCOeEMVUIrhlsq8d+Hr37oFaXfXGmwrt1Aq3KdMBanGQgJuv746K94x5jX3/
         fmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690477; x=1793295277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=hEmRSQYCfyiT/ntV37cWouPcuhawUxM5LI4kkmMxK8GkHBC6mM4Ovb3nO77KBqGZyh
         R15iJ8f1U5HPst+4pJ8vrkkQcUi1liYyQwl4On5YgiLxg5gb//i4L/F1fq63LD1c6GEl
         nuY1WeNeRHjey+daHIyetZOPsGOKsooxrQiRY/Oq9pxBFgExyyVBdyL70id+6g8qOd3G
         qMHPGZINv1UbOC/9Cryo+rTg0k0H/yPeEwlJddk4WbgclJDNNYn/Iek2SNx9P3dqFWmt
         TN4cbhSgzQ+TzRNzn0/zDsDzGxCcVjtUPcmgYYBLHXRMROeeKk4JgZesLfozOB4eiGqX
         t7vw==
X-Forwarded-Encrypted: i=1; AKwUvBwgRFsLkm4EOPLDlTKFmM2Usvy1cvXMIfn9rR2q5eQqAIcDqdJEtvw9FqeqyRNLarLnLe1qoj8K8kIu@vger.kernel.org
X-Gm-Message-State: AFq9FYI7BfZcXep+35dglGQD9Ry2g34sHYWZ7QS7BqktWX51bINncihA
	g80EiEgb9iZfNfL5HVbgszDs2+fT9j5X6XU/HObArOte/TNzO/huPA2wEJXcBVgheU0=
X-Gm-Gg: AYBFou3wZksZ9D7P+c0IRjWJcqgaEfNkbMeeu4kfgJSG741Bx1PZpY2CbOEo2b8FkZL
	FHQdeAnP43/YGtsFrVnf2XYYKfSxa/IPCMeNyLl1ZTUSon5lW4PIOyqvPB/aFbVoN+/s7vouqf9
	GfQQ7TN7b4CJDPDhCCx2pZ+HO4c6qo3WnXwFmNyJAFqh1jRg+jM/Vxt+a9a7iOqgLT+ybFIO9ev
	vcARX6sEhKIE/nZd3xFisKq3WmnUVQvetYuuGERgZNaGXHdT3y59b4A+GbkiSdhpA88P7dwAvet
	oNJQSr/2/zw+/oUqpTU/hD3G4A+pz4uF3fp1Vfv0bSVZx6dQIdT1Vg1yHin7Qwgv8XOI+GQEkeu
	ymYq1iF0WRsytLyUg6JMM+KU2BMHO5S2KwClbMcr/dklier4BABMr8XYQmSE/UKB/5QrDh9m4Qf
	Vvmzdy6nlM2EvvZwgcpj5DXoRSFF6ojh3oi+mvH5ieecjjRVx4lcaDQXWrU9hacezwfXUmnJgIW
	WPFiIC9Uigrn37m9+gKYaTHFKvuKKWu6wbWyyriZrOoTFRAFABWfDyHmxnEWw6LpHyTtlWrbUkv
	VFBIXRNjq9HGGFEFpph6RD10DoN6thc=
X-Received: by 2002:a05:600c:4fc8:b0:4a1:bd69:526f with SMTP id 5b1f17b1804b1-4a1fd8a7d9dmr129819385e9.4.1792690477435;
        Thu, 22 Oct 2026 10:34:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:36 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:02 +0100
Subject: [PATCH v6 09/18] media: sony-starvis2: Use pm_runtime_autosuspend
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
Message-Id: <20261022-media-starvis2-v6-9-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

In order to reduce the time in stopping and restarting
streaming, use pm_runtime_autosuspend so the sensor
isn't powered down.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 95da8a9e671e..27357cc293be 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -858,7 +858,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1049,7 +1049,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1072,7 +1072,7 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 
 	__v4l2_ctrl_grab(starvis2->link_freq, false);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1447,7 +1447,10 @@ static int starvis2_probe(struct i2c_client *client)
 				 NULL);
 
 	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	ret = starvis2_init_controls(starvis2);
 	if (ret)
@@ -1479,7 +1482,7 @@ static int starvis2_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
-	pm_runtime_idle(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
@@ -1494,7 +1497,8 @@ static int starvis2_probe(struct i2c_client *client)
 
 error_pm_runtime:
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 
 error_power_off:
 	starvis2_power_off(&client->dev);
@@ -1516,6 +1520,7 @@ static void starvis2_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		starvis2_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static const struct dev_pm_ops starvis2_pm_ops = {

-- 
2.34.1

