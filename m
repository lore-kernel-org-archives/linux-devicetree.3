Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4944B413794
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228055; cv=none; b=afGQVvGZngTRUyXSWMlmdMZGZJhAVe4SYujMysFpk5cTQIcpl76n4yHZYjqd6YvsiD1bgpjlfGF3aTxY8TTbBW+8kyojSJnzdEbNX+tIkE8R1qS7q9k5yQKD+ypLK4LrA9zw0KBGMCUWJfSQW3dZl0TilZfDrbWJupLOIc1C1us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228055; c=relaxed/simple;
	bh=yh7omN7QmSLIDUhxylRwnAYQoNTHBYgtT5w9QjEIgBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peqOyS62MCvalGDAfSKDVSirsX0bQIZeZSUyzcZ0EyWg+LEe4uXoYLOWLHmlEqeSRppMhi/d76wo2Ipn/MO6csW8i7rCPJo14Rg/VnE9eUXaeEyq7bLhAcdoL9jR9vnBvGIPSHwZHX5F7nVfmOTSGpklnCgqt7/8cAs0Pliql6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K710jn2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jfe8zaOu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K710jn2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jfe8zaOu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82WJC2129569
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OA7ufRK8NeF
	pheonCHj36Io4/bhZQD6wPfpD77Fh0JA=; b=K710jn2mHfI3xU++zIhYU8hPAa0
	clM+mePOMySUcM+CBxot2m3BEg5Bb4JsSU23UBapUVn7OFOBdVNg2KJpgyZTVilK
	VceYmrK16vlBEENvBL9ToWFJ9+GWV1gjsuT1QvFM09OnvrKiS/twhNCAr1yZ2NNx
	71gW2Uytk3ioODadp4no2EI/XavLFirxJCldF5GQoxpCABJHs2YFW98yCCExCUlW
	3wYaVgW0dfj/dK8e77iZYCGRzhWxDP6kAxmfJSYOdnsYvdShoeJoXUons4aSFFLi
	DacG1PikxT4p6XN7maRkpn5KFGUEzBYpOgCHjX0d7kY7RwkLZJ48XGOrE3w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8b913-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:40:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so36778925ad.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785228052; x=1785832852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OA7ufRK8NeFpheonCHj36Io4/bhZQD6wPfpD77Fh0JA=;
        b=Jfe8zaOuh+6yO/IFdkzvJWp6XFiYF77xoShc2nRwptc52GACSNFj5BEyCKiVvsdhoB
         x7CaNecZcGwYaGbzLrChtrxE2RdAZXvFrpFxtwM+MHVwDU2Va9UE5h2HUtZEl3csrutu
         9uO/bme0PuL2aNI/JArKPxiJlVSpCpsyaZEvLLU2WYCzb9c2zHoVfco0cQQvxx9o/tm3
         W8R+BgCod6/ChVH3k6QJ+oNkeDt909kzGSkNvhXeu/TpLXXLzr89Aw81b1YYgLWaDxk7
         1fDcbPCoK0zM/gRWt5Pit1KFOJVJR8HrxuoZ9gGmwGRiEnbPvn4dOzw1k6GL/dhH771h
         XFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228052; x=1785832852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OA7ufRK8NeFpheonCHj36Io4/bhZQD6wPfpD77Fh0JA=;
        b=ktZk1YHdzN5fbR7AucsRRWqQddsnauZUERbsvF6wOOF8TXyCJnnvukMJyfXIXkscBJ
         cOMypjQn+ovB4NYsSfbsExesTQKO1Y2SsJU6XZOm04EGqLwYHfY+vKr+q39djlIr265l
         Q82QF2RLu5zA1k1PFu15vexKh1L9YB+wyQdo37JN4rMte7XDxwmR8Bx0xGw4uu2Y3A3g
         40PKJV1aLo9F5clj+9YgAIXVm1H4ztxr9PUVcx8DLrelBgPfVk+vhpTzhvosGltImK33
         d+gNwpWnKynTAzOVJ4kTSbTqVBICz3+rn7Jwy64lJRr7HNNiuSapywAwrigTtjdIKEzC
         FlDw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+85xgyRzmchd7WQEn4LmmBRQkBKB3RwcBZpZ65qACew/ALLsLujTHY00KfpM2rxMG3Kb5+64T5KQ1@vger.kernel.org
X-Gm-Message-State: AOJu0YzmbpeFyT6S17HBRo5N0KFfdsJUJ1b7EqZTTdS8Rkdmvbrkexv+
	yDZhJ96h/PQa9X5LeLvsO9dVt11A/nw+kRYs5uQt+6g0XpM3jWqXzedPTgicpjZRHZa4pwWmyos
	AsQx/OUHnIMi08Ry7zPq/bT68nDH7RfRHSBCXBGEKKl6vXOBuM5TjvT2fATPEyc6M
X-Gm-Gg: AR+sD110kDfKR/QLSLHx8CivbRXS42qt10LljcLdRGbCWoSkkKuclwF0opb/NHvLf60
	VVEq/PY+uloKATOhFhEYC3JgotpRpibUq1uEuGMHSzrbOl5O5LP7wxJYpOE4Gf0vQvwjBIP/egd
	kKOUHiHfsIvjJM/IFCcZXsuLzzppf3mFfc+Hdj4lBV9yjwoWYBQsaJHbxQ1NvRY7d+ARa0d5OnL
	6btgOfyu8eBOrKbvEU9dOoAIPXbxW53kdkkIdDd/Ydvg1PLbFVKFDSS6qgT2KdAsltI3f0c0Rv3
	DgKi/eb5fADD6u53IKNna/wOLaQAlaeNzba0S19GyKHVdJdvj5TFhcnqd7OOFmIjOEvHzad8ASu
	jM4o5LJ1rf9/owk9hq7WyR2pxxhNPaxXXtP/6lVG40zxAwG3NmUYf5CTAq1cf
X-Received: by 2002:a17:90b:3b8c:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-38f6a471784mr1605444a91.10.1785228052021;
        Tue, 28 Jul 2026 01:40:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8c:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-38f6a471784mr1605419a91.10.1785228051605;
        Tue, 28 Jul 2026 01:40:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc66sm916277a91.10.2026.07.28.01.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:40:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP support
Date: Tue, 28 Jul 2026 16:40:12 +0800
Message-ID: <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfXwIoBXL9V46gF
 apuPFNy+a2pILZ3gdoY+fT5lQweLwsO3FNkRmnQp+G/nGSUhm9wPuZg1hxlcqd2hdEg3RtbCiko
 And4N5AXuAVZkbptKITD1SHw7lC2mU//u0OqKj5XsYobSmM5e7mGRuXTw3loVctKKu5HJFpF83r
 wpxY2n8mXT32X8fEGKae67mTKzmn/6TRIKllViDKHGDK5gLGGrojFIL2POlw0pWa2hTaChb9Pom
 2HH1lkN6dOQH6yxSNCxySkiuTge0sjIICGbioPbR+E18wiUxtoBLExDMvDwz4oQf6Go73N6m3Sn
 d9updbG9Zp6oxfskhLZg3kl0s3Ez/3sqaepkqt6NNzNQIzJpft0tLowY0u+X508A0TbRYOc3aPW
 JiwjYYQAUzZAepGAb1SaTPAmWRsLQASmZyMjGdHKh6kQiLLndDt29zwGTEZuaxzEyGUy5fYJEmD
 gzNnUx8N6u29jSBBJGQ==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a686b15 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=wKDsrv0q4RgBVPAhY5MA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: AwjLpmpDRKDp9ThrnNvKiD3EVWQY0GRb
X-Proofpoint-GUID: AwjLpmpDRKDp9ThrnNvKiD3EVWQY0GRb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfX4jm0bJcjcZie
 rM/MxlDyvUEjFo6QTvK4V3H1G1d9JGw3do3xYuXuIdgPcLGDGL8NqBOT+iNlQK5D6OOJwgyuWLX
 T+9masIZIDtA6W7xyerzEKM1XwPxVt8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280074

Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
is pre-booted by XBL before Linux starts, so set early_boot flag for
attach path rather than a cold boot sequence.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 110 +++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..63a26c6ced8c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1434,6 +1434,111 @@ static const struct qcom_pas_data milos_cdsp_resource = {
 	.smem_host_id = 5,
 };
 
+static const struct qcom_pas_data nord_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.dtb_firmware_name = "adsp_dtb.mbn",
+	.pas_id = 1,
+	.dtb_pas_id = 36,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+	.smem_host_id = 2,
+};
+
+static const struct qcom_pas_data nord_cdsp0_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 37,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp0",
+	.sysmon_name = "cdsp0",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
+static const struct qcom_pas_data nord_cdsp1_resource = {
+	.crash_reason_smem = 633,
+	.firmware_name = "cdsp1.mdt",
+	.dtb_firmware_name = "cdsp1_dtb.mbn",
+	.pas_id = 30,
+	.dtb_pas_id = 59,
+	.minidump_id = 20,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp1",
+	.ssr_name = "cdsp1",
+	.sysmon_name = "cdsp1",
+	.ssctl_id = 0x20,
+	.smem_host_id = 69,
+};
+
+static const struct qcom_pas_data nord_cdsp2_resource = {
+	.crash_reason_smem = 665,
+	.firmware_name = "cdsp2.mdt",
+	.dtb_firmware_name = "cdsp2_dtb.mbn",
+	.pas_id = 57,
+	.dtb_pas_id = 60,
+	.minidump_id = 29,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp2",
+	.ssr_name = "cdsp2",
+	.sysmon_name = "cdsp2",
+	.ssctl_id = 0x1f,
+	.smem_host_id = 133,
+};
+
+static const struct qcom_pas_data nord_cdsp3_resource = {
+	.crash_reason_smem = 666,
+	.firmware_name = "cdsp3.mdt",
+	.dtb_firmware_name = "cdsp3_dtb.mbn",
+	.pas_id = 58,
+	.dtb_pas_id = 61,
+	.minidump_id = 30,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp3",
+	.ssr_name = "cdsp3",
+	.sysmon_name = "cdsp3",
+	.ssctl_id = 0x1a,
+	.smem_host_id = 197,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1702,6 +1807,11 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource_init },
 	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init },
+	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
+	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
+	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
+	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
+	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
-- 
2.43.0

