Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B693DD532
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685781; cv=none; b=rdxAW6dPyJ/TuXzd4WIcu9joiAVKK1S6Yh09MHV5iAzCQo4FVfVrb0hqGWk8kOpXwbksToTFD8GXEJ5CDMglmqD6+0uZwYgvXeMtCbH8kp9VWroYa344HbDkLv9OGf5286peCxbokfeUFv694tmq6JSHOXscr5Ru8mQY9LPhFZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685781; c=relaxed/simple;
	bh=6IGoRf0iJWqFqGz653rSLor043q1PsRAtFVRBPebSss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHTrWGREQVST1Cg1DqQk8GKV3J0Ax39jPZ7XWp8Uq2D6yr4JLa++lKBZmQc0uUQ4aY8OIxKXnAU4M3F8y1fecn7tcym2Yc/xukvYL3WY3X7KaHrUb0Vw+Gmehu9gevZnSSgESStPxdkupeZmEtVvbsyYvGjQUy+UzgCDWo0Er7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQvWG1YI; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQvWG1YI"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so2355359f8f.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685775; x=1791290575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTU6XZjmcS7TvEyqUP6ynn7S+yFmQsFsBbQjNLcARwo=;
        b=VQvWG1YIfzEEUW3SiuBhAo9mGGxmJoeJ6g4bUga11LDZ1Ty3ujhsLFPW1rs+pgoz5+
         EhHu4URPYEcCd3h87BElXnf3PV8WaTlQGwbpUV1ZxufZANESoh8K4JF0ya1MjoHTDNHU
         ifjtAG8haYxEUpcZBrgFPlV0+DuxZtaXDo1gSefRt63aH/m7AFChU+SSqCq3CTloNGGN
         HAdQ2PigN7h4Zj3V2572BRoy5fQcuW45Z8hF5UQ+Ocfh2qKgqoDH2pr5QuxHLFUHduiY
         hke4wcnCMkbnF4jZJ6vuI+P2nykRLMR2c7Bnd0Dt2b7qnKOvBXezgZi9hRMZvnaluG1i
         mqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685775; x=1791290575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dTU6XZjmcS7TvEyqUP6ynn7S+yFmQsFsBbQjNLcARwo=;
        b=Ao2Yxh2ac1V/fwuxYVnGB9uZMpdZpvJxze74mz09g8iJKCn5URmIuuDeGDGcbPL2AX
         PTT1UyT3Wq1qwSN5gjbvW8BWriQI/w3x0TW7RS2UO7g5CuVL88/1XbbMCW7Evvk+KWsM
         Ustn5gbeXxYFTn6aGzlGCTQ4fdKRjNDtyhdaoh4A7ZfWMvK2TzyrbleGiEyuxK2pXWY+
         4ykbs313rP5VoOd/MLrHTOK3wZa8J3im7mwv7oGXtoVuLzLT8YpCOniBVM54mM+A3/dF
         Eg0KZjpZp/2XzwZ6lHPtvUZ/k2mNEhFVb66bM8Qwk5gXFlJDYi1/2YMNB2+QwoylFX1H
         CvrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhrRoboCW+go8EJ8MTk0wr0wPR/7Z8ofOIcTCg0jPj1HMx3bGPyEDTm/lUCAs8QHlCaM/7WyKHIbDh@vger.kernel.org
X-Gm-Message-State: AFq9FYLv2b1ck+XmVFrGJ+cyQve6nXdX565cmVxBGB1CRYTlls3cflK0
	AJaT88S9lYVORSWaiL8m+yhZXVMnAnUE0rXMwSUC4PWYwmw53Z5bnujc
X-Gm-Gg: AYBFou3btljxmPiANEAtXG/cEioFoPVsI8r3/IHMXQxeHOAnYGDNQhRD7Poz/AvJS8O
	gjm99LQPMbayb2McOzo8nFluGuviHrJDy4wtuEBsKfz+Q0E1PyxIhnoMCUttuPE1ruu5s5q298q
	orUa4OTMrQ90bDvLMjni2Urn4RLsSHP/ul4JEzfNlncefIya65aTXfmyALMyyaVPyhVRFD7LIqF
	Is6x8mLvWMhx5AO+CxAVMv5ZrdzLB/ITuZWYqBvInE1+pLAxVt/xYn1lF9vr0zoB3ohmFDE2RAz
	ar6Wmpz2EPRZzTsUgob+qkjXbaCBAhnTG0i/X1it4TnWQsr80KCg4SkSBK0vsIidHRKu00gRPt6
	lbfeCqzRHj3Xyuk4sALfLjSN4UL7pNNE3C/kI1AvErWlDPWPwChn4YD/imzhuY6fE9CE2yPZK+f
	5Yz13I2n9kntQ+O7D5TPcxmcmcRIUnEh3e2jJZ+hOjxQPpurIHsLo2hDkJMBENGSgQ5L+Qwlqpa
	mD7F3+RxIOpQ7obQQtvOj1Myq8dX17VYjL3Re55d2ph7E8G9B/WmV5rrRSfhL7wl65W57esv0+N
	/+6MRnOUqKKoEYq7cg==
X-Received: by 2002:a05:6000:2088:b0:487:27f6:a4e3 with SMTP id ffacd0b85a97d-488716bc4bdmr27496539f8f.51.1790685775390;
        Tue, 29 Sep 2026 05:42:55 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm4436630f8f.11.2026.09.29.05.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:42:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-iio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/8] iio: adc: rzt2h: Add optional reset support
Date: Tue, 29 Sep 2026 13:42:44 +0100
Message-ID: <20260929124248.237032-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for RZ/V2H(P), where the ADC has a module reset line
that is not present on RZ/T2H.

Assert the optional reset when the ADC is runtime-suspended and deassert it
on runtime resume before performing calibration. Assert the reset again if
calibration fails.

Use a shared reset control to support SoCs such as RZ/V2N where the reset
line is shared between multiple ADC instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/iio/adc/rzt2h_adc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index f1a830da6f9b..4726f892da23 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 
 #define RZT2H_ADCSR_REG			0x00
 #define RZT2H_ADCSR_ADIE_MASK		BIT(12)
@@ -90,6 +91,7 @@ struct rzt2h_adc {
 	void __iomem *base;
 	struct device *dev;
 	const struct rzt2h_adc_chip_info *chip_info;
+	struct reset_control *rstc;
 
 	phys_addr_t phys_base;
 	struct rzt2h_adc_dma dma;
@@ -706,6 +708,10 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, adc);
 
+	adc->rstc = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(adc->rstc))
+		return PTR_ERR(adc->rstc);
+
 	ret = rzt2h_adc_parse_properties(adc);
 	if (ret)
 		return ret;
@@ -767,10 +773,22 @@ static const struct of_device_id rzt2h_adc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
 
+static int rzt2h_adc_pm_runtime_suspend(struct device *dev)
+{
+	struct rzt2h_adc *adc = dev_get_drvdata(dev);
+
+	return reset_control_assert(adc->rstc);
+}
+
 static int rzt2h_adc_pm_runtime_resume(struct device *dev)
 {
 	struct rzt2h_adc *adc = dev_get_drvdata(dev);
 	const struct rzt2h_adc_chip_info *chip_info = adc->chip_info;
+	int ret;
+
+	ret = reset_control_deassert(adc->rstc);
+	if (ret)
+		return ret;
 
 	if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
 		return 0;
@@ -782,11 +800,15 @@ static int rzt2h_adc_pm_runtime_resume(struct device *dev)
 	 */
 	fsleep(1);
 
-	return rzt2h_adc_calibrate(adc);
+	ret = rzt2h_adc_calibrate(adc);
+	if (ret)
+		reset_control_assert(adc->rstc);
+
+	return ret;
 }
 
 static const struct dev_pm_ops rzt2h_adc_pm_ops = {
-	RUNTIME_PM_OPS(NULL, rzt2h_adc_pm_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rzt2h_adc_pm_runtime_suspend, rzt2h_adc_pm_runtime_resume, NULL)
 };
 
 static struct platform_driver rzt2h_adc_driver = {
-- 
2.55.0

