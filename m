Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A882376A01
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073046; cv=none; b=BJbqJIOZQnOF2Ans09vEFXXuIPOLDVRA3vS6jCJos1mb4ALrWaDK08Dmelvnkpm10G4ISaryH/SH8ugV+qReCCuQZI1EW0NC9wjYw5VvlGUBh6SC+vBQH3m2mfUp8F8gUa7jiIFcjJ6qW4oePO+kgyeBMT9G9IZYDLicyAxa4QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073046; c=relaxed/simple;
	bh=xu0XPQQrGgIcADZXkcWURUAsf1MnYM7xyMfECG6R4iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duvfFkhyemeOaKcNAtruSwcikJt2gguSB91K+Lm10C1Qb/iDG+Qf+IsQjP/s79T70vizZp8hIZ5gRXYCod1WcAOKT2v9+HWwZuphz363HMkC+gjgnHjfAj5IiQD6FK4pzjjR2uqymAEMta58g+bGUKfe8SphN5VFFzmzHUuuJTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIu5OqaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3n17VFx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AIu5OqaU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3n17VFx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2f8EO323991
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yRWghUWFVPf3fPEbC/Fe3T/IcSJlI8g6PwLdmF+HWAk=; b=AIu5OqaU11VlkgCu
	io1f17qEYHMztmqZbaxrGPlMzRwhWQywIko15R9+cbIg8vahzI5f6+YPP+MajUj1
	6uH8UpoNEl1vWnRGWWdjkgeRb8ElZJlW52TEoIUYDKdEaY4B7g0Ht2jP+K91ocIc
	z09tNlRwKIAzqaU0/pacnpWWQ8in88PphDLZGdGN1yOjNp98mkcv+G/KsaIu9eoR
	dzWrlizqF5i0yMFTvssoe4bKEJI1wkOzSCm04OIiIg6aR1mdX7wcBLfbp3rQ4S+G
	0DNGPFGLdRDtzvNpxARHkEBwFb1IMgJWwT9l4HzcEop/ZQrbcDUPmJc9mX2VXewh
	NASfxA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeawr87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:30:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so4893606a91.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 23:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073038; x=1781677838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRWghUWFVPf3fPEbC/Fe3T/IcSJlI8g6PwLdmF+HWAk=;
        b=d3n17VFxZozx632jWteWDU+6t0T1fMJMhGn7fdnqcZyjctCqV2DrO2qpNVpSxwVj89
         pOaZeWm4M9WUsfV4ALPmGCviuga2ltr2KVVmCHQ681qPho9CozRjK2216aPe0SVkhSl5
         2pisPHTPMREgZ1IilsM/vEmzCP/xsHpBzWcXE3pLUavx+0bWl20HyGqLVNqDV3uJ2GKh
         dBcWcjBmGT9QiUU5HnYN+euXVWXjNBqTIRkq9yom3+C+Nd7WtbJ1wcbYKAHOJ1GWo13d
         uffuKQe06Mvk4YcuwdYIdS6rv3mij9PzkH4C2uOgny1NjGiJSqttr7mBU4NQLAG/mFhj
         oZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073038; x=1781677838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yRWghUWFVPf3fPEbC/Fe3T/IcSJlI8g6PwLdmF+HWAk=;
        b=D5UGT8mErY5fYkZQPGnmzTa8FjU6blBNcAWgwkJC+a2lwKcuLjwocOcApgqfz7BqJ0
         b+2A9KKTk0MAcX3CTcTB1Xhao3uiVlo03mHHmcfKV37N4k4OF/TUzky2Br0Alud//MvJ
         BXdI4TJan1QEy8jvDe+6di8JjQe9wOofnINitVEqtPBdJA9AqnaJxeGe5GmEQWSnlQTC
         ++LJ9o6hXWGvbEy/ryGjdW0wnNWzIltjyHjifv5vmSQJqrp6Tl3RBBlR/Jd64oDrH6Nf
         TaDraiIJOaDYEeJsKfvIV5IZWr5+2E5Zc4ZopKZLOMIMCEL5fMj4JPtfX22n3wWHwi5m
         Hnqw==
X-Forwarded-Encrypted: i=1; AFNElJ+ygJgAJ5ieOF7CZfks0bOaQ0LGV+hTbgWx767li8ywysOMEERNBYrAtg+eSIfhwdV6AHPkbPYLtuac@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd2NV+klqb1jdfMBQfAv9UOxMqRB7MSgjyXvnvHRQmbJKVJ08z
	X878vSuh5ci2H8BlEKDztqGJZf5qRSfs0E1UViJerFqaTKe/qeugjTCp3y5twu1Vw4DPPTWSm/Q
	w+hNwywR07ez6arXn5IU8s7o20uEzqHaMvnYAMDVcsOZENE2Fdi007NYOMLmwaE9F
X-Gm-Gg: Acq92OFvT815gmlghdjuSQtvtHgF6BeJnjUwgFUL7dphHOvooVYJE7VBRJOV53bfC6H
	JiEoG0Sx3UnNs1iWQRuBv34tSca/UmLKy2yQiOLCFgmj4gX2qGo5WoArLPO6zlpKtiI4796MJ6e
	5hkMBykQ+kYFWXGxEEy3I2RDeFb9GiFhQ8S9RT5M+kdE8hpH0C1lXZCxEXyi+NLlstjdZUYDPiV
	WkCMspNbXFVc4cxjtijLS8bOqXMzemXi1wOj3AfiJaaz1AIo7ISmM0UZP8VxRYynVk4Lm5F6ZS+
	6QvwjbP/jiDqSZ+ApS5OSKPphSf0ufFvYQdJLVW5HmNnIQ6iwmK+fFnPnOK0fC8uE9Na5+brRgz
	hYEFJav6PPkh3+QamRbX7zi+h1M/ObWGyP1X1He3uik/CPYDg5rcZTiqLRYPWessESw==
X-Received: by 2002:a17:90b:3c4f:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-370f057b7f0mr26102079a91.18.1781073037941;
        Tue, 09 Jun 2026 23:30:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4f:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-370f057b7f0mr26101909a91.18.1781073035080;
        Tue, 09 Jun 2026 23:30:35 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:30:34 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:40 +0530
Subject: [PATCH v8 04/12] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-4-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=3955;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=xu0XPQQrGgIcADZXkcWURUAsf1MnYM7xyMfECG6R4iY=;
 b=bhxQGFLqPTHgIUNF7liZjSwOjDJVrophzNwIhKAIt7mP8Rj0AmnNn/j2fvNMuvpvvrPzTfDor
 Ok9eX9jBxT6DBvC+J8JzDCx4VCOhGvpkppCPigyec28OnF9HI+6Q93O
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: Gqc6MsM5boCAtCfz0ntXQV3HWVCWUajT
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a29048f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZwZBACt1qYONU4SPBGcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfXw+sDV5vEzuL4
 CUGJiWji6uDQzTLMY8wd7Kf0UxigOYbvYb6Jl5gJ0i8lLsZbUfWD+Xzv1OVlV/FlBuXLhpa2eyt
 tmv4nrt6kyLaDjEj2CvM/oltIEHJk6RQ/d0ge26lqX1lyqzY0feCp3e5x3et/VvjUC8xUlrwPuj
 pAbdi3yNlE2MAd7wf3YC0MXa4A60kKRmOCmkw7RNQ6bAD1r9uQvDU8uJxz/VrbqUMY1ptU3i3ef
 VNQtAwaMwWV8J4I9Kfk8J93AxrV/PNGmWBujY/+CUBaQjRJPRmhJ9BGTH4vKa2CCJGvkSbP1+t5
 1C2HQ3VhlX0E6Hak0svPQ3EqF9KvV/xU0NGRBr3OSxRQBlb012iC6GgrNa9U6j6mzXOfQ9VGJLy
 QUymdlyqfYI+ACkUMTayeMMbv7aL2PaJNVZGbQpuUp9S+SZbny2TNCmiYN4/q9xlxzF3QFYN6Oq
 5cZBlwU+Xpnt5J+pu/g==
X-Proofpoint-GUID: Gqc6MsM5boCAtCfz0ntXQV3HWVCWUajT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059

The glymur platform requires a dedicated firmware context bank device to
boot firmware where linux runs as the hypervisor and driver needs to
manually manage the firmware IOMMU mapping.

Add init and deinit hooks in the vpu ops for context bank setup. These
hooks allow platform specific code to initialize and tear down context
banks.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |  9 ++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 14 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  4 ++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..89dbe9bbf6b0 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -19,6 +19,7 @@ void iris_core_deinit(struct iris_core *core)
 		iris_fw_unload(core);
 		iris_vpu_power_off(core);
 		iris_hfi_queues_deinit(core);
+		iris_deinit_cb_devs(core);
 		core->state = IRIS_CORE_DEINIT;
 	}
 	mutex_unlock(&core->lock);
@@ -58,10 +59,14 @@ int iris_core_init(struct iris_core *core)
 
 	core->state = IRIS_CORE_INIT;
 
-	ret = iris_hfi_queues_init(core);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		goto error;
 
+	ret = iris_hfi_queues_init(core);
+	if (ret)
+		goto error_deinit_cb_devs;
+
 	ret = iris_vpu_power_on(core);
 	if (ret)
 		goto error_queue_deinit;
@@ -94,6 +99,8 @@ int iris_core_init(struct iris_core *core)
 	iris_vpu_power_off(core);
 error_queue_deinit:
 	iris_hfi_queues_deinit(core);
+error_deinit_cb_devs:
+	iris_deinit_cb_devs(core);
 error:
 	core->state = IRIS_CORE_DEINIT;
 exit:
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..8bdfee672954 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -319,6 +319,20 @@ int iris_vpu_switch_to_hwmode(struct iris_core *core)
 	return core->iris_platform_data->vpu_ops->set_hwmode(core);
 }
 
+int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->init_cb_devs)
+		return core->iris_platform_data->vpu_ops->init_cb_devs(core);
+
+	return 0;
+}
+
+void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->deinit_cb_devs)
+		core->iris_platform_data->vpu_ops->deinit_cb_devs(core);
+}
+
 int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 {
 	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..e0dc109bbe6a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,8 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -33,6 +35,8 @@ int iris_vpu_power_on_controller(struct iris_core *core);
 int iris_vpu_power_on_hw(struct iris_core *core);
 int iris_vpu_set_hwmode(struct iris_core *core);
 int iris_vpu_switch_to_hwmode(struct iris_core *core);
+int iris_init_cb_devs(struct iris_core *core);
+void iris_deinit_cb_devs(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);

-- 
2.34.1

