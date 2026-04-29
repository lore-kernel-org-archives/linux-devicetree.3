Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD0840FDAE
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482127; cv=none; b=bj7pSvOrIvYHeaTYmXJ56PApxW2eoMOxjnEfZEA6BWlY55n27RDzDvmGnKE+pUrBpT1A5dc5t06Nxg5w3FWSTCTitVeFiJr/pb+wKOSv4uti0eDvShTYXBiwSADaUV1jO7fnYl931J7QgkJsSXNgkgi//6PCCIEJI1iFTE9ZhRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482127; c=relaxed/simple;
	bh=NbxUVY7Cr8u27hZfVARiPe/uaWSuVRtYLFGamRIaT1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5OKekSxZuR3RJuZ9ubirVMWRMaS1c8oNSy4gjlSPoCDeQrXuApF0gTC8aPXuXavux3sCrkL7CT9xQxxEDwo05+ib47Mz93pVDcIPgES7vFZaPO/LoEVuomDkz7OTPAO3xXCkgSi7LoMqcaLYnOu2BhEMVUEo+xyOUyjGCNHptU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=estCKPI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=StjSW90m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="estCKPI2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StjSW90m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFKl6F2094110
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/jn7w3CeadBy1OTnp4vTqdzsrafgI/os35ZMqljkHg8=; b=estCKPI2ws23d/AA
	AR1ifEluxBtzakSnnSYxXRZRA8nrbB9o9R+2NAmpGfd5iJOOLoV3QlTCB0mEQw5W
	aKvg1rDFvootFysOIAu7qf9Cuk0rXWpTJFbX9bsXwso/27Vdy5MhyAMNRfu8/2wn
	feAivWYMI9pU/bBjnV/qE6qPmphz3WsOD4i4SVgVEyd7v1pN+O20VcUA08LikguL
	BOOJ7XcHHkkz1Gec6tEKiix9/dWYQFh9ytGX74yE+I6VgvwEYXT9sRCRX3eb5zms
	LnbKIZkZwl/Gn0ttpgFnZ5q+qANnCKbUvJLHYuTTn6YzxF3NaZkdf/8nEOqJjcjz
	Kxj+Dg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3tdf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:02:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4654f9bb6so54895ad.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482124; x=1778086924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jn7w3CeadBy1OTnp4vTqdzsrafgI/os35ZMqljkHg8=;
        b=StjSW90m8Aq69uhTnB+JevrHz1lOmPaIYZB5SHjRhNlrO3KTL1dxjQJ/KJlukSNhby
         y0JHFMuH1ELviGg9FAdhdDqHwdZZdznF5MIsjGJ2e9ls/3aKyfuWoGrt2N+gS99MEvt9
         YBVaGBbc3CF50FFCcTMtWOrFt5TDpG0aBeIg+Ufr+mXV30wHNxPtCbZkzqMgRrQb/C3U
         mmY/bwATUEaiJKnSA8PugCeVRifPEvy02cBusuYGLnqSFEhEQiwyA6hP4kLD1eY4g0Gk
         vkVM/Ju9sh3XHS2ahkpHCexGMCLvV9j1pa9Y7b9FymKxfB9W5CdmChy3p2H7RVey9bYr
         8VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482124; x=1778086924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/jn7w3CeadBy1OTnp4vTqdzsrafgI/os35ZMqljkHg8=;
        b=QRe7uvdB54/ysHZ4tikxatGLgTMEODAaSncvpV94c7mgt5Q2x20D7OyYb04e6n2/Xh
         BLnlDsfeOucEtqMDSjTHY9NDN5+pZdXSsGkhNXjWj+/BZaHlY4MaO1damhkGaOOldeiG
         Gy8FGLj3x1NMY7vcNYCVVi3xGGL2AYtgRL//d7NtBW8ARAWu+jamo0IPgF7qkEhlE9Vl
         HBqmmyVZYodk5eCJTTAJND2KwECmvtk4X5IWC6JpED04ZbFGznlBWzxanR9vWunUCimF
         EByu2NypNkZFgaLdwy6j6GhAFLSQgjAcgGa01npSVp3/HasJdVTjXOtvgOtLN5EUCzKv
         3J8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+xYYsnvX3iHrDAoNsAxNGRD7nrceCNZTMtPRA2ShPY3Z9SnJwe3OwEn2CKWlq1I2vKSlG+z3HlUxME@vger.kernel.org
X-Gm-Message-State: AOJu0YyrZ3R7W1gesbtLcGWpufztp/z6WGt9tFMyebKdk9+q5+ooVcwx
	OnyQJ2TdM2Ndo7s7gMX0WRn2UxV1cXOAm4XCJbTIBXXQJD85CpIoEjr7BhE9IFhfnec5WSf77FR
	zemXXCOzWoyEG1eiCERpq4qij+VjC02qDSd3K6Yr1YtZekuGmKANq3n9bRAnffLyX
X-Gm-Gg: AeBDiesBjPOsHePSOPmNGjdOtbMN03oBOiV6Q3LMsPu6wx88s/ryhGaS8i6opBAqfCF
	x8z7Rji/dxqeAdgoVal6AdCQsJYMUMUC1Z/LekhNMCvdNNLgDLqL7GlP7hr+aPiQ3AvhDqncgsn
	kuPpqfPWmT0+Py4/beKvlmP6O0wNBq6opDJq6VMbdEarCQGXcTb/FvrZeSXGnPYI0PJoYGyFdRb
	ghISBSSmeqRdcEuqM9uvitRarNECteuvsC9xr9uFXKixCpqEOwQTCcn6Z8CM1U26cwWTQ17r1MO
	DdB56ibKpjOdjhD2Ee4yJ/DJO9/tajwmPK3OVB16ngVjVTrnUDIwJvpIOZiqd/46+kgYkCj2pka
	Mn+O65BPoB2kr288P1ARye5R//VtyMOh0pFJPn57UKsjBqBWwN3NmZhlR3ot4RkVLpOzL
X-Received: by 2002:a17:903:32ce:b0:2b9:8ee1:73ac with SMTP id d9443c01a7336-2b98ee176f1mr24235275ad.11.1777482123973;
        Wed, 29 Apr 2026 10:02:03 -0700 (PDT)
X-Received: by 2002:a17:903:32ce:b0:2b9:8ee1:73ac with SMTP id d9443c01a7336-2b98ee176f1mr24234485ad.11.1777482123162;
        Wed, 29 Apr 2026 10:02:03 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm29530195ad.18.2026.04.29.10.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:02:02 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:31:39 +0530
Subject: [PATCH v5 4/7] arm64: dts: qcom: talos: Add QSPI support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v5-4-993016c9711e@oss.qualcomm.com>
References: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777482100; l=3170;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=NbxUVY7Cr8u27hZfVARiPe/uaWSuVRtYLFGamRIaT1Q=;
 b=nH4uu+GeW60QZJNodnvtK4N7vGyIkYvXMgy0WWvBuxYK/rrvOsp4Kwn6KiXc2xvqRdMAw9JwO
 gEa1LT6ckG+AxvemqB4K0sVM6tPSoEQlqDbOzMVuf48S+oOXlGU0HDU
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: kQiHKNxN08E8DetK3uRh_knRysJTE9VC
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f2398d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NWNfpJqe0LLSB_FnjTEA:9 a=oMVJaGz166wJ4grX:21
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: kQiHKNxN08E8DetK3uRh_knRysJTE9VC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX3iYXPPK0uIsp
 rhBwBSMgztsxhHhy4s879kG00nbJzVJc986T4gfd2lQuxLkKJJA8NKe+ue+NZI44K65/p9Ip6Xq
 zrRUPf8XOj9Kg4RmyKikUIRDJ23e11lEocPZtiEKy4iEAejk+PQt6WXcYZxN2H70+xUC0LXCmWl
 Om/D7h0EPv9JFtc6Ie7muk9hJJ4qDqRAR0L8HwrB61kWqKFXCV+ZCdJSdlv9wGYOJupVXmGvbqX
 7nnrXiSmVqHt2gArPDGxiQeMaR9oauz1LE9g2uNk4ZAzcBGghsTyo89tlsPG6GAOBfX4TYsnYU6
 Q2TJS72kEicegCS9CvttKRkdNle/jwKdEuY3jk2nZDbJU1U3inWPUamTqPPqfWBVCq1A8Q1q3pQ
 Dp1lbPPRAAAH01v1KzRcDXyWHSnXuXtwuk9zNBt1/zStFtAxxJFflEMlFbh1PXw+9vgEeGg1s1s
 R3QhWgE76mRVl7219yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290171

The Talos (QCS615) platform includes a QSPI controller used for accessing
external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
the QSPI controller node to enable support for this hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..8c7ea369a332 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -531,6 +531,25 @@ cdsp_smp2p_in: slave-kernel {
 
 	};
 
+	qspi_opp_table: opp-table-qspi {
+		compatible = "operating-points-v2";
+
+		opp-60000000 {
+			opp-hz = /bits/ 64 <60000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-133250000 {
+			opp-hz = /bits/ 64 <133250000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-266500000 {
+			opp-hz = /bits/ 64 <266500000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
 	qup_opp_table: opp-table-qup {
 		compatible = "operating-points-v2";
 
@@ -1610,6 +1629,34 @@ cci_i2c1_default: cci-i2c1-default-state {
 				bias-pull-up;
 			};
 
+			qspi_cs0: qspi-cs0-state {
+				pins = "gpio44";
+				function = "qspi";
+				bias-disable;
+				drive-strength = <6>;
+			};
+
+			qspi_data0123: qspi-data0123-state {
+				pins = "gpio45", "gpio46", "gpio47", "gpio49";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_clk: qspi-clk-state {
+				pins = "gpio48";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_cs1: qspi-cs1-state {
+				pins = "gpio50";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3896,6 +3943,39 @@ opp-202000000 {
 			};
 		};
 
+		qspi: spi@88df000 {
+			compatible = "qcom,qcs615-qspi",
+				     "qcom,qspi-v1";
+			reg = <0x0 0x088df000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+				 <&gcc GCC_QSPI_CORE_CLK>;
+			clock-names = "iface",
+				      "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_QSPI QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&qspi_opp_table>;
+
+			iommus = <&apps_smmu 0x160 0x0>;
+
+			pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data0123>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		dc_noc: interconnect@9160000 {
 			reg = <0x0 0x09160000 0x0 0x3200>;
 			compatible = "qcom,qcs615-dc-noc";

-- 
2.34.1

