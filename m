Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1403A2549
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350174; cv=none; b=H9d820Y2luVPWKAG6lhFfvU7AVrz5EO7rZErxqEh+bitddieSaw5eFlZb6uLG46ZtMjcL3JwVK+V0qDVFBOZ1tOv9odE87cfskjeaRrC+LlNlkg6l8xtaVeK84ykap1KB25F9uZiS8TNXb6y8UBjM49YEYVw79Kx6lJTKXAlaoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350174; c=relaxed/simple;
	bh=BDWoM6y+rlbrFchDQm/vZJX+OT+u6lD0PHZfsRM4Rfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTOoNT4AQoeMxxQ59PDQb3s6g3YszFGl2+/xnPynPqP6vCep9NUrrzxRP/2cV3fNgXxL9PbCNJimYfBhkvwUnEmZLE5LJCung8gfRWbje0EHW98fV6ELr1mRTMOOmaJXuvgObX6RgZ1w/uzF0b8arllCsBdtqNY0jZHekhTM8M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z33iJLxU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihntoSsS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z33iJLxU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihntoSsS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pZdO632456
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JQ5MbnhUrtoVey0i+mZVDtjI
	UVFL7SCwUSHR6ehJgaQ=; b=Z33iJLxU2EY5sBvusqjuXdllNtQmpp6k84Qs6VlH
	8aoatdq1dceV/pKcDwDcJYQ2xqTwFSn6FIQU2uq35kd/k3xoROLN1GOHuwRMsh5f
	jDQMwIB/MAnxjhAscZQUF6aBD8wdYPBXjSClq4fqyllWHRdQ4Y90oyc17dZWL1b9
	XAGcIo8DBj/ofsMAzJPnFCzdB95hgmblGMiYwcbnnJL9At8hFs0qipZUGjq8qZGN
	3yAg+FMa76UjyFZh20yhrfB6TMps0lTyQIXUmcW86L2IWIyO5XOmsYsRaGKV6sy2
	CD+th2v/Tvd/G5uqTFNSI4LWQn8ydh2inIdsk5eIc/cuXw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6rf2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:22:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so2090903a12.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 01:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786350170; x=1786954970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQ5MbnhUrtoVey0i+mZVDtjIUVFL7SCwUSHR6ehJgaQ=;
        b=ihntoSsSOGwswunw6pPxvpLAhi+pV17/xjbgghFJyYawr7EZW3hNo9hw6N4A6pTzqt
         D62HTPBxOfhQdoYX/IHAKi8rLH2vb/Ys9eNqfZ0byMbHhJkRaf2go15DaSQBvF58Obv/
         ZJ+QieXwq4RehA93SxIgAmUm00apXhEBaPih8ZmIlN9rX2tfplT9tgec6OCTj6z81Ofv
         NdORFg7ohVmrtafmR4H/XMBbT+OMAuuim06D4lFBRW7OkdLDmFKOjIcjqc/D3v7UeHDW
         i1OVb18vU6olXt0Y68Y7salcEIqeJH6mnJ+jh6eQqeE7Aux8M1LivxgnnHIM91VntmeK
         B5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786350170; x=1786954970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQ5MbnhUrtoVey0i+mZVDtjIUVFL7SCwUSHR6ehJgaQ=;
        b=VWLy04iIhqTRMmTDbL/RSsxnytIpNVKiOkXe+SEQ+ciV/K4SRGUM6R4DdJx2kVzfD8
         9n8Y2e4bzWpE8s35hY0JBSiT+wzLXhUxXOsi/uRLdsljP1Xzmbq4VzxcAOFBncD/pQvx
         IbQjBp9tQwXZkNLQaUWUlgcrXIPArT7gID3z7OZVnf2o2EIaXtennS0tNnndMDo+j6Zg
         KmKit6cnRxAgGYJJHRH1Qklje/dAfp/rbNjMXqomTFooQIxADf//WZGvDC6Z6zYttjNA
         F4XWZYjunSm0j+zacOGivBbVPnfzOoF2iQDoPRjGlZohWrBsjliLVbkk9Y676wgVTumG
         WG5A==
X-Forwarded-Encrypted: i=1; AHgh+Rrzr957VXZ847MA8gML0c9a6BE0Sbp+zpQY2Bp5w0gRbQiJSyTXSBJ4G5OdiEDWixL/2H8Ef4RsdKwS@vger.kernel.org
X-Gm-Message-State: AOJu0YwcXUh+nVPBV5an90ATQ/QCbinRrkoMbVsUkCsdL75uSppxCOhW
	ZOvcVx0D9wGZdmxwlKlpcqXrimzhGvalRFA27BEG2lnYfyHJyy1dsGBra90H8CI+eyjXqKxNkxA
	eWusteht0Mp8NWAszy1G4PD/2IAUogvBg4rekAzpJwvS0tfj1DLQxyHxSoZ/5IZya
X-Gm-Gg: AR+sD12+WhomHaA/9QiebNMnDPBp5nt485woe7jR2e+bgn/lEsSx3LnScV1Htvewy7Y
	a8gwTJ7Lq2bpPtPJmV2fwYhkHLqRTMqaUTL09+d9wNXY/nwx5TOnlFMaT4ZnNmKPpYnHvnq8Ihj
	EQbbB5q7utbispKEo4tdGOYZ2fhdrf0TzjDvkoxRRubQLPRfdsJFk0QnQfJ8+mPpBdim9sC7SOO
	W4DcNRN1099tXwXDcIFqY1il7Q4oZ3jz/H8SVCILtPDlUmGeARZhRORG/YJvDuAGFVdBJt7AOrJ
	HsIHLStZt/PICu41W/jsbu1J0sy8sXvq59LZT/9VltXaXfJxUsAo7KgADZIGhVgS8U2m7s6E2Sx
	umdL9dkdwZLfbkCBTE/uYXddXUkwDHdF6
X-Received: by 2002:a05:6a20:d52f:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3cbce6caba0mr21361886637.3.1786350169565;
        Mon, 10 Aug 2026 01:22:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52f:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3cbce6caba0mr21361831637.3.1786350168997;
        Mon, 10 Aug 2026 01:22:48 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f38882fsm3567753a12.31.2026.08.10.01.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:22:48 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:52:42 +0530
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
Message-ID: <anmKUoLFSDpgOjoE@hu-anantiwa-hyd.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
 <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
 <anZGDietz47mE2wp@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anZGDietz47mE2wp@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA3MSBTYWx0ZWRfX/jbWaZBSX+3W
 Nf9PW5VOephrz3meCErVA8yo5sEL+JhOa0cK5LivUuPqhOOA3nrZHClyh4a+2k7YZ1+iEifuzkr
 HkOl9fLB+K3xZCay5yYMQq8VcilZbQA=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a798a5a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T3jw8oIj1AAcbHNbP_IA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA3MSBTYWx0ZWRfXyqpNpG5CXCIx
 jvNefpd/SpmsWT9W5FLx/KYc/M5UX0mkN+N5ueUB6RTF9HgsiguBE6fjohRoWRJ5cq27CDhUq3I
 j7tH9sTorm5mhjDXq9vE5ZwoC84ENVDks4uPdxoN4nn2YFiMHVNAjjpz0W6X3P0Plb1nVWrypqc
 n+UvWbBuqa6kkbm7bxhJmAFlP6UkeOxzYXHvKSc/ofH90H8ArONMHzH7it0yiceWqcY4vDa4h/O
 NvU8OQvTHqeeExVpPK6abT3eivpXzrebSUntfiro2TNLC8IoUQeN7zGOvEXLKAEPFnTgEmlPUMW
 paHiUAr4jhXgID7fCYJ5YS5Y+1PWCuCfDJJqOEz3v3z46rK8+glXiDNrPWGn49SZ7QfuOK/WMp0
 3ow4gknBNsv7tJz9Aj+PlNN3K5T+wnhNu+WnigqB2eA+xCYaqI7eA5U5g0Na0Mk2ViwsHU/7I21
 ujGKMP3sZBPKIbkQxqg==
X-Proofpoint-GUID: Sbz8uI_t2MlFOM9tprqFnkQvhOxe6XeI
X-Proofpoint-ORIG-GUID: Sbz8uI_t2MlFOM9tprqFnkQvhOxe6XeI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100071

On Fri, Aug 07, 2026 at 04:01:05PM -0500, Bjorn Andersson wrote:
> On Fri, Aug 07, 2026 at 03:30:13PM +0530, Anand Tiwari wrote:
> > On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> > > On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > > > Move the eDP panel configuration and related power, backlight, and pinctrl
> > > > nodes into a separate overlay. Keep the base DTB suitable for headless
> > > > variants and provide a composite DTB for headed variants.
> > > 
> > > To quote:
> > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > 
> > > """
> > > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > > lines of a new feature, there must be an underlying problem that
> > > motivated you to do this work. Convince the reviewer that there is a
> > > problem worth fixing and that it makes sense for them to read past the
> > > first paragraph.
> > > """
> > > 
> > > In fact, I'm not even able to guess what the problem you're fixing here.
> > > 
> > > Regards,
> > > Bjorn
> > >
> > 
> > The problem is that the base device trees currently describe the eDP
> > display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
> > are also available in headless variants without an eDP panel.
> > 
> > With current base DTBs, headless variants are not stable where eDP panel is not
> > physically connected with board and userspace is trying to use it.
> > 
> > This series fixes the inaccurate hardware description by keeping the
> > base DTBs limited to hardware common to both variants and moving the
> > eDP-specific nodes into separate overlays. The base DTB can therefore
> > be used for headless variants, while the overlay is selected for
> > headed variants.
> >  
> 
> I see, then it seems your change does make sense. I don't understand why
> you didn't explained this in the commit message though.
>

I will update the commit msg with details, currently details added only in 
series cover letter. 

> 
> I further do not understand how it can be that nobody noticed that the
> display was missing on their Hamoa EVK during the 11 months since I
> merged the offending patch - this is completely unacceptable.
> 
> Regards,
> Bjorn
>

Internally, we have always required the eDP panel to be connected during 
testing. In theory, this platform is expected to have a display attached 
by default.
1. The only difference is that the eDP connector on this board is externally 
accessible and can be disconnected quite easily.
2. Also, only the boards shipped to customers are delivered without an eDP 
panel attached by default, which is why this requirement exists. 

> > > > 
> > > > Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/Makefile               |   3 +
> > > >  arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
> > > >  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
> > > >  3 files changed, 129 insertions(+), 107 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > > index 1c86e7e98f55..bb0da34983c8 100644
> > > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > @@ -20,6 +20,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> > > >  
> > > > +hamoa-iot-evk-edp-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-edp.dtbo
> > > > +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-edp.dtb
> > > > +
> > > >  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> > > >  
> > > >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
> > > > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
> > > > new file mode 100644
> > > > index 000000000000..759d05342627
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
> > > > @@ -0,0 +1,126 @@
> > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > +/*
> > > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +/plugin/;
> > > > +
> > > > +#include <dt-bindings/gpio/gpio.h>
> > > > +
> > > > +&{/} {
> > > > +	backlight: backlight {
> > > > +		compatible = "pwm-backlight";
> > > > +		pwms = <&pmk8550_pwm 0 5000000>;
> > > > +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> > > > +		power-supply = <&vreg_edp_bl>;
> > > > +
> > > > +		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> > > > +		pinctrl-names = "default";
> > > > +	};
> > > > +
> > > > +	vreg_edp_3p3: regulator-edp-3p3 {
> > > > +		compatible = "regulator-fixed";
> > > > +
> > > > +		regulator-name = "VREG_EDP_3P3";
> > > > +		regulator-min-microvolt = <3300000>;
> > > > +		regulator-max-microvolt = <3300000>;
> > > > +
> > > > +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > > > +		enable-active-high;
> > > > +
> > > > +		pinctrl-0 = <&edp_reg_en>;
> > > > +		pinctrl-names = "default";
> > > > +
> > > > +		regulator-boot-on;
> > > > +	};
> > > > +
> > > > +	vreg_edp_bl: regulator-edp-bl {
> > > > +		compatible = "regulator-fixed";
> > > > +
> > > > +		regulator-name = "VBL9";
> > > > +		regulator-min-microvolt = <3600000>;
> > > > +		regulator-max-microvolt = <3600000>;
> > > > +
> > > > +		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> > > > +		enable-active-high;
> > > > +
> > > > +		pinctrl-0 = <&edp_bl_reg_en>;
> > > > +		pinctrl-names = "default";
> > > > +
> > > > +		regulator-boot-on;
> > > > +	};
> > > > +};
> > > > +
> > > > +&mdss_dp3 {
> > > > +	/delete-property/ #sound-dai-cells;
> > > > +
> > > > +	pinctrl-0 = <&edp0_hpd_default>;
> > > > +	pinctrl-names = "default";
> > > > +
> > > > +	status = "okay";
> > > > +
> > > > +	aux-bus {
> > > > +		panel {
> > > > +			compatible = "edp-panel";
> > > > +
> > > > +			backlight = <&backlight>;
> > > > +			power-supply = <&vreg_edp_3p3>;
> > > > +
> > > > +			port {
> > > > +				edp_panel_in: endpoint {
> > > > +					remote-endpoint = <&mdss_dp3_out>;
> > > > +				};
> > > > +			};
> > > > +		};
> > > > +	};
> > > > +};
> > > > +
> > > > +&mdss_dp3_out {
> > > > +	data-lanes = <0 1 2 3>;
> > > > +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > > > +
> > > > +	remote-endpoint = <&edp_panel_in>;
> > > > +};
> > > > +
> > > > +&mdss_dp3_phy {
> > > > +	vdda-phy-supply = <&vreg_l3j_0p8>;
> > > > +	vdda-pll-supply = <&vreg_l2j_1p2>;
> > > > +
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&pmc8380_3_gpios {
> > > > +	edp_bl_en: edp-bl-en-state {
> > > > +		pins = "gpio4";
> > > > +		function = "normal";
> > > > +		power-source = <1>;
> > > > +		input-disable;
> > > > +		output-enable;
> > > > +	};
> > > > +
> > > > +	edp_bl_reg_en: edp-bl-reg-en-state {
> > > > +		pins = "gpio10";
> > > > +		function = "normal";
> > > > +	};
> > > > +};
> > > > +
> > > > +&pmk8550_gpios {
> > > > +	edp_bl_pwm: edp-bl-pwm-state {
> > > > +		pins = "gpio5";
> > > > +		function = "func3";
> > > > +	};
> > > > +};
> > > > +
> > > > +&pmk8550_pwm {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&tlmm {
> > > > +	edp_reg_en: edp-reg-en-state {
> > > > +		pins = "gpio70";
> > > > +		function = "gpio";
> > > > +		drive-strength = <16>;
> > > > +		bias-disable;
> > > > +	};
> > > > +};
> > > > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > > > index 9fa86bb6438e..78cefd5391b1 100644
> > > > --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > > > @@ -19,16 +19,6 @@ aliases {
> > > >  		serial1 = &uart14;
> > > >  	};
> > > >  
> > > > -	backlight: backlight {
> > > > -		compatible = "pwm-backlight";
> > > > -		pwms = <&pmk8550_pwm 0 5000000>;
> > > > -		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> > > > -		power-supply = <&vreg_edp_bl>;
> > > > -
> > > > -		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> > > > -		pinctrl-names = "default";
> > > > -	};
> > > > -
> > > >  	clocks {
> > > >  		mcp2518fd_osc: clock-40000000 {
> > > >  			compatible = "fixed-clock";
> > > > @@ -213,38 +203,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
> > > >  		};
> > > >  	};
> > > >  
> > > > -	vreg_edp_3p3: regulator-edp-3p3 {
> > > > -		compatible = "regulator-fixed";
> > > > -
> > > > -		regulator-name = "VREG_EDP_3P3";
> > > > -		regulator-min-microvolt = <3300000>;
> > > > -		regulator-max-microvolt = <3300000>;
> > > > -
> > > > -		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > > > -		enable-active-high;
> > > > -
> > > > -		pinctrl-0 = <&edp_reg_en>;
> > > > -		pinctrl-names = "default";
> > > > -
> > > > -		regulator-boot-on;
> > > > -	};
> > > > -
> > > > -	vreg_edp_bl: regulator-edp-bl {
> > > > -		compatible = "regulator-fixed";
> > > > -
> > > > -		regulator-name = "VBL9";
> > > > -		regulator-min-microvolt = <3600000>;
> > > > -		regulator-max-microvolt = <3600000>;
> > > > -
> > > > -		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> > > > -		enable-active-high;
> > > > -
> > > > -		pinctrl-0 = <&edp_bl_reg_en>;
> > > > -		pinctrl-names = "default";
> > > > -
> > > > -		regulator-boot-on;
> > > > -	};
> > > > -
> > > >  	vreg_nvme: regulator-nvme {
> > > >  		compatible = "regulator-fixed";
> > > >  
> > > > @@ -974,44 +932,6 @@ &mdss_dp2_out {
> > > >  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > > >  };
> > > >  
> > > > -&mdss_dp3 {
> > > > -	/delete-property/ #sound-dai-cells;
> > > > -
> > > > -	pinctrl-0 = <&edp0_hpd_default>;
> > > > -	pinctrl-names = "default";
> > > > -
> > > > -	status = "okay";
> > > > -
> > > > -	aux-bus {
> > > > -		panel {
> > > > -			compatible = "edp-panel";
> > > > -
> > > > -			backlight = <&backlight>;
> > > > -			power-supply = <&vreg_edp_3p3>;
> > > > -
> > > > -			port {
> > > > -				edp_panel_in: endpoint {
> > > > -					remote-endpoint = <&mdss_dp3_out>;
> > > > -				};
> > > > -			};
> > > > -		};
> > > > -	};
> > > > -};
> > > > -
> > > > -&mdss_dp3_out {
> > > > -	data-lanes = <0 1 2 3>;
> > > > -	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > > > -
> > > > -	remote-endpoint = <&edp_panel_in>;
> > > > -};
> > > > -
> > > > -&mdss_dp3_phy {
> > > > -	vdda-phy-supply = <&vreg_l3j_0p8>;
> > > > -	vdda-pll-supply = <&vreg_l2j_1p2>;
> > > > -
> > > > -	status = "okay";
> > > > -};
> > > > -
> > > >  &pcie3_port0 {
> > > >  	vpcie12v-supply = <&vreg_pcie_12v>;
> > > >  	vpcie3v3-supply = <&vreg_pcie_3v3>;
> > > > @@ -1140,19 +1060,6 @@ led@2 {
> > > >  };
> > > >  
> > > >  &pmc8380_3_gpios {
> > > > -	edp_bl_en: edp-bl-en-state {
> > > > -		pins = "gpio4";
> > > > -		function = "normal";
> > > > -		power-source = <1>;
> > > > -		input-disable;
> > > > -		output-enable;
> > > > -	};
> > > > -
> > > > -	edp_bl_reg_en: edp-bl-reg-en-state {
> > > > -		pins = "gpio10";
> > > > -		function = "normal";
> > > > -	};
> > > > -
> > > >  	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
> > > >  		pins = "gpio8";
> > > >  		function = "normal";
> > > > @@ -1181,13 +1088,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
> > > >  	};
> > > >  };
> > > >  
> > > > -&pmk8550_gpios {
> > > > -	edp_bl_pwm: edp-bl-pwm-state {
> > > > -		pins = "gpio5";
> > > > -		function = "func3";
> > > > -	};
> > > > -};
> > > > -
> > > >  &pmk8550_pwm {
> > > >  	status = "okay";
> > > >  };
> > > > @@ -1357,13 +1257,6 @@ ec_int_n_default: ec-int-n-state {
> > > >  		bias-disable;
> > > >  	};
> > > >  
> > > > -	edp_reg_en: edp-reg-en-state {
> > > > -		pins = "gpio70";
> > > > -		function = "gpio";
> > > > -		drive-strength = <16>;
> > > > -		bias-disable;
> > > > -	};
> > > > -
> > > >  	eusb3_reset_n: eusb3-reset-n-state {
> > > >  		pins = "gpio6";
> > > >  		function = "gpio";
> > > > 
> > > > -- 
> > > > 2.54.0
> > > > 
