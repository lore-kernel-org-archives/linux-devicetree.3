Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A5D4B66EA
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862165; cv=none; b=CwQsB3yDyEPIr+i0wEP43xep3RTgEV3MaZarRHx9MJbc+J7SNLvc5K1cX2NyhPpLdRUuADPY4xdOF0Jjt7D1BRwYcgOdXMZfFROifZZtyfv75BKMyM/+3vyZAol7yg6m8PXcd9v/27/1CcPiHur93SoBhQFZecqyxCdcWwc4Mmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862165; c=relaxed/simple;
	bh=C/fpMGINKsMmABBVFoNhv/IhMHRGM5vtAbgsZlLdGIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4r5zHfhKz9OpctMp6ME7jy+09K8aMpzcJdqpOsPBIJrjugD/dkq4OjwE3m1OTBQ7XaqNz9PUaZaKlyNwubXpVHL/F64x3WR2R6nbHMiaiMf/oI/v/bkt+/s2GQxXsOkuzm6W7V/SJeowxBWdhNhVLFIdU5rT7E/4nPAEFDCxNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArZDygJM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUbpgjaK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArZDygJM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUbpgjaK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CM5aN1661232
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 13:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYoTp0uQd0TNgYhrOfpmraHIltoseMpztokrD0lMoa8=; b=ArZDygJMZD3ZyY6z
	Z+M7W7S4VCZOnWDWuKuKBNXRPUdlfZHh0ofzf22O2WZTspbutqOjmEGsTki2OYeO
	KT8Jhlm2aAiQiYDNCRI1jQH3i1l9VYDaBKsJHOhZtA3vCpBNbyG1OSq+S7u2mBob
	mlhHV/dGWXJmhs1HisL4MSM9fJCogwuxWB340BbttpxmMxij7VhGUM/MXpQ6+29b
	MymhgUvnJRqsYdRimjFnW99PCwDCMCP0edzumDg0p+OCpGMGk3lgmfY0HwXHh8ka
	yYuSSJTn6VBXrs4mcGKQi8b9uVpLPZvZ+ooH5XRY1X6UBn0ZsyRFxIPW5H2/tic9
	Fc4tJQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pmys4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 13:42:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1466ab2bc8dso8586953c88.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862152; x=1791466952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYoTp0uQd0TNgYhrOfpmraHIltoseMpztokrD0lMoa8=;
        b=cUbpgjaKrMm15eCto2ssBOF7eDa06jnRWjZkFnWE0AehqlcpjL0inMM6MbiTMocFp0
         krGjimn7SxYAk3pjNV+Kwsic2iOZETCubIvVDTL1nl2cQIqFGOLXR0hafsXSZP2LqLR0
         gH7zpLd2BmbHWqaML2Evwz1Cidlle54nio/R7qXAbzPzS/H2yjYeUASuQqKWfQET3FDi
         5a1T+4eng4oh1Yz6jIKD7cIwqwWP6Hu6VCnlg/BQfyBv3fJMyhE2CU7afgpAM28kcPpZ
         bdho0ovaNWDFyJZJeicLR4fvZbg9R3AILbgXI6KV6Nfk4k1bdZ0V8D/aG1mfacosup+n
         WUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862152; x=1791466952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYoTp0uQd0TNgYhrOfpmraHIltoseMpztokrD0lMoa8=;
        b=sA3737Re8dPuY7XE+4Vk+LGUE4PRYYmehdzN7xMLCbSlMd+daLD7A/kFAh8FTWJjFQ
         tV2ktKn9ZTwm/IsX91oaptb+O+dw6As4ZBnRNlVEhpoZVGjf4YiCFj2m51B11vSWawV0
         6NL7bZG/juBbvK9NpiQS3gaLNNAkzMziqVgvnZ4vPuMUlspMFrBYkpF55rpxG6wTvKBZ
         fy4DP8lkDFyKdU7xtvENtFMjWMHQq2uxetpQqaOfBGBw9/lGJFZqAIzj9EvSeYAsnVr4
         PxkE7AjB53ZFnHiSuIwDHcQCDyWO0uF/f3BF2D1/1n0alLwMoPYc9imm8+EB/gXuAqif
         /WJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfdv1oG4StnQ6qazRR8Bsgag5AU8L4rJSQrVsR/qqn6w+RayVD9I+Pn0UdCPbEA7R6XVYI5L5Ndj07@vger.kernel.org
X-Gm-Message-State: AFuF++kwccGdL1m5f7+1U3FeG22TkKLZ1iTGn9kd985GO1sjVEC8MdCY
	u2neuc+x4WaZEvnF2Lm7QRf8DEBLOyf08MkhIeCLX5AUUpDbIt8EExsiTZVrsN8yi5aAoN0UmZ8
	iqVaH4GQvkFIYkQ7xzRSedTwiR+SfHr6gsqgc4FomDhe5iv7yXZCS6cQOGicV9gSa
X-Gm-Gg: AYBFou32bTYmR1rwICx2wK1wXA4urOy1U7WtW3tGZ1h4iE4P3mOgbwTJeMZ+GngWMcU
	gkhZsLzybOQDFm121QgQn7lPvJfK8ItitxUJXZ1asUWaITlVeCHuQqMaLKuhVMsYSaONV2u1bkF
	L9zJAIgTMt1WgvLzrPfZ2Uw7ggurMIauAcvtcg3Dsh8IQiyiA7uwWPX0Z6GS9Z0jDvIBPJcczEf
	WT0JLwn3Vd2QyQqYi0Z/JBp1QWO5ZtjCOAuzQpVG8MiI0bG78SkRDTF1X9f162lFjc+vq6J6x6n
	qcOcetL+42uhl+Ey5bbH91SHfxVL3zTtcgao4bepIHZS5Fw74W7ZjnDm0CMiqrs6mIZHfu1XCwO
	7LXJ8epn+BQ6TmulybyWJ1m52dNjbNy0HbgA=
X-Received: by 2002:a05:7022:e1b:b0:14e:906f:9c8e with SMTP id a92af1059eb24-14e906f9dc4mr1998948c88.20.1790862149893;
        Thu, 01 Oct 2026 06:42:29 -0700 (PDT)
X-Received: by 2002:a05:7022:e1b:b0:14e:906f:9c8e with SMTP id a92af1059eb24-14e906f9dc4mr1998727c88.20.1790862148313;
        Thu, 01 Oct 2026 06:42:28 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df34a8385sm6668906c88.6.2026.10.01.06.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:42:27 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 19:11:56 +0530
Subject: [PATCH v6 1/2] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-shikra_vpu-v6-1-37143dc1bb9d@oss.qualcomm.com>
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
In-Reply-To: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790862135; l=2930;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=C/fpMGINKsMmABBVFoNhv/IhMHRGM5vtAbgsZlLdGIQ=;
 b=CyX2cswe9Cdx3+85nooxB7wSD0ZYpHclUz/RiPzctuUdj6WVUiXnpJaLHbKBZxoctaJqAmO+m
 L5x/PXtJ4uxCUiPpl/yb5rtxuHy1vpPP/pYi1l24BvDo72oxiRdiamz
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: DC21COEDQE1CxIdvIkzjeI73KbCU92a9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX77nFgXFzgKvJ
 oMEgPs9PGFhZ2V/K9M7OfEbjSOOENi6izLo/sN/QA/1aFGJ7sYw4W/uqsxXVK5sbQuSj08VGCix
 2RlFJyHurVAHjfTVl5DAk18VNp5FR7A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX/JzKL2p0scaZ
 XcumqeJr0wbyL1RyYgzwiCrGEMpsrP0NALudr2BEr2+IrIn+bj/tP+A6RUhm6c0WgZ8EuoT2ubi
 6rcxgAjKsiaFfcmv1WuqXfSz2oQ1UIgsP8LYPGpz0z4q2D3G70fmkqfthlvLdR9es+lRFbHh8Zv
 iPDnBbUGnzMVZ4ELuwtYGabAH4jM7KOL1kXM/mUMYbEFnSAPUbyLsC5DKiGS8CPcIzzepH+A40S
 /4gtlXiKVxTlg7ea1p8cA0AWtKNjzb+33yxIKeX0iSzSMfiOT46AkmPfdAYReVGhI83h7LWAY5k
 Q1klxE3Vo8RKW74qj5W7po/7CIddmms+00YS/kL+/l9utLYL5TL1U4xND0rYqkc9DIWAg7s92Y1
 Z0NXRa7loVxbBk7BNc38OsL2Nk6Iab80oXBpYKOAKy5vcc9bRGWvNS5yM1xDLPhFzSADHnxvSPU
 RgIKYYjrXxroYYwKczQ==
X-Proofpoint-GUID: DC21COEDQE1CxIdvIkzjeI73KbCU92a9
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe6349 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ri4dh-MVe8xHpjP2HccA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010053

Add the Iris video codec device tree node for the Shikra platform.

Shikra reuses the QCM2290-class video hardware and programming model.
The video node is added to describe the Iris based video decoder
encoder block, allowing the media driver to probe and initialize
the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 9823c591b02b1905619be06483f0a0a4ce7d10a9..d2e4db4025dccef21fc39a042785c7e7f4475958 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2809,6 +2809,67 @@ adreno_smmu: iommu@59a0000 {
 			power-domains = <&gpucc GPU_CX_GDSC>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
+			reg = <0x0 0x05a00000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&video_mem>;
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0x780 0x20>;
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1

