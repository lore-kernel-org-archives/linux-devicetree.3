Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4DB274B4A
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691394; cv=none; b=ruFhtQLVbVo0cCrOH76rQO5qww3EtZONoLYt+pf7gyuoJ9aM16oz4SzegQ75CgCsxdVi/uzuMzQx2IBwOgjUyJKDX67cNwMLVoCKWIWPayZX0iYueFZOQkg5WVA4aRz/SPk9vAGDlRRJD2ju0hnLRpvKb+wfhB/HNESvDASLiwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691394; c=relaxed/simple;
	bh=zxBMczz7tx5uTlYUiWoyepHpOMtPgRVLKVk7BjgiHKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PeV7WXKgKtuWaI7KymFFmUmSdAZVhbkoN41exnHh5EI28eLOAb42UKd74X0zHcmFrFTFC33mb3B94EFHAanqRdll3mOgcw4kvl2myUA7WHq92dZs8LzM2fcNUpD6OFHnexGG0l8kdenIjKPr1yFjRi87jLL1jGMSGAiGCFoLLAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBZn+iDi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJzP9Jcs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBZn+iDi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJzP9Jcs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD5vHH919930
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+JuTe9LyQf2nOeuBdIrYz+WJ8qwMfc+x1coqRussb0=; b=gBZn+iDir8uMrIci
	AMSXx5n4MtPP3jwCZmPsBx7PZxaFrw/4GrOiSMwXJYa8oLbbp8Ik4LzfeXt9DwUW
	PE/hGXLwUC2wpPjpIjsMT3b1VCynnWGbOUMm6gpDvkZBTb3+V4PGvgu77xZDElzW
	QYxakZcklMRz0z4bVi1oRrFWFP+ylQdYGn4c/iOOSxbSWXsz9pM32F73Hz3ikur2
	RbMeWnMTb6Dgs7u7rPQR2wUyHSzfURlyDgiXzmT27COF2ZLQMGi9qU6g7xs+nOD+
	UAy8Mg//vepNF2tnRFC4ocy4wRp1jQEjMw1VR6KA7vwTPdooxkwY0zbSXExql/f1
	cyxBVQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte3btu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8fc92c5373bso11680596d6.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691391; x=1784296191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+JuTe9LyQf2nOeuBdIrYz+WJ8qwMfc+x1coqRussb0=;
        b=iJzP9JcsYFkSdVbGKoOZ/42NsaP3g0Ek+CzaHMqsc4gAlI7KJocPtaonq/fojoFvrq
         cXzMu5EeyyBZYpSyMTRKhDatC4lgePZI12EpCLn1Dro71Ou03lBdqSmwwEzzT2+SY8Ik
         m9ySaCHxh9Gi137iCW4iCE3qJkRRDm1JXk5kQv1X5He7cmnj5aP2K0s2OhgxKIamxEGd
         lXvr70czeDf2nNLRLHNHZIrMCJfDkd+jg7iFV6QKEf46a1DidS3rWyvb5NDWFL54tlei
         D5YMH1eoMCK3zzeaFqr5XKDpy6mp3608BcVSbadgOjoN9J/pKfUK1xDKoaeg+Rn0cn00
         pXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691391; x=1784296191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+JuTe9LyQf2nOeuBdIrYz+WJ8qwMfc+x1coqRussb0=;
        b=NG3Ggl471+PPbRUIGA65Ft0Tg8bn8yJSgF3jEHha8u0JO1SOAHdB/6vPCzj6gSuibI
         9iPUWKUr24f1qb8JRZZ6u9YPZ3G66ievzhRflQfGysV9aLyRvtqFoWNS73kIfDoTg0lk
         xhyX0eBtwAftLIARAuc5adfVrWQb0CfkZx84aHLgD9vTj2iH2SQeNlkyRb/CRRgi7F0K
         vIZ5sLV34RANHv79hdRIYgoq8TB5gienfe/ocl/pftuzI4R0Yo5162sFiUmG1qA7pmEy
         oyo+c6kfv0yYAvLmzCHZcewQJUWQGqtMXE4O+HT4N3mgYE5xX6Bi5fVzYxJevJE2lvDg
         RdJw==
X-Forwarded-Encrypted: i=1; AHgh+RoDJf9wHkS7G/LZdvgYXPvuX1r+bf3fDyk6Q16okaWgHgWigeErP3NDWvnOEpVe2fY63Rv1LreF0uz6@vger.kernel.org
X-Gm-Message-State: AOJu0YxIHKlqbL50I2LpSPsaUSXp3iiRX/OwbmIGpeN1a2IYZVYszNT3
	O46//lHupSa0ziPDgitIRhDvTBHxzVSnf/lBsKntmlfC5Vzf5cs1ybH0sL0muOcI5dR2a6VuTjb
	tlQDxUm4dBnKNJpyxSd3dL71W4UbCVIfEGJWPhnjqAloF6F3cTynclFpHHdAp9NjB
X-Gm-Gg: AfdE7ckC94ycVZJfeE450FIVaZTX31NXEtElwXMvJpw8j6DCkNYQvbDESLfRPKEJxde
	wJDxNuuqB+PZnbHmD2JXXX7mSbKGgMbocgbZwF8VIZxs6OsnL1qDtUHY6Pzsh5/B3/iqSvtlc7Q
	ASrPqklPSvExWOmSABmCV7hm0Co8A1wirJdFIS68/94+khVohjdf1fgd7e7rASSccKEgWRfHzk4
	MSXcEl26l2TW/6RiGb1xEyhrH9X3Gs3hDPprf8Pw1iSKc1bFf5gfZLCSIczm7xS8hN64IJrXJ99
	Lbq3MkSxOrzh4DlLXR7eRFlGYx3vVmgC9t2KEa/HixOWizoWenxih9BZLQSWbaQ2ZDaNPfiv1aB
	O58+YeCS+sA+x5aJ3FxhHiiXM08VpcqJ0bZPJdwtPru31N3W8++nQbFLov3ZMdf10ZX23Ad5zO3
	vY6aReX3t2BkuVP/dt3ymcKAnfUY+sx4egWctiSt2FQ7arMVam2kSx2LuSLlyhydgMV6EUERmg2
	MtZ9Ff0YEWF/ofVgjCq
X-Received: by 2002:a05:622a:118c:b0:51a:8c97:938f with SMTP id d75a77b69052e-51c8b567917mr119635391cf.70.1783691390489;
        Fri, 10 Jul 2026 06:49:50 -0700 (PDT)
X-Received: by 2002:a05:622a:118c:b0:51a:8c97:938f with SMTP id d75a77b69052e-51c8b567917mr119635031cf.70.1783691389909;
        Fri, 10 Jul 2026 06:49:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:43 +0200
Subject: [PATCH v5 3/4] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-leds-v5-3-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
In-Reply-To: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
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
X-Proofpoint-GUID: QIyHsGf0jkAIcBTTh7yUq7b_k4hwKX3n
X-Proofpoint-ORIG-GUID: QIyHsGf0jkAIcBTTh7yUq7b_k4hwKX3n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX2+fE0q9enLPo
 /ORiPE1ogiw3F9KHOM0c/4sbhQYcI+uBh3IXRkdYxHAggeIXqsvufX3McKi6jImkJkS/P0E70X+
 ZLRkEalAvfKGl9VE6P637mB9FlSNUjv5YCpVs816N/SbADi6n5Yf9lf9IGpf5hE+U8aayF1gMBF
 sRBU368Y8968NdCnpRC8ysO588CvVzbrhQUJthb22MaQjGNLMqf7s0V7hK9HhQOX0+5M2VNkZF9
 UaHuE6C4zQs5JYZHQxKiFEZpnp/zgIrcaVWHx++SffGWgxu4nd0dZsw2OKoxKejKSdK+AxdJepO
 3tshELbbmcG50ojFuAligQ9F5a7Jo+6O1u8p3COdqrxZ2qd+xiFATm7PBR4iruklBZYBXOqrKyA
 5oX2vk7drxyKmFZH0zJJ7FT7hydirTQB2llOBrClUjU4gI+Qo/9BDoUHXvwUHY68VSVBoIb22tN
 /OGCLUA+2W/8M9NvfLg==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50f87f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_r7M38PZvEBKBeOnwNgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfXz9Z0HWKobXeI
 5JrPXnNX+bTu53R5g8Iqs0PL8uhynp+R5FETOTxW4TMiAYdaefXHW3e2UlTQfSDN1LuYR9cBbnC
 j29uyDGysDCwkrlBSk5HP9bELM0a7Rw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137

Allow grouping of individual PCA963x PWM channels into a single
multicolor LED device by adding support for the LED multicolor class.

A child node with sub-children is treated as a multicolor group,
others are treated as single leds, keeping full backwards compatibility.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/leds/Kconfig        |   1 +
 drivers/leds/leds-pca963x.c | 160 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 126 insertions(+), 35 deletions(-)

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
index e3a81c60ee27c96e5050a829523dfd43e1f0663f..e54a60c7bf28273ce5a2a7f8fa41f85d31ac94f3 100644
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
@@ -221,22 +229,52 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
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
+	int ret;
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
+			return ret;
+
+		pca963x_track_power_state(led, mc_cdev->subled_info[i].channel,
+					  mc_cdev->subled_info[i].brightness);
+	}
+
+	return pca963x_sync_power_state(led, cached_leds);
+}
+
 static unsigned int pca963x_period_scale(struct pca963x_led *led,
 					 unsigned int val)
 {
@@ -300,6 +338,77 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
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
@@ -338,37 +447,18 @@ static int pca963x_register_leds(struct i2c_client *client,
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

