Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514992E0901
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315558; cv=none; b=VozbsPhG4CEvqh89iqoVziS2I/w6dp9I8DCh8PRU8qdsa6JTlr508avq9ympabpv+2V6JMMN0uI5LvlqTVbTEpo5qQCB/+lfaqCsybpC1KXKQRC6NyZRcjV2r2jDm86oQTbwVFqGS0bshaE4qruhzuRtBedZeT9foRBxzQBgQHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315558; c=relaxed/simple;
	bh=+fAPpI8XseDU+6+0+RtYGTb+1GD4gDCQcjGyNZdkMZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyEGlxHfs/Sms+WrFSK8Tn+mBK+AeahaGXYm9laf9RxDYJlGAuOm/tJjplrs4XBVWX/cyXd/4ydvsM/gXUpfc6eCIZaC4F+iAR4ski/XzvbZ56dAZ2NdNNyejWUcjjPqjAcatiSWqu1mbTB8y7ep02C0TqQMBoAPZ3E5XdaKjxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVgJBXqb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsZQGhIv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVgJBXqb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsZQGhIv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqWbZ2831807
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QCMAOd0oXwbfp37bMDassmgE
	guc4elFKX6KAbbU+uPk=; b=YVgJBXqbqJOCRO9pDtsviH1fILPSWLSSDVy5/JXQ
	AF2u8Lmt9Itj0BDZdEcn4FYd3K7KbailcluILW6M92YZtRlvyP9ZEfPAGXxSLyZF
	gcQGGMqD+pZivNFoM3XydjdV+NiiPWCtGDhl6UTi2+Y7m3xFWZKmN1Y21nVLC5Kb
	wLZZHB9nPMCX3uHwJ7j3T2AjFqsAuwM39cpE5X4X1LLDm8ySah4J7/wRlgBU69UX
	qEFX14hMak+w7ilibGregE3erE3htTf/hQmgAuKiXsItmsvtyKk6e9j8u1C8LxE+
	g8wHYHOug1RPpsy3D8L8WSUwiB4FqHq4Yx34Cx11eTHRGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jtb2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:25:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so367848341cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774315555; x=1774920355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QCMAOd0oXwbfp37bMDassmgEguc4elFKX6KAbbU+uPk=;
        b=UsZQGhIvuchRBXq29RK8x6BcIncRJ2BTt3p4kRXOfOWnVU6r06bk14iQYdeYmw1qUz
         agkhnboMO8tWXEszDZ4VdzqQRnpwO4NGTPFSFz6wi3OHTDECOLUKnzfK4MqXTTBmGW2/
         BdchWcdeiDA8dlMjxdzM/KLcSw/gSGgN3A2IoNxB+Qvug7vbsX0Do8orWJjQ3reW6m5p
         52jV8AeCdyvMLY/mykGHKhOC8uHdbqApbdnQXEsVLQ/MtVlrCL7rSCs0GnkaWoKY3Qey
         19FI8PiTIkPHj3xTkry7TA2VtQ6+CykOtBj+mfoID+9507nsBbV+pZAvdHV1rLbcHCVD
         Cd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774315555; x=1774920355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCMAOd0oXwbfp37bMDassmgEguc4elFKX6KAbbU+uPk=;
        b=QrKv13o11esrEjDQHPKVxuT1qw+he63jwjNH5c934Fmfq/tgz75lfT4ZnmV8do4gK0
         PzX1UTuyUzuHK4msgsWPcmdcGFMCiWrbUUukJu3yOHIzwwFUr04xJhbZiWoBADTQceGu
         HdcULQEr25uxwJhUzTnvEGt5cVQ189oO1aJTm3j9HIV0s7HuR4c5ZnhibQeVqZZD+zP2
         xGR25PsSLeWfOFaKHzORMVqfxMOws/cSvzVoJQuxS5iY+U+xKZTjbmgSOpETFIp2x1Mz
         J+uhfD2z1tV/8jSX+ZzoBeMWAueeLPtumbn6gCjMMySPnGLfgWIkvgElYaoZhR4KEmKC
         bLVg==
X-Forwarded-Encrypted: i=1; AJvYcCWkI1aFtPLg44Y547MKTWzNZQfqx4Ghzpcv461sciBJxXxR8ZaTqL1nMPFEvohQJ4y0Z2y0CciMap4Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd4Y1r2WxECw2nSgti0/VjX6ezmOBnsTjXb2/J3qjTnANSt2om
	lk5GWnMSsnjs+5ASehjqMKVtpJIPRlN9Tw53BjQcIEONdflJxAjSL/EDDCZ8SWSOjOObZ2wLjF8
	6dlceZKjLvi6v1611xlUyeZm11ImKH7v/nQo8g+Wot4lg/tH+MFLEc3e1Y5+2gWX0
X-Gm-Gg: ATEYQzy9pgHMjKdZtYWV0q3lbIEE7uYGCgn2mhOuKL2Kf8urSplZsfPVn2e8dkQ3K9W
	np/jYELEFtyfu3ZvY0Ippz6mSZ0OUwUDGnMvcIfFEArNbLZJ2lBcgCqBqPGCbG+LU8pfsONIdzs
	DgWh1s3jWKlwHf2uxZYVxa9nG/X8rCeEPhZ8BSyHxTVzGkLJrSRKW2UAACefnDnB67PRoec8igt
	zvN6Tx0fwoLQYiF8mIJejfatcD6noLlGG0DNN8gwZvNgOaz2VawgAIlBc4v/ALv+vBwuoo6EZ03
	rCFezhB+KRIpjvHyyW08sMsDOTS9WXVzx9LbXM8UtY3jMpAHT881y4fOkdxYdJKd/tA2Rm1vwa7
	5knTNUAsq6QPew8QXBL64znty/kckPu+Fa8Am2Zo4CwOaYdwDOzxhELVOgbDQ75Vk/LDgf9tXiw
	fSQDalVZsWAcqdhYK0HJ08UrdImjpYoqlUln8=
X-Received: by 2002:ac8:5a8f:0:b0:50b:4b2f:160f with SMTP id d75a77b69052e-50b4b2f1a74mr153890011cf.2.1774315555377;
        Mon, 23 Mar 2026 18:25:55 -0700 (PDT)
X-Received: by 2002:ac8:5a8f:0:b0:50b:4b2f:160f with SMTP id d75a77b69052e-50b4b2f1a74mr153889691cf.2.1774315554786;
        Mon, 23 Mar 2026 18:25:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa3575sm31492721fa.30.2026.03.23.18.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:25:52 -0700 (PDT)
Date: Tue, 24 Mar 2026 03:25:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: kaanapali-mtp: Enable display DSI
 devices
Message-ID: <d63azyfpltbsicmmv6xjz2myttfkcwalm6akhbgk54i7udi2pe@mbztt2kz7r7s>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-6-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-knp-pmic-dt-v1-6-70bc40ea4428@oss.qualcomm.com>
X-Proofpoint-GUID: LARHtbwGHt0yezHSW-bbEjvjIpjIOB_l
X-Proofpoint-ORIG-GUID: LARHtbwGHt0yezHSW-bbEjvjIpjIOB_l
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c1e824 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=-WTkcuLTe7QwxQcHvqYA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAxMCBTYWx0ZWRfX+c07kc783hwp
 lgjBu7BAZRasOikpgyA+GHYAytA7MvkBygljEVx9JUFew8jHuenqJv30t2HtTFAu3fwylxUnUtO
 R+Dlfh3dkcXUpeuCWqx+vzdh7UJlB+34RT5s5cGUUMNDChZoZF73fqX1O7mQXX0cr9R8vt1eLVi
 ZjHY+60X81o+OAif0JAkkyjn6EtlksOCQhmWhrAxXvK3aEO9Ot2VmNUX2yWaXJbtUn00dDqqYry
 iRm+IMDZzcrbQ8Hbndqa1QRXTTN2P+rgDYGD23J6qWdiXWac4ggr6R6dHOz7dHab1oG8LMztTAc
 tftZP2vT2e1hZ3V6UaihRkPhiw/avr67rpJPe28O+JgcUgfqjCHvU6jhN7Yl2czavPg+rXNKCgG
 TO43gE+XpFLqbyTpx77jWDyKCrlhotYw2diQ9db1ilxyGGhplri2AhugmF+eyAp4rkDK7Es53jo
 kwdtoVlTFQZnfZ2JYqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240010

On Sun, Mar 22, 2026 at 11:19:46PM -0700, Jingyi Wang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Enable MDSS/DPU/DSI0 and add Novatek NT37801 panel on Kaanapali MTP
> board.
> 
> NT37801 Spec V1.0 chapter "5.7.1 Power On Sequence" states VDDI ranges
> 1.65V~1.95V, but ldo12 ranges 1.2V~1.8V, so change ldo12 range to
> 1.65V~1.8V.
> 
> pmh0110_d_e0_gpios and pmh0110_f_e0_gpios are configured for
> level shifters. Kaanapali need configure these pinctrl for panel
> function.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 118 ++++++++++++++++++++++++++++-
>  1 file changed, 117 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index d0f3909621c9..07247dc98b70 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -375,7 +375,7 @@ vreg_l11b_1p0: ldo11 {
>  
>  		vreg_l12b_1p8: ldo12 {
>  			regulator-name = "vreg_l12b_1p8";
> -			regulator-min-microvolt = <1200000>;
> +			regulator-min-microvolt = <1650000>;

Separate commit, Fixes tag.

>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
>  			regulator-allow-set-load;
> @@ -873,6 +873,51 @@ &lpass_vamacro {
>  	qcom,dmic-sample-rate = <4800000>;
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l1d_1p2>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "novatek,nt37801";
> +		reg = <0>;
> +
> +		pinctrl-0 = <&sde_dsi_active &sde_te_active &sde_esync0_suspend

Why is this esync0_suspend?

> +			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
> +			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
> +		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend &sde_esync0_suspend
> +			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
> +			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
> +		pinctrl-names = "default", "sleep";
> +
> +		vci-supply = <&vreg_l13b_3p0>;
> +		vdd-supply = <&vreg_l11b_1p0>;
> +		vddio-supply = <&vreg_l12b_1p8>;
> +
> +		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			panel0_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel0_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l3d_0p8>;
> +
> +	status = "okay";
> +};
> +
>  &pcie0 {
>  	pinctrl-0 = <&pcie0_default_state>;
>  	pinctrl-names = "default";
> @@ -970,6 +1015,42 @@ bt_default: bt-default-state {
>  	};
>  };
>  
> +&pmh0110_d_e0_gpios {
> +	sde_mdp_vsync_p_1p2_active: sde-mdp-vsync-p-1p2-active-state {

If these are level shifters, should they be configured as a hog? Or
should they be modelled as regulators?

I'm not sure, how do we handle shifters and their supplies.

> +		pins = "gpio9";
> +		function = "paired";
> +		input-disable;
> +		output-enable;
> +		power-source = <2>; /* 1.2v */
> +	};
> +
> +	sde_mdp_vsync_p_1p8_active: sde-mdp-vsync-p-1p8-active-state {
> +		pins = "gpio10";
> +		function = "paired";
> +		input-enable;
> +		output-disable;
> +		power-source = <1>; /* 1.8v */
> +	};
> +};
> +
> +&pmh0110_f_e0_gpios {
> +	sde_disp0_rst_1p2_active: sde-disp0-rst-1p2-active-state {

The same.

> +		pins = "gpio9";
> +		function = "paired";
> +		input-enable;
> +		output-disable;
> +		power-source = <2>; /* 1.2v */
> +	};
> +
> +	sde_disp0_rst_1p8_active: sde-disp0-rst-1p8-active-state {
> +		pins = "gpio10";
> +		function = "paired";
> +		input-disable;
> +		output-enable;
> +		power-source = <1>; /* 1.8v */
> +	};
> +};
> +
>  &pon_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  
> @@ -1128,6 +1209,41 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
>  		bias-disable;
>  	};
>  
> +	sde_te_active: sde-te-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_suspend: sde-te-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

It's the same as _active. Merge them.

> +
> +	sde_esync0_suspend: sde-esync0-suspend-state {
> +		pins = "gpio88";
> +		function = "mdp_esync0_out";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_dsi_active: sde-dsi-active-state {

panel-reset-active-state

> +		pins = "gpio98";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_suspend: sde-dsi-suspend-state {
> +		pins = "gpio98";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>  	key_vol_up_default: key-vol-up-default-state {
>  		pins = "gpio101";
>  		function = "gpio";
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
