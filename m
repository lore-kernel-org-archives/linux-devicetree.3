Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5227222580
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951046; cv=none; b=ChlSZRvGG+VC1f2rvzLyGSwAg2rqjEqNW0j7PAKh5n/2Yer1YVSgFrDkpRrfAIT6O47j9rxcJDKKyWm9b8qKQmc++iQGol0mAu6O0KI8M5DP4l/JpbI1FtGUrDl6WQAuFvCWMpWmsa/9VahVZ5/hHBHyWfdGgHMmEUB/Vhs9xw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951046; c=relaxed/simple;
	bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxDjZReucNF2rbst3FubdJzW/usQ3a3RGiACLGoTo0QYOZjNYwJVvITOEcur7JOr2TXUS2pY2yM6RB9lIIK20ANRhFOGAcq1d6Xq6lmjy/KftXrF1jAYDap/vb6dFYALERxvpae/WZD67HsVsxs2MPHBXCpEOrnZA60psm21Gtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQjdEduo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvheGNtz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQjdEduo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvheGNtz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uGMg3044149
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=; b=JQjdEduo3jUB4J80
	UxY01Cnk4y+htGI6K4HB4Q9VDGH+RDJj4KsPymFhpf7PdRne3+z38qSjHKKdTCTI
	maE419NrLKzQIFyJf80l3FKqZANQx+9NL7JKfQQHU1+o1rKZxXuy82M4oLkjzL8N
	jN9t1SdVEGYdvdegpuVRKFp6Jx7PbciC3MVFdfDNs1cwXyCDIM0kAOaSON+6dEbg
	5URf07jh1XQ0GReKmv3koAWR9AfJUeoyqq/4F4qrrVz0Tkb1rrJZ4kiXluiwghpb
	Txi5+QjMDdGLFLpydNyXVjC1een+SDhfTCXse8e0xMENr3xxdMdvW3qTppJ6q1gi
	drl6iA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh436c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:30:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b249541063so60389005ad.3
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951042; x=1777555842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=RvheGNtz9V7WEPuJCDJN7ts+Ys0clWdJVv2I7Gi72VsgoMRK/9MZIlnXgssUTtFisb
         GZ1XgCAEvCXueph0AbARQSHYxjAA2YFImKL2XaauDRoqQmFogmcHG1NrvguE85I23Nad
         4al5a1mA8PoaUQlX16bv2qsNMGW4HKP4by4EYrE1fRr2vh3fYOJp5c+AQTBE20JKkzpA
         xEWnDT8CQtoCORDB27ghJBpR/8URNAwai0eawN4LzX+EIzX3htqclQyfauuUyRvR1XJX
         TQBh3uk6MJfTQ6f1HRkmjMhsLH8UtMIM5TdFXsNOnuBcYOA5YM7v5Zdk8IUh7tknVPNn
         AqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951042; x=1777555842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=TElPSEKxE61EAWBrZoAin39EkU3AlU0O6O9cyBCKm2GKnKWvttqIA4nb1Pq3D/KnOD
         /NkDiaGljYpytB9j1hJyZLXBykq5LvYznhH+bt9+3qNvwDLjM94WbjKDm+kjRHenPVyQ
         R8RFKFqt4oJbf5eOooK2FAxuBrvPVLksPbVTMuvqXZwuDXdMDpuxrE9EMkDI8Hnc0e75
         0CXz8EaMj0fNjzuOTSY3lRk9IW/aIayFwQIWPWr3SxfPC3OQYgAzSIlp75pHKDiQ/xJy
         BM6gkZrmMbRDKzX7BmACkWc4iamCB+SnMogEwGdK1+vhP4p/OI5PhMdYc48UhZLIjDa5
         icsg==
X-Forwarded-Encrypted: i=1; AFNElJ98hWwVx3aLOaVUzfwN84198eiXDZoL5sHVrcPWyAMA3qSgGlXF1qpAQRKCuF5FCbKkNixbn4092ZOx@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSQpNengZcX6XG1aXPSD80f+M/UVnEr44uycU9tCySc8IjWus
	yD0oEQDhAQznRs3uJ0TBlxudw0KLAF2tAayppRSdvv7olBQANmjoplJuVFZPQQW3akgCNwxEuVw
	Ncbnoi5/XV5dXMwgk0alfQm1sQ6TIzTOYAuleEaUVJv+hlsOtY+JrIWPnBtM+H29TRu3lu/5l
X-Gm-Gg: AeBDieu8jDvq9p8bUm6VzER9TzQR8gCHTMFuQ/KtBIedmjrE61eWej8i9fzUBRCpENJ
	DqcDNAvT7/xFABV1b8DFwFfZfkzKnknzhhlhPqgCQIC3EXm71mcHkQ6pbYXHFh5KOHULU2Vy0LK
	ttb/hBS6pnWTvF7MNODuf+gxYMIujq7Z5gDBCs8t4mAwaKI+ZTk9qeVaqVLeiOo6YxvD7mu7Fur
	I3Tnhy4lfMMslU8W+IfSAdZl82KdDcAV9JBS/iJ+DdnX4cAvQBQtgaMf5crjETC342gqerirTIE
	OhnIFr+1XYlG7CgRGUXhAUV4fcjswDLpwSeJZnv7Rl5fhbdYUZqAK/CRHCkNmHlLzhNjmgOUBL2
	lNsMOIiODjqs5+Ik2rrt6QOvJ+8yI1roNvNnuoXKCwyBBZk/X2DqGi81VPkttOxyD1Q==
X-Received: by 2002:a17:903:246:b0:2b6:309:9f72 with SMTP id d9443c01a7336-2b603099feamr251901865ad.21.1776951042365;
        Thu, 23 Apr 2026 06:30:42 -0700 (PDT)
X-Received: by 2002:a17:903:246:b0:2b6:309:9f72 with SMTP id d9443c01a7336-2b603099feamr251901185ad.21.1776951041662;
        Thu, 23 Apr 2026 06:30:41 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:30:41 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:34 +0530
Subject: [PATCH v2 05/13] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-5-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=3016;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
 b=gOrXRuyYOx63Ro+9sR82pXcBF5nq7YQVv4DGUiouKMpmgBheyBYqtRlAtDz0YtwxU4xK4b9hl
 ZU9S3UONyzDCyAMpp7MxY5zrCrXMGnz4RUuNOm3Zcit7fSDGObuuaq4
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX0H4JhFFmRzMt
 eX519Z34cdz6OvWfWSFz6qfQK4gr65awb2B1lU1yKRUKUqpLA9zcfE+GWqT/V/EOIU0oQeXd3YT
 U71YESlXFehVViRZsrNvW5XBudOAPO7heiX79W53wOFSGadbVKsiV9Vw7+8U9DggEOnJ4o1MKdy
 oKU1LRgYU5hs5FsAgYrNk4bfhd2XrOla/CCp5jXPn77j9XgfdsrzvHK+RjYMb4vZJrf3z76prqX
 YayWg7RqSk1RepSqn4j84XldIyzR4hYU/uCQ0cLRI89UzmlyN2RjFkhvPbOvGPxAcCNSgr4hm8E
 w3xsxQNf8gVMqttCVnMVPbB9vCiyI5+v2UlADOUcIjc0uDp+ULld9PP850jEpoC/irkc6Z2oBxR
 Eho+D11+I9wuzGjCGKgGzQpieNW54qwaowMF/ECaQqj/TVxjdAknjfoZMmZ28lKmsuiju12SrfW
 Osvqx5t19xXDRkJ3+JQ==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea1f03 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: JBXrdhfTdqvW1dy-0VljlRbGg_LHVzzC
X-Proofpoint-ORIG-GUID: JBXrdhfTdqvW1dy-0VljlRbGg_LHVzzC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230134

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

