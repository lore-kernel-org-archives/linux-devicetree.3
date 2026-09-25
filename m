Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F99147F778
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334170; cv=none; b=Gzvr9f2h0UtA9L2Kpvbe4QodtEqkdOagk+ld1f+LDV5XZseTlFSC3DPgl3wENN6SesUnW9C510EKhKOtm255TfQJ3RGk62qy30NDXY5ZFQweN+LXxr9sFrb8umpbJiqv57jUoraYp3lnRaCXdzZ/rvAAnlcvLSYEuzjEUt7bekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334170; c=relaxed/simple;
	bh=LNOMjLy6wAcR7Zrv2JQzDuQOs+io2+5LVXSdmKnrQY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebHZCumt2rdlrHKRUT7wFyvT4b1fD1461CT6zlaYzDCsIz2ycbqL99tNA6JDyl38rJF/abIA/yR1FUoFMqk1MC+Yxo9juO+fw9Hyh11iq4VuhilL+Re0IhDVdLwOjXfTIuouuY4r5gDl1UfLHY0qmgsXutfEN2ORbeS/czi3wnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvFh2CFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bisctOx5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvFh2CFL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bisctOx5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z6kJ1056551
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 11:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=; b=KvFh2CFL0Ck4gOAb
	oI26+pbdmpqxQbPkecyHre41ejQiajPuhGGBInHpPGWQbdFySia5lL6pZ5F1B3Ma
	GIockcThtNcuuiBI1f0w7/fjjcsAu1GKzdpEgeYCTdOwzYWn4AQvrqeIl0GOA4w/
	5ZS7CAxkvhO5O/KFIuMTcE4xBxWRVDpewgKusJ0S1g5Gslp1tBg8Y1AC91ZVC16C
	I6bTOYJ5eJKQPjb/oE/8dHv85aGJ0OzjRfDTgppuAkWjFdZhjbFrN/W6MERqqKLF
	psjK+AiB+jJ2oD2ZC+/XHxzz7dYFhRGuLavtAkQLoPzyd2yvcW8iY/4TnOJUScbC
	MXKhrw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7a3tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 11:02:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so1556509eec.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790334162; x=1790938962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=;
        b=bisctOx57CevOHI2baXrK83xChr3w0N3tdNDy232PBOtzftVnfyal2lpgJKvVt19yf
         XrIUHUm01XO0G+Kn4trf2YWcDtOgX05UqtsqlxK0kzxraXnXtG0MTWTnLF7uGfvFptZj
         U/SDWkKdFnUHh+8gpoU1xMh/vAlJAwbHHbPKhgS+6bHXhSJ8H6sr/FqZzvUJBduynveI
         8+FxgxSOghK0xwNaiiPNfxpdCsidFv9oRnbTh4PhoDc0gJRY1ihP84BHCWUyLj6GdaB3
         7lkQw53qvXE0xq6/0aQv49Vx48l5f5btY7jXYJdkWs51XD7EyNigrtKhbF3OkUoZDLuu
         qERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334162; x=1790938962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=;
        b=QGRUvBzcf87TqQ/Uj2gv3MZLnhSBHiop4SZ+Kw9/R+YkmxQHFLJdcMhh/GYMg6a+8y
         MH/rK6DFmhAR7ZhmyZvhh1GwPwjnuyWCs++eNLHfzSCPm7ZrzEgewt5+oacxhoUKifXl
         j5m9dPlG0Bl3JG43ga4DUdr59J6lYkkQ2hQ/dn4nBKkx2XQevqymrs+dbrvTRAMuBMIe
         db0h6DL3PwOe8xQH3Xn+IxeuLX33Ol+kKzCFrMRS4SHGiw0mLeiZLqPQGkLz2At0ULdx
         f6QA0dUXFBQMCsngv5vk5C6rUNon8Ob8K1kzAiTARN3RHZsuwHpDWp69Uv1aDgThLbV6
         g9GQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPXPJw2HjVSojQQ+7H3oW4hy9L0k2TYmtTvGgtmVMTG+wspNI84LKev2TckK5g4/JgXt+pdhDIgmIo@vger.kernel.org
X-Gm-Message-State: AFuF++m2ARk+FnC6pX588dXDYqdKcfAsXmTZ1NdBRnEiXNTLP1feRJH4
	GFKW643jogTC3+59T+L+86b28fUsMko/ZmAwQdnCM+L0Jl7ZfAELRu/wwgO7bSSMcfgyMusVkMo
	+3G2Fr9XuRp7DSthxoIdBeBUmOjN1a2Iy9VraV1oRHx4rbC4RbYOPCxwmsZnBROCb
X-Gm-Gg: AYBFou1kH6uhCvaz+3IvJ9/b8LamL2fnnCsFhaQiKAznE2fgKO0oumAJl/xRitxquSz
	i5MGkYu0NUgnVK/d2NOxtv6vImYCL7L7siNGhfNjleX/FuO4UTvV5nBNw3fsIfmL3C/fmyzEGJd
	AcC40Xmp4YGFXrU0qFX8uHRZE/8dB5vKjnnA1/l+rdo+1gWLyGtZ4qPdL98SUA1iiyiyaOOtye3
	6Dt6u/vtlX1M5cxD3CKusTYyAXlGp1lp25Ss+JzKGBj2aw21yDKEqpBSBd0PDT+PwfooxMubzde
	6ipgw6+3fDGXyZpoM5kL/BpDyQ2wVLrKuu5H+3o0AjUN/2mAGckNlnDkICE9o7ZNl3IZBlGT1ru
	rtB2ExPBMlY834VdYWsPv5mcmGmqS
X-Received: by 2002:a05:701b:2085:20b0:144:eac6:cf37 with SMTP id a92af1059eb24-14503ffef9dmr4634814c88.47.1790334162183;
        Fri, 25 Sep 2026 04:02:42 -0700 (PDT)
X-Received: by 2002:a05:701b:2085:20b0:144:eac6:cf37 with SMTP id a92af1059eb24-14503ffef9dmr4634776c88.47.1790334161284;
        Fri, 25 Sep 2026 04:02:41 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm5428954c88.4.2026.09.25.04.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 04:02:41 -0700 (PDT)
Message-ID: <6f2afa91-6355-45f8-b6be-6b556c679813@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 16:32:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-8-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-8-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a6GrAwsC29l-ynLIQnrlI750CpZtiP8A
X-Proofpoint-ORIG-GUID: a6GrAwsC29l-ynLIQnrlI750CpZtiP8A
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab654d3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=vpuhTeqA5xwXINrO_jgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfXxCd+qZNnDw2e
 DnfWIHX6FZ2nC/opOo7m0A+QpLoQSZbWve4erXK/bvOmRlVduC6ez5ea4UqhBP/AM2UiiS+tW7h
 dK8jsJioBKys4hMsII9Lj6hAX1BrlnGX3kqW/0O8E8zfJ20Ecz8gLpeAjza6CTI0ea2tB4nSwzn
 guq9FrSxrRJ+BTXOjOTUQjtuGVo7Tt8kiixn4F60SWlth0vt9YjmeO4OzlHbpz8BEHXQxKhuwJD
 IcV307SoAuD9253d+vtdZ3PjqJm3Q10PcdbDP0XpIs6ci4U9GNYUjnF7JguU/fETEfkkC2DgOuv
 owywlUPC/7fGW6OJ/gSGnnEvOHFbk9FxJd5QyaOX+FWozKsz8nPUZQvO0tOeE43kbuzjOzAdH05
 21eDIXcNiMbn5nA2BsHMst1sJ4Gj2TZpd8WHHz22Duv5tTlIrCYXWpUECHuEajAKGyk8izlW5hK
 qnOhVeAkx3lVF0DzPMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfXynjUrK1fq1/J
 vEfKukkOTD8P7TvlBNqEEVX3OeTeOjVIQdn+nU0zx7W2nZ25Y6BvIgofGKPZBDiiTg46LfVMB51
 0vdU8S/PMcnQhZ2G9mFt1ZO3URtLspY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250043


>   		rx->rxn_reg_stride = 0xc0;
>   		rx->rxn_reg_stride2 = 0x0;
> @@ -3959,6 +3962,8 @@ static const struct of_device_id rx_macro_dt_match[] = {
>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>   	}, {
>   		.compatible = "qcom,sm8550-lpass-rx-macro",
> +	}, {
> +		.compatible = "qcom,hawi-lpass-rx-macro",
>   	}, {

Patch 6 documents qcom,hawi-lpass-rx-macro with `clock-names` containing 
`lpr` instead of `macro`:

     clock-names = "mclk", "lpr", "dcodec", "fsgen"

https://lore.kernel.org/all/20260922095522.193FC1F00893@smtp.kernel.org/

However, this patch only adds the compatible string and reuses the 
existing RX probe path, which still requests the clock as `macro`:

     rx->macro = devm_clk_get_optional(dev, "macro");

I do not see any Hawi-specific handling which requests or enables `lpr`.
Should the driver be updated to request `lpr` for the Hawi compatible, 
or should the binding continue to use `macro` if this is the same clock 
from the driver's point of view?

>   		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 79abbdd158b7..46ae627ca594 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1896,6 +1896,9 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
>   		}
>   	} else if (maj == 4) {
>   		switch (min) {
> +		case 0:
> +			version = LPASS_CODEC_VERSION_4_0;
> +			break;
>   		case 1:
>   			version = LPASS_CODEC_VERSION_4_1;
>   			break;
> @@ -2166,6 +2169,7 @@ static const struct of_device_id va_macro_dt_match[] = {
>   	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
>   	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
>   	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
> +	{ .compatible = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data },
>   	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
>   	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
>   	{}
> 

