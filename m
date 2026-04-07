Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A712135A383
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574114; cv=none; b=YOCfi1PzRkEpn0jW/jZR4hXX0gLoaawQPhArEGKYSnFCt0S1sAPWboK9zyIcWHTom9XDwTUFISkALu8nOo+OlwWoJb4yBNxI52ERo4SoJcr2lFw2QE+WXLmYpv83cxDrFvv6/CUAkLWgQ1d4Ngq4dGxTbBu5rPsiHtOCmXaKwk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574114; c=relaxed/simple;
	bh=3X/OR1OHtg1qOzUM4YQAcooeFQasEO+hUsaJ77clL9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjGABo5uyhBcymSpxxa6A2Et2+F1QLensCWftEHivbcSTrxDvPb8voUFwj/o4rFxnaNKucAWXKB7EGfheAnZNVOFRbECSUhZdmT3P+4ZAU+dR8NKlJxSs9qLwUm38kXnQVotRDeCPhYU2xlzXIQqxie0+4auHhKE8tnKd5mzQ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzGfZ2EU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqRgc94b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzGfZ2EU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqRgc94b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CUHbE3815649
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 15:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GsM5S9NSNnQPcjnljHAvVjf0
	eRrRjyuwS++Io9AFOUI=; b=JzGfZ2EUxm+UeQC2dhrsMl23HJeEiSYpbYlsUtDR
	Ag2b3+uqRMcBI1zkHcggNLjxJ6jx/MnsLydmkgjqTWt9h9B3SZSzkOkIlwrJ6m8b
	rM/LniYjh38/ZEu7DObb+epkHHyqiZJPqXZO8cnArjGxtueUZYKd2sCQsUN7BP1p
	DnlP0SRuStCrAks39NSa4yEfZxpKhoFjFPh0uGGoDKpPFzuhkzGWsJoM4JqQKzOA
	WzlfQdYzWgGAQgJ5jBnhOyTy9QeKYYIo61p75FykL6Ujr4QAUMBoL9aUhuTrGd7o
	5GPfD9dPzXCdX+p5NMCYXBEwemjcB7x3RNu38cIsDBxwxQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4u92x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 15:01:52 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-41555e51e94so3946447fac.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 08:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775574112; x=1776178912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GsM5S9NSNnQPcjnljHAvVjf0eRrRjyuwS++Io9AFOUI=;
        b=fqRgc94b0KcUief1w5D0Z32ew4CBZRGTh3jfEVw6LluMJOFfR3h5hpBPDsep9EDera
         BWg7N14zSxBtXkRNwIVPtfTO2Sv7K/aF6pu8/qfaMxggLxeqJNczOqm9e3qAsiUb/srK
         PkJ7/dtQq23sdCF5PBP5AF3yQsH0wCS+V+ZcXXMuEyiZ5vdfwU8vSWynZAD8E7Yzx51M
         Zhta0lHFn/o962zp3rKM3KnnlE0O+HJGwmFMNdA1hGDjYs7U0nEvQwP/TQ+eU0DWPRm1
         lHrEjp5ZJ4L8j/CYJN7cuT5pSih4eMwBHx8d1hvizchIKKfTTabUb28euMVy1Q98zcUH
         LBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574112; x=1776178912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsM5S9NSNnQPcjnljHAvVjf0eRrRjyuwS++Io9AFOUI=;
        b=joznySv39pVDpnylLUPcQ0PqGQcTUrQlq8rrk/5+6vYKHQh75Oz5UlqR06U1Z23YMX
         ePh7iQ4cw0qP+2Tyrxx2hPVlTEK4DukAdjm9b+SEphl9mobiLOZwzRsjCZ5BCHXYPHzI
         YuiQkN1tlVZHskdoB5x5u2SB2z8tvw/7s9FUuGq68kAgNlVb2iY7MRGwayrJcZHnHVpI
         HE0LyKEV75M409R8NHBkpjXVPaAnCCSBBb+BjV+o+IbWmcjFZJMSYrC70HBlU6nIMAal
         k3srjMvfjFTBAnJliIrJGQpzk+rDi/9kcNi4btnPCzyULRCl9UG2iSW9WEBYd0H1OqC4
         05xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu+FXVK6AFWq8IiYIFdeUMUrEvVMC12qjoAwKEIVDteQV5EE6tcBjbYvdqIfvmUZKde9zWfP1YQAJT@vger.kernel.org
X-Gm-Message-State: AOJu0YwYsHDXqPVxqMXlLpXjxs+mOryfA0x9jYBhP5Lkpy9VXPlwMSZN
	E8FfP4PeulchXNOkeqz+3juwHI1w/UAZ5bRrIRYRpVf287LSgRruUSRytmPoQ8Xh/G0UXhhvIzZ
	J3Q6cweIQjgGKnS08zKSs2AdEr9a5wpRDzC1c6J33h6OPwcRCDn8w+SxbL6xqevmV
X-Gm-Gg: AeBDievyg7L6FGca2aACqxQu8wURicBQadOzNK+Kvf1aDIjj59kfEesA48oIMnsxGEe
	QE+kljXxHcEtEQlD5nMHcwrPL+1+G5Al9bB1xE81WlQ3RxIA8f1McLEyRrGBVw+MxJYXVAjDJSl
	VYrxQQx5IUFF9Qt3kifEU5HTqAcASSk9AA8hgN0gFoUE+Am7NviuFpmkbmRY196Sr0ptblRnV7X
	E0lv5jwZILPXBugZs1cVOYNJBXJkHbTdaImlHfQ946MNyGK5AKIV2pmT5VoHL1x2zv/+IrAnG9a
	salHxzHdhBpoUYMchpmxyf1GRISJvtb9OQH7Ou44A6L8jABQ+DBrJUz/vB0NqWYQQvrgF1dS1gM
	thR05lmS7Ldq61DnFaW/CjSMt0aGf37aPtnA6K80haG2hVBLqVJJN+VKktaQjnGWIpvgFsafMdt
	pa9qT6YMXbK7w/y0osBcE+NpOMSitXnAAGu6I=
X-Received: by 2002:a05:6808:f8e:b0:467:e80b:d5ea with SMTP id 5614622812f47-46ef8a3fccamr9503434b6e.49.1775574101189;
        Tue, 07 Apr 2026 08:01:41 -0700 (PDT)
X-Received: by 2002:a05:6808:f8e:b0:467:e80b:d5ea with SMTP id 5614622812f47-46ef8a3fccamr9503084b6e.49.1775574098252;
        Tue, 07 Apr 2026 08:01:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc96fsm4075762e87.59.2026.04.07.08.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:01:36 -0700 (PDT)
Date: Tue, 7 Apr 2026 18:01:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joe Sandom <jsandom@axon.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board
 support
Message-ID: <s4g54pra266y6p2j3f4fps56naw4hm4vzuai5sgpf7sdbbewj2@3j2tkqd3qgdn>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-5-895f8fc494fc@axon.com>
 <ehlhjfzekjnscro4ffydjhzfuiqhfkuyuxrk42x53cturzi4do@74y5k5ee6bv7>
 <20260407113925.4imd3lxkcrq47pu3@linaro>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407113925.4imd3lxkcrq47pu3@linaro>
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d51c60 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=F2SXJ95XJyWdONsWzOMA:9
 a=CjuIK1q_8ugA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: 3xQRXn8oFkBp8V1wI-31Da_ahLsk1URJ
X-Proofpoint-ORIG-GUID: 3xQRXn8oFkBp8V1wI-31Da_ahLsk1URJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEzNyBTYWx0ZWRfX17V7qXSyPxrs
 h3oXX+beddc0M7YnsAdQcxBTSFYzHIy63dYwFdzPVGTR5fWen9Guoz7B1hxbvogi9MAP0gmK3hh
 10ZdwrFX+Y7c5czgQR0VjbTnriEr58QIx4isHmai1wr+5QDfPyjD+Wf09I0TuEvvBlBkN/N7Vf5
 Y4vMsPU2zsd6VqWpTQTAvruSK4RGYVd1TvAUZZO6e2KNW8AOBufUBFK+LtJ7g2v5Vp3RKTq90oV
 /f3z1qRi8oBWajEd7rWmmQqZCQYmp6G9WIqzGXAetDRtQf9R7p266jMxxgmWy9rbT5o3PiSGj9q
 UMKS64OghmrnAHAPhfBc6eqIM4kIcSJ8xwaTlHtZ0Rg5FNWpIvX7FMreYFeR6SAKFiJZgvKOzCf
 bwKebuoQ65p6RtYVdZVHwYP99jFXbNaEfCogoWqe3Mo+tmsOuK7YWYw4ZWySDhVo7qMZYaC4u1c
 wvgqSQ9MYsoTpvWHBoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070137

On Tue, Apr 07, 2026 at 12:39:25PM +0100, Joe Sandom wrote:
> On Sun, Apr 05, 2026 at 12:20:23AM +0300, Dmitry Baryshkov wrote:
> > On Sat, Apr 04, 2026 at 10:50:58AM +0100, Joe Sandom via B4 Relay wrote:
> > > +
> > > +	wcn7850-pmu {
> > > +		compatible = "qcom,wcn7850-pmu";
> > > +
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;
> > 
> > swctrl?
> Bundled into bt_default since it's tied to BT

It's not. It's either WiFi or BT.

> > 
> > > +
> > > +		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> > > +		bt-enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
> > 

[...]

> > > +	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
> > > +		    <0x100 &apps_smmu 0x1401 0x1>,
> > > +		    <0x208 &apps_smmu 0x1402 0x1>,
> > > +		    <0x210 &apps_smmu 0x1403 0x1>,
> > > +		    <0x218 &apps_smmu 0x1404 0x1>,
> > > +		    <0x300 &apps_smmu 0x1407 0x1>,
> > > +		    <0x400 &apps_smmu 0x1408 0x1>,
> > > +		    <0x500 &apps_smmu 0x140c 0x1>,
> > > +		    <0x501 &apps_smmu 0x140e 0x1>;
> > > +
> > > +	/delete-property/ msi-map;
> > 
> > Why?
> I tried extending the msi-map to cover the RIDs from the QPS615
> PCIe switch (matching the iommu-map entries), but this caused
> ITS MAPD command timeouts. From what I could gather, deleting
> msi-map forces the PCIe controller to fall back to the internal
> iMSI-RX module, where this worked properly.
> 
> For reference, I checked the RB3gen2 since it also uses a QPS615
> and there doesn't seem to be any msi-map defined (in kodiak.dtsi).
> 
> Any recommendations to resolve this properly?

Maybe Mani knows. Please mention this in the commit message at least.

> > 
> > > +
> > > +	status = "okay";
> > > +};
> > > +

-- 
With best wishes
Dmitry
