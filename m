Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B6D47A896
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455331; cv=none; b=tBupqqoSZvv307f0xinBSbiHIDV+X0Io6XGNRD+aU5pbNxRi8Vkf0Rp5zTBg1btCt2vrH/Kp5wTk/qvMXPEXqG1dokJVa9aqt0tSakS40lFoIT0+6uwYL8D8UmXuV95kSKuDPdRSNO4clI9/WD+BSdU5OFdve4vBthA85WqmtMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455331; c=relaxed/simple;
	bh=waXKDNxXFFDGJZwXXUOyEjCtu46GMLF2lKLnyW56kTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cV5zBgmhhLaz52ijMj5m5ZPhtRyY0hGkyatSMJMGv+O/hf2i4erAPjWdXVX6VNFmZlsYSRFj9JkyDz14gJHS7yuTXxIC91dLt086DKa4nHaWseVaWVrJp+O12WE5J/XJw/R3qRkYQjOm/vdZr1EIdQrSkE2xiUioXqWEryr6jDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C41A6yk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/qkaiTl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C41A6yk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/qkaiTl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UN2A952415438
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3A70gNGbqmKpi+ELn3nL+yw7ZT7umZ8GcDY+U0kOmdM=; b=C41A6yk/0dHgDtuG
	xiANdNSQkQ7EQGSEKM8HSxup9zWalhZucJmP4jSdfgAYjWOnFmsjpXVF47UYm4e+
	9CT6HgKjkyO64Drzx5wIvvFyycvn9hNnFOI8guxuq8iKns+4ICwftm6qwTX/fO23
	RQVHXnupDjW0hgu3DcxrepWpxcjg8spiCAS6Y7Z+hKAUr2RAwQNZzQRNxss1k2hn
	C7kOvcSXF4RfpASbhAir1byEMdExurWtDr3DxjbVs5An7LtyiAuAOfi3AB2c1aEG
	MoWqNyV5I5frY+zWdI8pgUUlPUI2qEp9UVHZretvSxX2FXAwrSodtxt4XPQmUBZN
	fWUPjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfxbg3s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e66f9e2baso47976585a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455328; x=1786060128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3A70gNGbqmKpi+ELn3nL+yw7ZT7umZ8GcDY+U0kOmdM=;
        b=f/qkaiTlf/TFQkoSh8R/6/+WHiOGSRY2Lb+GjGRmvWr9vn3dsM221snJs7gQ0iF6zs
         VLl/4QCuruUWJmOt/xVtHoHGOW50gJYmz/fQT+JJGX/mg4JRLSpzgcNdGpnweEMJqvGM
         aPFsgVTqByinZoavqQHI3s3B6woTzy90XZxpavv+bfbmDNuri6uMPUl3UpMCJao4nKaV
         kA2Ae8nDO+V9z9NqxFfTa6a1uN4JVXF5Gm4q/OpApsCkcYeO4rz+bGf2fV/8LCsk24BJ
         bMDAnuKip+lmAQhGP8FfGUQ5J4o9Xb2CjrQamVE0C/Z0FHTN0Mnyjw3JZBHtEd3l92WC
         zM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455328; x=1786060128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3A70gNGbqmKpi+ELn3nL+yw7ZT7umZ8GcDY+U0kOmdM=;
        b=UuACvehUjMSNUF5+teKxFYzqDX2EclDCxOl+o9EZ1IxhwCg4VhQ/+kJiUmeo5Odmat
         v0WDqUMDy7wwP+v1VOS1DnLW4J5GxQKCrxmSUi8suoHPK/w2FmZ0yjP7xR5IoqprZEKW
         zkpzj0aMUhqc74RwpjxPkNg7z3zLKfYsr7MVk9OEQOs2cCFzaMPzJMawHDQOztaMmIE9
         iyIgK6V2H28NC+9EZwD+P5OTBWTeJMls8piUFX2rCYQaPz2IP7Hkj8MHUfmJZTizAqS+
         Lh2OnfklZ3kyaJqxFEfOhf7TeUGs9QTyduQm/XBUIO5rsg5hwT7RWGrwCjbIwdn0spOo
         3liQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFwGzi7G6zBYoftT0cb7BBDqPjXDO05eUab9TDWJwFfx73F9NU+3rZUoSF3crJfJh/55yR/uZ/zZ5p@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2UEm7+N6X9IfBKTR83bt1biEBqzUmhSRu6F+6j7xookkav+Gs
	OMETgTx8kmvA0E074SqHYCY5bCo5lfJ4RHFFWIevjUL5I5czToOXT6hb00ERUPnejjU3tb2M/7h
	fUysfD8kRfeKhigdWMzkFgZlDeL9e4zRaln/oZ5Z7ePM+CkGRZk3Tt+gs/fpBRXCD
X-Gm-Gg: AR+sD113qSvpPfpeilZpj+8hNvM2ydCk85+wCji5bqP+1zP/Fa6XifNW9cREbEjb2rH
	Fa3YS1TZMuvNgzRX6Mclm9RXyHb2Tj349M6Y6GpcI4LGMZmqPjpAf5HtOBhuDwdz6AZXmgKHDJz
	6N60gDezmdQZxFC79xqyOHSw5DQSERNZETrzcV5dFRwh2wL8zbJWphVntqgMB+STQblo7VrBLgW
	3k11VKMURBt9Kf7GKFPipuMY3tGWC3fcfHINtuJKiLO8dPMGFm6ZePv6fGQ7hQVX1w7qWccykfG
	WkIfG9e31dyZv/1cCQ+DkvR5a+RZUTIT1wm790iaWT6WwLSYF2utARwCWPEs2kKD5N3gnP2xwhH
	Q80X3idcq9Gfo56XcdrfoHxhguUT8aUWRt8uJSJLtuWF0JEOroCP9DboGXU4h8XExXJnuxJ5Qni
	64Dn9mZL/DD7l3XA==
X-Received: by 2002:ac8:7c48:0:b0:51c:7b12:5ffa with SMTP id d75a77b69052e-52b387c930dmr49322801cf.86.1785455327757;
        Thu, 30 Jul 2026 16:48:47 -0700 (PDT)
X-Received: by 2002:ac8:7c48:0:b0:51c:7b12:5ffa with SMTP id d75a77b69052e-52b387c930dmr49322661cf.86.1785455327333;
        Thu, 30 Jul 2026 16:48:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:29 +0300
Subject: [PATCH v9 08/19] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-8-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3062;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gAZGcXI5Qu3MHvApOhouY0oNKw2Obip0DwkWx+cqYbI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LKNZ11zB2ttARj3jPxQLU7BZ5dMCpNncZVg
 PKZKhEgpa+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviygAKCRCLPIo+Aiko
 1Xz1B/9MuLT0/hm9RarxnBl5aAraBXkRIIVjRtp19mSM/saiFZOg0Zihwqt3sfSVj92soTjz0kL
 89SWQbensvVTaEbt1p0e93WKkkhr14nR84FstN7jYhQWSoZY/Y8RWjiBo4Kwg5Y4CaDVTEvatoI
 XZDTY/zGfTjBk4q2k0Ygwcj1dJyOcmk9YN1y6n764acvo/+I8eCb72UznkWkowNul7PgibZQARe
 Dn9auSuMJlq2QLVJb33xKSkUAZotb+Vnd8CbPrlhq/lz3xjtDAIAW5v0qTCBnAD8M86qHwhqbEP
 if18mnSuQBKQmUXKKnytF+TMaUUBkjKJph1ZHyomXMNfKYkB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX4fbNlNuSNv7I
 2xQmUeevfmY/Q2EFVkDd1CwEq3fpCJDVMRGWuVnb/yl1H3qjKkN38kho5/J3A0lHSvWb0TIzkZ8
 uOBeGEOwmav7WR7hilcfXSjfWDrsYLAKKX37nOs1cnmxpVJMfG55nLE46pWZrNLziQqruWQfnbE
 D8+35nK30pn+2CyVu6GoJB0hkXYMbXA0XH3+MZEeIa7HY5O4gy4fI10/jZILhG1fVaqsVYoM/uO
 W/W6GPIMiYQlrQDuoJj/I+BztriRKy2TAiaFhCt7nQT4NtJIRf7JDtVgoEf3xAmtI6Tw3VRvex6
 xELSL6ttoTMAesiZqFigip/mYwHx3Be3RGFA+y60VJNWakHvN3bgImwnjRlsZPwaKKfrSiba2Q3
 VPi4mnQMeiv0uEui1PwaRz7ILPYvDFe/g80+ojwvgLJNPSUyOIvJrHjnsWBLT0eoq9Qhb5HI/ML
 bxkJKS7JK6/AyOybxiA==
X-Proofpoint-ORIG-GUID: rrNGX9jdzN1V9zC2QFMz4V7gvbZW1xu9
X-Authority-Analysis: v=2.4 cv=Irkutr/g c=1 sm=1 tr=0 ts=6a6be2e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rrNGX9jdzN1V9zC2QFMz4V7gvbZW1xu9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX8kYe6DpZgWFe
 53B5rOpqdSsyVm09VD5iUp0ipg15dd1HRCLWwDEz4MgmxKqm/D+8iPHp0C6GLgitwO9Bl/MxI6X
 uJh2PKMjgETwAmqvEms62xOTUgpH1SA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

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
index 676baa8087a8..d558475986ff 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -52,6 +52,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -85,6 +86,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 	iris_session_init_caps(core);
 
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

