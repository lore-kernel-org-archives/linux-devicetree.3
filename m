Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6484F2D3ED1
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698427; cv=none; b=pDP7u6VH2kKC5BD7Yg20srUCdA7rflMVa8fVqcCpYmJAxcgIBkMo+6aSzzBGZpRKfGk4Q8Le1tzEyWo/V6L0gS2EWusc736e7NHCcQi4laj6DwHY6VX0AIhrKv9furNWgs6qWwpmQuKL6eNOHpW/VWMYlKfrAFPa1Fi+/r7TP5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698427; c=relaxed/simple;
	bh=VD8xRp7Pr6lrGRZDItwtv2o1nHlPugA6Ovros4j9jsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyqiIHrVCtxIwLiTNAGpqPdJi78OpwcG9Yc5a8OWsO/rQZMVlagmHkH4Gxfxx9AXjLysehjN6Fl6ZwwgM0AihreXv/BLnL8yVK5nI28yOOxbW81rrz5kw4HHFWmsOArBYVjSArfZQMi7xxa33BdrRwTddVSbrZScVasnIp07EFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kd2fdET7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ab+GvEsU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kd2fdET7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ab+GvEsU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53iRd3473730
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YMWxBiGgJMWcHgjMI5TkWZzi
	XouiwxvGOfVumtfALvA=; b=kd2fdET7RP7EExFCU4Cdb+ID+IpxWaMazg1w5Umq
	5HDCEi93D0A8g1Uu6TpMUg5ydlaJ8zSERrpRUTOBvi+a0t6lRb2s4pBvdSe0nqgW
	eFLkMniYffJkTXKuUPw7DyG1VHYHMF/szEdFT0ugqOXviV2o5GR9AaM0EXUGfZ4m
	Gt2zlIbcy9H4hqgBLDewtgrGMjOinFxk+nrjBv/D7elyWpqGeojaeBrGdgUlyOos
	e9/K1MADsyMtmPIXoVXJ0aSM3cZXObm7X9RtLHIzbV9upOMR5k0gdN6Lw3EunRp9
	iav7ELQjiFuLdx6l3rrIxXdnnwbBktHY1qZEn2ozLY62uQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ftcq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:33:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso20158721cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784698424; x=1785303224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMWxBiGgJMWcHgjMI5TkWZziXouiwxvGOfVumtfALvA=;
        b=Ab+GvEsUw6Mzj+QzNmj3zSGYHt1NzlOepjcWhHhIGllpkhuo1brbOlJIQjQGhUyQVp
         imZjjrh5DmRBu3AUAyhnLpnqMU1IJbZXAFGABpP2/alpoy6KEHsWcXpx0JJotb3hKBMw
         EzwQq3szbnE5ICuhW62FOlxv3eDcScHRoSxpaeS8rEEnDdJW+cP4rWzOoOV1BE4cASFR
         DVAslFZD82THDFk6w8FJ5WOecbKCUkRIS9fV7skN6ZzJaMk5pBM/xhnS5dNhssww8hR8
         RTT3CFuVbAP0GPsIsrFosIjWFFdzjBm8sW5yQEh67mdxn+VD9SpcPWjT4RXU4FbEvIYU
         eq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784698424; x=1785303224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMWxBiGgJMWcHgjMI5TkWZziXouiwxvGOfVumtfALvA=;
        b=SGn/gDiO9lWh3AU9D9fkpTrrk2mVPjsU5k7+jPrHSnuMd/2ousk/GZydbjV+ucDxga
         nSj8WxlzmqQXoqaeKMIwCGAPK+R3eSmub6602G4pwbtuv/hHv4CQdIfokUNhEevWsSK1
         jQXWJPDBTKTNOLP/sNcDmBkwhUsCAxcor5UC9qAlq4w03tuFA+eXeqxeeXrGIClnCGeb
         9YTWqqxRThrQe/0nOl6KX5wObiR10i3BCu1rxMQ5y5qRBJ7YYyMetfhPXhwjGYH7qrTI
         nBTxAra7GvR1e46lBygd2SM/tKNGHP6MH2WKdumpU7TTn2b7zK9CW9okSOnS4Ea16z9W
         kjOA==
X-Forwarded-Encrypted: i=1; AHgh+RouQO3yF54bgRL3s+0M5JkVYZUYHrq6I1zQM4qcN7TOb8fK1DTWVVDRN/83mHc72a7Ss28qlh2ITpX3@vger.kernel.org
X-Gm-Message-State: AOJu0YwfX6DX9mValam6emAdCwaYGww7khKCyvTo0a5rk9xnrE571BSx
	9XRxnFcv32/TBcdOvu246ihi3BvTEqnxW8vqhzqX+8VdJf9e9MMvDFnjhc55LoSX03pymcO502z
	5dXPghRczJC1Et4FUO4VSBHXViJ3F8ZJJB/1/lyBT4n/iDQN5uy5n1vkmOqOHMHB2
X-Gm-Gg: AR+sD10znzCGR1xc1SrtyhO19PoA1zQmVXLCnu0WJGNhc8NZPgB1gfRjVNVNVTM9l2H
	Nbh5Z9bKW7j4O5yfhYIC/7tepyEjr3xKbT4WWVaGYxMAWPqtjZgcalwF4vfPEHkZJYxiZzY4o3l
	OHCqtpQXygc4jDoNmJh54su9o4BALbWLzf7KXuFg+5hTNTvPhTExMbBCgcPeAxuQAM3g9Cnafr5
	yoDYHwut/G6eyKcUBieqqQ22afwjE+yN0cxJANafcvurizew/K5UWB+iZb9hCWjp/zOv7piKsZD
	6OUVvhlhYQb45vN6+luRSGD1Xmx4mmfgZRndDldYiKUFz0rGQYtbyn2qnB5tpfX1d2qYQEppWdk
	rB5wlzYvtA6u0LfQ7JhM8wBkjPBTUYfR8SfH0SmFrQmFGPpjYT/OouroQFKvTHvBufJ8h55pnXb
	v9P9K76jn0XVEuCA==
X-Received: by 2002:a05:622a:5a17:b0:515:189c:e0f8 with SMTP id d75a77b69052e-5213bf11467mr185183141cf.17.1784698424200;
        Tue, 21 Jul 2026 22:33:44 -0700 (PDT)
X-Received: by 2002:a05:622a:5a17:b0:515:189c:e0f8 with SMTP id d75a77b69052e-5213bf11467mr185182961cf.17.1784698423652;
        Tue, 21 Jul 2026 22:33:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8b999sm286488e87.15.2026.07.21.22.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:33:41 -0700 (PDT)
Date: Wed, 22 Jul 2026 08:33:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: Enable USB controllers on
 Shikra CQS platform
Message-ID: <2xpkigm32q6eq7nh4bgsfgswwjquru4pa5oxeciyx3jpywjf2i@qnc3i5sumo2p>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-2-2e7a092d7f27@oss.qualcomm.com>
 <mh63jqjocq2mm6h5dpqck6okfmsugjg7frrehmd5t6f3mynojc@tpfnitctm6ye>
 <842b4369-3167-4247-a170-e62d5c78fce5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <842b4369-3167-4247-a170-e62d5c78fce5@oss.qualcomm.com>
X-Proofpoint-GUID: PJ7Cpjh6wD303WgkioxVSG7hSqgrVM-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0OCBTYWx0ZWRfXwhWHJEmCsbYl
 l46Kr7Vw16crbF/1mVG0H9EnbGB0fkkjajZL8GFMr5iZetoXnHZzZIab+0VANKQuL3AcHBEU5wk
 STDpWimKllTr2B1dsKlT9So7DfyDPwwdiXMj1C8HtTxEZt2neY1eIqQdUk99X+naSXLDmslXx54
 w1ZSTDq8LfDOPW4bEIAredo0hoATuYWMKRY8pgU/D8FPGV4HdG8FAha9NAU8IzHayOiIsg7WPlM
 3GsHzUb+VPczSPp/LFWt0nmGTqPjG11lXYiTxISG1drUytnt3pIgRfOOb2HVH5g3SAd7P8QRpqz
 g8oOtraxwn2yDZ08zDoYIPR3ypFgL26hdwUPW3PnEctgGaz9TcrqszL09E56XWsLMaaA/gWnxtY
 3bTtMFQm8DX+TTD96hDOjp5oiSsHPKevfpwpKteyfCT08lBlrL7f0QuGeLiF+4ht2q5vmnhBNgn
 OhBEoz1B6Yp136DrISQ==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a605639 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RdTN6Onpav5IspOjp2MA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: PJ7Cpjh6wD303WgkioxVSG7hSqgrVM-9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0OCBTYWx0ZWRfX9AGp5xof1DQp
 Ya4yfLJkQm53REv724EbUsMHMhnijUOvrfArdpbfud+gJX4+ZVA0Xjsai7+uUKabYuKjv0uS4wc
 5sodBFHLzNF0ljujXkbIrqGnIQjaBQI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220048

On Wed, Jul 22, 2026 at 07:22:47AM +0530, Krishna Kurapati wrote:
> 
> 
> On 7/22/2026 3:07 AM, Dmitry Baryshkov wrote:
> > On Tue, Jul 21, 2026 at 03:23:46PM +0530, Krishna Kurapati wrote:
> > > Enable both USB controllers in device mode on Shikra CQS platform.
> > > 
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
> > >   1 file changed, 35 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> > > index b3f19a64d7ae..006e24a62f5c 100644
> > > --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> > > @@ -38,3 +38,38 @@ &sdhc_1 {
> > >   	status = "okay";
> > >   };
> > > +
> > > +&usb_1 {
> > > +	dr_mode = "peripheral";
> > 
> > Why is peripheral-only?
> > 
> 
> On First controller of CQS/CQM platforms, usb-role-swtich is controller by
> PM4125 and on second controller of CQS/CQM platforms, and both controllers
> of IQS, its controller by Cypress PD controller. I will push out the PM4125
> changes in a different patch set since couple of issues are under debug. And
> the cypress pd controller changes are still under development. Hence enabled
> both controllers in device mode for now.

That needs to be explained in the commit messages.

> 
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > 
> 

-- 
With best wishes
Dmitry
