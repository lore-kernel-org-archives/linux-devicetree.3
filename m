Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E0A8634C
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568300; cv=none; b=DNwa0BDXtYHRgrmYXrFtlhc8sxnMvK9WqeZQAO3F42elPiYYCa4ivXNabSg6Gl6duWnhpzuLBamRpWebjc0X79cstN5ppWTRDYBQblyAkm0QNoKT3HfvzD4Bw/X3xj8kGGUxx9QGn979O24IAsbVTQwydtU8Bur1tChZKic2SlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568300; c=relaxed/simple;
	bh=H5gjTCkahlz2x03Clh/PysKqV1bvgbU9MHDzqSGjKm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHXrMsji+ypyQX8CWONJN43WVVRDZOJkGVUHHorwfK6EZAXEnEIDAxtwMK9zkouIIv+XFvYORIYZ3DDLPgAbj8y8zci7ANHlOkvABMylQeObtX1Fr/NqiebKKI9bwj0HupkLCsHK/Da38reRn6q2wALaT6ip4dhmkxfhbdDVy68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqMt8xjQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vj9Dthlt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqMt8xjQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vj9Dthlt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx7Gv861018
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=; b=hqMt8xjQWmgHItyW
	hY3ukjeudWwLqasB2qaKs5dIOXaxuAotqLI9NWAIXDnPhBDB3vtKSu/lTIeMFqLZ
	EX1a8dRz4+xrEx9+tReBi71DMxIv/YZvIai/c2kYqEVIZmnqBBOFSjuohGdkr88Q
	9jjRIZkSrM2Txj2ohPh8NNsn3rdy5NcSap2s7knszs+/TZ6Kv+ZsfBMftgY9jVYf
	BbaWGI/7o2XmN0Oztcdt9++ek9BVYjcWKXVfHeZzfKNu4PewyR2JEPXOt9cYBj7a
	edj4Vn3laEcj/m7TkCqvNeA6J+I1xUfr/43/7ANWNBh2SaRQLxsIZJR3jrygD9Dh
	IbRThA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbmq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157de5360fso902666185a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568297; x=1782173097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=Vj9DthltNP2NxgPMS/rhFDdRt9TLbvoTxgJ70swXgWUqnUhMGKAdHcnhl3+of5/24F
         ZDajpIymUk/7fcCC81c/1BSeY1uKFFP2mli2cQA1e82TbYMu0XwyOiAykTQkNik5uQ0D
         P8I8qTELWM46O7HUGZM/lOpn20KIC215X28StvnGKSTvx/9OonCkpU9Mvg8wfrJM616V
         YvAzuAwmPVVzCpFZ/a76sKOs1+Reea+W57J8WbOdZlPnomz+WrA9P2rd32c9OOWB8Mef
         MAZwbev7WbIRLZFCDiUvJnteOhSEKOHd7SPemzKu2qHB/5UfoGRReEeVLMXbaqO4MsT2
         78WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568297; x=1782173097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=lre3EqbgRyHmCXtwOS8jnTFBWj3oLGn3KMzrY3Vxdo2pcvGPjFFrXmFzDns2f0KBBe
         5QupeKC/sy7JfIxMSBLW0XXIKfOq/ABxL4PSYsI3YVP2xoAV7U2YSjXkEgqqFcSFrP4n
         3BMvOz+iI78XupZ5NpxtqX5aNafHLIHVs2CMUFFqhpFcZYALfn2OFA/SlvxQHskzs3LV
         gYPUoXI+y1u8NwizQLQICsmtWijTCDz3wVGatzxdMMOZxLcgb/GTMJYoWwkulykLBM85
         PaI1/bdKGpH07o+q73PqK3SkeW4iY+pkpJuOugrO36zD7eH/6apMWvBo1Jri/S0l5b56
         V/8w==
X-Forwarded-Encrypted: i=1; AFNElJ84fIbgMdlbrYBxVVQ1fp9o+f29EE+ilt4jq7SMJo3+H+ugRCEY7h8RK05r2LpMiV9eQ3JRFGrJtwF/@vger.kernel.org
X-Gm-Message-State: AOJu0YxC5bOEi1sLzY8jrZ6HlDzO/GWgo2T5ZmW0Kzs2GJBzMV50mDfJ
	MpSl6GiOWgomKOJMYvTsStz+QZrxM0ksWfDeYjOfs1RxrhrKpJbO1Um5iwr7Ft87e8ysht/aawW
	K20/Xm89ilDEXWtAjKgAXqqwACeo8tQzTf0/jS7N9GdaJSDVzz5NRIxEYMeOSuhXy
X-Gm-Gg: Acq92OG8u5kt+9a/j8qmy9j8XP9s2c6Gz6Rf+QwpzMqDEKnTEg0db/UGNkWXauUPD2v
	saIlyInRd8Q/w0v+p13VFvGlmK6kjnX9mq9bdo8vzBPn3F7jPp6GAppV/lIU1U6NOR0zwAvYSWB
	tI2lMJK8S7myInZmHF12gLvi1xWd4NjsgS/ylRJljHKLnwOTg3PMJxKCzIOmTPv39ZgHeKzIL5g
	AVW85CS6QqoeGfYyT9lyewqOSU9vuFyY//PM79LCxqXhAKuSoJ4U0MrUtd6t2/gFhUNUUlyV3N7
	cW9WeqZ139ZYDkk5KqW6b1THxoKuRTE5NxJQxx9hT9b/aYTuHwOBrVsLm5pbYQr6LJQ2jD7w91t
	IBF23dSh6DXcEA6g7ZpryOETGpXQGbzKke9miJTivmTLqRn5SVGc8MwPDIYwhHr1hWBU9yGvvXB
	S8mMvZF6vuraBDGUIdWA6kcK4lJeY+dGn9veM=
X-Received: by 2002:a05:620a:7014:b0:90f:47f6:832f with SMTP id af79cd13be357-91c2f4b575fmr236452485a.33.1781568297207;
        Mon, 15 Jun 2026 17:04:57 -0700 (PDT)
X-Received: by 2002:a05:620a:7014:b0:90f:47f6:832f with SMTP id af79cd13be357-91c2f4b575fmr236448285a.33.1781568296646;
        Mon, 15 Jun 2026 17:04:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:32 +0300
Subject: [PATCH v5 05/16] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-5-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3064;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1XoxNMQkIKQIwreQUtjXXBpaKx8sVaEKHYTsCNEF0Ak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMOFCSBUjYKpeV5O62WLur1Lf+FhvaEbbPEC
 dCYVRVFkYSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDgAKCRCLPIo+Aiko
 1f8kB/wP/NZcnkyFWquaYiZTWR/p4Bya2N1Xawcrr3joY5LORcCGVyOmcLwrn/TGb4paCCd+tbk
 VUtV7EegN2dNGpr9mYPH25+J4PEXLuPBp7x91SnWvxf91uvi4FuyLv+hfJnhcWBEBiFCNr8BXjQ
 O1uyOkWxZ7UdNZp3twRtJn0/Ar4uf3MwJJGwbxe5Gn/K3v2dfYinJLfaN6y5vH+n0/MR8pLEUKY
 O0irOhbexGQM/KySErNUqppkyo0EEHGrzGy9+sju+ffEtgEbGLsNlGId3Td1xWnJ9B/Q/xWBVJQ
 l3ja4KtTl5pYRts+L9AgCpzPr2/CTCBc6aa4BnzjfdP84CXs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: dKJjOJdQTGF3nVJeLrP0PtyqvGk5GU4K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX+GvGZPd1Lcyd
 mizb8zvIErTGB8Th+vtECl/4aOySb7XI23WAjiuhalAmYDrPhqmqY8fQwR6MpsZyl9crXNWWLqO
 xncWxQqCVwd0WHV1Fo2WrKMzssb2VC4=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a30932a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: dKJjOJdQTGF3nVJeLrP0PtyqvGk5GU4K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX0azVMWCJIqbO
 6HvGc55kgI5uAqLpUEZDrOUVa/UrJZm+9uIn1dzXEdRGhJ0bj+b2nMaeQBcVvRO5Sz0oIF6kNA9
 Nipr8D+dTSv8ahRQO7pSU7HXfgmd5AwHNGfDJG6aUISXC02CiCszwpyFJi5Y0Qz4SeDha5RIMhh
 K4rBiCnsO8veCghvtWEUFkCXcdlHW6RPI146DQNtqPVRzTbmWdcwdlFlmUiE54rACS55yZ94zZ5
 KQD70Rc0Ghxneoda/5xz4b3LBxRLLwDJz7EvzCmRelu8T3mtYGjvrzJXgseDFDXYRmu5qMXLQMK
 T7JHZpR9Ew59IIiH0c8LZY6DL+pTcX3f54/B5uAdyO9+BqFld5TZYMdiuxW0JIvK7X2Fmx/ftSL
 HhlLz+7g6fJAe3uqXXg4nif9MQRRm5HSP3ST98g+wxq+SzEqM/uXgTm+NMa7jBMLXMGE1ucXeTW
 HfQmJ1kzWL50xM3fuSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150254

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

