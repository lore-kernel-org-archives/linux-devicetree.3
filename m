Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0514422E31
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 23:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785366714; cv=none; b=nmWRUQWsurLxR2ucS5f7NKse/Ua4EC2dDrTZTA+iU/yRmzszQWBjxxiB0MU0s5ms/CUtLObQKP/HlytSShHt6UYgRxSWY8Vp+NwKfcwUnmDvsVvP9sSkwnPoOR7CPPl3+SqR1sNlpm4cJBIgIeS0qcGFqy00VNtaStMdIZwDNxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785366714; c=relaxed/simple;
	bh=mX+uXiXqmR3+strMhFm04SU2uyDc7C91wtsmT25MVT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ki71p6zt3Bm9y46fWQf5wwrnAfr0/d4BS0c9W2gDOax3C1obr+jitXg0/tNBPCXYuNK17dieC8/UaNdo3vxKclEERbPopWrh9wBWGSBbE594xJGMCPcblDl+ZtGl8o+oV0NBYOsxUuUISrPbO21N0lAJhJWw4NByEqgFQc2WPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9l+b2Ao; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP7UGobX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9l+b2Ao";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UP7UGobX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TMqk7V3357058
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 23:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Wa4zOrWIiejtu6vYmYh+QujFwCPkBq+i8oI0dFrBAg=; b=J9l+b2AoygGm2gwY
	OZncAuAapuZSzxSi03eA3UGAp0FQp01EeYiCgLoR0vSPXmqXmiJNxf5QL9692E8f
	xlJdKkLNl+T5FRYnz8yGC6lxR5pzsyEqSbThJXSl4bjVgDSTmuux1Z/4DFKrgoSC
	ytuGxGe5/Nqv+lvQOqsecDP52drH6ICIaTPLwpag79zmPo31O9pPhQIA0+c5NS8G
	ofjTRQ7rtskyflXtqC66ETzpSLSNnyjrNJKJbP+VchbhQbVyg299Q0gcbapLZW6x
	6qy5ArEyqjrziPZCwow3CUa1/fOnsvqEDLjbqO0ygC1Nv1tPTb6OciWKaNP7yp/A
	w4Ojww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqtpwr1k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 23:11:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so17599891cf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 16:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785366711; x=1785971511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Wa4zOrWIiejtu6vYmYh+QujFwCPkBq+i8oI0dFrBAg=;
        b=UP7UGobXB/4DorrSBjLa6qhnafahy7byKauY5ERlbSact19/ks47Jic5n0dCnmhyTz
         kKsqLQlSqtqgrBKx5YLR0LI5HOd68WehMBHDzO7JTMdX8NmIq45xT2UIGcPhuAHWg3e7
         fphB23lpef8xSX7hv2gPYJq8kMmIt15zkxeORXLsaY9Dns23Oo+M7oxG0/wAZwLm0CeL
         YcSzKrKhm+KAUXtQ0dgRY19X8US8na8Rf5+xoJEuk5nFZaF+/VnhKrC69F43yU3Q7UGM
         pAEDzhDVUiNCgXhNooD4HvvaMzZ+o5+StcPTkztR04wj9AzBzYyyY7yTe0QOUWuNCUbu
         RybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785366711; x=1785971511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Wa4zOrWIiejtu6vYmYh+QujFwCPkBq+i8oI0dFrBAg=;
        b=o6xIeoGVaFhskvo2U7Z91n7utqTMN07yHy9NTw/uzyn+ghFD93NGznTUEikR20wqsS
         NUN90VpGXVL2yKRMlKyGPJ93TpfJba3u0EIqrLlCZfG1pKzZrEjMe37gvOEXfaf3MXb/
         7qMpAbHZilHHc7PGHHcBhun0lXU3ZUILfJTn5Q5e50UpyZQzf2T8VXfIns6kvoUVtcEA
         80n5ttARykcIpK3GHEvZmkVpFC1su55U3pUnp4D6tXkEPzglW5az6ddlxR9VJ1GfCjXn
         IEcAXUuUtXQH2OEnZ1M1zwOmYIcRR/0jrLRvdxxEsPrgztdxYNSbXgZERaB6lXkdyNMH
         qG/g==
X-Forwarded-Encrypted: i=1; AHgh+RqeVImBWvtRXeMNB2t3rFkca4PPKq0mJAj4skIJsMyEJ5qYcPi7ATRUA0LL9l5maP+kc8Pop/ir8qR/@vger.kernel.org
X-Gm-Message-State: AOJu0YyiUFrOCQYaiNpN9UL+qy9ej2GSVQ3dne/Y9lGhwIWpZX9v6ybG
	wY2AqJikV1WMjj0nkVdH2dkshftvxlbuwpVIQ/KExNLjyivyiCCd07SFVdv+EqvfvsU6hJWD4Qf
	TYyvko/WDrF5SCItRvM97ldyio+3he/xTM5jutIkLxZ6+NZofWmJjvjQnLMcXto4X
X-Gm-Gg: AR+sD10uk+BUl+3B6HpeloW9fwD880+dV08G5qa/qSDtxnZwO4aVgdMaHJrSDWm1n4p
	UMbXmGPxbu9D18ij4ZSBP8d8rmQwjLRpu8H78QY5TpWgdUteE5p08Z+G030zka56T2xznDMYx1r
	m08CdLZRGps/gHsGxnJIwsONzcSlpCQUdUkPqAtyfByOl1kZ5TVLhFvxYArJBXBCfTbqoPwzJjI
	keIYYvCF5yroJF4+y2zpjhbAFDTFbA6804nIl6JZH8E1IFDMuiCDp+DVDgVMlbLEjcJmLEjJa+j
	EPsGzMC1K8hkD0utWJOZjI4dSWFilHjQw6L+SQmHgzsR3Fxhk9+P4s7SDCZljp5sQEVnjqViFxf
	JQlOlMipfgrFk5dERbytKlQilqLE=
X-Received: by 2002:ac8:594d:0:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52b38497620mr5750591cf.33.1785366710542;
        Wed, 29 Jul 2026 16:11:50 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52b38497620mr5750301cf.33.1785366709984;
        Wed, 29 Jul 2026 16:11:49 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm184393f8f.22.2026.07.29.16.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 16:11:49 -0700 (PDT)
Message-ID: <667133b5-10c9-4007-b5db-27e553dd5034@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 00:11:48 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: qcom: sc8280xp: Add support for SM8475
To: esteuwu@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260729-sm8475-asoc-v1-0-3edad8aa7628@proton.me>
 <20260729-sm8475-asoc-v1-2-3edad8aa7628@proton.me>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260729-sm8475-asoc-v1-2-3edad8aa7628@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3MyBTYWx0ZWRfX8Z8CM1Vxr1Ci
 ZVNDzgZcG9gwLt32wCcv9I1wF1AQSQQxMWaOVzXeTrlQUJkfJvJblf7Ic8uJ4wJytQ85nxXcPHQ
 /xATF/jmm9LLARMxkIwQjgmPtyci9FM=
X-Proofpoint-ORIG-GUID: y4C989O1xb-AVNu3Kd0WNJ_TepRhbH9d
X-Proofpoint-GUID: y4C989O1xb-AVNu3Kd0WNJ_TepRhbH9d
X-Authority-Analysis: v=2.4 cv=KPVqylFo c=1 sm=1 tr=0 ts=6a6a88b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KGg2J5DcaUvRLS7BGUYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3MyBTYWx0ZWRfX7jq+Kp5fG0Tn
 Ry2iC0y6qETej+EMrEmPGtl9jB4hxt+a2pi6bsTBRoQOoI1q787OhSFmPBCa30sY+1btRX+GhO1
 vqZNWTUTEdvJWBRIxuhMXs8JgVKRX6Wod8lQto8wbhQLmrplSt7pEwjZbA6BZ+snC8eQlNWr4ff
 04zom9MZ03Rb3qiSKNSWUnyqYvyXEQLug4BeS0AUM17/PGvEfr++UGfAugh0YN6bWLweP2NhELu
 4xjiGKzF1+Tr0hYcu/JOACNYx4/9DeO4/CH/30+h7ierjlOZHg5XBXueoGE4ehNDK30rWfbLVUv
 XT+4JyDLDborygwmTqGg9wZyIA9Tyf1d1QIeseZUgyBtTn03i0dw19qMkqLYriH1Ilxmm5mIXIZ
 r52AfEBr731x4KtshOuSpfMMoWEZ+HnFZaNfCIDgj7RexW05c3niIQvOBmA6MJxcZRCY3epQbgY
 bZxfFHE+NmFoSuPpmlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290173

On 7/29/26 8:31 PM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> With this, SM8475 topologies can have their own firmware folder.

Patch itself looks sane to me, but the commit log needs bit more love.
Its too short and does not explain what this is platform is supporting.


Once fixed.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  sound/soc/qcom/sc8280xp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index a9304784d41e..f0f3cd8fca38 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -362,6 +362,13 @@ static const struct snd_soc_common sm8450_priv_data = {
>  	.wcd_jack = true,
>  };
>  
> +static const struct snd_soc_common sm8475_priv_data = {
> +	.driver_name = "sm8475",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.wcd_jack = true,
> +};
> +
>  static const struct snd_soc_common sm8550_priv_data = {
>  	.driver_name = "sm8550",
>  	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -395,6 +402,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
>  	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>  	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
> +	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
>  	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
>  	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
>  	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },
> 

