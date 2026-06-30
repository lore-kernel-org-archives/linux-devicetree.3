Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B59E3D7D8D
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838643; cv=none; b=dKI1cPy6IeoeBoQcu48oeL2qrdPw3ONfR2GiCdSG/3Xci2t/p1DwmP1dqvU5l5ktL6DNE3wSitArKAA3k+/xNF5L9X7Unt3KYjq1zkU5jypKGVdzOmtsOligB+Y5OEOeJcZ9gwZmY8IXPPpgIBdbkRX3KAHULptHjkCoyVmZ0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838643; c=relaxed/simple;
	bh=7dZnfERlDQb7BhudKK2Sq6SR1qLriZjh5wi8+K13iEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mOZNZ6PMJJy8pVqoV9sEmr2aJ/9/D0Hujze0BtoTp3/F3yZuZAjZtqI4VXtrtVB3RTqjtrI0PeW/sbk9a9V2bODCSgr4eRIDL6dMRUrZHjwJPDqMCZt9j9tOYIPc8vd8VcAv2ZE5nuVmo9hQPRtplr170ZLdVDy0KeRNjo5cZ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3fGs32G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0gRl0wQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3fGs32G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0gRl0wQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDFxW2185862
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=StVoceAKTdq
	K+qw8Y2JzYWOdg/02lGruQodIjHI1xpo=; b=E3fGs32G4FiVGENax5vkCZA70nd
	daTpi7K4rcA1biUAKGRI5Zv46UQbwidc6WefUQ57r2kqOVcSE6V9sKK0TrZV+aCC
	qYgPsjBe21ir3msx/aX0e1vy+apo6TjxROHF3Iy/s180DVaKPupRBGxoGKvPOCyO
	0xTansJL8Z/tzpMW5SAKUk64I+h+qGfkiFXoEla/f23LoOrKIp22wMH4f3H0oT1J
	uz6fJQA9oUbyixiflWpknvgugRTdfRY+f8ALdetkzam75Tv6ljH+yjKpdyEDWQtv
	1XLXnbvXcxi6mLBnlK8D4UnlZS4YHcoaYrKwAs2iIkm+TM0es7ec7XjtSng==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46863d0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:57:21 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso8038190c88.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782838640; x=1783443440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StVoceAKTdqK+qw8Y2JzYWOdg/02lGruQodIjHI1xpo=;
        b=Y0gRl0wQQma9fpeLyMPD9AfHVzu7ALpKgWql4v9zi8p4qe3VHWU/Rv1ykwvEd7sjWl
         wff12isFt9xYzkkE7pqbnOd1ExuqG61ES74Vj895VgCJCf2DhHuddgIW6uV5kak6FUdt
         /6F6t31/raAxTN9csQesHSmnLKTprfF/xNcZannytgYEcHqlnu+1IgrHsxdfzEVv4Tue
         9YwP6n77/vNlMNfjDcfT2jNPc1uQ/kRjKfM8UClbJK4LboM+VYfKMLA8JsTgv/XgehIS
         ZycRFw4SqM3p3uwYFnhudG9VQMeRK5GQTEGAF+QoSYPLRF5l88XMzGAoQzSnYLvsaypJ
         ETVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782838640; x=1783443440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StVoceAKTdqK+qw8Y2JzYWOdg/02lGruQodIjHI1xpo=;
        b=NcUe/ieCI+XoWxv43Ih559lskv0gQvORVtsMj+JFxMdDA2/dd1mleMhCawtydQu8lu
         kvc9HEKbjiagy4NdNfHg5kynKNHJrpTAMnKoTP9kPuEXzeIepJ1dEZvJceRYJ7AJM2wc
         I9Ku/tz0Iqf7NkgLWy+pI9PQBq05bOmatVO+u1fWusHr/wjErRuQVpJQSESnQfjZqMN5
         I1Rg3aY1uou0smsaBPrpBbW5x90w/Dw5ozNAUO+FzHumfefJDS/7YMDpkZz0f6nTpQJG
         XcOPiNJ/tQDpr1BPVV637sQIShNS1Ywr65zoyp0xZvzr9A8vr3oXKD3OEhVS5Lmp8gu1
         QfnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tNZdghq1OIMc34usIFF04mwbjUW7DGyUKTyzBT53EOOUPo95T2MY7afIlUan9rsxTdsMLWcol2UhV@vger.kernel.org
X-Gm-Message-State: AOJu0YxT93G+wRf0Nl8358KjCarw68EbRUFuCxn85213vuT+OCkSODa6
	iuF2kG4KIhrcQs2QUHugKYGnzcsHhTy985o0oKKZ0fgK47Txk7SvPGY80KA6fnQa7IB85pkp5Je
	WsCMn6nmIouykdMDugxDqKKN7MIj3xiEcqZ2SqSN2ObKRdUE4eePINnYUnfKo5TUu
X-Gm-Gg: AfdE7clK777W08e7KVM41mDXFjL+nzlBveZ0wTZwSgemwmDM+MVW0gIWzhW7hpCzJ+Q
	juw943LoGr21/Ks+bXV4TpTEVBQ3yt1uH/keRigMGRLjTKOmNRcvXT64t/C1diE0rxOUMnMkinj
	vNP0+w+Hp9wYFwTxZq1vAk6Dpqvcfy2VTQRvlf8bCJq+BV5b4EUs1aoMV3yNYuzdLwSl3JhGzmO
	AXkcS8PmOVddtb6UYeNb/s+0WsQdwLeYj5dD0Vm/Zjpwl8HJqNCyMjLrva4X+ii0I6Xbn1Mpfvd
	hEoAbQ/ZZiRWTAsY96dy9m3WINIAzDTiVag3xCbl0UcDkIqNut57xuaXLiWvfu4Fp0/DA8DR934
	rnedFhfcc5TIwO9i7XNZv6Rx81Jti9+TvmfnjRwPhP6GcZQ==
X-Received: by 2002:a05:7022:672a:b0:138:6ef:45c6 with SMTP id a92af1059eb24-13b2a1572d6mr2901690c88.11.1782838640099;
        Tue, 30 Jun 2026 09:57:20 -0700 (PDT)
X-Received: by 2002:a05:7022:672a:b0:138:6ef:45c6 with SMTP id a92af1059eb24-13b2a1572d6mr2901665c88.11.1782838639548;
        Tue, 30 Jun 2026 09:57:19 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2a9b425asm12690272c88.0.2026.06.30.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:57:19 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V2 1/2] arm64: dts: qcom: Add SD Card support for Shikra SoC
Date: Tue, 30 Jun 2026 22:26:59 +0530
Message-Id: <20260630165700.1886608-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
References: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FcdhlCk_4XT1b40ZLIGuEdO-A7T1qpf5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE2MSBTYWx0ZWRfX0oN2VFf6RAiI
 e0QhFAduciPeFDiRDEHESHKW+vt29obIJUm3kPXAps+MfwDaHij3ha7RCWIShJHd+KTREJPlCCv
 ATDxwM3kAVx1FKq8GtaS/L4+GUvI6CUWrCNok+6PUn8uXtovOyN1TSVpBGoQLebJJ5NYBTCG4wh
 5wIJ0goXQtp2SggErHDa2dwbZG4EFtIiJZ7uYA/w7yr36YE5fwnSxxIk5X1dgjlj4Hn8Y2+yyBg
 G5eiBVo7htc0YHh/yrp7hU9F6oM4GLYsldZaTzvrVase6Sw6ACD8e4XKwnbn/e1jsup1ahEUW3y
 E95/PIMqUr1uHaNh2UWAH8OXVi/zm/EGnkZue0AIWj8P6B+RIz+ICjjEyjUveQVuZPRJ9cynOY1
 dJwubTy2ZdNXYFqkEQHr7BMobr9xSV2ZwLmEArJe0EcWBSEtrmyXv+++n4C0prEAPi8Xsfkc3Qi
 EQ2flVr0JFRUVK47a7Q==
X-Proofpoint-GUID: FcdhlCk_4XT1b40ZLIGuEdO-A7T1qpf5
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43f571 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=LDB5gES_c2OzCmg7MN4A:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE2MSBTYWx0ZWRfX2qGB9BoktDgM
 1vZA7XlIiTllx+x4vj6aVT3eKh1eLua92bpoKxyzY51htxQ3f6DswQM6xdzqR9ZWq6Rwrwim8at
 1I+5rNPjiUuRJZztmZSvz6Ebzk0yonY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300161

Add support for SD card on Shikra SoC and enable the required pinctrl
configurations.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 97 ++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683..cfdee8a2526e 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -829,6 +829,53 @@ rclk-pins {
 					bias-bus-hold;
 				};
 			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <14>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_card_det_n: sd-card-det-n-state {
+				pins = "gpio89";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 		};
 
 		pmu@c91000 {
@@ -1081,6 +1128,56 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_2: mmc@4784000 {
+			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x4784000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			bus-width = <4>;
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x0a0 0x0>;
+
+			interconnects = <&system_noc MASTER_SDCC_2 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_SDCC_2 RPM_ACTIVE_TAG>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table-2 {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+			};
+		};
+
 		gpi_dma0: dma-controller@4a00000 {
 			compatible = "qcom,shikra-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x04a00000 0x0 0x60000>;
-- 
2.34.1

