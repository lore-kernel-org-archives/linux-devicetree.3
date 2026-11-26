Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729493;
	b=GPfj3spIUOr0SXiAMgN9SSAZvw1GPf/SjqRhXwB4LGmQSR0RokVJpaB6DctkO/97AeNr
	 jWJRf22JEp/zmgXFLY7xIPh9uUK7q/UNYz34HMFDx8ANtOyQilu038CAK0rLPUNlZNJNY
	 2JYlyGismFY92ClbOXqN6ekbMaAUKp+V2fMjPbqdHX1f2H0UCgNqTDvoaEFXHdtjukuuD
	 PdTe7NKFyGtKOdkZCqLpo+MPGuzf286BOO6blUJmvOrGtHcRxoMeBmJupgKvcfCAbgirF
	 6aa+/5EiKoB+ex/vzS+NMvTNWJdjNUS2vxeIE9f0qV2iMBfeDZYwnvTy/Wlx0JTDZlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=;
	b=f3cHS2J+zP07AyJOqFs5H90OA3ioOhsYqlrsrCrDyAr47JB5OiiySq0OwXd8i45X+eDA
	 1mcEzFOAXA3/uCKYCaKodF5boPO0fj3lw2UnforI5ut02DuKLvOeSiRIhkb+u5/8ggZwJ
	 /hSXlbcghIYcAZy64MdNKQ8VfL5OfTNN9G3FNkzEghMd14//RXf9CGrmgDyO28bzxo/+6
	 yZsZO90lAdFFiBTgkONYsXzY1NTYZf1tLZIGkmdbvi1rl2sZdRvwIVXbaDDzrb9pbz1Re
	 ykPcTlJ8qW2H8x2PdbDZAhP9A8roKkwy/1MBAcP0NX9ZGNGXDtriOdD60O2gSM48k5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FB7dSIsz;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F46460A2630
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F46460A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FB7dSIsz
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4677472f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729492; x=1796334292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=;
        b=FB7dSIsz+shJ6ZMZjgVqAEfPd2FOmoK5oswNVtCB9UIK7hZM9CYTNnOiQoZ10EbmCd
         Q1rZ23s4jNGKVcAL+4tZ+ghPDI/ssNlXfHqH0Ec/nOQelkS0YVAHkcyZFCIk9aDxycEq
         BdHwm6YkIhdgMaJ9wfK7emsk8oAyZjCDAlWzC6pQ1FsK0B4PoBVUUsVZkSPhX8Q3YXW9
         hWyBFrgBkMx9OYHSCXan1mmbVRH/FL031Plni6a5G+VMhx9KGvz1W+VHPanth2H7011s
         uNvZnruVHSHpKykGkEuqmIONPfQedu0EN+ai7+kN/fGTjTgdmjcfqcxKrFoW9l1PClaK
         7jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729492; x=1796334292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=;
        b=rW3TCaYX3gTYbrzi9mV7kpzzL7daBaDo/Xfyx97yFort4ATwa+9GLM7Lycoe4AzVz1
         dN/mo5THTLWIYnAD32MSFdrI2YYgCXYr2h7SW/ydW8dUAAKsrVRJf2PMufwOqPYYPQvZ
         zyKpDDSIheJBtEL8M6QuFyi7hHOlDR4BVq8daHS0+GMG8wz+FTNflVKxBCCoHB0Vtlda
         ZFCnssVi/DAxia7ig8DYRlfL/FDvwLRae8bfEhHaO7OanndYgR54laELVgRV5D7ELW42
         SP4dlCfZH6CuMDnstaEFjSbIrqapYAUvWq7KAf+1ti6pqbwN71sliBhOUdGM+NapEcZb
         P/sQ==
X-Forwarded-Encrypted: i=1; AL+hErHjDBd0P+aFOH0kgS3F4UQFvT5jJU1tFXJHinSDqsWjeuGSwdHTSu9GACM0ExrVMTEiF5ORaNLas04l@vger.kernel.org
X-Gm-Message-State: APuU4Z91UFh6EJTvr8061xR7m+Wp083z9yEOZr8NlQ6hDIvW10rjUpZj
	eWA4eQAQ3wGPE9IqkI+qip5PdRdk82jmrhOFepto4yUaiR9OIOVnkbGK
X-Gm-Gg: AZFdTZdxV7DDfaDUCpNEBRLTdf093dOxLeNnWwmn+drL1vPHGaTQKbLKcDF7cGuXafV
	LO2bAX49vM1Yx8iMo+PjltdAJ0RUpGJ0CsKgQcQynGDSwi7z5wdxJOMjS34M7Jh5aRewe+ernzO
	4+/xu9YX7GPBOd9ljFSwquZn2nrQGVAF5wNPi2wx9SFwu0scAKOZSNJunLj1kVzPGDI0jIBAVYX
	TpZHgL6EYglvGJX40g3RJVnhCEx7sU8hBC0IKxzAXjaGEkcQ/QdDEKoOYl4c1mzxf7mqXSRrfx7
	/5jVsRVMOdNJqswvCMiyMymJgh2BvSxquktgpKC0dmDdc3yDlQnfS5P7J6S5OJxK1lXZzaYDuzA
	N0YhrPIHcnG+6U1GrkakKSv/JZDTE2YZsgcXeD3SUt6IQ5BoZmB3cqxnHV/YqZ5HkV7RKjIVB+K
	wixjNY6NWOth5hvgJLtnqD2t2FqEd/sO6I+8tb95x3G+XS4VEJ0nJQPwnSIJHOYVGVlHqpMT0Ct
	f4f5Mxwd4QjAvvCiXhpeA8L1nNNwPwzMG08/rnYeulUyy68Q9Tc2kaTP1YIAaA1Mu+53Nm0Awkn
	mI1gooTiHzaWAlxZ34OuB/Ns0Xoc2rXo/1mHRZKMRgJhyyfgsSuHhvMGw9r1lGBHmuXW79puIGY
	BHIyNIE6DsrgoxhTVaA/vdx7ZvtjkCwywctaRh+/VLtKRz8uJbNwZbdzrfaR3QAXb5UyVdmCmpZ
	0eGLFFRPXNzB+2f03SNuDs1gloroS4aIe1Ac8aHwqN+YgK5Yx7eYMy/CT/G2ts4q1/J6Wus1mhW
	07OIjp3ybOd3tnUsL3R1yWK0eYv9ehRZ8596roqMebj8T9LdsoHrAAY6XG/WY+W
X-Received: by 2002:a05:6000:2c05:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4abb19c16a4mr44426780f8f.22.1795729491930;
        Thu, 26 Nov 2026 13:44:51 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] drm/sun4i: Add compatible for H616 display engine
Date: Thu, 26 Nov 2026 22:44:31 +0100
Message-ID: <20261126214433.3562326-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable H616 display engine pipeline by adding respective compatible.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 248be5ff4f36..18cd9a993348 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -442,6 +442,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun20i-d1-display-engine" },
 	{ .compatible = "allwinner,sun50i-a64-display-engine" },
 	{ .compatible = "allwinner,sun50i-h6-display-engine" },
+	{ .compatible = "allwinner,sun50i-h616-display-engine" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
-- 
2.43.0

