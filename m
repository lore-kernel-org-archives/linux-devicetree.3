Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F4026F2B9
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868068; cv=none; b=DiNjAVN1IBeyqFbPTcQf+ydQAqMDBpM1OcirCqETi92LAIoAXjKV4EtjRsatuP0RF9Ai0zccQ+RE6JF11hMYiD0KTOnAeD2WNg36MAyCwJxBSsoQN7WBpsbVg9f9kOQY5Jy+xwxDrTjzqFj6dC44EeXDqAxJbmiZTWUXAWjiP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868068; c=relaxed/simple;
	bh=WUi9IVh1uvp6effJJAPZ0/Y2/6N7smtfbdxTBxkOs1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncD6Xs1qPU3z7KRU/F5mE3U42GYUPxNjX4dmN3BG5pFVbX89swFZKBBg8QkLj7fPRkuI/erwAhkP8K8yOGdxAT9Usa9thI2gX96YzG0iDHUHlouWuAC6gVvUVQeQDHo93iJ2/iL5F3DU/oOMrWjw0VNrPBRJIpL1++TsCTZxiCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxOWUOxe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yao2dEOu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxOWUOxe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yao2dEOu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9SAMt2952604
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YJ2JyPcsq9U7DBDPSkaRIIZN
	3F7dFSJli01wQIXyHhA=; b=kxOWUOxezfoWxwQMCYUlCUdCPZ3DGBLjMBmxGhT1
	7ywWYoZhPO7oIq8IhXJ+SnXf8Xb+cybDimZKpGnyzdtrfIYBNOCf5i3BQ6fhGQkR
	EOZ4mwPFvF4E9Y9UMdQJCPZmzHvGwTkj0NObdS3IHCp6TpVVMOSGNWDfFQ017XXX
	+jWzB1dIsaIgAccs3kqZt8fvsWfo+rztzLcZWPyg00aqWeOV/zzFZucCZEP4zljE
	8+S05h3Z1dDBDLDk1Fht/ktH902skXigHkhwvMuKvKj7BEx3xgS7LkcpJ1WF41AB
	CCpeTSwoqUZ72l4H3rJ8rTZK07XOLY7+qIxfqe6cDDdHsw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqeknm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:54:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4987c698so75252971cf.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774868065; x=1775472865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ2JyPcsq9U7DBDPSkaRIIZN3F7dFSJli01wQIXyHhA=;
        b=Yao2dEOuyrjLmPDefz85hjUgcbHkoByWtJiQDVr5gVRFo/XG8zAachsq1Y2Wu3/6fX
         CZrUuFYTxWSeQrm8zn7fng6c+KIvFxo/+721NPISsxwOiieaf2OgVUOYQRJ6IPGDyVt8
         bzWw6WjYppWNyY0z/t9EZHtMC07eW/rf62BTqnFfu2qceo43l8gmrzNIVtK5yWEkXf7f
         G8xlFEwzkt9LySbRZiRbUvnPVCRdVMzpRvH2KjgcBCiT7G2f3dn2Zgsq216vhG1CiZ2W
         a4m7//3jA4MWGYpGeqS92OkbiguMeMuWzgxFaqgFCOGnTe2yUsUiV9hVkYMkCA32R3eW
         gPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868065; x=1775472865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ2JyPcsq9U7DBDPSkaRIIZN3F7dFSJli01wQIXyHhA=;
        b=C8jLsRRiaEcPWBqmiTCVFpmcJYsHnmTyuW2HWfCIHyclvG92F+mt7k9LOvKTDmVTcy
         N7adco1p81s+UqxL2PmVna2YbPcYKogAnrpz4LB212HaoNGWJ/aEUxB2nUCcPwYvSMS1
         96CCmDSPd6q6+AMBNwU0YE09sl6aczvkgqQPx+g5kJ7Cg9aBHN+ZHe93fzhSckJV9XI4
         jYY9op3oG72hlJbfbkQ/ntNsOn9f770GrngOKqjjIgCGmY+WeHWG/4O/cgH6vh4L9aIO
         dNj+mThnod2twW9+tkMsoMVFDaOKQegECIGqPBWaezhXNa2S9fUrW/NQJU96tW/1CD2b
         Szew==
X-Forwarded-Encrypted: i=1; AJvYcCUu4uOyGPbe9W73oYB83eSFg+X286yx6xTZD7cpH/+tSQxpr8XVJqq4eFcpoPhFdEfKVdaBtgwc3PeY@vger.kernel.org
X-Gm-Message-State: AOJu0YzoOWIDP5NOUZXy953aPuNGZS9qIvtZ+Xew0XKug3ridgox3ZXW
	BbUpL4bF7VMzA4GcsVF6Y6n7B8AnYe8QPweWlMjE9/fy0/oaHzgPeWy3w6qY63oauY4L9lYVm2H
	bSVX8WRwO1gJdwtw4xZLL95JPyT+4GTyfzLFfslGcu0OdUhJiFT4ETRN/FN9nGoln
X-Gm-Gg: ATEYQzxi5kroPyC930Oqq3lmONLU+0/SIpXM5zAaA4ikTV6EFSBOKa1vG9XUWgGyfUo
	LI0wbE6duJiTCqFS7OX1FBUwM6EKrkRzreVzlz4c1teyPEhpRfZ4rUv82SHKmvzhlnbOym4x46f
	SuBgPWdwN71UyQ1pHHX2/bt+TqGwPUv8Tr9vkQ1N8UeV8+qanixHJ+bvOVqt757lZzAAZMlhzMz
	Oucgg+cyhjapo5HOz3ubUXSUKxk+mkTMGHe1bXFL/sxSeqj+we9RZrPjuxnP4y6/h5XThuv8yaJ
	f1jN32Q3pJV8shF4Uv3Dq28mo77BQNfwFpf2OWJtP2dDhY3CmgLxcKaU0XFPMvePAk5qBADcqBs
	ZR8EfEa31HSNoWLtSnNNXEmoIzlmEFVVk//2MY+DN7z391KS3IpGNc0sJjfJiSadmd7qDtKpHls
	Y1onSADl3+2zOSe4kX0yBfcPHJx8TSAv2iRuA=
X-Received: by 2002:a05:622a:55:b0:50b:7013:2a32 with SMTP id d75a77b69052e-50b994a4610mr189051551cf.21.1774868065133;
        Mon, 30 Mar 2026 03:54:25 -0700 (PDT)
X-Received: by 2002:a05:622a:55:b0:50b:7013:2a32 with SMTP id d75a77b69052e-50b994a4610mr189051331cf.21.1774868064663;
        Mon, 30 Mar 2026 03:54:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145dcddsm1604208e87.73.2026.03.30.03.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:54:23 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:54:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maxim Storetvedt <mstoretv@cern.ch>, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, marcus@nazgul.ch,
        marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        abel.vesa@linaro.org, abel.vesa@oss.qualcomm.com, johan@kernel.org,
        konradybcio@kernel.org, kirill@korins.ky
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add Samsung Galaxy Book4 Edge
 DTS/DTSI
Message-ID: <gjdp5kg2xffiequpfo2bjuafx3qjulltopid5z2u7jft7t7jwu@gvugwogdeenb>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
 <20260322160317.424797-4-mstoretv@cern.ch>
 <881975ea-cc16-4b26-9672-731c146a1ba8@oss.qualcomm.com>
 <40e31e2f-84ff-425c-a7e9-f2df4210ddbc@cern.ch>
 <892fe03c-f3d5-4b6c-b821-95dad55fdade@oss.qualcomm.com>
 <f6323f22-27c8-4ae5-83d3-59831b62b5da@cern.ch>
 <12ee3569-16a6-4787-a874-bc802a50175f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12ee3569-16a6-4787-a874-bc802a50175f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca5662 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=S8eb6fA3AJYBljmed88A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: TihWyx5ZSvEHulYwjDBFRyVH7Kx_s633
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NSBTYWx0ZWRfXzdXFEAZro0FX
 tN8/4BR2L32Q6dHD9HjL69vqYSG1sRTq5exZ/rv5ejVscCh9SP9vRAP+aXZXKl83M169bqJ9tDB
 4tY8P01VLJ+3Xj2K5E7lJYRPQB+obpAWrqtSBghsDwYQB7LnMZveAkUWwbEN5Ql8qLttm9qYE+P
 kcOkE2aF5R5EJeARBUvqg96aNL3TwTpNQnwcH/uapQHa63tqsq9q1U47jhhDx8XQ/3OQWY44Fp3
 iuBh3ty5/8A2Qa1kpdg7uwEUiP5qM9cVKq/PRGPl9WOWkn6yIAzHiMeuuIth06hYh/U0qf2ZHVS
 fqAxahIUKTHUekrqv2y9Df74ZsjabXjMFqYZB5VjTvXMQRIKajf0Dn3vYwySyS6B3dF0bIHjIey
 0NvPgQYn1AUZti+cz6wVhE0NzN2W8ycThG1/stdn7P1zGx2SpomgGfDrSkKU2ufWJi0e66+96oD
 gxWkVo843m9pKWaqsBw==
X-Proofpoint-ORIG-GUID: TihWyx5ZSvEHulYwjDBFRyVH7Kx_s633
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300085

On Mon, Mar 30, 2026 at 12:41:57PM +0200, Konrad Dybcio wrote:
> On 3/26/26 7:30 PM, Maxim Storetvedt wrote:
> > 
> > 
> > On 3/26/26 12:33, Konrad Dybcio wrote:
> >> On 3/25/26 7:30 PM, Maxim Storetvedt wrote:
> >>>
> >>>
> >>> On 3/23/26 13:17, Konrad Dybcio wrote:
> >>>> On 3/22/26 5:03 PM, Maxim Storetvedt wrote:
> >>>>> Adds devicetrees for the 14-inch and 16-inch SKUs of the Samsung Galaxy Book4 Edge.
> >>>>>
> >>>>> These use a common dtsi derived from nodes that were able to work on Linux
> >>>>> from the initial Galaxy Book4 Edge DTS by Marcus:
> >>>>>
> >>>>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
> >>>>>
> >>>>> combined with the ongoing patch for the Honor Magicbook Art 14, and its downstream by
> >>>>> Valentin Manea, which shares device similarities:
> >>>>
> >>>> [...]
> >>>>
> >>>>> +&i2c8 {
> >>>>> +	clock-frequency = <400000>;
> >>>>> +
> >>>>> +	status = "okay";
> >>>>> +
> >>>>> +	touchscreen@5d {
> >>>>> +		compatible = "hid-over-i2c";
> >>>>> +		reg = <0x5d>;
> >>>>> +
> >>>>> +		hid-descr-addr = <0x1>;
> >>>>> +		interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
> >>>>> +
> >>>>> +		vdd-supply = <&vreg_misc_3p3>;
> >>>>> +		/* Lower power supply is not enoug to work. */
> >>>>> +		// vddl-supply = <&vreg_l15b_1p8>;
> >>>>
> >>>> How should we interpret that?
> >>>>
> >>>
> >>> This was in the original patch, but using that same regulator appears to
> >>> be enough to also get touchscreen working on the 16" book4e. That said,
> >>> it still does not work on the 14". Something to revisit later...
> >>>
> >>>>
> >>>> [...]
> >>>>
> >>>>> +&panel {
> >>>>> +	compatible = "samsung,atna40cu07", "samsung,atna33xc20";
> >>>>
> >>>> I think it'd make sense to move the compatible from 'common' to the
> >>>> 16in DTS then too
> >>>>
> >>>>> +	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> >>>>
> >>>> this matches the common definition
> >>>>
> >>>>> +	power-supply = <&vreg_edp_3p3>;
> >>>>
> >>>> ditto
> >>>>
> >>>>> +	no-hpd;
> >>>>
> >>>> really??
> >>>>
> >>> One less thing to debug while previously attempting to work around the
> >>> "illegal link rate" error, which turned out to be related to eDP 1.4
> >>> (similar to the sp11). I've kept it as-is in case other SKUs attempt
> >>> booting from this dts, such as the x1e80100 16" (as it might be getting
> >>> a black screen using the current x1e84100 16" dts, though this is not
> >>> fully tested).
> >>
> >> So do the 80100 and 84100-equipped SKUs of the laptop come with different
> >> displays?
> >>
> >> Konrad
> > 
> > So far assumed both 16" variants to be fairly similar, though one
> > valiant 16" 80100 user over in the debug thread did try to boot via the
> > 84100 dts, with no success. Instead having the screen go dark after the
> > first post-tux kernel prints.
> 
> Does switching to the generic edp-panel compatible (which will parse the
> EDID and try not to be overly smart about it) help here?

I think it was not possible because those panels need special treatment.

> 
> > This was strapped together via WSL though, so could be there was
> > something else at fault, but strange it didn't at least fall back to a
> > visible initramfs shell.
> 
> You mean the kernel had been compiled via WSL? That shouldn't be a problem..
> 
> Konrad

-- 
With best wishes
Dmitry
