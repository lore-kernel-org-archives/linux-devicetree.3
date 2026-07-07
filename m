Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969C3D952E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463378; cv=none; b=D33bO+8Ud4Hq4Q0GAXmHznDQ3F8Yifwl8XQe4PathS44QM5epHr+IvvCjQrLCRQlHQGRQECmT5JzNj3G0tMkrpG1PRYYICKA93SA7isjgk2W7jAVQ5lUXtadlfdm/iaNQJdP/wVxFLvnbBlpD5CJLDAnRVXjB3MdtCtI4b2S7I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463378; c=relaxed/simple;
	bh=H5gjTCkahlz2x03Clh/PysKqV1bvgbU9MHDzqSGjKm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvuqrH1fqtECYYkudaI+dREaJ+mbmooN9b37FL/EzQc6hP9GrCpV94JVTOlPeRzLV2wQC2w9NBbPTvXitWszi8ZS30RnBrE22KqsTiu2HKaAFdb0u926/JJpZB+PkW8EHdLRy2ElJ16KsSed5H11oATKQybuXFX+r26qvGSKZeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dn4R1xCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CwrmC3JL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dn4R1xCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CwrmC3JL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5DUp356823
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 22:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=; b=dn4R1xCvA86S0kYd
	QO89iHTF4RJezjl2syqIVAQQE2v1TbURqV2znsXzNfjWsOsGCUb3VJNqpJraSXnA
	6j/YGS30trLlzXNivERmon6zE02aHyOsAyh+WhWTO4wW+4b55bXqbjQ4Og+BL0qe
	ApR4vTXo3Catp+EbMRwTVvnPDjQ3GFgaDxQ672a+FcdjZS2XalCS1sDv8h4nGV4E
	qCOz9E1y5l4oTFaj78MlBuT3TlIZasN6+OmPXcOoJgOtKReQVBbXTo4b8KT2hanU
	iTIVe+8OSVqKh58JMynH5I+b9herV3+x6Kxlg6q+YmAZZ26G29aiMR1g8YCT5mvc
	0p4auA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8me43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:29:36 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73883529f72so34998137.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 15:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463375; x=1784068175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=CwrmC3JL9yEH2NhIKOw6fMfLxgGe+d5hADApA3dAYnrSS3ZX+8fvE8+QLpuFj0SDPI
         HZtWttoYgZnm1xhObQ0Fdy96TlrmK/Of90+rMztW9GvVaeoElQF3UyWktwAarLCAXqCX
         XvbuvpSq7a8A4UREeHHUToZAkiadF0uYNgyJW6ytTNXxMjz/TpNa52Bz4/LBOGYzPyBz
         /eV4V9Mj2Btf87hUWEyoGkisElJznfu1bXioGcWwQeQkgBCXnE9w304zpI3wy6X7p7Fs
         XjDO24cBhnkFFg9CBTIohiJi4LePTxM/0zqdXPqgEDPkKtkFku0CZpZtG7dv1VaYpOlC
         8yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463375; x=1784068175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=FizWDYzhXGgHDiyc3F8jPXGyVtk28zM5KWAbEHG9xakLYOv/CdSBtNhQMUpGQCEn67
         HBsFhPuzjYgvkPCxaRyKe+k2GPJnbIQpFzE9xNv5dy5qJUYhOSpA/2SvMRRqKSH5iHL2
         ZNpPF4Jdx6urpBZ6mIpHsC3fhn2eGlSpJBu601aRi5qKoV7iXQh5dfAl3AKYDrH4VU0f
         Cl8d8DB57oqZ+blq9uSWfgwRwah4yAbabb+yqZU33bQpt/2oDedK95fGk4Jkbig5B0hi
         RK/S/Zlzxg1s6UkvYVT3Xi5Sht+pIlsiRMFvx1AlEi7GXz6YJq3WoGOM4TttFoxP+nZC
         2iSA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4r/i1VPCVnClBVgCAcKmnUGoVarEthVJ3IoP6mA+5oGxpqz1khL4bjO+CDvEpOwjBnL1j3r4QQ9dS@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkVZqdpy3Juhos6+5ywN6Jnv/0+hcOXVz+L4HEaBbOSQhFyak
	QTGpc6IsndfI2vUOLmkhaDEZVtC3T3mulJuSyceDIUsWa/QfD8lqdU9uiXsALrLC8ZJapAMwomN
	x9chxkJz1l+Q09gKLg6weLzmmso4ToAN0vPthC3StSCouWQNBVGf6jYcFJEcAqZ9e
X-Gm-Gg: AfdE7cnJjUOq+nABfKnX/0ivmgvGv7sLMhKyLwnH0Z+Sm2kdZ1JSWbtePO3Dg4RZt1P
	YpVht13JGMRLigUTqbvzfcN92Z2hJacY5mUC41WUMjAns7ebfO3LUzKMhWlEmHvescIfJlyNeBz
	pTpkRn6rGKr1wAPpwkkgUkjWt7seEfIhVRNlxsss0JNKSlv8QLQvN3F4Y/+zLSDfU0wvIBUuMPa
	uO6uDqf904YdVz3R0AKYy0VDQtYZzt1GrDEfGlYUyHso5CKpDDvRNtVwsm9E0DhVNEGAN2U29sx
	3ifncX/0sTXTI+pOddGTq8414YlBIYpd4M+12We860F7Y39/FloFS3jxQwN4CHMrqryFWEabfF5
	Nf7n5GlowrEBk+4aHe7ccYfDaQmwAO6Tai9ZyiPdR2wPzeFY1hOTfluYpoL3kK+PiHAFDMZBwWn
	JcnOZS8P/dyTwXZ/z9u6ltRHRz
X-Received: by 2002:a05:6102:c47:b0:739:4fa1:50aa with SMTP id ada2fe7eead31-744b7d87ab2mr4381305137.14.1783463375437;
        Tue, 07 Jul 2026 15:29:35 -0700 (PDT)
X-Received: by 2002:a05:6102:c47:b0:739:4fa1:50aa with SMTP id ada2fe7eead31-744b7d87ab2mr4381283137.14.1783463375013;
        Tue, 07 Jul 2026 15:29:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:50 +0300
Subject: [PATCH v6 07/18] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-7-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2ptdCVTmfF9vVeMsk4iC14OmMlo3P6jA7dO
 hHKOHCUV4GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qQAKCRCLPIo+Aiko
 1UK1B/9Ev7P1cZmEMcpmcBFdZgBZUroJg+m4v8Lb99EkrTDQPusbbbSxQqnj+Tavd+SYTTDOmnY
 dOxAC340ndJmIKwwyJn1eUFqU4tjG00zml/CTFWiQQbG9nNvuciUqKFoKvfUZwKlcgOtxp2FHaF
 TgxxFeeZGDN2hc+PFyNDzqKxmE8BsDVnpGY4tkzRBhDjQxlymkGYgQqzUTDOUKIc0OhyEFHL1UN
 DBnzgDLJJ1h6ceR6qoPkAG1rD7Nu8D2BjtawDy/9pKtv3L+rmpD34FZL6IP1jcPy0cF7TwzC1lL
 B/mxXkJgrBWIgJrLJdofTp/VNlzGa+sb452tnG5ulP04uwkg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX64gJYAgmTxou
 XAJDj+xnm0b6Y95yq8srQg0SFJs3pTVcSVfMcLyNZWpXPFPQ3PCKvjY8SHSkiLWEotFTDLxxqLj
 0ftiy6jcPk/t+WUMv5xnG5QFJcHR297gmjAQ7eh45w+AE1pXTdmtGIx1+Ti1eLF0TpKH/I8+nIY
 1kLbTXzx4QWZwGYT2lSuBvbJ6lH1WyhK/1yLvEha1lQ+WlT4B7IeKE+KgM8KLnD6mixdRpg5ZgH
 3dcXIK4taIhtnMNZOS5rpsAp/usuzwnYzQiqeTbmNUZPSpCt04Kr8OhPvQ3DpIC3JF54BbTvr1T
 4rG8EyvrggdjOc3C5+78rB1XJ7hLR5F3w7bfG4HilZSRZsir3aWUcwp9XMUMNcDOrTOczzlT2UV
 0DVGIuRagyqVUEh34y5x0g+uGZyA8ktJagTaJ9KjNFS/Gwn8CvWeL7Sp2M4EtnKpx/Eo5NbsFS4
 QgSBmgRJRLAKcJWFs+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXx9tDtKaSNfAF
 J6YPc4Rzpii+RqTqusH0eMq9yaINW2Vn1rVL8eWSnMeP3vHA0A1gqSHAHLZBIObkJADDYbjKTEV
 IkA3iHDSFoxjMxUtyHF3TkwXyceEF+I=
X-Proofpoint-GUID: fNyhXlIgPZCFbKdZuRSYnST4ncIEn_2B
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4d7dd0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: fNyhXlIgPZCFbKdZuRSYnST4ncIEn_2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070221

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

