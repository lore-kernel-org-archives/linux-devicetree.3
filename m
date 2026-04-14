Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFB8359A8D
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178693; cv=none; b=ku99JEc4vHfwKZP7u7vRo9AWlxMa73qbDwZqAyZJVmnzGxRUcy+liPSzD1cn4Pf79zt7WKK6hSPKbIrM1Ur/VK7jnm0c6B6VvVA2es1aj6s86BfPjtpe6W6RVvZx/mN7xopicLWrEv8ZmCxSb2h12gXZ9qarJd+7sgmy0Dywm8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178693; c=relaxed/simple;
	bh=HBH1KRs3jRWZUj6eMPpW8xLt5xPVs3cJ2L1QWzkvk30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pX3ordYoxbnv7UOfi+MCQVG/OPvg0grwEAEZ0ElZVHMxL+ZOB+bGEn20hAXXDaJTn9Xrt/b/sBpDM3kXtO7RB5/+zus2UjQKnCNqgQTWDbSUNIFPbcOIwTYvttDjJQNSd8XyOSAM1iUJjmLap2/GAg305DgTDLdnnzrgmILERFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAS9D+o4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EM4S1xvl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAS9D+o4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EM4S1xvl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EArRrO3425651
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gce0sLg2N2F8GuVSRPDawuiW
	1Elu+tqSsHfkICdhZFY=; b=TAS9D+o4tkBbPPwXwAqpcRcVY9kT98AECTzyfxBd
	QddVMzrJALCsqEKwz91EDS7FEQGGzklQVoaK39OURmS450IR0XBRThD4JmcHyyts
	k4PIFJXOOXbB7pJocPTbQCD6a2B6YNbjcdsEvNDPepZoFw0OSC3p3k5uafJjnnc6
	Z9G53SOrbZ77XmPEgHAvPO8AnK/YEcdpVpzC7pilOYi8M9fhAa4fdxugEb912ugr
	l35n/6qRyHf4A/pOuYY/7VS7XXjyn5JYHoyD5nXs3T4v0f/nWpb/ZSG8+3qAIq+c
	mBWGlwA1O6axVX7iyYV3Dj+LlCAXclYKQakMPwXpDRNsAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87fb7w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:58:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d84b5f73bso98239141cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776178690; x=1776783490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gce0sLg2N2F8GuVSRPDawuiW1Elu+tqSsHfkICdhZFY=;
        b=EM4S1xvlS2p0tA9LePCvtCaGpq5NPnFZc50nqwVl4XL9XxdW0f8nIMRfCZBF84GFKj
         oLFbKX5b50lAUWtvjaSLYc57t6+5tnAbaiFnu7lfQSL9Z9PP7KRXsr5aWkgr3uRSWWau
         f388Ps+4dvWmRHD799Q8suyNj0tsUuc6Ynz/wOYgRwQv5OdCQFG9uAC/+fDEHkEJuzyX
         4IcraWUKgkzNehMzjYp8H5cFDdmeiOU1l4y3J6qT8s6TL4D0UoyeeJXZQhwJmIMLCpIS
         SLqc+72zTLsg+/z/PI9RoD9nvAxHGOIqAukBHYmKrOSpOdYbpYbloQKocvQnATJ00D24
         /Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178690; x=1776783490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gce0sLg2N2F8GuVSRPDawuiW1Elu+tqSsHfkICdhZFY=;
        b=qM2orCePlRGvdT3JYfglQthii94/Skk+mspAMuv6ScNWU0YLlvn3R29AjCXsL29C5b
         sD+816JSOZ16XLliX/L27LVMD0sbc7BdYe8bGfFrBsUl7yQR4GKQPVxJbJY81fMjhbba
         uKogWktgfYLKvwjx8KqXw2aJdH46R7mLc/UDqeMTvYwP7bthT3+UCxi0Hlcbc/gnoB1X
         JA/Shbm5GwiK03fuolu6vozJRkgFOTOYwdeuHDiKdlbknGOsdd8ZNI8MrEoteqdz4iWj
         slGED4u+Io1BqtllVWpm4/OPclmfYKuzvK2spfnAF4ixqds+i/e19p2YMue2FZBMbQvu
         xC6w==
X-Forwarded-Encrypted: i=1; AFNElJ8HBNCvwqm1fliayHvLDp4RlqS2rSUX32zycnYYtQvfuHyEtsX/pZDmmguljE9XSG6v/hUNu2OfPPxc@vger.kernel.org
X-Gm-Message-State: AOJu0YxfpOoI4iNHxQG+hrANkXpvITuSLFsGJbGyxnsbIpuRCOgM64re
	Xn7G8RQXpgy0hwKsYxu4MSzgW4g7zk7qLsAreJ2OOv9uFs/G93KstH19iF0S/JE71tgRgaxXVgt
	YhDQKw3qdUlUtj3yoQCkcS1mxTrwWhjmIlsa00SP8gKcDDDSsSVPfCuPRD5LdgRxACL9qAKyd
X-Gm-Gg: AeBDievK7WOvhw38vZqJBIsx6v3e5FQFxL8hIDikWRXV6h2bb/keKN6+rjWCwFXqLbr
	eWzS77klG2QaTwqLoa8evmpqvRRE67mO7vVTDnyRQounXP11KbxkuHt/HyIMIyiqLfzl6znK/b9
	hbfk8hPX4whoYJ9QJFTb4bYMqYKF7vNcpEnVt0AolxF4IJFsdRHjhtMQddIL85xYuA1PMwBnwrn
	hWPV/O660X84dtujyggtmGwt/0vq84Hgs+osaZ2vuvlIuXoqweIwcDA5OugUfjmX462Tbj+iR+s
	otfzBaSvfDOsyBNlC1WckRuPAM0e3pZ0iU0BSu3n3o5L4bTK0TTuiP6Am5ND9V8jM2+avnTiffq
	ij62VOqTzNt9mbzOnunEz4VnP03MAxerw84W+56Tq9Zdq2I549rX3KonjYKWn3xtyI44Yr3hWoy
	qxZWlF/hgHSX6X6pEQZnRlGtep3UDtxEzsGoaQExalKGqCiQ==
X-Received: by 2002:a05:622a:6a88:b0:50d:6557:5c8f with SMTP id d75a77b69052e-50dd5caaba6mr182791361cf.58.1776178690084;
        Tue, 14 Apr 2026 07:58:10 -0700 (PDT)
X-Received: by 2002:a05:622a:6a88:b0:50d:6557:5c8f with SMTP id d75a77b69052e-50dd5caaba6mr182790931cf.58.1776178689411;
        Tue, 14 Apr 2026 07:58:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm29802381fa.23.2026.04.14.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:58:08 -0700 (PDT)
Date: Tue, 14 Apr 2026 17:58:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: qcs6490: Enable DP audio
Message-ID: <lo5ecln3eq43cg3mjdy5qijpk74bdj6zx2yvjjojj67an5k6e2@j5h5etlzipt7>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-3-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413091937.134469-3-kumar.singh@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MCBTYWx0ZWRfX+7S5hOnOsYL0
 WjSfqivRpXH8BHrAJqKOBKiv3djdZT8jU7G0IGkoOvsjT4os8QDS6h3J+CkHK5lPQa1PLjgOIoX
 d2lGQsYLMd2Z5sGcgcw5bsiaj267qF10NefeWApDndq6attxRnCUG+P+AB2ymGZSFaAWWNVJoyJ
 q4+sZny3IiWN2O9Cd+j1dntxcgUJV9OLFlNKQixBJnfKZd9zy9E4RBUQaAMzLoisU65yaC3Zy92
 WKtwJGKq+iOtpUx/A+1i/x6S/1hVAXz7De0ndklCsA7VOJHLLPz/m/cF5lkOEaZYABmCauSA6az
 5HSRLu8tS9JwE5YhRMSD+M8UOBwBEsWi5QLv7Yc9oCMUDjlRHH3mrp4aUp3ejB79oBPHUvN3vwm
 hpeEZP+xKxyqdBM3hYqiaAAV6qzguXYAksbMutgD7Et9VhIKAvp7g7vvckeYCN5aT0IuHAhgKKf
 siWIoUiP2tXrkFRBeBg==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de5604 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=e6K5Mrs_8uKg62F0G3UA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xRcAZYSYcTN1qAGfdq8n6UvcAI4t4IV9
X-Proofpoint-ORIG-GUID: xRcAZYSYcTN1qAGfdq8n6UvcAI4t4IV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140140

On Mon, Apr 13, 2026 at 02:19:35AM -0700, Kumar Anurag wrote:
> Add new dai link to enable DP audio.

DAI

Also, will this enable audio for the USB-C DP only? Please add support
for audio over the mini-DP port (or mention that it's not available in
HW).

> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 2e4062052828..90fd8822dabd 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1169,6 +1169,22 @@ platform {
>  			sound-dai = <&q6apm>;
>  		};
>  	};
> +
> +	dp-dai-link {

Still keep it sorted.

> +		link-name = "DisplayPort0 Playback";
> +
> +		codec {
> +			sound-dai = <&mdss_dp>;
> +		};
> +
> +		cpu {
> +			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
>  };
>  
>  &swr2 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
