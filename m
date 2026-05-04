Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB4E2472A2
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 05:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777871037; cv=none; b=CPCCz95MsUUnyMVl4zk9kvQ/ssmNZUthoOIP3F8xHIazZMbu/YStL7Li0Dx4tYNK8uUHkA4lG8Q2mIJYh2ZQHNVNpeFVbW36MWjRxk9KoCmNRUmoYqIBgG307JZifqhZOlbvtqcFWvAskM+ntdeHUzyg72sS5UFU5C2HkRij67c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777871037; c=relaxed/simple;
	bh=ESOpoZ6325VLRLNq/W+ehNeMfVtaJC9EPjvW5kmH1DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDLLeC7CoX/hqPhOCS0afJ6kBukP1hjuWXvfbvsT4oiJS4tRToWP7D65z/huparjxCce3Nm/JIpI0l8JATel7J/xmOWozTpe1njWH9UBNizZzd9trsf/IO3DSCSt8AuS3ZQmLZK9vgAQcpojoLAK6eMydOW/uMQj8jKJ0vWJhTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=on6ghLIr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="on6ghLIr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-362bb3260f1so2595373a91.2
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 22:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777871034; x=1778475834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BR+GQkq+OHGSaM1M1XSEfGoOR2adYsGXzd7KgnjDEDM=;
        b=on6ghLIrzFXVP/mecwXgF6J5F6RUFpVdWVXK421vtob9X4PbLLvyyXNHHqCkZNWjjW
         BxFzTH1oDkBwHrCmBJd5RmIltdLZ3fP0J6In8DmQN4g2shTvRi+R0PDKEb2gGFERFdNc
         U2ORoRYahvGrf1r0E/iJds3rT8caZgwQAg/UgX2fVjQIubpNOpFUbNfbLFaDNSVsYuvy
         Khyc02XMx6qmoQJEu55154bCa+0do500bkGUh9HCWL/DLcKvnQnv1CX4tKlgWWkWuftv
         iUGgNV4KUK7PEJBZKWYSJXcR5LeArHjxGwRdI7NXNMASEAB+DzzDBuUichJCNtVwAafG
         Zceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777871034; x=1778475834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BR+GQkq+OHGSaM1M1XSEfGoOR2adYsGXzd7KgnjDEDM=;
        b=E5lewsAIrtMVkmYZQKFfXQ3JVpcx4X7fq586vr8BQ6KpjJpDKFD76RMevhW6uLTJVt
         diEzWGoUI7TcWzMkVuIuPXAnZE0AYtrwRFpZ8xEAggQLcROQFu+V53BIGpW90FK+gADd
         Beh5OyaCOLxyufwDtoZlt0XOCN7stHNwALpe+hzHgGBpPu71ht6fT1KAxmWU//BQfctX
         aIkgjq5Cu1/bW6diI4nWb07INiUjgqvocc4epM/QcYnJF8x8Oea1Y1+n9aYbwDkFdc5C
         oX4c6YMz1bSL4Z7L+tTmo4e/S6oChms9yU8TatY2ywNRatNLH5tEV94+3UQjhCemQYC4
         nYuA==
X-Forwarded-Encrypted: i=1; AFNElJ8V05WbePOdWAchCapJb5ZvNU/v57wn87qEhamPTaYCIITXpL1XTPU7yv6U/3XHsvmjMogf0SDfo+6O@vger.kernel.org
X-Gm-Message-State: AOJu0YytIBnDoUriSRK2iNcCQZJUGZCIqQ2cTJ4aqcmSbeE9OqCnN4S3
	54YkhZ3QTJP0BxXhrnJPegF+KYyDKfOwgQONKHcEIBCOzln+UzXdjft+
X-Gm-Gg: AeBDiesx4lAJHaUun/IYiTcmpKJ8/EpPuwcB/If9Qtvi/g9Jfm/xsW3rj6xcfcrUx0a
	jJu9wHwQCqIlYchn04LE6Oy566nGGubHI4L/ansLM3L0Y5Tlh7SOVng7sYfxOPaGOmxhiXpwsHV
	l6G4JKmqOG2s+KlU5K81JSXF1Fmq6Q3hg7FvMF+obB42b/GtaCRDNYF5icxB4yadll5J4R93UVe
	+2VYrHXrjhZeD/9ZHrAJi2UZkehC+h3tS6HKZZvshI4tH3gGGCG7oLPmxLTPAowCofzoQ1AkzEP
	XnJB0Tae3d363bYrdPFB2xX0ic7c30o1Iw525lAcZgP6FJ86F7EJrfoPAjlv3nMhuEQWO4csrjW
	pYucLlBXuoGnL/hdvh/ZbzdkSHvahUvTOHmYcCbfeEflcENz2xMub0bGmWbWsF0znt2idTd75UW
	l/gA==
X-Received: by 2002:a17:90b:17d0:b0:35a:24f3:2c8e with SMTP id 98e67ed59e1d1-3650cd95ddemr8487132a91.9.1777871034512;
        Sun, 03 May 2026 22:03:54 -0700 (PDT)
Received: from archlinux ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365437b50b0sm2662908a91.0.2026.05.03.22.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 22:03:54 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] thermal/drivers/sun8i: get calibration data from two nvmem cells
Date: Mon,  4 May 2026 13:02:43 +0800
Message-ID: <20260504050245.646078-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504050245.646078-1-iuncuim@gmail.com>
References: <20260504050245.646078-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 processor has calibration data in two nvmem cell. To be able to
add support, the ability to add data from two cells into one array must be
added.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 77 ++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index df0c26970..c4aaff8f7 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -301,43 +301,70 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 
 static int sun8i_ths_calibrate(struct ths_device *tmdev)
 {
-	struct nvmem_cell *calcell;
+	struct nvmem_cell *calcell = NULL;
 	struct device *dev = tmdev->dev;
-	u16 *caldata;
-	size_t callen;
+	struct device_node *np = dev_of_node(dev);
+	struct property *prop;
+	const char *cellname;
+	u8 *caldata = NULL;
+	size_t callen = 0;
 	int ret = 0;
 
-	calcell = nvmem_cell_get(dev, "calibration");
-	if (IS_ERR(calcell)) {
-		if (PTR_ERR(calcell) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		/*
-		 * Even if the external calibration data stored in sid is
-		 * not accessible, the THS hardware can still work, although
-		 * the data won't be so accurate.
-		 *
-		 * The default value of calibration register is 0x800 for
-		 * every sensor, and the calibration value is usually 0x7xx
-		 * or 0x8xx, so they won't be away from the default value
-		 * for a lot.
-		 *
-		 * So here we do not return error if the calibration data is
-		 * not available, except the probe needs deferring.
-		 */
-		goto out;
+	of_property_for_each_string(np, "nvmem-cell-names", prop, cellname) {
+		size_t len;
+		u8 *caldatapart;
+
+		calcell = of_nvmem_cell_get(np, cellname);
+		if (IS_ERR(calcell)) {
+			if (PTR_ERR(calcell) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			/*
+			 * Even if the external calibration data stored in sid is
+			 * not accessible, the THS hardware can still work, although
+			 * the data won't be so accurate.
+			 *
+			 * The default value of calibration register is 0x800 for
+			 * every sensor, and the calibration value is usually 0x7xx
+			 * or 0x8xx, so they won't be away from the default value
+			 * for a lot.
+			 *
+			 * So here we do not return error if the calibration data is
+			 * not available, except the probe needs deferring.
+			 */
+			goto out;
+		}
+
+		caldatapart = nvmem_cell_read(calcell, &len);
+		nvmem_cell_put(calcell);
+		calcell = NULL;
+		if (IS_ERR(caldatapart)) {
+			ret = PTR_ERR(caldatapart);
+			goto out;
+		}
+
+		caldata = devm_krealloc(dev, caldata, callen + len, GFP_KERNEL);
+		if (!caldata) {
+			kfree(caldatapart);
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		memcpy(caldata + callen, caldatapart, len);
+		callen += len;
+		kfree(caldatapart);
 	}
 
-	caldata = nvmem_cell_read(calcell, &callen);
 	if (IS_ERR(caldata)) {
 		ret = PTR_ERR(caldata);
 		goto out;
 	}
 
-	tmdev->chip->calibrate(tmdev, caldata, callen);
+	tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
 
-	kfree(caldata);
+	devm_kfree(dev, caldata);
+	caldata = NULL;
 out:
-	if (!IS_ERR(calcell))
+	if (calcell && !IS_ERR(calcell))
 		nvmem_cell_put(calcell);
 	return ret;
 }
-- 
2.54.0

