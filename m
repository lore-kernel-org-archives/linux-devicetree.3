Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CE53ED11F
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183787; cv=none; b=k1ifOIXUgTjLqU8WTmVni85WyDUQJkRtS6m0KqHoBvVZf5rwojPuophOiolkUBfyztlSsNZdHiIEIKnOnqN5vrrJ1trdXCdyPfiqCX4fqqAdF11wZGfPi51e4XqBetUizArqU7srChig53rHWkaG656fdXrLQQIcOXbm395CgqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183787; c=relaxed/simple;
	bh=kgw/leoTGxLg1nM4bVOPBMAHfXyZK4DgC1hU9LFGdgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0rJdcJc8yNCc/dhjicbOwkumg89KOMzWumNwrgHAHkV1GjAPn9jD3CsrVGWTNto//VNfu2gJhZMlHduA4XszHJypxLrgSJLnaAQTzPk+U4qHX1YmVR/lSXCMbaAFySwtgabCrzlj+OWqb7KUuDY39S4T3X4l5dIsvblzPpYaP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0qRYGIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2sOLzVj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0qRYGIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2sOLzVj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG3Llj966032
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bZRQgoLCBjAmnWjcXVkk69tN
	DPCR8v5dAL1Ef6k4798=; b=i0qRYGIfqjbdY9YvaCzgAHaKmu7aCzWE4cqoLRJU
	IDcnIVbQaWGT/t27rqJgeoF+XbjVFGxNnIIYHDiADTCmd10IS3aXkOkm95Qs/hV9
	6IunnqaS1iCLWMFO81WUF4uB5XB1BkW9FZBkAs1IlX5enM+yDqE3qoIDF0pR1Jmg
	ETW9E8S79ssPTs8iGqZSyEIexREz/F7YPVK34a6Vxs0uYvQJJLJnqy8dI+A4OeAf
	PxKV5U+rT55Do4zDgno8olPVsTzeUBQvlECKD5hhRT9tW8qfKMGJS+ClkMYXBtHh
	42D87V+E/knOiw9JNkwNqGtAJt0WSfHehMVCYmD7azwuoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrs1r30c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:23:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so154217151cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776183785; x=1776788585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bZRQgoLCBjAmnWjcXVkk69tNDPCR8v5dAL1Ef6k4798=;
        b=d2sOLzVjj8fRiYuqMtlWtzd9HvA0jVeI1YxWPbqp6TEf/dT/1Jl2OYSSa3UhJFoFY/
         eL39qyiKy8CEeAGG5U3U7W1OxVbeuiDbx7SHm1bJByFwTZ7lXyvF4/sTzL2wpvnuRufH
         0/8Vjmyu5nfZOBN2GyhLCGDWRcy4FBQfLTX3H3H4cEGlQAE2NCVdXOj42MOp50rK9g2S
         vsrfBj5IqczZItC365nzfwe5OsOI92UUlFdFhFKgpEYZ2CM/AuYtHYB/CsV3sImZuK+x
         D1yuoS+zo0MlPeNdnK5JAFS7PeDxXDmnOyVxfVZkeqrhrgnEx3LCcMP1FAhls9l12aa4
         ZM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776183785; x=1776788585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZRQgoLCBjAmnWjcXVkk69tNDPCR8v5dAL1Ef6k4798=;
        b=myFUHM318noXiw39GI9Zyj27BQXSLiABd6iPGull3/jW0kiWetwwUgmcXmDmr4lyyB
         /MqHUMtHLw7bhrM0gUDzqnwNoKI9eFA/ZXzqmn3njGXoWtobOx/eenqov73dPHCRKzZZ
         gUItEUonLK5XSNfg1eps0GTGOVSJieFNotS5dptMV8zSmfAIK81bAlCKSp9KxlMFIjXF
         TKNqMsP2ljbYFNDCrwKdR/ssDx2gntJ5vbal/3LdslpM25qgWAHi5T1QtNTEv+oqUyqA
         yd6fh7IhFxM8RpEIEcfQMzHzJcs07CSLRvu10PU1irPq6O68kixiJJ8mtdBz+zUTQsq6
         xVEg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZVVFFO+4WeOm3BfcWjKtFxZ0g33AcawL3MN9oWoOFkDkWC/kEgIJoZ3XBejS6hmStpZz4/ygJumYK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeim4bffe7Y+9yUhaIf9RIMAIHb6RNaWBOnoKyhxrJmBxp2xE6
	gbE8EA9ACDnv3kS6XCS6ilo7YpClsh34NLxVxwWh/OfxwQThKydxuc/78cgGdD9Hihm427ldely
	9st+tko5lpSyIur+n8IMX5/LJbg3uyyiFJkhNb8WxpmciShcNvMDiqaEsHxJ/8x3W
X-Gm-Gg: AeBDiesb+tvMiZ70lLxXG+6Isnyr43QZAG59oyLtPXX5TFaWAme6hY3jlJaoDxajsqV
	L589G5gDMEktp6djb1InVAaUF0zq41mR96tzVZvll1CrBqUl3caS9H4nBg1jqree8bLS1jOFlnu
	Q0QJbbzm3s4tkog5Mvidngh1gRd+CYOx0COaQlUGFLgAoCE6Ghr/HVMdSVpQ+quBSO2st0EQuIx
	S/tQ/gONRwObMDnm2K09LLno/c1zejFb0WnDk78xcyayQeycLOoK4nxVoQLDDdO0cKdU+4geRwL
	Ccy1ATF59zxQnyVgMo0bSngdADHdPgqz0akF6HN7nvVpvo/iyXIIDAnb0FUU937F01imHSuT/f3
	izevKz9NWwWnSgF+C8oUOYUwKSZGLTG7yFuIJH4CVP/dzdx/zk2JdWm7SKaWscdzcWoH992pf/Q
	7EhHv6Lc4M4xIdRiPLZPxqdHRLW58sbEDS4MkIlS/bAnPBbg==
X-Received: by 2002:a05:622a:18a2:b0:50d:7a0f:faef with SMTP id d75a77b69052e-50dc1acd301mr299908311cf.22.1776183784782;
        Tue, 14 Apr 2026 09:23:04 -0700 (PDT)
X-Received: by 2002:a05:622a:18a2:b0:50d:7a0f:faef with SMTP id d75a77b69052e-50dc1acd301mr299907361cf.22.1776183783924;
        Tue, 14 Apr 2026 09:23:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49541dd1sm34362721fa.24.2026.04.14.09.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:23:02 -0700 (PDT)
Date: Tue, 14 Apr 2026 19:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
Message-ID: <5z7zoybn2gqsyn3zqvjo7saq2zjpoimkp67ubqenlntzcweyz3@rkm36ya6j44f>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
 <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
 <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE1MyBTYWx0ZWRfX+8TQBDF4YDfd
 7/AM4LUmmfP7hXG6PKgcYu3mgrmsDWwAxzo8b4AIG0b0TFEGeZbcIHdPdyLo5VH25h69i1rqTQM
 kGoGbP6NCgyXuDYp2ElqaHQYcBzdkPq0nOdmWpUGIWPTUBJ+TP8Lb0sFHWZ6GJTOqS9Fr/hVl1/
 m7SLAzFhQk4Yi+LPq8ih8i+PRv9dxVsAnY8Fw5K7u+GXlYNiQocS6Y+3X1F086cKyB0K+LgGgXN
 QTLY+zDgMMwfD7mCCD/RpWOSRKjTRy70/wrr3GdE0OlpUlvcB51PyDcn3xEz+ZHLxLsCkEumAIt
 kghMEeNkDR32tCniRNNb1Cy8ITIEP3f6qMrwCpKg8u6dUSO1lcNy9SM92YMe+aQzBcT7GmbH6wz
 uDSdGNr44W87bs/mq7BBRIIYB1LmHe1ccDFgywStPc5yhRvREjBeI8ajatJv4j++MuPumG0LvsG
 PG1VJargV1CSwySJcCg==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=69de69ea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=5-FrFs3OjuvqJegpMgEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: kFigGrfNuAuA9cBw2E2EUQd3GeaC0uXj
X-Proofpoint-ORIG-GUID: kFigGrfNuAuA9cBw2E2EUQd3GeaC0uXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140153

On Mon, Apr 13, 2026 at 10:23:59AM +0200, Konrad Dybcio wrote:
> On 4/11/26 4:32 PM, Dmitry Baryshkov wrote:
> > On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
> >> The PDC has multiple DRV regions, each sized 0x10000, where each region
> >> serves a specific client in the system. Linux only needs access to the
> > 
> > Nit: there are other OS than Linux. Would you rather point out that
> > other DRV regions are to be used by ... what?
> 
> TZ, HYP, HLOS, CPUCP..

=> commit message

> 
> I'm wondering if we can make use of the HYP one on e.g. Glymur, to
> parallelize accesses (and whether that would bring any practical
> benefit).
> 
> In the RPMH architecture, each "client" has their own (GPU, AOP, DISP,
> etc.). Then, each one of those clients may have an associates RSC
> (Resource State Coordinator) and/or anyOf BCM ("interconnect"), VRM
> ("regulator"), ARC ("RPMHPD") voting interfaces

At least the RSC should be visible to the OS. We don't use it (now), but
we probably will at some point (at least the DISP_RSC) if I understand
it correctly.

> 
> Konrad

-- 
With best wishes
Dmitry
