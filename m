Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C7D3C1D75
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787484039; cv=none; b=iNsMs2gvytwpIXUJ3mSLLmhL9OJ5hxq5sLyWpKtGabmMmMK2eM5kUkrVPIxcJCJExNb62n0p7ALWGnXIpDNwRXKRfM8ry76ZyuqRVMD/jKY38xLaY5nwervycY+5COHKPAmjSFd3hSxqlqhe1eNqgCldyEdKhh1lVFyoDdU3MXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787484039; c=relaxed/simple;
	bh=G4D/tLQlr5MskfBE1LEuWc9pIfnVArKK2j3Z9+4DMo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/X6lHwRHaFC2w7bTQuPwyJPuWEr2mQMAwO4a9v0vqQtFkfGzNcq1O+EoK0pjC4m8uvNa/eg78lo7dzWKqQXmk38iEpVVqFJqcG4tj9ShqKSBdeGmy08ivSBF3RWN+1I69AWgKPxlIRMuM752mDKeTEEvG/zUet8OjbJXGsX69U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlCeB4mr; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlCeB4mr"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c214321dc32so490212166b.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 04:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787484036; x=1788088836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITWcZ5jiF/pXFpj+1UU2crAZw5A+n08+7Om7GUXkowQ=;
        b=mlCeB4mrbRx8dEC/qmju6K78Wh1TnBzDJ9dZLL6WdHC+raku0O3/vUh4KHKPLa2idw
         3JgtsQCcoWq+CHf8EHmAYkMFz0rDVQvFIAVk1qtusf6/9fgswOHpCXsEF2nmksj6GkF+
         aBDKweuBbdtx+zxKrl+B6CfnGJ25+k4vMBigvnYMIsr2ih65BWOupbN9h6l1hEBc/nLs
         fjL0+pJWi6oGAud+oS/ToN9+BNZcE4zoIIDCoxIoqyfE0T9AUtwYcrP25zPbe+6L1/L9
         TA82IeEByTvZlz7lmEJ56bNi+Sk/otjC8DsTbdK8NWY3ZF7YN16RRoL10d+T03drKES7
         kKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787484036; x=1788088836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ITWcZ5jiF/pXFpj+1UU2crAZw5A+n08+7Om7GUXkowQ=;
        b=gYiYsiqZzC1X2NAGEg+H/X2kRDphYDjXckUnmb7epY814ObWwavip4qTTBd5IIAzMq
         6hQLMvumTkfebXepcXrQUPUIDft2MkMGymN25vD1xVk6n4Qwvywjm1cMVTY5Kve4LCLF
         lX+er6+Jzub4yckJnGiRlZnpCJ6Anr1VQ6YlmVsA46CSAaCYSjJ6Ln1luq3fZldcqZ3S
         Qov4OppPwAzQhfMOgs28qi4xbw0MYwWLiboPLVeyv+Zgv85zrG3MXOjjg1YhG8l8ZsM/
         j4+pZV5jWenCWzChwhk0Tjcg1BYUCTwaZtW+4ovgFCzPiM4ZOJqVww3fx1EwQcxYUSGo
         ik6A==
X-Forwarded-Encrypted: i=1; AHgh+RqUzpu6tbEfIXbl7CE8KqPC1aeycoOUHKJ/F3uLKlWOgifCWyH6q9PXxKVbzPlsAVv4HDu10c5Cnm2S@vger.kernel.org
X-Gm-Message-State: AFuF++n2WoZ8BO0iaVLt0D+HNfo6I271rQ5nfKfpdiRwDR+xWZZtJYOG
	3nmibahmh4/jetLGZ+GOT25OG6DPX5ECI97UqzStEOHW1PSUq04Inquv
X-Gm-Gg: AR+sD10LEPMQCZkttOoWO5fMwixiy+s6xYKePEW+v2jskUOAVj32SlfT3sJ1xViK42A
	BOagPT4V5gMqQdDHtqfONxDJNt6XT4UPu8V8DEXPgCRtR1YSTP0a5LZ6FXHj/3xcZ/yrZKtRXA7
	vC4eNjdeKOvtuhQIvN9oeKzCjvVZzeS2xXnboBAoO0zu3AribaAws+dfPquhfIkmPWSZf2Yoodd
	KDzioLz0hMe/mkzMz7uFN5PY93MJkD/YSxln9o3ADPhtTCuhnrdUFW8kPW7u6VS2oGECkOnNke9
	qwHOGB7i4hiWf+XD+JFTflRcYrgZ0vGAeRMqg0scLTAIBiq7d46Td4ngu7M/5+GZ5Ocl9mxUWEr
	Yq9fUkAfeapfrQJFFSlsaJ/5uVNqS/uUDoK7lS2oLQy6Xg266UCcj2/uY6HmiedITRQbtTelgA6
	vHLEVx0qVuhWrUV+t5fv3uEQNb78ZrrUfgu1bJLASMFUGjjwboEZlToUQDTpC/BhPybw==
X-Received: by 2002:a17:907:e1d0:20b0:c20:f864:d480 with SMTP id a640c23a62f3a-c246a6559aemr1554170866b.13.1787484035807;
        Sun, 23 Aug 2026 04:20:35 -0700 (PDT)
Received: from thinker ([2a13:54c2:f000:e268:6d0c:d746:2b12:231f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f58dfsm707233866b.38.2026.08.23.04.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:20:35 -0700 (PDT)
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
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v5 3/6] drm/ssd130x: Constify ssd130x_write_data() 'values' parameter
Date: Sun, 23 Aug 2026 14:19:56 +0300
Message-ID: <20260823111959.17029-4-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823111959.17029-1-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
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
index 8cf1e9c84a81..73e7f2a8b730 100644
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

