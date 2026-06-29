Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69383242BE
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 19:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762738; cv=none; b=B0b9L0YW4p1HXbhQ5RCtO1OitWEUAYJDtEl0XRzPDeDwb7Yk0KR0+3mFKUnb5rO0nA+4hBwEuPMi19GdjaiWLkl2HPE4zkdiKw1I7AgYS8mHSMctoD1fYezobfh4ID2Ivpsjx0/mYzNhJrpY74pqo1UmtX2LkZs4GpIHi8ORcLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762738; c=relaxed/simple;
	bh=1y47odj+NOJ9z0mS6+ykXCLNXopAlKlTgU+V3x/sXtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dISyQmThAZLIQwycghrY+8+RrRDn1g4nILiZt3lHFZPl/2iYeFHeQCDZMDHZhj3g+IUrPoVUVVRQajYMEbDYc4VSeT5Uzkw+1dLRZ3XvKohHBgJwYQ3uhDav1OI8L3xTLOkqUFb12NcFTFxK2jZq5OcvgG4FOLh1AIW/vWOVxDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/Vk/19v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7L80rmb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/Vk/19v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7L80rmb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGL0DZ3448807
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 19:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=; b=W/Vk/19v6zKrgD4e
	h5Q2WZacCgohiJIm9V6BIGRsXtQoTOrO2v2rFWe9/0cLCypgxtO0AoyAP5DKBMLa
	g14U0LGZjUi8RAIQ9IKwJpl3NNO5QOAAY9SeLoeCe5wzdZYh+k5LLLkvN5WNxckr
	repTsnXlDpt1OCGuWfFuJrpx17Vy8I4zdi6TIzz7QO5GgZHQppc7nq9hVmuU3xFw
	NNOLMx7JyfZumivGXIX7kGPWXlTNXLzB7SalfEGa4IjA0YtOmU/l1/5dCzf8pVX8
	QWZgmy0AG/iykV7MxL5icxEjVh/Q/S1Acl+vSbziRas9RamOC5xfunYNIToVvy87
	zhrE8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3npetuft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 19:52:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92af3d5e85aso832065885a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782762735; x=1783367535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=a7L80rmb2u5DXfzfii+bnYxkRAgpjUQNBaHG1ut9RYXdSxGyS9PYnt/Zv1FCdDV2D8
         pLWnsvDq+Q4r6FmRtCXaQxbukvPxyiJJ1qEXeMbY4VcDWdncV+detcD65HNMNhu+1ZA1
         rLvKEYaHCOBP3FxMTyxGx0J90FhRWVI/hr5o3FWE8r4TBYZGPkSlSqDtIsSevzQ4Aezx
         wDexQmTBFnemzgbqi6Ow4aJLvkl7RCFukIZzNcLFnwcFIP9QfjvJVwqrXJnQ2v+zucDe
         bR4GnByhKOVRBIDhIdai7RKIV1gs9MyAUInBGT7UrMJTX1ddRFxn31ByVLHdgRd/u/V7
         yAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762735; x=1783367535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=NtzmjaO8jg9WWdSMKllUErNe+qPuQem/oYUOSbDI/I3xoMa50li/x015GGI3dND7QJ
         B5P8TO3GJsXRzdcvLtT1JZGNujgr8zhHx9kgofGj5xW9TH73LBnQAMgidniiqGgZEK11
         YUF/rLRKNkiimcV4r4gLWkhxcwIZHiCqHfWN+RUAvoUy+1E9F9HLE6drdUHg2KueffGU
         8EhpzLpagXZsunU/Dh92vwsLYRf+y2nzPpKrH1biCz2HbADte+ax1KbUIVELefvKXOgB
         QPg17zTK0LJevikf1xbMOlWjyIjk7hrnRMRTS3cLNTo/HWtFm7CtmLtnq+/w9TnuX5Aa
         GU6w==
X-Forwarded-Encrypted: i=1; AFNElJ+GYITff1zSBNQ3I5hPTelDMK6DotbW8gORkhj8ci5V0CvvgxjwM7xffkdR6ssltUzZcvV7x2oT+fpZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwgcG6I+escvpkDgq1saxo33Fh66cwh5vOWeUjK2iHa0iIKVTlz
	d3vB8QbTgFyzMzd8BYSbET6lLKHLj8SkbiJ4QMj1n0kH27TL+HmwHyaCzL6/gVDC/FWX9omKKQ5
	HUqji2Gk6pKf/ImEoUJ/YCH3Ez100RbDtlEzN/TtzL4x/w6W2v7cocB4jAWUpWi+o
X-Gm-Gg: AfdE7ckLzqJprJ9Vrpl4Se906sUEyxw2Lr0GdbP70KjBVIntuF0z/6V4PflYveuW7Ky
	B3YUAjaeRgftK1YFqiawNwQ974m0lngWr+dVTkaWrh6x4V12rOY+LE2I+H+yfEiORGz361p0irY
	5pzrcuto9Pqgmg3FF21Y3jyN3n+EqBAUeWNS0ms16lnn9A33Ni7K6vswNtyQyWy+F8RSQ0bycIh
	a2Rw/mmKL746BqRNiT0dJ5COVd7yMeJl/PVoNn7u+D2gEKibKlXe1xsgeXfAFm1bwOFh7w0AnfS
	ZahOP6bVYH3Wa6KSdwSGbaqy0qVf52rrcPdhCq+07DmLJRCUzCY51SedMLFLF0Y5GAhK7/c8e1S
	WX90xpiBm7iklppq0iiagDL+niTW3B6MJeDjZxXwHfMC5WHWFIkdnxtHjA2BbL2wiRfq0/p1QB7
	oSelDIRY6JsfixyXknn1hd0PAMgwMSNrp81fXV1bhIm+1Ab871jV1HfP6dQd6JYAG1nJviRrLR7
	GP0ROUj1I00wfDI830Y
X-Received: by 2002:a05:620a:25d1:b0:92e:5e38:8ca3 with SMTP id af79cd13be357-92e6267bf24mr156391185a.35.1782762734589;
        Mon, 29 Jun 2026 12:52:14 -0700 (PDT)
X-Received: by 2002:a05:620a:25d1:b0:92e:5e38:8ca3 with SMTP id af79cd13be357-92e6267bf24mr156382885a.35.1782762733915;
        Mon, 29 Jun 2026 12:52:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d99565sm6360005e9.0.2026.06.29.12.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:52:13 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:52:08 +0200
Subject: [PATCH 2/3] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-monza-leds-v1-2-0cf7c0a7dc14@oss.qualcomm.com>
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
In-Reply-To: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX58aEvweczuJq
 T460VTcGCaTzNIEsFAvQYEnYb9Vjt8Pf0ICrSI3zBIEd1f/Rrk7TfbtBe/uYYABjhTnpNUh253U
 2I/pLE/BCS3fyQnAulofEjZcbhpxaN9qKE+S5BAn+7fdfTd1zxGS1scdG3kqHyoL8G5VIEjjJJ/
 bZizjaZ8Bqj5dGCuCXeVLeb06k6N2ZcbWco9dEYPvrDm2BwVdbFu7gwWjtvCgeFanyRhFDRDiP1
 VL9k5xXlV46FToAuLsE0btTfF7gMozfb5nOvwDV9ivHq5kADTCuKZW9BkehhXFHXU94J/KrTrdN
 Bzb4vGKPxLypq0Z5EYuvDrqTjRmCjvINGUOO3gOwMR1SJrV/wsbb7rF4qFz1vff3UtDHVlkXZQ/
 7BkkTo+oTvlRA5k9udOCXpSe67Z5YjJ4f9PrsIM3YUZqSco4FrM13mWG6HKCUMTDNUSEl8RPV5F
 qPNfNkoixcvRQ05s69A==
X-Proofpoint-ORIG-GUID: 0i75-c9B4VMV-ezci9Lz4bhD2zaRfLlO
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42ccef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TXsEHxuGAXnH8Ii1pS8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX29kt1XeaIb7O
 VsSfuRA1crq9e0nUi0iHlvvQqFv+RUCSy9zoFhL5YVoMG8NFQs4OnbOvYgqsIkX11IRgw7syZ8H
 VUEoyUMhj1yuCkABvUyNqpegLMhnfBM=
X-Proofpoint-GUID: 0i75-c9B4VMV-ezci9Lz4bhD2zaRfLlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290166

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

