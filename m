Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA77A44D695
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676562; cv=none; b=qkUFfxjZKyZIeiTgTMdL6BXmSKl/6ZnCIb5pyEx15WKC3pk0C59Zr+vFqnm624XxKOBQGbMOXbYmFbjyZ6cHIBIp5+roff7Se+E728kduq2hrlERtrIiYoC3h1Kb6vbxI8tfN6TkrWxlGnKi883bOHuYcjIaWflIxH8k6DUXEmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676562; c=relaxed/simple;
	bh=H5gjTCkahlz2x03Clh/PysKqV1bvgbU9MHDzqSGjKm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYDp1RreQCWoDxLjVVO1p+c+aWFwZb3QDYp3ceI2hEmdhCjWVmWjnWEa1BXwPAM5SdyUsSYc1wLt8PCkLNrME5btS6eNfAdoEwbj1E/2fI8B4lj9RRZNpNl17sPIjnL7PIP7fYI5kS+unpWXZ+wZtPJYse0mCvV6GtWZOVhJLCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHUzCddD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M6WgQcZv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHUzCddD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M6WgQcZv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAeYrC1393072
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=; b=KHUzCddDiTvcVn7L
	eYDw0u9Du2lA+IhRiZRLVBHOOayImWHC9ZLcDuYgVHFPNbDBEt+fNRQDdgPqApgT
	spPffRh+ccbLn48GXJKpD+WqCnlf7P0KXbxGWZ1DM+rv1HvhH1rGo+Rgkife3Is/
	VudNadugo3FmLl5Fkzq+kMoMlFVfhzDxI16Z7LKNsxuDCEX8l6Ybc8UR0ubKXYcy
	jTQZii+9leHhxXpLlxl4ufOcB86UMBhAiRidxbMgIPW/7s4ie3PZJ+BtNlwZuXgG
	8XxaRYjpZHBbqTC1AvVTKXn4b/XIB2IO94o6cQqJNRMNF78ifL9nrhDJXz97vJ2c
	axkc5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261nys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514ae0e3ad6so97920241cf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676559; x=1779281359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=M6WgQcZvoMiJuH2hX223OhcLZ6yPVJfl1KP+X1vAxUUJORwJWpCJypAt7BrTMa1o9q
         vCMEnpCUyIi0Fy6+b/Uu+rh/b94ID3xXYFfQUDj2Ho+1JsP/68QyxpWr6vmMV1gQ0rX6
         h5b3L8tOsTLNsk71ag3PkGSnxDPOkY8ncVAymGaJ3jSWpsyIjuChOvtpp3egF0XQhXnw
         P0m8a9XELkRXRwRUNJHp1h6vJgNCd6gtbLYBIKUFMpLMDCAEUH8I+GetkHkSk4fnA1W+
         GPuubdAMa5RYyKkZryl6Ze8uK2Wudu8zf8IuCXPPwMNM5n/+VjVq2FEe9/L4GsrUeTga
         tk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676559; x=1779281359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=Fibw3ecv7bp142G9y7nfaQh2YXZaKTBuf/5yNgCXzrIQPM/LvEdwxEOW7BQ6ocBlxu
         EMlAakNlV3VB0YqlrUoUqd/tNKYmKEasP9QyfkhYVqx4A32WaeGlDmTDQ9+YG0pqt1PW
         3fZiAe1MhiV8xUz2PuzDRfprtTc0XFZXTGr1mUUN85NEs8wvKlQmK6flIyAJtbEjSvge
         ZcVdGCMbE+tqSeKtYhrrvJnVIBqCaPKEX6Ed4RYZ5ViXvhHwnEAmE0cd7eqi2COMEpSI
         gEToaU8Y1GMBYwXFr5okaRhYtk10Z/2Dw/MLtsPx3W4bT3qLJO87ybVH9DpHeLExQWEY
         7jCg==
X-Forwarded-Encrypted: i=1; AFNElJ9oKST2mocWntjUywMDXLHHcbR1Q4VLV+mPzObPfhtuHljX2x4I4hqW2w1dOqsdRE01PnUrw/ck8jVS@vger.kernel.org
X-Gm-Message-State: AOJu0YyCMXBs2ARXcw0sx9JCpedciXRNUnjrHoFQBiFAO8tDsA+MyRyY
	MpZhxU9buz6ePZVQnw7uztjqhLBCDDkkcEACJcP72D4oBluyZevT0xae4bAdAIXHiuHinZh/hrE
	0CB3FEBxIxbmMAKDgFlNwwAMCgXFybg5BB1MjDaPqjVB+YOfXKxvPBasMISAmoJwz
X-Gm-Gg: Acq92OGuVK6ENEa5pDIj64ackVctiOH/GaVgM8YRl8Rff2esbj74bUh6dczgLj9G9z5
	JsyzIQKS6nve2oWCiiA7Bm6ib8AAKQQ4079CMsAfjhRHumdbY/htMvqdPoPuDAnA+JHkhAZYTF5
	UoS6PLJkzbC9WO+yHZTxSqXGqHsdLCtjauJqkYVURLvgSaNidjDKorImr+QuppTuhH/+UabHTiL
	tI+/3B1VIpl3Bz9xQTRuSf6j19rykaf0Wfyq2/xTuy+xUyCbwWiTGPy2zB1eV+JtVQaUSCrLKtv
	inwEPd3sPeuoXNGj9GsaghkbGrKWlgOvZIISSCErxntgOZpTh3INs7grSACS5VjdfGkgXubYaU1
	5tTC722ZYck0pRZcHZfsCL1Q10/v/+szPeZVZqZy84s54L+EUaggxCGE4vdHjdeMT3hYx7qgz1P
	abFK5Kg+rQbTA8AyHwKXrWqXV+DGnX2nkaBMY=
X-Received: by 2002:a05:622a:1196:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-514cefd2ae5mr95932651cf.23.1778676559044;
        Wed, 13 May 2026 05:49:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1196:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-514cefd2ae5mr95932051cf.23.1778676558420;
        Wed, 13 May 2026 05:49:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:39 +0300
Subject: [PATCH v2 05/16] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-5-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3064;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1XoxNMQkIKQIwreQUtjXXBpaKx8sVaEKHYTsCNEF0Ak=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxZLsQNzcCvzi4oTH9ZOftKUqvA16aTiHmMXwSb3rbEn3
 RM2777YyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJqB7iYOg8UhrLZXz5hNH/
 srJjDpPfVGmy109YWl++SoJHjjXj28ZnK4/1RnAfyWFiOTmHc0Fq3/O3hQ165bc67Z1mbNsp3uM
 cI3gje3Hq7ok1Zjc2WD8XYvbIKj3fOTNPfZLiPouVPAo7UsNcTyUeuDQlSibzSIhxqqO9dcnd3R
 trnnqIfK9OWmbqJqDDald4Ncpu2pS2jjW6+SF9UW6FOtqrDl7MlfIPPXrv8T7B7pxVOfc62p5N9
 Lo8acun79UvbU9e+jlFdlJMbbSa88X3j8rvGz8v1O6Jmm1dWdugZyqcMMsy1+fq5fmH7/pqKX+3
 LVxkGCTLkPfXtWzq3TfeBfv4bCK+tXZoba2o+nf/+PM8AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a047350 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX1tcL8/1d7pCW
 mzGTne3MwqguqAt3lZmf75YZgSF8U70YYmhKb4ozSAOkBbTeifeuqG8JywJHQH06MV6A0gWeoYy
 81s7LUjzei0YFsd0SixORFT+So+qn1sx+mPFgaeOE7Trb6gAi7/BT2p84S1VvUDX3RdM6GA72UI
 HABu7eZAtdJpArKMD+/6OJD9aj/mf864Kn77HekqBq1vVCCWEkgohDYz37WIOIxPkjfeBb+nXFv
 ejomzzTqxWt0O2x+OGh+cA7rA2mIH5kTtzZDum9+LK+9pqNfeUPQ5z7dZiN5+yvAeYZasIcxS4V
 SO92kmVsZeOt68DlfebomfeKI2CBOznigNjvNn4hEFVqZEd+HrrmT5dus6WaJNoluttP5M2/mnA
 IcQFL8rGZ922SFWPLvj3KUvtvHq1fabxgQHNofNEyUrlqme8h6aUwFOxKwNzt+zoWuOMwQnAn1A
 3vPGJtWPQWK0bwAObzw==
X-Proofpoint-ORIG-GUID: VpxEPV5kbGRNCIFqTimxRrcyEexQgSJg
X-Proofpoint-GUID: VpxEPV5kbGRNCIFqTimxRrcyEexQgSJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..bd22076f3557 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -45,6 +45,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -78,6 +79,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_hfi_core_init(core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3

