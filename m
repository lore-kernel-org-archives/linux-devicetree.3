Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614733F44D4
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784255; cv=none; b=Dn7+6xE/9hRXcWM/OcZCA9gSI6uqyT+MWiPg/bvExVj7EFBNn2ZxNb5j8dvqxhfPGiK9c82x9Wk+sRJB3786qhsF+BzW0VVz0HLhpm0NDzALQpnj+naRutXkz9t9woBm/gY+PsxD+0UAXrwNVH4kkyCaUgw8H/UgQGWbFf/sLYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784255; c=relaxed/simple;
	bh=j9qkY+PEaviJ3uxuPaxM2e/0PVcYDM95Es5UwRR+OlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjZLivPE3xEEhEY1AHjuREp1pM7QtxHDMUQCa/H9uBEODu+b2aIOeUFu3mjqWXMiIMG829XNlg4VJD2rJr4dFSQ30vUv6Ng+XZ5zB+4LzoQXqpYZq8q1zoozWwJe5ajVNgQvsyXAvqx+4tj5jmdTs94FYFq1FOmBFXAhk/oQ7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARzKPccX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuIccRul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARzKPccX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuIccRul"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAra5a1054833
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7PrDb5q95lzDbbN2mQGKU0CkhEh48l/XRLGUuhOMR4=; b=ARzKPccX9tmPXO32
	h9GfANv2Gx7Q+SBEQARXjnv8SenGgcKUdvrO3n0bifrwmo/JFeURXaa1JVU0+4Zs
	o8AeOq2HomCV474fw9yr4rfNL3EWCHvfHggxeyp8BNaiYIXfEjvmOaxBr5nPK2Qt
	De6Fg1OAI66qsc0B0BRX2wtBx9pBo5InbFrx8sTlmylKa648/YzlhRNGAyIGK4Te
	ulrK0lJMTDQwZa+uC8UOPa/bDBBvSPXN3IdsVK4i4DwiVj2evEjQL9wk9dCpXFfG
	LYAXuXUp2+LtVwNQoWbW71GqUmmyu5qbtlCyqupYB42sebf9ukko1ZZoxkN3Hmep
	gO2gEQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2ccctd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bccca5620so985686eec.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781784249; x=1782389049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7PrDb5q95lzDbbN2mQGKU0CkhEh48l/XRLGUuhOMR4=;
        b=LuIccRulyqAYh42BlYMKRq2QuvNoPBaj7BTnc61ZThzqMQf7nsmginXpuxnoqEkzWP
         q24Vz3SzyknWWsHhg+dNcM62K0GoJl/6+VDtIViv0Cpm5BnYZfjUoZR3hXwuBrn5Rjcp
         WYVWnin10f+XVOiI9cdeuBDfxUcNU6aeIPbxXvBYLiJkt5O8LyMtYIBU9Hp2c6ps7K9X
         QBJCwQFvzvEe/DGe5kuE2vnCAMKoXEm53IEbxOwolWBh1YtTKlt6I9j3eerrR2dEQQa0
         +OYwT+aLomI4CBwby40IkfNuVk3gI1tahlP3mH7eKXo8XOJ4upuWGrH6MPaDPn2IC//H
         Dgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784249; x=1782389049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7PrDb5q95lzDbbN2mQGKU0CkhEh48l/XRLGUuhOMR4=;
        b=lWGQyPI4/5YIBBu9Jd9qAcvbUFeWacc8BNbPuF3ygEgY1lkKRv0msu6S5vC0HhlAfM
         FBp+g8cAQW8CbL7UtC69U2ErP8vwz8BW+67w+XF5SsmBFsqminmQBUChgj+lv3Zyie22
         T/Q4i3C7qgpBgEOfSN3CK2dueLH3L3z8GEW7yk96IBr25Vcq7Q/RgxJmLvxrEUhhxLzR
         KeLTTpPmQsBkw20Zyfs/qCVuzsMUvNdcUQwuLHqLLPXMB5V7yaRIxOrIx7nyCiG+gp9v
         fVvIMOHtxZXcLw0f0Q2O+ZaMPt+yH24a0LpNcYj++HpZl/aEXdWZm2vYnLOkaUOyRYJZ
         nE/w==
X-Forwarded-Encrypted: i=1; AFNElJ8RV/tqALengbtLrMzREJGvt4TPwlyOcuHNP9TTKUC/92O4Vpv9x1WSBmOAMuPND3Bxp10u8km/x10k@vger.kernel.org
X-Gm-Message-State: AOJu0YyrW6ozp3ISpYbmfhejARiUg41Ug2rz7O0cwTZZcuRGKkjH7iaJ
	ys9fb2pDIwiXePhUTcBEx6HoIP0HbBzvzwEbYG7O9dA/tVUw8by+OwWzutVNYloFiaFIed8+fXp
	Z5FmZ7/301S9WOMXXmk/fSBr8ringJ+oXHr3zTEyGO9vMoFknAd13mqklTDDb1e5n
X-Gm-Gg: AfdE7ckT+i32/iCJJ7BwG/cmATI8BJjNBehQrl1n9h1RMZLnABiYI9salgug4UtvObB
	qB1++GctrjoFsKeyZe7QmEHHQfi4EmcmArkoAUsqfE/EiI4BklpoZbJv5UcjbwdfpMt0ppcJa6A
	MtnZtK4qSLaG6J7CyJ0T8ulR1om4HRe3GPu+IXRt+bSTG8yvrMrx5Xv0j2FDTOIbkfyZw2Cx3qp
	G4Wv+E+qZxGu+2mpbU4WZKLDkdOTR8+DhochueTFVbNAt12ZevkEuQwJQi3YKHFQkJIwZxg+S2M
	igt34ai6iciEsCF31+q1Wk39wOou0JfNIU5/1n3PBD2wTAqHA79g4NvIh0L9VRPRqNa15fEm/c8
	8u5EFZT1DzYyEeFmi0bYKqT+XTdfZ2YhMiYrsm+6HeWjk7UifolrfQdhNJ66jidBgLA==
X-Received: by 2002:a05:7301:6a15:b0:304:e2a5:689c with SMTP id 5a478bee46e88-30bc9f57d2dmr5139679eec.21.1781784248610;
        Thu, 18 Jun 2026 05:04:08 -0700 (PDT)
X-Received: by 2002:a05:7301:6a15:b0:304:e2a5:689c with SMTP id 5a478bee46e88-30bc9f57d2dmr5139617eec.21.1781784248043;
        Thu, 18 Jun 2026 05:04:08 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30be0c45a16sm4177713eec.14.2026.06.18.05.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:04:06 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 05:03:52 -0700
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-pakala-camera-v2-3-9fbb729fd242@oss.qualcomm.com>
References: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
In-Reply-To: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfXzLioi5pplXt7
 NGrFp8HeYixOKslAoGhB5CzX+QvZw1hwJW5knmqQ05vZXqxJU/9uVwtxCk/gytXw63jGFHaDUWU
 hyCr9LG9hxuqqo9qQ8HLGGetUasStQgHqIjjuIdp+BjoBwkxrjON69f+2yhgzWDVC8HIDsIDVV4
 MoNUGiFzLkchHstdMZ3wCeYvqNZnNo5ZzU/oYuFX6udUhCCQjeftUYl0b1q2XETZRNjWSzOB6zs
 TuwgwEt1M+LyFdGdaJo3rw9An6PJAmm3UUhnBg2HY44pvylR5KrqwqnE0J9mOcrGLC/fKDpyZCm
 dDFwttLFxXfUaSevemzFWqffoIt+GM1Z5qVK8Cc8qdWJUxW/u3UoivgVm3rerqZqZSwEkWrJcjP
 3KGQoaG8Y9Fczty1Buk7wKs54kdN/r6gqM40Y4Sy5IuNvrLBeYBZ8Bwa3lAmRxHgYnc2VUM1lYb
 MITh0iIc2OHFiXI427g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX02gOlo4h5hO1
 rsbrbrrwFNd31banY37Ir/J6xGIQoaht7A/NcH/U4qYuOTU24S2Eu0LMJPDDAKWMrm9dmkdtl2G
 m5pl+AIPEMXy3l3hVEsbrPXstbbSavg=
X-Proofpoint-GUID: KIhTv4srj26qCN-VHuV65xR4oer_BvKK
X-Proofpoint-ORIG-GUID: KIhTv4srj26qCN-VHuV65xR4oer_BvKK
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33deb9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_lsunXYYtS7J6GFZci8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180112

Define pinctrl definitions to enable camera master clocks on SM8750.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 7dda8408c6d1..57d1b05be8ac 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3899,6 +3899,62 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio91";
+				function = "cam_aon_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio93";
+				function = "cam_aon_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";

-- 
2.34.1

