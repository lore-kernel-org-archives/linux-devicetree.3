Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A43D6494
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964471; cv=none; b=RMM9UfBzOsmcygKeJKXDi+iW7R8k/gA34FVv2Z0EDZO2M3IVZ9rb0h358lRHRWxHWmSKVN/sZcTur4D9i7wVIp1s/ruk1X15kcpBAh5XAXhvo/RPtSoqj2/bvthHiJ7HkgKetP9YuFO7lDCI0mtldGOOq6JZrjpkABfQAVdCXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964471; c=relaxed/simple;
	bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LkbQKOOOOJki6r579rBttUsyrZ5kQvu0E0U0lUWpclVpllHJOonwN6U6A4lXUQNIMLQ6fS3wkYgbVfake7ctkaOLjlGzNyZL6FcVPxEazTLSqDDk9f1fVB4mRHrEuO1Vpv7OCYqmED+2U3p8eb28IYk2aLVypwj6xmZAMoQUKrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdjCu4P/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJvoHINv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdjCu4P/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJvoHINv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456Xqlf1960438
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 07:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=; b=LdjCu4P/8xtim++H
	11ySw/8csdxm7YeaptSggci7OMVSaCGBF4xeVOyXcx7gVzCfzBNHiJdGV7lZFoMK
	ezw57U65lW9LW99UC/Kt102lan8RhFEYhpp1v3c0UJI20DYN5DjN3wyRD5HQecKO
	CYh98HbTIHRetymrNc/kmpCWqvgscUZH7w+fAFntRaxaeIm0IvRiVc1o89rvlMa6
	fvyes115G99cxv6SAmOmj1qHKPqa97JxkTfEVOw+EpgZteOB6MC2S5MIoxgrSl+P
	zcSWZsidybdF7FzUEec60YwoTU2xNjGO6RbRHkKIPg1XGNFhVV5wvnrF0q+oUahv
	jXB8lg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5du3tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:01:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36529b265cfso2203901a91.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964469; x=1778569269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=IJvoHINv7od6KCDboNRw7XbHnGn23UDZena9ROtvpIF6VEjPen/gmRPk7TKyDrc6KX
         N0faQfaaXMkPsL6T/q8VvXplPdiWgYOu0/0vPGS7EXz+XtUAqaUFbA/bF/NhmAIZIg2i
         UHVxP/A1FSEyB+JyHBhhpE3gUK7hIWBBj51yAN+KLfIKhWLnAw4gJteQVnwNaeh6MA34
         skRFn7ZjnWnYuqtSxywCQ9HLP6+foGYscQ6AmNPLK6ysD6BjpMNhrpey1WIzZ03H6ejU
         mLF7sxj1hKeIg9QEk+pi3Z92zjmdPAL4ENjlwZEm5Y8U2v7D9rYnU6nzSlYjbN2LD+vW
         INRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964469; x=1778569269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=BGncj3ff36hglmPKQW783j/1/2liA2zkvVL4gnJwQRa/GH7epX+OUshh5nuxGmoHk0
         513Dnq0PdhDbNv5FGmuAkFgCkuP3CSMWwWtCkF/v7QpLlva6NFZY4Ntaq/rc9akcPiNl
         gX8btBRigodV4ypQ2Cvm1zyqVxTd1rxAlddhZxQN3UhUcY9EHSyaI6XrCE07Aa210es7
         uaN17boB8CniwiIKv83PIO9OGQRv1BNPfnxvpY1ul4WdbUbe4iGUz86eriK2Z3ZWe4Zb
         XuT674asivafEbpsdIwnkiw6DM6z3PI2aFyrvrX05cocOKf5czjda74PalyWsVf/OS0f
         tR/w==
X-Forwarded-Encrypted: i=1; AFNElJ87yn0tioPfr/oFl60uQv4UvQ+UlPwJ/XPUEWeKghyeZjnJXfs+EA9pw5RntiYLRAmapwyJ5nE29o6J@vger.kernel.org
X-Gm-Message-State: AOJu0YyjZhQb7jxHoFe0gReSbc4gCMfJ4ZNpedgP/ivdG4mS4d+zgvwG
	5eJAZKF/yv7ht7yOeZz1aDSk7yVxQY8M3aZxggudalfKmxOeUE+8qccfpmuqkKgwhuT6ip3UjUN
	1SJo8nuNHNEvqV+1L3vxvX2Rk9nTZBMbT7tekqhVDlx5D+s7hDAHaG408GXCXcUKt
X-Gm-Gg: AeBDiesyfxPOFaB92ee5UJ4mSO2xtOJrY1aUTWA36O/VTIQknM5kNHeI4PGKxe+Iaxg
	KIbrPJZZA3q+q/YgWMrapZaiYGhXCB3ljgVXGXPySM0Qk3pm1Ax5HsmBhojpSUGwncF8vVkV84d
	rDOjcxqfR99/rIHC/HtBVRw9DgrUTJn6TCBrxb2HxSeu9ABP5JNVCZiEdcxBPRCxzSdVa3T9YZO
	48Nhln6g6w1MJpEIAbN+NY5j+moJ2hIuz5LDu6XV16bT6leIRZFzdrgoPUKdTmEH6XzaYm9Aauz
	lUEJ/Vpo5386Exe7X1Zc39sZwgz3UJ6NtiL+kwoT86qlRNoiFBN7RqQ9k4DvnazK4ELJud6eZ0x
	VouGQJ9OW9Tpstv3bmQkpKbpgcZVoiJgH1N92U5QY+gwqP0FVz+uzlPRatTRY2SeYvT+7z6x1d/
	T7
X-Received: by 2002:a17:90b:4a:b0:362:bfd6:a875 with SMTP id 98e67ed59e1d1-36577369c85mr1964925a91.1.1777964468569;
        Tue, 05 May 2026 00:01:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4a:b0:362:bfd6:a875 with SMTP id 98e67ed59e1d1-36577369c85mr1964891a91.1.1777964468052;
        Tue, 05 May 2026 00:01:08 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:01:07 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:27 +0530
Subject: [PATCH v4 06/13] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-6-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=3016;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
 b=gsq9OxYUHQTzG9WaiC2/lfHisQcvobFOu9F3SM0jPXdGrbQ3ToFwtcC7nTt2I2lSoKXnT3nkO
 Ac2QeRNg2mbAez7nZcKlVIZXGff1VBznkJqWiAmryQnRSp7Q6fkMsYh
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfX7NHsM6LFv5Mj
 PtD+iy3fy+yo7MYxczdz1wP3r5lWkG4t3MX4Ytq4uKtQ+tIPbhtAmCn3yBXHiHQ1uQv8DANgBc9
 2p1Ltvt2Hudq73XspJ8JC4J91eEcw0o2cadkFAbUAZYN+xrjaQ1GlqfF1ve3dNWuEZU3F79GQFN
 tzJx24P3sN96T9/JUAJ0PdHCFf+aQpBfkshRi0R7RUG4gcFJpZ2VSze/rOLs/klKIpen7G5FGR8
 n6YYjQQ9venLkIRW6IH7AeY12pzN2C/hz07NG6gu9QNYDkaP+RE+Ls8aV2XptiJYZCtZT5IRwev
 d/YDhJ4e20J0zFdLa9Loh0QWy1IFxabmlrHTHwnxIteYxfbHz78LhYgDnI3KMCtR8k6KvcTLEGV
 hZm/w/c59ehBbC/lKqCFNUM6r4TkbyfgdVFhi+uYZWlgQsOPNite+r8HXEMZ/HpJzV3tPTX7zDp
 seINudNTitmO2kRWOMg==
X-Proofpoint-GUID: GOkWUPYJNob3MDchfrxDjJNjh_xD9kCf
X-Proofpoint-ORIG-GUID: GOkWUPYJNob3MDchfrxDjJNjh_xD9kCf
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f995b5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050063

The Glymur platform requires a dedicated firmware context bank device
which is mapped to the firmware stream ID to load the firmware.

Add init and deinit hooks in the platform data for context bank setup.
These hooks allow platform specific code to initialize and tear down
context banks.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..55ff6137d9a9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -219,6 +219,8 @@ struct iris_platform_data {
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	void (*set_preset_registers)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..34751912f871 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -142,6 +142,20 @@ static int iris_init_resources(struct iris_core *core)
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
@@ -193,6 +207,7 @@ static void iris_remove(struct platform_device *pdev)
 		return;
 
 	iris_core_deinit(core);
+	iris_deinit_cb_devs(core);
 
 	video_unregister_device(core->vdev_dec);
 	video_unregister_device(core->vdev_enc);
@@ -259,11 +274,15 @@ static int iris_probe(struct platform_device *pdev)
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
@@ -298,6 +317,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_deinit_cb:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1

