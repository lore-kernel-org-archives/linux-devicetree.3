Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62BB3D47C0
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778930139; cv=none; b=sYVepb320yo8h5wyW2tz+CO2sUf3oiyJSJSlJ4eZRYAvseeXbtKXhDuEi8axKApqNvCyBkPJJ58VH7TrYaCBazbLhUy3sANwBv+Keq3p0FFUQ9IYe3KgDfxZQiseSq54KxqXeL9mBOZNqlRl7Ds7VMGXRUb8a7l90e6iui2bDAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778930139; c=relaxed/simple;
	bh=h6TiMIw6ffg0MD2ukyCED/lkvFtHTR493oVJXc5NIC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSsSnbUn+DChW66HCwOdOsZMxHN8oPAwaLmYx3wSlxP4QvbpOvK2VUsBrUqzogeF9uKOwAdaeW/uoKDh5T0FXOX6iZRS1n+0nUPg8Cf5LezJSFKVjk1wI+WPixA+CHEtSK3tesiMTlPFgfVlRAlIUzrtBJnrsHRHw0obREIJ7+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgyPtbhh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7VX1NfS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgyPtbhh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7VX1NfS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G4eMS6002789
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 11:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vfGZR2NQ7loseczJC3X8TovR
	tXW5i8l1FMHSYkU5UAw=; b=OgyPtbhhYHWwvZEyPwh+7+OBXDCXHElNIS4lYBqb
	FxIyHddNkYMs34Nmml2iKgsTjOLcw2G4io3Ji9/DlFK7YPhoEx5dMUcvH1sDZJhv
	J4FYH+6gPngG8qAqPIUZRO4LPMr7ECV1eDXt9dGDHRNVGj5bmVc1Mu95PX6QvhG3
	d5UthjmW/FlDaa1cXN7i1GFII6IM0YrdII2GxLxfipRAZCMlBnvU2rf4An5k0B4E
	mWfLf5EL7pou8H/EapNOxs998l4RpANYSYsDS5G+xTn9+5CqWebxNtXJf5hssZvs
	8CGw6Prmwy45AKF29rH/y8pCpDuwHT0lOQhgLuWCoTU3Gg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hrggm76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 11:15:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-910469891f6so215586285a.2
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778930136; x=1779534936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfGZR2NQ7loseczJC3X8TovRtXW5i8l1FMHSYkU5UAw=;
        b=i7VX1NfSqEpaSigHXsf6LWm9K098GeIWD23p3I5J89dzkmc5Sq4fl9poMaZVESsAiu
         A+l3AejcDWfzhlP4E9yRJeNz76JaDT0gnrxRkPX7f9npZD4TyUl10HvSReu/81wn3BAl
         U14nQSxcL9wdL1JYpzsKPENWkhbyEst6TFSDWOHCgoTG66XqCjyiSPPVpmDNPAtnV7gV
         Ka77ZY7NQKQWZDGWzHJFFe9orZOYgKmyct/5JGv2WL7JHO9skFckIUEPY74qelnevqQA
         TU1L+5BGutQSCHxePCp0+tjIoUd2leHtae9csReLriaTz3UyywOWQHaQ2grBB+cETagD
         FTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778930136; x=1779534936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfGZR2NQ7loseczJC3X8TovRtXW5i8l1FMHSYkU5UAw=;
        b=H0Fw0dHgZNh6VALJGRHTfaBRwpsD7+OvrZAvRl/AIwMJ6YqC30aU2BL2G0IcV10MCc
         R/oahWF1qwfPchtycLXEaNlrSic95g6Gndc/hZfCCaHcHSA/F7cf36PlNxVz9/KW6jmN
         6Bqn5xyLx/6l5OTBCWTwIXJ/Ej6YT+WbGGnUkQdFQw2vI3aTvxutIsmElOzAi7dEJR4a
         H0vMctD6bfZWKBCaEwlY8QaV+c+mZDxm+HeHaHOIgiGM0e5FuR9sz25TAs83gIcD94tx
         vLyluy0L7jCWvtuhc6b3WZiSp8GE/QwbaN8CDzo3GNQ+8mkBXRKa6e5mONi9wuhveBPW
         5mhg==
X-Forwarded-Encrypted: i=1; AFNElJ83/BWq//s2ko4hVDXRayujup43Z63D9P4AfAR07IZAlIDK0XYCcCjnjQuUFJwr4Rfx2otWOo3pm3Xs@vger.kernel.org
X-Gm-Message-State: AOJu0YwJk/EUZIeedctZUPjy9MT5U6GQqSaauOBJi9wr3A96tk09s1ES
	mCy8YUQYqUMVvLXFipJuTeJcggpBASS8jNP4L2WPuGhQyctcOkoNTOd9ZYPViETzZX/YMW5kEpw
	YXJwdOZEpDva1iPcq8aodaDmlXgruOw8xXra4kWqUMSj9aIexiXlUMfB2WL4nLpQd
X-Gm-Gg: Acq92OGFa5xQAtr+jFKXCUcEfaBgjEisv6eTF2pPVVb4McJdzPsFZ+JpWSMsv/30sN3
	F9bmYcSiBsLVKymJnHbyndL3Ocy9j31FSHs8AR80pUXLepLyD4j42ywEjf0HymxUBUOBGoZQfmT
	vSwI+mnI1K6g7S6Vwj8fNYA8ZcxPkuDY8R5lp0NoGvqRFK8+z/r5gs4GbzwCOP6RLe8XQItmQCq
	60XgZVJP6PWuVPMvuQrEocuiCgSFwj/E0GxEi/vKdhAX+Sp1bWFfSFbdd/tGzMc999MMO+Sgyxz
	sVooxK4GoLbyjU3R+jHtxSN7qvw6DYqF0fa59awvZ25jfw3zBB6TyV0hRFTtvFFXI4y14NNPtFA
	1kL0cGrWJ79XMPui+nlbgAwWq2dyk58rbvUk=
X-Received: by 2002:ac8:5fd2:0:b0:50e:60d7:b272 with SMTP id d75a77b69052e-5165a1ec436mr116729371cf.41.1778930135730;
        Sat, 16 May 2026 04:15:35 -0700 (PDT)
X-Received: by 2002:ac8:5fd2:0:b0:50e:60d7:b272 with SMTP id d75a77b69052e-5165a1ec436mr116728711cf.41.1778930135133;
        Sat, 16 May 2026 04:15:35 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2ffdfsm19598825f8f.15.2026.05.16.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:15:33 -0700 (PDT)
Date: Sat, 16 May 2026 14:15:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <zkiuqa5u5e72np7vkv64cngx3szrm43bl4q6lvi6ywnqqwt7ev@okrdnmbcvysr>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
 <20260516-sheep-of-radical-popularity-d0cdc5@quoll>
 <mxgc3iogd2z5m44xffvqc23cdg4mregw73vslujcdr3ff5hyvi@zqgseqplhoey>
 <daa10a6e-7122-4133-9040-2a5de204283e@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daa10a6e-7122-4133-9040-2a5de204283e@kernel.org>
X-Proofpoint-GUID: JnY-GLE6koxsETF9BbK16tAe-INzgSiQ
X-Authority-Analysis: v=2.4 cv=ApLeGu9P c=1 sm=1 tr=0 ts=6a0851d8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=21epgW_-x8FTEKUuaMAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: JnY-GLE6koxsETF9BbK16tAe-INzgSiQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDExMCBTYWx0ZWRfX4prLTwIDF2U7
 ceDVVBfnAoM2JRCAgmvqsG/a/NLlqfttWJQRLLoAf5l8Jg8LckghVScaYTVW4g/6tR6qIlBceIQ
 lRQCI/RHj86wEC8GNbVLhRjEHAIxYuyUZRHPsNsh2uPDQNAOHR142WWAGInGUlV8GAWjwBWyhJK
 jf+h8hih9qleBkTU4vUz9+TKClUZNG/zXKX46mEv2WbE5MB0QmgMvSBrlyNuFjh+mHVRmWhbmBU
 QWdNbnPjKGxSK/M/x6hkMPYVtc7UPvAbgYFUhvIAMWQyvu5Hs/GlUboqMtNQWRIIQOdVHuVG0lb
 QYYBMkIOJOT1RMpQay9n17ASuMiu1QMA6/UGtFBKmbYH1z+cTJ0UcpPNlBzuXK1PZD3zoc5tidw
 uS2/PvRwAYVT4DRgCwOvZL43sqDPOUTXoN5kYDQebKiYvc7NHOhKr6vDSlHJ1tYvtA28mw5TeR2
 txJ3zSl1daCh92mGHTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160110

On 26-05-16 12:30:41, Krzysztof Kozlowski wrote:
> On 16/05/2026 12:27, Abel Vesa wrote:
> > On 26-05-16 11:58:56, Krzysztof Kozlowski wrote:
> >> On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> >>> Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> >>> boards. Both boards are built from a base board paired with a SoM which
> >>> is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> >>> LPDDR, eMMC and UFS.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>> index 2741c07e9f41..28a18254b4b7 100644
> >>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>> @@ -63,6 +63,8 @@ properties:
> >>>  
> >>>        - items:
> >>>            - enum:
> >>> +              - qcom,eliza-cqm-evk
> >>> +              - qcom,eliza-cqs-evk
> >>
> >> When we talked privately, I asked to mirror Shikra approach. But you did
> >> not - it's different from what Shikra sent.
> > 
> > Because I think it is wrong to describe the SoM since it can't be used
> > without a base board. Listing SoMs is useless, IMO. But maybe I'm wrong.
> > 
> > So my reason for doing this is basically reducing the list to only
> > describe entire setups: MTP, CQM EVK and CQS EVK. No SoMs.
> 
> That's really unique statement. All or most of other vendors, including
> the most popular for SoMs - NXP, use it. But of course existing practice
> is not the sole reason.
> 
> The reason is that it is the same useful as having SoC compatible. You
> cannot use SoC without base board, then why do you have SoC compatible?
> To allow quirks for the SoC. And here to allow quirks for the SoM, since
> it is a dedicated and specific hardware component.

Yeah, makes sense.
