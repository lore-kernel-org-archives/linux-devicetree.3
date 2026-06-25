Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5599B2EEE77
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380721; cv=none; b=cu8DKP+0FQ6Lj1TdDCjvKsAKRufNJPqaarn9SVnxpSilf+9rzRUO8zR5OfTEI9U88QiF9/5VNFeBaCjlk4hHQ0gZskIyuWEAnmLS9ihzrf8BqiG5l0m50VrJ4co9SpuZSqDaI4o6D+AMw/DH6Vw3c1rp4cEoIXc+AoM5wgA9Clw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380721; c=relaxed/simple;
	bh=hfbQBZ7NzCixRt5Coi0+XnN7CSh+KECzit7pWGJqkd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBMMrKyOS3NqBSUNFLAbe/jqwL2IFjj2JqfHYSgha3w/bn9YcsC6lmyxg8bhvA7hrBG3WVMzo03wfYJ+KTqmQcdGBPkGl7TxbqvGgtq/jSIikcFCSuEOnvI9/v4W5mnPgxhcTAgRfdO+Jrm4wGyw+6HQUJhpf+1pP7uZSCsSVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmOGB0km; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmOGB0km"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c74383c93cso15592985ad.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380718; x=1782985518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97AWU0M7d8gQpSwlhcAT1m8L/c8BayOz7rqc48tFI0o=;
        b=dmOGB0kmdcVYgjsRTbuRKLMSPH3W9YgHT5zEMtH67umeIS4LJQrH4wJfic6SzCEz9s
         0qOwe3fNtpiw1iyFbM32SLFXeOCSI/bri7Fb86iUxsqYaaKR1Zhy5PF7M0pCtYvO97qG
         xyT95flR3Cuh6L1g11Mwy/C8tyi9VO3EkIH0qSVioJFWvEh7PVk0DiBhEvTZi1QQVP56
         gcvzb/x6tyWrGE2u82RirOprLui1UzQEgDXJqAWznTpGykvCGbISwcq1LsExdoPcbxar
         O/l+HMDd+CfOTj8Rym0FtHGi6sH1avSFp+V+G8CSuLAEcKXqG9Mvz/ETbFJZEXlscI+V
         /QNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380718; x=1782985518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97AWU0M7d8gQpSwlhcAT1m8L/c8BayOz7rqc48tFI0o=;
        b=jsdMW9p5Ay+beaZ7+OeNPYlhkNdImUDf7Ga/IsWGZsoMVGFJBQ5wwyWVEtlUHmU1oW
         NdNGZRzyb5Oc9KoX0GydWr1gLkqwxPLivG/CYQqskT5AWms8dN4B/8KJiEhaIeT5DAI8
         LO2LAuOZ50e9m3iA1qmkbcD72hs3+/f6N8mYqyqaaYyqtcinQHrKuHW6safGLHILNfCj
         2dDU5lMg30oXwZq6KWq41P4F7sb2B7Qj5pdCf53QY8agkdSFfHQ3WCVM30ohd2RkrweR
         TeycjI5KBqTYqeHXVYmmcAw+xiHFGVd7bxXWFuTArJFaj6+fMik+hc/UVeTqMU5M/Dbs
         W14w==
X-Forwarded-Encrypted: i=1; AHgh+Rp6OCWIBuZOfRE7GOegywrVx0peFWLR1Rq3GHG+mpsfPX9YG+8uN5zcyAaYfOa1ipAtiL00O4ia4qd/@vger.kernel.org
X-Gm-Message-State: AOJu0YyNjCQa0e3vQo5lGvGMbHySVAhLjijNX8CZ1a/6+xYN64Y/EfcB
	ylQ2NPP4h1tQTobTATVye2VJnff+XjzjANF4Fz2YQLuVvUlLk+9w2Aro
X-Gm-Gg: AfdE7ckIzjRwvyqtJwsDjwJ3brYjKy5dtdByasMpRBO8tt9VEQBBXm5A8nuOp+TBHun
	IKS9Wjh8bMPxhNmk83pKLVwLb+v7liXbqwC4HcQ+r+8kf9T1+ZWCuNT0ONGh0uOgI8BODtL+aVs
	xKR1lxmeyM0WT57s3t9YugqwdtlqLtJI7s7LOqGDkmPGv0b5zrJbH1NqKSual5NDGBdJn8ZYN20
	V3Ori3hWaZpwq3SAjEUnRRWKpPTl/LwveYtjAnwG1rWNsZZ/DO6kvXK48zVHooegu2d+H8lZs+i
	sWT23+CdrxijipWu51XhjCmr4ccMGNMZN+ZHwobE9oEPtuXyUnfNEqXuTq84yxbYn7S6haAkzXz
	p420d1mCt/yk8azr7VKxROkKabcIWiWZQ1gG73IGQRb/96sfqfVhb4un3XRwpNu/5OJxkc9PLQ2
	1HjQyFOnTgL+6XVz3NVsF/wcZRy7bo2T5YOLL/jCTvpMuvclnpEVnRQQ7Qfliu4sWjAjXJT7Qb8
	CUbAWAxT8fa
X-Received: by 2002:a17:902:dac7:b0:2c7:f520:45d7 with SMTP id d9443c01a7336-2c7fc759236mr19628235ad.31.1782380718561;
        Thu, 25 Jun 2026 02:45:18 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:45:18 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 6/7] drm/verisilicon: add DCUltraLite chip identity to HWDB
Date: Thu, 25 Jun 2026 17:44:48 +0800
Message-ID: <20260625094449.708386-7-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625094449.708386-1-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton MA35D1 chip contains a DCUltraLite display controller with
model number 0x0 (sic, the model name contains no number either),
revision 0x5560 and customer ID 0x305.  It has a similar register map
with DC8000, only one display output and only 32x32 cursor supported.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
 drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 91524d16f778..7d630a667a3f 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -129,6 +129,16 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
 	},
+	{
+		.model = 0x0,		/* DCUltraLite */
+		.revision = 0x5560,
+		.customer_id = 0x305,
+
+		.generation = VSDC_GEN_DC8000,
+		.display_count = 1,
+		.max_cursor_size = 32,
+		.formats = &vs_formats_no_yuv444,
+	},
 };
 
 int vs_fill_chip_identity(struct regmap *regs,
-- 
2.43.0

