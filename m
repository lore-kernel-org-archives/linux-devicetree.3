Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEB5399039
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426171; cv=none; b=qP8wX4u5Kk/yvAO2cqbHKdfxmCPFIuKLTixvyzR4LAoixJox3YkTBSIYaPhWXLb3dAnJVH8snluAFycxJJgXMY5JP01fGQBCBVg0cALcK0HDHkdJfTguCpFmaLnXnbrSbH49kJV4lUuBQkwuymkrfX7BR64v+w7WG0y8gHVv8fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426171; c=relaxed/simple;
	bh=yufkXp8REa55nKKKY25mbUUOR8zHhW1MM+JCVxnj/xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdZBJcRNriqckLNrVmEnvvvke+8YybjGS9fPYWvQ26dJMCIqC5nHeCdQvLynuYvhAkjPmKPxDeR3iDooCN8NAMGDaGOhYgVvjhRksGrPjGO6GavUYkgseZCoxEjRmfPVCbBjKYFtL7iAzPwEC2VjbLPPNMQWM42pgnxpfeTKgTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QL7va/kr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QL7va/kr"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so705246e87.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426168; x=1777030968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hquw2DNWZgZvIoiMcHg+A2Rmxt4zwGE02aJk3heXeoY=;
        b=QL7va/krtQNJk1DjGFC5lXHZBtn/jVXUB4eP0KicKoEyd6/KdFJuX1mFYA+P7PnWbH
         0iH4b7W7FXqLkgID6w0iNKNYcUgxNbnE8eX26Z+xERVS1ZY54eo9GmPZRdxmOr6FneVV
         33Ze0ON74xlX5mt2UCO99XU6oQBnvgzNtaRBiBUINBEIDoEiwGOvnCskHk16K82vfHqy
         jlOripN24y8ldhQEgdKr7hmeMHqB0ipXkQ3Y66tWSZU+ojJVObtSB+jbR/4uO09PK8Qa
         17eHp7ryZLCP6ZGCJaA7eKGmoptcxUkmihxdEDFmmAP5nJHA4v+DWm3mrFPyKNQTj3Oe
         2l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426168; x=1777030968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hquw2DNWZgZvIoiMcHg+A2Rmxt4zwGE02aJk3heXeoY=;
        b=ho3g81eTko8hqkfuBk/sMa5PrbuDhBpoAafz7BOysD5BjKLbVYIdR8GkDBTcQilT1u
         ZGyUAgqqTPhFTdf8Sa0gqnDHzKyT/z855+AgzwaVydontSDxkAcT04PhCRXrIdvFUMRl
         cLyoZIGpEZmsClKg6XmSwDxj9S/1CN/5jXbtFpkwlRZotw/ByrjOEZU6g0FV9BVehgEp
         ZUxdT9lkWXEeGux7vclQeqqFmJehuNsmbHwSl/Ez6aNQqB/MhN7UjygF7ZQRsasClNBb
         WKxJ18k7XBwtzpAYM0tIu/FCtfBAPgTnZXfT9xzh2hou0DbwKcu+myxi7gC/UXdibKEj
         vzVA==
X-Forwarded-Encrypted: i=1; AFNElJ86Dp4nwHg9dN0ueSoNI229jHNyPhOirKtQw+CTLHvvqdGsqxgVcczkcwXlZqir0if6F41paUD525Ka@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9oK+84YjXttdobrO6jL7rsSNvDvjjDv2ajS3tawps20J5f+X
	qALTaW9izLa9qQW9cFR9k90Lwd+2R4deCptV18jf+dn0O4bjTceRltQS
X-Gm-Gg: AeBDieu4YmUTfQrp6PRp0oitC4B6VmubDVzPgphCS0c3RgBT7Cl2vJYXAfrqSQ7lokk
	XoEejJx0tVEILFVathysPzCnYfi8Qi6axQAFfTvVVVn0EnpdO3IxWGAUvbxibuOQnPsyMEtfEwB
	yswNfkt9rvXbr00qNoJ1dSP9xfc0b2IWBqepIbpgnr0VTFwP/1Yk+PU1fSoHILuzWDAGCzfent2
	rOlaKYHzJrtr7lFhKUU43mDmJhepdKST/zEnDcMQ9jMyc0UsDWfA03WlfdHiGtZGHdfgtgAK9rt
	lWD2wmwpkAEgbirHT44/zdParkUa7uQyTguSIhavOUtszemElNz3HaCifb4MZVTJn+5nv5euM7C
	yr6Xh+RKlYdfUzvWlRHvFLg5MOAiTOJh8B9v5WkOVBn72e7ZZRGHzg/cJBc7AFf4FG621A8auvI
	lgzyC8YreeexWZR/KVwFyTkn+1B4LSGuMROQ==
X-Received: by 2002:a05:6512:108d:b0:5a3:ffc0:7882 with SMTP id 2adb3069b0e04-5a4172fc0b6mr706909e87.45.1776426168032;
        Fri, 17 Apr 2026 04:42:48 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 3/5] media: lm3560: Fix v4l2 subdev registration
Date: Fri, 17 Apr 2026 14:42:24 +0300
Message-ID: <20260417114226.100033-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417114226.100033-1-clamor95@gmail.com>
References: <20260417114226.100033-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing driver does not call media subdev registration, making it
invisible to the media framework. Since the LM3560 supports two
independent LEDs, register each LED as a separate media entity.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index a2674af6c9fb..bee1681a1603 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -368,10 +368,16 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
 
+	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
+	if (rval < 0)
+		goto err_out;
+
 	return rval;
 
 err_out:
 	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
+
 	return rval;
 }
 
-- 
2.51.0

