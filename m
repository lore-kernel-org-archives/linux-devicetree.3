Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C45530D40B
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123080; cv=none; b=PgzJO1CIq2czBqjcc8vFp3aaQFTcNuOhNtM7Hp9cN22LaG9/cMXCn2FNx5897Tg7Q7ClT8XJVnRum71VZVHl1fiiS7WEl99Bo1OXpqXp/pUyuDbBZmMSMnEF+8kG/AdPkfluZHaykrjEnFhzNX0DcYLtoTABAkK/YWvVDuxjYQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123080; c=relaxed/simple;
	bh=wyWjpprd5g3d9n7k2TFvz9Qt8l08nSyECnW1RiH61sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fcQ9CH88cIJo+qDoaPuBnnejidY76sswx/MfUjg7TxgJh17hQaRzzECxXkC5XY7Wcmya6PSfl18ZKMSlIOLUIkcgunf4/vQYHKcJiS2mmt3xlDkYIBAj6mVhF+Fn65vW9LsQbEfPUf3m6udYrx9gjmDQvjaFMj3ysfoFZD+dpjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mg92+ZZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWRwRmjp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mg92+ZZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWRwRmjp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBck1s3479522
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DS0vaonFkcPNV4lGWbOm/M4DDebiFABteqSav+Mh9/U=; b=mg92+ZZPHlTk58so
	26FAq2z0+8WVU9ukBpydNg7NvB0ICQImfHJeWrpNQvGrW3/oYXja0CDP4IauuVFO
	bUcagidxD0ctd3nKB0fcYveyXgt8sJagSuGYIwU1t3Cd2IF1k+t8iHnAai3XlBfe
	tyhEOfwMR7fCW7jLm7YLA2xkbyIr0+/Anb2Z08cxhJiwLljWaZmh5aH/WdR+8+54
	omI4WRoOC5paZgoLInNKq8Wz6ggMPN8GrUd/CCODDhoJOrXxow40j67KTPRkpZK9
	Uz4d++P6fOb0gwDd2UcVmRPLf18KH4ODIv0HeWDpxwc22NEerG++2eLF5UuIZhwg
	B5Y5lw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g3vwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07f25de2so27116651cf.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123076; x=1784727876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS0vaonFkcPNV4lGWbOm/M4DDebiFABteqSav+Mh9/U=;
        b=bWRwRmjp/n0tdWAEzLfI94A9qk+2xIwlGnhgKEZ/PmdexCskryJQBoutiG7ErzvFhX
         htI99iJKokPoC08cik83L3p5v1ea2jXduxlhRNDhjAiBEon6pSTb14pBw5ax8fo0w/8H
         JM3TWXNncBlfdV3I5GVF+K4GS6haVlkAxnsxH8qpDnqO2hi1oiVow5Oy/pva/76KxiTi
         d1fWnLc3AUCZTkubdCnokOeUga2nKJ3bMhR+uEvg6ZmE/bFlRjGDqozrVJWZBLwYXoxL
         yJ7QYDP2in0RKlMArhioONWMh5EHPTynT/apgmRJ8nVcfaRQFcW0YEUs69eOSOqlSXrv
         qxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123076; x=1784727876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DS0vaonFkcPNV4lGWbOm/M4DDebiFABteqSav+Mh9/U=;
        b=PbizXucpTobxh2cYSbZqKUWwrDp4MW95RfySPuD6SbSBl0UP+1e6/cLQvzPO2MkGyI
         82NQ7uSTTNh139ZK9qUETNlyvA3GT+Jhp2YExxe8l+emA7kOChGjEUhgDyXYJPRM/LhA
         Xrplue5Hw/6Q6OkciP8FCxsDFOC60/Ho6Q6KNcobRAiXczfMCjO8xmcJXXhd/v/V5JcL
         A2DszM7Gck9tz+1LSZltHwOu12yQg4VRSEb+LUh08LImEhGyZblxgJGmEL4583OkQ6mj
         3ru+Y8TaFwdRx7DOXXtXFjYXPsUJ6W3cDJYGCd/xQhvyc7OO/5lyFX/z8RaPugJb7pNq
         KruQ==
X-Forwarded-Encrypted: i=1; AHgh+RpscVUd2g3MD+We9WshdfyMYMewezLkX4z6U74MGmjPJ8yVx2XtqW1oHaKvd8Ocv/+i10CCNrHAKvyQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxcbGfuyjQ+ekNttN7NzP7kXZfW7EgqhL2MWFid7aHzi03xDPlP
	f3iEbnbLTrim9MsEiVu380hs4BprWgHHqzRdz2k+9Kr7wliJ4gkrgvULtNbNzarVlLTwJMpvCFi
	bJ6KhXTPEHw7IFeiu8g6x2hStG96utJMNUhgix+CyVHqS4V0XYS+M2skW2xvsrJ1X
X-Gm-Gg: AfdE7ck3h+GooH7Fqaq+wqPPbEbyr1g7eVb89VkUNwp6PlN/5ppLuhdmbH1ASAt6iKz
	Ga8/305o1KbzNU48vFoTGQ26i7Jih04Fxsm4tC9TqBxbhIKZhA9mhYIG1P455zAh3BIeLDTkUdI
	22mhoVbwMhMIh7Lmk30Xe049kNxfn+iEdL4kOACzzmCCH9lqw2XnKxU5W81POsn8UtrMysv9dQn
	KJz/Jlnx82xperOspB/HXpwQfsYTkeZmjWMhqR9ubH1ixKljSK+6OzDUC1b4xs6ZYQZZOd+Rbjr
	xmas4vSx8c3+1HrXiP0B6j6bDQsmsHcuCAfs67j4Lx32IzImDF/I6iV/E3w89Y9JL1PRxKADmRg
	oEIYBBsoHrGgAq1Sap9eDVIVac2jJ27FXRfVHVqSyG/nQQvmXyZQwqwI5NL1jc0h1yE0JBPW3da
	VvJYk8+z/wpvCddSxBTYCYvZy09OKRnROtMVD1kBX/FvxROQ4xRs+zclGoqJBtog==
X-Received: by 2002:a05:622a:1f8f:b0:51c:7b12:5ff4 with SMTP id d75a77b69052e-51cbf3e4430mr158062701cf.80.1784123075694;
        Wed, 15 Jul 2026 06:44:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8f:b0:51c:7b12:5ff4 with SMTP id d75a77b69052e-51cbf3e4430mr158062211cf.80.1784123075038;
        Wed, 15 Jul 2026 06:44:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:44:29 +0200
Subject: [PATCH v6 3/4] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-monza-leds-v6-3-d1724bb7fe3d@oss.qualcomm.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
In-Reply-To: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX5K2fmm/6NfiQ
 2smynFzQmzm0TsG3DZ5nhQzqXntr3QJqEGhbTmN6ZKOw6NfGRbXEuNpvoupA5HO/qNSzUx/3gVq
 QUzDcqwWzShZt+Fpudi/fQQtf6cwcZQ=
X-Proofpoint-ORIG-GUID: VxkKaDEu6Avu0wEW0TTx-14j3oj0PgWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX5TAs4wY5Zimh
 jAYgechzlcwKYr9gkglhUM+VI3IH9a81aPj4IoxWp2X7y7LVUGVHA4AK9iqw9v+IKQjpj655Hst
 hdYVPEV9iEooZfdSTu1Vrom+pe0PGZ33Nb0N2io2dw1WpOENKmYyhhcdb3Wmc2Plba0M5V0g4k2
 CVk7tAUPtntE0sX/wLSXNDbuFkOvYWEf44QqjBctJpSPU0g8Stcp6CpRUCzToBXfzPPTkw6xuav
 HLeSpcxrE6ofQwXU9AEJ83jbx/juVTO2HD6XqFkcfpQEdxLeI/4OeIO5hWg124aSa+mmoQhtRy0
 SeUZcNDVJzNl4UWkvDBeyUPKf6ZUav1YuVh3zlJXbxJeWIPd2DNSpa1IyffznZ9TnCXjmeLUg01
 KnW1jr2cVx0Zu2J4N5Zn3e/haFRBXGCvYh/luu1PBNDSsHHT5LjU8fN88ZcWA4B/pouYXLA9orI
 6jkmSXnnCOI0i6KMLYg==
X-Proofpoint-GUID: VxkKaDEu6Avu0wEW0TTx-14j3oj0PgWi
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a578ec4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_r7M38PZvEBKBeOnwNgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150136

Allow grouping of individual PCA963x PWM channels into a single
multicolor LED device by adding support for the LED multicolor class.

A child node with sub-children is treated as a multicolor group,
others are treated as single leds, keeping full backwards compatibility.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/leds/Kconfig        |   1 +
 drivers/leds/leds-pca963x.c | 162 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 128 insertions(+), 35 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5..14df88f92b12bbe43908b67f9480cf23056e27e2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -596,6 +596,7 @@ config LEDS_PCA963X
 	tristate "LED support for PCA963x I2C chip"
 	depends on LEDS_CLASS
 	depends on I2C
+	select LEDS_CLASS_MULTICOLOR
 	help
 	  This option enables support for LEDs connected to the PCA963x
 	  LED driver chip accessed via the I2C bus. Supported
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index e3a81c60ee27c96e5050a829523dfd43e1f0663f..f3e4d65e48b4c3eefa147a7fb5c9fe81ce569731 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -27,6 +27,7 @@
 #include <linux/string.h>
 #include <linux/ctype.h>
 #include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/property.h>
@@ -101,8 +102,11 @@ struct pca963x;
 struct pca963x_led {
 	struct pca963x *chip;
 	struct led_classdev led_cdev;
+	struct led_classdev_mc mc_cdev;
+	struct mc_subled subleds[4];
 	int led_num; /* 0 .. 15 potentially */
 	bool blinking;
+	bool is_mc;
 	u8 gdc;
 	u8 gfrq;
 };
@@ -199,20 +203,24 @@ static void pca963x_blink(struct pca963x_led *led)
 	led->blinking = true;
 }
 
-static int pca963x_power_state(struct pca963x_led *led)
+static void pca963x_track_power_state(struct pca963x_led *led, unsigned int led_num,
+				      enum led_brightness brightness)
 {
-	struct i2c_client *client = led->chip->client;
 	unsigned long *leds_on = &led->chip->leds_on;
-	unsigned long cached_leds = *leds_on;
 
-	if (led->led_cdev.brightness)
-		set_bit(led->led_num, leds_on);
+	if (brightness)
+		set_bit(led_num, leds_on);
 	else
-		clear_bit(led->led_num, leds_on);
+		clear_bit(led_num, leds_on);
+}
 
-	if (!(*leds_on) != !cached_leds)
+static int pca963x_sync_power_state(struct pca963x_led *led, unsigned long cached_leds)
+{
+	struct i2c_client *client = led->chip->client;
+
+	if (!led->chip->leds_on != !cached_leds)
 		return i2c_smbus_write_byte_data(client, PCA963X_MODE1,
-						 *leds_on ? 0 : BIT(4));
+						 led->chip->leds_on ? 0 : BIT(4));
 
 	return 0;
 }
@@ -221,22 +229,54 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness value)
 {
 	struct pca963x_led *led;
+	unsigned long cached_leds;
 	int ret;
 
 	led = container_of(led_cdev, struct pca963x_led, led_cdev);
 
 	mutex_lock(&led->chip->mutex);
 
+	cached_leds = led->chip->leds_on;
 	ret = pca963x_brightness(led, value);
 	if (ret < 0)
 		goto unlock;
-	ret = pca963x_power_state(led);
+
+	pca963x_track_power_state(led, led->led_num, value);
+	ret = pca963x_sync_power_state(led, cached_leds);
 
 unlock:
 	mutex_unlock(&led->chip->mutex);
 	return ret;
 }
 
+static int pca963x_led_mc_set(struct led_classdev *led_cdev,
+			      enum led_brightness value)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
+	struct pca963x_led *led = container_of(mc_cdev, struct pca963x_led, mc_cdev);
+	unsigned long cached_leds;
+	int ret = 0, sync_ret;
+
+	led_mc_calc_color_components(mc_cdev, value);
+
+	guard(mutex)(&led->chip->mutex);
+
+	cached_leds = led->chip->leds_on;
+	for (unsigned int i = 0; i < mc_cdev->num_colors; i++) {
+		led->led_num = mc_cdev->subled_info[i].channel;
+		ret = pca963x_brightness(led, mc_cdev->subled_info[i].brightness);
+		if (ret)
+			break;
+
+		pca963x_track_power_state(led, mc_cdev->subled_info[i].channel,
+					  mc_cdev->subled_info[i].brightness);
+	}
+
+	sync_ret = pca963x_sync_power_state(led, cached_leds);
+
+	return ret ? : sync_ret;
+}
+
 static unsigned int pca963x_period_scale(struct pca963x_led *led,
 					 unsigned int val)
 {
@@ -300,6 +340,77 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+static int pca963x_parse_mc_subleds(struct device *dev, struct pca963x_led *led,
+				    struct fwnode_handle *fwnode,
+				    const struct pca963x_chipdef *chipdef)
+{
+	unsigned int num_colors = 0;
+	int ret;
+
+	fwnode_for_each_child_node_scoped(fwnode, sub) {
+		u32 color, subreg;
+
+		if (num_colors >= ARRAY_SIZE(led->subleds))
+			return dev_err_probe(dev, -EINVAL, "Too many LEDs for node %pfw\n", fwnode);
+
+		ret = fwnode_property_read_u32(sub, "reg", &subreg);
+		if (ret || subreg >= chipdef->n_leds)
+			return dev_err_probe(dev, -EINVAL, "Invalid 'reg' for sub-LED %pfw\n", sub);
+
+		ret = fwnode_property_read_u32(sub, "color", &color);
+		if (ret)
+			return dev_err_probe(dev, ret, "Missing 'color' for sub-LED %pfw\n", sub);
+
+		led->subleds[num_colors].channel = subreg;
+		led->subleds[num_colors].color_index = color;
+		led->subleds[num_colors].intensity = LED_FULL;
+		num_colors++;
+	}
+
+	led->mc_cdev.subled_info = led->subleds;
+	led->mc_cdev.num_colors = num_colors;
+	led->mc_cdev.led_cdev.max_brightness = LED_FULL;
+	led->mc_cdev.led_cdev.brightness_set_blocking = pca963x_led_mc_set;
+
+	return 0;
+}
+
+static int pca963x_register_led(struct device *dev, struct pca963x_led *led,
+				u32 reg, struct fwnode_handle *fwnode,
+				const struct pca963x_chipdef *chipdef,
+				bool hw_blink)
+{
+	struct i2c_client *client = led->chip->client;
+	struct led_init_data init_data = {};
+	char label[32];
+	int ret;
+
+	led->led_num = reg;
+	led->is_mc = fwnode_get_child_node_count(fwnode) > 0;
+
+	if (led->is_mc) {
+		ret = pca963x_parse_mc_subleds(dev, led, fwnode, chipdef);
+		if (ret)
+			return ret;
+	} else {
+		led->led_cdev.brightness_set_blocking = pca963x_led_set;
+		if (hw_blink)
+			led->led_cdev.blink_set = pca963x_blink_set;
+	}
+
+	init_data.fwnode = fwnode;
+	/* for backwards compatibility */
+	init_data.devicename = "pca963x";
+	snprintf(label, sizeof(label), "%d:%.2x:%u", client->adapter->nr, client->addr, reg);
+	init_data.default_label = label;
+
+	if (led->is_mc)
+		return devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev,
+								 &init_data);
+
+	return devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
+}
+
 static int pca963x_register_leds(struct i2c_client *client,
 				 struct pca963x *chip)
 {
@@ -338,37 +449,18 @@ static int pca963x_register_leds(struct i2c_client *client,
 		return ret;
 
 	device_for_each_child_node_scoped(dev, child) {
-		struct led_init_data init_data = {};
-		char default_label[32];
-
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg >= chipdef->n_leds) {
-			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
-				child);
-			return -EINVAL;
-		}
+		if (ret || reg >= chipdef->n_leds)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid 'reg' property for node %pfw\n", child);
 
-		led->led_num = reg;
 		led->chip = chip;
-		led->led_cdev.brightness_set_blocking = pca963x_led_set;
-		if (hw_blink)
-			led->led_cdev.blink_set = pca963x_blink_set;
 		led->blinking = false;
 
-		init_data.fwnode = child;
-		/* for backwards compatibility */
-		init_data.devicename = "pca963x";
-		snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
-			 client->adapter->nr, client->addr, reg);
-		init_data.default_label = default_label;
-
-		ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
-						     &init_data);
-		if (ret) {
-			dev_err(dev, "Failed to register LED for node %pfw\n",
-				child);
-			return ret;
-		}
+		ret = pca963x_register_led(dev, led, reg, child, chipdef, hw_blink);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to register LED for node %pfw\n",
+					     child);
 
 		++led;
 	}

-- 
2.34.1

