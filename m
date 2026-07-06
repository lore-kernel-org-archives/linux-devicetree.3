Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4955942254E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354125; cv=none; b=VICFX0rl+rnPYv6boTiacHxGW9mmvavYWXqjL27Xu/QwjMQGbz7/KDU6iNGHuDgoO72NdkWYGROhn2S67V0ESJgmf35ESHjm4ZDXCDR2ArRNfExBQGcEfxMkZAadN5rvVcJH7Wx56/htgbankSg8n8Zi/N9r4biuVdk2VsRt6OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354125; c=relaxed/simple;
	bh=aBJe19napSs6kyYETHjwpmtrLIRAU1o0VhwqTbuWJL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQyV/qakIjXH8x/Vf+4jjhO9KGcFR7r6E9K/gFVB9gUilR2oY/b7ArmGsxYGlK+80aQibxoNxYDmEPikbZG1BCslL/DvU/h2c6fzGdJb0LwdfsjNqaf5EZQ5albGrtO48EqcAk8cZCZ4YgihPBuynaqq018ozGx/PuATQtIE/ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PI8sTfGj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G24yI95K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PI8sTfGj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G24yI95K"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7NM900713
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wgArOPJwbc+
	DaWtG2tIECGMzRP1R/wtS6y7TeRFG/58=; b=PI8sTfGjNskLcLv8po2SkXPqFNe
	B5qj3LKDL7MZ6jtT60pf0A7+hgt5xsYHjV/yXYbsOEMkIlbcmkGCoLlJ3doGdx4O
	1t21ybT9svpsiOtx34oR4qBgvMirMUw47QHOswcIbnuv2g+fjXhJ4oVliQZCE5Ou
	yql4RgFLJ3UyRPanu/HqHTI+YKpyZKcKPNVTAZNipFnT2MuQzzOrCPrldGG6Wnal
	BkBjsf9V8LEYToAr681yj1cHAWZWYBwayKO6Ue3jdOmSUeqsvCgem3tGcRB/Dcaw
	6J4smeiyz9Ah4l7YsfEiN1lV9Hb/kIfxHoEbyHchyPZ9LGBRTDdVyq24OcA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7jbp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:08:42 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59d595bfd94so1153341e0c.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354122; x=1783958922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgArOPJwbc+DaWtG2tIECGMzRP1R/wtS6y7TeRFG/58=;
        b=G24yI95K3q+dKZ5bFiSpK8xeHrnKkvX64l6BN7ImoX0cjmw6I6RDis7Q0ifJAQRRtc
         p8UMzWNQbudAWOn+jR50Yu8Z+hTiX/CK8MTmr/CiR78YXfvvr6UoG5j7tLnIezFuDWj+
         1dCOoYm1cD0vLxzOMtuJj2tlG1fgBRtCrUaJJCRFQwBnpb9DT7JJ0bi7AM3+fhmFwSoL
         LXOslCUJDfdCwG9AmIz274AFT4kmbQjYNdDGkBReTKgj3OhPeH1CLsOjV1eHSzCFazHz
         boUXKsWP/C6g0zV5JNAzrgxTPCM43acapeSeDz3vUWWS6QnQF89CKTptpFMoP0LUN/kx
         HuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354122; x=1783958922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgArOPJwbc+DaWtG2tIECGMzRP1R/wtS6y7TeRFG/58=;
        b=qOalpUq1hSP/3gwPzI29A0dy9x8jJGcHKin5pSX2AwiMy7utHMwYs2sChK4JfsgKFz
         8779whXLgDDhEmISXSI7RpQXopUJ8ye8Tw7R2IK9M/3LA4mtAGaNOu4eRZRs6aUBIBgp
         OGBXBLQP12q6jD0cY/14eys7NmsqDEYhPr28fcN5h9RxBRVyiMRmWIIlYyZTTb0D4brD
         w2a/Jmgk/fgnRoeFcQnb/U+w2dD9Cs7V5iHE/XVuD2rBfiiJu++a7eGjJwq97KuWHjzR
         VQhgT9kZgu9wddfkeJwcTptXOw4ij94Go6GmtkIQyNJ72q5DDSSljQKm3zqbCF4G6rxM
         htqA==
X-Forwarded-Encrypted: i=1; AHgh+RoQOiKJeURj1+v31jurz+KO32wkMpUJc7s36Va77ofQLpx2ZXDR+8eYjJJ8hPDFsbtBixYgzpBKsFGf@vger.kernel.org
X-Gm-Message-State: AOJu0YzXZCkENhwYCUrittwITqPIEqt/TlXewd14+LKVjeSnwqtUEMGe
	6Fi5qvCjNVgdtV9E0W+dKdBgRHYEgw4J9zTGY/RcwRNVV0hElrl7z3GnqKVJAtSgHI5NHW3en/A
	rmPz7Ro3h98PZvo/EiAR3+2vtRQdXoBqRAzkFqqvB2jVAUwcd3luMCAyBXC2e6yRb
X-Gm-Gg: AfdE7ck8YY6sknmJ3ff5/xgOlMzcbXEdW5dDlBMJQTR34FvpgtfdM2jIogkhAQlH1RN
	sItLoq/Mkp6iQ4UldhWtIE5gLhOztXXQoijnv6ZpaGCgOqGH/Ni4S8YMZ0mCNPDfGNu02axfUtd
	zD57fvC2ic0J63y8TQaCZD93Wck30hZz3UbdL7Gh26A1dQU+oY/RroQ3A8EhIdOYNdx/gOvW2ut
	ynUORo37ZNZQsYJHYhB/QiorGgkFE97nFIPEfPBArdmahzWYcvqnPdITPiyyL3iUeOw55RsSN+N
	3SKxX/p90VWnJXZ6GGHM9ZpkzY7+nqMVecZzGis0M5ZxPMvsrqErvPKpRFTOmFDBGeMGdFc/U4Y
	Jg3cdfg7Gajyj4YZ2+7u6uJ579dOUCfwcObkHRcjjvP5TvQ==
X-Received: by 2002:a05:6122:1793:b0:5bd:fc20:b7ed with SMTP id 71dfb90a1353d-5be90755ccfmr681095e0c.7.1783354121634;
        Mon, 06 Jul 2026 09:08:41 -0700 (PDT)
X-Received: by 2002:a05:6122:1793:b0:5bd:fc20:b7ed with SMTP id 71dfb90a1353d-5be90755ccfmr680797e0c.7.1783354119220;
        Mon, 06 Jul 2026 09:08:39 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8405:4a9c:95fc:4b8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm26071966f8f.9.2026.07.06.09.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:08:38 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v4 1/2] platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures
Date: Mon,  6 Jul 2026 18:08:28 +0200
Message-ID: <20260706160830.17698-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX9YT7G32Tz/nR
 w8ta3EiNWYDJtgRNeemelynd6DLfv0yjW2/GwSf2FcGna1a/1/MWd4jgEd+5FZL/cnZfK/Xb1im
 95oexeNMfjMeAs5VdgWXVMRYSKLQNsABI8MSWwgFbsxbMiHRuNDUeoLB8f7a0mQqhNJCNBL78eq
 ZI+VME81Ha2wnbUWprSKucSC8rrgclCONZ9j2kXL+l1LaqONIZn5kRC3i5+opdU4IjCmXUuTVBl
 D/mJpdgdFQQnG0V0R+FKCJyHqJ0Ic0ChYVqF5cX2/SCMdrGJmONVf++m/Li8bNkUosyX3hoMr+b
 izmd/QkrIenNX1QCxs5D4GrAFekNmUUl/UW+cBEGHSMENkAyLeM7C/Yn59b28+/PrfNAj5RoNpK
 E0SWZ+GzO8/esmhcdzdvaJxpmZYd+tOX/AggwYsqQEDXjehSy8NgNQOwjf2pzkeH17cP4yM/sAK
 IS9MGyMEpC752H78mOA==
X-Proofpoint-ORIG-GUID: ZL2MMAaNYpC7hqV9gYycyvfunXkaSS1B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX3ph+9dRCODFj
 ZPVIkb8D1twAbZC6wLM+/rcfzbI6OnzeIxbSq9Y8AdUEAWPsD7kFqoh3nMh1Le21tpvx57mZY5l
 VHGUPxD3aRdoliMgEf+yCKgIB3DsTwk=
X-Proofpoint-GUID: ZL2MMAaNYpC7hqV9gYycyvfunXkaSS1B
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bd30a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=9Fj74KSAFJAma6AI3IUA:9 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060164

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures.

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

