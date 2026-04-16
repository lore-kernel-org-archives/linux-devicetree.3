Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5FC39A04D
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331473; cv=none; b=YH067+qNV0neBMuslLawa6+6N88cunH19v1xKqk1O21xHg5VsdcI3hA/DaKUnR4rgGbP15WSBgRLh3NcyHZMdsKuHhquRhLh0wn/EYnN8pWoCArJIVC0HxAsbeKpZqW7MM2tDdIgsilWa2Y+fBQVqJbOlJQCY+KF9X0Cy9w2/BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331473; c=relaxed/simple;
	bh=lpsJVVMGaMMep3FQ1HqvPEWk+behLL9g9H4dE1HgfXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9/1UP+CFW7sugErzj4hyPJz9fIagCPznj/gvrVQ2SyuWcv4ZfAHwUZWyryB7CC1d0kFBSBDrDbPHe4uuqRNBJ6EuFeAKbgteEbAXqflAlQ76fBjAHu/KALyVYw/Xjaxe46sXfBOFM+y6YyfLmSkWkiopZut1hT1hfAb/uRXRKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=ad9Ktzz4; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="ad9Ktzz4"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-127148c2112so1155336c88.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776331471; x=1776936271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe0z97i7tkU8cjlRSgeT8EiRHH70cUTTYMxbnlOsLf8=;
        b=ad9Ktzz4QtydbqD00ELZka2jl4336M4sFJ2UWZcLr3g/yK2wwR9m0wcngU3N1SJbdl
         duyrXRRtjKZ9rkhUEK4diAmxOMvhE7N+3Cl3rRzTs3JFM7drvVo4QM+NHk7b3skKdt5T
         xkClmyJYkKf3LvUgRDOIvRKgyTMgQQZogJbAzGu28cyFGm6p9XwWgBzzST7Erc+BKPEb
         o8DUpToXCxH7/KCcs2HjfZS4Res9kmjMU6gOQ8/vLILhAh3tJb9EuuMYfGwXwQ5V1Vss
         zVFddqnxwTbBD/ZRg72UjJbIjWNMHp/RZNx+ZdI4JMY1fQSxwTrvC/ZzVEV6z4LSUMOC
         c7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331471; x=1776936271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qe0z97i7tkU8cjlRSgeT8EiRHH70cUTTYMxbnlOsLf8=;
        b=Icdv7WVKDHkjGcP45ouifUcMOlGSOVuJuRobuRdDBqZcp5aa3yupcYUeEwoSi96Viu
         D61WuV1GV4ju9/ykrod6e10CarExhzrvCenboYzOIRYBqekATKQTefIDQE5rhRyaidUM
         KXm5boq+J1eDQVVhZkmLO1xwWKVYtUtPjY83ysBYrRezYGPN4DOKsjkhCx7IDhlvZmal
         Zn2AarZsRnpuxrf4Slda+Q1DibeOzBE0h4dNOCdgViuNE/+Ob0ogS6gGs90Eiyz9civD
         l/ghn6qaOJkLWA8SH+9O5hzbkwBksnVdqFbAvBrOzD8Tn4EpFuGGdVl7dcwvZkqPz6Kq
         aDPg==
X-Forwarded-Encrypted: i=1; AFNElJ+FSXjBzz8rxuo8qomM+SP8Vu69I9cIcBX3TJ1VW3KAcwyMsHJkxZVI80P3EjSsUkT5VcQ9RdM7FRXd@vger.kernel.org
X-Gm-Message-State: AOJu0YzlHjfWq8gIOQhkpHJq0iqOSmAwR+YyHefVJ6haPf4FceP3p7Ph
	5X6ud4HhqOcWxwsZa9kKCsZzrCWZk+OFkU5K/QmazrWS6YATmEaXdQqWJJgxE4aUdg==
X-Gm-Gg: AeBDieu5HNFTY9AVpaQI/r7urU4UNcnFP+1r0oJmxV2YoVXSRAMSBWAjprRsGWHu3rW
	2cuobfqkK9sKW5HNdEwcdrvBxm4dcSVwvmBsNYslWV/NY0kc0CH5LaC+Rz+8mQug3pOX/Q8ifMS
	ueGGJBEtS/dTLviB8QRJZIuUJzBavQ0xkFxgwNkrdhzsQGbePw0KpwX/VACnGHlrnGwxF28H1Yz
	wvh/NAnRzMTh5zHVuuwW6qMQF5TjRDNIZfoIfr358KMoyhPOc1Up7M0kBiVow+UZSSWYVA/fk0G
	KTZocrOH1iOXtK/mL+32TS83rX64xWb4udPawV7lN6dXcrtXkisxn5NhAEIpZEwISoh7Hvr71Zh
	UkGuNxPwMypOXJlffpVuQgEIb/nyAsCJU3kHE/GehYiVDapqBDBgPS8BW4u45zCxATx6CEwoJ+r
	iLVsqf1JcOpkeoocENwh+6cImnIF/mb+JQ1Q7zSmIQsauxmVrEzGT509fHzR0=
X-Received: by 2002:a05:7300:f190:b0:2d5:eb89:4563 with SMTP id 5a478bee46e88-2e17d815c94mr377087eec.2.1776331470959;
        Thu, 16 Apr 2026 02:24:30 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f965c5fsm6423815eec.26.2026.04.16.02.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:24:30 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v1 2/2] rtc: bq32000: add configurable delay between RTC reads
Date: Thu, 16 Apr 2026 02:24:14 -0700
Message-ID: <20260416092414.3210383-3-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416092414.3210383-1-adriana@arista.com>
References: <20260416092414.3210383-1-adriana@arista.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the RTC is used on systems without a interrupt line, userspace
tools like `hwclock` fall back to a frequent polling loop to synchronize
with the edge of the next second.

On the BQ32000, this aggressive polling can temporarly lock the register
refresh cycle, because the continuous transfers prevent the hardware from
updating the buffer. This results in stale data reads or select() timeouts
in userspace.

This patch introduces a configurable settle delay via `ti,read-settle-us`
property. If this property is specified, the driver uses a delay before
reading the RTC registers. This provides a sufficient idle time for the
hardware to sync with the register buffer.

Signed-off-by: Adriana Stancu <adriana@arista.com>
---
 drivers/rtc/rtc-bq32k.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 7ad34539be4d..0cbfa0909732 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -16,6 +16,7 @@
 #include <linux/kstrtox.h>
 #include <linux/errno.h>
 #include <linux/bcd.h>
+#include <linux/delay.h>
 
 #define BQ32K_SECONDS		0x00	/* Seconds register address */
 #define BQ32K_SECONDS_MASK	0x7F	/* Mask over seconds value */
@@ -48,6 +49,11 @@ struct bq32k_regs {
 	uint8_t		years;
 };
 
+struct bq32k_data {
+	struct rtc_device *rtc;
+	u32 read_delay_us;
+};
+
 static struct i2c_driver bq32k_driver;
 
 static int bq32k_read(struct device *dev, void *data, uint8_t off, uint8_t len)
@@ -89,9 +95,17 @@ static int bq32k_write(struct device *dev, void *data, uint8_t off, uint8_t len)
 
 static int bq32k_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
+	struct bq32k_data *bq32k = dev_get_drvdata(dev);
 	struct bq32k_regs regs;
 	int error;
 
+	/*
+	 * When the device doesn't have the interrupt connected, prevent
+	 * userpace from polling the RTC registers to frequently.
+	 */
+	if (bq32k && bq32k->read_delay_us)
+		usleep_range(bq32k->read_delay_us, bq32k->read_delay_us + 50);
+
 	error = bq32k_read(dev, &regs, 0, sizeof(regs));
 	if (error)
 		return error;
@@ -253,13 +267,18 @@ static void bq32k_sysfs_unregister(struct device *dev)
 static int bq32k_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct rtc_device *rtc;
+	struct bq32k_data *bq32k;
 	uint8_t reg;
 	int error;
+	uint32_t settle_us = 0;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
+	bq32k = devm_kzalloc(dev, sizeof(*bq32k), GFP_KERNEL);
+	if (!bq32k)
+		return -ENOMEM;
+
 	/* Check Oscillator Stop flag */
 	error = bq32k_read(dev, &reg, BQ32K_SECONDS, 1);
 	if (!error && (reg & BQ32K_STOP)) {
@@ -280,10 +299,13 @@ static int bq32k_probe(struct i2c_client *client)
 	if (client->dev.of_node)
 		trickle_charger_of_init(dev, client->dev.of_node);
 
-	rtc = devm_rtc_device_register(&client->dev, bq32k_driver.driver.name,
-						&bq32k_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
+	bq32k->rtc = devm_rtc_device_register(&client->dev, bq32k_driver.driver.name,
+					      &bq32k_rtc_ops, THIS_MODULE);
+	if (IS_ERR(bq32k->rtc))
+		return PTR_ERR(bq32k->rtc);
+
+	device_property_read_u32(dev, "ti,read-settle-us", &settle_us);
+	bq32k->read_delay_us = settle_us;
 
 	error = bq32k_sysfs_register(&client->dev);
 	if (error) {
@@ -293,7 +315,7 @@ static int bq32k_probe(struct i2c_client *client)
 	}
 
 
-	i2c_set_clientdata(client, rtc);
+	i2c_set_clientdata(client, bq32k);
 
 	return 0;
 }
-- 
2.51.0

