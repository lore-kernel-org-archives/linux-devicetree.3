Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95090334C1C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215154; cv=none; b=Da+LbPyl0JwM5zchiOzVVIo9HY3A1ijqHWE1JatX9IO2SuGFGwch9LMIXoD3zKILUF1Md4BeTspYeEaAdfk8WB21Fp84Yg74btzMbLs9kaQLln7nTi1MKCRNOIt4BONjtm7so16NEUkHrzy+U1ohnKMSGcz3CDArS3sePtSG6EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215154; c=relaxed/simple;
	bh=hYUWA6hHRWFZeBTK+ngbbDcvAT3eVLKP8fJugqcLyGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nXnyC2DEdbuSmxqKKEN0Lw7oU+CZwpsBSBQq1rsLmtiDscteAWb9+Y+fT3v2oClJfqklhyrmfKl9wuse19oGTTEnOONbkj9EepeIiBx67ho/rVZYLHa5DZff60/mpaZmQp6HGy3dZRUxl/YiNVYyajB4ex1wI3+Mgs32HppS4bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Znpi7PzP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDCpUFs0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Znpi7PzP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDCpUFs0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJhgv3043225
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZuKmCF6V5l3
	azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=; b=Znpi7PzPS2eItgJauTwfseT0BC5
	IPCMb/vp92Jjc1a/Xl3B4TX1wJv/3Lmg/idbJVgGYr5uuZxg3Xww2OJRgFzQEEW+
	Ak5zZzt9801Gxcr7X392WthFDc8OEC4SKMqAf2L1AWwBlyjcpvZhXJDtml8892Gv
	UEkK2DJYdYv89bisyctLlYqKm72t1WgXoby9q0icP1AEQJZiEJKIqugjboO6w2GY
	RVgnERtWfwLvbmSdjaFfPv2MGq+13fGr4ev6OmsKkGydIuE73q02ddeJUhBeszGp
	SCh4ye3Kjs/dAhwVXBpmvw1OtSa2bwqWZKccHTo6qqFYc6wtBApbnOhK/kw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf23m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:19:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8486ffba174so11418458b3a.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784215152; x=1784819952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuKmCF6V5l3azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=;
        b=iDCpUFs0ppgyju7KYONtx/M/I+qVmRCvfrmyGnwf+T5buis3OoG3ppwWvhjNgIf6+e
         9F+fZwNWVXKrfAZUYkNtr3VRdE1W664CPdS6+qi5upqS5YNWaDP5Z7NDeTxkccwivhbr
         +o0Ss+ZNnMMkPGipFBOmmDs3YRqTbZXZO/PKEHfupPPMaKxGIiTpXmZSfSZqmsetgels
         nIImmBt84fRNGpLOdEy0gJk6HQzz00SrZ+ZRvPDWcUHCJ0UnI1CndIdlBj37Yc2q7TWr
         MGixD3i1oL9HniugPvYEjoARXXNmvIjvxj8A1+XJ8epJ+LfOEzpJNv9onbl3dIOVaeIT
         WsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784215152; x=1784819952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuKmCF6V5l3azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=;
        b=LcxE2nltXsFuZsKMzBfXW4sIqOZRwufwbIPH0CoSDwGb3wAxzkJn8S7P1wvmB0pkuu
         WdBL0b9XslU1yMqlVad+XWh4ipY024ZJvNRkJdD2ROyGbaQN8Td167GXWSZ+L2ZfTD8N
         ClAUanlRcy6xaLXUVWGzLPq0+uLIPiR97aZRM/lqXE7e9XITpSavqm6oRqhCKG6m6DUg
         6sWvBvomequia6QrzmkyQEe69n1gMEoKWOstzOYYcQ3ewge4FJGVq93NmucUS5tiQkst
         fuiTzdmA4ccJV1mteseLK++1R1IRASox0CQzsjcczgb1G4QP8OLkSHptIJfK4YPuBZD9
         hKLA==
X-Forwarded-Encrypted: i=1; AHgh+RoYhaHBMaHnj+ofcTR+ig7HcKlcx52YKBulAIWKZ2a7SyXFRTSg4TbaAcJNL8jDbcGsNlJIbKljNiP5@vger.kernel.org
X-Gm-Message-State: AOJu0YyqjAiOKXc3uMVdvuM5359s9nupypZ4H9cZDa0IpZQd0IoTM3mU
	0WiHzHR3GkMY9qlN6l0OlShAq/RkmdrTbznm/Wpm+NZQ2/FpzVB+l7Jh7XgWH5MY/jno31A/F9i
	04KF5BO4IiuX+U/aHI7knUJBsRWhvQI4Gg7Pf8UMcriRI+u4E56mM3J6vnLWZFHx7ECVicwA4
X-Gm-Gg: AfdE7cki7aoAIaQH66lBLyeVfthOyaImhIk+afieU6LHh0T0NjBNXVgjgE/Mqzs0pvj
	ZS0FHuP2HyfmXtcG3+Fao2Y82PIpXYfvxDcJ9/M6pzmgp0pNAWgoDFtqAptis46re7y8lcSAG7A
	yCubOwzYIwDHQxbUD7Kkn0I9fQUcMQOAD5P1dwDh3jGrgsvC3IvKc6mle99VaOFwrVeFHSEij60
	WS/dWPC6mqSnVoxYjHUAltS5a+hi+Rffrnh4ZDlEXMCZc1zb9GyUhOAwbS1/OBQTxDQj3ly7lUp
	bPXjhPiJZerA9ZgiwY3e5yADABD+4cU/dJY264JY2Tq0JnZfBK2ofe9I8iKqC5rJ4NKYyNFIp2g
	+XsCYITS7YYj5fuut55fumLO4CRLF+WUvxlV7
X-Received: by 2002:aa7:88d6:0:b0:845:4928:8655 with SMTP id d2e1a72fcca58-84a55820879mr10135947b3a.39.1784215151575;
        Thu, 16 Jul 2026 08:19:11 -0700 (PDT)
X-Received: by 2002:aa7:88d6:0:b0:845:4928:8655 with SMTP id d2e1a72fcca58-84a55820879mr10135897b3a.39.1784215150989;
        Thu, 16 Jul 2026 08:19:10 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bfc2bsm4941616b3a.37.2026.07.16.08.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:19:10 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: qcom: monaco: enable audio ML offload memory and SMMU mappings
Date: Thu, 16 Jul 2026 20:48:54 +0530
Message-Id: <20260716151854.3041914-3-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com>
References: <20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: X4yZJkZ89JPO-b5LUk4vNBBwc2ibEXVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1NyBTYWx0ZWRfX84O9BlyLe9Ss
 YyGJMDakjSYhpsOw3ANCRhl3V9Hl56kmXncVAJRTCu5vfJ2ln1OzAhDVFcHZMiWkqgXB9f+SKGq
 /si2t/61efm1lreliscuiS6jmbPlCqevKE95oSX+3OC98CdEwtfWF6ubBqwkZknjXaiBtisShBf
 UMnle6jCv0y5bta2er887IuaU1o06COeWzi0qGnbBeNk/P0dW0/0eO+dOycbzZhrZkhn1TZSU3g
 xUsgJYAsWB9ewTKeUp1N0tLrH2KTyTnk1D4g/ShOTBf3WHs791SnQJ+U7WkyCnb2PTzIziCZUE5
 bHIIEnpYTDZw1l2gmb7i8w7Jp4BL1xe4/bVAR2zPfg4x4kTzoaHvqpepHWLW88OaLLbfEfSZKF1
 a/ljoBXSz0xJ4kXY2ZUhgEHCGQqrDXlaZlI3lWBMOAcP38+ydQ3V3t10bsov133ydscsz/744aH
 CGf2vKuCt7ltU3Xs92A==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a58f670 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qtuJx3-IUi5I1-Rgc4kA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: X4yZJkZ89JPO-b5LUk4vNBBwc2ibEXVh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1NyBTYWx0ZWRfX8I+zDZ/dMDKq
 3LkSQdfPyIw+/qoNzZ/mdiFACIhD7k6GhXP5jWFMnJqD34tLY3Gnd3EF+Lv6WM5wZ8lm9lBySAp
 xx0SoxKuC1m0Wmrmt6ba+CQkhbxoSj4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160157

The audio ML (machine-learning) offload use case requires a contiguous,
physically addressable buffer shared with the audio DSP/SPF, and issues
DMA transactions through additional SMMU stream IDs that are not
covered by the existing ADSP mapping.

Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
aligned) and wire it to the q6apm DAIs node via memory-region. A
dedicated pool guarantees the alignment and contiguity the DSP expects
and isolates these allocations from the default CMA region.

Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
enforcing, so the ML transactions are otherwise blocked and faulted:

 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2060
 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2062

Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
remoteproc_adsp iommus property in the EL2 overlay so these buffers are
translated by the SMMU instead of being rejected.

Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-el2.dtso | 4 +++-
 arch/arm64/boot/dts/qcom/monaco.dtsi     | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-el2.dtso b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
index a7e3270f8609..97bb8287cec3 100644
--- a/arch/arm64/boot/dts/qcom/monaco-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
@@ -17,7 +17,9 @@ &iris {
 };
 
 &remoteproc_adsp {
-	iommus = <&apps_smmu 0x2000 0x0>;
+	iommus = <&apps_smmu 0x2000 0x0>,
+		<&apps_smmu 0x2060 0x9>,
+		<&apps_smmu 0x2062 0x1>;
 };
 
 &remoteproc_cdsp {
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..d971c0ea1b30 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -729,6 +729,14 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		audio_cma_mem: qcom,audio-ml {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x1000000>;
+		};
+
 		aop_image_mem: aop-image-region@90800000 {
 			reg = <0x0 0x90800000 0x0 0x60000>;
 			no-map;
@@ -2844,6 +2852,7 @@ q6apmbedai: bedais {
 						q6apmdai: dais {
 							compatible = "qcom,q6apm-dais";
 							iommus = <&apps_smmu 0x2001 0x0>;
+							memory-region = <&audio_cma_mem>;
 						};
 					};
 
-- 
2.34.1

