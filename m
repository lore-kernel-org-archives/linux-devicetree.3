Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778371;
	b=DXu5lUTniaB1nnuh1PWHjw9+1MVQlN+ZEffkofGQ5BYCGXkOhdfZKb14HYv7i76QU+ki
	 GUUe3KUFYj6x1N+5FePCIr1aY47aVVrl/dTpobdsipjoik0F2lkA7MtxfmJDVmArgvyR+
	 0JBg36NhU2qKLtQwXOL3tRdXI0ozqcosNP+a6xakKhiHPM/9MjWv0lK1RuPEmGqy6mNJW
	 jfZUa5gqEA5wyt0gAuCCNw6lcYhTBOdYXZ2n3myaacprLSlwI2HS/EguDfSfIEqTBhqPA
	 kecaFPtkbIzF2P+3f2dnt1FX7FAvNpGt/XqwlKFNmk5UAWY++0hGYF4z7tqRmdR4DZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GVmgd8z0CPb2cc8gY/ciKAfurSnSMglt/JBh+HjasTs=;
	b=cXJe3fz8IbLbgPHUe4huOvh0J269FzxM6gFnn9w36JEmHlMOVAZDRexUcRr3FyZ5oEXb
	 4Ik+9RpRS/TOyuiv1cnoF+OBYF6mh0+E8KSVbPKJHAn0Ruy5No0FNmuPovaSgnUf9ucle
	 bQUMWX4P+w7T/ae01rZuF/RD8rV5bhPJZ3UcJJ9d5uVoBQ+9CEUTuULzRQuZarslcpVGl
	 ErDPoVtUpEDlH7MQOg09xIUiKEXsdr1W+0MBng0I+KWbQHT72SFWLP7QDJ8kALr5CMUcw
	 huWDbWVHaJWdu5Zs5iSmU+WzOnzWYHQUkpjfQIp/Eeq7gMstMAkivQlbP+0Mlkwm2dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RGgWKqKe;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D3760A2605
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D3760A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RGgWKqKe
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e00eee27dso764954f8f.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778369; x=1793383169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVmgd8z0CPb2cc8gY/ciKAfurSnSMglt/JBh+HjasTs=;
        b=RGgWKqKeYbqLW0wSlqk2RC3TVrh9pZb/qBOtmdo1z6Um8DH2YQValyJHCcsrU45xRM
         rqds4snvjM3RElw0tPKlmBnG/ZS59z0VNp5NlNkyurocmDjZGYNz2rqTjz+Sgh3DCfRc
         Pfq5WtRupPT31sivjVqm1WT66KRoj1RRI5BpVuahZGYM6cCTktx1fRKm+lHllMR5W6uH
         MH4iceWt+pWQIZX1Jzf7qANDe77R0xQ+zclk1cw1PNeqbS6xuWJJ9wGCqOH4h8JqIfOk
         6QObAnUW6kJkKfArxU3L18Iw5Iuq2sXspHU7vZ5TtHbHTs7Xuwb+hUQ84Erq0FKd1RAi
         dOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778369; x=1793383169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVmgd8z0CPb2cc8gY/ciKAfurSnSMglt/JBh+HjasTs=;
        b=JsNBMg2DaXd2n0+2id4D5zVEiJYbHOHROuvqCGmmmSqP/Fcqvs6IyGXhJrI6Sj2KMC
         Ts4dUSWvXy9n5SYH54MeSTNId1tF2uPvfUpqMwiv2tUoKZ4hv/9mdh10rUUZcm0MGEP0
         qcsGxnk+6YqEgKuE8bRu+sXJDoKqeY8v7nYbR6vBhNnTKOlqrPTHQ0UTTUQmLLzQkeer
         iGQnkm7otcSNxWiNJ4FWjq5koI2XraVTLfUnIJnjfSyZbAhyagm+rbzp4MT7nTeFcCzy
         QXEOOfzrjbkeC5JdzCRgGtLxbBlIH6WuAeAucZkmk8UHIQDXn1UKfDF4j3GhI2LjodJX
         STlw==
X-Forwarded-Encrypted: i=1; AKwUvByWslk2520uX/hhjmOkF+Tsd7Qn1n1wk+KbWlNRJCP0Ql8V3OD29G1DrFNPFDfCWr6QqU+VKUnUPluH@vger.kernel.org
X-Gm-Message-State: AFq9FYIpAMKUeTK+LVJECML1G40IQwogiahq628WeFmHZkyf/2hPtYmq
	2IfGKWxebpLeMoPGyMmAyNVB/DiKLG8Nnbz0Xw4vi33DIQ2PYxsrKYw1
X-Gm-Gg: AYBFou3F0va6Cf6wyyS7OSd/89/feYf7cwSGWCVIubgT1654whQQMY+m0vmZzAyI7vk
	VeCvXojrIuWrB712mY2c4PeQakMnHNG4i0kPDdAoVwhoCNOpjhI03BiFMTxX1K2YANRj+qmXjYM
	5Bh+I01IHr0tt9p0c8nRLNCI1+FmjRGq8jyO21AtFAy1Coq4RCJNcoupppiOUh/vK+ikTSYQ5t+
	DIrStQsMfAqKx424LeUjKdfY4rzruzGzS9Z5RC7qqTbKAjgL6Ac/wqI6etTINuMYBj1MtzkDHBT
	HhhSLMBsY9Ii5/oC/2CHPHgzFA4b905m4kzWMDMAscRZmeMU6ayZZYQ7PUqVUupUzJVoBBgL8+h
	OtN4P5bMzvLF//LcuMCwh+sryw1JpmcahCjsq4kx5ZUyKWuR1bOnCTIRDrjqmwLIF6pajV5Ws1O
	by7HrFGpFuAqXjyjFUYeMCs8AxjvuK5mQM4eaY7PjXskOnRvB9K+rSv2BT+MHs199/IcwVR56Q7
	VS3JZgz1fxKHd/SfoCYJeAuvbl1IlaAgx4MMPNCXih4Ni6gxYkKHNOrAinXOH5j8Q4M6GuLr7ul
	DdicWT68Nrxnc82AhGxR+Y9xxLrX3dN0ShmDjvoQ147LMnGjluvb4CPEG+QsCAlWcfdThDVkubn
	2DxYsWRsInlW90n/fdqxiNI0NabtET+kd2eirFlIb3/7zkg==
X-Received: by 2002:a05:6000:22c5:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-48e3859df07mr4841249f8f.18.1792778369013;
        Fri, 23 Oct 2026 10:59:29 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/8] iio: adc: rzt2h: Add optional reset support
Date: Fri, 23 Oct 2026 18:59:15 +0100
Message-ID: <20261023175919.160103-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- rzt2h_adc_pm_runtime_suspend() checks the return value of
  reset_control_assert() and returns it if non-zero. This is to
  avoid churn in future patch.

v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 2ada8ecb2603..51a976f85ae7 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/time64.h>
 
 #define RZT2H_ADCSR_REG			0x00
@@ -91,6 +92,7 @@ struct rzt2h_adc {
 	void __iomem *base;
 	struct device *dev;
 	const struct rzt2h_adc_chip_info *chip_info;
+	struct reset_control *rstc;
 
 	phys_addr_t phys_base;
 	struct rzt2h_adc_dma dma;
@@ -709,6 +711,10 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, adc);
 
+	adc->rstc = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(adc->rstc))
+		return PTR_ERR(adc->rstc);
+
 	ret = rzt2h_adc_parse_properties(adc);
 	if (ret)
 		return ret;
@@ -770,10 +776,27 @@ static const struct of_device_id rzt2h_adc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
 
+static int rzt2h_adc_pm_runtime_suspend(struct device *dev)
+{
+	struct rzt2h_adc *adc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_assert(adc->rstc);
+	if (ret)
+		return ret;
+
+	return 0;
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
@@ -785,11 +808,15 @@ static int rzt2h_adc_pm_runtime_resume(struct device *dev)
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

