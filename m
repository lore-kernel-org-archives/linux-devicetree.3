Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB2F39EF36
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751028; cv=none; b=eZoQTyropsZCIdQEWljg9Rcxq0pdX8WYby/vG8PLhgjFE50s8iANVoAhfIa3ZXzaraRdON0tbfwpx3o6zl2eQAPsxZ9nxc6CVM2PXlKm14opCFCuvHuLlJj5mYmWM329n4zuIKMsTP82l0dQ8BqyofqA5BpYkBe6RfGyqytWsZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751028; c=relaxed/simple;
	bh=LyFf995dNEgEaB23LV2UQvB3BQjVdJ9TXjohIsaE8F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+M5w4PSoZVGHTuSvwph5RUUvhidPkeodssl+0/J3mtgqcJhKwIdODHG289/6lGG8mOMwG6vgHQ0ZKFmYW1gR7goED4IsTYE1hSRT6M+yFZVDvAsTXHeKx4rkXTCEZGuddRG3Tu2npS9cP+3o09kfI0U8GLGFboHpXlFfzNYIUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGLTJmJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aj02ed2E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGLTJmJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aj02ed2E"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E8Xrqq2134354
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TNaHVHvzRGoJzjJ8UVs2Dp0KY9HXSlRl8lXaUGNQfQ=; b=lGLTJmJNQ3lzYVYM
	bFgSgLn3ppjdiEKtS8s8JHxPtwoRu7RIwM7Ra/nqKbfKnRTZpk2Izldub2wKUQi9
	63lb6G0Wsa/MFwdE6v3VNNbpisSshDbzMHP2phCxrYHh0D2eAKVbQ8mIGtjOmkuX
	7hSkYxaPo75qHEryhJXxL4R+AV9oVsRwFmNxMxhEfjxFI7N3GxjxmUYyjgaO4tb1
	95cdQM2ERK/+Y99owVx9xlWLmIskniDpNXe1+OeFVipIbkdZOZfl/FMXYJve29HF
	sqXHPT0Dga3XC2q0UKNKijZJNsjG6IX4O0PdHuG8KLyzxueQQSgj70lmULkUSNlr
	MtRAoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0br75s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:30:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc49bef6so117290851cf.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778751025; x=1779355825; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7TNaHVHvzRGoJzjJ8UVs2Dp0KY9HXSlRl8lXaUGNQfQ=;
        b=aj02ed2EymBKYf1eWtztpyhkkMYmcd4t8aHxnRQSnyw6x6xC/qBVAD0Xm1Q62MKVCc
         LJ7f0UtZLEjJBh3j4F8UFOezMr+yAtmI0ir8mMUTzJ213uOYDta5lDju8uYP06gMbZRx
         xYEHbT34OIRwrKDTMuYGh/xlTRXxX/cKiw8+7Ak+/YvbDQokqiEa/RXV2/43Lt3qvNRk
         OO9CsGAaGF/u6h65Q+QeQqxbZsChX4oPRJFz/8xvExY8nRINLM/1NaQ6fQBMqYT3CRlR
         4Ivwl23bXPfjC78LIbeHU4Wr5sZQg6KNIm4lK2s6FCa4wvXi6JvbHF4n4EPnNiG8fiy6
         FrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751025; x=1779355825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TNaHVHvzRGoJzjJ8UVs2Dp0KY9HXSlRl8lXaUGNQfQ=;
        b=EAXhguMtuM5NQlTWaNohs128SV0Caxep5fNzO2GkeYPJKtUGec5GlKm3NwTyExkihs
         6grgEJB/IFWxLIHVxl0QY33c9pIAs1z4wOfvR98/daZ8QH6H4mOwVLANbg+oVEqTcsi+
         Ub4Alh0zKDEaNVyljSU3YvS7HLme4COKXCT0wiPSG8MaJVaSzJZ2eF0FweVWEpDzgPEC
         kNiaWvRjDVpvgNt3nRFJnQGoReK7QksVG4uHGzCGQ4qSZtN89UZV0jsvO6UcTAJGuswU
         HLYggQ+NNQUuQaKQCRgTGcBUUZHoZ0TvyTRXZpICj1F6Pso0c/eXiaFhpC2BWNLTL/7K
         HqoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jOgdkOATsVx17VB9ubPP62g/dEMHcxB3rKWgpB2YlwKtoMoeOandlfDMpiyNLA3F86CPgows4PZEX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjp9hnH3iJeDXHsNCyTa8ZiFO4YItfqjAU3HF1ihCSXmctWqQh
	8sMLyOy442ugiD4LbVH0weXJbmaUxraSc6qXmTGLnu7eQPvywW+9YCgg33MJ14GSqE5aSmQjr9I
	7EFaaTO7TjKIXgzccSPFBJnWNKxViVWvMPV8UOUefzGeffF0Qej8C3MPr/o2U+pn1
X-Gm-Gg: Acq92OGPa5gwoHx2G2JdnvaXw61h9PjJntqnJlQNCo+Eg+93jC/NNukRu15dFXYjnKT
	OMQ3qUE064U1OozzcZnHmHFAOWpvNA7X99eCI9iBjslrqjWuHwqDx51HPSqD4Fe1iJ9wbiFv7Zi
	w9lPHTPRiixfOU6e98r6gxCT+6EUDsGdJYzl8SV3GP6ue921dHogt2OTVznzw2uVbSORcAnyU6+
	cOo2oq8t5NrKY8FfffqHwOXgQKNZF7xYA/9rLsM9OKI0zmQM0zwKE3WqCLBrqb/cPANKPMT91KR
	lAxgHy10QcY2TlO8Vz9GbtPIjAvPdJWhFvdstW+tjD8cB+IjFVBHMGvF+757KYdEHdTMp5/rH1G
	nsrdkr6UBs+CH8tnp0yPz1yMpU0db4uxk16bHi4Y9m6DAgzWd6lCT1HGas2H6+cvSg0Ly+MIHT3
	PCN5B994U/bjJOWiD8gXOFXqpfB3206ftIzqI=
X-Received: by 2002:ac8:5dcb:0:b0:50f:b8e9:a0a3 with SMTP id d75a77b69052e-5162ff0dd7bmr86756721cf.34.1778751025500;
        Thu, 14 May 2026 02:30:25 -0700 (PDT)
X-Received: by 2002:ac8:5dcb:0:b0:50f:b8e9:a0a3 with SMTP id d75a77b69052e-5162ff0dd7bmr86756321cf.34.1778751025045;
        Thu, 14 May 2026 02:30:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c58139dsm4672921fa.0.2026.05.14.02.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:30:22 -0700 (PDT)
Date: Thu, 14 May 2026 12:30:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: sm8350: add Iris device
Message-ID: <fhxdcymqai4numca64g35zil5ing6u4nujdgf2hgjndlbtxyn3@bgfujizpfaej>
References: <20260513-iris-sc8280xp-v6-5-0d11d90d3e26@oss.qualcomm.com>
 <20260514053808.38185C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514053808.38185C2BCB7@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MiBTYWx0ZWRfX59mZ8tX4QdpJ
 kK6pGL4mN3axTzPjRgF9kh8qMRgi4xy97usfWV31nEVZtwjVJ4yiGr+xOuSGnTDqEP2K3NMZJ9n
 KsuqgimNs6sxKCDlbcuhgt1HIFlga0pA0iG4h56ln+q0lFpJFECdGGaszfmq6Fkt+64Tfb0Tybs
 PCS7aaXeJx6Hl2O0Ajqoduhog3tlQTwPA61zwiMo/dJLELTdMFPtQx5eHx9ByBxNkagJ96VXXUc
 NObNRlxwcXyqslMEwJnoixKsF3fVZJRS0X+z++OGpCVMALN97yC8AX5CGWUHUeRVYMBKXzArIQM
 JhF92wPAA52PzUTWlNPO48mvNZfrzUjrL2wB9j6tGRUoZJ1ee84oOVzgtMDyhaCLaDiyLZv38be
 5ANUqRNDXwPh/1NWAHRGRzbFSVrX5Vx/YVLfdiHJkcMfBzFiIMzS5limNsMUbtPLqxs71a2l03u
 YO0rP9L/ovZK6xsEDyg==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a059632 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Cw5jVxbl6wvLIJzyfCIA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: XK3hoGdADH7IQM1seMoP3rRNeBI4soSv
X-Proofpoint-ORIG-GUID: XK3hoGdADH7IQM1seMoP3rRNeBI4soSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140092

On Thu, May 14, 2026 at 05:38:07AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing power domain management for `mmcx` in the fallback driver leads to voltage underruns at high frequencies.
> - [Medium] Device Tree schema violation: `power-domains` count mismatch for `qcom,sm8250-venus` fallback.
> --
> 
> commit bd1540a2aea97fb87b08697e9a713ca663a208e8
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> arm64: dts: qcom: sm8350: add Iris device
> 
> This commit adds the Iris video codec and video clock controller devices
> to the SM8350 device tree, describing the Iris2 core present on this platform.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > index 5c8fe213f5e4e..eedf677a7070d 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> [ ... ]
> > @@ -2745,6 +2747,85 @@ usb_2_dwc3: usb@a800000 {
> >  			};
> >  		};
> >  
> > +		iris: video-codec@aa00000 {
> > +			compatible = "qcom,sm8350-iris", "qcom,sm8250-venus";
> > +			reg = <0x0 0x0aa00000 0x0 0x100000>;
> > +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> > +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> > +				 <&videocc VIDEO_CC_MVS0_CLK>;
> > +			clock-names = "iface",
> > +				      "core",
> > +				      "vcodec0_core";
> > +			power-domains = <&videocc MVS0C_GDSC>,
> > +					<&videocc MVS0_GDSC>,
> > +					<&rpmhpd RPMHPD_MX>,
> > +					<&rpmhpd RPMHPD_MMCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "mx",
> > +					     "mmcx";
> 
> Does this configuration violate the device tree schema for the fallback
> compatible?

As with the other patch, no, it's handled by the merged series.

> 
> The qcom,sm8250-venus schema limits power-domains to 3 items (venus, vcodec0,
> mx). By adding mmcx as a fourth power domain without updating the
> qcom,sm8250-venus schema, running make dtbs_check will result in validation
> errors.
> 
> Furthermore, because the kernel lacks explicit driver match data for
> qcom,sm8350-iris, the device will bind using the fallback qcom,sm8250-venus
> compatible.
> 
> The driver configuration for sm8250 strictly requests and attaches only a
> single OPP-scaled power domain (mx), completely ignoring mmcx. This means
> mmcx will not be dynamically scaled by the PM OPP core and will remain at its
> static initial voltage (likely low_svs, as requested by the videocc clock
> controller).
> 
> [ ... ]
> > +				opp-444000000 {
> > +					opp-hz = /bits/ 64 <444000000>;
> > +					required-opps = <&rpmhpd_opp_svs_l1>,
> > +							<&rpmhpd_opp_nom>;
> > +				};
> 
> Will this cause a voltage underrun when scaling to higher frequencies?
> 
> When the hardware scales to 444MHz, the opp-table mandates that mmcx
> requires nom voltage. Running at 444MHz while mmcx is starved at low_svs
> due to being unmanaged by the sm8250 driver configuration could lead to
> hardware instability, crashes, or synchronous external aborts.

The same.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com?part=5

-- 
With best wishes
Dmitry
