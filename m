Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145273451D6
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154075; cv=none; b=Ew5jpVH42c0llmYOS7s1ylnn54PxtpsGpXOLTQ9yME3RCvd2Ruj/050CB+wpTaLVmdy+yis/u0mJ/V5zglNy0VfeYvWp9TSFKTwq4vi9K3Iw9w6t/G7qADVpHXqe5HOrLPTh4RjcdJMd03HpMoRrTInVyMf2xuRWD7EPDEisglI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154075; c=relaxed/simple;
	bh=pTME4mQxfefQUXeCFQz1c35/zCwqiALApnOdQUDq+nQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EsXE/76AA+y+nl83+NDCioleagBw2EimIamn57W5ruQF34ScoFMXoQp4z1zD82AdQPVTUJMD4HgNHKraVs0WoiXIslimpgeN4CvR51vdL9C5cCV5N0nqcqmhN49iU89uTBXMW27qkQGMTq/tKHUpbM7jPn0sq//KIqPAbIS9mIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moYNqrWG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XlTsfCPt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moYNqrWG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XlTsfCPt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nb1O3132319
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/m4+iSCo/KhQKCaob26MNMXAVQNntzuOFO6J64O0I2w=; b=moYNqrWGTwhAi3h1
	vyXU3i5OFGsXJ7biK/u3JobVS/Zem79svjEKOCjQz6I1MCS9mxFGdVCiAuGAmrHE
	6aOooseZt0MYOPamqLOik9E1cJaSC2PvKXp3vLnyKJ5tNjBTGYZKoOpGQ/kp7VJY
	AQOZBdnxLlX4CgQ/VlnXI//L4UF/D9jjq2uOlMPQ680Q232engYSJ5yNxc2CmJBS
	FOJIsmuTU24G4ouDpUxUcWrnNuG2gDDu+dwPObE4hNF3dFnE4m0EkGn7bLy4zykd
	hB59RNLTxbEkx3MK3NLpXzKfRMe6o0GSrmqhoeMVEpW2Ii8Mayuy1SGEdYHU8IZw
	ByTWEA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6shqq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso7020447a91.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154061; x=1781758861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/m4+iSCo/KhQKCaob26MNMXAVQNntzuOFO6J64O0I2w=;
        b=XlTsfCPtC+hbRX+R5KlTtXx3yusnQ2kPW6D5qL/TyaSRzqADTAUB5jW7t+Nf5KGgfg
         ZkBQmB759yRj0pQb2TMCtYCP0VYjRXVpoG1pnxNndverhxqIBjRWWQ3YeKJIj88xJmNU
         Ilt7Nebhbs5d69/tea3lwJ78Jra3BsLdxGPbeokMtVnItdmOl4XZqLwY004w/dhJqz12
         C8cZ+2kSvVJfzBJZpqc437TtdWyzX10f2/kLohkOmb/3PAAAyy3/cV48syG3Jn12GIpu
         t/FQYEVkYOtnp9B3TQxYBCfOYetSyHfJJF9WCFlMPj0ufez1ioPvH86GXR4FV/v/Ucpb
         MkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154061; x=1781758861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/m4+iSCo/KhQKCaob26MNMXAVQNntzuOFO6J64O0I2w=;
        b=MDrw1feNczzb6RHXwaz19RL327vF/YO0q9Czda6Z3+YVHNozfskGyL1qTtORsU1GEm
         8slyDqhKlV4b+GIudUwfK++a9OMdsc4LX9267d82iuGGyvvXwp5brMeJe2lKPdjq/hWf
         ev3KePjPr6Kf5TEKa+u3Tgpl8mgIj5EASN2WlXbDvkdB/8xTSPgzwCJXVIbRqmEPlZMq
         VB0U+QWEYK3rj8EpJ41mqrkmYyjrmEWmY1EUjKjLGgtHsxF3U8yFZL0XTmJvR4+VJaja
         NCci/Qcx9UCzxVVly5P/NOZAD99LIkgbt8TGCdhqA8siCPuMN3VgwEn4kiiTjgKDT9gb
         hTbw==
X-Forwarded-Encrypted: i=1; AFNElJ+eSYX0GFpOw/9mIz2gksICj+MO2vRPM7son4kSvSggvAIQQ5aXroRsd9gvODunZ4onhMX/2idLLy0B@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Uk5Lmm/RgpfLCmrOkIPtNRMTy90NYg9zbnEXAHfZa0lJ6flO
	FcJf0SXNWiRowViuDz0KDZ+Xi3OaghxXKjIF+4EglF+UImxUIBKFZ3bACsDUtN6dCridRJnk/SJ
	YJVa0CjcQA9LVUY++Gvi1tDxq0L4XYeEsZ/+p1RCFbc1eJaFmss0okiKCPepXhWbm
X-Gm-Gg: Acq92OGUEOv7Wd9jaUO6BI+FHwUYavbg+e1ZupinOzoeXZIYPKfV8lgF6goR4l3lLg3
	c2m5BPsGh/J5JFouZ/faXPp9dsK16rL4QGSdM4aBaacoOFIRctvJ5J44FHjfFQdhUynn+H13RBD
	4HzUC2KDZKkWNGjrGh4911SzwU5HGx6VCc8nESd77zIULQOVG5hZKOQmOD3EApJVLgdPrkE3jwq
	kT717O3Suj1Ph3vyplDkejkFjLB6IshtyC58xjNz/2Bkz1XHx41X0SX3vsBpWB8CqPIchD3eWM6
	NMl/l4IIXqm1Fi6Bf3ztzj4ZxdSGU6qQ65QOCQU9IhRYnm3DzNro+HeGMLM1U8+7qPYzt1734nJ
	gFof+ZYuHKknU122weXB05/4zB2vSpSsTu8iwtNU8yFyDkjvBiRBvfVOslp6BhpyBJW4=
X-Received: by 2002:a17:90b:570c:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3779c56904cmr1422348a91.2.1781154061268;
        Wed, 10 Jun 2026 22:01:01 -0700 (PDT)
X-Received: by 2002:a17:90b:570c:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3779c56904cmr1422329a91.2.1781154060811;
        Wed, 10 Jun 2026 22:01:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:08 +0530
Subject: [PATCH v2 32/37] arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-32-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=2224;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pTME4mQxfefQUXeCFQz1c35/zCwqiALApnOdQUDq+nQ=;
 b=yO94mPzZEqDXMt/eigSJDv2ayMRZlYv9XVBL1SpHLmOmRAj9PFzjAHCfk2igaAKH7jBqtWRFU
 enRX6F6cj8PAwcglgc46SeYQzWYDhq8r96ikEeYQxOJi3EkF5n9gmvv
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a410e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: K86g44aAJNImxf0s7wKMRJIT5DH73n-Z
X-Proofpoint-GUID: K86g44aAJNImxf0s7wKMRJIT5DH73n-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX4tc/B1lFt0RN
 /+srVJ9ytrFOCxobE75UAKT/Nm+xWBAF8gexPrXLHaUVGf6IOxJ++fga7uWMrHa+uuJH/xbKPeL
 klMmySQHvHptu7rNT1u+ZbDFqfFJDfCLi/r2qf+Ofu5OV0TeYQH/EeSfpwr22MoBMMKefX0shgO
 yRXlOesaL82thSsor/TWAc+encXzJZHZWVdKTHPZ1JF8r21nbaNYoWsKfjaOAC4U86yieyTUxls
 19XZU0y2vszZ0TZqnQa/aIl5Uh9wvMe2tJEY5TbdZSMki2rzNi25f4G1QxA+teRMug7zR6ynxhj
 J0Utd56PNw/rM4Ijm6yEfCjd5E39OcZ9fRXKFFk9H/1A2mioTRPAs4ZVBaNXx0H7FbJjyPNEaye
 zbRYtclHNq3BIeQiGaUSUIqve8jW4hepvXgFM3nLgnZXiagB5Fv/4Li2RTwsx4fkfBTul8g6QNh
 xO1N8VYVTBzxvqRxIDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX7TCYQvBRK4F/
 j4Lrf7RKu+xGkG74cpzc9/1oylvUpgShXpi3N7/uxyHEt7+0rsrG8NdVjka3hvC3beUSl3HoC5z
 5MlIlxRwZcp3JnSce8oA1j7bUBGyRLc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to the existing pcieport0 and newly labeled
pcie1_port0, allowing board-level overrides. Rename perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index acb36aaaf20b..f5f2c2690311 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2031,12 +2031,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 
@@ -2080,6 +2074,10 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 			};
 		};
 
@@ -2196,12 +2194,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 
@@ -2277,7 +2269,7 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2285,6 +2277,10 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 			};
 		};
 

-- 
2.34.1

