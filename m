Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1390247DD76
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844248; cv=none; b=fb0u4DxStEAWQYyv078uXD4tI17WiECzUwTnXqOvCiz6kFY1payYy6ui8Ujt5Rac+2Rj58MyQUxnMougzW2EmWKCcwiNw3Lwfea9+HpymeoXUMZYso4pYzDzdWN07RelrzxYolw6vsW3eq700HWTLHAwQwSEI+bjEVGxZ+rSzkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844248; c=relaxed/simple;
	bh=HbJDO7h4MkXgsgKVbQfCPfPwW5H3OtSc6iVBjpNeMBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKaGyEhFIITeCAECZKMYZkWDS+SC9Jw+FIE04fJlYLT0yr/PlxvvB4O8NKxbKcQvKoUskZymFfQpKcZA7L4dfvv8on1dxiGvzMJLdC/k6OlGHnpiSQmNui50buZkEimbbC15P7MDqQ9eqio2DG2wxH7ynvsZihZRqu5K8ze9MUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHLY65yp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iF3c2SpM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHLY65yp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iF3c2SpM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB0wGV4020900
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeUeck/PnJeaOYXxZG3voZpfankG9NVFAX+3uH7MhSk=; b=NHLY65yphjy4Fq7y
	VoH5KiywMXn3IbSSHFXnj1SouXITkPl/vrs0uwKYv25HgKSP9BD6iCMF77ZHSS1J
	+zV6toe6EMD4/DHsKMY/mcRRnXeb1HNk7wbcMmgqO790DsJ9MOkVc9p3tyL3LndB
	3jarjdv4qto1jqmeUfcrRjnvKdtTrpkWsu8IR7c33CuiXgWRspPGbkqMlr/aFuES
	6tjdkGUbiGtURXKcG9dtDqdP5Kn5g0h4JsSEaWx/hwKmA8X5/Bi8+5X5EsRn0i99
	qDonOzIqtVK2d4MQ3e+DmLGzmctRbobP4tyZPtxCSA5iba6ibz5lfkaWOpqiE4lp
	druOlQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru1g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:24:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so8811293a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844245; x=1779449045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeUeck/PnJeaOYXxZG3voZpfankG9NVFAX+3uH7MhSk=;
        b=iF3c2SpM5V2mnWWFrRE9UEpa9adBtBl9V6VyWHg6MTq1FUVfYkKvvk8LWJpZvKsPC6
         nkyESoYcZ1vHjHZh71RQglCa7QGoHUSc5u5qObWxezQ0M9vQw8P314+ytxvFqHky5QNm
         9RmSV7q3z6/pBTfn2u/3MHi4LSXL2Dlgqf3hxw1G3Jio8/T6MEe+kxw+ZS4x86VmzkOH
         QrkebI84YN3IdZVKuRo8iAJMLxqSy4GO+Jjtbfhxq746emQGOeD6NMweAHCtdgz+hQrd
         o9YkIVqjh/ETHe8grFE9FMpzBAXx4lAxGeq+9zw1pJfeH/VXmB7VBc7gmG2pOMtzuQfr
         5aMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844245; x=1779449045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BeUeck/PnJeaOYXxZG3voZpfankG9NVFAX+3uH7MhSk=;
        b=d5He+IsCGCGSKZiNCYrYb8sqIaot32o5/eauCp87bZiXWaBjMSlXUlq0kA/kadfv5e
         P6D49Mc9gTvRiUjCdFzAa7Ee5oR8mDM27galhakA8J74iEoUcxi+cruphAapzaHcLBfQ
         kPhvZGqIQixkyja1kblWbOYGmb69CHwD/QxiMDcm4EMm1a2lnnBMITIFhbFcv57P/6JB
         1bmpDORpjaSTBWFJgxeyq8bPCDeG4X5U0Dfocj9g/uOQb4Rc7ZcAqnA9xfDIXLhzEe1O
         IDEMnRvaanmhoRacb66NNfhZDMQqUQravj/nDS0ZGZI6gqX/2OB/Qi7NsCRJzwtBWcal
         Ba5A==
X-Forwarded-Encrypted: i=1; AFNElJ+q6Bt1OOJdPvuMN8GY2bJMfSO6y4lI3XMAWoMz6vFRs1Dy9hSQ7j9CKsMzndmbJlC8rHOww+MGi6wM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+2LZHlbshk2B9z4Ikz6VLC+J7cEZ2D4laQYmCr/P9vgkfRakI
	OLdM9FFRtpVoKQAaKugOH+ivOruhdWeSphObv2FCkkwWcG8vvhrnda0s7C4CkIJuNEUEG6LIVcG
	G5WLYL0GD0dZEusHEvH0uStwVVxBECPP7/Eaf7JeKZV2YH0e/tp2kqfjj6xhVbW+S
X-Gm-Gg: Acq92OGyN1oK+n8EhgfN6kIfHMvYFDQn/q301E1rPTzMQtnzSqMllazkhU5N1nRZnhe
	KigNe8OAu2EUX6ojcsV1+3fSm7OxnHSMSYgfYSmJdRkxbL1iFJDwhptrXdXkB6stP+yLkpBx8og
	mPbJIEoiGNrc5VgYG2GEwbdXNZjOdF7TGl6M+8VtFByEGtgsK1qACWKkE684GuOs1jwwq+yBaEq
	a+nS28zD6rDjXauCs4pO0XHivEBBGqllQRWCwspGXIiN/E6rH42sVt1ELGd5l/H/+OU6KCMPC20
	nnUABiiMALOrOdfdaFHD5C9hmMlMizHyp7iwGBJdVNnerFD3xp9QHwyQTacB2zSO7KkRfFrNhV7
	59N8NTq65cZBL+pj8H4hSgda0ln6s5SSoMHx8uzmwYqEQ8X8WAccmFtDRDFjQ0fVb1w==
X-Received: by 2002:a17:90b:2d08:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36951ca6064mr3530024a91.23.1778844244680;
        Fri, 15 May 2026 04:24:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2d08:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36951ca6064mr3529993a91.23.1778844244145;
        Fri, 15 May 2026 04:24:04 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:24:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:21 +0530
Subject: [PATCH v6 06/14] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-6-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=2952;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HbJDO7h4MkXgsgKVbQfCPfPwW5H3OtSc6iVBjpNeMBo=;
 b=5Ql20Vud027qUgCrsDdN8eNBl6av5FzP2NS6aw/2+3z6TP0/pO36FuTHTiqw0h3Z2qRWiyCI6
 lTq0CqYJvDvCxrxV5MVdBvRFrCeQ97yAv4xs0DQ0aERecLQ3g5rcKki
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: -aOZBRjgPdtu-3m27gkClRUkebqVb_od
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfXy+iYFZSjQyfp
 dDRya21a6eEfpQbvQqbBoxAbE/UZG9GBKa122Nd74Co5RzLkidyoYrcdhdDwH4SeLgIcHAtQVJ5
 uwJwyDMAk8drjg9xZOunp4VhS/vZ09G+zLlnsmIDqkn0M9RxccltwFjRCd+Xq1ceCS/w+BoBaN+
 TR5DiDVkPyxW0CujV4EBBpSBCTtECnFwh/Yrvx5s6pDXgfnzBs/H5i2pfZpsUY9WfBg3yDpqs4L
 MaoB1p1aOEvfvr39LQAksY5mrwY8d1mt04le9g+wQcANhoQT2ahckUDAfJXSXkQ8brXyr2F4g2+
 Ta3GFZJbnSJJ3THK0jSoik0jfdK9KkJisFA4qLyS93mr2VKtU4mMzxWInnY8mUETG1E0b63rmUM
 kVu5k7X2M0ECGDSiBa2A1zYJm1bB64zWjBgmevCfc/pX80u4vZDLi8QmlfTx/HtM3L/lb1h7GZL
 DWXwgiVuHefEHmm147w==
X-Proofpoint-ORIG-GUID: -aOZBRjgPdtu-3m27gkClRUkebqVb_od
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a070255 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115

The Glymur platform requires a dedicated firmware context bank device
which is mapped to the firmware stream ID to load the firmware.

Add init and deinit hooks in the platform data for context bank setup.
These hooks allow platform specific code to initialize and tear down
context banks.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6a108173be35..84fc68128c70 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -263,6 +263,8 @@ struct iris_platform_data {
 	 */
 	const struct iris_firmware_desc *firmware_desc;
 
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index d36f0c0e785b..12596c9a3cbf 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -150,6 +150,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->init_cb_devs)
+		return core->iris_platform_data->init_cb_devs(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->deinit_cb_devs)
+		core->iris_platform_data->deinit_cb_devs(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -206,6 +220,7 @@ static void iris_remove(struct platform_device *pdev)
 	video_unregister_device(core->vdev_enc);
 
 	v4l2_device_unregister(&core->v4l2_dev);
+	iris_deinit_cb_devs(core);
 
 	mutex_destroy(&core->lock);
 }
@@ -272,11 +287,15 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = iris_init_cb_devs(core);
+	if (ret)
+		return ret;
+
 	iris_session_init_caps(core);
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
-		return ret;
+		goto err_deinit_cb;
 
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
@@ -311,6 +330,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_deinit_cb:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1

