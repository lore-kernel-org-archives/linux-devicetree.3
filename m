Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38F73A0EBB
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690248; cv=none; b=Xa6gxaIsCRNpZQ4hBza6J/3IVzaRluFyfmdYRuq5tz3mhHXXeSRkczcR9lp+F0pSNidwAzmstmRA73i+/Rbm1DB4aROMU1G5u2mfwbaJKUw/501r/3rHIhwmKOT5rKZm5xF9/YZR4O+JQCKhgLrxqFzraVrXJCY/HeqjPS9OzNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690248; c=relaxed/simple;
	bh=Trk8gkpor/osngq4XuZ8gGF8Cd6HFh5WDJQJRtkJqPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUn9ZpEwuQrjUU4GDSzFm46MNkbzhFGUD1Qywam0tFxcJMSgGxFYP/uOF0t+4qzMBaWdlti75Eo01nb9LZqYf6T3+nVvXaCxFFMF3h/EhStobUcmKs9bKBI0gwPrN8NlJRbUCCHlbej4SCIFWzMuhrRHQgvg2urThQwwLUwJqGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lgvc8jY0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXGXHmVR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lgvc8jY0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXGXHmVR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvOVX3015215
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RXXwL6cYP99FpAVgoSPW7u6Z
	iYv32gJO6YC73BOhMRQ=; b=Lgvc8jY0caf41kIOS224JG7yicEysIrGJkkTuC0/
	oTeZjVWAV2mh8YFKLIa1UYPe1y4Gwu7RqBuTuKb8c689o7dTgYBqOKBtGVphjqqw
	oSDGy3Aaer3mtbnM81l9YpvpYUQjiZdZcbJJi3XyAJ5zSBBVHsAWfXPkwzlc22bm
	qqB+akw6lDAJ3MhjP8zq0PiDrn7DQj4ueQPd9UzfMpjhfsrLO7I3aygtXqOw6/PH
	hSogHbU5YogLTOqgiDqOuHYiM26FLrAbOMc24hH2+CaHT5qoXJPm1d8hBaHJtlcc
	Jjrd97e+uiUz1RyaI1K69mYNXcJFH6jQ2yMhXNTVrCPmOA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjukrcq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:04:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso6113176a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776690244; x=1777295044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXXwL6cYP99FpAVgoSPW7u6ZiYv32gJO6YC73BOhMRQ=;
        b=TXGXHmVRDldIYefqL5cTvSsSYEOjjV8LhOYt7XtMs0RPpWiF9Vf0zLlYzOsv0hHK5N
         7KgDYDQuYo2Om4xZ+S3QgYj5cD/DVtWV+BNF92aI9ZaOJdHf5uXlx9Zbw3g1vcur4JSw
         zYGBdfQVOBCFuj6V8bFe9NXuw0Xfu/vhK8v4sPrMt0n/l4scqZjW6hB46OH62ck34tSw
         dED0tWBzzrz2xi7yNIXxMD/7XTYLKCSFwR9hFiM351E6Mx2lI7+r48HyVozHA1s6mb+R
         WYWa4usT+AJ108JJEJMo6WGrmOBnPKmiZIozzX97lCj78I/EYDee0cXko2ppNIYL1fgV
         B2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776690244; x=1777295044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXXwL6cYP99FpAVgoSPW7u6ZiYv32gJO6YC73BOhMRQ=;
        b=oW+gudDsJqSHCMf25jmY74lHVUB5JBYbjUGrnJno8iaYHQ858wORzG/TbQnO3PFPJm
         OtwdTvj9hRYWjzlMM3pjDpFOnujsbXF+7gKU2CwgbtwxwSZvkUkaVPmD/yKVR6blA6zZ
         l+Rl2UKJfRPqW8Pv1CBt30qznp7tuLMl9unRMDK75bgnYsYrAiXpi3M+w3mTwpZzQMw5
         ThPd6HVIomRoPWy02PoiLTHzIJxkS5qVVn3wsNdBLfpaqMfpfjmYsflAjb7lzYa8tiIq
         3gn+cP2SbYRfYOmuigarxKNaWfn/0/bjznkePpjp4gYHzU1pO4hkI4EVM9JOPuw7rpha
         RCAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rEOJBi0Zq7JaUp5vj15SDVnKaGN8+3YvFWGpL27+/b/gtSNH368yqJolCvCxaPENeW+3iuvupsQ1/@vger.kernel.org
X-Gm-Message-State: AOJu0YxRAqROUDEJaJhq7rVzFcUSlUXj2FKIQyBtwF40LxLtW9I/NIdS
	/duovMba9y9B+JN9XNL7VGkkTekgRwnNHLkw/nDuOCXdfCPFIYJh8TEpG+lQ04986fvMc6oyRyz
	7AIr4kQ4rPB0nuo0QfDrIGfncsOivB24qao6sXWF3IedB80dXo8SCyQVQoapDXWNX6WPb52In
X-Gm-Gg: AeBDiesW2IeTryEVGVmR5sGWMkUdKx6uhQtbID2EoEPrNLGvusj+C1eOHX0atQzWRos
	+m0a7JDfxKSnErTaE9tW+n5iFoeQiXPnsq/Bk/pad68AprCKm9uczyy0WCYRJDRXBAM+Pj3qptJ
	/kZjw35o9TE+dTv0R3DpDKFEw5T1L01NOI5M2ahQe9i+MEv4OlO5zzbllN53q7xH768lNS0Wn1v
	Q4qRwVaRmmUct296EPEjoYDAsY+zeWBLUPKWavkeK1r3W1aLN4o3hChhxj+gqjh5ffQQ+560o30
	vhSWfqdR1OmoegMOMruzHiQGSx/gGQB5mfQ+pf0CMBLXwCZ/ugGDswE9X4iJSNCdX3+8k0X1AEA
	sJXAvsRyB5mTAq/roM6hzH6IGW6anRqy3m569QyQsSSWHi5M=
X-Received: by 2002:a17:90b:3f84:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-36140468c28mr13356791a91.17.1776690244066;
        Mon, 20 Apr 2026 06:04:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3f84:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-36140468c28mr13356738a91.17.1776690243409;
        Mon, 20 Apr 2026 06:04:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm32973763f8f.6.2026.04.20.06.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:04:01 -0700 (PDT)
Date: Mon, 20 Apr 2026 16:03:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Message-ID: <kzyttwrt67eqjdhqsibhtr2ue3enciusfjnqxgxr235z4z5yth@j3kkukfjn6fr>
References: <adyfWzVHsg3qo9cH@prism>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adyfWzVHsg3qo9cH@prism>
X-Proofpoint-GUID: -k4wrjixL9Z8ydu6KNID1Ej3KjQo7boL
X-Proofpoint-ORIG-GUID: -k4wrjixL9Z8ydu6KNID1Ej3KjQo7boL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyNiBTYWx0ZWRfX9BEGD1ClehR/
 JM2pKciYNIRATHqRbGDCyKN+VOykGt+zpl8iFmg59o7fH6l6FAkKJusGSymkHHV0RXYvPnHjnzv
 CMWFUNyPSqIgVQbuwe77Ate/5A+7u08fpji1UE2u2AKiJMulTiFF0DtP0V9/X+MLfIhq4xZYK1j
 pPg/nZBctuto7lp7U1ypzAgCrSVeZRaZ9N36SL4p8Vj68P71XpPOgAlmxny9lEZtWz8ZSE8mWHo
 3HcWvDnSw9UVUFzgO2CIQMpCKRs5o7pdI3BJo0qjyqBITZF3unj+7k0xjqDwcG8ZhhCaaT7hDq2
 tyu+4Q5WzgmwARoejkXLJfbpYNfCZbq6p1oiXl4ZpJX0zIM2afOn67D62sriH8hGPXnua1nM/49
 orPPCMjGKzls8XmQXpL1+CZc25PPvollnWvawxajdPFnGMTEiB9LR1gYXoM38wr4VLsT413QNvK
 3sKWNZF4SjbR5FwmcSQ==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e62445 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=i2al5Ykz3Aht5zOOcbIA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200126

On 26-04-13 07:52:27, Alexander Koskovich wrote:
> On Tue, Mar 31, 2026 at 01:37:24PM +0300, Abel Vesa wrote:
> > The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> > routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> > 
> > Describe the port and repeater, and enable the USB controller and PHYs.
> > 
> > Also specify the ADSP firmware and enable the remoteproc.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 83 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > index 90f629800cb0..c31f00e36eee 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > @@ -6,9 +6,12 @@
> >  /dts-v1/;
> ...
> >  
> > +&usb_hsphy {
> > +	vdd-supply = <&vreg_l2b>;
> 
> Shouldn't this be l7k? Looking at kera-usb.dtsi I see the vdd-supply for
> eusb2_phy0 as l7k. I don't see this being overriden by anything else
> downstream either.
> 
> Just bringing it up since I copied this part for another Eliza platform
> (USB 2 only) and USB failed until I fixed this supply.

Yep. That seems to be the case. Thanks for pointing this out.

Will fix when respinning.

