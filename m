Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9297D42F70A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353008; cv=none; b=JQ1191YNoP46hhIq/UTpSSQpka9H3w3PPnDnTPKzbMiFzQTdafcTpEooJys/qM3povLDtDEC8GtlUEeCrbaqhpqgj5kc6Q/PqtGAPo/zrzjQNp9oy7OmX45PYVJ9USmAVq0GJ/6t/4O0ckn0m/zFcv45MnKTdagQE8NLW90R7s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353008; c=relaxed/simple;
	bh=1y47odj+NOJ9z0mS6+ykXCLNXopAlKlTgU+V3x/sXtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7ZrMakxHAckePTpEk0SY65+rMV6zP20bDMPbYpxz6XqQeaRWoA4HLjBDHwRiS5VUZF1gAjFOtsGkqcGWYpzpXHXrs0M/gVXyAiOqLrzv4X0KX9m1mWPA0JJznIZGmFn5oEvXHcV29aUtlZd+Jp9Bi1XlSj5IcmCc6j6D1WzRkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFZhQbsu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGxOQJFP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFZhQbsu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGxOQJFP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF42R956793
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=; b=FFZhQbsuT90NWJ84
	fMUDqAk5PmR6BZHtQANiwloTsZ5ZRtkzolWsvWfW+KTWXn0L3aqqZfmd0K7rY20X
	8iP1coEdLQ0JGx255WffNBUyl5WUf8Ki40bDcHsqus/M2eCRBq37D6sZvmZpzFUy
	/WZCEqVO7VWAUExHdHwZ2l6Cz+sxit6++4q5RxwX//HdOEZ+/tGknHtyI/BAIvYD
	y2lqc+6pu9E9Zz0JV4RMtMgvQoW7eURLZ89QuwwxXRnNLp8auJRldOWHjYaO4e34
	8Ss8DdFk7a38Pe1Hn5rQOqCVdcqMlbLnYTM1jYYf7cczxjWFgFgP28u/fh1oRsEI
	WKZcCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891usw9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:50:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so285029985a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353005; x=1783957805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=cGxOQJFPd8CuwWbLsrw/EJCtyD+VRPQ58UCJG8v9vf/LhAhcsoHS9qE2AMkYlOYOF5
         3uLYyIe/P35FYJKqyckxUJjKVWwxF9Gtqxk7LM8XzX3zDgXCfs6gZ2v46Np+IhfXVQjJ
         j0Rv7Qe0XAJgSfz86MxsmnjdSQ6/xH7zVGRXGFsSLjnXpqv3pMUzkyiJ95hkNszRXPmd
         iqHRxNAQPrAZImd6TwX087PtakgLaR7m57sEnqWn1fHlf9SyIA5PVsmatY9Z9w3EJuo5
         zpBDAbzQkI0wmekPvpv2c4v8frnMUGxPGnLjBgfbo496QQQexWRG2+ch+gQQodBITmeN
         GqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353005; x=1783957805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=kepLLSxgSIHbhoxxk46J2ohNX2FS7lslAcE6tDX2Gl0KIqI87DQSZ1Q0X87gqGpcXV
         kJw7jtTYkP0h6AIyU9ZXQnjAPsWMuLONX+26N72N5C4d779ACJQmHTeU9MV5TGxIWEyg
         vW3XxKhcrEO95awnAGxoqklurQbMZB/hBNdp3pqBzlhENQN05Alh4irL5mhgTmExs1tU
         DecBnwLEuIkb9ad40kEHY9pivSHw6S1f26tKewgELUpIcVrqilDmVLs6xZcKARsHFNSU
         1b9p/UaBMeBTx1nXISVnqR2gWQHIntvczzUoWq8U5Mt8F3vmqt784mL6fPuaic2FRUqv
         6CqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp462n0o9bedWRl3Ji7nlWmwRSFUYgL50rPG9yHt7D49WmNFCJ5e5IasYYLfIotDkgww9oucAmHPhSo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8uG7pWBgSZGVEy403y4BJacvwVC/EJ/YxHl/9a29oqlnU1f2J
	XtF7iVwX27RrQConybvOTl6lQYVknVft5VwaMvR3teKgl3M7kmU2T19S2LypVKfE9QXuhGQFOR5
	Qe4xjCaHtD0EVpTkzVlED6zZGP3P24dnpA/XRU/4Su7VKZ6SiW6y2ikc21kPQXquS
X-Gm-Gg: AfdE7cmkA7O9ebBpYXnEkGXABAIkNMj379Jda/joTwu0YO94DLmx0tL/aDVVv5G7r2K
	bvmKm+f24UK1axOb7DsDyLYmnWvIAFMqigxlxOPTpTEIn010e8A0DNnL+Sa5AoHKl8Iu+uj6EgB
	GXPsa4PNBWic3VprIngigtclgtYLeaDMm7PrlMmAeTehVV+ztF/1IpkguIXDlSM1ZMHDrCAO1rn
	utvzwQ6EtjJty/0aX2+gD7QS4+T5vQh8zfpW336PF5yM/yMYGoA0zmRZT8697xC4ijnXbQMeAcy
	kmxPEHllONEsf01C6svIefLLotVKS2rcGSne3wN+2GFNd46SLe7BMvOYepRu/p+V90DWtUGlWu3
	tMNLnO1QfV94+OuosHYpW2lHb8VajlNNAOIQut49tqrsby4mnA+t/J3RF6POIwnAKWqJ+nP4Dzq
	crAda1pqHfXpg18xjUXEhVXToXpWac+YhZRSpgxcvmN90sKywCPnym9aiQfCnPzwc=
X-Received: by 2002:a05:620a:3188:b0:920:6061:816d with SMTP id af79cd13be357-92ebb3a6413mr156206985a.0.1783353004489;
        Mon, 06 Jul 2026 08:50:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3188:b0:920:6061:816d with SMTP id af79cd13be357-92ebb3a6413mr156201385a.0.1783353003903;
        Mon, 06 Jul 2026 08:50:03 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm801997066b.37.2026.07.06.08.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:50:03 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:49:57 +0200
Subject: [PATCH v3 3/4] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-monza-leds-v3-3-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
In-Reply-To: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
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
X-Proofpoint-GUID: BFhTFiIH9mUVwd1h6KCQraTT-aipqyUf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX+hfq0J72VF34
 S/HK7i8K75Kr/dJYe4LqVbnvywomzmCPqU+NHeGKqTvJ+HKV04tqdV7/ETvEFgfC5qmIsrhEyzU
 QyosaHHTb+gFbqxFmcNNPd3wP6PqQlw=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bcead cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TXsEHxuGAXnH8Ii1pS8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfXxKNKi36u87Qn
 cYlPx1OeReNtPmMrpYPzfs9fmap/Gbv8RvE8Q5wxO67gt7VbWE3212Q3DKiiDQJTDC+i/mlzKGT
 345XVOYi12Tm1C6yLhCiy0xG658c5hFjXcfccQXHB+O3iH2gRP9nHNAO1D7ZFF4qkv4yJQ1hPpF
 h44uBUhFK2T3NGQMwyOIJOpEIciCwmPiEislY9F0pMWA+3OnAQxYz2lG/K4Q0+tOmWRrvnhCQlr
 oIWlBPee1cQHFPWf6A4u/n6h0UUEOkJ6opLNc44IBPGFgeHA1s7DeFaw5z0MurHeHYC1az8UPKF
 O8OBi2kAhFrVj4EabebxMVQVGKRX2WlxbbC/9JAETBGNXvbAMql25iSa4yN6jq6BVQ3t2vvSsC/
 f+q0F7QDv8liuB1pXKxoPr5YXf+Njv4l9ZQ5+3FWu4ib/fAhq9dLDjDETZ8I1jeC58gKuDJkHVt
 oUKtgT+qHpBjqdaeAhQ==
X-Proofpoint-ORIG-GUID: BFhTFiIH9mUVwd1h6KCQraTT-aipqyUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060161

Allow grouping of individual PCA963x PWM channels into a single
multicolor LED device by adding support for the LED multicolor class.

A child node with sub-children is treated as a multicolor group,
others are treated as single leds, keeping full backwards compatibility.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/leds/Kconfig        |   1 +
 drivers/leds/leds-pca963x.c | 126 ++++++++++++++++++++++++++++++++++++++------
 2 files changed, 110 insertions(+), 17 deletions(-)

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
index e3a81c60ee27c96e5050a829523dfd43e1f0663f..f6f6bafcc2bd5bad51a3184c4cb08fc50693a0a5 100644
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
@@ -205,7 +209,7 @@ static int pca963x_power_state(struct pca963x_led *led)
 	unsigned long *leds_on = &led->chip->leds_on;
 	unsigned long cached_leds = *leds_on;
 
-	if (led->led_cdev.brightness)
+	if (led->is_mc ? led->mc_cdev.led_cdev.brightness : led->led_cdev.brightness)
 		set_bit(led->led_num, leds_on);
 	else
 		clear_bit(led->led_num, leds_on);
@@ -237,6 +241,28 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
 	return ret;
 }
 
+static int pca963x_led_mc_set(struct led_classdev *led_cdev,
+			      enum led_brightness value)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
+	struct pca963x_led *led = container_of(mc_cdev, struct pca963x_led, mc_cdev);
+	unsigned int i;
+	int ret;
+
+	led_mc_calc_color_components(mc_cdev, value);
+
+	guard(mutex)(&led->chip->mutex);
+
+	for (i = 0; i < mc_cdev->num_colors; i++) {
+		led->led_num = mc_cdev->subled_info[i].channel;
+		ret = pca963x_brightness(led, mc_cdev->subled_info[i].brightness);
+		if (ret < 0)
+			return ret;
+	}
+
+	return pca963x_power_state(led);
+}
+
 static unsigned int pca963x_period_scale(struct pca963x_led *led,
 					 unsigned int val)
 {
@@ -300,6 +326,84 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+static int pca963x_register_single_led(struct device *dev,
+					struct pca963x_led *led, u32 reg,
+					struct fwnode_handle *fwnode,
+					bool hw_blink)
+{
+	struct led_init_data init_data = {};
+	char default_label[32];
+	struct i2c_client *client = led->chip->client;
+
+	led->led_num = reg;
+	led->is_mc = false;
+	led->led_cdev.brightness_set_blocking = pca963x_led_set;
+	if (hw_blink)
+		led->led_cdev.blink_set = pca963x_blink_set;
+
+	init_data.fwnode = fwnode;
+	init_data.devicename = "pca963x";
+	snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
+		 client->adapter->nr, client->addr, reg);
+	init_data.default_label = default_label;
+
+	return devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
+}
+
+static int pca963x_register_mc_led(struct device *dev,
+				   struct pca963x_led *led, u32 reg,
+				   struct fwnode_handle *fwnode,
+				   const struct pca963x_chipdef *chipdef)
+{
+	struct mc_subled *subleds = led->subleds;
+	unsigned int num_colors = 0;
+	struct led_init_data init_data = {};
+	char default_label[32];
+	struct i2c_client *client = led->chip->client;
+	int ret;
+
+	fwnode_for_each_child_node_scoped(fwnode, sub) {
+		u32 color, subreg;
+
+		if (num_colors >= ARRAY_SIZE(led->subleds)) {
+			dev_err(dev, "Too many sub-LEDs for node %pfw\n", fwnode);
+			return -EINVAL;
+		}
+
+		ret = fwnode_property_read_u32(sub, "reg", &subreg);
+		if (ret || subreg >= chipdef->n_leds) {
+			dev_err(dev, "Invalid 'reg' for sub-LED %pfw\n", sub);
+			return -EINVAL;
+		}
+
+		ret = fwnode_property_read_u32(sub, "color", &color);
+		if (ret) {
+			dev_err(dev, "Missing 'color' for sub-LED %pfw\n", sub);
+			return ret;
+		}
+
+		subleds[num_colors].channel = subreg;
+		subleds[num_colors].color_index = color;
+		subleds[num_colors].intensity = LED_FULL;
+		num_colors++;
+	}
+
+	led->led_num = reg;
+	led->is_mc = true;
+	led->mc_cdev.subled_info = subleds;
+	led->mc_cdev.num_colors = num_colors;
+	led->mc_cdev.led_cdev.max_brightness = LED_FULL;
+	led->mc_cdev.led_cdev.brightness_set_blocking = pca963x_led_mc_set;
+
+	init_data.fwnode = fwnode;
+	init_data.devicename = "pca963x";
+	snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
+		 client->adapter->nr, client->addr, reg);
+	init_data.default_label = default_label;
+
+	return devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev, &init_data);
+}
+
 static int pca963x_register_leds(struct i2c_client *client,
 				 struct pca963x *chip)
 {
@@ -338,9 +442,6 @@ static int pca963x_register_leds(struct i2c_client *client,
 		return ret;
 
 	device_for_each_child_node_scoped(dev, child) {
-		struct led_init_data init_data = {};
-		char default_label[32];
-
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret || reg >= chipdef->n_leds) {
 			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
@@ -348,22 +449,13 @@ static int pca963x_register_leds(struct i2c_client *client,
 			return -EINVAL;
 		}
 
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
+		if (fwnode_get_child_node_count(child) > 0)
+			ret = pca963x_register_mc_led(dev, led, reg, child, chipdef);
+		else
+			ret = pca963x_register_single_led(dev, led, reg, child, hw_blink);
 		if (ret) {
 			dev_err(dev, "Failed to register LED for node %pfw\n",
 				child);

-- 
2.34.1

