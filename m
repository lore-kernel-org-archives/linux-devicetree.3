Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A1630C164
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749810; cv=none; b=Ttf4AiYkgfo0/RrIpkug2W3YKeY3dcN7IMjn1VGnrW+vtnlUqMe5hlWLgQd26tF/pwOfYRysJof47G7GiDhG1tBpesZ2mbnjxO651Xpgx7tgFA4N26n82xWps7KV4zXE3dz+RTjtqHz8wmtzII7yFP2RnPbCX2TWqrIy5BMaVCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749810; c=relaxed/simple;
	bh=mVs7Y6Zlw9G8xVUrhFmCckDfMOLQDDWqs4AWD1QQyuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyVuzmGcI16X9HPbqFwAavJa+znvjSLkP65vxXAkJB2EbEAvzjayowPmSnCkKkzmBsx3w7YkwvZDB56pg60ctDyDbccSYNiyZQP8ZF4UMMpqBLIMHzOmvDRdu7+Kqcml1spOOxGhQeEPdjDdpT5Sf/sXQWUxpLnJoxOBpi4Wvb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsUVOYDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REBoEW5E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsUVOYDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REBoEW5E"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U5uA3n2249804
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tPWV/hXboWzQLZnIxtfFdto0
	CNYSH9DwqGYVh/BZlFk=; b=HsUVOYDNINurXKdXX4nP7V0yFdc7tDpzDTj6PMhw
	DOtZTCcGT97pPbwf8QZ3gdBdjPfjaEmyiLsiVakjnbClnlKQECRtmE5ruLzNS+bL
	fm4bNczMkznWzfhwYXQKOGrucx6OaMvY6EHR+mfGqKo4pvDFPq/Jf2xHVsPIYS/O
	GIP8ZKztDOpHut6EJHj6LjO7kCNbfWpvyMTyD8hFVK0BlEbgZoY7WPzRoA1/VAmQ
	Qfvu9yDiHse3Smc58l4qzmk1ghIAl3R7FPZOmFbstl7d2kvFTN28t85oD4CnTOlS
	Y+x4qLXtIXdLnsimpHoFu0tfuArsSIC/A11M4yYN8D5SVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3hu2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:29:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so4808506a91.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749792; x=1791354592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tPWV/hXboWzQLZnIxtfFdto0CNYSH9DwqGYVh/BZlFk=;
        b=REBoEW5E9ZCNvIjWYAWQFYyylauw5I+t4fajJux+40jbBS9Zf3mLifCI1EUQDqbMU3
         bSCNYAbUqW8ZvGKwe7c/BCIkV5tYMWN+As7FCe+WWPUmkRHqz3kQ9NLLXacTOX9eJkPK
         6vxHL+brZU/ESawwYQx17w940DpXPh0IhPEsHAbgh4W6wAkLjhn1QRTMXXJOAiGF58S8
         0WA9BW7IxW3Ks+T4aKLttEZdtpnaxjTaH27otN5diNhn02c3CnjFr6eOdduwv9av0YNc
         j3zRJ6BPQb9STiRYVo0pVedE9oUpIF5tPJDPj2y7i9itgcoHuiQS6cx4B0GK84V2u6GB
         dAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749792; x=1791354592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPWV/hXboWzQLZnIxtfFdto0CNYSH9DwqGYVh/BZlFk=;
        b=AK26cAJmvld2w3ynHTYVSeDNanGFwBe1BIi7VTI5hkRHsOf8FuR3FG2DNDL9DKnUHe
         R2Pi+FE3H+exYkTCnNLlfmD111Lyf6RYNJHT9k+L8zyrI2fyQLtahJ56VLfIW70mk3T/
         ru3pSXyu3iVPt7X58yUDckhSytiWU7IcmG6Ibs0FhSkewWrhnR/AjwEYgRQo+OOCpoxq
         vbjH8zVc++8hJzJnPmNBM17Dd9vtuJwH80LFnMfin0EVLbzLnIp3Q7+SZbfW2qJUSJPG
         NQM61UNU6kGNL2l4MVmLXFKaX8hGM3NWr/rqSv6PeWIMA/QRlh07Ess4qRPofwxwKBbR
         vIbw==
X-Forwarded-Encrypted: i=1; AKwUvBw08AgjaMfn3XaCzvghh/V65DW2KVwW7WeZv5r/Drx2Wu5fObfep/dLlXpgyud6EPznh4Fu6aXIbrnx@vger.kernel.org
X-Gm-Message-State: AFq9FYKEuTRh0vr5RJ04AHfhJXcq/E/rAMwrK2JGHCgVkveR+fD/JVWu
	h30TkqB1sPqJS34fuBDL3tagbyycfQy/m1I457IuZYujRAUG8a9whAMrtony7JDKHiEDwhGzSdU
	ic3MVaXtDxvfO7sdIqGe8sW6Wze/2hRl3Das5kSwr/UWy2Ny2a9onAeBsjAlJfNo7
X-Gm-Gg: AYBFou0JTjT6iwtaHLv1wFrsgZUpHZOh2VNU7dBiIL3N8L2FtH9r1dFwAwHQOrQzzau
	t96UYhpvrbFhELvmIUK5oJLZNk5OHCr52LMYJwlMv2qiMOi95Rrni7QIFAAlpMyUwsQlrPMMFou
	RdyJHVBBV3mFI9Fr6Ji6hBV7r3UHbqV9Syp2NFqR2BicgbBDBkPjnicHjr2vx7tAx1ud2tukrv+
	GmcQz/GI4OcvloMaL4Zb4lwmzvKrduE0DxPTgq9B7nXbizBnRjoRk66+oMjbQFvLdd9i60ryUtZ
	YlwZjp7W1BCJTqNAD3THaaJc+QCxWIo2VxIYRjOF13gMBzBecuuIP/2p+JTn2hU3oW73uL2JHAI
	lL0z+h6GfRhO0sXM4d3F8v5xq
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f476 with SMTP id 98e67ed59e1d1-3a4d18c21bfmr437228a91.53.1790749791670;
        Tue, 29 Sep 2026 23:29:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f476 with SMTP id 98e67ed59e1d1-3a4d18c21bfmr437199a91.53.1790749791156;
        Tue, 29 Sep 2026 23:29:51 -0700 (PDT)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca64bea4sm1825727a91.0.2026.09.29.23.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:29:50 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:59:45 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
Message-ID: <arysWfwaY5GOo10G@hu-raryan-hyd.qualcomm.com>
References: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
 <9612eec3-dd70-4ad0-ab4e-d90c921a94b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9612eec3-dd70-4ad0-ab4e-d90c921a94b0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Bsg5lwi2cAWjmhm3IuMHM2IYMGBepwVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfXwRoH1Vy9yPj4
 BsIjW8q9ZjBnCe4WxOEvFvjbod+jt7fRDASlVIKQHW644pcERcIEKi+46lkdZfW1sN7+fgg3/pk
 AlGfoEzLiql4R/0HJ/NEeIcxiilIeTeKHNhpbsPg+w1gcSU4aEayIj7WXe0LNmO4Myk69e8f6+v
 RMj6NjNZhXUiGMGoQN8oEtDRpeyCTJ+pVcKGWiYRNph0X/+E7TEld2mM0lzB2Md4tnTcrHlpOVp
 XPj7yAF4rp4Z6z2zSuirSMdBOkPKAySDoVfwaihTUm3O9XYZ+V3lmRTAgT5VbhCBb/DhYiM78YC
 ATu6zbBhtdqcVOyqgxR678ncAwU+WwZhI+dXIP+rNg4f6mXgprvRUbhjcuMD1yxI1C1KI6BzpI7
 GdG68UuzY8j29s7haDol86RBU4M8Fnpd4PkTjLN9XudhRpoF4tHATLG8ST0PZ1bGAq2T1Wbm57R
 plaelJtJt9BzZWmKn4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX9Iv864a0qPcq
 hFGOI48DZ2REYzFxitbvD0XQXbadRecDNbhb3UI3K9aPkrnYEWtrlzG0R+3I+07Tr5qhN2NFD+X
 NImvNgl19Kk2PFtnL96HSQPwFxaXy6k=
X-Proofpoint-GUID: Bsg5lwi2cAWjmhm3IuMHM2IYMGBepwVk
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abcac60 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=wkZ4SpZ5FDF5jysW358A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300025

On Thu, Sep 03, 2026 at 11:02:16AM +0200, Konrad Dybcio wrote:
> On 8/24/26 4:49 PM, Raj Aryan wrote:
> > Add ADC channels for msm, quiet and xo thermistors along with
> > their ADC thermal bridge nodes and thermal zones for PMIC
> > thermal mitigation.
> > 
> > Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	msm_therm_bridge: msm-therm-bridge {
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> > +
> > +	quiet_therm_bridge: quiet-therm-bridge {
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> > +
> > +	xo_therm_bridge: xo-therm-bridge {
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_XO_THERM_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> 
> I see the SoM also has a PA_THERM0 thermistor at AMUX1
> 
>

In schematic for qrb2210-rb1, it shows NC. 

> > +
> > +	thermal-zones {
> > +		sys-1-thermal {
> 
> Please give these meaningful names
>

ACK.

> Also, the XO one can go to the PMIC DTSI since it's always there
> 

ACK.

> Konrad

Thanks & Regards
Raj Aryan
