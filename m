Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53937246788
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774494838; cv=none; b=J513zA+pHINkeLXNd5L9z4y5iGH3uHZdZ4PvLSqJOL6UpGWGZKqrN5W7jJ3G/Ju0d6QeSU9Zaz47iWYmG03iFsuBvmYucWq0g/YJEAarXEaDIgbJE1Uhz9q1TU70zz/JkkzZk8i7lzX19e/D42fALOhBki/DVg4mo/sMWLMtlKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774494838; c=relaxed/simple;
	bh=+2h7xWvh95GDC9boir3Ubc4wLhswNtcV82FRru8dmH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YF41hOOYE8r0tJDTSnhBAQkE7MZhFcAkamr+Nbr1A6T9XyuNteIf7U7tMFmDUSX3Szl55fy9iE56x+HP2MDuXRoydxl3GDGajo0IORH/XLYNUJ/GoQszo7+zgLnbLR7vfvsTHedOcTFxf9j6r49TJ6VQHBkZrmRpPovusLourYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJa48s39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/48IWJ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJa48s39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/48IWJ9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0nxdm1812073
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vi6Tf08P+tXFbv5eab90jwB9
	/3Anqv76V84Jd1wJbWE=; b=YJa48s39ic9J+VAlX1GXMEt1YiOdJkRt/OUbS7hp
	pEqOuL7sbyO5lK56boHO+xyjV/uWNgSu8TiSpPzazI8lXuUonQ9iHQpDvDNe/ApT
	IG9xA7UstqJ54fpb2yuk+OMlcIe5a0ifwMnnzhII2+W0kbnlJTk5JDT0qLdoUy4o
	kJK5Q7DH7nYfGUGS3CvKSl4r6f88GXieM5T8GG6LdH6g3QfaqVhT/jNvoNh0EqiD
	jRNCoZj9pB/i1sEiq/7cOzMtCDLyB15s7STAcif0RHrQobISBylO+8Jx+I3mZjed
	cU7SFjcRHYyfqrGHkBjNLPQZwhYyoUCqC2nzbA+N/UPFzA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn0cjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:13:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so26874071cf.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 20:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774494835; x=1775099635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vi6Tf08P+tXFbv5eab90jwB9/3Anqv76V84Jd1wJbWE=;
        b=O/48IWJ9Hor8njEql9dXWn+lDJMldUpMNVbTBADwodjKLgqaDjPHamb7zKCtTq0WF8
         2K8o81DfAWBw90Nkp4SY/v18VAKJLW3CULQLHm2DiaGa5+SzPYrhD5cuB4I/sN1ue2Xj
         +wwB8mIeIwg8RWC7XEX92m1tkeuXS00EmVbmfz1+oDpILmJUxkSGvh+qqMF57g446oPV
         80Y9yYwlj4vGthbDxcePWsxr2NTqiODc8UX07Pv0QcWVrpa1Rl/riMUN8BskSfEssPoC
         IBDH/qWsZOO5IJk+rjYcKjeyb6/TptL9MANWZyPJsJ1xJFASBP4Vs7K3KrXP8Rbizf1I
         aV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774494835; x=1775099635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vi6Tf08P+tXFbv5eab90jwB9/3Anqv76V84Jd1wJbWE=;
        b=DULGfBZ/K4jXh38UXylN0fIAf7+rATVdSb8c8HolSwkpAjIKAR27E+GetXTOtO1uLA
         tayS4HY3CO72QQ49aJYzLhIdQyqCUuwopVEoZyIZf0TuCSt9W+hi3R7P1sbphoz88p3J
         /H76x/RSgmnz60Kw5mZ1Q/btl+UuG+geqrpCk2gzHboChA3Lh1G6KB7tCYvjtnyfwMxk
         FGOOAYmoquvVa3em2x5m/6tbR44JZaoZrHz9m0jlz9J+HbQww62grVUSaVi1784OqRxA
         l9YeY9+GpzA3kZzOsN34wFV/OBqUs/aK3PHCcDApK/XicNQ++NrBVk/fNi8rvM/IGlpo
         u+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZWU8TzjJFetKiijDhT4u3rotumR9RfZci1aq84gaPtpK2bmMjZ0R5t/vpAw90AlNGj4VB3zfNfQt6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4FpmjQy4ikCLBsMU6QDFZW4UjpnHkByeDxn87OOb2ywDqcMnF
	o30pNp5D33gtLpitw+bPwFMiVB8Df1pEsH3xal6k56o9M6d5jaxjvqIt0lEPgCBiYikce6vmmCH
	ZnbYMoIbIfwCwE6IOljYdPliDxppa7lTnH3Esw2pYojHclu/0fATkF7h//kOLAGpg
X-Gm-Gg: ATEYQzwrYcrV5GD5Ecbiiov2X6AmFjDqfNsVSbPw777awHu/9FG82fUZ9KPluThj9dU
	vAf+Y+fzZoH+WTBhEqodb854hQJTvydIZr+InRI2CJ8SrQRzPg7A646YWnO3qFQ6D8vUo+ag5jv
	vW06rWxuQHS9pSK+42y1qqkLVMJtxvY3jfD2fFC6mmchueV6VADaLxpg/v1FDV1yX8rIcx2iHt9
	JJrkz2R9ZKWokI+oikRzPCgpljQ+lZi9loeWWVNIbC5g7P89r6k7+7GV6AmPjF7vq2IjywiCuqi
	k3t+YVVS+4tet7o+Dbc4ZeG8Lzf8vYSBMktxn5Njq6HNy7moOBpwePX5uOnFgEfMXoCJKARdA+9
	AYgd8h6WvRv2sLLXDeBfdKZwrXxDFawNEl4RApr28v7f8hc926LmFE0urU9GxvLFYKXX+/IIn/G
	fcCfVNyVk=
X-Received: by 2002:ac8:7c4e:0:b0:50b:3e64:9b29 with SMTP id d75a77b69052e-50b80c9bd5dmr87042021cf.14.1774494835378;
        Wed, 25 Mar 2026 20:13:55 -0700 (PDT)
X-Received: by 2002:ac8:7c4e:0:b0:50b:3e64:9b29 with SMTP id d75a77b69052e-50b80c9bd5dmr87041791cf.14.1774494834903;
        Wed, 25 Mar 2026 20:13:54 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b923a7a82sm14173301cf.25.2026.03.25.20.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 20:13:54 -0700 (PDT)
Date: Thu, 26 Mar 2026 11:13:46 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 6/6] arm64: dts: qcom: kaanapali-mtp: Enable display DSI
 devices
Message-ID: <acSkaneJtwLwNgiA@yuanjiey.ap.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-6-70bc40ea4428@oss.qualcomm.com>
 <d63azyfpltbsicmmv6xjz2myttfkcwalm6akhbgk54i7udi2pe@mbztt2kz7r7s>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d63azyfpltbsicmmv6xjz2myttfkcwalm6akhbgk54i7udi2pe@mbztt2kz7r7s>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAyMiBTYWx0ZWRfX8kTyzQEc5DuC
 5pgdaRTV+pDqu+XgN1+7CHHHD3mb1GmEXRfMW752RQttgcLdHESobxEskQV2xuoytpvbn5yJJSu
 lX/CeE1dY+deVTbBk+9XSLJzdj8w0LoT32mh9mMLEmaowo0wBQbRJwZN/g3YBcVZyDDEK2UXpwt
 5FOtbTouHo+aLPDnE2teMu4davk4u2Fxwak05ZQNWYX8BOOM6D9epR6ErV+LSY7ylkic5IsgY0v
 bpa7kdaFzJoVPcALxxEMQmNhkWnpiU3ksIWQ5C2Qpj1Q4vEP4DqRTE0anb24sv42Z1Yn3pfrqIW
 f8gt3m2bk2Wurl13W56pkzcNccDu6muRTZijO5nmQH2478ms0JyDHME/1OCYByOorw/TWzoSVca
 Xdj3sRjL2yRtNm7wLwvO/ICQzFa77nhL5ggt+xuyh6piDgVEb77GS9SkJgRTz32L+arnFxXAw1D
 FJfj0jQuPmftOCt7QoA==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c4a474 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=X_sqsiJlureHGJGUDFUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: b_D2E0PBAr6PlYBYAwVVoJr1sy79-DX9
X-Proofpoint-ORIG-GUID: b_D2E0PBAr6PlYBYAwVVoJr1sy79-DX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260022

On Tue, Mar 24, 2026 at 03:25:49AM +0200, Dmitry Baryshkov wrote:
> On Sun, Mar 22, 2026 at 11:19:46PM -0700, Jingyi Wang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Enable MDSS/DPU/DSI0 and add Novatek NT37801 panel on Kaanapali MTP
> > board.
> > 
> > NT37801 Spec V1.0 chapter "5.7.1 Power On Sequence" states VDDI ranges
> > 1.65V~1.95V, but ldo12 ranges 1.2V~1.8V, so change ldo12 range to
> > 1.65V~1.8V.
> > 
> > pmh0110_d_e0_gpios and pmh0110_f_e0_gpios are configured for
> > level shifters. Kaanapali need configure these pinctrl for panel
> > function.
> > 
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 118 ++++++++++++++++++++++++++++-
> >  1 file changed, 117 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> > index d0f3909621c9..07247dc98b70 100644
> > --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> > @@ -375,7 +375,7 @@ vreg_l11b_1p0: ldo11 {
> >  
> >  		vreg_l12b_1p8: ldo12 {
> >  			regulator-name = "vreg_l12b_1p8";
> > -			regulator-min-microvolt = <1200000>;
> > +			regulator-min-microvolt = <1650000>;
> 
> Separate commit, Fixes tag.
> 
> >  			regulator-max-microvolt = <1800000>;
> >  			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> >  			regulator-allow-set-load;
> > @@ -873,6 +873,51 @@ &lpass_vamacro {
> >  	qcom,dmic-sample-rate = <4800000>;
> >  };
> >  
> > +&mdss {
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dsi0 {
> > +	vdda-supply = <&vreg_l1d_1p2>;
> > +	status = "okay";
> > +
> > +	panel@0 {
> > +		compatible = "novatek,nt37801";
> > +		reg = <0>;
> > +
> > +		pinctrl-0 = <&sde_dsi_active &sde_te_active &sde_esync0_suspend
> 
> Why is this esync0_suspend?

I check downstream sde_esync0_suspend and sde_esync0_active is same config in kaanapali,
maybe I need rename a proper name for these pinctrl.

 
> > +			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
> > +			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
> > +		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend &sde_esync0_suspend
> > +			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
> > +			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
> > +		pinctrl-names = "default", "sleep";
> > +
> > +		vci-supply = <&vreg_l13b_3p0>;
> > +		vdd-supply = <&vreg_l11b_1p0>;
> > +		vddio-supply = <&vreg_l12b_1p8>;
> > +
> > +		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
> > +
> > +		port {
> > +			panel0_in: endpoint {
> > +				remote-endpoint = <&mdss_dsi0_out>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&mdss_dsi0_out {
> > +	remote-endpoint = <&panel0_in>;
> > +	data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&mdss_dsi0_phy {
> > +	vdds-supply = <&vreg_l3d_0p8>;
> > +
> > +	status = "okay";
> > +};
> > +
> >  &pcie0 {
> >  	pinctrl-0 = <&pcie0_default_state>;
> >  	pinctrl-names = "default";
> > @@ -970,6 +1015,42 @@ bt_default: bt-default-state {
> >  	};
> >  };
> >  
> > +&pmh0110_d_e0_gpios {
> > +	sde_mdp_vsync_p_1p2_active: sde-mdp-vsync-p-1p2-active-state {
> 
> If these are level shifters, should they be configured as a hog? Or
> should they be modelled as regulators?
> 
> I'm not sure, how do we handle shifters and their supplies.

I think regulator-fixed is OK, but if change these pmh0110_d_e0_gpios
to regulator-fixed, means need to modify the panel driver to accept 
these changes, is that correct?

I see downstream also directly manipulates these paired GPIOs. 

> > +		pins = "gpio9";
> > +		function = "paired";
> > +		input-disable;
> > +		output-enable;
> > +		power-source = <2>; /* 1.2v */
> > +	};
> > +
> > +	sde_mdp_vsync_p_1p8_active: sde-mdp-vsync-p-1p8-active-state {
> > +		pins = "gpio10";
> > +		function = "paired";
> > +		input-enable;
> > +		output-disable;
> > +		power-source = <1>; /* 1.8v */
> > +	};
> > +};
> > +
> > +&pmh0110_f_e0_gpios {
> > +	sde_disp0_rst_1p2_active: sde-disp0-rst-1p2-active-state {
> 
> The same.
OK.
 
> > +		pins = "gpio9";
> > +		function = "paired";
> > +		input-enable;
> > +		output-disable;
> > +		power-source = <2>; /* 1.2v */
> > +	};
> > +
> > +	sde_disp0_rst_1p8_active: sde-disp0-rst-1p8-active-state {
> > +		pins = "gpio10";
> > +		function = "paired";
> > +		input-disable;
> > +		output-enable;
> > +		power-source = <1>; /* 1.8v */
> > +	};
> > +};
> > +
> >  &pon_resin {
> >  	linux,code = <KEY_VOLUMEDOWN>;
> >  
> > @@ -1128,6 +1209,41 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
> >  		bias-disable;
> >  	};
> >  
> > +	sde_te_active: sde-te-active-state {
> > +		pins = "gpio86";
> > +		function = "mdp_vsync";
> > +		drive-strength = <2>;
> > +		bias-pull-down;
> > +	};
> > +
> > +	sde_te_suspend: sde-te-suspend-state {
> > +		pins = "gpio86";
> > +		function = "mdp_vsync";
> > +		drive-strength = <2>;
> > +		bias-pull-down;
> > +	};
> 
> It's the same as _active. Merge them.
OK.

> > +
> > +	sde_esync0_suspend: sde-esync0-suspend-state {
> > +		pins = "gpio88";
> > +		function = "mdp_esync0_out";
> > +		drive-strength = <2>;
> > +		bias-pull-down;
> > +	};
> > +
> > +	sde_dsi_active: sde-dsi-active-state {
> 
> panel-reset-active-state

OK.
 
Thanks,
Yuanjie



> > +		pins = "gpio98";
> > +		function = "gpio";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> > +
> > +	sde_dsi_suspend: sde-dsi-suspend-state {
> > +		pins = "gpio98";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-pull-down;
> > +	};
> > +
> >  	key_vol_up_default: key-vol-up-default-state {
> >  		pins = "gpio101";
> >  		function = "gpio";
> > 
> > -- 
> > 2.25.1
> > 
> 
> -- 
> With best wishes
> Dmitry
