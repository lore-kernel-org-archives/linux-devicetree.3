Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1795C573F11
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420117; cv=none; b=ooBgtEPqWpCc2cNFGecBjfXDKeHcSwxUs4iPY436b6Kxt7Pep8vQWLRP/pl8iH66l0uC/woOBFcLj/JRgyQhC9ds/+xwzRyVXMhGTQIpfMBJ2KHxjMXttu0Lkahh9GCL7FLVTZWSvP8wYjAGwJYCi+v71cq3n/w73LzUiUd8FT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420117; c=relaxed/simple;
	bh=Dlp9dvCWyvLZX07fGEIkpoh4ovrZtz1G7eMIL8kOvVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1eWUVhpJSLY5Sx9N55sROylky8onkIavifWUr86lq7/UJdXTbGc9n7rOMnyGl0hf2fG8XKIUu4IUNOBJ1RXzKTeerW/ImNfr2fz2OF1Q9WSyBZkDChjsPw7D4x75Kqi6Er5bcu4hdwnlTG+rBW/TxcQnqwJ0rYRZT4nHXXtJxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dCgK8EAW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dCgK8EAW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfdd431dcso1708906f8f.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420113; x=1793024913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=982z15BDKZb0isJxEAdL4PwLsO3TFCY/PrvmYCW7d78=;
        b=dCgK8EAW5WLK5QZBGNhvHjrUciwJWKp/RvJyzOH0Jnrdfs4MSxGYvivPt5P/rBve1I
         a1rKwaC5S6FQdRiv+fjZp9NuyCQrJIPpNuPvbtB9uleM9kScA5+RIllQ+/hwp96YK4Zr
         rj1nAVFcHdO/UCRF53uFFSSVvnKQz5ONEQ35OhlJjBAYYRvH/ir8MlmoVuxe+vqw6Y0u
         8ABGw8texoIHB0yOGPj/fdDiXoc3A0lwUZtIgd0Zu6IYt2kLzHaoGbQWCVp6eI3dDEhB
         M3lz8pBizC9sVFa5jk4z/LdTalD0fcpBSzwgGlvpCWGoCHsmribnrD3femyXHM5eACSr
         PLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420113; x=1793024913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=982z15BDKZb0isJxEAdL4PwLsO3TFCY/PrvmYCW7d78=;
        b=dbJmedByALpLssVfP3edoMmELoBqhlOqiH5sgYqJT6jlF7W4qMG0oAGvg/NJnqG+1+
         cccWhzuVEQfpFO4LrDyToDGgFIM8zVsp2oESd5qR0vU2GogvOxVq6spQ6oYzswWuHuw+
         UK/1/GgGuxzXKJknn47PwdRHfWlwXB/JiRoNi9XqphUdCTAIfHR+0Kc13lPcX+pzyD0g
         laleOMVTjmgdH4A9hpDqfDE2+wP5cfcSEBaj0HckQzTBj3YMWdcmR1aUbXfi5QrMeDGR
         c1KTFaBk/16k3dX/a3dXN6S+9uNIqakmZoXjVtcVaWuQCNTa0LcprxIoeOVAWXIumxd7
         gKqA==
X-Forwarded-Encrypted: i=1; AKwUvBw2ysZQAcHlV96oV1iN0D3cF4nyhBPI6LRcAIkXfm9f8x8He/UpHYvCjuYMbWiLDaCu6GKbjl3VxBIf@vger.kernel.org
X-Gm-Message-State: AFq9FYIFWBi3YyoMbfhpPUoAXzqIlKnEwiaiE+7h8UByKkWdrtAVMna3
	3i/IATukEe/KfniAUNQ8y1ujFfdbzpCj/IQXodXMW+JYf+uwMj3br87HmKC/YhPHynM=
X-Gm-Gg: AYBFou2mD+J375mRT7el5AyouqB8C+B2s9/yP7t1gIwvS3p3FIWVGRZo5I1IcFEM7fF
	p8SylUTEP16tA30UR0MwUo/DoC+72XqsajIhQWXbDHpy0J7In84Q/CV2ijeYVW+qMhgNwTHZA/u
	ta3iowOrWCPx2/J54cVEnl6QoHacYAJELm3ZQbCxOD60Nz9oAkjj8C+/ojI2yL3dQ5rwVCwytKx
	Rx7C3tQiUL9QTk/GdIv2eMtXZz6JAXDo4c81+vy9ODEKlXCXUrFkOA/j/67AIGfno52kyvNeE0F
	nfDr5RS2hheFUdGQpSbsDRxF1FAtQ68vZmqbDwMvJ1vUOrbg8r44uxdinw3Z+4KIKuf6KHMnCfg
	o3jOCEdOlWqCS/OSft+vLdiLF16udIuOJYxcqbKEz32ggHmdNaH4IKoxmsQzijbMsiFWQ0VGSgG
	5RBGMhOGHmLP/TbIczoFib37jdp9lPIvzp/tOklKbXRfFsvzr9v1fAfLAjrsD+Z69rW7Psn/4CS
	F88vl3arwN5dlhfi+5r5Ngg0SxiCrknXCdCwe7U9UmXGW6My3VnaqnfCHH7
X-Received: by 2002:adf:fe04:0:b0:48d:f1ab:faf9 with SMTP id ffacd0b85a97d-48e07bbe7cemr12107769f8f.16.1792420113202;
        Mon, 19 Oct 2026 07:28:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:32 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:16 +0100
Subject: [PATCH v5 09/16] media: sony-starvis2: Use pm_runtime_autosuspend
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-9-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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
index 2388105b6a30..bf14768dbf98 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -858,7 +858,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1047,7 +1047,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1070,7 +1070,7 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 
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

