Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E05539E9C5
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591394; cv=none; b=FgP1wdUHJT0dtOnUR2msvK0bQT+b9yhD9C/zeazU3HEUu8hAE2lQ7IlHSoV8HFt3s/q3oIvMgYZ0I5r82jvY/LM/2rkNZV3U4EPfk3BgBSIkIUqAzXA4yEERguCQ1S5e85Eutv7CtGBhFqr1DqsfY6J8OGi8DtEuvmWQM0+5LT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591394; c=relaxed/simple;
	bh=isfBhfEp6QevbEHukDTBoydJGn4P48zEXe+HfbEpA30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c29xVRRB2Fp0mCuwXu9tZkzxX4rqnMFoRgWHtMruhp8VlGV4iAfcEOJ1g57UWfxHRZocNoKwBpZ0DkeQsyfJhLjxYHLtueZ1zbdzP8vAk65dVW3Fo/zmcbiAJonFfO6ZgAc7iQpZ9BozmIlNh6/sT4wfHVLes90Q5N34n3xfn0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVGrs6O4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ffwz6iqR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVGrs6O4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ffwz6iqR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAx7aL3443796
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=; b=lVGrs6O4rdM4yME8
	B6CpdE7cQP0Qdyc6Hs03HXCdPYouaAkK2PZqDsMY4B3qmzVkiLEj11zHbpGSf/cO
	t96uM/48YxP/mSNzL1mipRwLySLzUl7NUC4yt25uSFf8HuAc4U+NvQb+XDPeC8tS
	5bZt6W2q/V++QmGjyF2i3V8/j0hs5V0F62JNICW8UJchZtC0o86CSeVqvrgLDsRs
	0l1D6IxvN8CC3vrkLwRof7n6q5eofuNJKqk4qX9jLnwVc6XsLQcn58CRqwVPeOdG
	4OZX6MBLA2l1NvQtNgcj78mkwImmyA7uJ7z9QwsTww+MDEaHAQvUiqlPtsGO9bXY
	0QDY2Q==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0kc9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:51 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6947f168159so11317772eaf.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591391; x=1779196191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=;
        b=Ffwz6iqRUYwHyG6bs78QT/sU2tlDQ8F6QzOOuJ1Xp8aQJMV1MofIhhODgOBA1/+oxS
         i/YwvwJ9SnHAC+SFcWGn74PraSc4TpG4NdKYKRyEVPQ54YRWKdOGThd0+dbELL7GHZsO
         eVYDOWbXoul9FrAcYEdmZ07wzfabVgXFIyiJE6rgOl7gjJlRbhZzEhJHNo+I5IyznvUj
         Uu4M3e4NhrQSzLT1w2KYmRlmPBiDQVNtg5wEv95be8Nr5h4ZPF9KgFEWHSqFxXl8jaKn
         c8O9H9PEFnn69+xk7T44+YNR06ZZZXbBzaleEipPU2Uxl+dxdvEcACsSv7c0BKlQ/09U
         5A9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591391; x=1779196191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=;
        b=Zog9Qe8onuS5NcsRAQ9rDBMZHZ19xAiSwZQgtqbjVvTvfunmQI44oNVWLTopCXgi8d
         9XYePCn/VXsplewr9VGSb1vBkeUeuB2aGcahpbhTgVMDXN3KL71MZBPvyzVOluwSlO6A
         hVYt18vCxPlSmQ4c0XW+lczBG6Qr2G3YVCdsGz5T8V/7OsMn1AFfifoLkHmWeWqYDjzq
         Hjt2ZqvzoLqClCro6Mk7skO8RpyA50VOA+KmpY8tm27NGvbH7btlZQReuvRSr7niNh/X
         jHKKXYMFrWqYv+OGQ8ucKEwelMVpSqL2UFpUcq7B1tVhUUhfKVxIx/fgLYkHHMw5Ik6p
         tCXw==
X-Forwarded-Encrypted: i=1; AFNElJ+4O9VOflRYNL89E5noaZ8dCu17TFRPUowuTL5QJuGDvJWp+B2ye9ZcSLJFK7XA22DNOcC029NClVdu@vger.kernel.org
X-Gm-Message-State: AOJu0YxXR21K0qfb07HcpSJRM861WBSarG1lC1oH7bzORLmOcb0/tihR
	f2DIQx8SD/2QzdFhusLIvjlnSmTLo9OdBXGMIDhR9jXwke3E9mxJ4DN24meuGBuZMM3woK3vG94
	LH49wOq2HFHg+uQGkUNnckvw2fqCsn36FdL7UM7VQz05ppa8UPFbXOV8DivFpIVdeV9gEVr3Z
X-Gm-Gg: Acq92OH81uPsQjdbasmj4fQr9WDEtWY4tPVqH3+xMzRdhxRsGWv0NAAQ5wfHenRacgE
	4leKfzpA8Odc7KxOZQYIIfTNz5xwDLUMr/YnHNdjBdVE4jd5p4Kq1plqOZt2UWJdA6igbnIQ6az
	OaidGUCcsyHW9avG6lLIBpJeotPebvIoichoKh759+rHQ5s3e+IECOcXQwyheEVOoueB5Z7dizD
	X8DCWTXRPTpD1ApPAcGJkV2i7Vl0OODoXiHQTlPJYXbEfnjKGhPzxtavi+Tui2PPoDFvUO+n/sm
	hffwkddE6U7Z+xutpWoU2/QW3teEFtQfYZddWkhSiMhIoVYSXAGeHVnMgzrQetC3eerB3XSsikq
	A5mwlndoMSKf5cBS5v8/laFXk8fVG8UxvMD7mE8U1nIVE8gXHT+lELzZOpdihMTgAABktXQsbkq
	sQUG2edlTGKXGFYUtCN+UGivQgUZZ3c+DOa0M=
X-Received: by 2002:a05:6820:c3d5:b0:69b:408a:4b18 with SMTP id 006d021491bc7-69b408a4c0dmr3959827eaf.9.1778591390695;
        Tue, 12 May 2026 06:09:50 -0700 (PDT)
X-Received: by 2002:a05:6820:c3d5:b0:69b:408a:4b18 with SMTP id 006d021491bc7-69b408a4c0dmr3959808eaf.9.1778591390223;
        Tue, 12 May 2026 06:09:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:33 +0300
Subject: [PATCH v5 5/6] arm64: dts: qcom: sm8350: add Iris device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-5-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3708;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=isfBhfEp6QevbEHukDTBoydJGn4P48zEXe+HfbEpA30=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaUayUy1Na6mfYm5/iVNPmuO8uXfmqK1ZKT7
 cVMDLdw/lqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmlAAKCRCLPIo+Aiko
 1Q1xB/98DVfGo6ZOcaw63yO7drvd6cmWIIa9mfyYREkAWufG/HFa6eh07Oq5Ccbi39wY310UMx5
 5j1WX5EncTnUq/EaLd2/1zNoK+ynpuNa9vudLbxS6u7mO0UFnbNQdx7NuvBxvRsfJG4wMSVDBtn
 zbbhtqd6inUDzq9HzFYW1u/ndmBCm8Cass2SZrXNgPzryuiReZ8dOXevwSx52c/70cFBpq3Pt0v
 ykfVnaRciMZPS8k1DVMZkGOUn8YMIWM8pMl1rysitr9t37Q+3n4ZUdVqJ8tOrQodYhnJSQ/V1V8
 3rMr+ZyK2ZXM1DXqb73r/tZMU5I02ZhJjmmSOBHQHu2CiR4r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a03269f cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zXEy-fkF16KV5FEPuqEA:9 a=kSuwpvhy9FmzT4U0:21 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: HbiEr9ryQ7wMozBfMUIkur2BIWCi1cvW
X-Proofpoint-ORIG-GUID: HbiEr9ryQ7wMozBfMUIkur2BIWCi1cvW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX1hm3Czr57kFe
 m81io6Mfbz2QOuArgeVd+adEDd82rNtPGGjHcOTdORrUgOkDx34ADnE1CfhYhVhodB3MKwF0LpS
 zvFLq21GU7ibbGkko3MuamzXLdpYFhSt1C3NiLnQY5LuFVdkDM8FJYGcPybFIyXgYNh8ai7Xokk
 Y1IT3eKUkjP6X+fAAo1gOYpMetmdNuMF8j14cT7ILj+EY6jllMinx92hPLiq3mNdTSLQiuN8j+/
 uNTiwxjEq5ZH7d+XxWVivUrcWQ2Ymy4mFAxbgPfkX7D8Q8otsViKeKhhFS9BQNSWKmVcBV2dcQf
 rXWSHiJpHAdyJK/pJlf3Gj8vtu0crTPR4dCbYb1Les+Zk5jn9SdkSD21cn2dtWfPyhZk7pk5Uh0
 lD+eFUSl3s2mMWly8rKh0s2tPaSbvEUXhckdRRGgU7kvpGFlpObDwYzuzTH1y9NqkOWrjMrR8Ba
 p7yu/bB8mSzDO7sEgng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136

Add Iris and video clock controller devices, describing the Iris2 core
present on this platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..2148a140f162 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -19,6 +20,7 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -2747,6 +2749,85 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sm8350-iris", "qcom,sm8250-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus", "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&iris_opp_table>;
+			iommus = <&apps_smmu 0x2100 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sm8350-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8350-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.47.3

