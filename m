Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8612EBBB9
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325748; cv=none; b=oCCGbj6C5ov9p+J29e2+Vh9WvAZYJQH+TkXg7Bh8f2ivDLFlK+JJ5iw+JHJVDLr0FvVVgZtJhgrEOgP6AL7oKt7sHHNRXgevxfLAX4lA8jYMiogB4HizoxOK/9jq4b1RjK9wsh8ErzG5J3fM6NSoAI1bt2+ZPkLoC/Fm6C9rY00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325748; c=relaxed/simple;
	bh=flF3gM+ls8NCC15Kl05QZuJECqecVFLFSPOIUecbqQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPl6r/PuLShblVFpS6OmcFFM7sSkNFhKmumvfNdXtDpHY5qzBVll74pExs0zNcRU5PjWk7QYAVuH+ia3soPZWIewbQ7SDjM4WBrkmD10SJpIyctGYHP2S3yjOf9/j4Zk0Gyqmy5zKD20P9EaLWiBUe4tXVWQtJNxhRYOAfnrBMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSAfBTHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oxd1xfGQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSAfBTHq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oxd1xfGQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641ZZD3614039
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sMXAEt1UU05Yx+F3i4P8rVl8JdgR+Ujt9uqqKvjo26U=; b=kSAfBTHqcsfGzXIf
	LVxusbGWCzUIB6mNjmg0UByI26D+JEYIN4wGu81HvzcZcxU6lQyW2qqSgZYK1JPL
	hWq6SCLmo4UIS8Fm0AQvwesGyo/pD+EhW06Uy/d8/32SGU0NjdST6Bg+Njrewe3p
	uqgfKJBiwMJrWKfaFdMkpKE4Cr6stYvuz+T93Z0W3tibusaHZJQirW/zPmw6Akni
	LSSjUBleXp0CmLLgaF8p7KVrSiI+FSStAlJNouZrs/iRGuhDPm4DSQnb7Mjc+E0M
	AxXlfarKxjVLgcXGn7fxnculKgaPMvvMq2KQrJgpYjTEnroZtsia1pNu+vBNytZ+
	DX/iJA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvn9k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:15:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89956023dbso3509233a12.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783325733; x=1783930533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMXAEt1UU05Yx+F3i4P8rVl8JdgR+Ujt9uqqKvjo26U=;
        b=Oxd1xfGQF8kRtz58nYWnCbhN/CCZ2TRsx+0dc9+QQ0PysRNpRD/ajLVpE7lRdcpmts
         OuZib2w5QWne0j8AQ+uqXoVERNTXKqIswFEUunqUM5VvHkfOpRD1Y+H2kABoOhcK8xS8
         7tJt4xQ8S5pYAEKY/BOQTmYTgKwl2GfzQ6Y9tmrEZGsS9oZH9c+YazobGd4xbGnUnpGA
         NMvMbsxlqvP1P6t9GEJAkgBQcshS9+JrY1wcU9l6u6cJ6cD8jKhfsQDr6qxx0M4HJxot
         6FB/vq5gi5pGGCM8tVxqnYb/q1imAXobH7BQDZDZ19IkU3T7odK0t/3q52tBngFw2WLZ
         t1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325733; x=1783930533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMXAEt1UU05Yx+F3i4P8rVl8JdgR+Ujt9uqqKvjo26U=;
        b=rzLVC9xXbuE5B3u3zUSRzl+wN4+Ed3ymd9ZrpzhPqIu8MPflhOUNhosuVpoLU3s/NS
         GhTGy/Q6+2/kUbljxlCwTQegoEgxfZ36L/1CvQzjP2Jva1wKe86AL255MAGEYhQ+6lYC
         9QM7Pj1XYNPEbgsVo1YbrLTFyQeAJV1u9Ar3i59l76ZRyaLobWO7Tm24dD5TLUmrx6R1
         UhgJLslr3FoFomlVhycsHLkkd+TH1LtQlK/uqqEu7aye1Q0QIkpZcLxiyzMZZWagRP4+
         4X/rZkUzgHIAiHqUpo8NUpLiN4V8f1KXC9WBPB5oqi8ewI8bxhfYxUI6CpIrJk4Vxi+3
         N6BQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/SmIGwuhVFHmxKkDB1xeEAZRozckMv0I4OGAxSI3qVNMOXs9Onoixjz+4C+Cn9LL5AFqNSdQPwU8f@vger.kernel.org
X-Gm-Message-State: AOJu0YyCcKoV3+BpwDjtgrlvdXAHmfZaAyLwZdOpOs0mKTlImXLyxcRS
	ZScQvDtwns7bORG0CbQv6Il7VVG3dzCSHH72RxwoGZdzkMg3HSSSi+BSMMFHZOqDOeIqcHIKQuA
	D3aY7wu1t/4d+qrWKTcN+MRG2XlNxGy5aPtp7e9oDU7L35PGL+rWjQhoa1XUup3qE
X-Gm-Gg: AfdE7cldXgXzsH5H6rjVUQBwreZYw1ivRQEfCa5+RZTfSwiU+YlZQ6iKTRG03/b95mT
	8180lh12/D8gJOdcAYWG/KP2+v3/6IRxA8zubjnoFDaKjkQhrh5dsgvhxwID6wY+Sivfuiy6woO
	CnP6wVPBYSS52igxPn2xQskbxqEZOsKo3TkYOaLD8YGiM/FYeCkv5iyCZLbjxBwQdBwcJ+3j8k6
	pL7b53ewE1c/XNvqIkHedMEuSyLqDKgifybN7iuiKsL37OAZ22w/gAlcOZQtq8Tg8u68bCtpHLe
	+HnBPBNQn3yz0vG/rQZPj1lGsPlg9pcf6ZOg0oY0u6KABCZTGscztfAV4lNmsc88aiMCDOImQVM
	+Zb5c53tGf3fZAeqWlGEBEhSZbJh0EwKLjSEeZgpiFzc=
X-Received: by 2002:a05:6a21:4903:b0:3bf:49c8:f73 with SMTP id adf61e73a8af0-3c03e4a330cmr9309356637.35.1783325732951;
        Mon, 06 Jul 2026 01:15:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:4903:b0:3bf:49c8:f73 with SMTP id adf61e73a8af0-3c03e4a330cmr9309110637.35.1783325729031;
        Mon, 06 Jul 2026 01:15:29 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f4cd4b1sm5584525a12.12.2026.07.06.01.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:15:28 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 13:44:36 +0530
Subject: [PATCH v2 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
References: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
In-Reply-To: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b6426 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LIlL8iqg20j2UnsMqcUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tvm0Bbf6QhJR6AjaQVN3_t8CiNBpLB6U
X-Proofpoint-GUID: tvm0Bbf6QhJR6AjaQVN3_t8CiNBpLB6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfXyFEWEesY/uz3
 rc96myXtzdDXNRZSxL+I4jn8r4SrOPs4moMty5Zxa8tNsYtS2uKTC+LU0nQyHXZtRMmKkfUCDlo
 sUb04edWtwCTluXW4VlWI8vp6rF1IyUzL+vgodw6cZRhaNB+aWcpHLKSUhVM+fp3Cgur2j8jkyL
 HBpR2Ksev0mdEanKCrIs9IDgRzzL2Cz5iZAH0GYzx1GpchI4GzkOy/fThAOFErOE0CsOuHxUzoN
 k4EtpC6FHZWe07tF2yMo6c6a8g+hirXQw580ZURopT8m9oXvuElB3I+IS7XbA2pU1OrimiH6xGt
 1+E1q6yZ9ZgmQdLAPKmUuf9omQVeXs2j5nC4rMw2VdUqowi/sk5pBzBTJsIcPvpxusaFkt7PSGE
 tPiPi0Oa4ZMaXvEuQVpM5hlA3+ZdAqMIpx6k1ZHlURJZ6DJ8r2pC1DYk96ezUvUky/d7MhLtGV+
 Gc4lnpMfdFnFfzOiwhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfX3EwW9ywFT2ML
 HIQp0H6sOtnufDg9e8zstTQvqh/LjKD0Fr0K9XrQXu4vqMyADN6E8S6O93XBfi+lBF/JprrWDce
 +hnIki8gtwjo/sTY+0hPyclKC5fpk58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060082

From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

Add driver for the Qualcomm MBG thermal monitoring device. It monitors the
die temperature, and when there is a level 1 upper threshold violation, it
receives an interrupt over spmi. The driver reads the fault status
register and notifies thermal accordingly.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
 drivers/thermal/qcom/Kconfig            |  11 ++
 drivers/thermal/qcom/Makefile           |   1 +
 drivers/thermal/qcom/qcom-spmi-mbg-tm.c | 256 ++++++++++++++++++++++++++++++++
 3 files changed, 268 insertions(+)

diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
index a6bb01082ec6..f2fc24a3096f 100644
--- a/drivers/thermal/qcom/Kconfig
+++ b/drivers/thermal/qcom/Kconfig
@@ -21,6 +21,17 @@ config QCOM_SPMI_ADC_TM5
 	  Thermal client sets threshold temperature for both warm and cool and
 	  gets updated when a threshold is reached.
 
+config QCOM_SPMI_MBG_TM
+	tristate "Qualcomm SPMI PMIC MBG Temperature monitor"
+	depends on QCOM_SPMI_ADC5_GEN3
+	select REGMAP_SPMI
+	help
+	  This enables a thermal driver for the MBG thermal monitoring device.
+	  It shows up in sysfs as a thermal sensor with single trip point.
+	  It notifies the thermal framework when this trip is violated. The
+	  temperature reported by the thermal sensor reflects the real
+	  time die temperature through ADC channel.
+
 config QCOM_SPMI_TEMP_ALARM
 	tristate "Qualcomm SPMI PMIC Temperature Alarm"
 	depends on OF && SPMI && IIO
diff --git a/drivers/thermal/qcom/Makefile b/drivers/thermal/qcom/Makefile
index 0fa2512042e7..1bec2746b98d 100644
--- a/drivers/thermal/qcom/Makefile
+++ b/drivers/thermal/qcom/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_QCOM_TSENS)	+= qcom_tsens.o
 qcom_tsens-y			+= tsens.o tsens-v2.o tsens-v1.o tsens-v0_1.o \
 				   tsens-8960.o
 obj-$(CONFIG_QCOM_SPMI_ADC_TM5)	+= qcom-spmi-adc-tm5.o
+obj-$(CONFIG_QCOM_SPMI_MBG_TM) += qcom-spmi-mbg-tm.o
 obj-$(CONFIG_QCOM_SPMI_TEMP_ALARM)	+= qcom-spmi-temp-alarm.o
 obj-$(CONFIG_QCOM_LMH)		+= lmh.o
diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
new file mode 100644
index 000000000000..fa2f10002253
--- /dev/null
+++ b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/thermal.h>
+#include <linux/iio/consumer.h>
+
+#define MBG_TEMP_MON2_FAULT_STATUS	0x50
+
+#define MON_FAULT_STATUS_MASK		GENMASK(7, 4)
+#define MON_FAULT_LVL1_UPR		0x5
+
+#define MON2_LVL1_UP_THRESH		0x59
+
+#define MBG_TEMP_MON2_MISC_CFG		0x5f
+#define MON2_UP_THRESH_EN		BIT(1)
+
+#define MBG_TEMP_STEP_MV		8
+#define MBG_TEMP_DEFAULT_TEMP_MV	600
+#define MBG_TEMP_CONSTANT		1000
+#define MBG_MIN_TRIP_TEMP		25000
+#define MBG_MAX_SUPPORTED_TEMP		160000
+
+/**
+ * struct mbg_tm_chip - MBG thermal monitor device data.
+ * @map: regmap for accessing MBG thermal registers.
+ * @dev: mbg_tm_chip device.
+ * @tz_dev: thermal zone device registered with the thermal framework.
+ * @lock: mbg_tm_chip lock for set trip temperature.
+ * @base: base register offset for this MBG instance
+ * @irq: interrupt line used to signal threshold events
+ * @last_temp: last measured temperature.
+ * @last_thres_crossed: indicates whether the last interrupt crossed a threshold
+ * @adc: IIO ADC channel used for temperature sensing
+ */
+struct mbg_tm_chip {
+	struct regmap			*map;
+	struct device			*dev;
+	struct thermal_zone_device	*tz_dev;
+	struct mutex                    lock;
+	unsigned int			base;
+	int				irq;
+	int				last_temp;
+	bool				last_thres_crossed;
+	struct iio_channel		*adc;
+};
+
+/**
+ * struct mbg_map_table - temperature to voltage mapping entry
+ * @min_temp: minimum temperature supported by this mapping entry
+ * @vtemp0: reference voltage or ADC code corresponding to the temperature
+ * @tc: temperature coefficient used for conversion calculations
+ */
+struct mbg_map_table {
+	int min_temp;
+	int vtemp0;
+	int tc;
+};
+
+static const struct mbg_map_table map_table[] = {
+	{ -60000, 4337, 1967 },
+	{ -40000, 4731, 1964 },
+	{ -20000, 5124, 1957 },
+	{ 0,      5515, 1949 },
+	{ 20000,  5905, 1940 },
+	{ 40000,  6293, 1930 },
+	{ 60000,  6679, 1921 },
+	{ 80000,  7064, 1910 },
+	{ 100000, 7446, 1896 },
+	{ 120000, 7825, 1878 },
+	{ 140000, 8201, 1859 },
+};
+
+static int mbg_tm_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
+	int ret, milli_celsius;
+
+	scoped_guard(mutex, &chip->lock) {
+		if (chip->last_thres_crossed) {
+			dev_dbg(chip->dev, "last_temp: %d\n", chip->last_temp);
+			chip->last_thres_crossed = false;
+			*temp = chip->last_temp;
+			return 0;
+		}
+	}
+
+	ret = iio_read_channel_processed(chip->adc, &milli_celsius);
+	if (ret < 0) {
+		dev_err(chip->dev, "Failed to read iio channel with %d\n", ret);
+		return ret;
+	}
+
+	*temp = milli_celsius;
+
+	return 0;
+}
+
+static int temp_to_vtemp_mv(int temp)
+{
+	int idx, vtemp, tc = 0, t0 = 0, vtemp0 = 0;
+
+	for (idx = 0; idx < ARRAY_SIZE(map_table); idx++)
+		if (temp >= map_table[idx].min_temp &&
+		    temp < (map_table[idx].min_temp + 20000)) {
+			tc = map_table[idx].tc;
+			t0 = map_table[idx].min_temp;
+			vtemp0 = map_table[idx].vtemp0;
+			break;
+		}
+
+	/*
+	 * Formula to calculate vtemp(mV) from a given temp
+	 * vtemp = (temp - minT) * tc + vtemp0
+	 * tc, t0 and vtemp0 values are mentioned in the map_table array.
+	 */
+	vtemp = ((temp - t0) * tc + vtemp0 * 100000) / 1000000;
+
+	/* step size is 8mV */
+	return abs(vtemp - MBG_TEMP_DEFAULT_TEMP_MV) / MBG_TEMP_STEP_MV;
+}
+
+static int mbg_tm_set_trip_temp(struct thermal_zone_device *tz, int low_temp,
+				int temp)
+{
+	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
+	int ret = 0;
+
+	guard(mutex)(&chip->lock);
+
+	/* The HW has a limitation that the trip set must be above 25C */
+	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
+		ret = regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
+				   temp_to_vtemp_mv(temp));
+		if (ret < 0)
+			return ret;
+
+		ret = regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
+				      MON2_UP_THRESH_EN);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_err(chip->dev, "Set trip b/w 25C and 160C\n");
+		ret = regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
+					MON2_UP_THRESH_EN);
+		return -ERANGE;
+	}
+
+	/*
+	 * Configure the last_temp one degree higher, to ensure the
+	 * violated temp is returned to thermal framework when it reads
+	 * temperature for the first time after the violation happens.
+	 * This is needed to account for the inaccuracy in the conversion
+	 * formula used which leads to the thermal framework setting back
+	 * the same thresholds in case the temperature it reads does not
+	 * show violation.
+	 */
+	chip->last_temp = temp + MBG_TEMP_CONSTANT;
+
+	return ret;
+}
+
+static const struct thermal_zone_device_ops mbg_tm_ops = {
+	.get_temp = mbg_tm_get_temp,
+	.set_trips = mbg_tm_set_trip_temp,
+};
+
+static irqreturn_t mbg_tm_isr(int irq, void *data)
+{
+	struct mbg_tm_chip *chip = data;
+	int ret, val;
+
+	scoped_guard(mutex, &chip->lock) {
+		ret = regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS, &val);
+		if (ret < 0)
+			return IRQ_HANDLED;
+		if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR)
+			chip->last_thres_crossed = true;
+	}
+
+	if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR) {
+		dev_dbg(chip->dev, "Notifying Thermal, fault status=%d\n", val);
+		thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);
+	} else {
+		dev_dbg(chip->dev, "Lvl1 upper threshold not violated, ignoring interrupt\n");
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int mbg_tm_probe(struct platform_device *pdev)
+{
+	struct mbg_tm_chip *chip;
+	struct device_node *node = pdev->dev.of_node;
+	u32 res;
+	int ret;
+
+	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = &pdev->dev;
+
+	mutex_init(&chip->lock);
+
+	chip->map = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!chip->map)
+		return -ENXIO;
+
+	ret = device_property_read_u32(chip->dev, "reg", &res);
+	if (ret < 0)
+		return dev_err_probe(chip->dev, ret, "Couldn't read reg property\n");
+
+	chip->base = res;
+
+	chip->irq = platform_get_irq(pdev, 0);
+	if (chip->irq < 0)
+		return dev_err_probe(chip->dev, chip->irq, "Failed to get irq\n");
+
+	chip->adc = devm_iio_channel_get(&pdev->dev, "thermal");
+	if (IS_ERR(chip->adc))
+		return dev_err_probe(chip->dev, PTR_ERR(chip->adc), "Failed to get adc channel\n");
+
+	chip->tz_dev = devm_thermal_of_zone_register(chip->dev, 0, chip, &mbg_tm_ops);
+	if (IS_ERR(chip->tz_dev))
+		return dev_err_probe(chip->dev, PTR_ERR(chip->tz_dev),
+				     "Failed to register sensor\n");
+
+	return devm_request_threaded_irq(&pdev->dev, chip->irq, NULL, mbg_tm_isr, IRQF_ONESHOT,
+					 node->name, chip);
+}
+
+static const struct of_device_id mbg_tm_match_table[] = {
+	{ .compatible = "qcom,pm8775-mbg-tm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mbg_tm_match_table);
+
+static struct platform_driver mbg_tm_driver = {
+	.driver = {
+		.name = "qcom-spmi-mbg-tm",
+		.of_match_table = mbg_tm_match_table,
+	},
+	.probe = mbg_tm_probe,
+};
+module_platform_driver(mbg_tm_driver);
+
+MODULE_DESCRIPTION("PMIC MBG Temperature monitor driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

