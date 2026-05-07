Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59374342517
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136150; cv=none; b=e7llUkUyBtaw5BTK1BOkxlbWvicuEbCQ3nKHLz1OrB5NJ4sor4jjH+um1mFSD7mCifInpAX9V0mupRm43P+9o/PEILto5DfEmMLgmtI7PLP3Cf540kpuZbd6aQYYdU9gl1AO1+uvQJ25nDldM/NtDbVeNb7SZYd0EiOF1QNtU3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136150; c=relaxed/simple;
	bh=xdQhJoUl0aK+2Ix7d2cAxdXiGObKKMBXv2H0iO+htCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ri7Ij4WtjDNOZgCh6BIhAtnO+q2FdGmx+/Bd+eZ5XISf83eNmfTAnVZdm8n+ciejIhbjoFQLpoufMCep7S0GoaL8PdarGu7vC53Tcs/8Wyd62F44vefP6/+dqkiVBLOx3ezeb/IisSuGCkIclvBKSFn/mPoStNblMjQsqJqWW64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IvIzYQb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAI3czjD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IvIzYQb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAI3czjD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64743v5k150864
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6gPMzFlIvZlXBHM8qU79sOvtNXYw2NQG6gyfTtDAqA=; b=IvIzYQb7WOPHaE1P
	zkQoQoQ88Sn5Aua6DVMoyNqN+v/c/twkT/ZOX99Y/+Jm8v0dD/IGuXYFRX603ab0
	Oy8uaQqZd5lBwELimG7Wxk6b3WYJpJYlYXv795SMELmTbRHeP7ZxldfGKjv1OsMy
	sir7trCEPC4yBOWFguIKrHZY0fpbQdl5e8ZX/k6bTAtdiHRAH61q0rh71Zh3SOSr
	406I7FVm3TZ5DapQXesepbzyAiVOMvvzrswDMGECjuDvVpwjby0KC6miJ19loKlO
	hdzDkz6UWx4LGzEoZdMdI5v8ykGngRUXtE+4EXdN9LBAmdcBvswHrZ8zZAy4Q4P9
	rZZMLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrge7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:42:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9a6a853bso11402191cf.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136141; x=1778740941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6gPMzFlIvZlXBHM8qU79sOvtNXYw2NQG6gyfTtDAqA=;
        b=LAI3czjD2IFJ0FDiQebvEzrISYQeLgEK6OuRBAuoFrqknQDc25Fn64M71Sovn+Tz7j
         tdAu7JAJ8B05bMbRhJIrQJh+tUXvLYAvsSBsPeyOatjI4+vGDXtLoNcZ0/557f3W8SXX
         KZOS0SaAQ+eKOtoR1Yl2PWazXL9XYs4KprcFp4iFXTM+/Z/vOmC810l7kAvwZBKE6eGW
         yIKGRuS2k6HZ1TxVPrtngsgkDluZl/0HJUXudN7rdkYd47voSbph/nZx6yiWMznYl4rr
         vxejvLy+PtCtZUBNTkhKsRbUF9kMQd6FgOwesZQlEjQJ9CGIpl8BM5sL/Nhf791ngnuo
         MeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136141; x=1778740941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K6gPMzFlIvZlXBHM8qU79sOvtNXYw2NQG6gyfTtDAqA=;
        b=sjQbDSH2agqvhiZm7CTTvvLLuuzgc11JRM11ndeRH45X+z+tuUPAcalnicCMRAWY4B
         c5w9s261mPafDCC+S0koNa2/+5kA4eae4TDDo1VygxywLJ/Tb5hKkv+Jehj9yUHqmEtM
         SrURVu2HDStyg+cwJ4xKxDptXisg4ELD9gzGZ83W9Y2/bzz4GDkALGMH7lI7bDdC97Ar
         O1es+HffHke1v7T+Jb1UNZzvtqDlAfMSjvRfYjC+8yctsYQwNVGDbjwfs6Zm8VpPUKX5
         JEd4B0l+1lii2CuOM9ndY8FbwU5N7CmVcJDrEd/p200l0mHnMAfFJQgQGZH3QwHODRNc
         3n+w==
X-Forwarded-Encrypted: i=1; AFNElJ9x/0I8oh6Lhf9GNUfmRlrEZLvpMuxHo6+yzBL8XtOhhWCNUFO1xPppZuocBxVrH2zTqDdAzQm39I6k@vger.kernel.org
X-Gm-Message-State: AOJu0YxZR8RyTp8Tc0xG9hFdyE2bq6iZ1FREu1WuAVB99c+7tnZXI7z3
	aY6+1g57jr72Hp1bSSYEjQdKyf3xWewGGOsk8+JYFB5QLrK10I9E6JrEmukJOgxhkzh4g4RtPc+
	BadKDL4NugfNgguVXS0CSelFFh128xsePGZFDdfNO/1hhHCQm12C02R9RMz/UPgIj
X-Gm-Gg: AeBDiesf3WR0IiYVjpZvEj/p8Oq+pZH0CXbyTVH2DabH4Y0jaQO6UojPd1DjU3jWvHd
	UonGvs23ZQMMgBJ9DVZCknlrK9XUp3J2HWFeghxtnwLpMGkiBv1IAdzOD/frRPMkPUY5hdklzIP
	NMF8sFN7liBiFD9oq+WZltY/4iU7N4NXru7Ia0hADibp6C4xjLJB+GSZKB8DzuKOfM14Tv9NGPw
	9qDbYZBrZoLN1YFFrPVBL5HzeH05EK6KFm418nmO9YyVfKAxYyfF8H2BFz+UIfOjQ2QXsKPoSWv
	hA9sUGwVC5vk4m9UmSnGvNjMvawg/V7yJxo1GcHsXz9okp/QpM0i/jlLHyn4qTsszSNs6Tibnsn
	S0u22ksFnrncSpQxUv0Qz5NweRXV0TFgh/5wII6elwJfgxPKt4+7GScXooxzRJCapuyrX+T/G6z
	kK9W8diLujwGmexFRniM/7mcAJGkUd0WfNJ+jJbFVBseSc3+IkxiT2sC++
X-Received: by 2002:ac8:5a16:0:b0:50d:9b07:9c46 with SMTP id d75a77b69052e-51461fa0213mr88562151cf.33.1778136141258;
        Wed, 06 May 2026 23:42:21 -0700 (PDT)
X-Received: by 2002:ac8:5a16:0:b0:50d:9b07:9c46 with SMTP id d75a77b69052e-51461fa0213mr88561731cf.33.1778136140689;
        Wed, 06 May 2026 23:42:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:04 +0300
Subject: [PATCH 04/16] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-4-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4808;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kj6DR4cWKV5C9mtO2ZoEmuI7vButCz1bmXA5tAl5t+s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ9Hyz/kn/F85otEYZf67npXz19pmKP2Hbp+
 Fgk+1pPQ0qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PQAKCRCLPIo+Aiko
 1YF7CACjGCz72GFhw/gpDY0hwHCUoaGnWm8mgR/jZt6ore8OMwxm2844pyZdKczzgoeEPs3tgJH
 spFEdZu3JDscpeoDulWpxRfaWUunIsC1FZ2z3P0PxUj/mJVlPDy/KhAbUVIHxfFCg877P6qhE64
 7tsOqp5A0ylH9TXZb3NooA9mikck28rs90hMaJz2ok4Np6CbT9sRTwcFEnFpqT++61GKD12mZZ/
 ibe5YOXKStvs3aheavHTfLg4ETLd3mIDqxIlo5moM9u+BSffCF28dH1Px2Un/mxe8AYtDbev6zU
 ftsZykq055cP7OBAqm9LrZie5G3DerAiBXKoIvtxhur81tnw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc344d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: xU-BuYW5cqVS_J92RjLTeYW5e9lWyvg3
X-Proofpoint-ORIG-GUID: xU-BuYW5cqVS_J92RjLTeYW5e9lWyvg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX8Ooo4pAY7kNL
 +UXiYxlVayDpQjcwlKR438P9jEqB9nAYsLe0N+gUQ2KxTM0RwaxiKNnN8P+F/xOFuj/TPa/CAj/
 tt5Cvkp8YrDKwxGHp8Vz5GJxlXJecBLx0mbNIAbWjlFVyTgFRRglM2JQ3wp1rarzO3TVUlAkIEK
 UT03Xbiaxtof8s1ynOgOBV8Rpwa48aqOJSzTK9c0suhKdn9P2Ln1NAth0okycERBIzUepsTAPkt
 J1fUEQIqebWrKFIx+gp2rtPgtLuYj33t0qVq5EczZr3E/hu+5xTyTf7BakCHp1VDFdNCAJD/zeP
 kyGWiFEeVtrARSsHQCmPMk7ajodesM8ULoUjZUPkAxYtipin+7+Pt+5xdFAu905WpqW2hTaxU85
 Cr6MeajZZw/EwuKfvSgdHV6Z5d3OEDLbr21oVn/wjUGvvH/BGgzRVh/yHXO0XHMN8kyas+PGu/u
 5NzZBA1MW3rvT7nZs8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The interrupt_init sequence is currently shared across all supported
devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move interrupt_init into a vpu_op to allow per-device customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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

