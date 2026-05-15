Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6D3481FBF
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845707; cv=none; b=se+vaYiS3c2THJuK3y5xVmnEvZLGvukG5L2CFMjH/P+lhvtvOq3t/yb+H1HOXWwZVJTF3mF9FOhh73oRwaZSWlheXfV5sH25IKTv26lZDEGL+uHirpg3ysJ7Qu09eJq+dpXFCKojIu1H/+dqlms3KaACzGSL/IBineEGSf5/K3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845707; c=relaxed/simple;
	bh=H5gjTCkahlz2x03Clh/PysKqV1bvgbU9MHDzqSGjKm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOfaUlcdDL57UTDEYrgSAcKeWnTrtaaAXzh87/Gpto8Tq2eOZuPnJoAB7xSQ+2yaCPPSpUM685aAutmilELge0OLRlARBUvIAEvO2hrSD1+CLgtQFuVVF/Jf6kJ1PrOu1+ZEydUmxoz0YAMDcZtTyOJBs+KOudBA9pxTV0YPqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfHhh1Jj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRwv7811; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfHhh1Jj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRwv7811"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBFmuj3219663
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=; b=kfHhh1JjbyhqqyxE
	J3y8s8hxF/o3wnr1p++SDbYzh+/yaK5OOpOXjxzjKXuuanffTPNAl1NUvlErNyx5
	z4SBZodGXgR/CoV+GxSWn7A2R1rVdBk8Oq/f8Q0cw9LWRVONx2KjSr6AkM9kaqP9
	KVxtkWIkHqGUCdEmtsWTdF2mIlyUQauD9VbS7apr/NdlvLQM3eijgpTAUaNUytSw
	fZoA4bYd6/2dKzlopkD+hUqfzFhxwHw4Xcx4k7jffefhtpOJAOTRMlQTs1h5NQz6
	5C6I9bv8UGCW3ULrx9YK61OodJ+c0hEnDQBoe1CgQRX1vDclRaM8I12SxJ9Kt/ua
	zFLQdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s32yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51650041428so27408201cf.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845698; x=1779450498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=QRwv7811J5Ce2gWxqwj++K8tNKVFm0J+CB+zYeLR4kajSsXtmIkaTt8fV8Dc0eZtMB
         tCP84k+24Y51N72L/y3HR3X0dWUgCS8SOkm21G0kK3BlEnZ/BJWIywyIOrnd1h82MEGd
         Ucnyc+Me54xHcGmrmVncGkYCtwy41hYIwbzgozcFbI7rdJ0Kmg+NkohnCnRYWWwpFjCa
         HwDZ64v4TU/goLpTG1SqY/vevKDZDcaxn4I5uvmClOSwNFL/HlmovljJR00TgLGJPsTI
         K9hCwXWN9vSJRMEjKXYXHhcTi42c1OMUpNDkOw6uWANO8Zn1j1VlDZN7QTAHAh83TvcL
         WTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845698; x=1779450498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=JBtRpQXL5UawhTP9b3meEe3Yw0+YAn1h6SS9jVl2Q/Yw6wz65HWJWOpyNVKwmhsk92
         kq8yn3XSd7RRwf5q5/pzikNzIoQMjsxRokEDWnalAXznJ0xlGZwyxeifxTQ5T/DwsRIP
         Wm99s7k0ggIHUgJCe3OroSm32Kx0bikLDMVW3ZFGjfl3sGrmWb9SuNsmR7xN5ot7pMbW
         aqq0MqylKQrIzfwUia3bniwgSOarFK9ACuyZxENHuZyZMaolhg9HVMZOJji9p2SM+08S
         PmATVADF+TtHLndMswRbBNjeD5uwuOWSbqr1PLdG35PsMiHm82ZLrw2jwq0vNNHM5+oi
         op1w==
X-Forwarded-Encrypted: i=1; AFNElJ+hyfIXBsnec/c3xtXIsR0ePVDwSAA+HdiymgKYv4CpXUgoRofvOAmxMFMbbUwaN+J4k8RFwwE85yDm@vger.kernel.org
X-Gm-Message-State: AOJu0YyFywuu96wT0Lq9Yn4nktEkMqVk+pXVXoENa5niyseg7aFktayE
	GFZBKeuzDVcZHZCzgV9Bcyw+czaRIdNCyRar8B6QtZwmCvZBYK8qhBFTZiR3gW4j+b7YMDN6JkY
	gJ9hqVnkKHaTY9SmfAvDWbykfouiws0JLd1FUw5NanHawfTHg4ysqqHM/6TVmhhL5
X-Gm-Gg: Acq92OFMJVD4yySyk8q6ul2GQYY/1IJxqrurGEJfa0XhHrY2SaIMzQF0lYoqGdgMLr5
	mMjzsXLkALdSA+Z5YtlsbQkH+Ni4lgdwg9t4u110pqXTKvhjbYRNySdKR8sGBNkwh3BrekuSju6
	LyHUi0CchCaBl74sNFNdhIj6NJ2DKMZNHHXhk0s8ZANvQBMTYMRc2EvbIgO9kF76AgVYAX8p6cQ
	UgYGBWNgfxHGIYW7l9c2AkC9ykoql1vep3XpPqP96NnYztK8T4LX8+WB1HIWLPaY7YAUYGZMXCx
	oTG2td+NKFydFDAJhfovHogvl3fkRpO11VeCzT/bn45lEuKUd3tAFwx9QE0SsybHsPfSnc1/r0D
	E7NB+JaSp995YI7XWK5TpOex4Y7Gc8u4KPwkI/ITJuTsTmHGi/J67D1vHp1sg5TnlYJYi091hdY
	ZQ+5JJ6FGniAytPFDGdWnpDk0lteiXPBOj3xw=
X-Received: by 2002:ac8:7d0c:0:b0:50d:7cd4:4a6d with SMTP id d75a77b69052e-5165a22c1aemr44326451cf.49.1778845698437;
        Fri, 15 May 2026 04:48:18 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:50d:7cd4:4a6d with SMTP id d75a77b69052e-5165a22c1aemr44325911cf.49.1778845697887;
        Fri, 15 May 2026 04:48:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:04 +0300
Subject: [PATCH v3 05/16] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-5-df3846e74347@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3064;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1XoxNMQkIKQIwreQUtjXXBpaKx8sVaEKHYTsCNEF0Ak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf0vjk6YO4TwvjY68+1/w5EBPeAI2SLFzuAc
 iDZmqPYb+eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1TyWCAClFlyaXfpWYPebKJ+saiHVwdfm+m5VggAzFLAPMm9f2svECaINvdl2p514KGKrBkuQnAW
 LNLdwZc4BVzdvYZMfKpq5HWfFlkZfI9okrDokyxpCHq0tRr9NrkZFxRu+xkD3jdKcTQs+NvmH1n
 CPilCxTqj0ABQcRLFxnwq5JdArGQIhyzN6vU3gNhQA/+xX6XbGCJunZAG+VO12KiO8uIBBj63EW
 SArvuTdKokFU/Q3cJEz/hDhu5omwmw28qOmlSOoNZMXREUTqQ1GrWNgXMKaMHH5+LEG1GQOjwyG
 4yWcYOSr082e/sCycyMEEJ0MR5+anHuTZLKnzFa1VKpE6nZz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfXyObyz71pgP1B
 hidK/fmNoiV624rVGfdW4QABr3aw59RY9SmdSaPz9wLZGI9gitr56PzzHr0kmWWgDFOo2Q1KHQS
 4V5BXwT2LyAvZo6uz9nMbpqrUQGgvklnkF+ZTHQhpnDsdd/v6GUJl4yWfsq3o23+FGL7pgKnDBR
 EyYnUg16RRW5RwXxiq2XjXV/GtuSDcO2vnuxsn+cNCy2fXQwqHTkZqhhvwyKXGJoTN4dT9n2qDv
 iRIN+pcUART148XKFd/yqF6o1gT+pIkQGPX4mJxapEQE8+8+tWoWuUXhLD8ILdX1tam1Bzjodj5
 EMB5J5iQz0eBN9zTbRpu+0nmIWU9pGHYtBquxqQZErpc4GDvzs+fWmb/1pAkOJKgtXNbfweZVd6
 8nIwLavRC43rJeMufJlWVmq/gtH70wnxzaqfqY7nscGvuqV6pcqp8JLdt5M9FPeZTnXAUtSqq89
 K4vrVgF83T+3cbayWAA==
X-Proofpoint-GUID: HxmNftOXlbv0T6X5x42wufTmGJ6hFCcj
X-Proofpoint-ORIG-GUID: HxmNftOXlbv0T6X5x42wufTmGJ6hFCcj
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a070803 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119

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

