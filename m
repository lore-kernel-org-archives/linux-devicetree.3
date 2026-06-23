Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23492390999
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782237411; cv=none; b=DEmyg2a4HXPEw3dfm0OWrtX+qPMkV75a/JRA3ju8Qr65MIMazQTOtiPw1AR7R3rqRrdWoQHa62CZtY99zaEOhEwccwiUZsgnFcMD4aylLKPVA9v9TAOhNtpTSNzE9mDkUIJMEW/Sin9u5orFwCA45CBvnwiE3KNp6lZx1mttEcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782237411; c=relaxed/simple;
	bh=bssbrmz6IebSeZcV9tGxiid6TnATcUOztAaNiiKVx5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJT+MHmA+5fXO30SRhDE/wo1AuhlfKqTG7fVR85lI1/pz2hZ4BKmsq3Kav7yccfj6KwFsBn3vKOA7DS8CXsgEyqzR9dDLcedNoRiU1bRwc99oqrBurZC9v3+mPtKvG8q8tKnRJGjE/GJlWyr3Kg7IgvTuhEoQaSatwjHFrS78h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NahfPp48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XT3jAzlO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NahfPp48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XT3jAzlO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NHqTrk3744683
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K44ehTwQkYUZ6rlL7/DNpEjH
	H4XJiDPFFcvpHvTXK4s=; b=NahfPp48IU9JzRYlH/CBhrTEdYO8M32kK5Yh3JQa
	wQmmegiQhD7FbPFcbsNRb6rgrprZEe6D0wz1UJSnEDMCQDXrfLUYVLnE+0qk2Bql
	bs5nMgtT6IXqAoGIpGzbTzwyG9Ip732r/sjghjzSYUKgebW5feuJ91yH5uZVfI8k
	7xPOoF398tthlyT4CYd9d3kS9OvyR/hfhWH2GtC9mFG930VKZ/pTZ+1MSOQFsrOt
	w+plLqxpCxxAu2Yd9Bi3Me/LDC7DCZ8aK6x7hQXRGdBYn65Lh1BT1hMTPZ3Lexsc
	AeOhmQ2ycNi/IQKgq4svyu11w3tW9xS/TwZxgxXq4vqs9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eypx3aeq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:56:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8db8b467f13so3771096d6.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782237408; x=1782842208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K44ehTwQkYUZ6rlL7/DNpEjHH4XJiDPFFcvpHvTXK4s=;
        b=XT3jAzlOnkOQJcdK/m+pGN0ZfxR0hJL+Y9S6tgORoXgYn9H/PNU1uhTRJ+bwhNuIcZ
         VoC5KV41k6ViVjo47Ca/ZbFWnbnZ4zGTTfbbzGdaqSx6BARH7sGpdr8fyi+eFHq+O1Z2
         TqqM66qksY9k4lZ8WhZ9T4bqgMIKDA8tDMefXRsNQQCAp3VtgTnS8kBDI6glX0nPxjdp
         tD/nyhBUZ7FEMDLDIJyFD7UpMlm2Hg2jXQ1AdDfmIKlaJVDSCNZhGR8qP/02bta6rLIU
         zVF0AtdqcFhIX8Qp16VAk2uI6QBGa0Eie48G4pvK1TlJ0hPL/8LgfYAcPxRISGGm8EgX
         Q8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782237408; x=1782842208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K44ehTwQkYUZ6rlL7/DNpEjHH4XJiDPFFcvpHvTXK4s=;
        b=kptQJSK4pjQn0+LUc824VHO6fd1RY59iYVrn2jqoF7bHxhV31p3nlUTtJPe+zliRJj
         ZVxigGZPxCCGgfl+zgLiuY3/3N1/HJINgjXopko2nIGu8kZrmW0PiX5QUjKkh48WnyOn
         obUYdN0PW6k+0yVSnOcqqE5m6+qlSgXm9JLQS5mEWiDn1HzxjboPQa7+/yTXgove7Un/
         CCfLWR3V4Vhngr0gcekkHLvFqrMz9xTBmg4g1Tgm/2pA3VyFvD/Oi4hVlgdfwWlcezU/
         SXtKfaOn/ak0IR2v6mXtfQtCfI/BqB5y+mHELqPVj4eCEMfs15AOQGI885QQY5ikKqh8
         7t3w==
X-Forwarded-Encrypted: i=1; AFNElJ/wnQ8GTD6SwAAJoXEmKBlLMahYvVrAktzc0Fqh4ptmWO+gemQjyGSRjnGDoMvVPPDaBX1+3wnl4Y4P@vger.kernel.org
X-Gm-Message-State: AOJu0YxJHdaCgi87hIctWjxjjCPoVefQ0aIlY5HDSlIBSAG1ZHGWNDCi
	cbn/rlxFgjPgumkHEU4NSUTSFcf1xgkGg/v4G1+Ysj04xGBUEBmEGWBtbpQAUrpACJ7qP9vPnX+
	F7IN/km1KaIgncPSIEEmuQWi7fto3BWUgekR242L/6qZF9XpPHMlTZVn63fG6nHTJ
X-Gm-Gg: AfdE7ckcgWgnksg5VLCqiHOBMqLBOATBxoOr+ZrBcf6HPyCjbuAaphIzD2Tn3zYDEXF
	FUGm7jUlENkR6hT4uMfKOHkvkzZdbRG21TnTigCFo60CJTd8rOBhb1TYL1fpbcwdjvlQv0kT12q
	AHSqQU7/NsbPf9QT4J0za8VKoPa3BDhAqGPv1IeyYI6e4ESy+O8oLsb77HvsIYrItGb3EUhiNaU
	fDq1HjR+kX67nk64H6v62bEC1IUmYy/1ZAOe3xad1ndwDXkr4o59YHJjOCdjK/+0hCEv89a1m5z
	boKh+aPXuTeri0WMcOoC/n4IHI7cBI0PDRKoxchTbNr7gn2mv24U74KzSgMXiG6DK9RJywxxCKh
	OAgVPVQI4GS8AHVEi+FPsM1deg+zMUJXq3YEKOv97oaZDdkNo/K7m4f1EStz0l+lWJvou1+RlAY
	hyXf3v5/RN6fpzV5yzDjxccocJ
X-Received: by 2002:a05:620a:f10:b0:915:a762:2735 with SMTP id af79cd13be357-9278357030emr10158585a.37.1782237407940;
        Tue, 23 Jun 2026 10:56:47 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:915:a762:2735 with SMTP id af79cd13be357-9278357030emr10151485a.37.1782237407254;
        Tue, 23 Jun 2026 10:56:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a6cesm989274e87.48.2026.06.23.10.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:56:46 -0700 (PDT)
Date: Tue, 23 Jun 2026 20:56:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Message-ID: <37a4vzkiicm7aw3bg2r3s5e53kigh3wsc5yuqqjp4h6oxhpk7g@oybpt7kdnnxb>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
 <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
 <uc2l2mbobmik5workhcbtry5spe2gyamx2x4yj4rjly4t3dbrh@n34fo74rctnk>
 <6fb112ae-5919-4c8f-a915-4538d14284da@oss.qualcomm.com>
 <iws2snsi3yfddich3rqqurhwt6mvi2boushkog5t5gvo2ahwmp@l2m6ays2kicf>
 <72b140a7-e95e-491d-8bae-f98a593bdbfb@oss.qualcomm.com>
 <zzs4wgr37wfptzqwgttxdubqnyudyh3am2r6i7b56kd3lwuo2e@bjcyelaxtlq3>
 <3972248c-acfc-4b31-8c99-69bfdba34b8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3972248c-acfc-4b31-8c99-69bfdba34b8c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EsfiaycA c=1 sm=1 tr=0 ts=6a3ac8e1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=DbwxBUtuSyURhUCB4_gA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: AWL1IZsor-EP4HD4SXa4MkAexER41xvC
X-Proofpoint-GUID: AWL1IZsor-EP4HD4SXa4MkAexER41xvC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE0NyBTYWx0ZWRfX2SGbEInwdntl
 eEavr3rHGUmYd87GR8+9Tyrg+aJw6BKO7Rva81enjLwA15K81TUMl/TsVZRqtjTgCoR0uvCEYwR
 rdUAueg+iCGDFylsYWZ+lWcRxRN+4ew=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE0NyBTYWx0ZWRfX/dRaj7+cX6bJ
 8ld4ayThqSenwTmkmBYVL+YsKw/7aDm3wYfyzKY6ihzYL60Y5G1iNyfTfIcqU9NWxBtX9Fv1rit
 7dVHPFknCrHNVs7edN2NzK9ksJidEY/DNBsSgNwdX1QLCk7wOrJAEuBf/4hPYjvdV9m0V5qzdV4
 +oexiauGB38lgdZE7gQpI5ly0jr8UEvTCNOWkBW8KOm8gNOfkNpdPfGhdV2df+vBHt4RYuR28zE
 8dFrqU4Tf1uJYII75+NflwAnqdJQJiU0jF5t/sB7yu+DdqcPVkbQ3ZGRStTyjse0AnDY3MsPrAc
 4eqDgqZMlCCu381OKVQSaMdX9COJVKrkyki5NvAWIaMqaM7BWBp2UCDCpXBVvhvhBNr0qxWHcmr
 MRimnXiaHVTegJXZwOz7DwGaafafodzjkW8T5fn6svk8sWGqfZ9Yf3lzDYdd/PtzBhH3WV3jB0E
 WaK+FEre2gT11ZA0ZKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230147

On Tue, Jun 16, 2026 at 01:44:48PM +0200, Konrad Dybcio wrote:
> On 5/28/26 10:00 AM, Dmitry Baryshkov wrote:
> > On Fri, May 22, 2026 at 02:05:14PM +0200, Konrad Dybcio wrote:
> >> On 5/20/26 5:06 PM, Dmitry Baryshkov wrote:
> >>> On Tue, May 19, 2026 at 10:12:06AM +0200, Konrad Dybcio wrote:
> >>>> On 5/18/26 5:38 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, May 18, 2026 at 04:15:16PM +0200, Konrad Dybcio wrote:
> >>>>>> On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
> >>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>>
> >>>>>>>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> >>>>>>>> a flavor called USB43DP, which as the name implies, features USB4, USB3
> >>>>>>>> and DP signal processing capabilities. In that architecture, USB3 and
> >>>>>>>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> >>>>>>>> The DP part is roughly the same as on the instances without USB4.
> >>>>>>>>
> >>>>>>>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> >>>>>>>> Only one USB protocol (and flavor of pipe clock) can be active at a
> >>>>>>>> given moment (not to be confused with USB3 not being able to be
> >>>>>>>> tunneled as USB4 packets - that of course remains possible).
> >>>>>>>> The DP PLL is still used for clocking tunneled DP links. It may be
> >>>>>>>> turned off to save power when no tunnels are active, but that's left as
> >>>>>>>> a TODO item for now.
> >>>>>>>>
> >>>>>>>> Due to the nature of USB4, the Type-C handling happens entirely inside
> >>>>>>>> the Host Router, and as such the QMPPHY's mux_set() function is
> >>>>>>>> nullified for the period when USB4 PHY remains active. This is strictly
> >>>>>>>> necessary, as the Host Router driver is going to excercise manual
> >>>>>>>> control over the USB4 PHY's power state, which is needed by the suspend
> >>>>>>>> and resume flows. Failure to control that synchronously with other
> >>>>>>>> parts of the code results in a SoC crash by unlocked access.
> >>>>>>>>
> >>>>>>>> Because of that, a new struct phy is spawned to expose the USB4 mode,
> >>>>>>>> along with a .set_mode callback to allow toggling between USB4 and TBT3
> >>>>>>>> submodes.
> >>>>>>>>
> >>>>>>>> Thunderbolt 3, having a number of differences vs USB4, requires a
> >>>>>>>> couple specific overrides, pertaining to electrical characteristics,
> >>>>>>>> which are easily accommodated for.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
> >>>>>>>>  1 file changed, 322 insertions(+), 70 deletions(-)
> >>>>>>>>
> >>>>>>>
> >>>>>>> Overall it looks good. The major question (after looking at TODOs), do
> >>>>>>> we need a separate submode for USB+DP / TBT+DP?
> >>>>>>
> >>>>>> The problem space is as follows:
> >>>>>>
> >>>>>> After a TBT (collectively TBT3+ and USB4) link has been established and
> >>>>>> we have a link partner, we may (based on the HW capabilities and user
> >>>>>> config, such as kernel params but not only) start or stop a DP tunnel at
> >>>>>> runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
> >>>>>> AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
> >>>>>> entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
> >>>>>> as a separate DP AUX host)
> >>>>>
> >>>>> So far so good. But I still don't grok if having a DP-over-USB4 is a
> >>>>> separate submode or not. I.e. I see code (and TODOs) to detect and
> >>>>> handle DP going on and off. Would it be better if we specify that
> >>>>> explicitly?
> >>>>
> >>>> I really don't want to end up in a situation like we have with:
> >>>>
> >>>> $ rg _USB include/linux/phy/phy.h
> >>>> 29:     PHY_MODE_USB_HOST,
> >>>> 30:     PHY_MODE_USB_HOST_LS,
> >>>> 31:     PHY_MODE_USB_HOST_FS,
> >>>> 32:     PHY_MODE_USB_HOST_HS,
> >>>> 33:     PHY_MODE_USB_HOST_SS,
> >>>> 34:     PHY_MODE_USB_DEVICE,
> >>>> 35:     PHY_MODE_USB_DEVICE_LS,
> >>>> 36:     PHY_MODE_USB_DEVICE_FS,
> >>>> 37:     PHY_MODE_USB_DEVICE_HS,
> >>>> 38:     PHY_MODE_USB_DEVICE_SS,
> >>>> 39:     PHY_MODE_USB_OTG,
> >>>>
> >>>>>> Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
> >>>>>> can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
> >>>>>> (and each of these routers is hardwired to one of the PHYs).
> >>>>>>
> >>>>>> To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
> >>>>>> super high-res display at one of the physical ports, or a long
> >>>>>> daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
> >>>>>> we would only need one of the PHYs (associated with the router that's
> >>>>>> wired to that port) to provide a DP clock.
> >>>>>>
> >>>>>> This, along with the normal (logical or physical) present/absent status
> >>>>>> can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
> >>>>>> or something along those lines to toggle that bit as necessary
> >>>>>
> >>>>> I don't see phy_set_opts(). So maybe a submode then...
> >>>>
> >>>> Sorry, I misremembered the name. The function is phy_configure(), and it
> >>>> takes a union phy_configure_opts, hence the confusion
> >>>
> >>> So, phy_configure() will be called for the DP PHY to set the DP opts,
> >>> but how do you plan to determine if DP is on or not? Or do you plan to
> >>> add phy_tbt_configure_opts ?
> >>>
> >>> Another obvious option would be to set the flag if DP PHY is being tuned
> >>> on / off. I don't know if that fulfills your needs.
> >>
> >> Either this or tbt_configure_opts. We still have the muxing question to
> >> chew through.
> >>
> >> The bottom line is that all AUX traffic happens between the "AUX adapters"
> >> within USB4SS, talking over thunderbolt to other AUX adapters on the LTTPRs
> >> and the far-end device (and anything inbetween in a chained topology) meaning
> >> we only need to engage the DP host itself (and therefore the PHY) after we've
> >> already performed the capability negotiations
> > 
> > I hope you mean USB link capabilities. DP host still needs to ping LTTPRs
> > and read all the DP properties on its own. I don't think we want to leak
> > that to the other layers.
> 
> I must crush your hopes.
> 
> There's some preliminary TBT-layer setup (handled by the tbt driver in
> Linux), followed by the expected DPCD (and alike) r/w accesses, which on
> our hw must happen through the DP adapters housed inside USB4SS (again,
> because the DPTX's auxbus is NOPed out). Think of it as just another
> i2c_aux provider.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
