Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24B726CE05
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 17:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783185338; cv=none; b=Vz05xaj2NDYbDmSQWFzW0kYkkr8qW3enyKWZCRhewJoCFRJ0lJ3zt/ujGKEo4wHznKlulHrPD9D8VWq8j3GBJOEANbPuRdY5zATQb6cjEQI4o2hq+tJNSAxUlRq05n/6XqYt/Mc2RR/C4ymSgV718pE71EhKvD8AbuVSVpOGJ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783185338; c=relaxed/simple;
	bh=NL0+DczK+bX7h5aeTAoVt3cN5b8jI07kISjmFCzG0dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMHMOeRQA4UlkhvvMWDqTgGC4ULIvJmaZ1Ake26o9kR385jKuOxaq2CMZjnJ89sHlGgrSCyCDH8aVE62QusB+a36ylSHUv/OvUexW2Gkkp+j8KUppom0mk/r0fDK5ysRxYOcq2EeODPA4jnFNycpElDDHZ8y8sq5zPCzyZ0lX4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ka/d2E4n; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ka/d2E4n"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-845eb7b96feso1505759b3a.0
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 10:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783185336; x=1783790136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsQaU9uZZtvn5+lIZrSejmQfTd4zI1y5dE5Iy0qO9rc=;
        b=Ka/d2E4ndWwH8xyqTyI3x5s9987AxA5ijuEEJxZuXre0Yt6r16Xx1prOxtBvYZTYyT
         E4lUUIPox88dz8qz7VOis23Ulrb0HqHl6S00YSwAxrcvuw6Yv30hMjPTCn1xQ4uQtl6h
         yWfP+xDkqPC/UFGWXuSnpM935LFKS6c6n23oOTnRY8/Ah0CQIOKwdwFePxAClT7cmC60
         vZIFJrOOqy7ezC+7aq9fMuRPP5iUPSAE09kV2ZrcxWouLh32BqqcInkQflFRRqcVd87I
         2KhYdO4UA8vvilOIvCk1dnIOIOR/h+H/CKvmiDsfpw7bgbLxIyWiPHpxmjuY95P2rOgT
         dqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783185336; x=1783790136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsQaU9uZZtvn5+lIZrSejmQfTd4zI1y5dE5Iy0qO9rc=;
        b=aVgXekKncPeKCeXpCrhJVc5+XVT+IN9cZFMMYVBnmBZPcw/M16H4rGSGAU2479Z5jf
         +/Oc6NbsGqsZKEzGZfq2TiZ3qHMal8OKvJd/44//V7Sxa+vkyYSqEUaHjMkCPu6BVGPe
         su+F+XinmSG8CAWogTOaymPK+ATCn4bvWWT2AWosYlMiPiFB5intYvSl/WywYe8b9ZrG
         it/cq9raCOEaDg6nhII28y3nx0VKYhzKcw0sS/V/cNZx0hj2Sq4zMChcS64w6YKXS25V
         1uJqJ/pxAaGcNT5Z2Hm1C9+EQ6//TplPQDoxhRFH/wbRKRWsZ11XgBfopSFpi0pCIs83
         eypw==
X-Forwarded-Encrypted: i=1; AFNElJ8CtLnaV1f7Izs+8mDl9LBqhUiNhNsX4FmG0KZ0MYZk3E0LtE/DBib2jRnqIPermbQykb1ymXrHAYw5@vger.kernel.org
X-Gm-Message-State: AOJu0YymiUYbzTrT5tx4mLNvHIgfP5QYBDL7twQUzWDkB0DCZpAy1Q4T
	OhW1CKssOGeJ4VG6mnVlhBHckQZDfZRhAJfIN2cbuOd+4fopXUaJv+uBC8rlow==
X-Gm-Gg: AfdE7clyU/onKU/3+m0JbOIpmXJi2+m+CrGOUF16IGrjdkuB+fiNToJxFk6Pg8BF5n3
	223rKS5mccM7JHHdv33dWuNQgV6FMQdEV9SnNmQ3JNy9NDaJtXP8XiBQOQJI28YJi9qF7kQ5zUG
	wC5en6kpPKmSgUHs50WaVhuxCPlmgA0gWxYOIej9qvN17pX/wIGQLLP+uKVaCFkm5YBwfWhbkjQ
	lM01WWsgxz4XUEG+23nzbFha4Mjpb4bdQa7LGqz8XTqPw9dRtHgu3Hbo25ypOSZWmfCewNshZRx
	MZ/tYNIyNhoWWzJ8i+nDhbZtrXUlkfUw1TrcWC9/NMTD0P5Hogz3sldU1s1P8rUd6d1NvF+L1AP
	Inmk1jOMlqPjAHl/daFNMZtI5ki6wQbafOQM0Gjb3JSHbYr5e+fEqQwcmJn2DiWtULKAGTLZ1ix
	+oF2gh
X-Received: by 2002:a05:6a00:3305:b0:847:902a:57c1 with SMTP id d2e1a72fcca58-847f6f84d6fmr4092931b3a.57.1783185336159;
        Sat, 04 Jul 2026 10:15:36 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498adsm1379101b3a.32.2026.07.04.10.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:15:35 -0700 (PDT)
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
Subject: [PATCH v5 3/5] thermal/drivers/sun8i: get calibration data from two nvmem cells
Date: Sun,  5 Jul 2026 01:14:09 +0800
Message-ID: <20260704171411.1413349-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704171411.1413349-1-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 processor has calibration data in two nvmem cells. To be able to
add support, the ability to add data from two cells into one array must be
added.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 80 +++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 29 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index df0c26970..3bdd62aa8 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -301,43 +301,65 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 
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
-	}
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
 
-	caldata = nvmem_cell_read(calcell, &callen);
-	if (IS_ERR(caldata)) {
-		ret = PTR_ERR(caldata);
-		goto out;
+		memcpy(caldata + callen, caldatapart, len);
+		callen += len;
+		kfree(caldatapart);
 	}
 
-	tmdev->chip->calibrate(tmdev, caldata, callen);
+	tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
 
-	kfree(caldata);
+	devm_kfree(dev, caldata);
+	caldata = NULL;
 out:
-	if (!IS_ERR(calcell))
+	if (!IS_ERR_OR_NULL(calcell))
 		nvmem_cell_put(calcell);
 	return ret;
 }
-- 
2.55.0

