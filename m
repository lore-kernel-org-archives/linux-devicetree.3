Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B1135CB66
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718590; cv=none; b=cUT28G8I7HmaGykT6B82gPu3ELd+2M+hH9r4Rnv+QutbGEh2CZ7GN0+jlX+xD8K6N+pJ+ySSxfHT4nPZAEsnXDRHCwfBYYwypyASZJCpPG5gEcwwY2Voof9+O4saxZsnfYCmOKwg4AxloBtJIElKN8ehiNCrVlSKlO151rmPBQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718590; c=relaxed/simple;
	bh=KduUOH5T9zYNaEkE/nsatQgUrv9nJltvgQhA+2jmxok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJ4JXjsldE2O18dQs5Yy63q+qwtpvLPAIeolD6ElTwXIIFbUfVUcgyE2j454EzPA3mLKh1CH3Y3AwzOwJIKztHlp6co2IkokIKPToQDiMJiedeMRM7ynp/PaUrDUOabn1/NVTHu6sSnLjvRzn8ECuNEon2AYSRWRuvuB/F9m+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQFtxksp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMFz03gl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQFtxksp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMFz03gl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rWcH2151883
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPwTaRyfKuZR6KfUFFjBnF4+NUecOQtXCIM2vUB7JVo=; b=UQFtxksp1UkCHC/I
	ro16XbVYsZRhyq3fSunKqUqvCsgCTv9+IpOwZxv+nhkvW6aMVpfl2U423DqnDgz/
	ZyzqfZ5+wxxlf8L+bLCIyftwt0tYL0G0TV803zO9BxIxXPsdsHTGa62nFIPsLETo
	75K/vrCXYMcR5etZBPhJh++cw9yz5R3mrYXfXin6YMjE7oYsqygTK4JR2CL1fRa7
	/r1rzUIoKzqDqffdHFMHvVXhSyVGI9b2gQkyOdFJrJCUvoTa9TDi+PhDEB2eMS0/
	3lyGdV0ugYaYfb2le1vrCM8uXgWYxY2+hfwTG6iTJrNn3oBE+FH0VG5Q/SITIMeQ
	iaDMkA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuwb8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:36:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e16f658abso1594765a91.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782718580; x=1783323380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPwTaRyfKuZR6KfUFFjBnF4+NUecOQtXCIM2vUB7JVo=;
        b=IMFz03glEgbCrHa8EmbCp6FM7ssZRZT2YsLG99x5rFWSp+6uoc/YdKWKoWnuJ9mCwg
         DKcX6jabyADDY1NUgxooFwjTphFXieQ+zjiUVJs3gYTAb7aDX7gXMMJ6xSvURZz55pWO
         Bfylmcd5IMQ8CU/oOOoqH/S6F3cBAsIyFFDCDDkyIsjiRDU4Lw4YODzB0fRg+Ufwyu5H
         nvUEf+0T9tIVcYwDG6h8ULZgzQ+tXO0gpP0QMeSpBWl+eNTOQM6re+Yo08rl3ObCYiDv
         KJ9rjBIwqVLSM34FdTk/eFOCliVg+GJfm3h3CSymt7WXNMlfkQ8PIkzIC6CiBVX+s/4m
         oRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718580; x=1783323380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gPwTaRyfKuZR6KfUFFjBnF4+NUecOQtXCIM2vUB7JVo=;
        b=WSa9XLKVUyVjqt2huAxDA91iCX2+9mj/ENkG++TEYjsEVcSm7Gk0Y/w87WJ9h7jsVc
         e54o6uUHIoaZrg2wZ1xfYv2Lwh/R7RhkqJOjY3lqhdpgW/NXMLF6vCtH0WQYJNbG/gO0
         QJ4u1Pj1msdacRfrBTlaGo2lOnK6UvvVyedTOkrCCIsA8zAgerhhUmYUIqwUDSmFjHhy
         6rxk1WC30tTb1KvHD2Ed71tpsiPZBGiW1h8//jDSGdV5XwylGlsIJoPT0iFCy63jyVaP
         r73v+5Xzmtsk9tEpwftiGhZ3MtUvTq1vL41ac9J0iGwn7y7xFrFiy3YtOiMvU0Ss0pru
         BnmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrizINm++tkXT5I4q3ZcJqKN2ThNNwYxouzmoUcPqofeftIITiuIgfY9xp1ixhxzlpLoiW+thW2s1ge@vger.kernel.org
X-Gm-Message-State: AOJu0YyfVPitmH406cL52230D69VenQuNVClBJvDf6h0xnsHyDW49WAQ
	1dEeudSOlac5aWodUnJKuPxOy4oi7gG7nnxgNWHpxrTu+VpnIW6NXU1nHakbbLSXtDV0U1slwNz
	7KPEQTbVCqs8H3GOzmSmzpaZW2Pe1R+VIviEMP1GtZTREMwBUtr1Ch1qxiX9a5b7P
X-Gm-Gg: AfdE7ckMpEzDPFHhzEEbZFEHh8J45EFmDZrxIKtve6WLx8Ll4eQ7uSxo7e5Pc2xR6iV
	MSBnbMnHvvB80uF+32Jbu+DXnwOA99vOJf9ElZYhV7f+a3Rt5jnXT1HLsz89rnyimiloKWFNIqm
	VXHLn+jwM08BVa0+/6ijOUNZzkAsN2piw0fPR5O91dL1G1KCBFuZe+j9d/XHgTVcjhv4Q1iVeda
	7Cmemn6NUyDutYh+eBhS6D4nPnfMkC2Mz10YN35zOeZKgj1zIsIH+kfmemv5JotSoMd8DODRE47
	kDA/RpWm7aPLdKEbQhPc4E6JAOFiKSx9t7UGISELsaPAoQCBPAhaP5367BdIGPKjwasOymUoDm3
	RVRpGNdQFVzyZ6zO+Jbu5tHBk4yh8HeJmrNz3VPfh/VKR
X-Received: by 2002:a17:90b:3bd0:b0:37f:c239:10f5 with SMTP id 98e67ed59e1d1-37fc2392925mr5471922a91.12.1782718580029;
        Mon, 29 Jun 2026 00:36:20 -0700 (PDT)
X-Received: by 2002:a17:90b:3bd0:b0:37f:c239:10f5 with SMTP id 98e67ed59e1d1-37fc2392925mr5471903a91.12.1782718579547;
        Mon, 29 Jun 2026 00:36:19 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fa9629f8fsm4537979a91.8.2026.06.29.00.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:36:19 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:05:33 +0530
Subject: [PATCH v8 3/3] arm64: dts: qcom: monaco: enable inline crypto
 engine for SDHC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ice_emmc_support-v8-3-1a26e1717b85@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
In-Reply-To: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfX28SNoRK74/Cd
 XgvQkKSFgsgIowCkoYIai0AooTFqPb4jTYBn66U7Cuz5qzcBA0uNGmZlVNOUqjonXdrl3K6bUjs
 /QzGJHMttHPUNULzjM/H3OBLA+6/Ut0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfX/AvoI40b400F
 mCJDiezZNGrQyv1PW+KzLKeS9zTx6Qqi94nN8JnJZdEqSZk09lzVmhnlu5h48DPGvNxJkGGd8ZR
 pa+SlV8ZisZifOD8SOzwjyipU1ZmBujA13o4nl2UtmXvSxNIAplXqmQDKBLMdHjjmoOd3DvKPSi
 XqWnWOGpddrBZ+WGhKlDOY5ANK9bsEG3P9NfGwgqKRDGaPFLCFp1n6A44PHPKnN1p9OfBN+4AON
 ltcdwGrShwKpH/gI52rERf8Dkcvu9ZO0N+bdMIWf9gFbDaJgVW+u8PH0mXGTjT05DTDRyZ6IjFM
 Hh0DqAqzFwzTl/YVAUvltDZM6iub6l5GF9Xl5aCr6/zO66r/rRhyhWD91mXTj1nj+Jjwve29TAr
 a1MVVeLefVydCPHj7y+C8EBt0bmFjIewiwgyovTHfaibV3hrW3meiUuIfAF07iagP7PU0vJdyQ5
 Xp6nMqBQ9VqZDDdBdXw==
X-Proofpoint-GUID: QUTIN-hbSQbpFCT886rYvoEYpbIL4zil
X-Proofpoint-ORIG-GUID: QUTIN-hbSQbpFCT886rYvoEYpbIL4zil
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a422075 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1TJM2g-zu_yJeCZsWRQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290061

From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Add the dedicated ICE node for monaco and reference it from the SDHC
controller via qcom,ice.

Keep the ICE node disabled by default in monaco.dtsi and enable it in
board DTS files where the corresponding SDHC node is enabled.

Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Co-developed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts        |  4 ++++
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi |  4 ++++
 arch/arm64/boot/dts/qcom/monaco.dtsi           | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts      |  4 ++++
 4 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..2c7d6ebc54fa 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -705,6 +705,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 &serdes0 {
 	phy-supply = <&vreg_l4a>;
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 9b5ed55939b8..62c6f45025c1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -282,6 +282,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 /* Ethernet/SGMII */
 &serdes0 {
 	phy-supply = <&vreg_l5a>;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..71f4bb164ec3 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4835,6 +4835,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			supports-cqe;
 			dma-coherent;
 
+			qcom,ice = <&sdhc_ice>;
+
 			mmc-ddr-1_8v;
 			mmc-hs200-1_8v;
 			mmc-hs400-1_8v;
@@ -4867,6 +4869,18 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@87c8000 {
+			compatible = "qcom,qcs8300-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x087c8000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			status = "disabled";
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..58c4a328bd3d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -726,6 +726,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 &tlmm {
 	bt_en_state: bt-en-state {
 		pins = "gpio55";

-- 
2.34.1

