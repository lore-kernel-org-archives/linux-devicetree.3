Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E046030F94D
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256359; cv=none; b=oZh6HGsCPTri6Id692+K4VPcYByGNXIaT+pE/5Ze2K8kekMoXgnnPZq+JHF6neTMN6Z5Qam2FiB2EMfQvGCi+RFMdL7QBvWVn7qeygCecw82wJj8fpJYyFuA2XhSagxrG7dLRIujbdNBfUxci0KcQE2jwPCRvsCMtlaLAsr9ago=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256359; c=relaxed/simple;
	bh=H5gjTCkahlz2x03Clh/PysKqV1bvgbU9MHDzqSGjKm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=psNWaLpqc8/PrMVchU9mKTKeW9g33XLtodGB5GJ1W8AwtDIK8KaU5CvgUIzOik4jewbs4boR1U1hDQpqnfDGvd/6C1oc4svWmp8YGk080tqOiH4o4/2QRCr8zYyx0k3LKFDvdyI2ZKJtauII/NPA2mH7d0eNzmPZv+s/PxD6yFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fh+l8D3k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QpjGXoQd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fh+l8D3k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QpjGXoQd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C7o72506455
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=; b=Fh+l8D3kdBn2vW0t
	lYOhU1WjzSJDFwHivi7NcZklnmc3opzHplySJ1CzT1SJNcA/aIX2gBLQV+5Y5v6i
	drJGGLxlwU7yMWIR/MSqdSMGj2JYvnIWSFwYXqqVUo1duM9/3tZoFVxzhdiipCb7
	HxiRZGkKNO1dfXvDldlLeE3TmJd8FMjCZuqIuiBGRTEEh0Z9JJ/ckocRbEiD5LxK
	mXNz1X+clF250mhEOc236qVe1CzWMUHDqJnb9Lrqal53XsbJctcp3Tkcr4ofmPMj
	Y1YPizKkw9yH2MbMBEyqlp4ApPC7R9T+MYYOEIl+iHzEz5WG5JqvH3jBzVXnEO2v
	Xr7Qqg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbjv5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:55 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963eeb6f2baso777467241.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256355; x=1781861155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=QpjGXoQdvT4kkrdMgMIH+viJy1eomlGPFKcnW/bI16qlzZyxQ8ilfFyRGP+DczJdOE
         iFqiIFMP8TZyIay/EelSPETXnmxYXQjCYi3pKYLuXJynHlQxQ9g6xiMAo4v1juHZ4RwJ
         m+NLZgzIVuocIElUDLaitGB/OSORzm0Xa2YgyIdeF/KOQ/MYdnXG5XyNPpCytwVhx25C
         ugKbUZUP2mBIskCgINV7SB3TTnurCfseFpEZrKvQsx3dAvw+nmQxflqJjBe9h2bBECd1
         GFFfeQqW0naeVZshcU6b96y5X73otu6oJtdsDlcBzmUlRQ2s5nKbCE1+6q1XnoMLO7uN
         jBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256355; x=1781861155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=jE6B9QJrCt+I/2tk7B6FsluQypMAVIVE1CkOEmZVNYxsoAkODkTa7kcORgGlhOCC8h
         V0F3K8ns52lsL1UzeLWAzYj+25Dz7Mj8nVnWhrmHVjc7XoDfH4Xb4wQmOjXvBtntw0/a
         bAWf5RzlqCmo8OI9nKVNu1ZfC98XAbrv2YKTZfsFNKH77EvfcHPYfFbmaB6TNxTRZx6B
         Fq58ooJGvY0ssWAiKX0/xc5vv3i8vl0PwWOvUMUR2Qpnr8wKznL2fHXjp1BuJd+xZpVH
         MPVQqze/TE+RUDl3wTpRrS6ZIcxLZOvHM1tFaLyRlSNstarPyparbjOAAYWxIRABftQh
         olsA==
X-Forwarded-Encrypted: i=1; AFNElJ87utrGAZt6N5mrWQFCukl7H1VT78NWAkzD5oufeiDvgcgPSAqq2RRKpP19WxiclXnEDQiqGxrvHiuG@vger.kernel.org
X-Gm-Message-State: AOJu0YwzOO8nlvrKNKThpqnSf/u4YTj/WofA/YRWHcpNKs29M9UO3P4j
	tx/NjFjr/vfD5khqdxDxg0iejouL/bPMWEayJXrIVKUhbe+nFo9VjEg+u4lR+F1xd826HEP1NXh
	SAlYS9LNxjF32CWqE5dJR9e/mlzHA1K9LLrR33pifo9+ixsvZo0Zmj5+kpaoUQqJ5
X-Gm-Gg: Acq92OED5JZDNcyB4/VAwktV8a2h1R0JXpGitNfGW9N9PyIEe2BXjUPuC6Lth+W6c3i
	qN3X83oZ/QjuKTCkBHVL6HkCXSm1eETdOA3d43FnNAfWLp/m+jkwSP5pkx1nd8ZF+EwgPaYXYUk
	aUGd6+xtNEaa/MGK0rGpekITSHo/Tl50Ywn7b67rOYl+EMZeZPPegXoXHCiP5DM++D/BTT0I24I
	TWlOQwPAcrgGMNgkBADlTQzm5Agb1vFNRhBRuuxEPS1lt3QGOu/Ie5lQwXSd3rdw9NrnPEiLKR5
	VjuNeVWqckNwf40RGTE+7DALPusPV0K4NsuzqqM+X7lCjgpLTtq9gvFX0UjZyF9c/TjveBhUuq+
	uDkmDAbZe6QwfBcUD6ByLlu9cNH4KRJ2Kkb41nsMRT76veiLFkxnQkywiBCqybtU6Vz6roztehe
	L6kLGrP0gyIQt3jSAU6lTn8N4m07KcRQJYkFo=
X-Received: by 2002:a05:6102:f0d:b0:631:ec2d:12c1 with SMTP id ada2fe7eead31-71e88aec031mr735586137.1.1781256355235;
        Fri, 12 Jun 2026 02:25:55 -0700 (PDT)
X-Received: by 2002:a05:6102:f0d:b0:631:ec2d:12c1 with SMTP id ada2fe7eead31-71e88aec031mr735570137.1.1781256354827;
        Fri, 12 Jun 2026 02:25:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:37 +0300
Subject: [PATCH v4 05/16] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-5-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CP4UdqCYXR73UMpgJmkY4fMmlKngfvik5r6
 IHV5xG2m/uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQjwAKCRCLPIo+Aiko
 1WZDB/9bpXlx6XOeSkRV/QP+vbTkRVTT30WynVGDLXFaGcGG9hFVmZlTo9hHLJI052CXslY387N
 Vy9V9WiD9CwEeF9Uob86uu5GF+/xVcQza0ZD8rar7QsPDWTIV7f2BVlnst1j5el5gj3UisV1qCq
 6A+nWRKOYtaHLuQRU9U9pMmHSBq01garlOVf1E5jocytS3zE1NJVlNjCf+dXUS8g71xC8NZigAt
 I4SGub1iUwSxH9JOBn47m7EJckp7/c1SNie3oPOZXI2ufVNcZ6jofkxDjR/50NGFs8pEhsnnKPL
 LDtcZklgKvqrBel0RczvmFGKJL38p3Q8Rcbo7v/DFlBVH6bt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: eDbuG9riZgsyscSJ_0Fwzb9THhPbemx7
X-Proofpoint-ORIG-GUID: eDbuG9riZgsyscSJ_0Fwzb9THhPbemx7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXw3QIjwqCRt3w
 quXYAV/qVbr25X0zU3lw7A/bioX0kGe7MV4LNdY510JS0Rxocksm6uqQ95HNULYWEaEDESRNv2b
 88QJcIZtI3Fr24pafeOJDhzVQnlHlXU=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2bd0a3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXzeHMJf9bBCqQ
 o53qcWIFBz+14V7J+8gclYeFGZjaaNx0VaSDXGJ2ZRjP0u7vasvsbSyTOtuFxlx6krW28/oCtn4
 UzaQuo64j5IQnRN96PV0npztb8Jh2InKUaZS4qEVUmM/nhGfUgA916UocZKbAUQ8efriSKe/3bj
 TyOvRBtuVpJfbFeSbPz6EK8uLmcfu6zXDs/nUU4gkA0RmKa8Ilhvn2Hm8yKap7xvXzHLyQSXuix
 PbdnjEeASFYq+oKOz2uNVpxWmxd6M4ChBPn4SaBHpk/NF8hceBKy6Ma5JDKQm0JZfzZ589xurAM
 xnVPr3dhbSz4M9uOR9sSEywx8MOkLtsOVP3ksaiCxnoc9OAPTYbXPQWYBdUbxJ11/0kEarUMzbn
 4h3K2MQF31iNbj6jpc5/ZwZshM9RBSZLYLUdkpl+MQt4p2TebATTmWLqPzYsf4+gFxyiu/F2+yX
 bKpup6TpSgZ8+t5tTWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120084

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

