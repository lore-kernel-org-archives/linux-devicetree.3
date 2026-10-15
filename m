Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632F053FD24
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079888; cv=none; b=IYmgaBDJU0VIxLwE6bJM5liqMlEAzCM9qxMiiPX6k6jBd1xzq49MSfYr23r7gOWkPspQwAQqN0/8DGLHtiikcT89emCYqMYxp7IweTJj0b+klxbSn57kQ7zXCFn+EfuWwm7sRfQEZ7IpTb0hNTaBOgJbP6T+jwPdypy0TvdNkUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079888; c=relaxed/simple;
	bh=WzSHl5a/H3/js9LTMTbl8ld/1JpeiIURXE0YgudYnNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7UfgRNgE2HG36kT9PdUDT81rNZ7mFekCwHoP5sZE5ZDwVs6IVBTpMHttbcAMv42a0g8fY76GH5Kre+mIwFTzRFtgM+akVf0yGHY4Z6oyWjV0SpUWoostKqS9HaQcpuiJQJU/trnQo5feN915FSjyPeXQSg96qrb7Yrh07piZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=VaQxSVfC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VaQxSVfC"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b060ec084so3580326f8f.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079866; x=1792684666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RO/skbJbno3lgmcwBPXIqDfSZdYNz13tL9r2MUMGxaE=;
        b=VaQxSVfC+jeB28fPXmVh9hg35errO3WnOqdKN8MejbqmlPGohBikitpINRHnI6oTVG
         yOJui5wzENkF3E5Y+qvjcF4lMhPAJFZ8tJ89Q54t0CvbdnG/BRryUJDTxac4gvcaoXcy
         UwoQmNEX8x6rO1xYduXu4BHExyffAJwcrUwsIHYoQgNOWVPFJS7j03iOfDEKP3nD8Kga
         DEVBE1W4Tr5lqK64QCzBDt5VmDfUuquqqQgtvi94du8mZwe9LMc3BlysnAoybELPhWPd
         p9yanZTq15M4sd2WU1PLLTOr6EOWoPbEI9ijxxvQ+CtyeBIj63Jf9WdfyinmGh7SimQ8
         IlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079866; x=1792684666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RO/skbJbno3lgmcwBPXIqDfSZdYNz13tL9r2MUMGxaE=;
        b=FHv166G+Row9ot25QP2VOIpEpvp55jLBEs308ObLcJzVbLuV8XAzP59046bCAn2w8K
         BzP82kUptQ/TFyO8adUs2nX6Y+MItm8PZGfc6NYEmzKoCeEiKkW4yDj1msEcjRENZLlS
         eY7VAj6YncvQKuFivLst7Imw//SFOQA9GntYPQRASejh30R5IkXrxE6QcHIvmucwEaJx
         P3Wg1J6AUr6AEBmnZYTSPkbi/faQTwRA+u7JX6FLMG2I8lW3Rg+mZotQrXHcmpgd2fix
         HWuNxJGyPQLYob2wE8MEUXVn79VCL8sSTopCKfQDaRS5/APDL9LP5aYaiQtvIqi7rP7y
         M9rA==
X-Forwarded-Encrypted: i=1; AKwUvBznRPKoxv6PqofAw5FzPz93co7Sr76SLfzfG+Pj44gciwlhFx2dn8xNKoXaXav0BLDBtZfe2C13RRAf@vger.kernel.org
X-Gm-Message-State: AFq9FYLOvxn2BNZjG5YCyDDE2VoG5AumDwbmq64PKNwsNl9GJCUxwzSz
	FikjlTcxYAcCHEmPx5Hh8HxW9pBiM8qhPmYF1cPR25sMpzJCf6FgJLC/PRowguq02fY=
X-Gm-Gg: AYBFou1WrZpMd8bGeBs575MN6DopvpkSB98UScUmd8APlpRvCLpIT0uzcuaTZAZoY5J
	4wQU6D0Ims/DP/C2ig0GuPuSGyU4Huv6DhZ2JTnGBOJHsnPxCHJoNyAYKiBmFIyrjt4vAJac/17
	JxnSjpIx7vEzp57yUN8KQQoWY1aZOROPNF1iQjHmm3XE4OukJSQnLjFMcKQxNP0er3YTJIcPNBv
	KS0Op2LfbasuPrpIW/0VSnFcAH6lZ0T4gGv/nr6TxpjweSD1dJkAIXtcy/tP9Xm1X/9b3RJh6z+
	s8wuWXmfGDU/jJL2elW3D4T/9dYaNuyEfKF7dbdUQiFUEHywRHmouhj6uwe4dpzT9YM6WFT9ZUz
	RvYR46Jh1KsTpKv1l7uz7d05+spnKoBtJKI2m0c7XiixMdU9RBYyYTl/sMyQRrmA7EaqjbT/OOk
	OMS6fnSZrdQ21VGw2T63kRxEhZLeJS7Yk3Qa0FlJk6GkRtStVLWC7fmeDTKP0oDI3wnh9bpRKia
	FWA+c82d5MivPASIISKRJ/+q9viFvKSC/U7F/+lh2xnrv2neg==
X-Received: by 2002:a05:6000:2610:b0:48b:60a:760c with SMTP id ffacd0b85a97d-48dbacdbca4mr39528635f8f.31.1792079866485;
        Thu, 15 Oct 2026 08:57:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:45 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:35 +0100
Subject: [PATCH v4 09/16] media: sony-starvis2: Use pm_runtime_autosuspend
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-9-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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
 drivers/media/i2c/sony-starvis2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 49dcbda9ecdd..dce150304dc6 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -858,7 +858,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1046,7 +1046,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1069,7 +1069,7 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 
 	__v4l2_ctrl_grab(starvis2->link_freq, false);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1448,6 +1448,8 @@ static int starvis2_probe(struct i2c_client *client)
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	ret = starvis2_init_controls(starvis2);
 	if (ret)
@@ -1495,6 +1497,7 @@ static int starvis2_probe(struct i2c_client *client)
 error_pm_runtime:
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 
 error_power_off:
 	starvis2_power_off(&client->dev);
@@ -1516,6 +1519,7 @@ static void starvis2_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		starvis2_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static const struct dev_pm_ops starvis2_pm_ops = {

-- 
2.34.1

