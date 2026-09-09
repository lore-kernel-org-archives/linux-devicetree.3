Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CEC572699
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965825; cv=none; b=CbjA4ClkG7FdUsStI1ATNzxdJlFVrn7d909i4kx82R3j0DCWOwjYwboEX92axqAaj0/sJyOiw5TwNa/R/YoZfyjia581RYouwQIfGV+oNdfaNR1/6Y0TdU5kUQSo750QKLXchQwFgsnGLpX25R5Ndk4F0FBf8PkEU43sPubm6MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965825; c=relaxed/simple;
	bh=1R6Utv+qvsm3BmK4wvwwfQiFexp4no+IiiaI9utxCE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFochjd2S8kpWIJ7tx7PNSEl5+e8MtrnIrr7bXs8WfMzbt1+RDilU+JvWRCf4Y+TiBAAdOD2ONeBKV/lp2KCBwSZr+vSJpRWB/9DQfJqXcKlGUY2K8GhBJu8aEqh+FXnnqQsxSpNzTyMhMSiI7jCYIklbavSFNsWdOTXuxjL5rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lgf4mi4o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MG7EZqfQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lgf4mi4o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MG7EZqfQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU9C2599915
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GSXR5NyPzEt9NCTK8oySpuhpLuRDFNxcln3x4lU6wo=; b=Lgf4mi4oeIpJHPsd
	gqEioJz4riMb0z7TpV6uto7EfZkuD1/A9bwmYAhO+ABMjfolQnrV1mNcJv+KQXGZ
	YgYjrc7LwT8sXFMKuQBmF5QaYOaB11uGel6SDi1N4lN++jU+0IGlXDt1/iZyfd1i
	poPd+GkcdwKLoKdjdEMZK6GMmoWgIwikTYHHepAjb/OlX+XoKog/oLd/50mhYPy2
	dCAdiSJw4WdQQbUc5Q/EFwp3EGPKRP1sdWPaAdRxiPTEHMUFS9RbyXx5pNacQKyR
	UOGc8CKpLa/grmS9uJyhPCn3xDMPeqE78dQVH44Fx4dgqjj9y5lRpQMaEV+Kl3SD
	cm61yA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2y1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:57:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78350646d7eso5216333137.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965820; x=1789570620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GSXR5NyPzEt9NCTK8oySpuhpLuRDFNxcln3x4lU6wo=;
        b=MG7EZqfQ7/pIKBQq/fd3pOJvHv18PnPNkIPMezW5wzA0QbqGgmzIWAP663msHAxn5z
         VYd+PUXH3MVj7NDvoWRe0x8IszTOivCW5j5lF+3BazRAPS25E9IEdCKg+xRw8MEEK3ax
         EIxanh8ESpZHrXG/HQVDo9MKrZd+5+Gyp+JBFePvwz2HsUL5fijF5O2qdGAyiEtCPxKV
         WtMW4CHFvf7G4jlaRUxks5kiWRuULdwhXlLG7SJ+ZMnsxm6P3XMBTzv7lO9e4n1nT/6w
         4BXEqJ0m95XrBny5SQX9P3Ni9wxDFdpNwEau9dNKCur+XRwUFwhrwRmLoIlLPWvL7ot3
         FuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965820; x=1789570620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GSXR5NyPzEt9NCTK8oySpuhpLuRDFNxcln3x4lU6wo=;
        b=Mc9NZRHWKrz9lU75XW2B1BH+8VqLHLTEpHe68M8XyYOFtOM+ojiVDV9OnX7z1wUSZ6
         5eoVWblE3GQKLm3waIn8hUBTDPCncw64CyB6aohdAEfKg1Ex9kpAEh0Jg5ckH25DcupL
         s04/niBbBqEc9aFBkB2p0X88X0NxSFK1l4lwn9XtsRj9qtSnz/Esc+x87mAXCX77A3jk
         KBo9wusl4h3VzL+QqJAU9Hk16WyXDl6MtSyZpsT80+7UGSfNfBXMiOFl+gWJmFeSYTVX
         ptIPT1/mmXkRuj5v2HNk+IdvapljqjThDR+gwohrQ9FI40UCC8MXZnJUXTvasf3AjM4M
         F2yA==
X-Forwarded-Encrypted: i=1; AKwUvByzhZwVKbPmsAlaFggwBtrxaf5k+4aHmx/hzzir/lMkFnTfksrVX7t+fTGfrRIjU/f/AzXojntv9h+V@vger.kernel.org
X-Gm-Message-State: AFuF++m6xc/qvYOULkjHueewEtv1MOKZY9Djf220geH1bylaXHp5HHwe
	bUXWdqY02URqpK3rGpfGYFGc3+oHPq1yS3wk6GDmwXDq0W1b5BTnP0KIZbHgCNVrbnAtKoL92LY
	bwugzANyC+ltbkCfI9aUZn2j5P/OWkXCBVJkMSkIz4l+j2a4+ywo5Ld857RcO4i4+
X-Gm-Gg: AYBFou0xZn8wfkc6wJ/HPngKS+7Iv2oZwuF3Q7wQoDDPzmEct9W4PXxJvNVQQN8gEw6
	W4cwG6ax/VOJv/Ff22+RzXWRB8kN+ezVBGlKYniPLD60D5EOVQGFXdjikj0a6ARJ3+Qm1cS6Qyn
	vv/YtMAcBJfu27uksA4nY18nUw6PUKJ9BdNpTMyYtuXR4UrV/EsY27pdVuwB5ScrX5s1Mv90/Hq
	G5pku8HZtOK7V+hD7Vb6EGixE4I44sGn5V/Mcnki3pTj4LEYG+CCJYqkZk7h25VTVBDZoqfepIX
	Teqb+bn06ESetbypD3ggPrj4vgjQ4rFQnsPxdyHX6ES5TVaMom/fCZpRoBc7TpN9sGgbTa8tg2S
	/b1l/ZvHFA920DQ==
X-Received: by 2002:a67:f493:0:b0:774:ce64:242f with SMTP id ada2fe7eead31-78a2f0637bamr8730391137.20.1788965817591;
        Wed, 09 Sep 2026 07:56:57 -0700 (PDT)
X-Received: by 2002:a67:f493:0:b0:774:ce64:242f with SMTP id ada2fe7eead31-78a2f0637bamr8730368137.20.1788965816997;
        Wed, 09 Sep 2026 07:56:56 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07b371afsm394333765e9.9.2026.09.09.07.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:56:56 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:55:54 +0200
Subject: [PATCH v5 2/5] gpio: tc9563: Add support for the embedded GPIO
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-pci-tc9563-aux-v5-2-c9b33f56c8d3@oss.qualcomm.com>
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
In-Reply-To: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa173bd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=xgoTPrYxRPbxS4DbvaYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX8uVIaXw46ig4
 FjrYKvENFdug2osnsF3OUJiCX8GODrE2T1ycqKvPA8KKAybfnnaj2vmF9/MTZ7B+wlkN9DGM5dW
 xZG7I9Mwnm+OHbgus3LtOL3K7pqpmhQ10+FS0rG1DYvdZc4Qc7zR+Dl7SEF5HaZM2I3rkbI1vL3
 vNl3Ss/rnPnRlBh7aD5SWx4JnVKYVZU3iXJdhpVws5geB9tFm/1uDMr0+6zl3YrLt17ccN5KcSq
 8kuFmVKtz3Dzu64ININkA9g/4bW9i4sL8TCtKuRKmBacmlb49m0qzBK8ozcGHQs/NlJxShxrM2v
 faUqHYJ9ZN1boOv+EeZv0t7qxdDbV+f4BhxqxT2N+VE5F7DzKu2+0A2SXzn2hlt/VhnhTiADGzu
 ymhpFFz+esaSpFMf64dWHUOPXtyLgzCRWznJoEo4QanK72YpMlEhqrP+TOCzF63Z2K2zDXxEadr
 7ND1CaAcTtgsD+G5JAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX67cCn0uQxS72
 9S7ZaqUV62D4gYylBujlHKA1N86aqT4nTb4oPCzgjWhgn8/zsREHsS3/1wMfkpgacc3xXAxunHY
 wrTRQJh+FkQqHcAoU7wKGiqYr8lsr+c=
X-Proofpoint-ORIG-GUID: mdopxT-a0kpHqI7w3QDcs8-5vmbCFtbI
X-Proofpoint-GUID: mdopxT-a0kpHqI7w3QDcs8-5vmbCFtbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

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
index 000000000000..68c20c8cba79
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
+ * 37 GPIOs are also implemented by an embedded GPIO controller.  Three
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

