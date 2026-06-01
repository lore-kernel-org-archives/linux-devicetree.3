Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2106737E2FB
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318543; cv=none; b=aMi9JDa9Fv5LZJD3DpEH6N0GGZM5aHrJW0GRKsIlS0Hsn4lTfV5n5DdflQ2uf74ivWDIA5cRT+CSDdWBQQJnr0gMRBfkmB8O6luJwW3c+0kElb4eZpkx5of3fUYzRtS68Beij7GbuOddz/ruUfK1MfB13z3c4qbI02O2yvojYkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318543; c=relaxed/simple;
	bh=DQT/zNqQq2aLAulWAmnNWMK9zqPYRi41u9uyToFunqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9m66RgpJ/Pxu/+iQnYxatQk27HdQEHHK2rd1+K+N2/GBm1d1yM4oPXzp1KwzxDGaxdgcinKjwz6l4e8OUSDrkLwVHrnMqYcX0xAPs6VlaqQj9NBYTqkm+uvNYLTb04t3bMZMsFRfEko+mhgz+MqFm/Lw6phUCkAu4kU/+JhRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0lJDomO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkxr8SsZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0lJDomO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gkxr8SsZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518ft0G4066196
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 12:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3241F3HoYz+LUKnQSLUvVf8IiSZldKm42safL2GW/U=; b=e0lJDomOEDodHrJw
	t7KQaeugdQXd842TpC4GgPU6uSAD0U2A/P321HRCMoMLgDiMy4hzBc60feF344dY
	4zBYlTl9eSLjxxSgy7CEGixH4LKbAMP9souvsHipoNUbBceL4KJx2FsU7LBkwwh2
	T5kNg8s1LEQ0jKVZLHtdTG/iRKDAG6WKgwclB4TCkrsbmRZZYZ9k0GB017JulM0q
	icW4xMK2G5y/G3kKYXCoN8BAKJtcI16DeNKOAbO1Ry0HgHGUnK1VJFq5MdvD0cIm
	jVmGHNHXQAWk4r8cS3kaGv6En+euLE70os2IscO+VhAL2yrDDJQnwMXseHFCIoxu
	tD8PPg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sws0g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 12:55:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c1e08848so18325915ad.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318540; x=1780923340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3241F3HoYz+LUKnQSLUvVf8IiSZldKm42safL2GW/U=;
        b=gkxr8SsZHk/i3nZmGYP6cEyXHLnASLsHn58EhZUiwhIcLNF0uD+11ofzvn52Crq8bl
         0tY3xQv6DHRiJ6vb3mbh54S0XJ3mME11UDh+q0SZVaRvQKlQnVJMslbDL1+5Xe3lTDBh
         zRJn22vH8jZB+QXRnmVzu+jrYT4oqWb9DbGquKwBzr3Z3eEKTOk/olElv9VQjkndvIo2
         6U5ofs6agkh1UOoYTFVLQHLG/roSGi/9m0VDoGVwU5Rql7+GzArsdXh5Qp6SiD2rZeNb
         C7LkvFJcKFdtddj4Ku+USadagNsJiCvG3WiFa23gulL+o90IDPAFoUxGgQ2J5Pd29obz
         M7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318540; x=1780923340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F3241F3HoYz+LUKnQSLUvVf8IiSZldKm42safL2GW/U=;
        b=ZmPTuay9ZaO2eAQcNclJoyL33ysOTNbgTPUhBHOBbw//qKivxNyHFrwxOS+RWtv89C
         nZnX8/+komjB3e/i8AfUVHDmlHRlfcxlIbM4+bC3hvW23shz5QVILJ6e6XxmBWcG74Or
         VJ+4W6KQHlRdO6hx8tUv9c8odBTctSSz+zGCUEPNzhWOuLZ+uBxmpLR384YjxICsGpqH
         TIW7yUFI0Nc+CQuYqhcGwPDqbO2Lmdd05dYxU2BQw2638e88E0K639c3yKooLfMC+TVB
         /lruBCfs3rr8oOegrnYZ10+nHdC/wLdptrS+1IFyQ0UBxU/Svd/4j6eZhitvnS+7PhCB
         llEA==
X-Forwarded-Encrypted: i=1; AFNElJ/p+ILY/8diNcaCigv/V//8ofwI+rUTtbZDDW8skeiMIDiSDnXcufMr13j2BOkFzYHxEwmoSQl2vVso@vger.kernel.org
X-Gm-Message-State: AOJu0YxSOu3yxA+YRmAkUfQ+mWuPt0EqDffW3qM6IwUXF/++nidwlPi2
	PJ92sXw13R5MAlFgWNFiPnXW/QHMmgiEdOzLHUAu2pXoEAoM9Tyjdt3xco3SDYuvcvTreNewNNI
	vS45sNE22Otn0d4nria0B6jKTQbtt8Qfk0alzwbg5mH67EJTQoijlSj1Q3QsOY3Bb
X-Gm-Gg: Acq92OED+/rPKA74sUOc7s0V2Px3PK7pGDVP8yj6ZSDY/tmMOf2bXDeYcRWVtoPZqxA
	XkNESX/94JnJ9opQPDStv78Lc+daZPEodIWxphSjH7HAA2BXZImNxsxcsYH0WGqAQ3y4J2Qb9/5
	paQSAW/5n74pE0X1cX3VqseW3qi7sF4vzyR80/Z10xO2NgeHkED5OQlXCyOYoJGFhg54KdEaF3n
	FmL5EBcqiO0aqEakSOlgynKaSk8u86kkOZrD0LZ+0Vsyt3T/YSM4f0ZprnKqrc8Cx4xdBNi9tlN
	MqnMwoyUIwfkzj9neBDICA6EQ3eU+kYH3UWgPXQdMHubd5MBDJZ43ARtuvrCRD7tBWlnZqN5sAh
	9iz/rLYzim2ZhLni/+0eUN64KYLsN6URYo/8C52hpEs9h0ow=
X-Received: by 2002:a17:902:e5c2:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2bf36845817mr120232535ad.26.1780318539912;
        Mon, 01 Jun 2026 05:55:39 -0700 (PDT)
X-Received: by 2002:a17:902:e5c2:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2bf36845817mr120232215ad.26.1780318539437;
        Mon, 01 Jun 2026 05:55:39 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm98584135ad.34.2026.06.01.05.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:55:39 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 18:25:06 +0530
Subject: [PATCH v3 04/10] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dt-m1-v3-4-0fe3f8d9ec48@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780318512; l=1830;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=7ByKGzzDTD14i4DIQy9VognEH4x590vwDySV2Co3gPA=;
 b=hQcsrUaYE+lPYPhOENh5Mi9JLSVf59u/lz7MVOJSNTwwHFicYTins8Kdat+EOHLFrfY8liQUv
 e0MKC4c9uINCxtAZCyWsdiX39igkyzGbCOvjRclTEjDs/x/CQoTBiMI
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a1d814c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Omf8RZotDA2PWuJ7YI0tQ2g-UEw3vq2v
X-Proofpoint-ORIG-GUID: Omf8RZotDA2PWuJ7YI0tQ2g-UEw3vq2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyOSBTYWx0ZWRfX0/8J//A9DtNE
 w/lQtwHqzlX+6KQBNFk+x3VcgXWBiYmFngc8aEEFMbMSIywkqPIFasQfbZ5l8EYNMwNNy2IPNiP
 NpzaYvg+E5Jg4bcdI9WDvIh5wz6dAmZLcgkqPZ3Sp/Bn4aXCn3oQEo9FxN73JSFZrHUe/28EEsd
 uoN3XnsYpgkkikkjnhU5ndeo9lEtqFTZ767luntDRXwXtzMu5Xozkc7oJDouN4QTj64TIrRT9TK
 3YJiBg3y66+y4ChrH84xLLVs4xzhH0bIPdBSSauD519sTzN89hcDrOL98I5oT/0k3YcR8Q5EcxL
 pT3ltHonqfG8XWskjlKB/0bepJOv7KSMkff6nS1eSiup+Uy9bMsyI88cNmNI0D3TGj410YviwAS
 tIg3jXuglHMeqU5zjnpn2zlA9/UxBqEJu0xoZLLE1YdFQRvhr6YNPErvp1G8yY7CrKbiUhI2QD4
 c5SWXrk43TzJf8ko8eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010129

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
Shikra SoC. This is necessary to enable power management and optimize
system performance from the perspective of dynamically changing DDR
frequencies.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e6ec07a865f0..ec1bfebed226 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -661,6 +661,46 @@ rclk-pins {
 			};
 		};
 
+		pmu@c91000 {
+			compatible = "qcom,shikra-cpu-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x00c91000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <1200000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <3072000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <4068000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6220000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7216000>;
+				};
+			};
+		};
+
 		mem_noc: interconnect@d00000 {
 			compatible = "qcom,shikra-mem-noc-core";
 			reg = <0x0 0x00d00000 0x0 0x43080>;

-- 
2.34.1

