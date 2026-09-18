Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDFE328B56
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695508; cv=none; b=BZyN5k5kjhuHswplE5Mx1ND6RSHgxaZvQJuxkhmJmicjhukF35ZrR23o2jP5d87gwvaQwmOlRZKBtpXm66SBQJV8HEvYkYH2WlvH8ZdnyVjp3DqtCjabMSkPZww2PzgmW7YXjN+J2GOo2dVlZR6zuHbhvAk0EK3cGXN1Q/irOGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695508; c=relaxed/simple;
	bh=xmXUAsCk6BPceojtuuROKgeAODRvtOq4/i/HwjAjy5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGrDd09B4fQQwziWVV0ywLVn25wcthsS923cvtZ2R3nQMucZVclE4tbtorkHJThPkNheyTPywO6I1Opq1uWFW1NEwhfHF5vqc/Xf4Lbm/pyhanTbAT71fDo7ABM34Ay/83+Hu2x6JUKeodlB2G9uup2CTVJCBOZxhzARiqhUTME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozMyXW/m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R07yg3gj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozMyXW/m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R07yg3gj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLG4V42955443
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=G71fZMC/jJh
	YgQAtFclgYt5sPL274pCXlwAipaM8Ke8=; b=ozMyXW/mjy83PmXGPUVjbL/z9wd
	SAcdzqs6gTouyCv+YLk0vIcJSNkqw/pP0+MMEnsYsfJmuD7fn6z6ZTX9eyr6mnhv
	gl9LKOVOm1Wc5vBoa+sk+H+nt4ArZRLFmJ4iY17ohyXNnCkVQqqFRwtITvHzq/Am
	AHgxHQfVhH0mPUqQYzneI+CADny0BH7oyvf3LX5coIX0oZZ7nQd8K0t+47kRaqjc
	DK+xoUdQrt1zCO9rPpROdsSogAB702OYo3a/QxSES8PmXLSej3DMY4DtARXg83ZQ
	p80k/ZuatBMmvglJ3jpJIwOomfFgGKnPKOLFshfkkRERj/FpIu6Ni+XujlA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grgu5k58r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:38:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so383183a91.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 18:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789695504; x=1790300304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G71fZMC/jJhYgQAtFclgYt5sPL274pCXlwAipaM8Ke8=;
        b=R07yg3gjH/7h2Rp7c/d0PzppON82JXU+bhEYrLhmEVUAFgHraAAt+Q5y2BAdec7j8B
         7+jEKV1i+Gxsg1adguKktJhNvX43wMw6u5Oag0z77JWv+6urfl7SsFS5A9cViJtHI7Zw
         1Dggp3gCzFszDMZ+zq/Gk0Hhywu65frct95cOsUW8xCivPRIR2N/n52/fVvRlOx0RpsN
         DDnckhTZIzWriAOs+v5MhLqEinFt/zUgcPgbzJC4Sd+dDrHh1WVCCE40bJOLZ3fKIPTy
         sPX9PYhYXX7YbJvL0J1u9WkV0pmn6Ck0kQ6/SToT7SRcPAlAUl6B6izESkU6FEn3Ymso
         dkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695504; x=1790300304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G71fZMC/jJhYgQAtFclgYt5sPL274pCXlwAipaM8Ke8=;
        b=kqTXNJiCI6Ajk+N/lkkC4syE9V8hN6iT0JEUk/Oz0KNd2m8SWd3oAgGZgNigIFpLqQ
         9N8D619q6yjRBkVbvRkwnPQcrzT+/YzTzURy4fwPFbBKtfPgSSeASmbu+HPHW32wbhHm
         1OSSZH7UpxD2ooaO4xd+oOfmKaN6+7+ZTOPqjH7KQJt37ddHnLE8Vz+lPqa0i+tffcAP
         UOECGFNHNHFwvklDOLmKDGi4PNbbWQn5pk9AMUJFUhsrzBTXVZfumCQrNYnAS69G1Gsl
         yqJ9/AAwev1OsSU3Ht4OE6c23Q87SpjfNluMpJMdA1st7zbLY47Wbl39qGlvacWLkOYF
         Zaew==
X-Forwarded-Encrypted: i=1; AKwUvBz335SxEWCKijj7A0ukJ+5F1QQ5inplMX2SukAA/CuQMz9c2q+y8mhq+MyU7Zu4stTkSJKpmO5ufWOB@vger.kernel.org
X-Gm-Message-State: AFuF++nnRyJlUdip4UdPHArKkiLIMeHCjRCRpL0cI2h3TmZF1iW3hzO4
	AIvVz5OGO3O+OtB7ragI/dtmwKpIqcLB50VNCGY1eZPADKW+ZosPLs6ukmB88ZcRKnsz5QS9Bo6
	wPoHtT3ntYaqngTIzwWyKOLLzbZymmhTlQU7ZD8Z/H660ZnhlNBMtO7I0C+npSc8S
X-Gm-Gg: AYBFou0uw5zK4erdwJRdpNg0N5NMYGXobAZIvq5CVuBdaN9jOMfhdY6lGsy5Rxj/omT
	JRa7BQvXoPlo2RWCMVIkwGomvHJyYPPvMwVF5d90j9eLhVD+2xO3kpO8De5dTAS5C6FIvNIz3y6
	7pcHh421mk6pJH1YiXii6wcTtQOiVi+pIPQwmf8hejPxyT1IWfwmdswCtiRotpJ+QBecuiM3Qbe
	RjgMlfO8uhQx+91dfC3AxfwRQJuDoPvs7zjA7epC2rPMcKgVxDs+KlTX232a8v6gZFZf0QXMA6x
	7hwR1uMDKu3Kbc9XBxuvNZ9ASt3BVBSej0h0LYUNjOJiqH/LgD7/oXnXfc81qtJ5/GGJBAJiCZQ
	67b/lUY/uPpd1SvUarbBBuMe+nQYC962eAEuotTCRiNfaEZjbb7ihm7BxIZGO
X-Received: by 2002:a17:90b:2690:b0:39e:4c80:f682 with SMTP id 98e67ed59e1d1-39e54f47948mr2095506a91.33.1789695503326;
        Thu, 17 Sep 2026 18:38:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2690:b0:39e:4c80:f682 with SMTP id 98e67ed59e1d1-39e54f47948mr2095448a91.33.1789695502816;
        Thu, 17 Sep 2026 18:38:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce03c682sm821276c88.10.2026.09.17.18.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:38:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/4] arm64: dts: qcom: nord: Add display subsystem nodes
Date: Fri, 18 Sep 2026 09:37:38 +0800
Message-ID: <20260918013740.1355096-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
References: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX2KhP7Ywexb12
 0JevDpfDx/1YebxFgMkvjO/XvmGqyaddMc5t6F/ltBruEMoSD9oTxl5ioJApvAtbC79jj/MEwM2
 zQSgOSCgmnfnLViwy4mbE4ngXEq9/T4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX5IFcyDZkD7U0
 7AvhhApGwDLwdatTkregY+PBgCiptY1EyHdY3Xzz2RHP0vhrRFcDT68Pr3OoCZt7ovdYNN0eaM+
 3CPzFpUksM+HaaeCMhiwgO/FFhF9q2krt/j4nFsSxRZknyVvacH5DAB3PkBXB+CFEo+Ak6xWaRf
 c98X0qJbkd4VRat200QWzsuAIdFBZGyudJK0D4tIp3RybMUkLcqWwHLfq3M1o68U8g/cvEtr2zP
 uWzdfIlWVkypDTywv+2mF5zW6aCSb/N/lZnqcm+WqfglitwRM+gRjxi06vxw8+CWKuO6sUGU/NU
 TwxgLmbtuThV+YCUn3bdACYOYRxFKcNFwUqzXkvwjyZAce5NNguwW9GPxIxmRRDkER/8YEvTgtJ
 G+Ejvr6yedOD2c0nComQvnZUnfeKixASkhG7kS/Sif183XGWKAbFlBUbsMQWtOOEA6X+LR9U9SN
 fQPNvUWNKQG3PYKJDbg==
X-Proofpoint-GUID: 3hwNLFngmd2ccPYWBoB-jbEA1nPF3UbI
X-Authority-Analysis: v=2.4 cv=GvbXaU1C c=1 sm=1 tr=0 ts=6aac9610 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Mj7saqew1W64Bd7qtw8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 3hwNLFngmd2ccPYWBoB-jbEA1nPF3UbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180018

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
dispcc0 and dispcc1 clock inputs, which were previously stubbed with
zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 523 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/nord.dtsi          | 266 ++++++++++
 2 files changed, 781 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..74f4e6be8652 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -346,6 +346,489 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 	pinctrl-names = "default";
 };
 
+&mdss {
+	power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+	resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+	interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "mdp0-mem",
+			     "cpu-cfg";
+
+	dp0_phy: phy@fc3a00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fc3a00 0x0 0x1d0>,
+		      <0x0 0x0fc3200 0x0 0x128>,
+		      <0x0 0x0fc3600 0x0 0x128>,
+		      <0x0 0x0fc3000 0x0 0x200>;
+
+		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+			 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_0_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+
+	dp1_phy: phy@fc6a00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fc6a00 0x0 0x200>,
+		      <0x0 0x0fc6200 0x0 0xd0>,
+		      <0x0 0x0fc6600 0x0 0xd0>,
+		      <0x0 0x0fc6000 0x0 0x1c8>;
+
+		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+			 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_1_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+};
+
+&mdss_mdp {
+	clocks = <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	clock-names = "nrt_bus",
+		      "iface",
+		      "lut",
+		      "core",
+		      "vsync";
+
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	operating-points-v2 = <&mdp_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	mdp_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-417000000 {
+			opp-hz = /bits/ 64 <417000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-532000000 {
+			opp-hz = /bits/ 64 <532000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&rpmhpd_opp_turbo>;
+		};
+		opp-710000000 {
+			opp-hz = /bits/ 64 <710000000>;
+			required-opps = <&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
+&mdss_dp0 {
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+	assigned-clock-parents = <&dp0_phy 0>,
+				 <&dp0_phy 1>,
+				 <&dp0_phy 1>,
+				 <&dp0_phy 1>,
+				 <&dp0_phy 1>;
+
+	phys = <&dp0_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp0_hot_plug_det>;
+	pinctrl-names = "default";
+
+	dp_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-162000000 {
+			opp-hz = /bits/ 64 <162000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-270000000 {
+			opp-hz = /bits/ 64 <270000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
+
+&mdss_dp1 {
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+	assigned-clock-parents = <&dp1_phy 0>,
+				 <&dp1_phy 1>,
+				 <&dp1_phy 1>;
+
+	phys = <&dp1_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp1_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp1_hot_plug_det>;
+	pinctrl-names = "default";
+
+	dp1_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-162000000 {
+			opp-hz = /bits/ 64 <162000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-270000000 {
+			opp-hz = /bits/ 64 <270000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
+
+&mdss1 {
+	power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&nwgcc NW_GCC_DISP_1_HF_AXI_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+	resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+	interconnects = <&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_DISPLAY_1_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "mdp0-mem",
+			     "cpu-cfg";
+
+	dp2_phy: phy@fc9a00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fc9a00 0x0 0x1d0>,
+		      <0x0 0x0fc9200 0x0 0x128>,
+		      <0x0 0x0fc9600 0x0 0x128>,
+		      <0x0 0x0fc9000 0x0 0x200>;
+
+		clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+			 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_2_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+
+	dp3_phy: phy@fcca00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fcca00 0x0 0x200>,
+		      <0x0 0x0fcc200 0x0 0xd0>,
+		      <0x0 0x0fcc600 0x0 0xd0>,
+		      <0x0 0x0fcc000 0x0 0x1c8>;
+
+		clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+			 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_3_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+};
+
+&mdss1_mdp {
+	clocks = <&nwgcc NW_GCC_DISP_1_HF_AXI_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	clock-names = "nrt_bus",
+		      "iface",
+		      "lut",
+		      "core",
+		      "vsync";
+
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	operating-points-v2 = <&mdp1_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	mdp1_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-417000000 {
+			opp-hz = /bits/ 64 <417000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-532000000 {
+			opp-hz = /bits/ 64 <532000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&rpmhpd_opp_turbo>;
+		};
+
+		opp-710000000 {
+			opp-hz = /bits/ 64 <710000000>;
+			required-opps = <&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
+&mdss1_dp0 {
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+	assigned-clock-parents = <&dp2_phy 0>,
+				 <&dp2_phy 1>,
+				 <&dp2_phy 1>,
+				 <&dp2_phy 1>,
+				 <&dp2_phy 1>;
+
+	phys = <&dp2_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp2_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp2_hot_plug_det>;
+	pinctrl-names = "default";
+
+	dp2_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-162000000 {
+			opp-hz = /bits/ 64 <162000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-270000000 {
+			opp-hz = /bits/ 64 <270000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
+
+&mdss1_dp1 {
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+	assigned-clock-parents = <&dp3_phy 0>,
+				 <&dp3_phy 1>,
+				 <&dp3_phy 1>;
+
+	phys = <&dp3_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp3_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp3_hot_plug_det>;
+	pinctrl-names = "default";
+
+	dp3_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-162000000 {
+			opp-hz = /bits/ 64 <162000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-270000000 {
+			opp-hz = /bits/ 64 <270000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
+
 &qupv3_0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
 		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
@@ -903,10 +1386,10 @@ dispcc1: clock-controller@8d00000 {
 			 <0>,
 			 <0>,
 			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
+			 <&dp2_phy 0>,
+			 <&dp2_phy 1>,
+			 <&dp3_phy 0>,
+			 <&dp3_phy 1>,
 			 <0>,
 			 <0>,
 			 <0>,
@@ -970,10 +1453,10 @@ dispcc0: clock-controller@af00000 {
 			 <0>,
 			 <0>,
 			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
+			 <&dp0_phy 0>,
+			 <&dp0_phy 1>,
+			 <&dp1_phy 0>,
+			 <&dp1_phy 1>,
 			 <0>,
 			 <0>,
 			 <0>,
@@ -1106,6 +1589,30 @@ nsp_data_noc_3: interconnect@1fe00000 {
 };
 
 &tlmm {
+	dp0_hot_plug_det: dp0-hot-plug-det-state {
+		pins = "gpio51";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
+	dp1_hot_plug_det: dp1-hot-plug-det-state {
+		pins = "gpio52";
+		function = "edp1_hot";
+		bias-disable;
+	};
+
+	dp2_hot_plug_det: dp2-hot-plug-det-state {
+		pins = "gpio53";
+		function = "edp2_hot";
+		bias-disable;
+	};
+
+	dp3_hot_plug_det: dp3-hot-plug-det-state {
+		pins = "gpio54";
+		function = "edp3_hot";
+		bias-disable;
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 926ccf3bbe4e..73136c27bac1 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1727,6 +1727,139 @@ compute-cb@6 {
 			};
 		};
 
+		/* Display subsystem nodes - MDSS1, DP-only (no DSI) */
+		mdss1: display-subsystem@8c00000 {
+			compatible = "qcom,nord-mdss";
+			reg = <0x0 0x08c00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu_1 0x400 0x2>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss1_mdp: display-controller@8c01000 {
+				compatible = "qcom,nord-dpu";
+				reg = <0x0 0x08c01000 0x0 0x8f000>,
+				      <0x0 0x08cb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <0>;
+
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu1_intf0_out: endpoint {
+							remote-endpoint = <&mdss1_dp0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu1_intf4_out: endpoint {
+							remote-endpoint = <&mdss1_dp1_in>;
+						};
+					};
+				};
+			};
+
+			mdss1_dp0: displayport-controller@8d54000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x08d54000 0x0 0x200>,
+				      <0x0 0x08d54200 0x0 0x200>,
+				      <0x0 0x08d55000 0x0 0xc00>,
+				      <0x0 0x08d56000 0x0 0x400>,
+				      <0x0 0x08d57000 0x0 0x400>,
+				      <0x0 0x08d58000 0x0 0x400>,
+				      <0x0 0x08d59000 0x0 0x400>,
+				      <0x0 0x08d5a000 0x0 0x600>,
+				      <0x0 0x08d5b000 0x0 0x600>;
+
+				interrupts-extended = <&mdss1 12>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dp0_in: endpoint {
+							remote-endpoint = <&dpu1_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss1_dp1: displayport-controller@8d5c000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x08d5c000 0x0 0x200>,
+				      <0x0 0x08d5c200 0x0 0x200>,
+				      <0x0 0x08d5d000 0x0 0xc00>,
+				      <0x0 0x08d5e000 0x0 0x400>,
+				      <0x0 0x08d5f000 0x0 0x400>,
+				      <0x0 0x08d60000 0x0 0x400>,
+				      <0x0 0x08d61000 0x0 0x400>,
+				      <0x0 0x08d62000 0x0 0x600>,
+				      <0x0 0x08d63000 0x0 0x600>;
+
+				interrupts-extended = <&mdss1 13>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dp1_in: endpoint {
+							remote-endpoint = <&dpu1_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp1_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+
 		ipcc0: mailbox@9007000 {
 			compatible = "qcom,nord-ipcc",
 				     "qcom,ipcc";
@@ -1737,6 +1870,139 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		/* Display subsystem nodes - MDSS 12.1, DP-only (no DSI) */
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,nord-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 930 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu_1 0x3e0 0x2>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,nord-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu_intf4_out: endpoint {
+							remote-endpoint = <&mdss_dp1_in>;
+						};
+					};
+				};
+			};
+
+			mdss_dp0: displayport-controller@af54000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>,
+				      <0x0 0x0af57000 0x0 0x400>,
+				      <0x0 0x0af58000 0x0 0x400>,
+				      <0x0 0x0af59000 0x0 0x400>,
+				      <0x0 0x0af5a000 0x0 0x600>,
+				      <0x0 0x0af5b000 0x0 0x600>;
+
+				interrupts-extended = <&mdss 12>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dp1: displayport-controller@af5c000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x0af5c000 0x0 0x200>,
+				      <0x0 0x0af5c200 0x0 0x200>,
+				      <0x0 0x0af5d000 0x0 0xc00>,
+				      <0x0 0x0af5e000 0x0 0x400>,
+				      <0x0 0x0af5f000 0x0 0x400>,
+				      <0x0 0x0af60000 0x0 0x400>,
+				      <0x0 0x0af61000 0x0 0x400>,
+				      <0x0 0x0af62000 0x0 0x600>,
+				      <0x0 0x0af63000 0x0 0x600>;
+
+				interrupts-extended = <&mdss 13>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp1_in: endpoint {
+							remote-endpoint = <&dpu_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp1_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

