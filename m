Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3822336CDE3
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452158; cv=none; b=edsR9sxTDTQR+Wnvmv4PxrFkmBz/xMMSEVigrTEL8RlbeEAfz//W9t5kFdf/c5W2OkwtJ6YFKn9Qe3O90VHmKS9TH6sJ0ygwKMouwQCEhLphnWZDJ/F2zSBjlJXp/JC7B8Up4s9iQrEJbpgZcC+USIalVQr9WU4geIJLw5gmvZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452158; c=relaxed/simple;
	bh=MI+RWUz8fxMQfKb2EV9Pahzs/80+zpEY10m1N3YsiXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LqE//T1gW604C07TPQ+QfPy63PQubc4yh6ZX5a6ilWk1bSGqlbpWM0Qs387R67WB0D65xqEonr1SCV7Czd4cbSiaJfjTpta3GumuyFitE6R+Kq3vunpDeRyj3jyjJKpXWb5k9kDE3gv0vvfrdR86pUAP42KlJxCoxyMBbrQIZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SL+OEfYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M92LpobH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SL+OEfYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M92LpobH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5WGZ509599
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 19:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1A6ZSEVP95Jb8y66z/L9RcTyDzF3EYzq9P4CGXBhNw=; b=SL+OEfYuqwBBpvnH
	pmciEMFS/qzHUaPhZRqvtqCdEMrMdgU6y2rsoetjA2CQXEJq7Y1ZE49jbNY5Jyzt
	7WD/IeX9i1vdbFrIwj7TocoIm6MgDVIshN3Y2OC/CNUM5mj+didIailZhZWdpcH3
	cPm9VkxAUhnEZdR+W47cLmIs9iqVLs6adpANCAQf+wiEZnzGqFhm19Y9bdU1YThp
	eoEHj6b6h20cdrXhwMafW3FIzmDgMAgR6DwDvqdu9l1nXgnDkgimZDeoIOiIFfAr
	zZ62cVz2sZkMKkVK2vJWrCKpWqjCFhdPFescZlnBwIA5OR5sEeRNs0AMMu0XsgXg
	uOlZ5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep2yrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 19:22:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso51363971cf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452155; x=1784056955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E1A6ZSEVP95Jb8y66z/L9RcTyDzF3EYzq9P4CGXBhNw=;
        b=M92LpobHksZ0A8xrYIQoqjTpNfCw+59M+f8pe9bHkV0adyu9T5OQiqekqAs1YP1wG1
         20MDWX84U/7fOl/3dD/EsXZ+YSapCUWAm08Le9IIAP4tAgExNlZWn0lHvIx6/H44BEGo
         UGE9XqwYyzSX/Bx3lSlYZX4iZy5zCMI5N7LQgu5tnLxbKxQl0t4+IQ9Y3THaZP2U53f9
         Zp2qD8lxQKPqaGIdsjElfs/4UmQrqqa6kr/laBYq/vj0VByeuPvnBPQ/oqIBHqhbNoh6
         AJJwiWbcMfv/456qwAfQtdob2FKRv0ubGCUSV+lUzbPpin7MgaAh9BBkoGDJBtKi0JR1
         ZCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452155; x=1784056955;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1A6ZSEVP95Jb8y66z/L9RcTyDzF3EYzq9P4CGXBhNw=;
        b=nQ1s3DnfscdivYA0iyDz9g1fkZNcKDew7jkk16B9EjUPTqGQ7zhIlmLwB3afAsalQf
         4ks4TVmhMNLQ5iKf3FGEMQvI11H/xLhNVhoul/sPrL1Lo7BD7xQdWKQaRUWRPeBMBdlr
         MUJaner9s+O3HN2U1VuuuZKRNGI3bMXoopEeDzSwH+DWlqbRIVrf33EV26uMsCp4roAl
         7BFhB3Xcq83k9UJGUNIMB2CKycYVa5JrO49XzkY9iowaDG1e7a/me+hRhbSpZ7ehJ8ej
         HNzvUXmt70FLTf+OBV1uaBLNOruLimAQL4fybCL3gVHG+NkOwmtTHRTscGYpLsMcMfbz
         QHZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpzfu6wWtqvE8csF/II7JBchB+0JX6jOvAAwo1q2O83po84Vh3lqNs4vGEXoeo17K+GNGchokuSF//K@vger.kernel.org
X-Gm-Message-State: AOJu0YzwVBaekTKlKf9aKZTqFfcr/9IaLf2U/RWwOPUe2tAhlknh22Cx
	onH0x7v/9QAYQCtZ9aaUzbjybXWhbEE4kxR3y/XZWclNsFD1Si15i69jbcPCO/NeH6HkpX3qNdb
	pDShKwXMios5vvDSYyERSOV73ymn5Vu9zTuL+841s8X+Szo3WrHwMj/n0jNbba3Ky
X-Gm-Gg: AfdE7clNIfoOOph/+2HMN4+gmo6lBfDiF7tZQgaO8MHaeESAKzZsC0Ky7iOyHRPMad6
	f4K6tDgrWMMYjJ+p77uoO7mWn3Zd4w+9t1QSabbofDQmWbclLPYuYvVQVcMPHf3VceSCckTTHQ5
	k886ayGzecLplPgnpvvWSba9tzibBEo44jI3bTAfjBAOUb2VdsdFXRMI77xOqMG/6wSnVy4d+la
	O5UsDGehqA6gn9IWtYb7EGEHa70I37qsMj9o/neFdpJBS9ZZg3Fer8Vg5JRqVcJ1pULQ230H/Xr
	ZnSSzAWkb6DSbb+sxMfJYD1/k9ftTDQgJAXicSnN6VWr1W22qV1CYg4GwvQlz/bAbS4awIj+KbO
	Q8Jg/NzmaOwmi41YUSnAJUR5c8+RUFr/ektJQWGTwL4U=
X-Received: by 2002:ac8:5706:0:b0:51a:8c97:9385 with SMTP id d75a77b69052e-51c748e086fmr67995661cf.60.1783452155090;
        Tue, 07 Jul 2026 12:22:35 -0700 (PDT)
X-Received: by 2002:ac8:5706:0:b0:51a:8c97:9385 with SMTP id d75a77b69052e-51c748e086fmr67995241cf.60.1783452154518;
        Tue, 07 Jul 2026 12:22:34 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:33 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures
Date: Tue,  7 Jul 2026 21:22:27 +0200
Message-ID: <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yoH8_2kL05bwYwDk1kSSgk1qX2pZCHD8
X-Proofpoint-ORIG-GUID: yoH8_2kL05bwYwDk1kSSgk1qX2pZCHD8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX3ZGgKs4pUKtr
 RS7zm/5iQk3vow3o/ZQzrr+94HpCNy0wwmCN51MTKJERP8WI928H5CF4G7dhziOC334mDGlRs1X
 Lu9RhXDtj7j5dz+yuBthPs1jgC0MbmDApRV+nHc074fex+asbY23qEpcxvoUbgc5XJsgvvxbBeA
 J8eaULofgkh7+MpIP3V3OFN0CfPuTMXZWenC0d2t9BmpNoP/BW3BR0h0/VXSW/AafU4VnZ2rede
 3ObVIPYJXqrpGyIs0HQXdXUbKfa8B1y9nEtVwqQpAa2vkoT27lyoSu29YsoloVNz9fZI1ePiHAT
 imyTukH26Zqt6xKs178GjHWGBDKe22gGduyfR2CnINR83p39s7y/Z9aSBpm3RmQWv0hdjHSNBtD
 Dt5S3BvskSWTW77u4n8uPIqy95eCP4jUkZaswf+pNYXmzozqfZBWHB4I8A8JcouKxrq5ldzopzB
 UiAhME679wojDQJjg5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfXz3WQEKvkP1qM
 ioctnaUaV7nKLEEQyb7NoxSUBki0wjLRETijfJAtb8FwwjzRAlXKeUXSGRfsKNTVjNWOzQzGnS+
 DdmfJ0+mJTTRsVtPqUoPaJBJVc7mSi0=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d51fc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9Fj74KSAFJAma6AI3IUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 10f905d7d6bf..121043348740 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -75,6 +75,7 @@ config EC_LENOVO_THINKPAD_T14S
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on I2C
 	depends on INPUT
+	depends on HWMON
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..fc480f093238 100644
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
@@ -555,6 +574,114 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
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
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
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
@@ -590,6 +717,10 @@ static int t14s_ec_probe(struct i2c_client *client)
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

