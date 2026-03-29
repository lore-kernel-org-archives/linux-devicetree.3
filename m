Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313D2DF14C
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777880; cv=none; b=nhMhvxPnsOduKfaNe1+3DXw04amjNXroPrwLN2e5FKfyDUQTICK5kK7/LlExvVdCx1Y+FoGs9KQ2wE7+Ss46Pit/rqY3rqSgAcMG0G2nw4sjhg/klAbWPfhP3uMXvakJSSSgppxpTBP8EzAclDTYlH9+8ebRy1AcQwWtDH5FAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777880; c=relaxed/simple;
	bh=EoIlLCuH+f8z+tfvoMn08R3g/gglMpb45Zl3/azitG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAQbADL0VLP8QZhherQo2816hi4D/Hhgy7Un2mIkBBYYWhI7IzfDyA0ZH5mfTnvFhpYzAxJljJcJ9xItzgnlDNdqAlBBT5hEvPdVwf/QdwLVoq6M7DTP4W8s4apd7E3KNeqovwV9CGuRC+X4yrguad3NcGP9bQ32wyARV7ao4cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5gucdRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NICyJ7Ay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5gucdRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NICyJ7Ay"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SMgXKJ2646951
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6XyR0Uy7o6/R7QNu7UQgnyIeyNsHlWE4yA9TO/BPOA=; b=A5gucdRyVOyb9YDX
	vqOfnOPP10Q3m4zxyIwBITB27ZS6eskfQA9ivlOWadCI0QqMi4Fr1bZ09deHyK4A
	ewrCV6c90DJo6qdsAzK8bm+BtA42UNzH4V3oeAPuhkDv27pTeR9CnzPsc79lsgiK
	00mV0EFlm4INxbxKr3l7Cm9LU+MqVrFAnGdqbufit8Gmhbn7qjDgk5Fl6q7KJkhU
	4VwfRf8Xp35EUAtdUz07jBA1/KkDd86+e2S0NEEUXILIk6RW7Zmzt4P/zTdVlPpi
	zGYZlVvcN7Uo6cx6voEL4JNXrQKBUnn2QQ9Dwm/w1lV/b/ADDK5ym6eIEP2tRjcF
	zSIBWA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67712gfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:51:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b878a8c07so68326661cf.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 02:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774777875; x=1775382675; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p6XyR0Uy7o6/R7QNu7UQgnyIeyNsHlWE4yA9TO/BPOA=;
        b=NICyJ7Ay/af/NtpLjQnovE7mh2Jev7aGIfoT9B74oNSuYkKED10YiNYOPvt/hepGGO
         bl5iaC1jFODx82jZyQ7Ulz1meqqc2luZoUefXpG1xLiCL0iiCbh+kKpLrK0sirNvMNWk
         jcLgJMVrjuAtjZdSoZM1+U7W1TqKCnDvoLX0IqaUz8A5EQeiOncir0N4RhRmAlBDnqNd
         5qZq/QzGZG2YnnTfEV8RSavOjnABn7BRhveP8uwjyCjwONOX5JAXOtVnd3Vpm6QncY69
         usaMiI1lAjVRdNIJOCovMeI97XbScCCI7MBrarB3fS321qSEdL/SuMh8IGLmz3X3KsK6
         x42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774777875; x=1775382675;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6XyR0Uy7o6/R7QNu7UQgnyIeyNsHlWE4yA9TO/BPOA=;
        b=aONHaLxYrBTX8RfgEpZMkmWM0kSEnIS15bxonVyl36ie9pWmOeazxf7ayyPvY0Lo2x
         TYznIfxYuGwg0+YtujQ8aqMG6Pv8PXZ1oDrm3NLZA1TApITMn/Gn5IBzd818ZOrSnf00
         Ws7Ycd9eS7c8AdpK+8THKOlwGCYd6hh4BK+7IowoAqjyYz39KWZ2T7W0ZX/ZxQKejnko
         Im44rdsR1/4JhmbapO0J2rjwP3JRSiaWZkGa8ZE8arJyAAoDVe6hoVOVSvMfeL/owZEV
         wUhJYYz/3T3cT5mmsgyBCmnFqm8JtO7n3r1voF25mJ7fww4mp0lbMH0iTQZrMmdLPYPe
         R83w==
X-Forwarded-Encrypted: i=1; AJvYcCVYyFoSe2nB6ny76R3W9ma4JSR67RSz7PAo22FczLNvhrJP57z+EwHfYyuoV9g88/zohjuu/vZDvM7m@vger.kernel.org
X-Gm-Message-State: AOJu0YzjaANbF7knqqQebhH6Hc8PTOP7ORwqNGOYmAUZlktnajGOaIDz
	Ea0BCNu7gvcAQ5eA4Rt8qQdiKoo9s20EW4Bg2dRdPrfPvx0gZyYbFBV/dTsb4i25+The1ZvdYKA
	oGxGjxCdUt9IFPakqj8aguX+wn79tCWvTGk+h2vTKjWPD9OeO8gouw0OgsXBe2xge
X-Gm-Gg: ATEYQzxq4PRhywC2v4DEDO2iTdnQycmhPyeweQP9WRMe8np8OeTjpy8JSU3dHZR1Lz3
	NTQwwUzXQoHAdPcjfLNv1jtFYis4gIS+mKuTXZNlckgVZfjpWY7D/pW4riDTtapGQGdv+ROvRMn
	zGDA66/4+CMCKfwLgFYG3RcHYVMnnrt7NKSrzzCsjefZpHOzjGoVV+73ivwdUWJiR4LZZVLHeIf
	qYvd83MSWVwtk38kbfeLsw0cpjormmtlZkteAaht86V8NN3q2dmt8LP/vkfhuRHY8WWBeoztcjd
	dcSJ/T6alSNe+Xuu1f8Xg/XRAKBC6elmu/NCnnJMSqAj5caIXyTFX8bFToKdhZXkpJMjBCnHQHZ
	J6SlXvpaTS+01RKdlZyJ6kuJvod5CcIhZZd/BDcUvchnEqPc7IYX2O8zLyaUbUC8Gslfwn3dGTE
	87mobVczYVdyrR49z6RnbSSUhs5BEsAzIWvoE=
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr112004551cf.30.1774777875621;
        Sun, 29 Mar 2026 02:51:15 -0700 (PDT)
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr112004271cf.30.1774777875105;
        Sun, 29 Mar 2026 02:51:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838db4b3sm8282291fa.33.2026.03.29.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:51:12 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:51:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: power: qcom-rpmpd: Split MSM8953 and
 SDM632
Message-ID: <44t5nsdwy25ildzk5czpeidjxrelfyz346thwddsi5k5wo4pj7@2or46xbuo5wd>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-1-6098dc997d66@mainlining.org>
 <ocrzwxmr256h3ef7ifwx3z6jgtzubiha3forfi7nao6gakb6wu@recertxxhlip>
 <39a320e472ddc6d44c950a995b577e77@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39a320e472ddc6d44c950a995b577e77@mainlining.org>
X-Proofpoint-GUID: xAHp5eMywTMoRbC-mUQ0ReO0Yxs0lECg
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69c8f614 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=OuZLqq7tAAAA:8
 a=xFbSPXw9NCUfqnV0eHsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: xAHp5eMywTMoRbC-mUQ0ReO0Yxs0lECg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NSBTYWx0ZWRfX73P58lSJjZkf
 T12DWaNLIZBcYgEpPDAkR4SjgluzxNWK15/cYQv9R434noaaqsUpxPwsD4ibiYAKECnu+JyFS7h
 I5/t9C+NrVevTCltH3N+LPg66imCNpcMCxIA3dmgUJhucsy7sWxLkrGt7i8+iJdsENLDsPgxY6s
 jw0zhZya7YE+XrvbH4NFbxhJo191S6iMjst+vHLlIkzacbZx3VNKXv8nvV49sPAqHIkp977OkXt
 zpdbW3/7pcIU5gQtQuhupXqB0QN3P088lmonZvhwrRCAFYixzyGC+yEbBOS2GNgy9uvalpsUG2n
 blQcvX8GiO5L/w7ZALNu3AB5baQm+DXYnYuB6sqKmKCPYrKaRH4M/B5ezsq6KBPUkcdAsyxiV5Y
 H24qLgALy9Wg/gBFzDddeMR4T67pKS/badWxRjzSpwakm4ryQ2iAuB1xcxBfkVQJA+jj4AtQP1m
 dTsxeof4OZcV+4QE8jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290075

On Sat, Mar 28, 2026 at 09:22:19AM +0100, Barnabás Czémán wrote:
> On 2026-03-27 21:26, Dmitry Baryshkov wrote:
> > On Fri, Mar 27, 2026 at 09:11:43PM +0100, Barnabás Czémán wrote:
> > > Remove modem related bindings from MSM8953 rpmpd because MSM8953 MSS
> > > is using mss-supply as a regulator usually it is pm8953_s1.
> > > Split SDM632 bindings from MSM8953 because SDM632 is using mss-supply
> > > as a pm domain.
> > > 
> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > > ---
> > >  .../devicetree/bindings/power/qcom,rpmpd.yaml        |  1 +
> > >  include/dt-bindings/power/qcom-rpmpd.h               | 20
> > > +++++++++++++-------
> > >  2 files changed, 14 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > index 8174ceeab572..659936d6a46e 100644
> > > --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > @@ -48,6 +48,7 @@ properties:
> > >            - qcom,sc7280-rpmhpd
> > >            - qcom,sc8180x-rpmhpd
> > >            - qcom,sc8280xp-rpmhpd
> > > +          - qcom,sdm632-rpmpd
> > >            - qcom,sdm660-rpmpd
> > >            - qcom,sdm670-rpmhpd
> > >            - qcom,sdm845-rpmhpd
> > > diff --git a/include/dt-bindings/power/qcom-rpmpd.h
> > > b/include/dt-bindings/power/qcom-rpmpd.h
> > > index 4371ac941f29..2d82434b993c 100644
> > > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > > @@ -84,13 +84,11 @@
> > >  #define QM215_VDDMX_AO		MSM8917_VDDMX_AO
> > > 
> > >  /* MSM8953 Power Domain Indexes */
> > > -#define MSM8953_VDDMD		0
> > > -#define MSM8953_VDDMD_AO	1
> > > -#define MSM8953_VDDCX		2
> > > -#define MSM8953_VDDCX_AO	3
> > > -#define MSM8953_VDDCX_VFL	4
> > > -#define MSM8953_VDDMX		5
> > > -#define MSM8953_VDDMX_AO	6
> > > +#define MSM8953_VDDCX		RPMPD_VDDCX
> > > +#define MSM8953_VDDCX_AO	RPMPD_VDDCX_AO
> > > +#define MSM8953_VDDCX_VFL	RPMPD_VDDCX_VFL
> > > +#define MSM8953_VDDMX		RPMPD_VDDMX
> > > +#define MSM8953_VDDMX_AO	RPMPD_VDDMX_AO
> > 
> > Well, no. This is an ABI break. It will make previous DT to stop from
> > working. You can drop unused indices, but you can not change the values
> > used by the existing domains.
> Do these indices never can be changed?

You can add new indices and you can (with some care) drop existing
incorrecr or unused ones. You can't reassign indices though. The rule of
thumb is that old DTs should continue to work without rebuilding.

> > 
> > > 
> > >  /* MSM8974 Power Domain Indexes */
> > >  #define MSM8974_VDDCX		0
> > > @@ -156,6 +154,14 @@
> > >  #define QCS404_LPIMX		5
> > >  #define QCS404_LPIMX_VFL	6
> > > 
> > > +/* SDM632 Power Domain Indexes */
> > > +#define SDM632_VDDMD		0
> > > +#define SDM632_VDDCX		1
> > > +#define SDM632_VDDCX_AO		2
> > > +#define SDM632_VDDCX_VFL	3
> > > +#define SDM632_VDDMX		4
> > > +#define SDM632_VDDMX_AO		5
> > 
> > Please use RPMHPD_* instead of introducing new entries.
> I do not understand completely, should I use RPHPD bindings in rpmpd driver
> or
> I should use rpmhpd driver for SDM632?

Sorry, I meant RPMPD_*

> > 
> > > +
> > >  /* SDM660 Power Domains */
> > >  #define SDM660_VDDCX		RPMPD_VDDCX
> > >  #define SDM660_VDDCX_AO		RPMPD_VDDCX_AO
> > > 
> > > --
> > > 2.53.0
> > > 

-- 
With best wishes
Dmitry
