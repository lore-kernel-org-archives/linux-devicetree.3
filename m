Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917173CF685
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776882487; cv=none; b=bz2Oz89/eLj9/oM5ZYZsLmiax2R3bu5ll0MSaTW3nwucIxb9QSNmecAOabzMktelKn76raf6gI65dvpslDsCQNuY4a2DkQp278XBuoYWpZtktx9jQpOW2Ty1G4r/N9wl5oGtCgAkPo+iyfA2N/Dk7UaucJzgD875dobTbZT2vRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776882487; c=relaxed/simple;
	bh=0VK6F2cnjKrumKWrTRfiBMBK9q18ZTISjl84hK2lzU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rngdibOFV02KBQM+16pkTbzZeRdRCBheYScFqhZRP9t/xATeBYWy6ast4lfAEBjT8fa7lQaLCpgYALAzOr0tm8b5LoLMD96tjPty7TPHIjIUkpSvUSL1Fmy3OESr8JlzhdqR4p8GbAKBrJJH43mnxd7mi0xi+wT8A8PeQUbpy58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpYX72sy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VovqLkiv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpYX72sy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VovqLkiv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG4mA11587862
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FyFAwdzAgGw4hVRYizUayfah
	BbjNHuiU8cvL2S1mW4E=; b=IpYX72syyuXFUCcPxk3NqwptQCa8WDBXT8Kuu4c5
	s6O+P49+gqC/OZf9EG1aKPvxOIIip3Dz1Mc8TdP+ALFPBCT/dh2JDgqihrCGGmin
	zj9FDJP5AUm05UA9i5PeilEmHRmSUbwqm60/GJxdR54kfXCglrg6pwCnyIs14qFL
	gDJDXAR79Ok6D1DzCoj5K8fgLToZtwl/blcCiGBI29ivvY4Wg+xPer9Y+R0p2fNd
	w2nKaMaFU/aItVjw61eeSLNL3rrkVTDerl/mBWHN08w80uqDey3YmdVG2FYQW1/l
	65PNUpcq5bfhW7mAHAh8TteVrMyTUjUp2fihT5ycBl8IPQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq0gc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:28:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9569b1fd47aso2329000241.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776882484; x=1777487284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FyFAwdzAgGw4hVRYizUayfahBbjNHuiU8cvL2S1mW4E=;
        b=VovqLkive1lqZFXLtlL8TGaR2WMj4LO9yyb1dYsWBMPX6NFgwVzRsqjyEm98Par/QG
         Wq7lkXpKCA4F0iW0Pu7kgInMdpf1q6tKqiGy1BKCU/K2YM1CeKjCaMeWsxWvxcFkMCv3
         rFf7bdGBmuJd4tNBuo3dAGPDEfKjCDNMbCf6gtRldKhUTwGfqBbHZG3u9t891DOOy7+X
         oE9vyuOwCUqJG6rNA0MDTZKR3uwwR17Q1umHQLzAeUyPI944WFUKkVgSivJpxifFR8Fy
         mKoJ5zVnQAOJRcNdiHAlq89TlblVDQLs+GYiU5QqZS5dUOMvhOWJRhgJe1IbpjbjxhnH
         ErbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776882484; x=1777487284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyFAwdzAgGw4hVRYizUayfahBbjNHuiU8cvL2S1mW4E=;
        b=a/Nkp+3R68w8ueF5Odxulc3JRfovs9l9QwLU1czGYjLX4giyTRQYJWZwcopH3wNI6C
         HuT8bh6HDABDDut8sTsUQOt/r81K+P29yH1pYY2AUZCTV8QqRmVmfTxB/1PDnzNiFlXi
         CUKDwYhcUQzyQYCIUh9el+HvFKRmxFLsWKEvouKFMIbx/6AiRXKOLW8jyYtyMaeiyyjJ
         zNX9xzmFzGgUzwsueNIJSd+4MSEaZ7NwZ95DS+gDD8+BkKQk1897T+LNL2kYwnA9hm3M
         ALoGfCtHIFvP6U9dgF4xqvJFEdThZ04Bl20nWK6ig5nKYtl3rcByARcNqJ946YV+a8eE
         FWKw==
X-Forwarded-Encrypted: i=1; AFNElJ/qAO0Z06sL5l+fxQvrj/qMm6hCroj3N/oS3riswKjN2kh9z6BXlnstQ6dbXucK+UQxiE7jbaT8W9du@vger.kernel.org
X-Gm-Message-State: AOJu0YzRn0CK0PhDISbcP3UXT/BbRVnIZbH8uLRdjyiaXE4YLQoJG6//
	euYYQR3bcY0ZhS387YBSZT5syHCkCWUzCYnDTJLqPosq8s1MnZqeIHopl0u8mnmAaF8Cx5OF0MR
	acvUNBnPmmNUdS3kRQwxQp0nULNIxr6L4nTV7IaTs6B9DoXB6ZKM7Jo2qUlKRZwV5
X-Gm-Gg: AeBDieuJ5lWgrPUTVesiZb4sh43ZdDeZdwinAbUkHjZZMPWLHcP5pnfY0siu7207ST5
	H+rx2OhN4aO4co+aTFLOREMCyNKOsYwyAahNGlnSMhPXPGXZJncYhOGTfBTAJR0O0dU8tzIKubP
	7+dFjnbv7grKbrJ0DXLtbmXCYcHHXutTHd8UcVyQHD5uRpkx+Znol0Wz6jrEq+/97kz6Zgh2hTg
	loC6kiuX89H86qAyF8913rb9SB/ArgSi3A1eWQpJlYc+gYsY3ylCgEgCK4W6M4q+5ZU9PU48pc2
	kRFSsNxcXA8DgwbIO8aI/ipIhIMGhW3n2mhq649vmX2g0Uh4e4c8nY/RBwiH2r+UOgkPnW/5CNo
	Zmh+CxWMKG5QeSA+eNUkUxq+B8E2o8+sY6DkSfsD6lB0CJiXgIj7pak0zt48QbIvxkKYz4dLaVU
	uUxa3eR/USNEEYLex5UoYQz/AOoQZ3u0LdVRrXGYqVEEC3iQ==
X-Received: by 2002:a05:6102:5987:b0:613:95c8:d941 with SMTP id ada2fe7eead31-616f4f6f185mr11415926137.10.1776882483790;
        Wed, 22 Apr 2026 11:28:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5987:b0:613:95c8:d941 with SMTP id ada2fe7eead31-616f4f6f185mr11415921137.10.1776882483347;
        Wed, 22 Apr 2026 11:28:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm4688227e87.36.2026.04.22.11.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:28:02 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:28:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
Message-ID: <5vkpjjuq6vh2mr4lcq5cwqd4h5cbserf3n756d465kheuwl5fk@tu3amjwe5k57>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3OCBTYWx0ZWRfX69zKgqcXuWIq
 Gji5s49Obi+ljF2dHNnfBTDnfMjo7VEv3hEhaaJiT4BemJyreIgDgRABYpWPwdKxgesBgBSwWMX
 y9Vb6tPcoMCsxWIratPOeTmd+JGKrXoiAaaDa7zVXSNNogN/73T5kpWntXv6AAhkjXf1D0vpeiv
 4CIOmOYOVOY7GUI1DmfoWlCuuHm+kjUZwJ59mHvvU4ucbtewthS4oKppmgznm7seXKOR6hbY5nJ
 Mg1KPWBtJ9gtj0FM2bbIBtinEc+N7mx0FO6zt7XnvGH0u2/CzHm8GiCFbiFUsqSX7taNwIVES0B
 AL/1RPFTBm93f+uryVR0O3OZPQJo8J114ubutasbrgGjggqMjf+AMTjpelAC/+ZxmRqRWwJRbVS
 qC39fQ9c+VGwGSjp3wbc5E+8mxtNXpLtLJTRWxTnguQ6m7lAiqicy7N6pc9qvFBMRKtI9tUaDm7
 yr27kEYyspdEVJozG1A==
X-Proofpoint-ORIG-GUID: N3JP3Lif4vOi3PmuC62W3ugL5OmALAn3
X-Proofpoint-GUID: N3JP3Lif4vOi3PmuC62W3ugL5OmALAn3
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69e91334 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Z207rsgFrGoaJHP3IqQA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220178

On Mon, Apr 20, 2026 at 09:59:00PM +0530, Jagadeesh Kona wrote:
> Some PLLs are already configured as part of CRM(CESTA Resource
> manager) initialization. Add support to skip PLL reconfiguration
> for such PLLs that are already configured.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>  void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  				 const struct alpha_pll_config *config)
>  {
> -	u32 lval = config->l;
> +	u32 lval = config->l, regval;
>  
>  	/*
>  	 * If the bootloader left the PLL enabled it's likely that there are
> @@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
>  		return;
>  	}
>  
> +	/* Return early if PLL is already configured */
> +	regmap_read(regmap, PLL_L_VAL(pll), &regval);
> +	regval &= LUCID_EVO_PLL_L_VAL_MASK;
> +	if (regval)
> +		return;
> +

Why is it being applied only to Lucid EVO PLLs?

>  	if (config->cal_l)
>  		lval |= config->cal_l << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
>  	else
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
