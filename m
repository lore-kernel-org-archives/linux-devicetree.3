Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F62363C73
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776251530; cv=none; b=CzfrSvH9TAAG+rHDe+MwJdRnK4RdjCyePAyjE6S8Rk1IadIQGWqSnb3wI9g7/qYWp4XNZK0czorKWI+YfmZxhVGjgUWdGaGECK1wn7eUK76aidGzZQDvpKKhc+Jdz51T8mDFiY4Gjb7JX7z8WPWQwwUqj+HN9c2L08h14ZGsNbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776251530; c=relaxed/simple;
	bh=oIaMFQ7L+L+/2Z0AfVlBwMaiXjTmwVj0tLL2cxLGOEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRjUUwV8FjW1m6VQ/FrYCbkP5oS/J7TBq4aGuinAgbieP95ixs9aSPjddR/FnOhXB9PSpFh1jqYAsO2s+qMYhTCGdVkbruITy3TdWdvgTcHC9WPYQW+KRTX2LFuIw0R0adw2zkOuZpernpyVS97/MxgaRm8urUrvOBGeDQh3Fos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQjuajSs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJKMnGYz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQjuajSs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJKMnGYz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FAf5YD3126733
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nrDD974FpG+wDz+fDVFkn9Ql
	xywic/Iv4KPsmAldIA0=; b=BQjuajSsK7ltSEbj01fSZ/SYH9FnTKFUGJog7kUy
	Pi9G3Orr7zWvwXR/r+IV9HWkWOt1PRUkr8RbJ4+U/VdVBRiHHWwjjIK7Svb5ipZr
	xCtdJKafu2dxjDQsy4/Qsz6vNVEsIlFx9UAlT0IkHtYrSXquYLdrAeynfe0Vla63
	RHdO5ZpzKF96omqq7BwyquCYrWzSs9BjoroYxsMA+KhiXO2n/zYA+tq1XgvVqRYR
	NVoyaPlJDXLdshrJXhhs4qhS1q/2YYzPr73B21ZUlScAY5QpyMg1EoX7JWvo1Kit
	7c3UnTm/jShDggKfjtdWuCjsKHxyU2fXk1tYBsQ3JQjHCg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56ty0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:12:05 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12711ec96fbso28737529c88.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776251524; x=1776856324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nrDD974FpG+wDz+fDVFkn9Qlxywic/Iv4KPsmAldIA0=;
        b=bJKMnGYz7892qQJV5ynvizI1FQRk8Z2d2GqKdVBlRpEAo5y0TVGZoZTmYyEsBO9wGt
         WMNdIlf8VM5X359xNg1Jk4OwQXmyLT+8iIAWmp9577d+qWZv5WClowINdfWSjCe8UWfk
         I2ZjbnrHvYBau9PBCGjW7K8V1jFz21meX54tD2mDfMrvIwfoCzcpCQ0QFJk2UZXXCWja
         vLq+3F3euVusoqC0LGD1C8SVJHKMKmNq/ty/8LPrAaIxBcqsnvNRYTX3Qrtq/j7xJ6oQ
         3F+zR9haHGGuWpDauy+KzGwuoq+/r0oLvIu05DFyfBMAhv25IUmYsZyD8alGHrt1xDC8
         oITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776251524; x=1776856324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrDD974FpG+wDz+fDVFkn9Qlxywic/Iv4KPsmAldIA0=;
        b=qxp0jEDcUa/ZbxTrtcxA+qEZuAYWVTi5BQPT+BH+MA8MstK039JgeehpUhqS4hfrab
         3fwtAPpEMWUG4dtN8atuaygcC1piSwgYLmldLbLNyxg1N4TRrEX780EPsH85DGCpJ/Sx
         k343HEORgDPEIj8hyluRDeBe0A/o6hUCU6lD5T9AHalYkyIrElMPLSPrms+FcEAgJrqi
         ys8CfvfRG4hUO84DhzLpAh+R7C6lTAdi1YlP3CRpE2SkLcUyK4KOr3xRHUncJ9GKmXaw
         K171da1/uPsmRHrjLHyc5B/oodwDlwgSjpsMukn49x6qs/GJSgKch1FoZcVdPnT8TGzp
         N7SQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bU13f4wwPeNeaPBYo7aZZ8EJnXGY0ygDEZlTiAMrcG1s3h9TsOdNbPAelOzj1x6+/fl2jqM0j+mct@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7fM1emT5FH6/kYEo6p4xZhDaUvirMXeufjJUqeOD+Q6m9vaZC
	c3WwLmNJQKmQwUJ2C9h9wO7R8EDrvxNUR7XMXbr9QJaKLA+vC+HmwjbBOCbprN4ivoi/VYm/KcV
	NAeENjoCOlwTJ7YD4a/h7OrGWb8Jq/lSVquijVRXFCg3ii8oQXkFyAGd+nxDz3bid
X-Gm-Gg: AeBDiev19KzPU2Z7rzJjIQWxYOIoHpH3HVUgkwOHC4AAKHFwttAvcT2k3nxCXwH1vR3
	YHOzA2IxqYq4IErPwVMvmp4Lqafj6Dq+dXkiNPb67RBlKdtzbUEp1xPnoWSXXWCMDsa2nTkgQZW
	kuEEzlJqfN2r3c5VAZwZTzv1LF1f/pxVLlrEV++jVpHRaF55GXvA8uTNYCpp7ejXpxdxWCVVQ7O
	W+f3AVbHgyJMxolNMFWKPAj3wez6SQHFNZn0Q0LIBRmWVWTxeqmc7W7a/Gp5YD646DdF571p0DR
	G1b29R9vFijgvQGKOpfqJ9Wsfx5B+oOFnFSCGMKEU0tk/zX2Tn56pgG+/q+REeHiryWiMJnn4Bw
	Nc2O0T0XyK9APvuUIUVkjcgtn564pTQVsPORtTr10v1U7EWYyVlCaGPKkhVZeM7OFOhfmKePFrc
	KFgK6dBQ==
X-Received: by 2002:a05:7022:4592:b0:12b:ed30:5b85 with SMTP id a92af1059eb24-12c34e930a9mr11409535c88.2.1776251524358;
        Wed, 15 Apr 2026 04:12:04 -0700 (PDT)
X-Received: by 2002:a05:7022:4592:b0:12b:ed30:5b85 with SMTP id a92af1059eb24-12c34e930a9mr11409511c88.2.1776251523717;
        Wed, 15 Apr 2026 04:12:03 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6b5627sm1427409c88.13.2026.04.15.04.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:12:03 -0700 (PDT)
Date: Wed, 15 Apr 2026 04:12:01 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
Message-ID: <ad9ygQD6962M_UpV@hu-anancv-lv.qualcomm.com>
References: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
 <adm2oq_ozs_VUXs0@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adm2oq_ozs_VUXs0@baldur>
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69df7285 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ecx7AO-9lf1Fo7kMJGEA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwMyBTYWx0ZWRfX+eBh1QktFDH7
 u2zGlrbB1XVoUy4IrqL76t/mpLHMO9QDPfWawOGJeKaGbi2NBSRA8gY8uQMcx0qqfMlcFUq/hvw
 SwYfcl27+uChaOyzHobxCdC3jm8GsQ4WIEeZXYfn6M5v5QslQt5I2ha9nZzOnbfagaWHBXXvETy
 SyUXP0+ZF8zX4N7/edFn/cW8cklxAjCuCqx47oGrckKvbYrAcFjNZUjzexkaMhFByduAwQ5PgRB
 C6M6WvN2QA/EZjYn+Uz6m12OR0Po7PygLogiPTFErgQFdB1MjOlOzZOB8mdHE7UpPrjOjUFE3St
 Ay34yY0cjocTFZxtfXSb0nJRbnoKna8YE+skPtoKNp4INSa5PJ5uiKk4NPRQyVtZJqw3TIaOyIE
 PoJPI02yduYKKVdPO6AgrlncqBqhktTlxOSi6xtzPGawbrxKALXrojBQKcmOOvbS83tzkIwZ1hB
 h1/wWfZkc0Ln6YrP38g==
X-Proofpoint-ORIG-GUID: yZ5v7WQmAaQ543tQIC3eFBg6donZ0Xqa
X-Proofpoint-GUID: yZ5v7WQmAaQ543tQIC3eFBg6donZ0Xqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150103

Hi Bjorn,

On Fri, Apr 10, 2026 at 09:52:18PM -0500, Bjorn Andersson wrote:
> On Fri, Apr 03, 2026 at 04:39:05AM -0700, Ananthu C V wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > 
> 
> Your commit is lacking both subject prefix and commit message.

Yes, sorry for that. Some mess happened during the process, next revision will
have everything proper.

> 
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> 
> v3? Where is the changelog?

This is also part of the aforementioned mess up, already taken care of for the
next revision prep.

> >  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
> >  arch/arm64/boot/dts/qcom/glymur.dtsi     | 47 ++++++++++++++++++++++++++++++++
> >  2 files changed, 54 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > index 2852d257ac8c..3fdf8dbbde02 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > @@ -560,6 +560,13 @@ &pon_resin {
> >  	status = "okay";
> >  };
> >  
> > +&remoteproc_soccp {
> > +	firmware-name = "qcom/glymur/soccp.mbn",
> > +			"qcom/glymur/soccp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> > +
> >  &tlmm {
> >  	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
> >  			       <10 2>, /* OOB UART */
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index f23cf81ddb77..f7f3374a5e08 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -2264,6 +2264,53 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
> >  			};
> >  		};
> >  
> > +		remoteproc_soccp: remoteproc-soccp@d00000 {
> 
> Isn't remoteproc@ sufficient?

ack.

> 

> > +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> 
> This binding hasn't been merged, and yet you don't mention that this
> can't be merged?

My understanding was that the prerequisite-***-id part would serve as the dependency.
I'll make sure to explicitly mention such cases in the future.

> 
> > +			reg = <0x0 0x00d00000 0x0 0x200000>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
> > +			interrupt-names = "wdog",
> > +					  "fatal",
> > +					  "ready",
> > +					  "handover",
> > +					  "stop-ack",
> > +					  "pong";
> > +
> > +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> > +			clock-names = "xo";
> > +
> > +			power-domains = <&rpmhpd RPMHPD_CX>,
> > +					<&rpmhpd RPMHPD_MX>;
> > +			power-domain-names = "cx",
> > +					     "mx";
> > +
> > +			memory-region = <&soccp_mem>,
> > +					<&soccpdtb_mem>;
> > +
> > +			qcom,smem-states = <&soccp_smp2p_out 0>,
> > +					   <&soccp_smp2p_out 8>;
> > +			qcom,smem-state-names = "stop",
> > +						"ping";
> > +
> > +			status = "disabled";
> > +
> > +			glink-edge {
> > +				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
> > +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> > +							     IRQ_TYPE_EDGE_RISING>;
> > +				mboxes = <&ipcc IPCC_MPROC_SOCCP
> > +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> > +				qcom,remote-pid = <19>;
> > +				label = "soccp";
> > +
> > +			};
> > +		};
> > +
> >  		usb_hs_phy: phy@fa0000 {
> >  			compatible = "qcom,glymur-m31-eusb2-phy",
> >  				     "qcom,sm8750-m31-eusb2-phy";
> > 
> > ---
> > base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
> > change-id: 20260403-glymur-soccp-2ca25f3b30e2
> > prerequisite-message-id: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
> > prerequisite-patch-id: fa390011ee531589a7ad14250d158f497622efbd
> > prerequisite-patch-id: 93e7fca58a5c06edefa624ec2b006dd80f4749a8
> > prerequisite-patch-id: 99a3b6a7fcd061267b40097ad25f652ebe0a4c7b
> 
> Why isn't this list empty?

As mentioned above, this was supposed to be the dependency, my bad for not mentioning it
explicitly.

> 
> Regards,
> Bjorn

Thanks for the review, Bjorn. I'll probably wait until the driver changes are merged to
make another revision.

Best,
Ananthu
