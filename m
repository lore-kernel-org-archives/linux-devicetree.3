Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CDD3E5589
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335332; cv=none; b=hUz13ncUYs9+B6MYcJf7X/S+qH6jA+SBRxZ920Z5WwmYJ4/IWS6wUwTKPSAZWjlBlALtI06nAxpd7LfEL4s0joGThDwzM1usDrRZLKDnlfgFQDdZohRC0spboYoJwgeir5rJiONvB5HjrdIAjABqCYhimIvgK2NAFVToL4tfHCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335332; c=relaxed/simple;
	bh=YN71vB5TNvRZHNOUlfHwKLfcZQHkRE2nTU84RRDUJLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxFz7eQZm1zVAszp4g+YPze9Dsyt8GydE2+B9xYwQj3PH0pUN0dpLq6NMk60GNBgZAYhVDkcJM2xP5mBTnsyEdi/GJuG41AUPepzlzJ/PRcfnZAHDKL8e07y0PlrCVroYdEWKAtQfqZQfEbpiCKsh14ZAEtm78qzKlLjRuTh5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sm5HRmGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/z01eg5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sm5HRmGO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/z01eg5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJit1E3827590
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hmF4GeGvvM9
	dJdB+Z7GNN+bPdXgJkQupqVRBWjz1QFM=; b=Sm5HRmGO3Wd4QvIQg4PnF1BhJX3
	em6knUfynpQpkS2Dxg9GaKZiBzf/2box3qk4/5DnEtE1FwArbitrRfKd+06dy4qG
	Qlen68Z+xDCDFAfp2vt00Mly07VRk2ZyOsAGokkhAtJHsnIPuucKIUGn0plDPKHf
	MSixofy/Ytw0B7vYXCS7SsCKvMUJ4kl46IAovNBPbJS5g3+Iyox/V+BRvYK3gjTM
	IKn2kq3usAzCvNcpbXBHaP01Kxh1tDY4332/jla034uZoIut2iyV33Y8DXgL6w7k
	tRNrvBbnkje7O04zUf4kFJRFQKHzWbSZB1UsWvqpKUlhfCwaToWcwvsCEYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbrhkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915d3261c5cso237652485a.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335326; x=1782940126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmF4GeGvvM9dJdB+Z7GNN+bPdXgJkQupqVRBWjz1QFM=;
        b=e/z01eg5zc5CeXeuccvQqumZGlb6/ZHUnm7Ua7o4Xx6YqSZG9LLT+07+ZS0jMR4q6w
         IpMcTH6t/eKM1n7g7vqVUmGdB1jQejHHRZLklxYGtJdK1bq34oKTqVRJBO81imVsg3gP
         Dm5oiwXsGG4ag0ajP58iJQP6+MhK2Esx3RyYWjhK6a69J68BLBEDHJawgywKvZ4w33iS
         FEWht4ceM7H+SvYdmt3rIc7M9fFC58xhXcVWqmJows61EMrGVy9z5+Hm9TxqhIIKRDSR
         Ghn07X9y25NhLNv6SYtFUYF9Fmaf65hGGcn5n7TIy+J3Z5bl5TQY/lFHxa/JUenRs24D
         WOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335326; x=1782940126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmF4GeGvvM9dJdB+Z7GNN+bPdXgJkQupqVRBWjz1QFM=;
        b=oxiPWn9CL4B/hlGAEltILAgJOF08n5DMxiyXMarXxOlAUzxaTwd0d11zwe9svz2ZaF
         bSFh+XJkKe4oCs8ZyYeLIm/IcDgT+ifoqTmE00LvecFBS68madYcR9G5y6cyL4o9rle4
         H/W73R35N/wzVdRsYZ6l4cKpIk8OtZbLNMDxvo/hnsUJuvFzy/mA9ZuWxysgZ4/2gZvc
         lhjvT88IpNUqwxOk13opFh4um6QhG0Us0dILY9Dt8TbpEoMmlKZm+PaUAmmK4Y4YGznI
         7aftoY3NqXq/OJVa5mNnXz05tJ8rPvutpphp8rmnSPy2BsVtyHXJUf1lUgUD9U+hGa5O
         faxA==
X-Forwarded-Encrypted: i=1; AFNElJ91OW3pfpp6SEW4QxaiZhmh+oe786+9PS5jkzvnC5hTq8cYxLg8sv4N+EjOF8OBXs05IGUxTu4Nir9l@vger.kernel.org
X-Gm-Message-State: AOJu0YwvR/UGA65fWIeiTuGOlcZfFBwcn6q30V83SfoYJlovDfbkrze8
	QwJPPzgmQ1VqAMn/AmdQ/KPTuwjgOILOCGIIzsWXV/OPE1dS8cIceevsLzP4DNEb91eipi5BATX
	Q9SdRUIwOeiKCfLa2sSAB6eI32JZoV+oBwgLlcpL1V9Pd7DzYuZFZEg7MowTppUju
X-Gm-Gg: AfdE7cn7otuMvyuWYvVn7FfhZqAOlzERwu67stDrwemlJEfGyJvrAOet9l54GtiillC
	7dd5V0/lQIOopMv6YmNk/n8Z0zUjTOHyycsi6PrQJ0AcPDvIfAuw4vmJh5T9d940eo0uu4aeJSj
	RNs4KBFQ2Dhnu/LMZRG9WOF4GfQe+O/C6xijcALfRLKM1epFo1gahuePxsm4PJA1jWD3sv/NNEI
	3bm3DX1GvOhvMuENMWFneziS6PrG3Hd2+nwTD8cJBBXc/IRcWwH+OdtK2Wp9qo/5xTXmI586jKn
	nvsFroATzxOCluWFK/a4d6aLwYxnRJMe2P+iZU8+H4cCwrCaPhSQdM21NGvkcHAyeCueJnpd59z
	lslWgq8i1ygcG8qzp8dDBSe52gVKbfmNFu9b/YBcdE7xnvA==
X-Received: by 2002:a05:620a:4623:b0:915:9273:9237 with SMTP id af79cd13be357-92781340d3fmr815922685a.10.1782335325671;
        Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:915:9273:9237 with SMTP id af79cd13be357-92781340d3fmr815914585a.10.1782335325054;
        Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:44 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon support for temperatures and fan speed
Date: Wed, 24 Jun 2026 23:08:23 +0200
Message-ID: <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX1CMh5TQVhG3S
 58R0E8eLQNCDPrGXj3p3G2T7Nz3UlRyNs6c9jB5MvguQGdYEYPK6wQ5gNMtWZI13XzKSPT4mh8c
 cYYcKOODYLa1OqVQsHciiHfpjHG5tdQ=
X-Proofpoint-ORIG-GUID: BnUq8z6HCV3RVPQZcqxXr3sLi7zJqJgy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX+kl/rdxUCHjv
 4Taz+lzVjyvlfpOtCUcv4BSXatQso47QRX+87PSGHin+8OT+M74/0/ROKKgGsiK3cOY5Ifl6oSj
 /xWLIPdyrgY5RIgsqv2maszdx2aZLBAkkmkzAbwDZG1y25ANyaJiKp14K+2x/2IsquqLdLlD5a4
 C0oPcrq4XzgZNK9GZ/oMKrzIu3jbg7e2cOAzWvEjaExTD8bfcJAVvGLIv52Moc/itftLodcr+ia
 GXxZK24gFlPx8Z4X3DA9wVCOCfstZbe1RQJW1hqKo9pckv8kC5alSYREPHbEqrdtBqUA/cC5MY4
 BCUfE+rBMF1OeSGP3xdyNk6aC12VhtmXdme1+wBkP8TgVkuVFAvEpHmGI2Le/Kiqxm3Ht8l1egt
 t9w0wVAFwMOOkx0Iog1KzZt/qH5XWHtD4KVfxF2tzw4Ant6LfL4Ywqe9arqR7iQTgKyYxgnGcKH
 LQuMQy12lgXyRzzAMdw==
X-Proofpoint-GUID: BnUq8z6HCV3RVPQZcqxXr3sLi7zJqJgy
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3c475e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=dabdHXUdFSiLoprLzZ8A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240177

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

Additionally, expose the system fan speed by reading the fan RPM
registers from the embedded controller.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures and fan speed.

Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..142464623f0e 100644
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
@@ -67,6 +68,16 @@
 #define T14S_EC_EVT_KEY_FN_F11			0x7a
 #define T14S_EC_EVT_KEY_FN_G			0x7e
 
+#define T14S_EC_SYS_THERM0 0x78 /* SoC (CPU+GPU)  */
+#define T14S_EC_SYS_THERM1 0x79 /* Keyboard       */
+#define T14S_EC_SYS_THERM2 0x7a /* Back cover     */
+#define T14S_EC_SYS_THERM3 0x7b /* Charger / PMIC */
+#define T14S_EC_SYS_THERM6 0x7c /* QTM West       */
+#define T14S_EC_SYS_THERM7 0x7d /* SSD            */
+
+#define T14S_EC_FAN_RPM_LSB 0x84
+#define T14S_EC_FAN_RPM_MSB 0x85
+
 /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
 #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
 
@@ -93,9 +104,19 @@ struct t14s_ec_led_classdev {
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
@@ -555,6 +576,128 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		return 0444;
+	case hwmon_fan:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static int t14s_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
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
+			*val = value * 1000;
+
+			return 0;
+		}
+		break;
+
+	case hwmon_fan:
+		if (attr == hwmon_fan_input) {
+			int lsb, msb;
+			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_LSB, &lsb);
+			if (ret)
+				return ret;
+
+			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_MSB, &msb);
+			if (ret)
+				return ret;
+
+			*val = 0;
+			*val = lsb + (msb << 8);
+
+			return 0;
+		}
+		break;
+	default:
+		break;
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
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
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
+		{ T14S_EC_SYS_THERM0, "soc" },
+		{ T14S_EC_SYS_THERM1, "keyboard" },
+		{ T14S_EC_SYS_THERM2, "base" },
+		{ T14S_EC_SYS_THERM3, "pmbm" },
+		{ T14S_EC_SYS_THERM6, "qtm" },
+		{ T14S_EC_SYS_THERM7, "ssd" },
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
@@ -590,6 +733,10 @@ static int t14s_ec_probe(struct i2c_client *client)
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

