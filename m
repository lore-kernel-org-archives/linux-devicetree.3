Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8662747B41F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520352; cv=none; b=Mw2paHpYikHVVNPoVT9vEGbhUVrEBAslMO71B3h+HTvX1IJarh0oCJfRuItR6hnZ/K+GfWWrlJNq1kXMFrXrkM4dKRjiys8wjVo++e1NXX7Wfp5WfgSCydm+TR7cMmS3+zbP3ZnQFl62FcKtNnHfi8S78KalWWTlcrqo19JPwGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520352; c=relaxed/simple;
	bh=1y47odj+NOJ9z0mS6+ykXCLNXopAlKlTgU+V3x/sXtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TreGi0YlUPsdoCrALGLZBWoassytsHbF0OoYTcrMnLwfZPWUUi/ZmRZDG+LCFXftHnyWUZH+5evs/nKQXTivSIJseNw6RG9UanYnK1xU95nuHkc5NetXlyifM5jhM8el2Q9VO36eZuAlFhwftk0J2jQVmuWNRmWMocmUZtpgukA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRKZpFZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdNaGGoj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRKZpFZn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdNaGGoj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C43cC2752166
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=; b=dRKZpFZnXQNxXPa9
	c9zZa7ppK4PBFfIcfHvh4OWrTqlbNfAwDO779yGux2XBqxnbYejrUC0lX2korZJ/
	BnTyFcaH/eoJZmsk/mpsJqFgJV5nIMKQTutxkDGoMUQmwkOQj5wkgJ6BmiThX8Q2
	i/grHNPtde0i1gCFwgBlWktqyxahcR6agJgC2UgRUOSMt22HaitrX6uROG2lkdt9
	oIKVSUmQl65zIU7tyBw6/Wns7dx2L6HmC2FJh3IqwY/Bl2m72ywlpYXNrRxJVqrl
	Alml/BIB9gT5YUEjd7ru7Vqt0+X7Ahecd/14w1bW4T6tisubrqbExMjgZZhrJjpq
	qWBt6g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csstu1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:19:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738e5b5ef68so221195137.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520349; x=1784125149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=jdNaGGojS6z/qc2x+IvlghTxNTOVPU1zYAadERaQDMBnB0nnizAsWroH9kCEUw8Esp
         /H4oPL+kY4DazOysFVvJ9wJnNAHXRf0EWSzLCnUBr3DSHptlr0QsO2Bjy132TkxmRYvI
         FNTg+92yusxssiWCdq3Wsi9XEhoF1PmGzdhZwzGF3Ap4/THwQKQR+Ld8NPmqFYFB+39F
         XaOBL624CWhCu7zt4xiLrxxTk984y+Ju+E5iT42UFwxao9TjryfDI4Wx6W4+G7FA6Lyx
         OHhIpPmk/KOpwDrvXrYqmcJtdqLgoVn031/UH2hxhWcTIZ9w/DPDZE4rSE+NUAPMi+M3
         O3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520349; x=1784125149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=VYuMW8OIz7CTPFUoSaEVSiceyImwNIj1PA0Boo3N8DPCDFnZcbsSVg2HYRwczZ9yrH
         RHJ27zZw7FRPxpYoWoo3jfpsHZkMeZl9koQBYKkrta1yR73BAjmidaptBxPiTEJ4SuKm
         aJ9ChHOt5Wd3ujuMqOtmpl9hAjwDQxe1gvblaGl08Ud7vIuTqWEPinZ6rgSRhxIwiK1p
         tlQ3mJHv0R7bbg4aR8zRGIgH1NSOKuHXbv3DVG4/Z5cDboV/gkB9TSYN6x3eXKzLTgv/
         JIqeyvJUzLNcFy3+guiewQnLIi2KwZEaHNU0UoqWRAt+LlcrH7hggu7Q20nvWBXXqL8I
         YNkA==
X-Forwarded-Encrypted: i=1; AHgh+RrelQ/VCKe5eTq53bTbyfo1GkUqZF+bhfbtWU2w5nDpyDFekKq6gmn/o286Vg73aXEsLtkfxI/3N470@vger.kernel.org
X-Gm-Message-State: AOJu0YylKju12muKntwh1RC0wj4sYG/Y5FOvDowg1lCeGuki/EP4c1fw
	hcvUMaYqApgOzuJqGSQzpN3OVI5ATLVNEgRriwCbrD5Ca0PO9CwmH4FB0zbHO4oqluYjETLJsAU
	lfSiLI2qGLzhCiidEQFDA+5o9JskPiRELW4ydLCDwVyCyqieM9TVDrxRP8w5k+4LK
X-Gm-Gg: AfdE7cmziq4Q2sY7O77sqMvLLQFqFpjULf0ySUh7oxbKXQ/a6I3vcVIE/J8uPC+Lcak
	YF0qpTmTQQap5EFT5qCZ1TOj+wPuZ6DC7AhWiLAOriCXNItppqBNh6I3GUMbBujM+N61TvmoLxY
	BgCQhy2cddewPFqpF8Qy7nAAAoXYC/zFNg7lEzvWr+GQw4tVugHiUCF6wZBJw16SRQykqdLSg2I
	ABF+ltn4gnsicXoFZX2C0RxNe/s9x1Jsedb/am9TfmpxLtxaaOtrb7qSCb+GfUt+pZz5LgEsVJz
	Htfw3laRSEDrPLgr9YtOagiB8ueiEJDwvtynEkrzrItdpgrP4X8mx+X7A/aUR2ruEGPYHn29v5Y
	pT7Nc/Tsw7fr00bbBSzPSAKpKqT5yLoZHrUga8oV/EltmDo0u6VqMkxpBFsGoLWXnjyuDG4R6xf
	kfWhsn0xeLmBJiTodH1BRzYNI9ND0B86Sm8nn1xPw2v4uVIJ36/urlq3KXWxIoQMW2Vw/m+ZSCl
	yMx1Sdzu4Y28gmIMrl5
X-Received: by 2002:a05:6102:3753:b0:604:f849:462e with SMTP id ada2fe7eead31-744dff2d5e5mr1341443137.25.1783520348541;
        Wed, 08 Jul 2026 07:19:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3753:b0:604:f849:462e with SMTP id ada2fe7eead31-744dff2d5e5mr1341396137.25.1783520347888;
        Wed, 08 Jul 2026 07:19:07 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:07 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:19:02 +0200
Subject: [PATCH v4 3/4] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-monza-leds-v4-3-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
In-Reply-To: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e5c5d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TXsEHxuGAXnH8Ii1pS8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX0Q/NxtmbuCMM
 18gvjsY7AscCt4FhE1uOrlEjQizCQGl0Djyx89ECNK05e+MNXWOOV8VLfgI1dPzDT4WiCJ5qzH3
 3TQQpnXoOwjdEwYktKTUY47qg8+U/XxXGnN/WAb8Oc+O1jV1/MJxDIIoUmTq9D9wRllWd9mrM6S
 WGKX38jNwGKjmrX5Y66RRUxU2nLGrQ8Z359eARh5kI3f7fGRtFVrZDz7KNP4mxGPEQjT5NrEt9p
 Y/kUUCffkSNu1GXnnKDKbJx2ip6lYywZs09v390Q9GrrddLUhepM/bM3J3lOtA3HzIb9uuxyhAv
 dvrK565Y6O0XXcySE/Hmg1XlCRGd9/QnGSxKm1MT8iP2JFZa+liw2Ycaaw8Hb3kvhgOf6FrwDb1
 hr4phaVKmvCsxVoTMj9vxGj+a703IQ1tMFcYHX7JAVBj3oaVdfT8S8WFAdkHY1kh5hblUbKIJ0a
 yNoQOvH6jWrglsQP2KA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX2Jyq25iSoFfZ
 XTaFyHk+xGWis97XwfGMsvmc6o5uVcjFjwH3s4AJefgvTTdOaaOsbQL64KTJLl4gaaGBjoGtPhk
 Pf/FtiZXwqOYWqBTMy/HwY//UEymM3c=
X-Proofpoint-GUID: j5Gz6NOZRuQb-Cy4QXTQHnyUPc5hmLVJ
X-Proofpoint-ORIG-GUID: j5Gz6NOZRuQb-Cy4QXTQHnyUPc5hmLVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080140

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

