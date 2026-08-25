Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00803D668B;
	Tue, 25 Aug 2026 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664829; cv=none; b=THAlA1V9/ZL6YzjbhvQYeiCJTr74BtHt2QF0woKcqpmjOcdiw0rci+QciKKtze+CkSdC/QFR4b/CTW8ZTSbx2jw/C/nKK2GNHjTtasY23g3xDI0W0dnu22Gsdvss8M22AAG6xSzFyasTU4YYpNm6lwYzZURd93RABkADy1MLUzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664829; c=relaxed/simple;
	bh=oWlmPVPWg8dHH5DzR0L+N10gmj6qZ8xhvDo19kzRzUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hd7Ikwam9Y9yTFfPKEFMkdV2egBfJc8jMbS3V4UED/7F0Yhyp/lBIq61vWh86xa75rFoxTkWuSCGBd+XuGDDFQ+JfOc4ealD3mKox20aoSJNit5DnFpwqu1KEFDuis7gbT5sjs8NzDTYxHKFxHnVoGI9kW2ZJypWcsPu1rGxfpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKOui/lD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKOui/lD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAve1V1251520;
	Tue, 25 Aug 2026 13:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lv4hpXR1Bbi
	i2cqGs8hmqB4dejryTUaGYKu3c6BFD0k=; b=TKOui/lDcp5FVoyuO7rupImjI6W
	/XgGgMevq/WjjEUEuTAsWI0576x376gp+tSLcMuqUZ252PbHjFJPubfTKGS9dntd
	Ekja+qLxW0DtMPpj/APKRHpuJMCIhQA6EX9Ix76FuqnZj8bPzCGYT4j9QJHwONJe
	1XyA3qTtYqJgHK5/bkCxOngJOlX/ATYIsT2qSrobQK7HhBvLc2eqsLqBfrhWlKu+
	TeCy3NFMWs29rMKQNtO8ODxO/3I3WfGhkFH1L905SdxgBTdJoWRXYnCiZ4Hi8Xpl
	+RhnG8vXzG9cFL2BaKOGRZKq5k/EwU4QtE5QY8/e7dxKH8H5PdZRMFC2eMA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3dv72k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 13:33:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67PDXeuD032068;
	Tue, 25 Aug 2026 13:33:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g74ujrypu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 13:33:40 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67PDXc2Q031323;
	Tue, 25 Aug 2026 13:33:40 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67PDXemG032061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 13:33:40 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id CD957638; Tue, 25 Aug 2026 19:03:39 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 1/2] arm64: dts: qcom: qcs6490-rb3gen2: add audio CMA memory region for AudioReach
Date: Tue, 25 Aug 2026 19:03:32 +0530
Message-Id: <20260825133333.376591-2-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825133333.376591-1-karthik.s@oss.qualcomm.com>
References: <20260825133333.376591-1-karthik.s@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: olGErrSSKrKrp2SZH7aWKW7EAGWFsHIB
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8d99b8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=r4sp-uzeXFsOZWuiUSoA:9
X-Proofpoint-GUID: olGErrSSKrKrp2SZH7aWKW7EAGWFsHIB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExNSBTYWx0ZWRfX1rTypmVgwG/y
 7yNE85+HVYLKf6ZJfMaAzFlfnGSRq4HzBRln0BKr4IsAJv1L+JgLRBPPsNTzRM/n1EBb8uBZlI6
 yQeefMd3qtYYaAwR0qGAEByOGqwMuqA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExNSBTYWx0ZWRfX3rZqoWPa/OxE
 TbC1qkuIs8FWq0H2o2ajky8ySfFBGW58qqvdx+tuH2cQouCBB7YLhShM1pD2ONrVZSBUro/2n55
 yYF2HHNn/x0CJJaOwT7qBz8nVpkoTiKQnFwZSvIkHuM0O+KH1F7gCQXvAdje0OZmQHJUQ0vFIyv
 OA9gsZUansOgk7Nma4QQdC0pVCV1yaG/WMwtXHO/LbOnmuKJ5f2nA/cv3cjIjbAiy0EW750wo9C
 k0GUhttZGALWJLezWKYPLo4YkV6AEdyU1hgCUIf/eZLhlXweF09rA2Ws9r9pGHTfgiFfMGnboAQ
 ZnAlB+J8DUSA18bvEeYvLLVq21W0MigTlp4KkDRXJnWYO5ElCWCyONosIX39CEU2gkFxtdcYGaq
 iD/qlBTDfUZRy1fYnZF4YDCnhKyhhqT0ewCe/PyGPj1Lw+KAVu8yFff0Vq4J21Y0i3fhJGtDTD1
 0IEKJK8JM7Gip3fu2hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250115

Add a dynamic CMA pool for the AudioReach audio stack on qcs6490-rb3gen2.
Use alloc-ranges to let the kernel pick a free address rather than a fixed
reg, which avoided EFI-reserved memory at 0x9cc00000. Add 4 MiB alignment
to satisfy CMA_MIN_ALIGNMENT_BYTES. Wire memory-region into q6apmdai so
the q6apm-audio-mem-cma child driver can attach the pool.

Based on the equivalent implementation for lemans (SA8295P).

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi | 1 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts     | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
index c1867711298b..06f65ae8afbc 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -97,6 +97,7 @@ q6apm: service@1 {
 			q6apmdai: dais {
 				compatible = "qcom,q6apm-dais";
 				iommus = <&apps_smmu 0x1801 0x0>;
+				memory-region = <&audio_cma_mem>;
 			};
 
 			q6apmbedai: bedais {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..d39246f34172 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -174,6 +174,14 @@ rmtfs_mem: memory@f8500000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>, <QCOM_SCM_VMID_NAV>;
 		};
+
+		audio_cma_mem: qcom,audio-ml {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x1000000>;
+		};
 	};
 
 	gpio-keys {
-- 
2.34.1

