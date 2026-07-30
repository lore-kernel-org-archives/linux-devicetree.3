Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9572445AE7
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424869; cv=none; b=RFLpF20jvLAXSqp0zYDaKM+4yvRo9PGOA9uToS1LSOoqSs9msQvepaPuT8suUtRHzfDPdjgXVYTIXk/UJ3EQl691XRDQg6AOjGxWj3/BGwSRM8Kor8ppdqZA/YJBEBPKOko3XKMZCR0vWjVAsnEVdZ+teH7lf/XC7rKt/IBOZK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424869; c=relaxed/simple;
	bh=mn+e/RylLLe8OTePgCv2X/kFcuAkbIe3sFltrQBvOOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dy5y0fao+zXRs80/Ts+ZyQ6QsKD7h1Okf/5KEruFPIS6lyjaGJX9TypuhvuyZJVhLtMvwhCjW+NnOGUVk+46L5lxJmM/CupQyPXaqJOHXzgc9W4mXzaCpoquMqao0RRhLecFDSaSbjXE2QsXgjG/KLTzIZAMZntuFZ1BVQmYyNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mg3TDYvu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/a419UT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mg3TDYvu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/a419UT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEiY5F987013
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=; b=mg3TDYvuSS5Lj+ix
	i+eUlJAALhiARHAtulLyc3e8fUp6kTfiz3E3bl0HW0FUB1PdP90lBR3nos60kDkC
	aXH7jdprgtILM0ObHd7EPys+Dr5lvgTTfS4lBbSngX/HeRAwAW2Bg1M4ufNR/m/u
	Ewx4F/ksos06tmjuF7DRrPw0i5jiOGKST8elyTRLrmM8f7bXELli3Fad47WbEu7O
	e6v/vfac6XqwE3oYf+Onryy7LR2JEUr4dYw0EaZQtF0vgpsHPzx/rHVJVLok7EqG
	r3ppp7cGnsLOnQO9xtc38s0suVkfCouPgP1riyDiS2gbvYjJ4HqcRbtG7vky2YxR
	tpqtww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n386dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so46513711cf.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424865; x=1786029665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=;
        b=C/a419UT0LkyKClDIyZp80RKg4ANpKIzvi9xN2SLV37BnGBysJT+aHpMYdb938va/q
         9Xo27vwtlyWbsaiCXuM/yxKCTJA2YJcwHtKMR5IbXVpDHxQl5ZGnsQ3Omu1oWYn49bEK
         86vTVbVTmUD0GeAtnNF0mfQJ6OP1tf0ilSsC5zE9iI/yIk2bz+r1uKjsgROAeRPopGEl
         iUwasNmbLHxC56ZuORMlp2W/H18PMGyzTJ7dPTT09NzUoL5ye6V7hdiqG2/j7JgJvPOP
         0U+38WpL6YnT8FSJuslme/yTZRP/sipU95crnJ1kpTQrXOxBdDb08iojuKVAHII8ywZ+
         Dt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424865; x=1786029665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=;
        b=fF3s/2A28a/SwSMcj2t2AImXI4PZxU48ZNXL6WcRwWGDTL2gOVloiHGd7sFdodaxWa
         YcCXvEitjnbVi2TF9Lm6Iz6g171tKWa4K3NLj53ovldqAxNFO7NWif63U+30eVXp4aIL
         skvuOrMu9YQmth0LoUEhVJDOH3MbFVoL8+PUf0I+m/Lq/snLZonxILjUafmwtfIlKXqw
         In0gtJu/136PlW760zJG8qifJ5yTPmxPFhYo7WeGdtq5KxRgIdAcXBSnRvWjB7Ge/mSe
         SF2EXQ3edWQdvJkzcbyU/8q67eFe9/cCCRNkntV83PPtAEt0ynSB/CDkYaykMcMXCjb9
         pE5g==
X-Forwarded-Encrypted: i=1; AHgh+RrTmEL/Oy4xrTltTDtGZk8RMJu0NxejUFnZAK0WkW5YgMZvRiCvp38d+Il2I/K1uvlSjPytq1j4YsC+@vger.kernel.org
X-Gm-Message-State: AOJu0YxZsw4IPJvvRM75Ed2r2Vb+zrg8rxLyTX2NLolxkqlAWLXtjTeT
	QrBt51sI8z9XadF9Qg9dvF9GSEeovDCVz0pRajEGA5klbJc3ZXn77Pbat3VBMBhprjoiE4IcJf9
	pksotGMufyYJgKTXg3iMzJImJ8VaK7+MZuL0kxh4uLxiZnxPNvvbqT3TZLgRwtCzx
X-Gm-Gg: AR+sD10fx0vNEx6Iy+5GBgR1jeMHpNZCX4fQ2QndI57ynumuW4fE/wZR1t7I+aTdnPh
	aFCR/XXzibOm3dDDvPgkeGkf/BElIBrTSGekFruRc8y3CyEaQrPfS4+d6cUeeb7XQcvIa144FjW
	om/vbwg4c3UthEWA2bVOA9HFcYdJMd8rXIN3p4NZZLFoIRSOzvjzNekzVdF2ywaMhlyCymwmJBG
	VgYIkA1PKh5k1x/mrI9X2v+u3Yl4RxAyBUSy17Cqm4EiliUU/FAXKsHVcmqUDinAVfG6LW78/oY
	dvV+Xj4GWprtnRU4JYQNP6giUwI7y6Nznq870AyWn870hS4HWE5wRkpz6wHrwr3IWE/C5WJnPX+
	tNMXbOSTuyPHv9UdB7gkn5JHtdsg+wfESnVRmIWm4AXpxY6tFOTbC9x2tdm1o2ZDZrYOE2bDjs5
	WdZ8GdNxzi5JISAA==
X-Received: by 2002:a05:622a:1346:b0:517:a9ef:ce30 with SMTP id d75a77b69052e-52b3838774dmr33091551cf.17.1785424864687;
        Thu, 30 Jul 2026 08:21:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1346:b0:517:a9ef:ce30 with SMTP id d75a77b69052e-52b3838774dmr33091261cf.17.1785424864270;
        Thu, 30 Jul 2026 08:21:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:49 +0300
Subject: [PATCH v8 06/18] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-6-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
In-Reply-To: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4931;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jlbWJ6BnLAb8hDHnLKbkTUpBs5ZGORWEUsmmVGvPwio=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vR2XgUwV/wEpunmg5XwtLqM9gVHH6ocCtT7
 0piGmrcuEeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0QAKCRCLPIo+Aiko
 1eS+B/sFKiuNGg2+o9L6DgVJTGGit2azpaQeg8pKWuhlg/nCBAdoooMsNgHrJdBS1TmPKdgTCvk
 JG3Hd5V9VRZH0LCfe9BOsq6H3EwxCAgzs1lzyQv8FqLDZhUR84hNOgGhuYcdPeuRbN6DRtXeXvM
 2VxsS4C0eMvCwRIiJS4HmeKXyQ9ZhEGDzVYvoc5z3WajaJMjb5mDe7MfjU4UBJ6vNiNs88FLa2P
 FQF6O4JqALRKCKbsENoNFIRJj1mynVxwcYtJJjqeZAolfn5hTqvFoNU/nVMVaPwKH/SeU7HEMYt
 rw3LO/U4y/TAxgFx8j/R0VPrjIZl3jdaMPB9FbY6rvkeM7a9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b6be1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: qQXKmAWwgtj2JbEluXUlLuN62LW6cy0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX0TJV1m/IIw9/
 EHrMqRYEEXGVGmhMlw1VFX+X4udpVnVo2cka91Ke92XlSoJ2YBdUGi+w37Su1PkX8EYqf1PArUh
 pxdWAT+F7BwBg3NIgnQIiT5LbHHdgAJ/FbIeC+Wh3MwD78OG9NmuNN1ewPXSY5nfO2TF77D77uB
 f2hXNcMV9Ms4iKfcP88TJi+Nzu+tu7Q9lJ3gwbCLmB26IT4DkGT30XI6xqCfUc2z4kIR/qGmHge
 cAhOSl9b0EcEjdgR8meNS9avM5VAP5liB2XRX2knh+eSoKicp/ukEcz58ckIG3MUhujawty4Ed3
 lFeFEEb37/2u6reyRS5ATI32iYgGZw7jXuSZ2gwdd2giRkmDz1/WU8/QfSIDgSWw2R4NguSfSrH
 X+GlW28Zn59e6WT6gtevQ00xCGozqZl1Wowy6NN3XGhO2LD3//e5EletqqY0RIvW42aCDxCG/OJ
 REKUcVr87DWtFW/ljDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX9gdRGNr0c5xN
 /YiZk3oX+cNUcS7Hwp+3m7/9XjNxQULqjy5u7MmGXuOHFzbKGUy/Y/0EF+a0m8QnF6cLCSQb+ge
 c4DhjT47KMwwhlGd/1ZqX+mM4+lEyFc=
X-Proofpoint-ORIG-GUID: qQXKmAWwgtj2JbEluXUlLuN62LW6cy0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

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
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 2dc121a3f5e8..dd2eeae0d9eb 100644
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
index a49113b0da23..375bcd923476 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -485,7 +485,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
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

