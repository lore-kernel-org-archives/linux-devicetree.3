Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBE7232395
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142851; cv=none; b=IjmBnxfl1rj2BVrUiwdd3EO9n3HwT1EFvTVQ9PJQCfQ8UhQAJEUNQGUzlQOc22wc/0gS0pbRsNmv3utWN288aQp1zODKQ06iOGMsOe80HyOtZxBsaA6/xJg+eFy8cZTBYr1SizS2OKBcnRfYQyCeKFfVj8FN7eqyCzkRhypJk1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142851; c=relaxed/simple;
	bh=i6ZmiIhYyteEX9ku3DC5s4Wu1KZIwZCobr9Vm2PQ3dA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OhyKARgpSqlS0+mtqOdDRCLS6hqltpOp4cmnBcxyDTyTPlcHxcQBlTcfm05ojXMNqB4O5jQZqJC3YFU/xJZ8Y0hX2kL6pJnhYHB57g4Zk5HdrWuHxAAGOt/AUi1VfzwQS0z3oZyvriV7gjQ8CxBqN0YzPzAj3rlDdJP8uWaOjBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpih+3HN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9/3kOUc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpih+3HN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9/3kOUc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLENPv1479154
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/V6Rs8rcZ7PWWMWLKnxm5Zkp3zsUGa7EcbO4a5GtxCs=; b=gpih+3HND/I+h2iI
	E0zqieeXjDHZEX5HqWtB5fFp8+ztXhjYpp+BxQA6KpiVtJsLFu266A99rfghPyA3
	CZNBXiYcpMEZ6v55ygSTZwCIEKf7WVVpZljpgWb3BB6GR5cmRBOj9AFDq02Tj96T
	9sg3iE6DqeQ/Us0bcs3pnxzMCBkeC3WnQtUs24HA8LTKMx4mxANkyBGUhWRBro5l
	Gb/kmekTcEnuS1/9ErG/er95B/PF8Z/nymCprb/dsr/aD2EuVWqf/SoYQYhpI+Vf
	QXPlClLSmJKrqjqxyrKw1FMQ+m4so/Fbk/0OTxntujLR9KOlANZGPhDmIauKCGpa
	Pa/RXg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j12d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:00:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso22021125ad.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 22:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142849; x=1776747649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/V6Rs8rcZ7PWWMWLKnxm5Zkp3zsUGa7EcbO4a5GtxCs=;
        b=E9/3kOUc9HOiIe+XvyWsR5TpDna7OXL3aclVQle2lbvcWEf0xWwEoQRYNvK9SJoibv
         Mw3fNMYsdUPDJJYxljzbexMWpxR8JMSKljvueDl3kslVLQM4bkSTa7Yw0v2IFNnkliHH
         VFa8skCalXYENW5kxFYXg+OEheR6OzEQGg+n0TVH+TLm1ebMJoi5Q8njxboPyC3ku8su
         XeWGW42Uo00S7fgyaCUF/gYuSVM1bJF9krqZC22cFEU1jsftYGaAtcFw2C/2xLI1yBHY
         lc7gxHa7uIh0m4dopEHZpHq1UcRfhUPRt/5mVK49sa6bFgT8xYq7gWlmhNBrY/lkTLcf
         Nm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142849; x=1776747649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/V6Rs8rcZ7PWWMWLKnxm5Zkp3zsUGa7EcbO4a5GtxCs=;
        b=LiaQAMDPu6KZ/LS7BUpTQPV4LJH23BtCfRW8r2iJ6XiH5lfimAbvKV+YKoOCLHKqsx
         AEgG7tRSVbhMMufV2l9jfQUeoXhVy3+XQua7XdFiBPdFYUXBv2gYqgplyhJopNc9JE9X
         1AHKjV03rWGRy/b4QfheQ4wBcysaxrAGBTUP/BRR3eesGrYy/PhwN0coAiclkzjUdhMB
         Xt6TEK3J+yCsMLzDNQc8DzxBBIG2EQzoLGRXMsXt+JfsxIRE+wNbisLQT+BoZxXURATM
         4pA7vtdw509m3j7I08CD5m+J4lPzeEBrsphIsFfe2OSyIMOxKoTF0WWUh/jIosz0NutN
         /Rsw==
X-Forwarded-Encrypted: i=1; AFNElJ+sLO0xW8nUFki6f7hj6f1NubBOv6zHzhrO6ixFHOIqS/rLaGHkN67cEGxQvqpVH2MRf2/svdJXcyfZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Cxum1cuaSam1112X7OC4YDBB+W3wnUGBkGg88ZVeVo1iCUKv
	O2wmZm2bNEJNxRvmpUKoyAM+17iBaUxQccSL2BFkNGgrFngtsWtoMPzJ57Ffab22mMZHPQnIQLB
	Z+Hc+TNZlfMJ0YKQLhBb5Di8+Hx2J+G5XGpt5fc0+s7ezXrt37PBpqRQ9YCPM7b0g
X-Gm-Gg: AeBDietI2JD/Ixgj0k8rX2AJCpjrvZBT9btHIVBc09SUrIeqaG/A3eSVILdNvBkFKNj
	rkW1mmSct8phH5eRRym9CwPSCmJg91dvttf+/rPkzwvHarQQ9O1ynZw0iBgAfyE1V5ERCka57M/
	pQrIxh9H6tj4TCJecDk9yjSo/+7605ICqqR7/lQlK0UKVoEYDql8FY+TbvfiZOkv427OP1UGyaH
	JYoC8/TZcPb3QtnHmDbL3x9hlp0vazwlobexa/UAto3p4Ha7ax4M7pRqjTq93uV8zznn15M3S2b
	UPdaMIsSQKrQHy76O+Bc95Z0WA9sgTOv+b/z06C1tIFipv+t310d0rlPUT5ZN0WG3MO2EWg7TTm
	fYgdSixMCEX5zPRD3solKgu/fzhyrK+fYIoAAieNvUvU1xB//6RWuBBA=
X-Received: by 2002:a17:903:4b0d:b0:2b2:5597:bad4 with SMTP id d9443c01a7336-2b2d5a69f1emr147906735ad.30.1776142847494;
        Mon, 13 Apr 2026 22:00:47 -0700 (PDT)
X-Received: by 2002:a17:903:4b0d:b0:2b2:5597:bad4 with SMTP id d9443c01a7336-2b2d5a69f1emr147906225ad.30.1776142846873;
        Mon, 13 Apr 2026 22:00:46 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:46 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:29:59 +0530
Subject: [PATCH 03/11] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
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
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=3016;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=i6ZmiIhYyteEX9ku3DC5s4Wu1KZIwZCobr9Vm2PQ3dA=;
 b=+2+NbB6zm/k4yanN1JURhnrXB+oAf2ZOIVM4jw6hSDlg8urxTn2L1XRBSID6qg9Tot7pjAl7Z
 FeYY6PQsmWiBH7fqg1XPOijE2WBn/Q5eKdptaSAHhJBvzPYfJMoBCzA
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: f9hocrzdQvWg1rwKupSNrjkt7HOfd_4y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfXwA7AojFsm/3j
 tC/JxYCgEIhAq/zQx2W5t4Rv4iUdt0z4l8PEOswwnRKqxWtalUsQk9hbG0QgC8iXGAKrW9Ltl60
 sGUnIRIO+GcfU0a1wO/wFDmlWC63MY5jMmd4WR4K71QmxyAKWWtDCEc6lMVt5h1s1IIRbEop7x0
 81KPlSTP+iGk1980ePX/mej5NCWVt92eXop0PKBRLYXeSuscTNmARnm2/amUAsgSmpBwAaDm0Tf
 bYCJhyZrRkxsIGcsCprhgK4ThURA1O7cfZ51H+ae465y4isMJzryKiiUdP5NLPfdkXfMQKb3R0d
 QucDnHmJf1rLMmoowz8TGwB3yYslH3fZaeNk3j2Xi92RjMh0YbMMhr7DO5unUmtCd4PFsuWm+/S
 T5a6X1W5dT1FCy6QbChIkCKS+bg1Zt1VFk37K/1uEFT4Bx4uLlr7cyGJ5Sghsbt1R85nLb8aaa9
 trRLL2Q/8GABkJSOYtQ==
X-Proofpoint-ORIG-GUID: f9hocrzdQvWg1rwKupSNrjkt7HOfd_4y
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69ddca01 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140045

Add init and deinit hooks in the platform data for context bank setup.
These hooks allow platform specific code to initialize and tear down
context banks.

The Glymur platform requires a dedicated firmware context bank device
which is mapped to the firmware stream ID to load the firmware.

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

