Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056EC3845DA
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 10:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777114578; cv=none; b=b6Y09+BwY/zi08GrJumyBREoGqisP3Ef8u3EjIH/iOGGPUBcjin9+YwHNlf/aX83SYvaamo/TvtM6t0/N7R9TG5clzbIvuUh77n07bxGr0M1aFyZnOHqcHmNvibEgDfrzaxU7TRs/pavHQMWFry2c9F9jHCuE7+emMJmADhBUJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777114578; c=relaxed/simple;
	bh=0DFMRmRmnT3HIcrBDMAr1tbxa08F3uNrVtX65Evd/tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMeeSVvT9xDOJ3lK8U0Ga+V8Wmf7kkblnhwRohAnyKOuBkBkZrgbook/UZXxz7EIcQywIkmHtTT5/rMXpKRsurl92E8uiKtz2KQHajCzo4qRU0LE7BmATmf1TIQz6Aojf38tbldESY9EOhsBslJsW9us3HnEwipOtoc1CTPRlWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBKHsWUU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBKHsWUU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b2d3a9e149so45853175ad.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 03:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777114576; x=1777719376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6Yo5rERlGwlb3Ci6vxCe4GRUzMyoCAKAgtEtNiZmzs=;
        b=pBKHsWUUQFqC4Jr2gMSQdSUOJyg57E/uvYIZTTf+HL8H5SieX2Fpn8kKEUpNwDasfF
         bJKz2FZ+XeLhXw7J22Hj60BkEhN2/QgcQ3fhDuie68MfQDq7n7A36v4OrjnqY1fRbIfO
         EvwCHmZSzRA0orFpglAahu2qb3iHjq3aOmbg8dhFokereqIHNdktTlPxlLY7Sw6uXEuw
         GI8ZRg9q8S96g9TLHCmwcGglupPTiXSaDSRzlA629oNdPLvLL4WLayY10BuJByh691qe
         DLmT63b0oOwKT+EWHGw1sX4N4qXvawPac8fqK0eHmNtEtWvZgCNfCjK9hEjINOcrtChV
         OXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777114576; x=1777719376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s6Yo5rERlGwlb3Ci6vxCe4GRUzMyoCAKAgtEtNiZmzs=;
        b=soSNow+LPoyAz1kCWZ0fIKjfR8j8gmD40ZLwgUv5g70JRlo4eNNlPoCEBHNJ/YUWDc
         nqZBbXhIM6jUj8JlEzm3VxCRuDq/L2fX2qYDhlwBkqVlAKlcj7l3olRP1SOWLXFm/hAL
         7oftYKznOti+S12s+gBclnYuCUtarFPoEYC+Q+15DnteFevBxMEdwywj+DLYglsHFghD
         krFoXjZmdSGcbfSC4SzFjf4RjCMbHNM6FmKIBDcwTHOWFoLLyWPAOgnmrA1DN51d7Zag
         B2m9uew5jkuBc17J+0OZ/xeCxJMpGFZvBMAXcl5UiQC7e7oIJ8y4QM4tEBDcl4VrlFSU
         gCmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jOhhOdi6abZdUvZ+ECXVoIjWZGY8sNfXlNSFLUVOIOv87P6BaUAoz4YS+qLfwrhO+n3wnt+I26drp@vger.kernel.org
X-Gm-Message-State: AOJu0Yysk/oBQ0TVyspbzJ6jT+pF9baapMxiO/sNOuwlWsfOx6rqGUnO
	fn0lZTR+TSzIhy9CE1EFyG6JJjqB2zMvVCqDVrVVh4i8B+sqLjBX8CVP
X-Gm-Gg: AeBDieupqRrDInFhwDcz8E0DNhHct0D6M4TQSucGxjnjcZ2K5K4pXzdWSbWRWKAtUy1
	a5E2g00ZWov7d6U1e5UDprqIc1ciq65mVHN2XXWs0/qbgqE1A+unMZ5QHc6F2iu78qTJS4a3lSH
	RBZaAuxVTwLYxSdWUqXI9EEywv0t5zQlT6f+VOz+OHTgZbDsEoM314A4x4uELq2Btxwog97Y54v
	KBi8TNcWe917uE0y14AK32SqrQ1lErt8USQpvcYPObHdlGSLWZqfZw3tWyvfXE7fisZ9AW6Sw0u
	ZcQZcZk0ds5M8O5+42ihVfZPXF64X69siqo1czqTNgLSl7fO15rtcoq9Rb7syOeQYuAhkTrJQ3u
	o9zZj7nfYggXVhFphEohsu+NCC4PP9oxc3GlddZKWkIL7PWE+c+rIJxk10QqkjxJRbbDUJVUBWW
	Nn932AuvUsXGNGWrYKH2BzpVnL50MC
X-Received: by 2002:a17:903:11c3:b0:2ae:5346:d4e6 with SMTP id d9443c01a7336-2b5f9ef78e0mr323118295ad.28.1777114576428;
        Sat, 25 Apr 2026 03:56:16 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa33486sm303832345ad.33.2026.04.25.03.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 03:56:15 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/4] media: hi846: fix hi846_write_reg_16 handling
Date: Sat, 25 Apr 2026 18:52:57 +0800
Message-ID: <20260425105300.745044-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425105300.745044-1-mitltlatltl@gmail.com>
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..09c109f3fba9 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1270,6 +1270,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 
 	if (*err < 0)
 		return;
+	else
+		*err = 0;
 
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
-- 
2.54.0

