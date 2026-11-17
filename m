Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895570;
	b=OgRsynvOfkaM6li8ekGYMaCdf0wC7qO7MnoJrxSD7cg73tXJwQxw//Gnes8yZKEHtb1x
	 qPSc3xUpyXbxEs1b3MJg/Qt8hVzyyKyqeHLViLRwsSR3bTH36puGXJF0iquimw0DEUAvp
	 1dgeWk51PHFpcUxQjzu9PO9r5zm0IzhQIuSJhN5ZsRF/DUvvUeRI6bGG4HB0h6p4oDyGm
	 6A0OQiZEsms7UxCZEZfpQccKSYKXU1tgOfryXKKIqqVodeHAVmTkwQP7J0r9hxTxA6rPx
	 FwLQ0B9Dpy5a8UUGBqa9HfRWwQMTRk7YNmRx+R9w8mBMZKosuOjWcWVPo4kGpyAy0GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tl9vm/5oN7PPPGTUSOoXHW2ARgY0Relof58jU72z34E=;
	b=Oe7xDGmRfV2iotxiCx9ouRVNiMlHuJ1XhmU5IpaDDPxn1z4wxq4Ye2zhWKc6PPnUbcPZ
	 gsXt6FBTYOPSrWBtDwJ+d3yUL3+b16rp+nYEVTULb6ZMCxBWwOL+eQrSRHOpS0RHMvpGh
	 bumFf2z6ws+C+qqjeOFwigV3yhTVcC4x76ITnK6cUVXBJmBVp5iTsNMgiFZvszkRl4ds9
	 3yXwfuTjCK1+bd+A5bi51rh+uSD1lAJ5f5dDj0j0+DwrJfwlE4v5G9CFc5nlFKu8IJI9y
	 z7VKx2XtPxFyr1qcgEvooW6lK82c5nfi0gnkbOGrUBbCALY6Ds66bUfatIT8GfpfXsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MxHopM0;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D9606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F33D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MxHopM0
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso4003140b3a.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895569; x=1795500369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl9vm/5oN7PPPGTUSOoXHW2ARgY0Relof58jU72z34E=;
        b=0MxHopM0RoBSrxdcP0gh7Wtc+00aT+pe1XFBwhR++vrkRR9p3A4+zNGV9iJYHboU6L
         hEyHUZ6hG2q/BZfuPXKczNao6M/nT9VoyuPZRju9iHOFdTbCAXI6yaVlNAKM2DAlCA3E
         OvE3WqiZxLgN6mXNYVe81Uor8ozSE245dBZONxyE2SX7Rb+NbSEbCM+kEOdpCououT3z
         QndBh9pTKIjQnK78uVltO8m0LZmGTnR7UPZQM8j0UtO3zNDWS1GSHCKcS4GSjMZE7hAq
         Hsc1I6obwUAVhlGHgy9S02gEJj9DoWIzLb/+H+qp5dMJ0ApHw+/as+AzEtny2xus6+rp
         f5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895569; x=1795500369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tl9vm/5oN7PPPGTUSOoXHW2ARgY0Relof58jU72z34E=;
        b=0myMY94Q4c6bAwYD8CekfHKMGQnCnOy0XW24pbq7Pc91YzNiCqdYI/i5lrOLFTFlPS
         aNUEb1MS2xaojVd0UviKd3TNxu6rp7/tfwYv8+lz8UQba6ZUh4WUBQ+5Cj7UOUYwkw3H
         zd3D92yGnrOcec79FOgTYutcjhfF2CR+gHXu2K6BSTQCo4J2xAdhbn/PMjJC76SGkXdQ
         4ylJ9WVxj+jYQ172Je8S+c0gn7kiJ427U//cQb0V9NyiqWzsqY+4wAb0HmhxfV5gU0MX
         +6JKRQqWzrBs7aJDh0YR+Rn1Vqgq6SwoXxb47ZaX6xBfTF1kwqi/7t3IQqDOAfV01zvQ
         4Ybg==
X-Forwarded-Encrypted: i=1; AL+hErG29lb9Z55EwDIuW6n5DlCie+cf/z6L8CvBrBkVeOpH4MbHlUsMB0zDabdBRqHe22u6xD7t/oL4IwjZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8rGDOv7+X4eSBxR9EchA4PnDSofwhNOe3R3J3KUF7vL296ddZq
	VfvYaOeHOn/6SUeLDarSaI6UK0hkfkjDpwzZlpyHWmrxK0tUn9x/BXbB
X-Gm-Gg: AYBFou1nMDw9MJnhbSCib+agzCjORHm1sE0KrPfLxTDZyiMu5r3ZZDtXFy5QqFmGQXf
	AbaoFLE45V85vYxBsJe0GTTH5V/E7/qtCKul6i2Nm3Tz1e2qWVHpm1EopcHrBJu7WNyyZ28UYhY
	p5bqZDMgjf00PSelzbNc8U/3/QclgTdzBPvFISXw75iBVA7LR6RKLgsG3sLzESlBEsp6L6XA3u0
	oXNJ4M77X+hAd1L2r6AnBjOCbGknBgDpIW8+FTFJPTRRdCq1pChZsQ1m5D00xmBTXWUheXO8Du/
	1qgHJNldgEgFgc+vsHjNuRIa9J9yo9qGfBaFH3QlqBEZNbkLv2+dQ/2N1ouoCADY3UmoyZH6Gvh
	96jRjVrUo+MWqgIKD8s/JCSN/Y57zRw99POlI9K4NSMAxqQ84YRZQjsfzsjwiJtMtlVXw/j4UBc
	izIC5HffmMF1/CxE8ZNdc5GRsOetIy0/+Or7W0lJ2TJBuEst+jc4/tuGcYjHsu4l/MdHzmAzz/G
	vs8aQZUsnszRFSRgorVerI5ma8UVia7QXW+5PQruZhM3ohso3UEM20+ytZP5RLi4NGW9yZjobpU
	ZUqqyKQZz3p1KJ8FLSKt3CwHaB2+UjbHYft3D3FYk6kCwBEF1y7XWZjg751c1/8o3IVLRcM7qVA
	iPLvS06C3TLY=
X-Received: by 2002:a05:6a20:a79a:b0:3f9:3f64:9bad with SMTP id adf61e73a8af0-3f93f649df2mr5801702637.4.1794895568851;
        Mon, 16 Nov 2026 22:06:08 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:08 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 2/4] reset: ma35d1: Register auxiliary device for the temperature sensor
Date: Tue, 17 Nov 2026 14:04:59 +0800
Message-Id: <20261117060501.2611071-3-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117060501.2611071-1-zychennvt@gmail.com>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
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

The on-chip temperature sensor is controlled through a register of the
SYS block, which is already bound to this driver. Create an auxiliary
device so that a thermal driver can bind to it without a separate
devicetree node.

Failing to create the auxiliary device only affects temperature
reporting, so warn and continue.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 drivers/reset/Kconfig        |  1 +
 drivers/reset/reset-ma35d1.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..cf42fd6f7a3c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -220,6 +220,7 @@ config RESET_NUVOTON_MA35D1
 	bool "Nuvoton MA35D1 Reset Driver"
 	depends on ARCH_MA35 || COMPILE_TEST
 	default ARCH_MA35
+	select AUXILIARY_BUS
 	help
 	  This enables the reset controller driver for Nuvoton MA35D1 SoC.
 
diff --git a/drivers/reset/reset-ma35d1.c b/drivers/reset/reset-ma35d1.c
index d2962c0c80be..8c82175d7466 100644
--- a/drivers/reset/reset-ma35d1.c
+++ b/drivers/reset/reset-ma35d1.c
@@ -4,6 +4,7 @@
  * Author: Chi-Fang Li <cfli0@nuvoton.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
@@ -218,7 +219,15 @@ static int ma35d1_reset_probe(struct platform_device *pdev)
 	if (err)
 		dev_warn(&pdev->dev, "failed to register restart handler\n");
 
-	return devm_reset_controller_register(dev, &reset_data->rcdev);
+	err = devm_reset_controller_register(dev, &reset_data->rcdev);
+	if (err)
+		return err;
+
+	/* The temperature sensor is also controlled through the SYS block */
+	if (!devm_auxiliary_device_create(dev, "thermal", NULL))
+		dev_warn(dev, "failed to create thermal auxiliary device\n");
+
+	return 0;
 }
 
 static struct platform_driver ma35d1_reset_driver = {
-- 
2.34.1

