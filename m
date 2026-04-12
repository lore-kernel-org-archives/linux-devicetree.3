Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C86284B2F
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 00:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775954478; cv=none; b=sHUkl5ydgoYDKTs7qIuG2n0c4MPqbULwp3m59lOlVTv9b1KID/+2pluB35IeS/ze1TaCiHBmhwXTkS93EyGNOXyszRu6FuVSopD4fkb32lD19OrA0Snmvie5wGBArPZNlKS51Z1yEFHCTbiTm55gof7ZSwrM3hxM1BCPCS29JoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775954478; c=relaxed/simple;
	bh=rQYUtrcd6q9RdA0Nc8Xx3VIF1B/uBZfEeT9xSfQo0ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuPzm/jrwortE/Hj1PaR1umzpz6RHs6DHNIqNUOYVxKoxDD9ReC43J1xpXUug6cFlSeBuHHupS0J3wDLfqYbV+ZfYmPvS60+G2+GAzdgavJBQvMItHUAkDwHyzkBM44/Pr1uZQwc6JG6qX+BRBBHtNPEkkMHAk83khiKRjM4fVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8sJJyMs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmM5YlqW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8sJJyMs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmM5YlqW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63C00Qjw2933816
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 00:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iHGr+GrtNhKVXfyM/WZywZLD
	0ejh+T2wDtBuGRQYEO4=; b=W8sJJyMsOmaSub7t0HhykNH6AzXYCnmjB6pe1GxD
	iABGU15b9fi+CyRap+CDTf9i3hz4IoNaz18T4sddlkq1iTHrBjMswT0M+xhNVUuU
	eGBncuyRQ+gccuqT6fy956xYnGhOgPne+J6quaamxK1k/JydiFfl+fTcJhd/cINS
	SFtr74U38g+fPjTfOij8b+Cgli8sY3867/gFka46+hvNrTdctvh+AyBt38Yu2g6v
	Z0gcb80Ev7jXzc8a63h8VIij47lUfUWyF0NKAm+V/05mCPpVzpCtHL8Y0je48t0l
	T5Fiuf6sHFdGhs3w987tN5PcKdUsRO+M0C3KDaDZDRMAoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevthkau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 00:41:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da31af14cso35492201cf.1
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 17:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775954475; x=1776559275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iHGr+GrtNhKVXfyM/WZywZLD0ejh+T2wDtBuGRQYEO4=;
        b=OmM5YlqW8jJizC9APonMnL0UHHZBrMu1vlmYicQDHdM260B5SVOMRrh4zuO+UtUBNL
         s5Jmc/qgtHzCMySoHP5Cdy88Dsdpo80uHmeS4ejjIlwbqvyUZB0MVCfzODBpQyWzzw7h
         ATdw/a4JA1OKNXZwvxRDC+6yq2CgkMtDW3uPijKF5Rf6ioUEzuCKyZ7x8uVpYvIZCmQi
         enYIqaoLf//snjei77VvTuxkkr6/v/jcTgxN0yrbFjz9MGwwDeYwpVWShVhQ6spqgVcJ
         yA08PPQSrvpj0SGiVBQcyDj0quWUTGQmiBVOWYYK4bRyoz3HVJbglaRFfoSWbJzcgiFV
         zTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775954475; x=1776559275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHGr+GrtNhKVXfyM/WZywZLD0ejh+T2wDtBuGRQYEO4=;
        b=LuBDCXOSZq/VHEDl2MA6FoUXQbp4f5/C1H6PpCp0tpyrYJxVaAQa2KubZoEh8buDG7
         UtZGcnA7Fa9Z02/j6UMVyQxpeBDTpwJknSVzPeRb7GwzjpzyPXNqHNz+kPJreMgDBKbY
         9hbSQ4YrxedQQ8g3V/N5clmiKM9SJfiMs8f0c4tXM8V6tZydOCcA1z/LmHY3ZBZqZnyD
         XWMBfV0wPF3QzPdXfnRDbDp6vvt/DycTl8Zcj5pYesghhvssUYsZaZQttMuU474E6n8/
         UIHIGTp7RdBKFhTwvA6/T07ExZgOskuzq52vOOGRtFScd1cu2lVugPmIYPgc2vUx+n7V
         kOug==
X-Forwarded-Encrypted: i=1; AJvYcCXxda5xD7SJJMyRuRMeD/ceLZYiuGDLl3bkF9TfVZ6+QtJE7JkzI7ujZXbA9QiBVWoxkZJ/KJO53ML/@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFwvrseW65sbuR1apyZqS706ZaHEM3ub8s1yieQ1Sm9c6w8c1
	skGlf6LKDaz8xRVMRHD3+qOVLkdSgWFUBOHntaLlrGrR1yWRoLgZuKKs0wsBlWSacO4eV0lAYLS
	FyFRp7F39DjPDKlYSIcb0iYnfN1k0Uvy1FxKy2094MFA24rIW0OuOEKsi1ikrhGa6
X-Gm-Gg: AeBDieuOzYcrmcpQo80H4CaYj53CCI/6qrdmHGtO3G9gw+JVbPLgX2PFcFeL/g75upa
	4fBHvCa1H8zFz5WOPA2zYlXEANqyArtI36Y/ISCbXIOc1n6TBdMvWPXdWLWm3xXmwInn+mposCK
	oDxb7eVOi/YDuvg4pdzjEGJf11J49xIvSYbd90PKCDhoAjEHKec2fd+QRdByQOYvAucPRnnYeVO
	lp+UoyI2P316A0s3ujAklLkJM60sHSW/8IKN0whlzkrLlutOtZrK9PEWlJMyk5hCXl6R5TZhvkE
	eUNQYNHs4u800zVbLgi7wXP0w66GTxFzR8PctMi8EiuBs1I+bq0Fc82ci7BcHv6ug9iGrydjmrS
	SQatBSYEe+Br4nnsqhApAGPPIuqcCMrJ8YeRsgqoxtwr/mTqpJAwu8JmvwdKTxZ1Y9S9BpLAqXa
	zJG4VAChR5ZcmdFtn6r4IdvHzJxtpZdYZrm4k=
X-Received: by 2002:a05:622a:5e11:b0:509:26f4:64e9 with SMTP id d75a77b69052e-50dd5c12ca6mr129340381cf.51.1775954474851;
        Sat, 11 Apr 2026 17:41:14 -0700 (PDT)
X-Received: by 2002:a05:622a:5e11:b0:509:26f4:64e9 with SMTP id d75a77b69052e-50dd5c12ca6mr129340151cf.51.1775954474407;
        Sat, 11 Apr 2026 17:41:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm1732836e87.19.2026.04.11.17.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:41:11 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:41:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
Message-ID: <cm7cowdic42qziuwpe22b2yuakg2k5lqcdnfs3mspvbvprnbto@6kxucxrbnsc6>
References: <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
 <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
 <8cd9693d-9ec0-4173-bcca-786915b5c4cc@ixit.cz>
 <xbbaffnmi6z5ohzw3p4m6ox75gasgc3nw5cf6yo7h3td2bmsrb@px2mntm74rhb>
 <5b45a40d-54a6-40b5-b4b6-eac344827dc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b45a40d-54a6-40b5-b4b6-eac344827dc9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69daea2b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=SXzkmgPmAAAA:8
 a=VwQbUJbxAAAA:8 a=H3Mb8alF3vWSKgz9c_UA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-GUID: zRLFnELiX1aexe7UwG8JU5q_0ED30G6d
X-Proofpoint-ORIG-GUID: zRLFnELiX1aexe7UwG8JU5q_0ED30G6d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwMyBTYWx0ZWRfX7HWr3FwlPoMF
 2bcWeeJ+rRaEvlBHtSwLxMsOShRf6icYAXoInUqX+WgD6ppNxWdds20u08ZDZ3nLc637yeOGJ+P
 3DjJNzzdaNtiePH4HIVRFjpiQoUtrtNvATpwRZaWsUq4IH6hcyBjMKtNOo8S485usFlLTAtnBUs
 Q7+ZiFReCd0ARz4ZGNOKUcDjPsjtMROJAjq3R9kqyVmxvyBm4mMoeZ9P9/+4aY5wofOcoqnBqyd
 ldvK6v8UB0Mq65dmKp7twpX7L6R3HVYv8ZQHygUjkLHEPmrQLkEyu+h4A5HyiyrjUeYK7UngFW5
 62E5AtnDJv5buYBteS8vbZszHQhvPA7Sqp1LYf930WwA+L0mipDYjR2wOtZyx13b6ebUqeYRXIk
 ZVO32IzAgzNd/XDi+9mRiAQ6nN1nssMpifSWsMb2QjfEultorGxF4tSpBUnwpAUOJN/dpf2gpWd
 GQ3VvEIAiwmULEVklRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120003

On Fri, Apr 10, 2026 at 10:55:53AM +0200, Konrad Dybcio wrote:
> On 4/9/26 11:24 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 09, 2026 at 10:38:15PM +0200, David Heidelberg wrote:
> >> On 18/02/2026 16:59, Dmitry Baryshkov wrote:
> >>> On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
> >>>>
> >>>>
> >>>> On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
> >>>>> On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
> >>>>>> On 2/18/26 12:18 PM, David Heidelberg wrote:
> >>>>>>> On 18/02/2026 11:30, Konrad Dybcio wrote:
> >>>>>>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> From: David Heidelberg <david@ixit.cz>
> >>>>>>>>>
> >>>>>>>>> If the OS does not support recovering the state left by the
> >>>>>>>>> bootloader it needs a way to reset display hardware, so that it can
> >>>>>>>>> start from a clean state. Add a reference to the relevant reset.
> >>>>>>>>
> >>>>>>>> This is not the relevant reset
> >>>>>>>>
> >>>>>>>> You want MDSS_CORE_BCR @ 0xaf0_2000
> >>>>>>>
> >>>>>>> Thanks, I prepared the fixes [1].
> >>>>>>>
> >>>>>>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
> >>>>>>>
> >>>>>>> David
> >>>>>>>
> >>>>>>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
> >>>>>>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
> >>>>>>
> >>>>>> Please don't alter the contents of dt-bindings, it really doesn't matter
> >>>>>> if on sdm845 it's reset0 or reset1, that's why we define them in the first
> >>>>>> place
> >>>>>
> >>>>> I dpn't think that will pass. Current reset is defined as RSCC, we can't
> >>>>> change that to CORE behind the scene. I'd prefer David's approach.
> >>>>
> >>>> Back when I replied, David had a patch that removed the current RSCC
> >>>> reset definition in dt-bindings (at index 0) and re-used that index
> >>>> for CORE, putting RSCC at index 1. Perhaps it's better to link to
> >>>> specific commits when making comments, note to self :P
> >>>
> >>> Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
> >>> work.
> >>
> >> So, finally I spent "so much effort" (read throwing it at LLM) looking at:
> >>
> >> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
> >> iova=0x9d4bb500, fsynr=0x170021, cbfrsynra=0xc88, cb=11
> >> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
> >> arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
> > 
> > [...]
> > 
> >>
> >> These (or very similar warnings) are around sdm845 definitely 6.19+ /
> >> linux-next kernels for some time, but pretty harmless.
> >>
> >> LLM suggested multiple fixes, but when presenting possibility of
> >> implementing mdss reset it found it as most preferable [1].
> >>
> >> Adding MDSS reset would most likely solve it. It's not critical, but not
> >> nice to see many red lines in the dmesg.
> >>
> >> Is there something I could experiment with to get closer to have proper MDSS reset?
> > 
> > I don't have a sensible solution at this point. We tried using the MDSS
> > reset on several SDM845 devices, but they just reset. So... I don't have
> > any possible solution.
> 
> The older context talks about altering the existing dt-bindings values
> and now we're at hardware (mis)behaving? What is the issue here?

The HDK and DB845c reset if I try touching MDSS core reset.

-- 
With best wishes
Dmitry
