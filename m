Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D310052E06A
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984932; cv=none; b=qsyqIHeLSKPWBPQsRRV/j5Uh9+H7M+sLExu4Ugh3fwHh81Rh0GO8hoA9ygAIybJxOo0Byb6Rc+YvVM8zSJlEHi3J0hKJRhkTndNTy6UboEErjixYWDZxWbV+HfEo2oZ0+10l95/FvTtO5rA4XzNa6ARW1+1vBtc7OjG/0CwILfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984932; c=relaxed/simple;
	bh=IlpqbHrz26EweNTVebA5NYWFDrcc+dfp5s1FMniEugU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfInNj2dLsUMcmrYbVm+LA7ih5cQ+1zRfgQofvVv5OT85ONEM4E+8VA2i6epzWSLnvQM3XvFeqmAjSbGG2ppXWPHylQAXQeHE+gkKuM/Sr9CTnehPhbIdOkqQfP7NSu9c1DIXpY81oMxO+qaZ264MOAnTvKy9yYkrMjOKZ6ybFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSt/rCap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fLh+DauY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSt/rCap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fLh+DauY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8owBc3001160
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3oJjtNP80ClUlRJQPIJ5xMzy
	E/SdWULvgaeOPu3tEZU=; b=YSt/rCap38oBSiDonvSoUHWYieDW7AA788/GQYdp
	XLSfI7xGEpPtB4boX8OLXzQDk+fVeGUQ7VGylvdw5mgsvd9T/NLoAD3NtZz5ZzP6
	3wnXds0whZCrHtYV0mWJeCYyHLhzb3sCEgiXlkbBhTZoxbvHWKcUQx63iEvUjaZh
	F/V7B4RRVZgCvCVQY9FnsUCjgsEQ19i9Pnp30oJncktV7Z877VVQlLA1zzTtyGVs
	faOK1oX1MzhSSMddM/HEB4wZF8JNZe87v87lecWDb+i1UKYMjSp/BC2bNZmk5Mpa
	und//Lrbq3Z41nSs6BTvUMWOv5BqGngNkO1wphfdKQe7cA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbev68t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:35:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9104eedb5b0so12868676d6.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791984923; x=1792589723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3oJjtNP80ClUlRJQPIJ5xMzyE/SdWULvgaeOPu3tEZU=;
        b=fLh+DauYdAskMRsX/BJ//NvlRKcAojjT/J//6YCpacG/dUYjZKCPLKyjFe5tZowtPJ
         J9r0xe8UC7VRDeVSlm/nzisSzfbcebOupcL5pWHY5APT6yA0+AnsAls26y2WnUfes0mF
         fuoWurzqNKYuKGiPbVF1Fn4dWtBJSFTzsrzDDs+ds2sgnBmlNOTiarARq/H9fm+sCqx3
         MQTgdsxcfyDPjw1DQ1qDNCbv7fgpInWQdEd4XXTSms0Qv7YHViTWHR7HPWPIfbxUIT/N
         63qhLBVaca1ckgOWagm/mcVOz5eXDAG+F5ZeJKgjUIsdxDPzd7GLdeemZkVS1vzr9xlj
         EsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984923; x=1792589723;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oJjtNP80ClUlRJQPIJ5xMzyE/SdWULvgaeOPu3tEZU=;
        b=rGITjRT1KSlCC1WY8F0ADzGbjAMMKlrC7ZHMu71d537H0UrdZ8yYc0U2rbfNW9kKSN
         i+1k36UwEkmqZIm0ITkT/Jzy3kJ8dAwq2PCZE5YjWo5a4YlOw5/jT4FAecOae9Y97WEX
         mmb7uKirLAx4UTrFmr3jlb8Qa8t362O93K5l5h1HntEyKskjXdVX096qi96twgIyzU23
         ubzfM1/1wEkHu+dIpca5etkYlJPoHRMK4lmHX+DhW5YlZ1oV9l0UpSldDUTNOiiz9/yn
         XGcCKOKvhjhW1pt2SRJ4KtuoSfp4x/aJKU52M1T85m35gUyBUqBMiwon7Qh+NDeTpoYz
         eqFA==
X-Forwarded-Encrypted: i=1; AKwUvByVBJ8NhkeymtnaK5yw2lRg2QGndkgcOwzl6JN1X2urDxxcP9YE0BYJ20ZnA4glxm1Wl3HhDqIrQLun@vger.kernel.org
X-Gm-Message-State: AFq9FYITfqRNVPqsvcv1wcv1MKEXV2FQyEzHoseHBaQUnOLpt0BlQlGn
	KGpGW6gGxMpIHGu/l+5gsZaPOS4zJaYuw8kStvr1J1idwnqnn+Oh1UrnPgQKjipo37Ev9nlqy5B
	8Y7ebgbv7AaZx4uvuUCFGcQ7ARQSojqFFgVQtke74/pjCKNZPDOnR9RnnBnzIUG8a
X-Gm-Gg: AYBFou1bGooRyK4Y5RW/a7Y+IWv0EnpvBADp445FQP+DUIENgnSgOx4k5lscVm1MgJY
	aJ+++iz3Ug9MzS2M8dh0W8Iae1sPgJm8/Jy0S0AErY77zkw0ht2dF+ZhUqDa3CeYggRJdGgeBi8
	ZofaxfJpqE8tBMpwrgvI2WkI1moWT1n/7blZf/YcYIn+1Gv2aMIABL1stGxI00bPJW8B65eolBR
	TwsaYjMLowgtkka3wE5WrFlOwylQgDdwunGpcJ07e8HWidShnTjL5GBfGNlyKXojm46QSABsmpm
	mTju9UmwkO0yTazueUuU+HCQ1y9d1aBGN+FF8pUvjlLaq7CFG9Tj4IMmT7pAOfy66HNcqHAfGri
	fTXSEpkqkkUVL3mtRQaQV+ZMWKAl0+zv4eMkhBnhm0Lqr6xx5FnBKHIqjcZZMN24SLsXirWBgJJ
	MEbltd4bjInPRo
X-Received: by 2002:a05:620a:471e:b0:93f:5ac:14b1 with SMTP id af79cd13be357-93f05ac16cfmr236553085a.67.1791984922464;
        Wed, 14 Oct 2026 06:35:22 -0700 (PDT)
X-Received: by 2002:a05:620a:471e:b0:93f:5ac:14b1 with SMTP id af79cd13be357-93f05ac16cfmr236544685a.67.1791984921806;
        Wed, 14 Oct 2026 06:35:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d857d9sm662845e87.49.2026.10.14.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:35:20 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:35:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
Message-ID: <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: D50OpjzJuiOV2xY9aSSWlu0radV8_7mA
X-Proofpoint-GUID: D50OpjzJuiOV2xY9aSSWlu0radV8_7mA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfX6fdGkZ/Ea0zJ
 GNcx0a9sGHA+8Ek7Y7RZNcHy2FXJoJpy4ygaQCYUWNE1OylvBKVO/lkiH97IYTxYq7XtcPLOPnR
 +TlnTD3JAEasWKME2+MW/nJqNMCI/KWv7CYjDqYECtSOKW7ZyxLihD7jZ1KfBB77hmaL2r+4NC6
 YmCsr4NmTM5n0XwoEqvvfkfwv8SnJOOSlrSpJrZLE39iLzmQJIpS+kmeNEllO2CrYT1uhTwcSNb
 yP7nm8AD0oz8cqqlsQXqXFM01zs9tNqLjnU0hEB89gysfH6B9CfRuKC4rXZtE3qWljUQOfreDaw
 tp2bq+oueOpniuyHytBRpXFyDvgTtCoxHuMNh69muMjK0gXcmdjr87bB9xVVzr8EUXdv9hxJ3+y
 GsBwLXKcYLaW0RjV1js+wMbG08u+ZeZwjmrvMs/UyP7YGJILTqUX8hPaDNwQ2CYSfv50nF2Z9D/
 1F8aMtSjY/uc3zggOQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfX1hd8r0D9cDy+
 uVUpjxFBYYOQI6q6iFBU3oBxxdgL0eIwFAvZwmNo0sgNhP/XScD2tT95Sjl20+OFE7/XL6W+ExJ
 9weRV0AlxDKjYEzaIsHi3sti6Bu0E6M=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf851b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3h-aFR46GQ2hTHGVm7IA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140054

On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> A failed OPP transition need not leave the clock at the last successful
> OPP's frequency. If hardware changed before the error, the default
> single-clock path can subsequently skip a necessary retry because its

What is a necessary retry? Shouldn't it be: try, rollback if it fails?

> cached OPP matches the request. It can also choose voltage and dependency
> ordering relative to the wrong operating point.
> 
> Treat an incomplete transition as dirty and use the observed clock rate
> to establish retry direction. Do not trust same-OPP or same-rate
> shortcuts, or allow table disable, until the state has been reconciled.
> 
> Limit this to the default single-clock path: custom callbacks can have
> additional state which cannot be recovered from a clock-rate readback.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/opp/core.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++-------
>  drivers/opp/opp.h  |  2 ++
>  2 files changed, 65 insertions(+), 9 deletions(-)
> 

-- 
With best wishes
Dmitry
