Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DE233A005;
	Wed, 22 Jul 2026 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708606; cv=none; b=RQp636s5l/CdqbWOAki12jraYpraZRnXm296uSF258yLZOs5pgVK4ciYRxv6bedDnxIuTyUc8G7IHuDtROqm8sDP6YY4zKyF9ttS3P9STdt1iWerblv3vEpQHF8LzwgxZxF2sOOCco4pppcFpOBgqGu8BBYqSrtiMgiHBRJ6Y40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708606; c=relaxed/simple;
	bh=HCtLwxNVdcNPAU1VEtWTOBnpfsJHF7hmk8mWp2laFLM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sOqz//Op4SjTRPdPqwVP0YSPW385TOOla0ZxIBXp3N8WtZ5g9xzGwvhY9Q7bDa1tHSxi77bRLGa+/Nm5QvCL47M3bvpSx7YJjXvXvjSncDGOg4oZFMVWZ58fGWE9NSqAqPIiSU9etyf/EU5Ch8arNapG1KWzqBjfvBORwbUc4Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+HiTq/H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+HiTq/H"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M7CBFf131196;
	Wed, 22 Jul 2026 08:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3W1W7Jau+M6ODGkCweJ8bZnxEE2q8YJxcF0
	XMkBBLXQ=; b=l+HiTq/HxQAbsUSGeNrp342xzYyd0pcvPYupOqkUp8pBICA4PsD
	hY2cvtTx8nH9dUY6uSVdo/kFzoiEUi7Ji4rkcAWue/tTCZ6xJReT9wnZJZEo68eG
	JIK1hQ3bKRXeXV0tRNidOQwc/LtuTzh/lyM/6FxfoMFQPr5uNsFSOJuVEgT7DCh5
	/mHueve+i39s+tUkwyqJAZ37YKGVjUkK2ReLceQVVRxKvJ9sDuIRi0NPFnlarU98
	aAQw99LWQi2L+9zfPNQyVPiD+sCce9s0+ObxCT0xIxV5D6F02lt9P6UYD/HrN7K+
	RW38fojxhfvQjjImUIXGO4LA76HIcIEUEyw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs9289me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 08:23:22 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66M8NIYS005261;
	Wed, 22 Jul 2026 08:23:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fgj3wf6qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 08:23:18 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66M8NIJH005256;
	Wed, 22 Jul 2026 08:23:18 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rpavan-hyd.qualcomm.com [10.213.96.234])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66M8NIfl005253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 08:23:18 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 437544)
	id A8641663; Wed, 22 Jul 2026 13:53:17 +0530 (+0530)
From: Pavan Kumar <pavan.m@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pavan Kumar <pavan.m@oss.qualcomm.com>
Subject: [PATCH v5] arm64: dts: qcom: qcom6490-idp: Add IPA node
Date: Wed, 22 Jul 2026 13:53:14 +0530
Message-Id: <20260722082314.1502072-1-pavan.m@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3NyBTYWx0ZWRfX8HIxXoUx86dw
 OxcQW1lztIKRky3mAXaD1E/JBGaT80HThbyV3LD0Ow+nu2kYjirc3q0/AlozeznmXVXdzZOIqJe
 6owJCWFcWKyz0iSd/h3gipYz9ERnUck=
X-Proofpoint-ORIG-GUID: fZkO0HL_sHuaSs4x4ClpsLMPMbN4lVbq
X-Proofpoint-GUID: fZkO0HL_sHuaSs4x4ClpsLMPMbN4lVbq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3NyBTYWx0ZWRfX2hF4KT7ncAZ2
 B6DrAu3ZwrDwyI2/uGdIMHU1Xss5erOcHI4e4VtnCtYiuWSFUoc8div02WWx5VTiz332Mco10rz
 1fh7/g/Y2eXoH939qeBg5diPnR8na5tN7foFyr0HlZPCXzLffovBYmM4Lwo74Rmv6ejfBreS/ka
 oRTUJghJFTylJaWYaoXrkAg3C/sMm/I2FUFcQUtXbutAHQS2eUjhNLPihxjugHBS5Zld8MI6XqG
 nGPvRm24foCGdC/soW7dNoABlh6tn9j/b5FkbNENV+nCHz9rO0yiS2vFhdSqWjMGFXDJ1kDTXlu
 cWOQMyqsjsCrpwPPpOFtGBoYIkycX8CaCcI4js5AJpWqbMcp4dOvASVRo9evS9SMJg7j1VyEteb
 /E6fyzFqGr1V6CzObJA2GqdV95Wbtd7Wozl1S3OaNv3IbpPDewHsopLnqnv8TS1bANvTJYo/jbG
 RrYQ50ObqGc8CbwJ3lQ==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a607dfb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f71KzxkOnNgeLeawMVgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1011 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220077

Enable the IPA block and provide the firmware name
required for firmware loading on qcm6490-idp.

Signed-off-by: Pavan Kumar <pavan.m@oss.qualcomm.com>
---
Changes in v5:
- Reworked commit message to describe the functionality being enabled.
- Removed IPA property consolidation explanation.
- Removed obsolete Link tag to IPA loader series.
- Clarified that the change applies to qcm6490-idp.
Changes in v4:
- Removed empty line between Link and Signed-off-by tags.
- Added empty line before the status property in the IPA node.
- Sent as a new thread instead of replying to the previous revision.
Changes in v3:
- Rebased on top of IPA property consolidation series.
- Dropped qcom,gsi-loader and memory-region properties as they are now
  provided by kodiak.dtsi.
- Added Link tag to the dependent IPA loader series.
Changes in v2:
- Modified firmware file extension from .mdt to .mbn

v4: https://lore.kernel.org/all/20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com/
v3: https://lore.kernel.org/all/20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com/
v2: https://lore.kernel.org/all/20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com/
v1: https://lore.kernel.org/all/20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..7242695aed97 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -619,6 +619,12 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&ipa {
+	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
+
+	status = "okay";
+};
+
 &lpass_rx_macro {
 	status = "okay";
 };
