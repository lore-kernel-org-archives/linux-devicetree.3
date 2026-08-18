Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2AF3B3890
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040412; cv=none; b=ISsSRuMTq0RwaO+GfXuaMjFBpYDkw4z3vp9QbyXBFTU3E8HMpmTShq69VcC+yACBGBjcSV2empmZAzT2OjHWlscxbh1NJeM8ISIJZp0SQ09RlCFhHU5hxcf+ouovHYzsOvMJtRgomdDLZTWy59SDrdni5eY4RSjhS8wHn5V6hnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040412; c=relaxed/simple;
	bh=B9c8jb9rQA3GFHFqTD8wK1YNQ2znwhPRYnqMXhDoVSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5dr3ZpTRj3c57hNn9YvU7xzPVonvLd7jMVUeV+HizwqYPUBrP45h6A6SfCP2LFdkGcu3VWmUKFj/fDq29u3atIHtR4tubG6sLAETqOeDqUzPLkLlq4VwqdZ/NXeLWRb8LsnWevpu/oXMs+sOVb7YKKtdr9SGpx+ka6UTJg/mbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIFEYMFe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIFEYMFe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fecbbafdaso1366503f8f.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040407; x=1787645207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdfM282bTwDxgzUYhlGJdjRXvx9tdxayiYRVrgHSBtk=;
        b=aIFEYMFezsTBgoDo+eJMZrG3u/J6yZO5ByAwgY1Q9+XrdayyhnOCRIkcxyBOgoc+GL
         JiC93ky8awxv2i/CnHgAG9X8W+sZZ+ZoWTTInj0IHX2toAzlNBFe7zncW2MfdryLaRWc
         ILdwVns2IbMwmlNhDfvD4DRgfsZ/ug/Rh3Z0xsdpW/bEVxISnVjlxW4Qo597cPonMD8U
         pf0IKimWPJSqvc40T/rzJ0hL+tTPpDaCr1dKrFiBiHYvf6KiXv5CvKi3T4uJbC8J77sk
         TzdVGY7MAg+G5G7MZ72auJu4li39c03tZF7hr/68IBF2XKvR9q/nnoKa+6YF6Uueemda
         hgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040407; x=1787645207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FdfM282bTwDxgzUYhlGJdjRXvx9tdxayiYRVrgHSBtk=;
        b=CmRQoJMQwceEtSE5ZHs0cVzIS/jHwQLsYzqagBIwZyXmJSuHe2Js4Qyu1/lcCZ9euu
         PmneHV4+UuzyarMkVp47qB6wTBiwfBMauQ3EQaaLg3Zc9500ZMHWmRLc8zkN0TNlcocx
         DP+DAvmiOteHE36+17xSLowDqT4s0FfbS/HviWtx+nzw5ps2+rmsYtfQaX1wc0QrPbZ6
         Z/3XjEdkyxT/8SAqLnIH7IrA1PyR/P6KH92iQLeFodyAkYksV1cSwyJLh+2ER3qkfYPm
         YHVhpWfProAzbwjjjkYasrH+IdD2KwVndNvsuNfQ7Zgny1MQ2D1kxarpa8HzU0QNZeVL
         z7VQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGjombSh+JvmIrlCuSWwQQ92opzsumq7olPMmWO4Hb+XGiU1JdkUWTf0H5N+pyJ6zwXbejfUSGwyfs@vger.kernel.org
X-Gm-Message-State: AOJu0YxAA+vc9jWsV2MpWLhuiaISzhZMQUFCUiyAAF+fXItgKMRl3d6f
	8Zfj/fUfdehvDDzVPtDR2ZllJZunMYmJDa6l2RFAGaWAUQbuQPfJBROK
X-Gm-Gg: AR+sD12qIJr5M4hy0N62TqXSSiVhz7nlBDvr3OeX1qetRe9vvfs8nHBf2JM130YwHq7
	qweAt7J68AxdhrTBLFKz2KAJJsi5UL+lfmsfnQ8UZnLCty4cMWktAfPr72Zc+jFCo2vp/8a5DRu
	FYLcmh7TBs6J0KA78dIjNcEkFacOsrBfSO5Txtw7/WVelzipkWkTRbHP2v/hUyDjiBjN5Ynf3zz
	y+Zc2gmuG45umq9FNCu/FL8vMBjkpMoM2iWzxwYiG2HeavK4BQZxrJqnSj1UirxYg8U2ymYcxgC
	odbUqvhecoAicl9LujVMs1sP/Q3x74oXk3dZhdyfD6DZFH0A+5l/gz2w/8V1gxGvuxeduPKw30Z
	kxCMlfsp94A51ye125eNZnWE9YgGImG1dZYJzbzYcOGY+puY/H9FGYgiXBa/0e7R37yU6zv8xU8
	ZZGTB5Md6WG4yJLL7WbPAUSo4uMfud6XD0W9np4E4wNSrwxUSP631+R8ag7gF8pqJ/G/+YFW+s8
	OU=
X-Received: by 2002:a05:6000:41f7:b0:482:aa2a:52f6 with SMTP id ffacd0b85a97d-482aa2a5496mr7478849f8f.1.1787040407150;
        Tue, 18 Aug 2026 01:06:47 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b2e9sm10367223f8f.9.2026.08.18.01.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:06:46 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Fabio Piparo <holofermes@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v4 3/6] drm/ssd130x: Constify ssd130x_write_data() 'values' parameter
Date: Tue, 18 Aug 2026 11:06:23 +0300
Message-ID: <20260818080626.30430-4-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818080626.30430-1-amit.barzilai22@gmail.com>
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At no point does ssd130x_write_data() change the bytes it receives via
the 'values' parameter. Constify the parameter so const-qualified
buffers pass through without casting away const.

Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 1110aa63d066..a229d7a87da0 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -252,7 +252,7 @@ static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
 /*
  * Helper to write data (SSD13XX_DATA) to the device.
  */
-static int ssd130x_write_data(struct ssd130x_device *ssd130x, u8 *values, int count)
+static int ssd130x_write_data(struct ssd130x_device *ssd130x, const u8 *values, int count)
 {
 	return regmap_bulk_write(ssd130x->regmap, SSD13XX_DATA, values, count);
 }
-- 
2.55.0

