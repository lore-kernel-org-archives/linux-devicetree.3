Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C839D6F5
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333437; cv=none; b=GRyNTn/oK47D3vYDMBp7jNvHJjGtJq9byYvjYCN1e5xiQdMSleZPRFHGWDbxvhxLDthfV2mfbQ+Tjme98AExn55144tEWJ5/bpHvUIQq7iGIyO3XRUMAhG9S+l8PFz3jLKGypRKmAptG7oX4c//evQ2Kt/UbJ1biFyqLQjhXtj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333437; c=relaxed/simple;
	bh=lIJnDyanoQRdooXW+rb4vRnTiHA4NZZ2a5UsiOLgCzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXM965C5shWPaMwopDCZf6MbXmAGhjhkq962gtO7btqCP4i6GM8vL9AJYCmSR+TgYLq+d4pSEms4Qzf/LBjt20OVSXb1OTZ3WhK50dcz+Nz/Ys92LsMl/LVOCY32YTqhO4QL3AeIY5eVANpDBZ8G/bJ90W6e8mi7gHQlpEPWqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=A7xhCwCP; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="A7xhCwCP"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bd801b4078so649406eec.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 02:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776333435; x=1776938235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/1T705jUCHUuc7zYF9p5WCGH43XsT88FDPreDZ7P4Y=;
        b=A7xhCwCPhwfdNhXwpyVgqBtP5J7dey86XN3zXBRoSA1zyAn8nrZxohuS1t3a6F4Jye
         yKzbL7P/odW4m+A6E3OvRcOVfmx+JCgSUhHJtUDlFijLhfjF9GzR+Yy5lU76cAIzmcoh
         f0meYorTbcBqjlKGRjjWwo2anNpES6Dcy6LeVDLp7D9ljeW8yGVhhayCvzY+2M7IxEMD
         FZhRFV8WbS5lMyrAtPzl7CunAhIwnxHxPLRDMOHUJNPP6sAxhWwePLeTn6ArcWYBDtpw
         SWeiPuVan5eO1uTbp8RhROUouxAsW+aZCzg9vm6CiWrdBTLAXBQ4yna6okVS2a8gDa9w
         AClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333435; x=1776938235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H/1T705jUCHUuc7zYF9p5WCGH43XsT88FDPreDZ7P4Y=;
        b=LOADT/odPHhKZzCPDxceCAfRzfvSziwuhU+iBUvUTuqCJ2intsYsuw+IpY9JLVEqmW
         Z2GGxKEaR2yYPZJyWPyTPXHcreLHO4da46Xvi5d3EQMWYngWEcbedr0dCmTXmWAUOFG4
         lUlW3A/ardwq3kxf+9o+r14pgDtFrXAE8EgpVoW4Z26998922Fw0MqR/gQadApqVyGba
         Js+ATki3x4BQTtZMtodRySv+8vCrVK+w82qK6BOTZ7Z19kFPobXMxZG/wLh6WKizvCpw
         rTZGHFz2VWGEkKLzZYITyOh0xvOhse3ztvRgdCpmqkQwPy7rdRhRpJAI3Uo5IxHNR5qg
         TfHg==
X-Forwarded-Encrypted: i=1; AFNElJ+/J/Iw8PeVrelnGG8EtidxhN0ZT+i4EWf1M4LCyj/oN1D+CmEuKGJDcjWIWOLnAPYRwozZoUsYq/0P@vger.kernel.org
X-Gm-Message-State: AOJu0YzZegGOls5ccQiMb8h8W0XiRUFFlA5RUoXpp1kTrEf3IH7/Nif/
	Got4bwKhgTirc31h3BfPPMZrHM+98blil94rV81qCbUFtz3BBXxcIeax9rJlZRFgPw==
X-Gm-Gg: AeBDievprsCwEc0qMhWhf3p1IQMj0VAv9svIOQuhJRWCbPjSkvR0NTYtBjorIWGo5hR
	2M3/NS+NoAPAeOVSD/S482aYYel3iDi3e2OU1W9vBXGu5MQjkI/USu0i8PacJPOUWkCLY+47RXt
	hIjcsuQTl6Vr6h275tDbt4KlmC4Jsa8MLSahiB63HGWqhF8EU96vYLoKajpG/TelYmteKQZ3Q+i
	+yAKHxBS0lpvBMOqUoI2S0zDa7DJWdJlL0O3NSuqTPLq+QiPD5fHYpdKS4H/oLu8pefe0Q0GfWl
	B5Qtgmyorla6g4uaa9nFRXs8YoZuCMWdKMrJjD4tGuvYy8kNJEj/Bi++aVHHXvdlJtt/5pAGlpU
	qCr5KEI4RS9VeG/2X3S2tstHzv8qE7hwMCV1xzA9zlcExTJfKU+FmtLIOKIOe0vEdeJgvS0cJ6n
	qhqMARqvNCO+i6mOF//QGP3XTu2OsGnE1WxVuLgmGXGxpux8qZtuZSJWqjWKM=
X-Received: by 2002:a05:7022:6888:b0:119:e56b:c3f1 with SMTP id a92af1059eb24-12c658ed58cmr333493c88.1.1776333434608;
        Thu, 16 Apr 2026 02:57:14 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5f3f3d93sm4532913c88.15.2026.04.16.02.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:57:14 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v2 2/2] rtc: bq32000: add configurable delay between RTC reads
Date: Thu, 16 Apr 2026 02:57:06 -0700
Message-ID: <20260416095706.3212158-3-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416095706.3212158-1-adriana@arista.com>
References: <20260416092414.3210383-1-adriana@arista.com>
 <20260416095706.3212158-1-adriana@arista.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the RTC is used on systems without a interrupt line, userspace tools
like "hwclock" fall back to a frequent polling loop to synchronize with
the edge of the next second.

On the BQ32000, this aggressive polling can temporarly lock the register
refresh cycle, because the continuous transfers prevent the hardware from
updating the buffer. This results in stale data reads or select() timeouts
in userspace.

This patch introduces a configurable settle delay via "ti,read-settle-us"
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

