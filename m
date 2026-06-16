Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC1D14F70
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568296; cv=none; b=m1cvjLaJ6Wqv5KLVMOEV+rCBZCyEgoqM1HyWnJwJOWhrBKKN++zosYvgHYVDEOleM5so4iimRZn6UrbBxBv1Ex8h3j29xxVcR4QI1UUXlrOhrrUlZMyff9wVMMCJL+yk+fnxMXbyg73kWChfw6BVYC3JGDEyNlexyatUdjZtIZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568296; c=relaxed/simple;
	bh=mn+e/RylLLe8OTePgCv2X/kFcuAkbIe3sFltrQBvOOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ua63Q7hTNdhTMUOraBLoaMgowqQKLaAO6grQlrSgDoQhLjbW1vaez5+QYmCG/Q2Wa3qtkNl9+ejXpu+MmUQVB7RF/DYr23s9MWG+C46Uo/IL+rseY8kKzp3+vzAvlyNd8hzX0d+KrjPD1qkweKEOajNMZqvfSvPPgsSQ0e3wIqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f159LoDw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNinkRFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f159LoDw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNinkRFp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIwxHh881740
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=; b=f159LoDwNqlGlkGt
	96eYEjasqTgPKsCV/S+X37DuulLm0Y+WtQqYIvvB4k2AIhDJ5ZJ7fhTRySRxRtAL
	swbSNXg5m9ybckJG58EBxnxFRVXn8j7WYmRbs9bcwJ6CG9B3AlznHizx0HnC8M9y
	nItXvGuH9qXJaS9J59gdAzwFcnHNfGpfIxzEwmX8lXV6GDjLB4JSHJN/FMs5XmwB
	1/L4NVKX8FlXGLrlvixdmEpz/l74yeEvigEuLRiGZjRNis8zdaUNovDipGkah0js
	w/mHpDS9ahXtZwFeIXWj8QzvlH0iNNHfAp71u0szJWvQ5Jnh9Y+UPC1L+upeA6r+
	0xqMlg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0kq2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9159bc52211so381769085a.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568294; x=1782173094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=;
        b=gNinkRFpYGmytpeuIGqML8KwiCbEfA095VnmkjlGZgFx54DoMe9na6JVzRJ+ahxBJn
         VkbYr3uNFH2eaT+kNYR4Kp0hhjVhsN3YxsLCQ4mlbSjoJ0gHpOz0mSlNaeWoYs08EBz7
         F+o8Ll1KHpnrcTX2dmGzZzroihTZv2sUpBS53iRNQgzU85DnC+ITln9aFjgzdXrE0Ys/
         ByfoQj2h96UxvMw8FFX9IXyQDgE0SHm9kfyBaVxWlaVrjoVXyH3IUx+m6lNPajkVOvGp
         WVZIHNuWX0XxF5UqvP3Yam4doEWsEwDvV+IeNv3MN0spvlDb8n1dGRn5Ch77Pl+akusp
         2rMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568294; x=1782173094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=;
        b=YIVTtfMEGoathSe41sBqMy+41qtbkKksJJapQFLuJA0T1XKKvvL7RENF3N6WRqdJv6
         A/iOZjbXUqaOE01eKIaeDuFZ38lNl1SqvRtSfc1/YbKcaA160SvAfUHxW0r8OQpTCYFV
         jK4H+nj6IiiLpmZf3F0PWoT/rdqM5jZT4apKUAiXm4qdVqBfanw6kVCLRGMLf3/ImFmv
         BA5GhfzFIgfIhb0RE45bGrcAxcfuMB8V1+JlwbFvi2BcwotYG/geNT+GvubamHMqo4eM
         M2OlQR0lsKdP+8ZRDdmc2xIEyshaSOT++3nipuQCmP6PqkyXkndbH8MsYeWD3mBKfoWO
         RpKg==
X-Forwarded-Encrypted: i=1; AFNElJ9JQBK7bwC0NNH0sdfaJMOdzSQmF/OwOQue6wrVEHZgnNtfmd2hVcc8gVCEmNnBCBCvcvGHJ/auhH/v@vger.kernel.org
X-Gm-Message-State: AOJu0YxhwduwSMjaqK0SyJkOPiatKSTsE5ef09o+liOHyC/YidtyVjZH
	d2Eu/yUMtqj+eFaT/MKDmWCDNLbKA5e7gaROt+wpcbs9R+p+vR4jbSXiG+RYzm/0vezI/noSX99
	8uudM7A5gyeWnIXRq4k+zB7TMlTnkcIY4A329sbMjkblYgmfZH9dnlOEomOc9SJ/7
X-Gm-Gg: Acq92OFmZV4bk1PGBpsdwF6eQp752khgf+cwowbu2k4kSIzI2LQ3O3WoM8rw+Z4ZOs0
	Asjltss0bNKYS0r677/m1pPDdeoZUJ79FzpFjNvz8zuIU+/VrgbRSpILn4A3qmOBU7STYviAVqZ
	6yzf3xWrnqtTpu/BuEobCnQ/xEgzLQZvqg6pVrXVe0xUNwKMG+6JNP6sZGmRSf1UI+vNedtHsmk
	F5xWLqviSSpD08GyuEWQQiUti2A5Kr0tVJyLz5Nw8MgAn+8TtfRshHjkmO7nQ+VnoxXwjCd0sM5
	7uOGCLfIoX/yNEGv1ao2E7OQsQ7eMdfMFnbMmuKnC7RI5MAo4YQVHQ3ELTxYF2o5JjKPUfrhjXM
	AsSYs8Zg3GdPtQUqsrlTR8HVlJoEpuSd/tFIm9oATwS9MsE9gMjIl6pEJaN4/zZYqJd1OrXMHDk
	q0W3VKc0IL/sM1cndlIbgdD7Is9P2GZwq1PAg=
X-Received: by 2002:a05:620a:270b:b0:915:bf79:3e09 with SMTP id af79cd13be357-917f1474c81mr1970545985a.44.1781568293765;
        Mon, 15 Jun 2026 17:04:53 -0700 (PDT)
X-Received: by 2002:a05:620a:270b:b0:915:bf79:3e09 with SMTP id af79cd13be357-917f1474c81mr1970540385a.44.1781568293243;
        Mon, 15 Jun 2026 17:04:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:31 +0300
Subject: [PATCH v5 04/16] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-4-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5bBZL7qvPUPxHc5l36bc7PoE38NQ+LNbTd93dzz3z5U/
 COa+1uok9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT+dbOwTDvvXShePai3szm
 8pm7mTavnfN460VflvIMre8m58wz7/Wxtz569OCh5eK1Rk4bBB6eM1DZ96+jNySJL1mqtdd2V+P
 CJbyNFdxzTetKPltnq7IYWagF/jKJ2l3w5vBOkdc/jer+fnyr2rcjy/yYoYPDw7npS6O+HYz3P1
 U4cQZjEE9Qar38PJ1LTiK1R6/+Wc6jOjFANlokpGbL2r5575bZrqyuLTGvUGQvYbIvfnX573HLF
 VyfN2l7i9jJTJurNWMNq4x5/MWPkj77ZoYF79LL+zfpT9axvbd38+TyLPRkY3FWTBW40cpZZi18
 +7V74oJLLP/PGJYF9/YJlnupFf/TFCr883D6Lq+GOsZPAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX2YiSbTOi6Xyg
 JG9GET+AKzku4WO8ntNWFohmh3Rp36pEuiCCqC6+XWKDYjvxTRuULI7POvIpWmfDLURM2VC17da
 o5zFwCOJCGqaj4IYWXbhb2fZZCohPEI=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a309326 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX2hqlwnMPbqhL
 SqjQ7uGvQ81ZQVPEHYJ8jkrq39QNTZpPZIbAkNrTfMZJ3j86cw8L9hp5a89UhJoS6X2spQtIoDT
 +Mu5IVMQfhxUgvTwvQHnAIfPuZAid67ZjW6oHis21xmdpPrqA6i5RG8zNCAS3OpUbHJM4DvnUWr
 OSQD2Wpnzg0BFxrNWIQpr+BLf4FMBLLifEFvSMnpeYhVorKXoEG7ew6nxtOAJXXsjKwYV+HvIay
 IFEGmQlDzjYXC1yXcW6SmlgXfMxE35Gk9jNwKvTCmJrPw4CZ0lv05f4PAwiWpGVic3k6d/Uv/Eb
 PSn+M0QCHfD3KZt7qqD85nadASyjCQ/rsfaFMVftp7f7NCZHdvo04lU6nhfLAuAhwRga9nClZUf
 ZP3iiKH9+cAnWF+Sf8JxRFRXZcSOAQ8Zr7BhilONqbMgXFXnB4Ig09J8rN3ZJRoXNZDSINJi6qM
 juDqRs9AqOTr9T/xQ9Q==
X-Proofpoint-GUID: T0i8ONTbFYGs1yyDVfgWCDeJgIzXqyCD
X-Proofpoint-ORIG-GUID: T0i8ONTbFYGs1yyDVfgWCDeJgIzXqyCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254

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

