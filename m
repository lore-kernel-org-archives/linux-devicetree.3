Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C061C3BEB
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568973; cv=none; b=UWxC4LuHroUx3aY/6nHaCEwbsso3TQvEw8Ty/XOUUz6rftzzxQWGwM9P55JJxbd8z4nCHKMnP0A365kddKl9le0sBiLCSsSm0CcH1HPg3eZecu6Zj+s9uUyOhm7Vu+aiaMOxBzN1FOKedGE0am0HxtaZr/xsMikl73C+SJ2KuXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568973; c=relaxed/simple;
	bh=5ToS+5XQHBJXe7gMJ2vXJ7GVfLnGvQsT+9ORbdlZZQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RABKqulCSDFCIGVWQOMJ21jtb3iKWkIg2YamUTxnnQBGEjk8vpjclraMK/JJePvyKmdsh6ZgFfaDAzYvnIhxh7W0e8NN3px7E1uUOZvktn+JR6joFAKubWqieX3x2bA8D3Dk0HYusvKlDoPTP057HSTUba0cTBDZ3lTkf/l5kYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7ZorvYS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGO6aIFr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7ZorvYS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGO6aIFr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx0eQ3577888
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zmARCM0otCZ73C62ypVatCZO
	1M3TqFjcZ8vF/3Xjv1M=; b=d7ZorvYS/lYMkkz54i4shARAoo7m0HIaxI4o2430
	BKXXPZOGo5s6JlC1pjbxYlmBUGtc62MAiFjMDpA5YSLUBXOZhKs4ttdnBb26+l5y
	uVspN4wv1RW+xOVLtup4SDw1iuLvDGF26P+UXq5EYmFV87G9dhkmA8WL43KQbNBw
	9Ead8maWv+pZBBG8DadpOMz5GtygBn2qFEQ7POCSBb6WcmBiTkx2uzTPlZ5th/s6
	sJkLfm8riL5GlGVw0nLuy0Kv899iy4MG22rp74P8z31AnUv0IlaPT5xW5I6wUrY+
	fp8y9AunvZqdmYb5eqw63c+CDks9huJ6w5WDxdwMD6sPKA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete983v5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:16:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso1591494137.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568971; x=1782173771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zmARCM0otCZ73C62ypVatCZO1M3TqFjcZ8vF/3Xjv1M=;
        b=XGO6aIFrKTwen97G4+29iZ0N19b6U9uZ7ekcgq+mAwGq4gklocM4Z8AOwO2DH8hjOA
         dcSkHx5sjTMVP8jqn1KXl/o1Yy0/s893b6FnGgOjYxl4iFwdKRkUSC4RkLo0Gm50GF4t
         suMIuAJryST4BDBUTYO8zr0Txqh9H22M8KtLSb/zye4g1MXjI+jDP76O9mt6wtdwkp8R
         f8PoDp6skJg1V7/Dr9n+UZmyfZj7BNcF4+bAcSXZtsbEnjbqDcivLrVTE2olwpezv0dW
         NLs3+q6qnW4ky5X7dxKE1cbbZMiz6c8Q2SwWSvCCq0E3l8Uz6l/n9QbDexZ2PkHOePl3
         Tdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568971; x=1782173771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmARCM0otCZ73C62ypVatCZO1M3TqFjcZ8vF/3Xjv1M=;
        b=BRM3QdVctMn/TFuL4BM8CbkxcMp6UoZF5iVWV/gHJvxL98JQ/q8PfBddwnFESMM67b
         zzTIykcTCn9P6/B0PdNZRJfHqoriZS17mN1VzpaE7bYLdIlV/Ot3ChVQu9uGY6tE7AUs
         N/XAVnqtpM0uCbEiEiXT9wfkR3L1Fyiss6CJaTwWCSP1KGhrpWLKSCYWbn3qzwyKEKZ9
         O9YapAqRxeoQOfPEdKdhjdElI+hoKNipSlXED0NhQ8AEQgV0NAytGFd46VbOjIFcDKv0
         kyNcfuGRe8rh2YezQJKpYJxi6fjsOp47dlJC0UNlve3Wai3mp+75RO8PGj6rDnRCuVe5
         1cdA==
X-Forwarded-Encrypted: i=1; AFNElJ9fp1PgbwsCcSIatz2X9yqA/DZHyn2ZH2J+NVwG18wf7mVYadD3guFEdON8m/cVhBy+63htbE8Z5ojU@vger.kernel.org
X-Gm-Message-State: AOJu0YySysF9q5M2hSpaW/36+lp3Mza0O8Z6Ob3F/0pYaNFOHOkVVLi7
	tPuj3+USt9GFYm0MVa27bMA3nhaFNYVS/rG8CVkg3IdMMtU1V91mzDOztcrRRGyyJqCqy7jxklF
	iQenXfReR1yuD3XxuTF6nNM+fOzgAN7+b1ri0CRN0/lkzQ1EsJBG74YAaM40At1u2
X-Gm-Gg: Acq92OG3rD1UBTabRT2ibe8R7q4pCnhBcUsnMlpq7jOqjGKZMebzU9R46TpWX70X3M3
	loXAL8BzQi5gvjKiqQbsMr0outyXcK34ZKRybdP5oDxk5VAwC1TVnCsJGbFHDBi0nv1YyMflbRu
	IzQS1FJtaK7nRKOIaEEC826EJKwvaRQSJIqEb/yfIk3fZxb9DTtpH1NMUgX78qNCsC90sBAnRgf
	nA4wb8pWfuvggO8QLEytxpP6z0QJXoBAigrxKboxuGqeQMMDp3FaksqQ/u7V+CJKV3Eg5p/zF6l
	0OPFRetyQqVOrXRl81zpflPJH7RH5rJXsdW34HR7+x1eXzbTHTMc4vUtcEKxMaGO8oZMXTubTNs
	w7j6qYaml8x+KnAA+oOHxoSvKDofOKl9tItSnD9O8s5k1zTeO496xOtmJiAg/h8jU7YPyGT7EU7
	P1IJFRknZvCoY75Q3sWKuj+X2YNGd9qhjnFFw=
X-Received: by 2002:a05:6102:5e95:b0:631:4580:6a42 with SMTP id ada2fe7eead31-71f60d1b2b2mr6233607137.22.1781568970685;
        Mon, 15 Jun 2026 17:16:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5e95:b0:631:4580:6a42 with SMTP id ada2fe7eead31-71f60d1b2b2mr6233594137.22.1781568970199;
        Mon, 15 Jun 2026 17:16:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b4516sm3045125e87.72.2026.06.15.17.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:16:08 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:16:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe
 the display power net
Message-ID: <fjkpzps2txdrsqnhajusjnj446ozvbd6vejiwolaelmns677mn@va7nei4y4sex>
References: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
 <20260615-topic-8180_disp_power-v1-4-18d36b548c48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-8180_disp_power-v1-4-18d36b548c48@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a3095cb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=rJj1s7GqljL9zuNtHbsA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: qSWdxZbeXaMg6YsWV90bPJfcc8KSXB46
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX21ZGxNk+tpI+
 1xr7crJDNd/TTdQzs/GyQ4xCF9/2IaWtBEA7QLqG4GzjtHSnYTYnBWg7g1OjusHGXSccSNXkG3J
 l/hTeZ27PDT/nmCiaLS3neaBIQlppXI=
X-Proofpoint-ORIG-GUID: qSWdxZbeXaMg6YsWV90bPJfcc8KSXB46
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX+AGH0+cK2h3z
 L3YdTINz7llWdIM/TD7ZmKKI15ExZFxDmMEjJCSx7xhQIktxlnDOTONoYUe00/n/bM1rx0UerPy
 DtlTckOVL10hIs2UVdbUavMQ4oUP4zXAAnk/GgRgXtSpGVnRg6qJxm2h7EQ+UYI/keIWV7CbYOc
 GO/A3u0h44qi1yN2A8FkUWc4ytQ+nn9xLFMGEvCMeXCuAUsWfuOhEwTMn48MRyP9V6KYNEnzQM7
 HLbfqwk24QUiTaqsaz45rGh6G+u5w6FHfjLji0qTXtIcnQVbjn6opub5sBN1Yr8e+KuFQbikPHo
 uXne3iGnMz+zXPRvufoKYq7BE2fEW8U/2NnkHe3adGC4kLZ3nPFMismKv76LSjOm/Hrt+INgi+h
 a+8zzain/2CQyfFEKOqFNwzILBqXVL5WxTrxohLqcIChE2IIqXlM1CRCIBqHMt2297c7o245tao
 NrZ6SA4hj782ubTKopQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160000

On Mon, Jun 15, 2026 at 04:22:07PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe and wire up the power supplies for the eDP panel and its
> backlight. Previously, this was only working because of settings
> inherited from the bootloader.
> 
> Fixes: 20dea72a393c ("arm64: dts: qcom: sc8180x: Introduce Lenovo Flex 5G")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> @@ -472,6 +506,13 @@ &pcie3_phy {
>  	status = "okay";
>  };
>  
> +&pmc8180_2_gpios {
> +	bl_pwr_en: blw-pwr-en-state {

bl-pwr-en-state


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +		pins = "gpio1";
> +		function = "normal";
> +	};
> +};
> +
>  &pmc8180_pwrkey {
>  	status = "okay";
>  };

-- 
With best wishes
Dmitry
