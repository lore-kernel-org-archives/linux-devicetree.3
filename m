Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBAB4B049F
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717042; cv=none; b=L2ktIuYkl83Psw0j4fXEe+mmTvGoAmQwGH0b41PqHH7mGjJQeK/+V+A0SsFP3L4KV4K1lm7mnHcvHRr5W8wLA422sVtOo+UaaqYk56nxBmVwlrNBXxlZY8rTrmIiuBbQyTw5c1q7TBYAlhT7kKDf+3ycRyauV72GKiC2DCmOV10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717042; c=relaxed/simple;
	bh=PVNV+XXqUnmcaEypAWOIh0Solf2DSfQU87bTIEml4UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyoUX1DhdH/I00SJzWBxlQVC/fUCwpkXeA+IYo47ME+LTkGnBm/hKAZdrq6/ZZky92kW8qtrc0ki/dzOoLxUJHfWIjyd059HeI0CkfFJf5a1cs07BkBnpBCq6x19tMDxnv+ssE+XpW/UAlEiQuTXfLgl2qVKJiMNxYy2+vHGiwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AiFRrwz7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3nSRfUR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AiFRrwz7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3nSRfUR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xtCT3834599
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U97309miJ/XTQKmPts2YdrL+
	xXyyuGzFAQLmRVCtVj0=; b=AiFRrwz72dcy8Fgt+6YjrV3E4iLqQKXr4jqdkDxg
	M8XIksBegkze2uorTZp1U84FT1elWDZzIacViZq1YNWeHXjbNQ7aI4FtbgT8Lin4
	r5z6D8NgnD0koLS8orqJbs/Qd+py5EoRn1m4EWfSapF7C82nRotQt6c4ddpmpi8I
	3hFIjj+iMgtP1B+omFH9ncxXa8WGgiB549Cb7zKKGvuxKqiwcvPqlVmmusEiJ3rQ
	/SksRtlrfeDkryobf69dYK59pIXIqxhPwz2RwvBvz0H8yy/5HLiLI+tn2gYFpHj6
	fHBy15kPKp2xT568X2mOmTHb59ES/JiY7LYrb8zqjZNm3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2brgms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:37:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dcfed75f77so7104145ad.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789717027; x=1790321827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U97309miJ/XTQKmPts2YdrL+xXyyuGzFAQLmRVCtVj0=;
        b=I3nSRfURhh/bCu1KUVUOflC4ovFAU27W73Gos3U5KU+5upmo5UJQuetop5OHvN6uPT
         dN7ShsX1YyumQCVdgDNDSL+PY2BRR++ipwR/ln0yGmk24A2UC/vstAkv6BL1+kjSK6VY
         NrFpbNWh2ww6d7VU+07+1NU0ItolxlB+7zTMOvPbbq7yyL3LOj1iWWrXFSqgyvy0Pukl
         2YkgkJamthvw4MB/n9qkuyU8gx1mVK3vlpACEO164rGQudk14Ba16BKsLWm0fjqUz3yF
         3oRlMAC7NJkw6CLt0e8RvIRyGUSFkZ2XZeXmjOgoSteg62DYzqsVEVvlvQxSgFeJiMps
         Y1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717027; x=1790321827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U97309miJ/XTQKmPts2YdrL+xXyyuGzFAQLmRVCtVj0=;
        b=HvAwjMtVPmfY2/zbuQTDEfdnEIyJUzg07pNyBygm2IcY1YiB2UoTWJ8JG8Z84kSJFJ
         Lr268dXbbhPTSKl2G+lJ2Hy1Z9okVM1sIZio2VTIRVIsmRXpEaSqDaTQUbZ9Sgf15PXY
         VGMmjyJoL8CvL+fVOChk5qg0S8Z0bOsFNwhtSTaHKXTkezpumAsjWcObcD6LXrJYHoKZ
         WdZtfYAYD+NBBgyx2QLRZpsefu9DVHXIzsKHoqdX7Y6mgsgpPcCo1SnypIm06oEOwuLi
         fHiJB1soI8Zufbsnr9kZmdsFKRds4xa+muU1dU0MfkZqzrwwleJjqJAbe+TrFoRldGXQ
         X1DA==
X-Forwarded-Encrypted: i=1; AKwUvByCmnTJDXvK8IOwyohhbuoGlAn/YEB2SeoAR5nINTPpZJDwIfy0OOjeHh6s4LmHddcNBeNaJwy24mfC@vger.kernel.org
X-Gm-Message-State: AFuF++lD8Ehx9ymG3BrvzLPWUXrG34c0MtL/s+gSiK82Br3aWFNqI1l3
	n+WLmeDVfTkPD5RJqWQMAOoq0vjHTO5F3qOOWhUBWuZ0SpnubLbb4TIUZPiih9R5+G7Gm6W4Oy2
	lpCNZ8KjnThhHieVT7pUKVlJSrHWsFO4r9Cj03VxaP9W/VoMGz6gJQEeQq0K484/3
X-Gm-Gg: AYBFou3j7WNOVk/wMjrWbOAQiIEHhlhVNQP+5Y3mW11p5vf17abl9/MeFpr+RyT6SrX
	J0D0ACK7Ko4ZwOSd0ODpnftPo4Mlz3kIr0mNTUeI6baPdgsz5mNKM7chCZpfkxxcPIvn7DIJCPH
	b8b75MCFFX5lCCwlYoZOFhluxUxYlBt5biWrhKcP7ZotbrPlRwCE0Y/a8EYhg2wAM/5+yL/qwfC
	Vm7f9qnoshLA03y+0k3Ke1RqciJvlALcWF7qg5ysMedYIxiZOp9qFOuLdTKgEzKdnbzkI3Zb0th
	ceb7TxT2K1XSKAjDI1UGk7Eb0Agt1rwXZQ+jPkExYWI2uRb3bsHsOEbln51JUEb8vjOT2rEe8dL
	DOrkPadn6i9E1Qjaj6rlrPLKjyvPxF5k1AmEv3zWDshs=
X-Received: by 2002:a17:902:da89:b0:2db:43c6:d2c8 with SMTP id d9443c01a7336-2ddb1ac9569mr31213575ad.1.1789717026944;
        Fri, 18 Sep 2026 00:37:06 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2db:43c6:d2c8 with SMTP id d9443c01a7336-2ddb1ac9569mr31213035ad.1.1789717026382;
        Fri, 18 Sep 2026 00:37:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2872052fsm2404945eec.11.2026.09.18.00.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:37:05 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:36:59 +0800
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
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: nord: Add display subsystem nodes
Message-ID: <aqzqGwl3mAKhG-7X@QCOM-aGQu4IUr3Y>
References: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
 <20260918013740.1355096-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918013740.1355096-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwMiBTYWx0ZWRfX36WnRxW0N7QM
 7/sREQWTAa84whjPOtdRbhEAm2wv/FktvrOBQC3qpTuNkDbgC/OeGGh9yHRK9E0ZcZd6rMH6mHl
 LvRgsrL1LrjyspdvwXyZhY5MEMdOfHXvajjXsNYQyqB90fSzR4IJZuZk1aW6LndqwjAt0u30QQa
 HX8eHmI87At/74lSHlm5LUEVBucVFT7qTX20oxbapCC+HgAX+HmJNy6WDf8LkMTgT7v4a0irLmi
 hhMdx3BH5WptDvmr1YS9z4B8HMkWw7bzkHgowWOEXGkChOki+MKkO6g0XhNOM4PLO6a0ssy7VIB
 Ve418HhHphiRHfPyJ7rppmL+gW01SlfFGozkQHAxlb/ifWqSoafBf668s5WVPZ38cjpi78P9JSt
 5j7hmib6a9GZqGoyz8Uxju6tq4IgL2gGSTi+9b8uL6jXjlvQ08AsMlKPBMa4elLtC+OwiOhWHrv
 vuTCzG2Ihzt0mVdsuYA==
X-Proofpoint-GUID: VOkhwGlUEKctrvuEDJCzzpCzFrAgExGm
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aacea24 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oOefM0HMmhHXo5ade_0A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwMiBTYWx0ZWRfX42El/BvpD3Tg
 tZbiZN8ynhtT3yfhSfajdS6PIoSiu6T1M7gvd6rwUa/kCsIlSWyJPc9PLPwzrwYOlqH9lpb+ll9
 oa03Nodc/okt+OCthkCS3l0S1VzUWpk=
X-Proofpoint-ORIG-GUID: VOkhwGlUEKctrvuEDJCzzpCzFrAgExGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180102

On Fri, Sep 18, 2026 at 09:37:38AM +0800, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
> SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
> MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
> is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
> dispcc0 and dispcc1 clock inputs, which were previously stubbed with
> zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 523 +++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/nord.dtsi          | 266 ++++++++++
>  2 files changed, 781 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 6dc4c871f41e..74f4e6be8652 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -346,6 +346,489 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
>  	pinctrl-names = "default";
>  };
>  
> +&mdss {

We will rename mdss to mdss0 to maintain consistency across platforms.

Shawn

> +	power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
> +
> +	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +		 <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
> +
> +	resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
> +
> +	interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +			 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +	interconnect-names = "mdp0-mem",
> +			     "cpu-cfg";
> +
> +	dp0_phy: phy@fc3a00 {
> +		compatible = "qcom,nord-dp-phy";
> +		reg = <0x0 0x0fc3a00 0x0 0x1d0>,
> +		      <0x0 0x0fc3200 0x0 0x128>,
> +		      <0x0 0x0fc3600 0x0 0x128>,
> +		      <0x0 0x0fc3000 0x0 0x200>;
> +
> +		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +			 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +			 <&tcsrcc TCSR_DP_TX_0_CLKREF_EN>;
> +		clock-names = "aux",
> +			      "cfg_ahb",
> +			      "ref";
> +
> +		#clock-cells = <1>;
> +		#phy-cells = <0>;
> +
> +		power-domains = <&rpmhpd RPMHPD_MX>;
> +
> +		status = "disabled";
> +	};
> +
> +	dp1_phy: phy@fc6a00 {
> +		compatible = "qcom,nord-dp-phy";
> +		reg = <0x0 0x0fc6a00 0x0 0x200>,
> +		      <0x0 0x0fc6200 0x0 0xd0>,
> +		      <0x0 0x0fc6600 0x0 0xd0>,
> +		      <0x0 0x0fc6000 0x0 0x1c8>;
> +
> +		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
> +			 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +			 <&tcsrcc TCSR_DP_TX_1_CLKREF_EN>;
> +		clock-names = "aux",
> +			      "cfg_ahb",
> +			      "ref";
> +
> +		#clock-cells = <1>;
> +		#phy-cells = <0>;
> +
> +		power-domains = <&rpmhpd RPMHPD_MX>;
> +
> +		status = "disabled";
> +	};
> +};
> +
> +&mdss_mdp {
> +	clocks = <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +	clock-names = "nrt_bus",
> +		      "iface",
> +		      "lut",
> +		      "core",
> +		      "vsync";
> +
> +	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +	assigned-clock-rates = <19200000>;
> +
> +	operating-points-v2 = <&mdp_opp_table>;
> +
> +	power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +	mdp_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-417000000 {
> +			opp-hz = /bits/ 64 <417000000>;
> +			required-opps = <&rpmhpd_opp_svs_l1>;
> +		};
> +
> +		opp-532000000 {
> +			opp-hz = /bits/ 64 <532000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +
> +		opp-650000000 {
> +			opp-hz = /bits/ 64 <650000000>;
> +			required-opps = <&rpmhpd_opp_turbo>;
> +		};
> +		opp-710000000 {
> +			opp-hz = /bits/ 64 <710000000>;
> +			required-opps = <&rpmhpd_opp_turbo_l1>;
> +		};
> +	};
> +};
> +
> +&mdss_dp0 {
> +	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
> +	clock-names = "core_iface",
> +		      "core_aux",
> +		      "ctrl_link",
> +		      "ctrl_link_iface",
> +		      "stream_pixel",
> +		      "stream_1_pixel",
> +		      "stream_2_pixel",
> +		      "stream_3_pixel";
> +
> +	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
> +			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
> +			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
> +	assigned-clock-parents = <&dp0_phy 0>,
> +				 <&dp0_phy 1>,
> +				 <&dp0_phy 1>,
> +				 <&dp0_phy 1>,
> +				 <&dp0_phy 1>;
> +
> +	phys = <&dp0_phy>;
> +	phy-names = "dp";
> +
> +	operating-points-v2 = <&dp_opp_table>;
> +
> +	power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +	pinctrl-0 = <&dp0_hot_plug_det>;
> +	pinctrl-names = "default";
> +
> +	dp_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-162000000 {
> +			opp-hz = /bits/ 64 <162000000>;
> +
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-270000000 {
> +			opp-hz = /bits/ 64 <270000000>;
> +
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-540000000 {
> +			opp-hz = /bits/ 64 <540000000>;
> +
> +			required-opps = <&rpmhpd_opp_svs_l1>;
> +		};
> +
> +		opp-810000000 {
> +			opp-hz = /bits/ 64 <810000000>;
> +
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +};
> +
> +&mdss_dp1 {
> +	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
> +		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
> +	clock-names = "core_iface",
> +		      "core_aux",
> +		      "ctrl_link",
> +		      "ctrl_link_iface",
> +		      "stream_pixel",
> +		      "stream_1_pixel",
> +		      "stream_2_pixel",
> +		      "stream_3_pixel";
> +
> +	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
> +			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
> +			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
> +	assigned-clock-parents = <&dp1_phy 0>,
> +				 <&dp1_phy 1>,
> +				 <&dp1_phy 1>;
> +
> +	phys = <&dp1_phy>;
> +	phy-names = "dp";
> +
> +	operating-points-v2 = <&dp1_opp_table>;
> +
> +	power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +	pinctrl-0 = <&dp1_hot_plug_det>;
> +	pinctrl-names = "default";
> +
> +	dp1_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-162000000 {
> +			opp-hz = /bits/ 64 <162000000>;
> +
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-270000000 {
> +			opp-hz = /bits/ 64 <270000000>;
> +
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-540000000 {
> +			opp-hz = /bits/ 64 <540000000>;
> +
> +			required-opps = <&rpmhpd_opp_svs_l1>;
> +		};
> +
> +		opp-810000000 {
> +			opp-hz = /bits/ 64 <810000000>;
> +
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +};
> +
> +&mdss1 {
> +	power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
> +
> +	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +		 <&nwgcc NW_GCC_DISP_1_HF_AXI_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
> +
> +	resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
> +
> +	interconnects = <&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +			 &config_noc SLAVE_DISPLAY_1_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +	interconnect-names = "mdp0-mem",
> +			     "cpu-cfg";
> +
> +	dp2_phy: phy@fc9a00 {
> +		compatible = "qcom,nord-dp-phy";
> +		reg = <0x0 0x0fc9a00 0x0 0x1d0>,
> +		      <0x0 0x0fc9200 0x0 0x128>,
> +		      <0x0 0x0fc9600 0x0 0x128>,
> +		      <0x0 0x0fc9000 0x0 0x200>;
> +
> +		clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +			 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +			 <&tcsrcc TCSR_DP_TX_2_CLKREF_EN>;
> +		clock-names = "aux",
> +			      "cfg_ahb",
> +			      "ref";
> +
> +		#clock-cells = <1>;
> +		#phy-cells = <0>;
> +
> +		power-domains = <&rpmhpd RPMHPD_MX>;
> +
> +		status = "disabled";
> +	};
> +
> +	dp3_phy: phy@fcca00 {
> +		compatible = "qcom,nord-dp-phy";
> +		reg = <0x0 0x0fcca00 0x0 0x200>,
> +		      <0x0 0x0fcc200 0x0 0xd0>,
> +		      <0x0 0x0fcc600 0x0 0xd0>,
> +		      <0x0 0x0fcc000 0x0 0x1c8>;
> +
> +		clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
> +			 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +			 <&tcsrcc TCSR_DP_TX_3_CLKREF_EN>;
> +		clock-names = "aux",
> +			      "cfg_ahb",
> +			      "ref";
> +
> +		#clock-cells = <1>;
> +		#phy-cells = <0>;
> +
> +		power-domains = <&rpmhpd RPMHPD_MX>;
> +
> +		status = "disabled";
> +	};
> +};
> +
> +&mdss1_mdp {
> +	clocks = <&nwgcc NW_GCC_DISP_1_HF_AXI_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +	clock-names = "nrt_bus",
> +		      "iface",
> +		      "lut",
> +		      "core",
> +		      "vsync";
> +
> +	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +	assigned-clock-rates = <19200000>;
> +
> +	operating-points-v2 = <&mdp1_opp_table>;
> +
> +	power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +	mdp1_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-417000000 {
> +			opp-hz = /bits/ 64 <417000000>;
> +			required-opps = <&rpmhpd_opp_svs_l1>;
> +		};
> +
> +		opp-532000000 {
> +			opp-hz = /bits/ 64 <532000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +
> +		opp-650000000 {
> +			opp-hz = /bits/ 64 <650000000>;
> +			required-opps = <&rpmhpd_opp_turbo>;
> +		};
> +
> +		opp-710000000 {
> +			opp-hz = /bits/ 64 <710000000>;
> +			required-opps = <&rpmhpd_opp_turbo_l1>;
> +		};
> +	};
> +};
> +
> +&mdss1_dp0 {
> +	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
> +	clock-names = "core_iface",
> +		      "core_aux",
> +		      "ctrl_link",
> +		      "ctrl_link_iface",
> +		      "stream_pixel",
> +		      "stream_1_pixel",
> +		      "stream_2_pixel",
> +		      "stream_3_pixel";
> +
> +	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
> +			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
> +			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
> +	assigned-clock-parents = <&dp2_phy 0>,
> +				 <&dp2_phy 1>,
> +				 <&dp2_phy 1>,
> +				 <&dp2_phy 1>,
> +				 <&dp2_phy 1>;
> +
> +	phys = <&dp2_phy>;
> +	phy-names = "dp";
> +
> +	operating-points-v2 = <&dp2_opp_table>;
> +
> +	power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +	pinctrl-0 = <&dp2_hot_plug_det>;
> +	pinctrl-names = "default";
> +
> +	dp2_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-162000000 {
> +			opp-hz = /bits/ 64 <162000000>;
> +
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-270000000 {
> +			opp-hz = /bits/ 64 <270000000>;
> +
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-540000000 {
> +			opp-hz = /bits/ 64 <540000000>;
> +
> +			required-opps = <&rpmhpd_opp_svs_l1>;
> +		};
> +
> +		opp-810000000 {
> +			opp-hz = /bits/ 64 <810000000>;
> +
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +};
> +
> +&mdss1_dp1 {
> +	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
> +		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
> +	clock-names = "core_iface",
> +		      "core_aux",
> +		      "ctrl_link",
> +		      "ctrl_link_iface",
> +		      "stream_pixel",
> +		      "stream_1_pixel",
> +		      "stream_2_pixel",
> +		      "stream_3_pixel";
> +
> +	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
> +			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
> +			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
> +	assigned-clock-parents = <&dp3_phy 0>,
> +				 <&dp3_phy 1>,
> +				 <&dp3_phy 1>;
> +
> +	phys = <&dp3_phy>;
> +	phy-names = "dp";
> +
> +	operating-points-v2 = <&dp3_opp_table>;
> +
> +	power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +	pinctrl-0 = <&dp3_hot_plug_det>;
> +	pinctrl-names = "default";
> +
> +	dp3_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-162000000 {
> +			opp-hz = /bits/ 64 <162000000>;
> +
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-270000000 {
> +			opp-hz = /bits/ 64 <270000000>;
> +
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-540000000 {
> +			opp-hz = /bits/ 64 <540000000>;
> +
> +			required-opps = <&rpmhpd_opp_svs_l1>;
> +		};
> +
> +		opp-810000000 {
> +			opp-hz = /bits/ 64 <810000000>;
> +
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +};
> +
>  &qupv3_0 {
>  	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
>  		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
> @@ -903,10 +1386,10 @@ dispcc1: clock-controller@8d00000 {
>  			 <0>,
>  			 <0>,
>  			 <0>,
> -			 <0>,
> -			 <0>,
> -			 <0>,
> -			 <0>,
> +			 <&dp2_phy 0>,
> +			 <&dp2_phy 1>,
> +			 <&dp3_phy 0>,
> +			 <&dp3_phy 1>,
>  			 <0>,
>  			 <0>,
>  			 <0>,
> @@ -970,10 +1453,10 @@ dispcc0: clock-controller@af00000 {
>  			 <0>,
>  			 <0>,
>  			 <0>,
> -			 <0>,
> -			 <0>,
> -			 <0>,
> -			 <0>,
> +			 <&dp0_phy 0>,
> +			 <&dp0_phy 1>,
> +			 <&dp1_phy 0>,
> +			 <&dp1_phy 1>,
>  			 <0>,
>  			 <0>,
>  			 <0>,
> @@ -1106,6 +1589,30 @@ nsp_data_noc_3: interconnect@1fe00000 {
>  };
>  
>  &tlmm {
> +	dp0_hot_plug_det: dp0-hot-plug-det-state {
> +		pins = "gpio51";
> +		function = "edp0_hot";
> +		bias-disable;
> +	};
> +
> +	dp1_hot_plug_det: dp1-hot-plug-det-state {
> +		pins = "gpio52";
> +		function = "edp1_hot";
> +		bias-disable;
> +	};
> +
> +	dp2_hot_plug_det: dp2-hot-plug-det-state {
> +		pins = "gpio53";
> +		function = "edp2_hot";
> +		bias-disable;
> +	};
> +
> +	dp3_hot_plug_det: dp3-hot-plug-det-state {
> +		pins = "gpio54";
> +		function = "edp3_hot";
> +		bias-disable;
> +	};
> +
>  	qup_i2c0_default: qup-i2c0-default-state {
>  		pins = "gpio111", "gpio112";
>  		function = "qup0_se0";
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index 926ccf3bbe4e..73136c27bac1 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -1727,6 +1727,139 @@ compute-cb@6 {
>  			};
>  		};
>  
> +		/* Display subsystem nodes - MDSS1, DP-only (no DSI) */
> +		mdss1: display-subsystem@8c00000 {
> +			compatible = "qcom,nord-mdss";
> +			reg = <0x0 0x08c00000 0x0 0x1000>;
> +			reg-names = "mdss";
> +
> +			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			iommus = <&apps_smmu_1 0x400 0x2>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			mdss1_mdp: display-controller@8c01000 {
> +				compatible = "qcom,nord-dpu";
> +				reg = <0x0 0x08c01000 0x0 0x8f000>,
> +				      <0x0 0x08cb0000 0x0 0x3000>;
> +				reg-names = "mdp",
> +					    "vbif";
> +
> +				interrupt-parent = <&mdss1>;
> +				interrupts = <0>;
> +
> +				#address-cells = <2>;
> +				#size-cells = <2>;
> +				ranges;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dpu1_intf0_out: endpoint {
> +							remote-endpoint = <&mdss1_dp0_in>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dpu1_intf4_out: endpoint {
> +							remote-endpoint = <&mdss1_dp1_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss1_dp0: displayport-controller@8d54000 {
> +				compatible = "qcom,nord-dp";
> +				reg = <0x0 0x08d54000 0x0 0x200>,
> +				      <0x0 0x08d54200 0x0 0x200>,
> +				      <0x0 0x08d55000 0x0 0xc00>,
> +				      <0x0 0x08d56000 0x0 0x400>,
> +				      <0x0 0x08d57000 0x0 0x400>,
> +				      <0x0 0x08d58000 0x0 0x400>,
> +				      <0x0 0x08d59000 0x0 0x400>,
> +				      <0x0 0x08d5a000 0x0 0x600>,
> +				      <0x0 0x08d5b000 0x0 0x600>;
> +
> +				interrupts-extended = <&mdss1 12>;
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss1_dp0_in: endpoint {
> +							remote-endpoint = <&dpu1_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss1_dp0_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss1_dp1: displayport-controller@8d5c000 {
> +				compatible = "qcom,nord-dp";
> +				reg = <0x0 0x08d5c000 0x0 0x200>,
> +				      <0x0 0x08d5c200 0x0 0x200>,
> +				      <0x0 0x08d5d000 0x0 0xc00>,
> +				      <0x0 0x08d5e000 0x0 0x400>,
> +				      <0x0 0x08d5f000 0x0 0x400>,
> +				      <0x0 0x08d60000 0x0 0x400>,
> +				      <0x0 0x08d61000 0x0 0x400>,
> +				      <0x0 0x08d62000 0x0 0x600>,
> +				      <0x0 0x08d63000 0x0 0x600>;
> +
> +				interrupts-extended = <&mdss1 13>;
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss1_dp1_in: endpoint {
> +							remote-endpoint = <&dpu1_intf4_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss1_dp1_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +		};
> +
>  		ipcc0: mailbox@9007000 {
>  			compatible = "qcom,nord-ipcc",
>  				     "qcom,ipcc";
> @@ -1737,6 +1870,139 @@ ipcc0: mailbox@9007000 {
>  			#mbox-cells = <2>;
>  		};
>  
> +		/* Display subsystem nodes - MDSS 12.1, DP-only (no DSI) */
> +		mdss: display-subsystem@ae00000 {
> +			compatible = "qcom,nord-mdss";
> +			reg = <0x0 0x0ae00000 0x0 0x1000>;
> +			reg-names = "mdss";
> +
> +			interrupts = <GIC_SPI 930 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			iommus = <&apps_smmu_1 0x3e0 0x2>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,nord-dpu";
> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> +				      <0x0 0x0aeb0000 0x0 0x3000>;
> +				reg-names = "mdp",
> +					    "vbif";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;
> +
> +				#address-cells = <2>;
> +				#size-cells = <2>;
> +				ranges;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dpu_intf4_out: endpoint {
> +							remote-endpoint = <&mdss_dp1_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss_dp0: displayport-controller@af54000 {
> +				compatible = "qcom,nord-dp";
> +				reg = <0x0 0x0af54000 0x0 0x200>,
> +				      <0x0 0x0af54200 0x0 0x200>,
> +				      <0x0 0x0af55000 0x0 0xc00>,
> +				      <0x0 0x0af56000 0x0 0x400>,
> +				      <0x0 0x0af57000 0x0 0x400>,
> +				      <0x0 0x0af58000 0x0 0x400>,
> +				      <0x0 0x0af59000 0x0 0x400>,
> +				      <0x0 0x0af5a000 0x0 0x600>,
> +				      <0x0 0x0af5b000 0x0 0x600>;
> +
> +				interrupts-extended = <&mdss 12>;
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss_dp0_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss_dp1: displayport-controller@af5c000 {
> +				compatible = "qcom,nord-dp";
> +				reg = <0x0 0x0af5c000 0x0 0x200>,
> +				      <0x0 0x0af5c200 0x0 0x200>,
> +				      <0x0 0x0af5d000 0x0 0xc00>,
> +				      <0x0 0x0af5e000 0x0 0x400>,
> +				      <0x0 0x0af5f000 0x0 0x400>,
> +				      <0x0 0x0af60000 0x0 0x400>,
> +				      <0x0 0x0af61000 0x0 0x400>,
> +				      <0x0 0x0af62000 0x0 0x600>,
> +				      <0x0 0x0af63000 0x0 0x600>;
> +
> +				interrupts-extended = <&mdss 13>;
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss_dp1_in: endpoint {
> +							remote-endpoint = <&dpu_intf4_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss_dp1_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,nord-pdc",
>  				     "qcom,pdc";
> -- 
> 2.43.0
> 
