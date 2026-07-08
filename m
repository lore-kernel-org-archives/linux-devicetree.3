Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E571641C2F6
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510058; cv=none; b=XaDaeFn76tkXwC2cX7hLJzcX5UY6mh4Npnm+clRV7iggd/1j6P2rPX9HpmpvMrS8xDxF/jKCSbPkQulD72WVeS5LuZgJSzIr2Jo5BQj6kWBPI18pbgv0UcPJ3YGPca9L4vVmNQpy3W/yC3qXFPwvSMKHsXzUnbz9OmaYOsbOA9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510058; c=relaxed/simple;
	bh=0E98CbxoAH7NU/gIZrLxvwh1LenoxDPx78uQooU65Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BurLGYHCDDQLLdl+3SeVGuLaSCuiikoIn0Ot5qHgVMfk5kbxamo+s4PONb+AYyiLiGEn/lQAtdN8BmQG8MqSZ09BLjeDzGw1e46rwz54gBLVyWE9F+XfHrlwz5pPLpXrM4toWddJzUdDaf9+gypkZCZA+j7ctyS/cx0INkK0TMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAk0lkI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=km68zoPo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAk0lkI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="km68zoPo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889Ee92007690
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oqQbi3O1Ir9tPu1Uux9QRrMs
	J6SDU3Wfujb5UtxPzak=; b=hAk0lkI1jTSi74wZREd+sFw9OpGw/e+6u8YiC1cM
	EuAkXgaljFFe4D7XAXtJfMZFfvXXneU6EeDyihXsdEQPkWjxOMQmlJxccnIFfkxa
	eOo2ISfV3KI+IVmK7wg7IleAARgtlIbnu0hsmVRndAxwoFaETnRdr0wmumt1GvDT
	rnj1/YBs4UPKSWuduSizoB2jIJDy6mRigIM5gWmC4lxZwvSXPa+WVEPoTaODHrbD
	6F+d+ENeYuTuAtbZrZJqYuT2cCPcfBryV49Y/Jau+D5S2D1ipfwS7aCZvF3xbgT9
	qGfjevTEtLkQFbHDF6KdV+gg9vwCSSQCjFdDPHHYOV2hDQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u13618-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:27:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e80385dbso36953137.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510055; x=1784114855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqQbi3O1Ir9tPu1Uux9QRrMsJ6SDU3Wfujb5UtxPzak=;
        b=km68zoPoTOQ2v1GfIMXdvEOgiVD35dkPx714LSoilRqoLwON06IG62TvPo4eO+fEz6
         Kz4Qf3b5lEK09LUccJjaiq4fZOf+6jIC/epLz2KP3YSv0PM/mY9K04JitJfMcwuSuEmU
         vpm/bYeCVfSuzABMGuWeimHJjKSVObbRLYssYRg4oYaO694wjNB/DRSo6eurIa4upi02
         jDAuqUqYbVY1PdSyKf/wUyZARpSV7IvWx68xFuFN51sV0UvgbE1a3u59T9l6A1G/ZTRe
         0siC4Rri9NFMDl4mLYibXOrqtsdAWwB4jvZMX0CZflC7IWDCO3R3EovUDccuho4ll+cz
         gyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510055; x=1784114855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqQbi3O1Ir9tPu1Uux9QRrMsJ6SDU3Wfujb5UtxPzak=;
        b=LDeORBIgUPw9kELS4IdKIGhwmcxy4JRE6RVqzrcJkibbYRN9PCrL0PEx7eVFMhd2Hz
         QVqt3RQhabWKloh0qX6tzKoazDF+9FfJ63HIy5G363KkjT8iUmpcx9LtqfKVzsQZ1ZHI
         f/V+VuXY95DU65QOHOOum6wxUbXuGOvit3GvRtnHOSnkAuZYUnK++4xgFOcX4eHfMAYC
         JvV4kRdHYEYD6+yNUFrIXz3FnE8CgSHaB/gjRNe8QDW1WCI8XhUnz0R6lrTBQOI9gEym
         cp4oFpPhsNiUUYutEdLADpfYr81mCSI9gwRv8WuWhMtxEZLWSd0WMkotVU3WF/9o7yQP
         8GOg==
X-Forwarded-Encrypted: i=1; AHgh+RqM5a+zvTQg4CSEqg/H0ZbyL+JqJ8pNPmw1fZrEulfnL30bk3vWuA30ZBvDYXBgusEIVH7B7+42lo5G@vger.kernel.org
X-Gm-Message-State: AOJu0YynV75ppwgsiqkJOGjLwXGcP9RMrkxJ18D429gJ+wJpv35l7Q13
	i7YsvSm4MaShwaMMWwlGMY35/KH/K+a0hfraIWeGlsGXc8xEPsOvFp58u3Ld/Cif2HsZJvOymka
	fRgIOtEiALDCvwZFLBrHol8UVv1xd88x+NJgWGJ0dKr8Hp6y8uR3x9doJOnX4C0U8
X-Gm-Gg: AfdE7cleVhrPdLdYCbsUWGmxARAfKReEVqOEpwcowJCT1sDtc52LUr3mG0vqtcR+4uc
	e7gLB4RLEKw/PcaNl2zYmPSSWRKM2GDxiohVbOkIQdL5jTZwWIGLOy36JDVR8UaOa+Rw48heCey
	mYkkIvo6m2MtokEv24zntZscWjUILTnTK0pji0Ip9fZRnPJaV/1ALbpW79YYkiph6CKRVf31EQh
	8GE4AdyymZRuhSCN29nRZvhIc1U612Yy9lx6fRHG3OHuLM8fhMQy8pXEraEYgUIcZ/cNsyz7LRn
	xonCVHYiQymVAdn8ASNe7UnKUXtzVeq4l+a30xzpMN/lQYO1Hvbm0HMv9IHBZZZvfWdzWxq6Z4b
	aH7n685L90/VK8knyoFc6btzJnz3xCG4AjmffkC4GNwcvSbTWfC6Ar8/Wr2bSW/BlNAK1nGPKM0
	ZlzKBSusspYXdtVrz7F20k/jRl
X-Received: by 2002:a05:6102:2d01:b0:73a:128c:4e38 with SMTP id ada2fe7eead31-744e03ca77cmr913906137.27.1783510054245;
        Wed, 08 Jul 2026 04:27:34 -0700 (PDT)
X-Received: by 2002:a05:6102:2d01:b0:73a:128c:4e38 with SMTP id ada2fe7eead31-744e03ca77cmr913888137.27.1783510053825;
        Wed, 08 Jul 2026 04:27:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad1c8f9sm33991581fa.4.2026.07.08.04.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:27:32 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:27:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] clk: qcom: ipq9650: Add clocks for the REFGEN block
Message-ID: <i5lqugso6ejwumiiaw5a3flycyuvm3kz2b7thesiygxlbyulaf@ygwfp26dxzhp>
References: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
 <20260707-b4-ipq9650_refgen_clocks-v1-2-e070624d03d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-b4-ipq9650_refgen_clocks-v1-2-e070624d03d2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jVSKujTOe0YFFZH01bcP2LFtkLyuGNoI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX0id62BHSje97
 9nwr3DDnUYAkU6ZFedAHGW1Pz2F5zGUDF1zTD+Zm5XGI+Mkx7+C2mXsIVpBf2R4Nr0/GRnEtec0
 2XfTy1k4DIhhJKw5ygl1OA4EfYmaGz4=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e3428 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=u8PmIFPGs7L9BQWs_BAA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: jVSKujTOe0YFFZH01bcP2LFtkLyuGNoI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX9WunkBizvyX3
 QD6CVAysiW/BimnxMYpx2ZeN8EVYNJX6QJbY7lIqQwsp87w/DvUsbjwHuXKiwcFuTMKc5yjYU37
 VGDuW1ZvsgscTR7fEF6j3DcOUBwndBpiOp7UagtGJf65sfWa4mvL3GIDQ5eMINb8ceUrjZ5BghI
 3QiG0bHhLx9ENu5bYdwLyloa9jFzQEI5dwV0PS/sGStXFg+yPEmfXPsrhu6DQEPW6Ti9JN9pSHV
 CuKTRIAvJA8u8CiVPrWBEC/xOftyEXXx6KrgIj/XlxY7Hy/C15ubAAl/fiCG03fEeHB5dnmmhgF
 GTtiHc/NgWjSnP3ICVS5WM4Jzy67aVjnLBwDd5HhMuIYgekdOsrK0RIo/jHD8J/Vd8MX7S0ry8c
 l14kbfW11FBMucGyyHNIbcIKsqHuNEHYOUBJ5JC0fTRt0ZvMX8uBaOjkph7072Wm7WeVVCaAlqc
 jP06Vyur3h37S9mRoOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110

On Tue, Jul 07, 2026 at 12:25:24PM +0530, Kathiravan Thirumoorthy wrote:
> Add the clocks required to enable the REFGEN block which provides the
> reference current to the PHYs in the SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-ipq9650.c | 89 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
