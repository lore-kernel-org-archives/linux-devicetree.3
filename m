Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB031421A09
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902245; cv=none; b=SALsmh1hcA/P3SrY48EE6h9uF8pOgS8SBBHaagitLmOndd7H+M2ZGdX9+xP3TFeJZnDMWU49rco5NMj8bGRokoTY4emDezuvWw1OkHAkgc0N8GD7olNsPAl2sNA020f54mfW/2AlJ8wm7mSwu/M+rAcuIgf05WrA/Q7Chny+dGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902245; c=relaxed/simple;
	bh=GY8/lSLJrWV6vudjyzgth2Koav1F2hxuL2KYZuGjkcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZxguJDy1a2zFc/+JBp697Bw5M7mhcI0T2NFbDwsEJ0lKSouDe1pZepQvRvVXx3VU55xyoz7FANNS3+HUcFUJOwqXalG414XEhBcqUYOEWTUh9yFqET0OXBGnjYmNKurMFalvz0LjiczcICYvtZ0HvbLfxIsAs7y9EdcGTTo4Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ef73pj4S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxvbajwV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ef73pj4S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxvbajwV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8V8L744177
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x9XckNnjIaL
	LOOJegY3jwlZqepfLceFjKldmtuVP3wU=; b=ef73pj4SxFBWEfZ0LhLT4rAk3L/
	ciunFVqHbGEy/o8VxdR42IILpPUoxZR7hn2IfQN+y0E7NIFk0T6bs83dI1ZISfLL
	86AamNxLZf08jtIiBzXRKgaIMQzwM2z49ilRjdiFQ25juTaWJm4ycbWaNA+88n58
	Tpe2KQL9Aflz+0MwIHULOYG1fz8cqpP0rfdwxqzGQ/iOv82ocYBkSRJh2l7aXyrf
	OXIBp8rk8N6pEyVOzorKZ79AuXfe2IuGbEN0D+KC9fXRnWS2tmJ0IKDUzSOvfmGp
	aC8myIiakey9sYQbyEBzSTcqaIvhqNysXRpg1NhNh/pXO40iNxXCS1eAnPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0th133-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:37:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so49986485a.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902239; x=1783507039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9XckNnjIaLLOOJegY3jwlZqepfLceFjKldmtuVP3wU=;
        b=IxvbajwVsC6ZQA0c2IS9gwFLBoZGLCeZeNK98J9cpvh2F1vlCauwOfwY15MMtlMOZd
         W6TdC4+6iUCcMLvXNK2jjGaWlzyWpL6q9Da1FfS22OYgKhTOCxSCRrOlhIXOPRfn/taP
         qycj2R9SeUvI9XSveuTj7HM0MjcQR7OCxM+fMMb0k7S4MV2cZLhxUFkvGkZK4T9oZ036
         SCLOKMkB5sQz0/DHMJS9oZUdpOzbIo9tw+ClH7rhsEbadHF8dxQNIQPVT0Hn+kkEF/Td
         coQFe9EVXP+1/W67AtOTbwOXEY7tJHkPN3LdBjlbjcDLF4xWUyFrkYad9YXUegl0eC9D
         iNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902239; x=1783507039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9XckNnjIaLLOOJegY3jwlZqepfLceFjKldmtuVP3wU=;
        b=MSqNi1RMRx6aVdO0m9GKlrwoso6O2Xc8xDC7HSHgq3aQfzGJzGyMl2dsP/KOk05B6F
         Axp7w80GV1iszNj8RBbks4TP9IH/GmrstBtmvzOZHUI/xT1k8WiR6JydXswePi520zW5
         OiKsLoAweD0eF3tkqBCqWkAA77ME8/sBZcuBdvGuZggGpYie4MmsaGPP4ypw+ZNAUBgM
         PHelhM7RULxY6Dz7aavnT2g9eGtlpZQTkbvE2G2aXgJHW/MT3OP6rKwIGlUn2F/bjHdV
         1O8idArAJVaU0SShBL5lYo65UZ2PIukujYlC6mKVk+YCyOs+Vu/Pt5xWVSHtzumnTaRe
         ZfoA==
X-Forwarded-Encrypted: i=1; AFNElJ9K8ERIA2tIH5C0i6tV+/+rcZeH/VyErPrtNNqNEXh2AoUZPGlp77TGoYYnS4ipBVfPqpuLMVF6mif0@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ1+17n0rOhNqG8BOcq7msWnfnNLKN3rL+7G3m2eOJ65Lj4nPX
	bdQL9T6LFfLcju7jwUf4r6+JsWTFrAbZJ+CYCSvSi5RwhIX5oToQXc2vnEFVLsiybC5r0cVC4Nn
	f7ZMzGPrSY+fFOf13M0ctDezgazv243a5TMhOypFxD75cCGNlUoxSZs9rZV2OUlDx
X-Gm-Gg: AfdE7ckzQXvfGZvQEPsvWcGYEjgyrCPEqxMDB/a2QjouJdyrNtO2wLBn1Rlq5NAPdcQ
	IjFaTFYx9NybhU/XYs7b4JkXfB55XA9vYxhUvrw4M6uQa01B6SeX3OXGdDczUOZuRN12Qhqt4xW
	fY2BZtLuAJ/S3W2YSIHj2GuNH2EwGNFOHd3hJjj9nL8Z+rO3HlE/ZuVqfyNVbTT4r/WrvBCgxOK
	US52JF594QeD5ENnTnThe0/KvvxgJrzGC5ZBcXRwSQVTFDMA02a5nLF+QYv1Bn3CrTgvjlX77Vn
	EaxnUbw2O9I4W8M7m68nhdLD/dE4xMzC1nn6b3Dd/0cDqvqBARKXv8FBzFmcaE2uGZo804M/u23
	TOs3BLuKlH4wgEiKqTsrn97Isbdo/rOBquVUkwxhJ0FU=
X-Received: by 2002:a05:620a:414b:b0:92c:44c3:34d0 with SMTP id af79cd13be357-92e784cdcb4mr132129685a.46.1782902239184;
        Wed, 01 Jul 2026 03:37:19 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:92c:44c3:34d0 with SMTP id af79cd13be357-92e784cdcb4mr132127085a.46.1782902238806;
        Wed, 01 Jul 2026 03:37:18 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:cab:bdb4:a76b:614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d2bc5sm69130655e9.5.2026.07.01.03.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:18 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures
Date: Wed,  1 Jul 2026 12:37:10 +0200
Message-ID: <20260701103714.22583-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gqPEIAmxY7XW0XUPu4c9qqyuTXkf-Pk4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXzGZPwGefSCoB
 FIZDPdU3yDou9injGo6gXB6fs6Smn25HXlb3BegD+bpJjz9p/BC7a3IrkveIHAQFvc6EiucUGqb
 luOOwz9R4Zu04gQFV8X2RfnUTtgF6o8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX8gF9OT02K31N
 UcUouGIwXIBsE+dUIk34L6DN4kt1jrfA0y1D9MGN7XXrvHKE6gdtAir4q3Arw1czyBedLQCTaQu
 MK+537CGcC/nzvBkKpPm6Lci1JLqq7DF8VIcE6LRjxzc8lND9QNWmmboDOyONkdcbGvuvmIFf0m
 8Z7hGV8jCHcq2ZdItb+B+juF4NY6/b7O/nOaM+UfuIeRwL9r9zq+OUZ3uyMD+g/rOt5UfXvixFJ
 fbm5G8NlFi1RzIjsbtEW5kyY8x9eeE0vIVMSGH9KH8Lw/C1fB/lE9iYXDKI3w0LqFGt7q4hJN/L
 QWQ7B01J08CQ+D9IsBo36/Rf5l4HttziXi2MCnmj4jp0udRpZbT2WrPjQvHauhj9zdiozWzqate
 vLT0lSua2ts5IdDIfomhZlXGyBfWnCb+jPeyATZw3mDey54uPix03Va7hzwpU1TkkiiMWst9Orl
 +rp4VGw3ZsHiPc0lyVA==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44eddf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=O3gN3AO8kzc7p6n7zlUA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gqPEIAmxY7XW0XUPu4c9qqyuTXkf-Pk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures.

Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..c9917a1d2bd7 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -21,6 +22,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/pm.h>
+#include <linux/units.h>
 
 #define T14S_EC_CMD_ECRD	0x02
 #define T14S_EC_CMD_ECWR	0x03
@@ -67,6 +69,13 @@
 #define T14S_EC_EVT_KEY_FN_F11			0x7a
 #define T14S_EC_EVT_KEY_FN_G			0x7e
 
+#define T14S_EC_SYS_THERM0 0x78 /* SoC (CPU+GPU)  */
+#define T14S_EC_SYS_THERM1 0x79 /* Keyboard       */
+#define T14S_EC_SYS_THERM2 0x7a /* Back cover     */
+#define T14S_EC_SYS_THERM3 0x7b /* Charger / PMIC */
+#define T14S_EC_SYS_THERM6 0x7c /* QTM West       */
+#define T14S_EC_SYS_THERM7 0x7d /* SSD            */
+
 /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
 #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
 
@@ -93,9 +102,19 @@ struct t14s_ec_led_classdev {
 	struct t14s_ec *ec;
 };
 
+struct t14s_ec_hwmon_sys_thermx {
+	const char *label;
+	int reg;
+};
+
+struct t14s_ec_hwmon {
+	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
+};
+
 struct t14s_ec {
 	struct regmap *regmap;
 	struct device *dev;
+	struct t14s_ec_hwmon ec_hwmon;
 	struct t14s_ec_led_classdev led_pwr_btn;
 	struct t14s_ec_led_classdev led_chrg_orange;
 	struct t14s_ec_led_classdev led_chrg_white;
@@ -555,6 +574,113 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input ||
+		    attr == hwmon_temp_label)
+			return 0444;
+		break;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static int t14s_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_label) {
+			*str = ec->ec_hwmon.sys_thermx[channel].label;
+			return 0;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int t14s_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input) {
+			ret = t14s_ec_read(ec, ec->ec_hwmon.sys_thermx[channel].reg, &value);
+			if (ret)
+				return ret;
+			*val = value * MILLIDEGREE_PER_DEGREE;
+
+			return 0;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops t14s_ec_hwmon_ops = {
+	.is_visible = t14s_ec_hwmon_is_visible,
+	.read = t14s_ec_hwmon_read,
+	.read_string = t14s_ec_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info t14s_ec_chip_info = {
+	.ops = &t14s_ec_hwmon_ops,
+	.info = t14s_ec_hwmon_info,
+};
+
+static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
+{
+	struct device *dev;
+	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
+		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
+		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
+		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
+		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
+		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
+		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
+	};
+
+	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
+						     ARRAY_SIZE(sys_thermx),
+						     sizeof(sys_thermx[0]), GFP_KERNEL);
+	if (!ec->ec_hwmon.sys_thermx)
+		return -ENOMEM;
+
+	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
+						   &t14s_ec_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(dev);
+}
+
 static int t14s_ec_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -590,6 +716,10 @@ static int t14s_ec_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = t14s_ec_hwmon_probe(ec);
+	if (ret < 0)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					t14s_ec_irq_handler,
 					IRQF_ONESHOT, dev_name(dev), ec);
-- 
2.53.0

