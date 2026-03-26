Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796DE34B40F
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774498949; cv=none; b=BK7sVgE7FEU0Y6PT0L5GdSePEEDC3tKN+RkwlrnNxD8Gw/o8Tc2+cW36fpVj0vTehlD/E0nuhoL9ZOFZMHeJriZxZtb+tn8Ho25rC7oyLRK8rN3Q27rlv6rBObkRUxwlzEpJBeKsJuiigXUZKGBz6+E2gELYfRjGRGyW82R6GlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774498949; c=relaxed/simple;
	bh=DpbjOVL9KW6mz92GKHJ/JGzDnk/kXwlGDmjSln2siVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qy4K+u/UppdLocArdTPCituLG8r+nNKIoIlCbUn1sBaxPF1cf8I/uIZrKAMVRiixGBMC2MJZFxuiFmVQWqgh2K4mbdDiNbpI9lf5QjqFXkSO0MxiokQEQzdqGnHgup6OK56QgmlVmtQnJTlPJNO2tjpevzytGnHepe6AkUDa1mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNQkhxxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DeKIoGny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNQkhxxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DeKIoGny"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKfvew1965106
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bUZ9uiLt/zZmMoiRl1JEaoB2
	h/izn0EBTJSBldTsRtw=; b=LNQkhxxnWogMVeUhDZmAwxAhsVM8YpPUxdEyQfY4
	JCNRGVV9mklu5sOUpJXegCtqptPrYyUzjQeeypLO7VWZiW2fAHx01M7gTF8vqiTP
	TDF9iZXuIOapoqi/cNU6mCAiPe6w6VUjf79nKwZ/sWu7L9OiX/qgBDHv4p8VvHu2
	GFX9E0ALDF0vbnvsifSA0ZLqROdgHtbEgi9h0amg7vcbRRJUOSgxKuOnZsd0hyL5
	5+mHZwSacIko0cOPNX8r1jrdCaTBoq4hKXJtyGIYiwZkdYSTRDYOxnk1F3xsXj1u
	gm/eHEV54FkdcCHiV88e7aJo+PBmx37KI2JrdgPXMY6e8g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymh5n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:22:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b274f94f8so12139711cf.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 21:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774498946; x=1775103746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bUZ9uiLt/zZmMoiRl1JEaoB2h/izn0EBTJSBldTsRtw=;
        b=DeKIoGnyPtnM9g59Mc/tQF9j8GzNzL2mOkvJbzVbfFsjcsK6FgjOI3aQ9APvhlkQ7p
         IgM7/3+jH5mZtQi8/Kdz2/PSolX1H+SxyvNrkWpFpbByA3Qv9O4Z1UAn826Wg+AS0Sns
         CRFqtXgOG5oFP8FU15o0wY+bYC7HiM1Cx0oA0CDJ1UaxgjqeQtRR7gSfDJY9MzoreIRy
         pB/2KM6LaNIOOrKGTep8xx5Vee+79vn6/Sw9zsL1Jtp9D9uvJuhnM0u/HLIRGMJom7kB
         fV37Z5i+d7EpT+50Lmq4pBDcsKdwkX6A9ZechrOtTOh8IETKoXm7MGjCxXbqULGaL57S
         iZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774498946; x=1775103746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUZ9uiLt/zZmMoiRl1JEaoB2h/izn0EBTJSBldTsRtw=;
        b=m6g7e3Ohms8+snZRGVRYuQL5evNk5ctd4AYjpOC1vSdKMAFCnseAPhk/jjt1rnLtU1
         bFdPzAaTCim5VFlIgbaNs9xBM8YESowAt1CrOrFUXzEzYw0nDr2iQDKhOZgeLEAFlyg7
         vThazDiqRYCH0yrdipxAg4Tvgy4lUGwloclHjXjdXqT1NHM0c6V2jNZmzC1Vq6uolS8+
         AZzHKVQYwc12um8UD7ivih/oRrrRVFB5PrqX4bhezxTx6fIsmE+ga8pb0HnA3w+Z4g9X
         S6RPp0sptBWE3IDXNa69/Ce2xVO+hmGZwBZzBaJ2FcUFpt13Z/wji6c2M1H8qG3pJdYW
         IgCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUOZoHIQ48lgoBkHRbF0OB6dqN7kht8iLunB70eeAzvTsA0pYa04KXMsGuoI4DgXnIr3D1O4P5EHAU@vger.kernel.org
X-Gm-Message-State: AOJu0YwKWx/AmD/mPd1SP4PAZVgkznd39xoBZ25j94E1VZ9dXZKMdSJu
	17CuFUMyaPwKutkSb2EtFEzPpxZgu/InbkBo1pR2RK44XpZYPEFXsqY29hB2BPkbhxFgDGgF0qh
	lqApt93Ln/V08GwEObpRCfwAT/GiAgGhgQQbV3vXWVPzJvMCUJTUNfLDG6ZQJDLkdZ42vgTVz
X-Gm-Gg: ATEYQzzwpsIRCp2g2fbQdIJkvQoeofTzHvIYVhKGHjobXqxoYvKI9OuJTTA57Ke23Mo
	4Y64KEgp47BH2hAEyzkX0lilX8X/+4MelNIWJJnvfiDp5AI8Uun/F+C7pFTd28q++n1QSTSHKPv
	opaht31hdtmaCsWCiFx0mc6jbZZwC1SKOUBEZEWiqiteKe7LRn6g3JT8Th4UlIPyEcIWEdHATjV
	BBQ3zswMzuqdCFXeNwJzG7UU/5dMfPiplPzTXB5mp0fWDigUgQLRYVXJ4o4BnCt5aQjd0uRce3j
	hSEpVYLy7pdyjOCDYBEBvLCEH92puNwnRnOIet0AqpKpIWrHokp1uxG9lVWJYpc11V7Ch/EK5wP
	EuC7nnPW4AG2N/y/g0cxpw1bC/Yc5hmW/7sdShKR+QGo2iTJ5iIE+Asw/hxKIh2vYNeMB8NYGfq
	PEcjmg7yy6GVP16FcHe9gpT3/c70oyG2f6i/E=
X-Received: by 2002:a05:622a:355:b0:509:1657:a19d with SMTP id d75a77b69052e-50b993dfb58mr1050031cf.15.1774498945608;
        Wed, 25 Mar 2026 21:22:25 -0700 (PDT)
X-Received: by 2002:a05:622a:355:b0:509:1657:a19d with SMTP id d75a77b69052e-50b993dfb58mr1049821cf.15.1774498945112;
        Wed, 25 Mar 2026 21:22:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a063ef50sm317734e87.11.2026.03.25.21.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:22:23 -0700 (PDT)
Date: Thu, 26 Mar 2026 06:22:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Message-ID: <tcpxnsxhw65srdgh6ledpwzxwwyal26p7j6z2pyafhirkaxjxk@q3hyor3fomnq>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-6-70bc40ea4428@oss.qualcomm.com>
 <d63azyfpltbsicmmv6xjz2myttfkcwalm6akhbgk54i7udi2pe@mbztt2kz7r7s>
 <acSkaneJtwLwNgiA@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acSkaneJtwLwNgiA@yuanjiey.ap.qualcomm.com>
X-Proofpoint-ORIG-GUID: XPOTr9fOJSQpU5ngOjHabrU0hg8T_tzD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMSBTYWx0ZWRfX38qTY3MhE2mh
 tPQpJEFRQyWKBdLYT5ImtRzrOeonunbK+xv7dQUnMgTDeW21DNSWUPBrvzjXmBsjbhuluzogKwG
 rfrMYTnmJyBnLw70ayu0tKd7MsnDOw4XbkEOX7enw5VbypVtgVYW02P05h+n/ivbBrRmom2oLnO
 8p0fb+Iui8jbQYojJWG+S5z2n4MLi26ftunyAVYfHiRHMTJHOPALWlmthtDXgBJFsM73CdDmfyq
 wD3ORPht1TZNrvJc7hxqbBilAljvQOLe5IvunBn7tRE8UFtbMVgTIDSGnbG5DwCtad8lUFV8EBB
 8qenHFdOC1f+kmheYW7KilTwhJR4uXA8xzk6DDtiIjYjBMJZH4fUkWS91ee9Rv7l0bZ79fsBIEQ
 CeyS1IG0/D0vT42gDCpUhbYPcntuM6FQU9iR+SLM6Zzs6hwj/3wtEHX0jIJ/u5gBr1FoqmgEhRX
 13TNmla2zsWHM1XKN3A==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c4b482 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=05Y0sP17Y2QLH17aK_0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: XPOTr9fOJSQpU5ngOjHabrU0hg8T_tzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260031

On Thu, Mar 26, 2026 at 11:13:46AM +0800, yuanjiey wrote:
> On Tue, Mar 24, 2026 at 03:25:49AM +0200, Dmitry Baryshkov wrote:
> > On Sun, Mar 22, 2026 at 11:19:46PM -0700, Jingyi Wang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > Enable MDSS/DPU/DSI0 and add Novatek NT37801 panel on Kaanapali MTP
> > > board.
> > > 
> > > NT37801 Spec V1.0 chapter "5.7.1 Power On Sequence" states VDDI ranges
> > > 1.65V~1.95V, but ldo12 ranges 1.2V~1.8V, so change ldo12 range to
> > > 1.65V~1.8V.
> > > 
> > > pmh0110_d_e0_gpios and pmh0110_f_e0_gpios are configured for
> > > level shifters. Kaanapali need configure these pinctrl for panel
> > > function.
> > > 
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 118 ++++++++++++++++++++++++++++-
> > >  1 file changed, 117 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> > > index d0f3909621c9..07247dc98b70 100644
> > > --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> > > +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> > > @@ -375,7 +375,7 @@ vreg_l11b_1p0: ldo11 {
> > >  
> > >  		vreg_l12b_1p8: ldo12 {
> > >  			regulator-name = "vreg_l12b_1p8";
> > > -			regulator-min-microvolt = <1200000>;
> > > +			regulator-min-microvolt = <1650000>;
> > 
> > Separate commit, Fixes tag.
> > 
> > >  			regulator-max-microvolt = <1800000>;
> > >  			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> > >  			regulator-allow-set-load;
> > > @@ -873,6 +873,51 @@ &lpass_vamacro {
> > >  	qcom,dmic-sample-rate = <4800000>;
> > >  };
> > >  
> > > +&mdss {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&mdss_dsi0 {
> > > +	vdda-supply = <&vreg_l1d_1p2>;
> > > +	status = "okay";
> > > +
> > > +	panel@0 {
> > > +		compatible = "novatek,nt37801";
> > > +		reg = <0>;
> > > +
> > > +		pinctrl-0 = <&sde_dsi_active &sde_te_active &sde_esync0_suspend
> > 
> > Why is this esync0_suspend?
> 
> I check downstream sde_esync0_suspend and sde_esync0_active is same config in kaanapali,
> maybe I need rename a proper name for these pinctrl.

Yes, please.

>  
> > > +			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
> > > +			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
> > > +		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend &sde_esync0_suspend
> > > +			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
> > > +			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
> > > +		pinctrl-names = "default", "sleep";
> > > +

> > > @@ -970,6 +1015,42 @@ bt_default: bt-default-state {
> > >  	};
> > >  };
> > >  
> > > +&pmh0110_d_e0_gpios {
> > > +	sde_mdp_vsync_p_1p2_active: sde-mdp-vsync-p-1p2-active-state {
> > 
> > If these are level shifters, should they be configured as a hog? Or
> > should they be modelled as regulators?
> > 
> > I'm not sure, how do we handle shifters and their supplies.
> 
> I think regulator-fixed is OK, but if change these pmh0110_d_e0_gpios
> to regulator-fixed, means need to modify the panel driver to accept 
> these changes, is that correct?

The problem is that it is not a panel supply.

The 100% correct, but also 80% (or 95%) overkill solution would be to
define a separate "level-shifter" device sitting between DSI host and
DSI panel and let it consume that regulator.

But, as I wrote, it's a definite overkill, unless we start getting lots
of those and require more precise control.

I'm torn between accepting this solution and asking to stuff those GPIOs
into the GPIO hog.

Probably the current solution is fine, just please add the small comment
before those pins (it's a part of the commit message, but frankly
speaking I missed it when first reviewing the patch).

> 
> I see downstream also directly manipulates these paired GPIOs. 

That's a bad reference. Vendor kernels are frequently full of the
not-well-thought solutions.

> 
-- 
With best wishes
Dmitry
