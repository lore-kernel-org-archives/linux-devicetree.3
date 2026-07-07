Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E0B37F72C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416144; cv=none; b=a9NRc2PPuXk265oq3R+GC678KhAAN48dTR1yGbiUh7qobYQsBZtFr1F+6J9jfZatsqjVJQykPK7nR0fcT7KHuA7VacXK99ekb+cZM/sFyKKIqTxiCx5BTjEhf4zDEa5SsG5h3HHw8UpP8qVdhnztPvvwPSaOZfIjDP05DITJy6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416144; c=relaxed/simple;
	bh=Bgi8vjbE7Ci2r8jutKSRI578Uprau6LaFXTQw5m5jRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qkouw/JZ7fAmoJzVybct5JZc3UHaz+PaaLVWuoyoKA3a8oxaBWoaRz9LyvHxZ89bOH9OdH+1/7svuIHN5zHS0SQucQvhqpavNbP1xg3rtuQZ9V8ghdttwcaaZMRq+Hsd5/Ngu3GLfoc3y8mf0I2oelHINB9FnPLhV39UY1ZCnRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUDL6NWU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2Ne/rpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gUDL6NWU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2Ne/rpL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DnkE3182215
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qZFGiVBRYZ9cLrQOSvm9HlNXeabseMF3ogFho/1L5JA=; b=gUDL6NWUd960VndG
	4STzmivaIiaLvOW0nWT9idS5P6o4RUWkdshOz4fAsKrcF3EoYLOsv0DMNzHd/WXo
	ceNrEil4sKu02GwDSf+lilfQTBA3bRyJP+PYTM3Ugev6kXukZt8Bbfz538cBJrlz
	GDebWUNnLfh34/4Y8ZIqUtyj3NE2IYqNY8anayKO8UF3DQ+nJPN8/VdNTYf9zHHR
	JPjPpH6oiPMJOQIp2unUNDoKIMuHlet+7IQKhKchDRYyJq6Y/kyjs0FTvBzQlOBm
	WOHIZcUspZvJm1L7AW2Iw2HY4Nb9zUia6DHr76LGn0s7vodcYLiQcPWUE91MVqnG
	CFc4OA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8qun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:22:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478423e020so6438972b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416138; x=1784020938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZFGiVBRYZ9cLrQOSvm9HlNXeabseMF3ogFho/1L5JA=;
        b=B2Ne/rpLqJXM3h6wap8kgoxe1GCH0j4hrYDO+C7QFZWwqfez23h9gPDbDlaV9j5pIX
         xbbUAdJtqFhNj/ZVUCmqf7+Wm/YrK5tYWm5Rp1IsRjotcUo519rw1KuyWno8ob4Qjjx7
         T9CY90ycM8jj4c0Zcr/5La+Wi/O2VUB0E37Qiu9ky6j9n9Gaw3rkoca9MlWeuEfnJXQm
         6scUApfIBhiEGxrDG4wHMK0weEU7cKsDlIJJOpzHP1V8YbPzeF97SGZCl1cLZ6KiFz+k
         5Y8LwzUmdcvhavKxM9W2rXuUMT7sEHFLDFifZTX3j06DBORhnwRCKsDej21Y9z95iLB+
         FxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416138; x=1784020938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qZFGiVBRYZ9cLrQOSvm9HlNXeabseMF3ogFho/1L5JA=;
        b=b0ZfnwA7Tp5M2AsYvXwZZLc/LkrxzZ6JbUUeqy1ViBq+dVpO3b3GGvppjVZxPSGSf2
         9eq9nSCTWpWtR4DZFhNR9A1EXSmioxzv/qQd8h5TbElxZ2yVgHta3qysZYbdQkTC0VCy
         +ItlaS/8UlnaJo8a66w7biEvq02JAiAXUdDNK7XKs2tTzog1Wbbtd+lfSyifEWqHieex
         93RDujsZJSGAcWwqS1a3Im5SEeZIKMsX2Bn3z66zXUpxG7lTJq/G4bjhIx2G81e5xfw0
         r8HDaM3wgGVYNAvECJmFh/pVa4KErrUQ5xdWXS7To1VQFeO3SPZoxEKWPaKdueo9jkh5
         T9WQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzRAu8Y7gam6EA+OPLCUoo66oKMUuhOw3AsMuiImOhPBu9KLljmAqhi/7C+zj6S9jM0fiQD7gZ0pwC@vger.kernel.org
X-Gm-Message-State: AOJu0YzRoNKg8hyqT+o2s3G++9TZ3UTUD6IFOwSS5ESAspV6rrxelY5n
	IPuyBS5oe0KKyHNeOmpH2hVh91fNFG5X25YTPRz8tfmgVd9pIViEJ7zQSN8Q2DMKFs19HJTZQgu
	jd8PNMZQNUQ2acx55wmWiZDB3jvSv3C2HmzovxtpNvZKwwGarAwp1DGZKhVsRmPOj
X-Gm-Gg: AfdE7clNqJ9fE4Krwoz+6qqGMGzmes9qKJqanbr5K/VAaCoSFBrfcKNJ9eOmRnmrp6c
	xYO9uiDgORRE2j2DbE9bZ1/S6DCSP+6vTJhAeZr3oNv1PKIKEhZrVhlhGd70Ksuiym+tCUyGbwx
	+o/7IXX+7vYDM1PwIrp9Iq40/HLDj8+zfSbTNuGdFtRAVzOKYGkHw7/BnxenAAHIF5Q4SZ8yVKi
	Gp02mTM9L0ucp+flqcR4FEMbVYIa9Smawu/TareLRZyWU8Ig1/Pc3tL0yZ11S5AoLcYeMA5LKID
	NY4Za6mDq62ZkDkuHCpfQ9V8smQpwT8CUXWQn74ypci1VcqmfDMMMw6GVAFf/CqYzC3AamsIuGa
	RNtxoVCmCPKRgjis5Uitq5+ujERVhfavnvUaYJuw=
X-Received: by 2002:a05:6300:193:b0:3bf:d1f9:b1d9 with SMTP id adf61e73a8af0-3c08efff67amr5569571637.57.1783416138107;
        Tue, 07 Jul 2026 02:22:18 -0700 (PDT)
X-Received: by 2002:a05:6300:193:b0:3bf:d1f9:b1d9 with SMTP id adf61e73a8af0-3c08efff67amr5569533637.57.1783416137593;
        Tue, 07 Jul 2026 02:22:17 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:16 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:36 +0530
Subject: [PATCH v4 4/7] irqchip/qcom-pdc: Configure PDC to pass through
 mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-4-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=13727;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Bgi8vjbE7Ci2r8jutKSRI578Uprau6LaFXTQw5m5jRM=;
 b=dzXME18sLb/RZVKk6FMQx4MB+TtrbMDzRrzHVnctCeVeKAFdydfih0Cbkc1PMOehevcPT/XE3
 EzW70IAuksuBRQjh0IOf1ddhM47yVq47mUcLfPriSu7w4LmWW3gHpNP
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: uc4NO2vDKdn5CBz8pHxgjoi-S-1qEbod
X-Proofpoint-ORIG-GUID: uc4NO2vDKdn5CBz8pHxgjoi-S-1qEbod
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cc54b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OEwuVR-kMiNEGMA0P2wA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX5/lcNfioubvo
 jFfxQoEF5zfoT5Cv39iSoMjohbeLwoBybVrNuIeJd9Lw/iYEGpnN8U3ftFSWK9J/SWikborqG1k
 qprrHP8oO1Vcni7cVZ4VEdOpr7ft+kOZtmWUPAX2PIKsh44FmuXOgveMhNaRRsK0TLbtkdSfHrV
 EubexbZS71zX4oaS0dQZtAgQbsrdgFB1S/U+bu1FatwfgfdLvoweAQ4tDH6DuWExaQ6RrshFNbK
 1HK7MyijCt/EQ9qp4oI10euzxNpsuSDsqYhuQOsWWZIXprjJ3+fHit4H2icEek7xRXRFArTB9sN
 kQO8Sab3WG08mSouarcCa/Q0ltlkK1P14B0My1ZQ60Esed2nZDHDq5i9R728ctoV4sNiT7qBPrj
 at18Jq8j+7iG/B3jskq5DYjHZFvoEVQtBvZzbOJp9KrWgRusv8jxPeMgD6trBpsasSTlOCKttdQ
 2y5MejXhbF7LJrRD1DQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfXysvZ8nSAkb3n
 wuRKD+cxsO6szagSN2LqDE8kCd/K6vOsMZBmlSl3g1GTZQOtoXTizmFtR0gYalhpPTjA5i30JIl
 T7HzAHDDD4joHv4q1XWy62uSbZGHU/8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090

All PDC HW versions supports pass-through mode in which both Direct SPIs
and GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.

Newer PDCs (v3.0 onwards) also support additional secondary controller
mode where PDC latches the GPIO interrupts and sends them to GIC as level
type interrupts. Direct SPIs works the same as pass-through mode without
latching at PDC even in secondary controller mode.

All the SoCs use pass-through mode with the exception of x1e. x1e PDC may
be set to secondary controller mode for builds on CRD boards whereas it may
be set to pass through mode for IoT-EVK boards. The mode configuration is
done in firmware and initially shipped windows firmware did not have SCM
interface to read or modify the PDC mode. Later only write access is opened
up for the non-secure world.

Using the write access available add changes to modify the PDC mode to
pass-through mode via SCM write. When the write fails (on older firmware)
assume to work in secondary mode.

In secondary mode set the separate irqchip for the GPIOs to perform
additional operations only for the GPIO irqs.

Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 240 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 227 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 53a477aa9765..d122e8e7dc9d 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -20,12 +20,18 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 
 #define PDC_MAX_IRQS			256
 #define IRQ_ENABLE_BANK_MAX		BITS_TO_BYTES(PDC_MAX_IRQS)
 #define IRQ_ENABLE_BANK_INDEX_MASK	GENMASK(31, 5)
 #define IRQ_ENABLE_BANK_BIT_MASK	GENMASK(4, 0)
 
+/* Secure DRV register to configure the PDC mode via qcom_scm_io_writel() */
+#define PDC_GPIO_INT_CTL_ENABLE		0xb2045e8
+#define PDC_PASS_THROUGH_MODE		0x0
+#define PDC_SECONDARY_MODE		0x1
+
 #define PDC_DRV_SIZE			0x10000
 #define PDC_VERSION_REG			0x1000
 #define PDC_VERSION_MAJOR		GENMASK(23, 16)
@@ -85,10 +91,14 @@ struct pdc_regs {
 /**
  * struct pdc_irq_cfg: bit fields for PDC IRQ_CFG register
  *
+ * @gpio_irq_sts:   bit number for GPIO_STATUS field
+ * @gpio_irq_mask:  bit number for GPIO_MASK field
  * @irq_enable:     bit number for IRQ_ENABLE field
  * @irq_type:       GENMASK for IRQ_TYPE field
  */
 struct pdc_irq_cfg {
+	u32 gpio_irq_sts;
+	u32 gpio_irq_mask;
 	u32 irq_enable;
 	u32 irq_type;
 };
@@ -102,11 +112,14 @@ struct pdc_irq_cfg {
  * @num_spis:       Total number of direct SPI interrupts
  * @region:         PDC interrupt continuous range
  * @region_cnt:     Total PDC ranges
+ * @mode:           PDC_PASS_THROUGH_MODE or PDC_SECONDARY_MODE
  * @x1e_quirk:      x1e H/W Bug handling
  * @lock:           lock for IRQ_ENABLE_BANK protection
  * @regs:           PDC regs (IRQ_ENABLE_BANK and IRQ_CFG)
  * @cfg_fields:     Fields of IRQ_CFG reg
  * @enable_intr:    pointer to enable function based on PDC version
+ * @unmask_gpio:    pointer to GPIO irq unmask function
+ * @clear_gpio:     pointer to GPIO irq clear function
  */
 struct pdc_desc {
 	void __iomem			*base;
@@ -119,12 +132,15 @@ struct pdc_desc {
 
 	bool				x1e_quirk;
 
+	u8				mode;
 	raw_spinlock_t			lock;
 
 	const struct pdc_regs		*regs;
 	const struct pdc_irq_cfg	*cfg_fields;
 
 	void (*enable_intr)(int pin_out, bool on);
+	void (*unmask_gpio)(int pin_out, bool on);
+	void (*clear_gpio)(int pin_out);
 };
 
 static const struct pdc_regs pdc_v3_2 = {
@@ -133,6 +149,8 @@ static const struct pdc_regs pdc_v3_2 = {
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_2 = {
+	.gpio_irq_sts	= 5,
+	.gpio_irq_mask	= 4,
 	.irq_enable	= 3,
 	.irq_type	= GENMASK(2, 0),
 };
@@ -144,6 +162,8 @@ static const struct pdc_regs pdc_v3_0 = {
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_0 = {
+	.gpio_irq_sts	= 4,
+	.gpio_irq_mask	= 3,
 	.irq_type	= GENMASK(2, 0),
 };
 
@@ -182,6 +202,15 @@ static u32 pdc_reg_read(int reg, u32 i)
 	return readl_relaxed(pdc->base + reg + i * sizeof(u32));
 }
 
+static inline bool pdc_pin_is_gpio(int pin_out)
+{
+	/*
+	 * PDC allocates direct SPIs at the beginning and
+	 * all GPIOs as SPIs are allocated after direct SPIs.
+	 */
+	return pin_out >= pdc->num_spis;
+}
+
 static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
 {
 	void __iomem *base;
@@ -229,6 +258,24 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
 }
 
+static void pdc_clear_gpio_cfg(int pin_out)
+{
+	unsigned long gpio_sts;
+
+	gpio_sts = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
+	__clear_bit(pdc->cfg_fields->gpio_irq_sts, &gpio_sts);
+	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);
+}
+
+static void pdc_unmask_gpio_cfg(int pin_out, bool unmask)
+{
+	unsigned long gpio_mask;
+
+	gpio_mask = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
+	__assign_bit(pdc->cfg_fields->gpio_irq_mask, &gpio_mask, !unmask);
+	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_mask);
+}
+
 static void pdc_enable_intr_cfg(int pin_out, bool on)
 {
 	unsigned long enable = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
@@ -237,6 +284,13 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
 	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, enable);
 }
 
+static void qcom_pdc_gic_secondary_disable(struct irq_data *d)
+{
+	pdc->enable_intr(d->hwirq, false);
+	pdc->unmask_gpio(d->hwirq, false);
+	irq_chip_disable_parent(d);
+}
+
 static void qcom_pdc_gic_disable(struct irq_data *d)
 {
 	pdc->enable_intr(d->hwirq, false);
@@ -249,6 +303,41 @@ static void qcom_pdc_gic_enable(struct irq_data *d)
 	irq_chip_enable_parent(d);
 }
 
+static void qcom_pdc_gic_secondary_enable(struct irq_data *d)
+{
+	pdc->enable_intr(d->hwirq, true);
+	pdc->unmask_gpio(d->hwirq, true);
+	irq_chip_enable_parent(d);
+}
+
+static void qcom_pdc_secondary_ack(struct irq_data *d)
+{
+	if (!irqd_is_level_type(d))
+		pdc->clear_gpio(d->hwirq);
+}
+
+static void qcom_pdc_gic_secondary_eoi(struct irq_data *d)
+{
+	if (irqd_is_level_type(d))
+		pdc->clear_gpio(d->hwirq);
+
+	irq_chip_eoi_parent(d);
+}
+
+static void qcom_pdc_secondary_mask(struct irq_data *d)
+{
+	pdc->enable_intr(d->hwirq, false);
+	pdc->unmask_gpio(d->hwirq, false);
+	irq_chip_mask_parent(d);
+}
+
+static void qcom_pdc_secondary_unmask(struct irq_data *d)
+{
+	pdc->enable_intr(d->hwirq, true);
+	pdc->unmask_gpio(d->hwirq, true);
+	irq_chip_unmask_parent(d);
+}
+
 /*
  * GIC does not handle falling edge or active low. To allow falling edge and
  * active low interrupts to be handled at GIC, PDC has an inverter that inverts
@@ -275,18 +364,18 @@ enum pdc_irq_config_bits {
 /**
  * qcom_pdc_gic_set_type: Configure PDC for the interrupt
  *
- * @d: the interrupt data
+ * @d:    the interrupt data
  * @type: the interrupt type
  *
- * If @type is edge triggered, forward that as Rising edge as PDC
- * takes care of converting falling edge to rising edge signal
+ * If @type is edge triggered, forward that as rising edge as PDC
+ * takes care of converting all edge types to rising edge signal
  * If @type is level, then forward that as level high as PDC
- * takes care of converting falling edge to rising edge signal
+ * takes care of converting all level types to level high signal
  */
 static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 {
-	enum pdc_irq_config_bits pdc_type;
 	enum pdc_irq_config_bits old_pdc_type;
+	enum pdc_irq_config_bits pdc_type;
 	int ret;
 
 	switch (type) {
@@ -336,6 +425,72 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
+/**
+ * qcom_pdc_gic_set_type: Configure PDC for the interrupt
+ *
+ * @d:    the interrupt data
+ * @type: the interrupt type
+ *
+ * All @type are forwarded as level high type to parent GIC
+ */
+static int qcom_pdc_gic_secondary_set_type(struct irq_data *d, unsigned int type)
+{
+	enum pdc_irq_config_bits old_pdc_type;
+	enum pdc_irq_config_bits pdc_type;
+	int ret;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		pdc_type = PDC_EDGE_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		pdc_type = PDC_EDGE_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		pdc_type = PDC_EDGE_DUAL;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		pdc_type = PDC_LEVEL_HIGH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		pdc_type = PDC_LEVEL_LOW;
+		break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	old_pdc_type = pdc_reg_read(pdc->regs->irq_cfg_reg, d->hwirq);
+	pdc_type |= (old_pdc_type & ~pdc->cfg_fields->irq_type);
+	pdc_reg_write(pdc->regs->irq_cfg_reg, d->hwirq, pdc_type);
+
+	/*
+	 * PDC forwards GPIOs as level high to GIC in secondary
+	 * mode. Update the type and clear any previously latched
+	 * phantom interrupt at PDC.
+	 */
+	type = IRQ_TYPE_LEVEL_HIGH;
+	pdc->clear_gpio(d->hwirq);
+
+	ret = irq_chip_set_type_parent(d, type);
+	if (ret)
+		return ret;
+
+	/*
+	 * When we change types the PDC can give a phantom interrupt.
+	 * Clear it.  Specifically the phantom shows up when reconfiguring
+	 * polarity of interrupt without changing the state of the signal
+	 * but let's be consistent and clear it always.
+	 *
+	 * Doing this works because we have IRQCHIP_SET_TYPE_MASKED so the
+	 * interrupt will be cleared before the rest of the system sees it.
+	 */
+	if (old_pdc_type != pdc_type)
+		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, false);
+
+	return 0;
+}
+
 static struct irq_chip qcom_pdc_gic_chip = {
 	.name			= "PDC",
 	.irq_eoi		= irq_chip_eoi_parent,
@@ -355,6 +510,26 @@ static struct irq_chip qcom_pdc_gic_chip = {
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 };
 
+static struct irq_chip qcom_pdc_gic_secondary_chip = {
+	.name			= "PDC",
+	.irq_ack		= qcom_pdc_secondary_ack,
+	.irq_eoi		= qcom_pdc_gic_secondary_eoi,
+	.irq_mask		= qcom_pdc_secondary_mask,
+	.irq_unmask		= qcom_pdc_secondary_unmask,
+	.irq_disable		= qcom_pdc_gic_secondary_disable,
+	.irq_enable		= qcom_pdc_gic_secondary_enable,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= qcom_pdc_gic_secondary_set_type,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND |
+				  IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE |
+				  IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND,
+	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+};
+
 static struct pdc_pin_region *get_pin_region(int pin)
 {
 	for (int i = 0; i < pdc->region_cnt; i++) {
@@ -388,16 +563,38 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 	if (ret)
 		return ret;
 
+	/*
+	 * PDC secondary chip is only set for the GPIO interrupts as SPIs.
+	 * Direct SPI interrupts are still in pass through mode (no latching
+	 * at PDC).
+	 */
+	if (pdc->mode == PDC_SECONDARY_MODE && pdc_pin_is_gpio(hwirq)) {
+		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+						    &qcom_pdc_gic_secondary_chip,
+						    NULL);
+		if (ret)
+			return ret;
+
+		/* Secondary mode converts all interrupts to LEVEL HIGH type */
+		type = IRQ_TYPE_LEVEL_HIGH;
+	} else {
+		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+						    &qcom_pdc_gic_chip,
+						    NULL);
+		if (ret)
+			return ret;
+
+		if (type & IRQ_TYPE_EDGE_BOTH)
+			type = IRQ_TYPE_EDGE_RISING;
+
+		if (type & IRQ_TYPE_LEVEL_MASK)
+			type = IRQ_TYPE_LEVEL_HIGH;
+	}
+
 	region = get_pin_region(hwirq);
 	if (!region)
 		return irq_domain_disconnect_hierarchy(domain->parent, virq);
 
-	if (type & IRQ_TYPE_EDGE_BOTH)
-		type = IRQ_TYPE_EDGE_RISING;
-
-	if (type & IRQ_TYPE_LEVEL_MASK)
-		type = IRQ_TYPE_LEVEL_HIGH;
-
 	parent_fwspec.fwnode      = domain->parent->fwnode;
 	parent_fwspec.param_count = 3;
 	parent_fwspec.param[0]    = 0;
@@ -443,8 +640,13 @@ static int pdc_setup_pin_mapping(struct device *dev)
 		if (ret)
 			return ret;
 
-		for (int i = 0; i < pdc->region[n].cnt; i++)
-			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
+		for (int i = 0; i < pdc->region[n].cnt; i++) {
+			if (pdc_pin_is_gpio(i + pdc->region[n].pin_base) &&
+			    pdc->mode == PDC_SECONDARY_MODE)
+				pdc->clear_gpio(i + pdc->region[n].pin_base);
+
+			pdc->enable_intr(i + pdc->region[n].pin_base, false);
+		}
 	}
 
 	return 0;
@@ -495,6 +697,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		pdc->enable_intr = pdc_enable_intr_bank;
 	}
 
+	pdc->mode = PDC_PASS_THROUGH_MODE;
+
 	/*
 	 * PDC has multiple DRV regions, each one provides the same set of
 	 * registers for a particular client in the system. Due to a hardware
@@ -512,6 +716,16 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		}
 
 		pdc->x1e_quirk = true;
+
+		if (!qcom_scm_is_available())
+			return -EPROBE_DEFER;
+
+		ret = qcom_scm_io_writel(PDC_GPIO_INT_CTL_ENABLE, PDC_PASS_THROUGH_MODE);
+		if (ret) {
+			pdc->mode = PDC_SECONDARY_MODE;
+			pdc->unmask_gpio = pdc_unmask_gpio_cfg;
+			pdc->clear_gpio = pdc_clear_gpio_cfg;
+		}
 	}
 
 	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);

-- 
2.43.0

