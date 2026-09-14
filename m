Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE783414418
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376433; cv=none; b=r0qY6XjDWJvmcFcFkruSTv6//Nkon/VipFUPTnuNSdWnNt1Iv3rxuW0oJM3uVkNEoPtCoAW+wf4TU+9eaAj53/RmMCMPq/aiuk3DAAftczQskdbXEzCM+ICoooIlmlci3GJ6H6B5jR60moUpbL0ndsFkuqD082BmeJS41/elpPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376433; c=relaxed/simple;
	bh=yyET+MmmYD+WyLCEXc1+I3yQ2jnZot7dAuEkT2NMzjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUarXQS/VcPisDsbiRZfBmJ0+joO22g5HDGEJ6LRYOt0mE7g2kF/gzItsRqwBBULeBQd6HKTxOJ4LZXwp05CJDW+gMNLF6hOOAJEdwezhqjMwBzekqTta8CTpOsyp54Fyx3Or+EQsBZZvuOqIDRyk2EGWw0B0Qoo8I/o4LeBViA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WILlPdQx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WILlPdQx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso12007645e9.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376423; x=1789981223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzH1SlhYJo44ZT//ESye8TSMbGDxpawi+vZSdaQIq4M=;
        b=WILlPdQxNbllY4DE00lAN6aoxWrOkO/TDLiFnhtcwH9vG/K6asoqWJ+lvkTRH3xAso
         M9skKncG9HdTbw84eu+auEHJu4RQ2ypRIP8iisiKLEUzU+Vs9Kv2grkipQ6InGEA2OA4
         VMA3uKnDAx0IfxA1GXxlre6V3kTAF0y563YBKcpawTWYohKiafh0oFHFkjE48+tEXlwZ
         DUhXt88Dg7r4X4dQ9seDuEEemfMn3C6wM/U1w8iGU+0EKIRm+/fJOwj/gNP8dNcs44py
         fyhPoG3sscFiB39rMMHwXMG/+ozXlbefR1lpD5I0wCCpheeUc6LOgLpHp2Xl5NoInaW3
         r3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376423; x=1789981223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzH1SlhYJo44ZT//ESye8TSMbGDxpawi+vZSdaQIq4M=;
        b=hnFyqaut2+K6Y1M7ixQAsSjBrEF6Acsg1RsDH3toPQmCrjmN/X4wH6mMz3qtxGTUYr
         w/z9dbPkxZVhBuztsIXCvhisbWz5uhZv2E8eZag0s789QNMiAmYuM9mDKuONFLzlVwNu
         ffTZ/WCPEHAgltEAqIsh/4uHb5PYy3CCJY40Lw6j/fg3Rg3Q/O6Q/pKx/VdWtESDlS/t
         0XXU/yHP6rbCbaChSpzqlr7YHKoALzXxHeOsBvulQNTInbaOvRH7e+79P96L7osmhvZd
         gdyeGqst+jSAaUuOIZ55XIhyV5VoGWRJqPEEjkfL4lGhSNScuBn1mJVkjlZebv6Vl/mR
         m+1w==
X-Forwarded-Encrypted: i=1; AKwUvBxp4IZqmrnBchtlosej74hLD4EQx46X3ujfsVboNuBVQPFEHv+COxG+Gx3XX5bKWcBjTG6bUMCZSsUi@vger.kernel.org
X-Gm-Message-State: AFuF++mw3TD13D59wWqhDrYIwINQu+4bjMTEV7zj8atyaQxyrdGhNmmL
	D2RnTDg3Jg54GAOHuzF/yOX2tmtIRzGk+qq78vzF/4TdN/3366gj68Js
X-Gm-Gg: AYBFou2LmwGsN6/s+jm3gVzOLcwKHlzP2ALMFUAfdp3yrXBPICsRgfYEGSr5SMBSL8H
	cf/FBQ9Xo3kwqQnHmCRBWQsC/si4vYVaqpKEpRvj3mKgedvS7cPNq+rB6HTmGKCOyLYxQtyHzkH
	0uldIIgJNu99RGbe3KRwIJvAYb8DvIsVLbteRHM6r4naI/YRS+4hy0JWMQvuaUvj7sXAQKsKD81
	A8WgCN5KndgMamZ4tYfM1OxNhm02JUeyMU5kiSXIKGeUnQGDOfgJxroucKn0U7PqSaz7gDRJzEn
	DNZR6Rd63+YMaWsiWgcb3moLNSCjtT+myK1TiduGRXsKJomKjCIVQlb7pJuhiywP7Ha4hUkYMvP
	GQUOL1e7rdZMkC3SqGLuEkzT7T7KtEPaddqVH+UPg5KDmPyTLYFha4nB++t6HpZNYscFxeYVEzr
	zVEwJKeDUQHX2YGVWQGW6HUVPCrwduIQLjaK0aOr/dI2tDQMOWHN+d6L7MF/SDWP2TqD++dw1T+
	sbt7N2bxZRn
X-Received: by 2002:a05:600c:4ecc:b0:499:7219:122f with SMTP id 5b1f17b1804b1-49e7a662f2emr17392085e9.4.1789376422333;
        Mon, 14 Sep 2026 02:00:22 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm25245851f8f.9.2026.09.14.02.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:00:21 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com,
	holofermes@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amit.barzilai22@gmail.com
Subject: [PATCH v6 3/6] drm/ssd130x: Constify ssd130x_write_data() 'values' parameter
Date: Mon, 14 Sep 2026 11:59:28 +0300
Message-ID: <20260914085931.66857-4-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914085931.66857-1-amit.barzilai22@gmail.com>
References: <20260914085931.66857-1-amit.barzilai22@gmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index cbf77a74c4fa..1d834be6243b 100644
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

