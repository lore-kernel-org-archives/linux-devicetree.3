Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F5C511E76
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542180; cv=none; b=WOl8kSfuIEEGeaoG8vMXvPfp9Z0l1Bke0YwsqWeteFL4lj5NsXxH6QYwvkKLbbXM9ZjknLVZGVws59sJja7WhRR8tYXD7/wzEZi5o2dWkPxQG3llhgkaj8HYeABprsuVPUbXPL2//m8akwTntfdtUTMw5tHbd/BPL1+H6SZP8rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542180; c=relaxed/simple;
	bh=rcZ0lRSJqY/vDL620Ng40HlL3J3oAsbD69VlVp7JN1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxFGNCq35UxBF+xcd5FjXVlg4n0L41O3FmWyLxcto5u2j1MZZeu0cUZkxHNqO+AfQVRgc6zmIwAoov5f8+5hxAwSCANCD+mjwUiQHpZOYKNPMeizuIjmF5lQaxip72sqNWoS6rgSBii+YthPxQg1L7FRkjQI5uJGxsTvWhMKrb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+Bb0qQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bc2TFSJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+Bb0qQn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bc2TFSJb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiSZY195837
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 17:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tFo2mxlAP2miNsca0zglZjL9NqIFeGnkjNs1IEzEBo4=; b=f+Bb0qQnIUN/JoEr
	V0FAY5MvMC4lFNKr+9mXc2c637x39HuQ5UpIxj3zduRSzlJC0oMAclOuK9MJCo2N
	B8OG39Y6F//Wfqo3qEi6YoigNpQGYEUZc8DGLlT0JwdQt+xUQ8TRQje5FG8Gho4S
	hocSp3ZZaVokXYZNADVTYDVmcFDE4YeC42Ui0p80DNNu52S0TFG381DrE64NP46i
	/2bSfHC3Ls+r9f6DgeFSg0VIx48647BUZtWKMS2UkLh8Y4wlxd+a5adKmoo7Rlxz
	Sc5Ez8XmlqjvIuCNIW7FS8qgXmsM+cO8K8q5pSrrLwFF150dpImM3ZiHJhZWcQdz
	c7gpvQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg01214vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 17:16:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73858d44c8aso284633137.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 10:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542175; x=1789146975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFo2mxlAP2miNsca0zglZjL9NqIFeGnkjNs1IEzEBo4=;
        b=Bc2TFSJb87yGDTZn+fAb0GWsdDCdRYtGxXw9qskgjh5I5KG6+COcl3NPGofglcvjAw
         P/ZIYbu+JAp8hjX1K7TR8YLsG/5ljkPEwMf7oKsvFqtSctNR0VMd+rE5C5hMJ5ckGCfG
         xykW2Im/GVGxE6B1ozosL2zwzZ9qZC0rAGFG/3jotNrrHO6kHaeHoVA1Why01Suu4dzK
         n9ODZGF9lA15GvILsAy1bOZ1P4zxvqhDHUoCoxlhBbtS6pHJ5P6fo71XGEoWXYL78ApO
         IcKTqhGuk0O8iJIGu7m6HaTRR0IrH9VyxDYwEQBRhJ1tyexqIpmupmy3kiyoAgdvIJOC
         zGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542175; x=1789146975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFo2mxlAP2miNsca0zglZjL9NqIFeGnkjNs1IEzEBo4=;
        b=f4SMXjlXqERAAYwIgAFcuLDXjYvKXxL5AxlPe7eBr+2Tz9lPvlS+ckz1Gi5FrG/LU7
         lcadsmKzqqd1r2p+h9kuXbSnMvLRnzB0qt/eswWdwwJZwf+he76rxAqCiGOlu5WWqMro
         2h8U7kwrv6dJWHPEKGMGSiwX8AVp/Fh+IeF6Joq8mRF8fulVUYawcntynnFUjvOYJrpt
         NOY86etqCJRVvHYEusFN+M4T9HYLBrip/HDTYxVqnh6bs9hdxB2hhNk7QKhoDYQTFvQW
         NJsHsWnRbHjC/YB/C8SFitoRv0AwhhR58BBtuP6Z2vX6ziK6R2jASQBMqRXd5kNrSGEB
         XqVg==
X-Forwarded-Encrypted: i=1; AKwUvBxqgowBoeE7uq7TobMMMjd857yWaiJ1j8PpR3j8zWGOL9pKOI8TgAwpQLjwY/JuiNDaQmJkLpsQ50lb@vger.kernel.org
X-Gm-Message-State: AFuF++k6HSfgb+5Fd21yrGrqkqlu2Yw/poqhdxY4zCHmw27NViXhJUWR
	a2c3xoYleobWZDnxkQ5T6UVx6kHwC2tncE1gza8QeMQyvvRrZQ6PCMpNkPQNiXgN2GCk/fCOwqX
	CxfY57Y+37pmQ7ESrXzEX86psrIFvlzMI6T9jYdeOit4yFdaDUOftEaDdwGdAkiw9
X-Gm-Gg: AYBFou3ihsWBUVKJt7xvObceszB1yhpWIF7iiVN5ZXvas1ULLpmv0YjNVro3wXev28n
	AMp3yr+X9dAmqHrT3WTzcVlCcjp4vkOYiEG4qnXK2pvy/BALAEopRkcrqy6sZ5GDOZVn0y9ABi4
	Dl+b8MwDzwNGMEHBbZXC4atNhOHneQwQT6BsnHBJVq7RYVfbAHv0D05s4iPnkPz9+h8RUFC4v9E
	9VBT92y+AByTeC0Vr4/LIDiJ7ZtR1UA7JJ2NzOSRLvQwYWN1ltXHX9O+7+GHPHgJKfjO4pYwekx
	W78246K96SJ4YppeGom/f6UccwrmLar4TzqtXuBb/2rhxbZuDdiN9LqT6/+H8SN2z62uLEtRyjy
	KqrrVMkzpX7gtLQ==
X-Received: by 2002:a05:6102:508a:b0:779:dc0d:2b2d with SMTP id ada2fe7eead31-78a4a917628mr2183539137.8.1788542174882;
        Fri, 04 Sep 2026 10:16:14 -0700 (PDT)
X-Received: by 2002:a05:6102:508a:b0:779:dc0d:2b2d with SMTP id ada2fe7eead31-78a4a917628mr2183495137.8.1788542174206;
        Fri, 04 Sep 2026 10:16:14 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm11228935e9.1.2026.09.04.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:16:13 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 19:15:19 +0200
Subject: [PATCH v3 2/5] gpio: tc9563: Add support for the embedded GPIO
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-pci-tc9563-aux-v3-2-5b1449d62ba2@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfXy1UYlQe7iRu6
 JPC4oT3JrjONJg3qYAoK7B7xoBWYkiEJ2WoihRQxi5lX24H22uO2izFKrlwIBUqE4+bhMe9AXUH
 zNOckcuNHFX93fyT+L03Vu2HEFkdEvE=
X-Proofpoint-GUID: _5k5YYKvnE4iEdUx6Zx-P-KrSsAB_cmr
X-Authority-Analysis: v=2.4 cv=LreiDHdc c=1 sm=1 tr=0 ts=6a9afcdf cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=xgoTPrYxRPbxS4DbvaYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: _5k5YYKvnE4iEdUx6Zx-P-KrSsAB_cmr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfX7pqNd8p3/Vhq
 iBD4wnXiJ6YXxpc0BxQHpGYteIfeSqLRFqv8CUvz0lb9H/WKp+zr1FN9OYzI9YL2mMGa+PpjDzT
 mtcGVhx110Xo1RDW9raq0Uk2HzDJ1f6Ja4oJPLL3tixj1XLS8pL5gWSmi1uZ5IEEecuB1LFyNQQ
 DZs4syB+fIzU1tdfa7Shv4of17tt/2+Cgf+D6L6xRFYv01sNSf6YRnCOcEtj6zN5BfhMmgV+omN
 iq1gJuAGMi0/CpbqjiigROlWEH8JJcy2EAbF4NEll+Pc7sIBBu5yGXYImb21/ub/2NvE7hwsVoq
 Z0/X74i4ZX1IXHmLD5IqzsgPIUgs7VC8gtm6wEAst4dVF+izS3DXHSjBo9xH6f4T2d2UYAHfXdd
 AELQDk2s9qeVe+4yh+3GYyCbCCqZAqhvrmOEk7HgNy0/2yuEvJ8dRn0AvtSa/lOJbzyV7pylSjd
 4IBFRpe1HOKn1/T8mQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040156

From: Alex Elder <elder@riscstar.com>

Add a driver for the GPIO controller embedded in the Toshiba TC9563
PCIe switch (and the Qualcomm QPS615). The device implements 35
GPIOs using two register banks: three registers control the first 32
GPIOs (20 and 21 are reserved) and three more control GPIOs 32-36.
GPIOs 22-24, 27-28, 31, and 34 are input-only.

The driver is registered as an auxiliary device driver. The TC9563
power controller creates the auxiliary device and provides a regmap
that gives access to the GPIO registers, so the gpio-regmap helpers
are used to implement the GPIO chip.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/gpio/Kconfig            | 11 +++++
 drivers/gpio/Makefile           |  1 +
 drivers/gpio/gpio-tc9563.c      | 99 +++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/tc9563.h | 16 +++++++
 4 files changed, 127 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8edb..2179eaffcc48 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1830,6 +1830,17 @@ config GPIO_LTC4283
 
 endmenu
 
+config GPIO_TC9563
+	tristate "Toshiba TC9563 GPIO support"
+	default m if ARCH_QCOM
+	select AUXILIARY_BUS
+	select GPIO_REGMAP
+	help
+	  This enables support for the GPIO controller embedded in the Toshiba
+	  TC9563 (and Qualcomm QPS615).  This device connects to the host
+	  via PCIe port, which is the upstream port on an internal PCIe
+	  switch.
+
 menu "PCI GPIO expanders"
 	depends on PCI
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b5b..792faa2668c9 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -182,6 +182,7 @@ obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
 obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
+obj-$(CONFIG_GPIO_TC9563)		+= gpio-tc9563.o
 obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
 obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
 obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
diff --git a/drivers/gpio/gpio-tc9563.c b/drivers/gpio/gpio-tc9563.c
new file mode 100644
index 000000000000..70c3d61905a8
--- /dev/null
+++ b/drivers/gpio/gpio-tc9563.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+/*
+ * The Toshiba TC9563 implements a PCIe Gen 3 switch that connects an
+ * upstream x4 port to two downstream PCIe x2 ports. It incorporates
+ * an internal endpoint on a internal PCIe port that implements two
+ * Synopsys XGMAC Ethernet interfaces.
+ *
+ * 35 GPIOs are also implemented by an embedded GPIO controller.  Three
+ * registers control the first 32 GPIOs (other than 20 and 21, which are
+ * reserved). Three other registers control GPIOs 32 through 36. GPIOs
+ * 22-24, 27-28, 31, and 34 are treated as "input only".
+ *
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/soc/qcom/tc9563.h>
+
+/*
+ * There are two sets of registers, each representing (up to) 32 GPIOs with a
+ * stride of 4 bytes (IN1 is 4 bytes past IN0, EN1 is 4 bytes past EN0, etc.).
+ */
+#define TC9563_GPIO_COUNT		37
+#define TC9563_GPIO_PER_REG		32
+#define TC9563_GPIO_REG_STRIDE		4
+
+static int tc9563_gpio_init_valid_mask(struct gpio_chip *gc,
+				       unsigned long *valid_mask,
+				       unsigned int ngpios)
+{
+	/* GPIOs 20 and 21 are reserved */
+	bitmap_fill(valid_mask, ngpios);
+	bitmap_clear(valid_mask, 20, 2);
+
+	return 0;
+}
+
+static int tc9563_gpio_probe(struct auxiliary_device *adev,
+			     const struct auxiliary_device_id *id)
+{
+	struct gpio_regmap_config config = {
+		.parent = &adev->dev,
+		.ngpio = TC9563_GPIO_COUNT,
+		.reg_stride = TC9563_GPIO_REG_STRIDE,
+		.ngpio_per_reg = TC9563_GPIO_PER_REG,
+		.reg_dat_base = GPIO_REGMAP_ADDR(TC9563_GPIO_IN0_OFFSET),
+		.reg_set_base = GPIO_REGMAP_ADDR(TC9563_GPIO_OUT0_OFFSET),
+		.reg_dir_in_base = GPIO_REGMAP_ADDR(TC9563_GPIO_EN0_OFFSET),
+		.init_valid_mask = tc9563_gpio_init_valid_mask,
+	};
+	DECLARE_BITMAP(fixed_dir_mask, TC9563_GPIO_COUNT);
+	DECLARE_BITMAP(fixed_dir_out, TC9563_GPIO_COUNT);
+
+	config.regmap = dev_get_platdata(&adev->dev);
+	if (!config.regmap)
+		return -EINVAL;
+
+	/*
+	 * Only some of our GPIOs are fixed direction:
+	 * 22, 23, 24, 27, 28, 31, and 34 are input-only.
+	 */
+	bitmap_zero(fixed_dir_mask, TC9563_GPIO_COUNT);
+	bitmap_set(fixed_dir_mask, 22, 3);
+	bitmap_set(fixed_dir_mask, 27, 2);
+	set_bit(31, fixed_dir_mask);
+	set_bit(34, fixed_dir_mask);
+	config.fixed_direction_mask = fixed_dir_mask;
+
+	bitmap_zero(fixed_dir_out, TC9563_GPIO_COUNT);
+	config.fixed_direction_output = fixed_dir_out;
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&adev->dev, &config));
+};
+
+static const struct auxiliary_device_id tc9563_gpio_ids[] = {
+	{ "pci_pwrctrl_tc9563." TC9563_GPIO_DEV_NAME },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, tc9563_gpio_ids);
+
+static struct auxiliary_driver tc9563_gpio_driver = {
+	.name		= TC9563_GPIO_DEV_NAME,
+	.probe		= tc9563_gpio_probe,
+	.id_table	= tc9563_gpio_ids,
+};
+module_auxiliary_driver(tc9563_gpio_driver);
+
+MODULE_AUTHOR("Alex Elder <elder@riscstar.com>");
+MODULE_AUTHOR("Daniel Thompson <daniel@riscstar.com>");
+MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Toshiba TC9563 GPIO Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/qcom/tc9563.h b/include/linux/soc/qcom/tc9563.h
new file mode 100644
index 000000000000..0dfd25747b9a
--- /dev/null
+++ b/include/linux/soc/qcom/tc9563.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+ */
+
+#ifndef __QCOM_TC9563_H
+#define __QCOM_TC9563_H
+
+#define TC9563_GPIO_DEV_NAME	"tc9563-gpio"
+
+#define TC9563_GPIO_IN0_OFFSET		0x801200
+#define TC9563_GPIO_EN0_OFFSET		0x801208
+#define TC9563_GPIO_OUT0_OFFSET		0x801210
+
+#endif /* __QCOM_TC9563_H */

-- 
2.55.0

