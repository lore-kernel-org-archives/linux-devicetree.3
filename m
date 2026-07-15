Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3C9472794
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115865; cv=none; b=IwRVj3emu9tTRgmSo+UX/QrHd4JK/JXk7M+36Gq3mV5h5F4YgflRDw8BxkNCXXUeueTsXgntJe3nDhFOgMt0ePyE2VBJ9ktBlEB8OmChHujRRNugR+GjMhSzCgd7ImVu0MJfV/JvBK4XzzWKGK+bYs+wZ0+TPunWezu+d9ZEIqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115865; c=relaxed/simple;
	bh=/hOFo0rPQJJCMg8TN7ca2c/YdU1t7mtGTuPyJNmtqF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOrDLmbluj6SBETCVh98LKMpX5Zpfwj5AvpYbp4DHYFGDAO1kHwemI6oCXq9dLxyMbJbNkf0FDqS57VKh2M3RZzgVJlMlcFv8TNqElSl9V60ZI5qNtIwAXaY5Iu6JuTBm9RD2IjdcmG2+7RRT8VdAi99hD8G3IEDGQOYMJIDAE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=t4I7A7e3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="t4I7A7e3"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47122683cf3so3032748f8f.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115861; x=1784720661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RisMOAAic48kNClVJf1apvBtYfMS81SJZNrhmUuPOOU=;
        b=t4I7A7e3omHg4+2VUCClwUcufLvHI5Cf2Db7RMS1Ti9iSAghZeQ0ATFAmfbVfGjqW9
         wkCbGFI+gNH0A1VSRQWKbl5I0w3SWT94jJctmC20pTPdRvAf9cIwJBIMEeQ4G/EQ7S0H
         Sg9JSnQJAqly/5Q6hzMeMhEsGfrbXEsw29wlHwXIbYqUj+NU5swRhl9o8yBxAt7LSi7K
         AQfSELXLiXSBYtfyJ8gyyUlx9faFpXDoBpkesyG50kGUCSQtL5NfFYApeT3uFRRQS9Sa
         ns3dAokj263nW1JD2mYkqACm8kQcFJA/2mY2a1BfB4KhIllBel+UAHAxZjkqV4UW0++w
         0xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115861; x=1784720661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RisMOAAic48kNClVJf1apvBtYfMS81SJZNrhmUuPOOU=;
        b=Gx0kSqUMdK6/m3NW7GGmrgnNN2eIp2Em2tQOWA8O0dtdtMpn1/toUNpgmtl4UYpIqh
         Ud2HdGGzmjoEd9L0tifm4FFXVCtWDBDYDGM2QAnhcyO+2PWk93lZe1oCSAotfIvszuSx
         FCtosWgzW4Fhq8aCtkRC0DxlejwDXUCugislYR+pcp8M0mX7vbEJNFNo8sYiPDGIF5ZP
         rP6QDOSMHQFU1FM1Eaom0EKUzvkW7Ufmzo0M0umYDk1ssf+Uzxi7Hj0fTqtEgWTS86JM
         xqVYsB7UkcwRVKajwsH8lHZxo28RJ1dVoNc9APg1yVTC8Ms5BAp8lFR1vBLmpZHkI961
         N93Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq7UuwCItopoH4FVFZWYzQf78hKjZawKLTiK1XRC40zSUdzJ8Xgkk9cDzZ7PV+SWTif+e5ojMxQ5nF0@vger.kernel.org
X-Gm-Message-State: AOJu0YxOMxqS2tB8iyTQr0gO0GWFMCcopjkqG/2LiuN8ejyYEKsNXdIK
	Ulmgp6tNbxXlytnnw1NolfxV3CKwA+r8DSDPI7Jc6vWQtLuL6HcM9M4QrIxRgclEdeA=
X-Gm-Gg: AfdE7cn0Gw7jdIk39huWogLyAhDSOGU3UmCy5Rt5NjEUTWyRq9YM18mgmWSKGrLqOD8
	+OZwT+VVYBrivC6LNUpISvvUBgCQcvGEj8GcgnwWML5tIVNe8srrjyGNVNxjRO9mILbTyhskgU1
	JXuI4jDc2+JYGqbB1eUzkbG+zn++pTonwZyM2CWzb76HLWkDM8XKviYdogTus7AkkcSbJ0d67Q/
	lTe6Jp8h9gVFd7kPVHsveivVqgTJCYdnBSOBtNM1x58wXR8e/03QcgWzi1YvZsvewiACM6n41iC
	Mk6wVy6LBNVilY0HtnVZANlbSAfuiNvQ2EGB42ma/1lX02vaqPv231y8ERsw1EhR7Fk3iF6jZF6
	VJzA5xVg9H4/gNgxiRHF5qilSfXBnrn9zoNPnRpd/XHL+tuDIkltTy6lpi8FGwb++o8ZobcxuRq
	+0CZzSNoJ9+jghtVjoNx9IS7D8/w2LUeUBDxTKdr7zKuoYRRFINJwnLKMdRMgnWAF8
X-Received: by 2002:a05:6000:29ce:b0:460:3b5d:43b6 with SMTP id ffacd0b85a97d-47f46373bb4mr7550356f8f.31.1784115861266;
        Wed, 15 Jul 2026 04:44:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:26 +0100
Subject: [PATCH v4 13/21] media: imx355: Use pm_runtime autosuspend_delay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-13-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
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
index 120eda46d982..17a2acc1152d 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1074,7 +1074,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		imx355_stop_streaming(imx355);
-		pm_runtime_put(imx355->dev);
+		pm_runtime_put_autosuspend(imx355->dev);
 	}
 
 	/* vflip and hflip cannot change during streaming */
@@ -1086,7 +1086,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(imx355->dev);
+	pm_runtime_put_autosuspend(imx355->dev);
 err_unlock:
 	mutex_unlock(&imx355->mutex);
 
@@ -1436,6 +1436,8 @@ static int imx355_probe(struct i2c_client *client)
 	 */
 	pm_runtime_set_active(imx355->dev);
 	pm_runtime_enable(imx355->dev);
+	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
+	pm_runtime_use_autosuspend(imx355->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
 	if (ret < 0)
@@ -1448,6 +1450,7 @@ static int imx355_probe(struct i2c_client *client)
 error_media_entity_runtime_pm:
 	pm_runtime_disable(imx355->dev);
 	pm_runtime_set_suspended(imx355->dev);
+	pm_runtime_dont_use_autosuspend(imx355->dev);
 	media_entity_cleanup(&imx355->sd.entity);
 
 error_handler_free:
@@ -1478,6 +1481,8 @@ static void imx355_remove(struct i2c_client *client)
 		pm_runtime_set_suspended(imx355->dev);
 	}
 
+	pm_runtime_dont_use_autosuspend(imx355->dev);
+
 	mutex_destroy(&imx355->mutex);
 }
 

-- 
2.34.1

