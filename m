Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAEF48125A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845706; cv=none; b=kaDNI6sgAXWbKDE8CV5kWGO+cjUAeJuhwJ8ptK9BjnYMdAwIaqplI3Uj/e1/KcQSEnvz5u6cOpeHjODTwkNVxNeTFX5SNzkr+Y2mfFnK0oKKpBm+g7wB0bVqaaa/hfhBWLRtfmoqz2eInbgIZxJzY94YVHNWDriY5xaJRIH4HUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845706; c=relaxed/simple;
	bh=9MMSW5/Ed7QpArLAviQFc6KStndAKsio49V65Hx+FaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h0od9xMus7xPXZpDgudpo7v3rVoDwSwPUVAcWvqZYUphrMuhHxdvl+b4IVVsTZA/XrhAYR/PJ+AEwdI/dm3emCuTHnrhqSHqZMZ1D+JpQTZNBNicaZuaEIFt3zCJ1eUn0jj3NXEvR03c0IHocy4TQD2ds6bo9MCP4Ykkak2ly3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ly3Lwsf6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VbJS8b1C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ly3Lwsf6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VbJS8b1C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBWF5f3513372
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=; b=ly3Lwsf60lBvnX+t
	4dkhoiECNXmi2dNMkdOXlmVIhIIMA/SW6w/XxJTDFYwhn89nZyFsSVYVUG5PxzSY
	fyBFODNWrsg5PfPXeMP0o4kXik9yscWH1fmIjwMc4ZfjXPlFHNUzn7oyR1ptLwla
	fYwCJv3NF5Ffim6HEF4sESnDKbbh5pyzxS6auep2bjZIw3jr49gmt+SqpBSUtNn1
	KxWfqmwa1EnzSpkIjd1y0Q0Apu+MBEpS/nRlFL9lBdVGFhrVEEd6XPjPpXEIMRuO
	BvMQeDtavAjsSuEj56xgWmHpmxzuYwHGufU95FMc4oeunZPU25MWXXqQixI/ecr+
	Iv8WhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vb3p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b5d6bb45so15219231cf.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845697; x=1779450497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=;
        b=VbJS8b1CcoX4zSNezZGCN1cCMvhOkRSeSBgt1dN/Wujt4UQNAr+26+bZYGbIQnFgRG
         LBwncYMehetGvR/sPAec4zrIRtHnqpAUzYIv0GqgHn6nBBAgxCgtNqhpJhykQr+vS1G2
         Kpzs7BG98r/jZ6bw/DMHSzN8p5fBndGI9nA9LAGUH0Xk8OufDo4x+A8Kwr6OQfuLFGNN
         rW+j2F25k2HqP4+QH1s5he6doCiv0dPT48nPs+yf+uT23DZ20fUmAfEhGfSA9NdfhTM6
         t3Byd/fMr8JPGqpqK9WMX0AWBldFKAFA0K/gtlfM3Ahjao6IfR/mwTWDAAbYj01B6PPr
         P8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845697; x=1779450497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=;
        b=FfosNad+yecgKxJjFPMUbreLmqPPHpaMMGVyXL5qFYHZ2qDGjQImIQ4zg2F/Fyud5A
         i/ZIk/xUqcWkuvNa1EI47hDRw854SVCDd4xI8KwcjPFWHVuR0uGlugAP7gMBhHXUR5DM
         7rDESeG1VXqyOFIMroEMiaDAaE46XgiS6FOBAlMx1AzUUUC+rkTCPhBTat90a5NR0D4Y
         g37x4mH4j2AkqzZfNsMG/M6ZRAvVlh0R1h95qPg8fSpSX4ZqcWU+lT6uOXkpi3FefiYu
         WAS2/045Z5Q+NSUTfSLBhukcjc0okpvAQ6C01vXYizhoEE4uQF3c7sb4JdmY0J1GOMmN
         +b5A==
X-Forwarded-Encrypted: i=1; AFNElJ+mBsTIWB23DBT4f7S7AHo3xks/OZas8zucvAwhUkiaxcwzSiwuRGJmN3q7NztKAeUbriRPmUd24aib@vger.kernel.org
X-Gm-Message-State: AOJu0YwCxxtgsNFQ3oPrvDdHb2Z+p6qJvlrxoCCXe4b+N2HtDWCHB34Q
	awFaPLzD0EmBW6R+MzUrXcJvOXE+1DwawK8FUH8XCitB+vjMB5dq2Z9Cpsc9V8IhFzYFiNAvcSM
	ejZKqNrlnGUG3RKNBrrBJ3+V6JKfN2GZ4vz439Kej5Dg/GF00tAh6UUFi5WXql/3Y
X-Gm-Gg: Acq92OF1kKg+Y7MZtExAWYjJW6aIhx6maGcqrtukAx5GdaXFI6bwO64C6NRyjt7M7vN
	Rxou2qRvV1SwnZMk9PgLTL0AMtQEGcm6StzlXmbfRZ1BnCGwwjg+aQpccUWai5s+cpco+NET5wg
	nKrOuPKU7NXL4iDbakSfLRwiNpE9zdWqt382zQeZEZ9EfZOmeGVqzadiCwocL36IXzp8sUTaYo8
	ZBzzMesGsKRKSq8sDMIgkdLQtEFx9rAN8drbtvY56wc7WMLy2RaHvo+42r5d/crzwMqY/6Uzw1l
	DN0NAKmIbecjtBGRbQWsT1xHF9U1G2ssXsnNhCV/35oqoVyBF2k1fQ35I2lRpZG8ekyr8Yo3S/b
	2E9Rla09DZPmBmDXtbF/VIST2WDTXVc8Dm1F4SwJ5eMiUcmE0NyFBL+sXRAM5mQAPg3pW3gcHPZ
	uoxgECZEfcIANsKLRk3jHBN7c3b+1p8MP3ylw=
X-Received: by 2002:a05:622a:43:b0:50e:89e9:2728 with SMTP id d75a77b69052e-5165a0b79d5mr51680811cf.19.1778845696949;
        Fri, 15 May 2026 04:48:16 -0700 (PDT)
X-Received: by 2002:a05:622a:43:b0:50e:89e9:2728 with SMTP id d75a77b69052e-5165a0b79d5mr51680271cf.19.1778845696420;
        Fri, 15 May 2026 04:48:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:03 +0300
Subject: [PATCH v3 04/16] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-4-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BLAFo17mDNzRt3RGOIKqa5vQlLgViburqFmg/i4bsbc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf0QzU3MVfks8OsTbC2IhM8ei33P5M/PmWYW
 Rl+oP67KXeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1dL0B/sHSrstDg3QTGBRHgoPwSgJY6F+4dRzOZGXaBhTweRyTdrsdqU/xScZw5WATkH2iqlh0X4
 QAvacUB2Q68BA6Kblsk/BADFs9KwgNeSYduDNRbzlgFOBeRWDIqdGAF57Qwsf1mtdbaLW1ug3ln
 NcxXgPEmayAebeVFUVp2XTb8RZdYTcR2pqqUTkwAN0o7NqDhzJuG7Bmxo+2AS/x3F1Q6uE3a1XT
 nDUI1BtyrpwT6mLCFiuXuFYiALAyivIRuOApVOiODzX2J822h/w7b9NpF2N6y48fc6wttk0LJ1v
 yNObRX0UQw+8vP7gk1jtYxxsgbykYIpTkHQ/pFlv6bUMj7ZK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX25rSE2DdrRwc
 kcMvA5AlyzoWEg09BFhZh9gFQSCe3IybDbveQtYTTWflgd+1OvqnliYgbw11jAsQro/dz0x9ziC
 7Dtdf8otbWmpAcgOdoSkuXV6m61PjJ4JYQS28V5TbXl2Giwb6RzodmskjstRf9KtNxatekXJfEW
 xSFO0Kau8CqM1bwG/pcV3pQkvBMcBhf0hbanRNE8XKqGNCCkoB2MugRYSLcmpyPuip2jGrhq78J
 My3/lkNY6sBSUFFJTGTAFFauBrNIxF6PRwcMou6b+O9+VWnzumIftM/80tF5/vq6o1HYK00zr8k
 wUfOzTuCIgCFydzB9EeJ0ESLWSOqgy6ZLtae8NvkFKvYza3LVgWcA7cAhsxQGFmO1XYPkpJ4rPp
 p3oryDXkm67ierMTNHaR+QL/ArmUoQ4v8IAxfja/blWBbDrD2bYc6DM8bblOAaWUactWN3tSxQz
 wb+KtLsHW5BaC+NRIPQ==
X-Proofpoint-GUID: S058n9nUssBwYyJ6-8QE_XVpPdIKwrBK
X-Proofpoint-ORIG-GUID: S058n9nUssBwYyJ6-8QE_XVpPdIKwrBK
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a070801 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The interrupt_init sequence is currently shared across all supported
devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move interrupt_init into a vpu_op to allow per-device customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index d61902c9a213..d49d22b14753 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index dc02ced1b931..c3b760730c98 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index f608a297d4a3..90ccdc0d2a07 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ff0070c85ccf..59e4d68d042f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -474,7 +474,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
-	iris_vpu_interrupt_init(core);
+	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
 	enable_irq(core->irq);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 21ed4c9bd5e3..9151545065cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -23,6 +23,7 @@ struct vpu_ops {
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
+	void (*interrupt_init)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
+void iris_vpu_interrupt_init(struct iris_core *core);
 
 #endif

-- 
2.47.3

