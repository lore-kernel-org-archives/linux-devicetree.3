Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23B36A342
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079883; cv=none; b=j7SJUu1ySRH2kKckliqKOdlM3v7xWDdD8eeZP22USkK6lkU6Qz4YjBtMF4tqngCAu3amUw4tXmpAc/iYli/3qH+QrQ8Hm7JcYLRtbcqX+zYEKF2kDwxSHLu58HiVRyVmb9tK85/avqgHEgtY8WtEP/jfKoCzuf8B9ebX1F8K2wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079883; c=relaxed/simple;
	bh=AbDp74FboY/m54pfNSPGHJTdkLesKVKCn+j165dfG4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kXfXlCtMrw5RMoIL5VLID5OWZK3/aDZdWK2hOb9LnxV8mYj/Tum07+IUQbJD20a+cO+Z5RGsheQa40CXsbYSEGqi8RcSSUu8nOsGVGf7Fg4/wCErjIwZ74f/nS2OSc+/Y09IYv4E73Xj+38r2syutA7Ww75+GsOR4n0AEK0mPCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KUcJexIu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KUcJexIu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso51765665e9.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079859; x=1792684659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=KUcJexIuP0X1spU5BTCIdLySxpGmyypeRaamvko0s2lMuCQod7lr8A3VFZ9pdUOdLu
         TY6hrEYMEMbOEoCQRMT+2AVVaZqxMQj3dgAIPGj0LKPGJQZtW+nhW0N/PhKAddvNN0p0
         VzMjOf0gXS/WHhpkoDzi/YOQ/TbIMrXCjdE1JnbUwNt556Qjj6XTRCv1uvTRXaOFvfgr
         EbXytLLtLMz3ZXN1SSDBZaQIfoDpFRKZtSmDgfkjloQbupKTyETbML3lMMo8Q7ONW/qx
         7MqWzbH8+xkk3Myvk+fVgh5ZqCXMKLDLaeUJD4Gc1jeKkAAMSnU+rEZsuo4LDay6tsk4
         W/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079859; x=1792684659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=Ms0Cxs8oipxzkFw8y0vMzI+6y4dTepxca08beKlSgzOzgRR7g33E1rNlZs1JgKsslG
         vRpuxwi60QKIqVbpK0QsDKN4mkXa4Kea4W3OsZnIfjqKkIXvczsQFeJjskIHPEalRp3U
         cIXd4rx61KQlCQ6YCWZlT24p6bn/jNkG5uYFOEewO5ZgVgCUX88VC0oM/lA77qZqP/NT
         9oNHwm8cJmx/+4RMYSupRE9LoLGXB2QBvEf8Gf4xtcQNVaEl7utX82XqfQ2WB5qsBfdZ
         /moujfc/HwW74SnYjSg/+V323Caq9Hht2DvCQyIbW25qRaG+drB+yZCJvpl9QVQ2f3Lj
         iwTg==
X-Forwarded-Encrypted: i=1; AKwUvBww3+q4fuenq5EOecI4s+t/4mbxqXQWtOyHfUZ61Pu7/1SXthvZTN48UW3FiOWw4Lm4E+PwLasotXN3@vger.kernel.org
X-Gm-Message-State: AFq9FYLDivGbs1rJO/CC7eIPCAEsK7D5XwjPxyixEU24+7fsXMYqxCdW
	8kiGbnOK6nbHuoiuXACxSY/m/DOAaqDgXtSJHaZAWPm9cy3Z9WkzaR3Jke/g75Sw8SE=
X-Gm-Gg: AYBFou3t8HqmT/Qegp4fi9upGerJJn89zxGqjVjKQGyxB3gfb4P8LRMWTxrIMlYn++S
	JAPVLWOvVFR09y9YcRcHqMcRibOKAcBKl2yRBznhP9Da+IV2QmuG0rQzqlTkbEPX+urnJ/FxST0
	56HcqjD/nFgKcyTkugwYNxvTZfNwB3/owW2lh3VpS/4jZcIe/xWoVCnPbihcvWOgv3lQhNAXXMw
	lH+N7rngmKiirNGazQi7Y4o4J1kr9E1HHzlXD8pI2N6t6a1DYk3ouI8mOqfWwe4lzSM6NbH0Q6q
	GcmqKcivtdxsvFlL4XHKPD0yP23aqXaAOgmIZntxfj4w6MBvgA5gv+mM1DN44eREdH5raPTCbEq
	UR1VQ5yfWz9p0h2UivLpBlbMrtBw+HBTL4J/cokmXBY8c+rGazT3lysvpDB0GQ+SpINe7Uye6tk
	hr2Ag0QMRgWMw+itTwcvPcIP57qt7fGiceuM/ZfB6Twuj9hCGHHFmOSW8Zt7exQPOegyqVhIc2A
	j8LbJvEKEjwAWoxPMi/k8tRj+6ukRt5ep4LuxLm1fSYDS4Uhg==
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a18e4b6241mr469180905e9.16.1792079859303;
        Thu, 15 Oct 2026 08:57:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:38 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:29 +0100
Subject: [PATCH v4 03/16] media: sony-starvis2: Always program the sensor
 in window mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-3-75fcdb4163f3@raspberrypi.com>
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

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 3656658e18a4..c4f590c489d9 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -921,9 +921,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

