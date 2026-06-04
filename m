Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CDA40F8C5
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575666; cv=none; b=TUKp0Fp5EgwbkE9Ns240c9h3eAQomCFtzvcjWb9qfWMDDnEkkfFS0AhJUuep0414V7ZcxAr3s2sK/z3WRpOYhK6D1X0V06zkbgQx6nhzHe8BBy2nUWvrBY8ZlRPWEf7NtGJ+rZGsP+5VT5VkE8ZgAdBTfqqsftd7u4wl77xx5Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575666; c=relaxed/simple;
	bh=/jpOAGpGfTpX3U5q0Rg09EQwnkxidnwLRgPO4ZCcQ1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jLZcTpGtW3nkuHDwyLILZpfTMLix4BAMjqZvTGC1BXoVIgFarElE6sC0F6XcHhFh4+n+t2cb9WJ4q0D6WwpTMO/n4rziwKzAUtSgBfGz/PEjpdDYCI0WQ1wfJ7/A+CgnQPaLnaDtJo5tR/kEzcJst9Wg/e/CgRixRnwEsNGJ5CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iahYC2Ms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqTl0RIf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iahYC2Ms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WqTl0RIf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546uslL2477908
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 12:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6WyR98AIgg4
	IUe1Wpqy4axQJ9fuq1PIaHO7fO2PnnMY=; b=iahYC2Msy4MbQl8aC6ALRod3a0X
	6xYoi+Ihk8ED6bkRBYlA96APRHB6av9TDKGBmuC049PrGdp54AJ+oHis+X7Th0Lj
	HGzWZccJIv946Wk25blqUV6dCx04/Tz/0YdQjXI6rt4ylcloxE6qVKBH4DRInA6x
	gcroqcxl7dZVHzz2w078pA8jDu/Lee/lpMW5wMIs9dbCPI23iiuZBflYWkzKNtcx
	w79umLZIwx3nnt86VFe5US8PqS+EqVE7DO6f41Y0CHY8DI4ytWKcSKuvgRxGAFUK
	IswYASeWnKykycgBPP8uEhvLTEfBHQMThe1zPPsK6VWaWSy/eP7b4NoIzww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek4hvh6dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 12:21:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2c129b3so411927a12.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780575664; x=1781180464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WyR98AIgg4IUe1Wpqy4axQJ9fuq1PIaHO7fO2PnnMY=;
        b=WqTl0RIffRiBZTc9bYclpa1oOirpRyoLD0lfgVASBd33hLeB+um8fw8w3K64lLhpe4
         30jyDNtAyOL0GisD7W/EZoUqJxXeNsG3VR50088ni19diGqyxEZyQ47gbGU3a6DcwtCD
         8oDGfFXgO7gy+Bxb/GGZ94L5rsNAcWPb8pcuARXb8vagbStP8SqmeO1cNfR3itsrkyWn
         faskdXlfnBlj9rOsZ5EiTlJOZyb+k7/w41ongguScAFdbe3KwqkBwKMCwxbeuWNIVQZe
         FPRNpODcAF2Ts2vwy7/Vi6Yp5DBWmrBSbzHuvoImncJPQ4hwotR1UH+CqsB4NLVqmnDr
         9vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575664; x=1781180464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6WyR98AIgg4IUe1Wpqy4axQJ9fuq1PIaHO7fO2PnnMY=;
        b=b+kSUG6VQcC0+u+jYAT7yXiJI/BRqjA4ruMf4VJb8gMKZiK7dSDxa6UoTg1sJG78Uc
         iE6K5T5hZDirBKIb5q4UHzjTOhyuk2wQvDVoQjAN9CrgIJziKDAuaBHilbI5hTwMKLS1
         KcIeDwko/5c+GrkwwibyhPPkUAmDUba0HADiCSiNrL6bpDSo3ZhbWgB2x4Sc78kkLr0t
         dszh+7wzgvfUcisTImmRVmk59G9e26Q3NsIIJ4tNCQIY+JqqBimHvBb6i8Jtny0DeQsp
         QvsZSZtv25cOdrGjPoyrZm5s4kkmoEqB1spBbLx+lD2ZpZcqQchiXrEIpDd0oOCFFRFN
         RPHA==
X-Forwarded-Encrypted: i=1; AFNElJ8+rNgmplhLy7SfuTp/47q9bOmuUJ2OYaPVIa1WIjuhQ+Xelz+EHqujOvyErPl4UZyN8gL2JsL3qcjv@vger.kernel.org
X-Gm-Message-State: AOJu0YzqmtQ3nU5xC1gnmyuge5jA75KNh6nvh/RtPOltbrtWnqC5Zhcd
	2qpCgrfReGNUWq1PbDy53FsQEVrpTJssQfAAEewya0SrlBH2nMiL8lwkG4NRWpNsogk1W0mWqjA
	tmxskpn9G1fS5+SVFzvNCN91M/bHq6ng3aXrIidzux5RjJV2eR5eWX5bx1O8J2ztl
X-Gm-Gg: Acq92OGi/dHD/ohGcL1tdsmthMooEWSDRxxZFpfdK2Fl6iHCUwLopiPu7V5nXTk+bWi
	9IqH3pUItrWkhAxZjbZ+dy6l+40ohOwLz5Twi4/7KLetsjlSXIXR6ay3fmx+t/id7/fKmdM08pP
	xN9mKgttyp0uSTdLANAojN6l4NWwVWR85qGbeBXK7WIwX1VeZsya9Q9X0dIwvSngK0Toang78Y1
	GUVOmGABBgPkMJOIednJEDpGCVHnBEo50vqbUvfWpnKycat8f+IxJX5A7BYHsej2c03IxBbbzE9
	6CQTRomcHvym9ommFCInVPPKX52Wr43XAv2hJfBZD21RQ4SXJF6iCIms80CSZ7oSWlsAlOshul/
	l1b5F14mZBaeruPLfdsxSS3t1fxkDaEvL+erBCXWyPFZc2/MzlnaAuoCepBJCVTOJsQ4=
X-Received: by 2002:a05:6a21:3b89:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3b4979e9b64mr8576159637.37.1780575664071;
        Thu, 04 Jun 2026 05:21:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:3b89:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3b4979e9b64mr8576110637.37.1780575663548;
        Thu, 04 Jun 2026 05:21:03 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df045c2csm4796903a12.12.2026.06.04.05.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:21:03 -0700 (PDT)
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
Subject: [PATCH V1 1/2] arm64: dts: qcom: Add SD Card support for Shikra SoC
Date: Thu,  4 Jun 2026 17:50:44 +0530
Message-Id: <20260604122045.494712-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
References: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NvU-88RpjOuzh4ILGz9nOHOUpQc5G4YJ
X-Proofpoint-ORIG-GUID: NvU-88RpjOuzh4ILGz9nOHOUpQc5G4YJ
X-Authority-Analysis: v=2.4 cv=Zp/d7d7G c=1 sm=1 tr=0 ts=6a216db0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=LDB5gES_c2OzCmg7MN4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExOSBTYWx0ZWRfX8CP+inoAa05s
 ReZY2QGYeHv60x0lLVP7VJpDfWFORXMa45RtWz/ROCoyytXb13lIAPjX4BGvmNuIlafpj6EYLJH
 MHFe+ffLNozCudYLngRXgvNEsgUq5MG0H3lZBm+qkLxNLLNMzAcz3jDKqB6uFNbktHjv4gNnJu6
 azoLzBl73brJyY75wLQxYV70kg7TZpHEnxbOLR6UEsNn0kPk6VaFE4ikqi64g8eln1LbZdcog6D
 eoJuR5n/OFJVVXmJ0IIj51ssezy6rXS2yvLmZ7+8kgG4fwPxUXoDtuzcNbe/qsN+eB1TlFzBjzj
 DtsYomTIh5j2uwHDwWc6pFA/fHJtcUHO4mz0OlZ2Y8/F9KskRE7gA+m+vQMXEglLrbVIpa+3ChJ
 3TVdIPUMcon8DMzp0HaXbF43BhwGiDQoxv9k/6m4c8XlkctfQTNqYOWrZYnHlFZZcDQ93sRQr57
 5PwMfbmMfM8labi6Cbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040119

Add support for SD card on Shikra SoC and enable the required pinctrl
configurations.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 93 ++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 6bac6ebac8da..6733f2efe60a 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -827,6 +827,53 @@ rclk-pins {
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
@@ -1079,6 +1126,52 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_2: mmc@4784000 {
+			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x4784000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			bus-width = <4>;
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+					 <&gcc GCC_SDCC2_APPS_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface", "core", "xo";
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x0a0 0x0>;
+
+			interconnects = <&system_noc MASTER_SDCC_2 RPM_ALWAYS_TAG
+					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					&config_noc SLAVE_SDCC_2 RPM_ACTIVE_TAG>;
+			interconnect-names = "sdhc-ddr","cpu-sdhc";
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

