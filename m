Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C20B3FC5D0
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097246; cv=none; b=n4YmU6u2qWCkRGLaSElT1h3SErXgA8gf3q/mBfJYkAYakl0VZrjoLbyMA5wGoqRryDLB8p5hAdYO6Yq7hwA6xN/eb+KCZR5jzeM+z+6/JYiCDD1dOO4r5auztYH+eh7Ifp9xlG1yL/CshsPi4yz3e5wkvQ0E/RdRKn3Jh2yXzjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097246; c=relaxed/simple;
	bh=WtHdTNpfeybQTFFO+SsfagxgmNRuCkQfaDBWcTdtgkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcKg4VVFxbcYRFfdmiNuH8oTE7HZcxLVQgPYuX2mmqwZhGtOCgx4sfr0TDylXKzo3CDyhY9sxqHEBVOdJbHsq9w2dqrdSTdGX4+klkmz+T8yVe3y5WfVqNdCdYyutCDZBVB7ZY5B/9t4NgSK0hFW/irQt6N6tdSs+U0p10/s6hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNOyOfMG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKy/1bzG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNOyOfMG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKy/1bzG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6779WGmK564797
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 10:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGKn1DILuG7ma71txyhNcdRz
	GhpuhA8J7ogopq81LCc=; b=HNOyOfMGkj3zmHl7LGswRXtRpkYeG8G5zTtFJ4cv
	Yd4Bl9PwmfLXtB4gGgFNLRHI8MMH5qv1WpXopxAfAmuFDYFDkyDEI1cQIcDYtfNr
	uPr58DiAaI6PeAslpFIhMxTj9bzZ7iE6pShq32c70VpFKwec6mbgCuyiwPisoINB
	qwmUjfeMlv6U31bqnNM+P7pvmuo0e6+FR4FtaG3cqnsyhBOMPZdMYU1PQH8w9dSj
	VDM3DlWGmx/2ezaeOHB0+a4aiyzrFQzWhe7dOI3k8Mze/h2hG1z8weKVmPePe/Ky
	K3Kx90lck+ujArddLo4Y8VNTyc4GU305+UrkazwFJLvBVA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwctp844a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 10:07:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so6697493a91.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786097243; x=1786702043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGKn1DILuG7ma71txyhNcdRzGhpuhA8J7ogopq81LCc=;
        b=FKy/1bzGlaD86kXZ+7M+EgS+KzO9DZMPodACRdT8SqY6BqTEnonA4bqbJ3t2S7G10z
         LFOC6JZ9h2AKbq6IMJ+jL/TzIQJSjNomKCRGk7NyOVufiyKhZSWA7qKoAVBTVBUv0wfu
         kVEtCNiq/rcgr5bqHyZB7v/lXdv9FrmaFv0D6PaEY9oErUX+Vji388tBRVuMAowPhnB5
         USn6/fWPiVt3MkbB0foIWzW9rie02S2l7oapqWvaq+vqco+dWjo+5nFu3LbocmS97Flq
         bQNGZLRewCTNlMp6+CBPDh6489KNSO9s9ik7uBE4g6ZLb62jBQ8ibU1ibzFA0szE199R
         c8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097243; x=1786702043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGKn1DILuG7ma71txyhNcdRzGhpuhA8J7ogopq81LCc=;
        b=ZDcwVdhSUSGqtX+d1vtnx0OOfuc2P/6tpdWWFrr30vMM0SrJQPzTHBWde/JHjt/wc8
         TyWpZpFrKfKPD6ttdsVpm5+XOzEti7xksVl9otgceC6sVjB29E7KUwoRjhixex9yfAh6
         4LFYtF0RrUTpW+ZEyJnr+clZr2yqdr1Uf8A9pgQTwrfIbGaXhmJvS0EemZZYpu8S6Q+V
         8gLFP9d+8B6wpxk/6CSXeiH3rWeXiGXS/QpBBZ8LUGVhHIWuHENR3htd0DT/tUVyf1QI
         HgmP16XdPvghAFiVV3Yk42XQ0ND+QBUGweMWETf6xs2q64eZIx1TtOo7geZE+Q67G8BT
         mstw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Oj2xJdjGDapAYx1JCCwCBiFNUnAvFNWa7fUD2UvVqMO58VTs1emObxKA1faJIcEYHrpwA2mnEfEA@vger.kernel.org
X-Gm-Message-State: AOJu0YwsI8ZTAwQeGtR5xcAszS35jNUFkfoyzmF+jslE6sOq6BAaZfJd
	dNPftkMdwLjRWX9mkH4NBJcjXEx5goHpioyPqKKt5lDjKFGWLRe3GzTSRR8gnTsON2U/5u+oXLv
	ahw+NwrUk+HASdi+d0sS3VxpG7yAA6/oXpMvwVQ6LTgya/T2jE59qKkMCQwNm+FcSuiLRGUWW
X-Gm-Gg: AR+sD11xswSEQ26iVb/MkJAyF0nP+Vn2tcUqdzmNubu4E6quArj4pbaLeBTZzo9p6YB
	jJln68zIstzcaetCcq5sdI7dhQjEasq8dJYsTpXgGH+7eLBKPUC9ACXSPn8Se1CZm5RJ31lfCv0
	Gq/6I+2kwogil1YjtUQCP620eLg+qe5EjnVdX3i3EhkAKcYRsQWzoA99a2zEynHl0kdUTC6K5i7
	sEZWj7EfzdOFGyb0ynWxxlGX/odiilPHsYIR+/KP65hTQJBpFpWNwo1XIvHdcYOgpl4LH3es7dV
	M1CulEif0k7kKhzmkB1H9jH9gFjdbdo+Y1zIMcGdhcvFb2wecrmmhDZ0XVaT9akieYcOu72GG4w
	Nimom38sqWzxaUgmhMcHBu1oWlcxz0fWL
X-Received: by 2002:a17:90b:2788:b0:38e:64b0:8bce with SMTP id 98e67ed59e1d1-39262309a8bmr2937176a91.20.1786097242897;
        Fri, 07 Aug 2026 03:07:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:b42:b0:84a:29a7:f64c with SMTP id d2e1a72fcca58-84f5dca8597mr2635471b3a.0.1786096819702;
        Fri, 07 Aug 2026 03:00:19 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3a0f8dsm797513b3a.12.2026.08.07.03.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:00:19 -0700 (PDT)
Date: Fri, 7 Aug 2026 15:30:13 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anUgxo3BPt74Wx7K@baldur>
X-Authority-Analysis: v=2.4 cv=Fp01OWrq c=1 sm=1 tr=0 ts=6a75ae5c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BsdW2ZtP-_8tOCGcOUcA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Qn18vFnaWffBVjS1MSuWF5iHobujYQf9
X-Proofpoint-ORIG-GUID: Qn18vFnaWffBVjS1MSuWF5iHobujYQf9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NyBTYWx0ZWRfX1ZdbzS2rdhqH
 bEWSRg6TU+A1SRsPuy2pG+z3JFQEfe4CtWkXq5RSrPw5mjEa5sCS8eMTbYVKzux1FqeOfeCvkqm
 mjV6WlcMMsUZxiaEFTwE0Ac9ALr+rxJC2klTvj0I23EDouBQhhmQ/SJB5xc5SmLZgmb4TU2WLdH
 U1G2VfjA/358jUmWVkLyHZqaFWTMGWftJWuJ2zfVmG2leeraPwvIyi9UFa8d7vLzfKrJhENzuHv
 E4Y5xOJDBeTe3ZV6QXBN1N9R961kvakg3eSswkv8UjCRmP9r6L3dp+Tr5/bxeYIO2d//CqrI+31
 dz1kKigbZYb/BmtI3/YcloYxNvC9BmMHdGvNpahg3o6TjRa9s4eVF8NGyu2YPtaUDZ34HMp5/YE
 gh1xqF4iwWFWefF2MlmY3Mn6215ZEYvK1rGS83D2Lcq8gHWRukwnlzaU3OFghO4Ai8224DrLftE
 xZ2XisYdbjbbWYxmaGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NyBTYWx0ZWRfXwXX8XDKEC8Fj
 USH1Yz67TZLsOmAZTI/yYfKjxFYpWi8Lp7cbGQKxOhEg+e8SVMUZSHWf8GZ15aV5+/dJZ1U8grl
 f2Ir/MuzLziYdrirHFuvXEm1UqGdqNY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070077

On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > Move the eDP panel configuration and related power, backlight, and pinctrl
> > nodes into a separate overlay. Keep the base DTB suitable for headless
> > variants and provide a composite DTB for headed variants.
> 
> To quote:
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
> """
> Describe your problem. Whether your patch is a one-line bug fix or 5000
> lines of a new feature, there must be an underlying problem that
> motivated you to do this work. Convince the reviewer that there is a
> problem worth fixing and that it makes sense for them to read past the
> first paragraph.
> """
> 
> In fact, I'm not even able to guess what the problem you're fixing here.
> 
> Regards,
> Bjorn
>

The problem is that the base device trees currently describe the eDP
display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
are also available in headless variants without an eDP panel.

With current base DTBs, headless variants are not stable where eDP panel is not
physically connected with board and userspace is trying to use it.

This series fixes the inaccurate hardware description by keeping the
base DTBs limited to hardware common to both variants and moving the
eDP-specific nodes into separate overlays. The base DTB can therefore
be used for headless variants, while the overlay is selected for
headed variants.
 
> > 
> > Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile               |   3 +
> >  arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
> >  3 files changed, 129 insertions(+), 107 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 1c86e7e98f55..bb0da34983c8 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -20,6 +20,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> >  
> > +hamoa-iot-evk-edp-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-edp.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-edp.dtb
> > +
> >  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> >  
> >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
> > new file mode 100644
> > index 000000000000..759d05342627
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
> > @@ -0,0 +1,126 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +&{/} {
> > +	backlight: backlight {
> > +		compatible = "pwm-backlight";
> > +		pwms = <&pmk8550_pwm 0 5000000>;
> > +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> > +		power-supply = <&vreg_edp_bl>;
> > +
> > +		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	vreg_edp_3p3: regulator-edp-3p3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_EDP_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&edp_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_edp_bl: regulator-edp-bl {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VBL9";
> > +		regulator-min-microvolt = <3600000>;
> > +		regulator-max-microvolt = <3600000>;
> > +
> > +		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&edp_bl_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +};
> > +
> > +&mdss_dp3 {
> > +	/delete-property/ #sound-dai-cells;
> > +
> > +	pinctrl-0 = <&edp0_hpd_default>;
> > +	pinctrl-names = "default";
> > +
> > +	status = "okay";
> > +
> > +	aux-bus {
> > +		panel {
> > +			compatible = "edp-panel";
> > +
> > +			backlight = <&backlight>;
> > +			power-supply = <&vreg_edp_3p3>;
> > +
> > +			port {
> > +				edp_panel_in: endpoint {
> > +					remote-endpoint = <&mdss_dp3_out>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&mdss_dp3_out {
> > +	data-lanes = <0 1 2 3>;
> > +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > +
> > +	remote-endpoint = <&edp_panel_in>;
> > +};
> > +
> > +&mdss_dp3_phy {
> > +	vdda-phy-supply = <&vreg_l3j_0p8>;
> > +	vdda-pll-supply = <&vreg_l2j_1p2>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&pmc8380_3_gpios {
> > +	edp_bl_en: edp-bl-en-state {
> > +		pins = "gpio4";
> > +		function = "normal";
> > +		power-source = <1>;
> > +		input-disable;
> > +		output-enable;
> > +	};
> > +
> > +	edp_bl_reg_en: edp-bl-reg-en-state {
> > +		pins = "gpio10";
> > +		function = "normal";
> > +	};
> > +};
> > +
> > +&pmk8550_gpios {
> > +	edp_bl_pwm: edp-bl-pwm-state {
> > +		pins = "gpio5";
> > +		function = "func3";
> > +	};
> > +};
> > +
> > +&pmk8550_pwm {
> > +	status = "okay";
> > +};
> > +
> > +&tlmm {
> > +	edp_reg_en: edp-reg-en-state {
> > +		pins = "gpio70";
> > +		function = "gpio";
> > +		drive-strength = <16>;
> > +		bias-disable;
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > index 9fa86bb6438e..78cefd5391b1 100644
> > --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > @@ -19,16 +19,6 @@ aliases {
> >  		serial1 = &uart14;
> >  	};
> >  
> > -	backlight: backlight {
> > -		compatible = "pwm-backlight";
> > -		pwms = <&pmk8550_pwm 0 5000000>;
> > -		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> > -		power-supply = <&vreg_edp_bl>;
> > -
> > -		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> > -		pinctrl-names = "default";
> > -	};
> > -
> >  	clocks {
> >  		mcp2518fd_osc: clock-40000000 {
> >  			compatible = "fixed-clock";
> > @@ -213,38 +203,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
> >  		};
> >  	};
> >  
> > -	vreg_edp_3p3: regulator-edp-3p3 {
> > -		compatible = "regulator-fixed";
> > -
> > -		regulator-name = "VREG_EDP_3P3";
> > -		regulator-min-microvolt = <3300000>;
> > -		regulator-max-microvolt = <3300000>;
> > -
> > -		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > -		enable-active-high;
> > -
> > -		pinctrl-0 = <&edp_reg_en>;
> > -		pinctrl-names = "default";
> > -
> > -		regulator-boot-on;
> > -	};
> > -
> > -	vreg_edp_bl: regulator-edp-bl {
> > -		compatible = "regulator-fixed";
> > -
> > -		regulator-name = "VBL9";
> > -		regulator-min-microvolt = <3600000>;
> > -		regulator-max-microvolt = <3600000>;
> > -
> > -		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> > -		enable-active-high;
> > -
> > -		pinctrl-0 = <&edp_bl_reg_en>;
> > -		pinctrl-names = "default";
> > -
> > -		regulator-boot-on;
> > -	};
> > -
> >  	vreg_nvme: regulator-nvme {
> >  		compatible = "regulator-fixed";
> >  
> > @@ -974,44 +932,6 @@ &mdss_dp2_out {
> >  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> >  };
> >  
> > -&mdss_dp3 {
> > -	/delete-property/ #sound-dai-cells;
> > -
> > -	pinctrl-0 = <&edp0_hpd_default>;
> > -	pinctrl-names = "default";
> > -
> > -	status = "okay";
> > -
> > -	aux-bus {
> > -		panel {
> > -			compatible = "edp-panel";
> > -
> > -			backlight = <&backlight>;
> > -			power-supply = <&vreg_edp_3p3>;
> > -
> > -			port {
> > -				edp_panel_in: endpoint {
> > -					remote-endpoint = <&mdss_dp3_out>;
> > -				};
> > -			};
> > -		};
> > -	};
> > -};
> > -
> > -&mdss_dp3_out {
> > -	data-lanes = <0 1 2 3>;
> > -	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > -
> > -	remote-endpoint = <&edp_panel_in>;
> > -};
> > -
> > -&mdss_dp3_phy {
> > -	vdda-phy-supply = <&vreg_l3j_0p8>;
> > -	vdda-pll-supply = <&vreg_l2j_1p2>;
> > -
> > -	status = "okay";
> > -};
> > -
> >  &pcie3_port0 {
> >  	vpcie12v-supply = <&vreg_pcie_12v>;
> >  	vpcie3v3-supply = <&vreg_pcie_3v3>;
> > @@ -1140,19 +1060,6 @@ led@2 {
> >  };
> >  
> >  &pmc8380_3_gpios {
> > -	edp_bl_en: edp-bl-en-state {
> > -		pins = "gpio4";
> > -		function = "normal";
> > -		power-source = <1>;
> > -		input-disable;
> > -		output-enable;
> > -	};
> > -
> > -	edp_bl_reg_en: edp-bl-reg-en-state {
> > -		pins = "gpio10";
> > -		function = "normal";
> > -	};
> > -
> >  	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
> >  		pins = "gpio8";
> >  		function = "normal";
> > @@ -1181,13 +1088,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
> >  	};
> >  };
> >  
> > -&pmk8550_gpios {
> > -	edp_bl_pwm: edp-bl-pwm-state {
> > -		pins = "gpio5";
> > -		function = "func3";
> > -	};
> > -};
> > -
> >  &pmk8550_pwm {
> >  	status = "okay";
> >  };
> > @@ -1357,13 +1257,6 @@ ec_int_n_default: ec-int-n-state {
> >  		bias-disable;
> >  	};
> >  
> > -	edp_reg_en: edp-reg-en-state {
> > -		pins = "gpio70";
> > -		function = "gpio";
> > -		drive-strength = <16>;
> > -		bias-disable;
> > -	};
> > -
> >  	eusb3_reset_n: eusb3-reset-n-state {
> >  		pins = "gpio6";
> >  		function = "gpio";
> > 
> > -- 
> > 2.54.0
> > 
