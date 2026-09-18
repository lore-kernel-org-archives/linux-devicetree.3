Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D425B0B8
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741229; cv=none; b=e3a2nsJWZxCR0stSkoCvaBISnF+OXdDCpYcG7+VCn2iHL+qpcDdvrNCS9+M0eDobvK3XabHs930O7W+cCahgKKNbmtvmYbMRIol8wioW+IJFM4FPmOBZsDRQ6xXimdZ7UenfoOp1Z5fKQ83NY90GezG0SfV5dLHDXX8IY0Nt6TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741229; c=relaxed/simple;
	bh=gJTLMCNpjxCPB/O/GnGRRpYU4FhUYAffCj2gOaX4u8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGK3fcCRVqGXUNd7Id8SYW3B14ZQUiJichPNKWXSJ0d4AZKF52ui5Uz/ekrvUqMtb05VneOYqIWt3j8b2EE8iGf3e31Lm0ErAeqdfYs3VIGRJcLH2qW77NIoXC5NEk3kbvFMSnE5TcNhdKUD3b+OMwbBdTuttiTMODcOmRfGYAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsrtoD1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNkoYYm4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsrtoD1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNkoYYm4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDORnC3645735
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=; b=gsrtoD1oE4vbHlyj
	YPwx6i6qASESItiVEtczLACbXnj7z/2yGZm2Byj/2zQT3KFQ2D6iSoekt07Wlltj
	yLttejpJ+M3IVSKuKb7xJXiRULU196VIExn+Yb2sX12XCTTbPyQ4fF48nHvFQ5Oh
	PNbj6it5UC7uc+m0jHzEI9cXg9ZQ/PvB0Bs3RMIi0sYdDytnKnzRGR/jpl/G69nf
	mnsOlR1UFBikOT8NUmKAiD76N5bDLLlyBEkN2NRFeQDORgG+oIdxenYgu5CoOFxY
	JWJCLC31f+ChCsnwnXN95Pkapz7gV3GwT8KryyS2GtgebsqFNYa8hRZqSSw3/gWY
	fIDDzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dgx3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:20:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9394ad7f64aso122314685a.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789741226; x=1790346026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=;
        b=MNkoYYm47Nr/jPlBXuZ6UbW6ZdSxlkKzvXC91wDypRyX8M6f/8k3Qkhr3BN+hByDb2
         cuHdyFYvj1wdUOBvYIlsxUzzbjRSO5Xbkye9vV/cx76zBm5o26G1IFm+Z6q4tfJDxERv
         q2YakStv9oxoui3t6u+mEzr8g5arVg96ZftOjBG2UmA1sBbCLEKWEWeD8ErJ9A/B9LfQ
         /Mdh/G2fGCFkCixSiWlxRb9Q0uIfN/tU3QM0p1dho1ZeFsVYkWOCVE9OB0oCTM0d6mS2
         MLlchMmQyF1BMqq1Rb/1f04nKzlgHuVWn0oQ/VjG9QQB6IllHUp7nkWRAu3jS5xK9PQy
         PXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741226; x=1790346026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=;
        b=mD1QOFYCqKq4PL3ooSj0a4TzxwnoM8a8D/AVDbjke1VjfBDLshmaF7Ptfw5gkXYBri
         Ulb691qgmo/CDxAwzdgBgIq+J8vgsNjTskqFvU4PL3C6CTj/reijMBtvykpnO+jhA1+e
         S6Wt9CMJGOQwHfMhdAF0PXNiEkxal/fr7cKiDUv79Vv54xf4enTUA3MLOfYNGGnYPTl2
         i41NKcpk7sfwzj+B89xcuJn0YukC99S75hQGywrO/0O9vBUJJQOKI14aUxiovFg02pqH
         YbilJhZmlzRPB6dloUgPYpaadAuhWtIEovGDe/DJycfCK6blDYOyIO+WM/WhLC+obIDk
         shZg==
X-Forwarded-Encrypted: i=1; AKwUvBzyiA96nUJSLDX2GIIKRRlG3y+AHQ/2ZEQLiteGc9+Qspg/kCOc8nphnpePlcsMOvY6+uwII+EkoiBo@vger.kernel.org
X-Gm-Message-State: AFuF++nWOUv6Zgpb4hm3U6HQzfKSraXyMOzR4NzN/RoWw7N8aBCLeOw8
	JPotvI8kR3d5gsegtN1EewEoaXDtUupJ7JFbdg52RYmUXR1zLaGZhgKKAVEB4gKw37jZ/KGp+Oh
	Lyv1IjakxhUksMOK9YrAL7RoaTLhy0xvZkCTO6pbgx0OJtmoJW9ElWXQwUW/gpVjziP8zQ+XU
X-Gm-Gg: AYBFou0KRGUvjag0lVQNohDgfo1GStl4wNhlHQTOV9Q3/RUBP4B/hyltrd0PGK2Awos
	J5okxU0bgN/3YHS8FGwWc47mu9H1NOy0VGZ3UEEthhnkiCDB05hzQWz5+0rHxUzLPL+yB2kHMxC
	ceK3oNt0NAv2+FqjSjG2F7s6kJZF+KZds5qAFFMykRlUaFYde9hX/mEYWy728C/EXUYVazBVtXx
	J169KJep7EQadeAIDvoateHIDfTsPASCq4CwnEiZWjp74ZuMosBMKNyRKwyydnuXJq/8Xh5o6Vr
	sQAkgCTAT1A1JygMFnfXGsioOt7vrqPt+m3fzwAWggrjeCWc84+p+9Su4owrLR3gY7OzNNK4hnj
	5y9opsG0Z12E8+VRNk9ro862Yk9I=
X-Received: by 2002:a05:620a:8909:b0:933:aa0:bb83 with SMTP id af79cd13be357-93bdc747954mr372714185a.34.1789741224642;
        Fri, 18 Sep 2026 07:20:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:933:aa0:bb83 with SMTP id af79cd13be357-93bdc747954mr372707685a.34.1789741224091;
        Fri, 18 Sep 2026 07:20:24 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2a1bb8a1d2sm62661166b.40.2026.09.18.07.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:20:22 -0700 (PDT)
Message-ID: <13ed4e23-1092-4e6a-82ce-b36c1a0016f0@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:20:21 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] ASoC: SDCA: add
 sdca_apply_default_control_classifiers() helper
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-7-srinivas.kandagatla@oss.qualcomm.com>
 <aq1Hsw0se8zKVQSE@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aq1Hsw0se8zKVQSE@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfXwotONOwuozy9
 nFHOiBXw+VlAyQ1z0v85ohr2TLSnEzwpQpTOp/HPFfSTxmWzaXeUe+eUlpt7P1DfsvAmnrBqEXl
 SsdQ1TvjJkobnYZMAxOVDo/LcSfLVJA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfXxGikSD2N7Agn
 IPOLBI1pPjo3+oj6yldV3kr0WBwEsltyUIbQhCwpiXD9j8uhp2y8R5FykIccmW9K47MFEKuoX9K
 ZHhlUYEmCGmKN5a9flofrD2BqsGfWVroBg2GMuHXdyYJ1HxJ/OGWQqGQj1SUJBXCFtD5I07v9x/
 oGEkdP+52k8mRbhCm2moEegwuUv5ujuLeOfUIl49nIs8/2WgNgo0H035LoDiw83dX1gJlfWtBN/
 5brh07B625ExAqsQt0QsA1zq8ekCqMROZe64ZQF4xlR39KxqxEP+zUW9YbGey/4xyJCvEUWM495
 qOYOCrsH88WAsPTQQnv5F+CKtf1G3amHxFu83CaIOaAfXvh+iUoyCRD4d9voNB7YUmmDGpQnIpT
 uX5kw+5tAnrnP1fdj86qPix79hP/8DUXDupTmREkSt6matU8tYfCvwcorcJ68lNQRLCvw+qPvDW
 QvOlipaw5H/mWcX7E9g==
X-Proofpoint-GUID: YBFAJ7OKptxwbaUlPyQb9wJiWBGsMPQ7
X-Proofpoint-ORIG-GUID: YBFAJ7OKptxwbaUlPyQb9wJiWBGsMPQ7
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad48ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bNv17eZGp78-fAQ_3FUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180204

On 9/18/26 3:16 PM, Charles Keepax wrote:
> On Fri, Sep 18, 2026 at 02:19:11PM +0100, Srinivas Kandagatla wrote:
>> sdca_parse_function() derives is_volatile (see c7b6c6b60594) and the
>> spec-defined reset value (see 02d851b46b36) from each Control's
>> (entity type, selector, access mode). Codecs that ship static SDCA
>> tables via populate_function skip that path, so RW1S action Controls
>> end up with is_volatile=0 and get replayed on every regcache_sync.
>>
>> Add sdca_apply_default_control_classifiers() to re-run those two
>> classifiers over a Function. Elevate-only, so codec-set flags win.
>> Call from the tail of populate_function.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>> +/**
>> + * sdca_apply_default_control_classifiers - apply framework-known Control fields
>> + * @function: Function populated via static tables (populate_function path).
>> + *
>> + * Runs the same per-Control classifiers as sdca_parse_function() so both
>> + * entry paths land on identical @is_volatile and @has_reset/@reset fields.
>> + * Elevate-only: codec-set flags/values are preserved.
>> + */
>> +void sdca_apply_default_control_classifiers(struct sdca_function_data *function)
>> +{
>> +	int i, j;
>> +
>> +	for (i = 0; i < function->num_entities; i++) {
>> +		struct sdca_entity *entity = &function->entities[i];
>> +
>> +		for (j = 0; j < entity->num_controls; j++) {
>> +			struct sdca_control *control = &entity->controls[j];
>> +
>> +			if (!control->is_volatile)
>> +				control->is_volatile =
>> +					find_sdca_control_volatile(entity, control);
>> +
>> +			if (!control->has_reset)
>> +				find_sdca_control_reset(entity, control);
>> +		}
>> +	}
>> +}
>> +EXPORT_SYMBOL_NS(sdca_apply_default_control_classifiers, "SND_SOC_SDCA");
> 
> Just set the values correctly in the tables in the driver, I
> don't really like this going back and fixing the tables up leaves
> the driver tables looking slightly confusing.
That is one way to do it, I was trying to be more align with what was
getting done after parsing the acpi tables. But I dont mind updating the
tables directly aswell.

I will try to document this so that in future if someone is converting
any acpi tables directly and then they need to mash up few things before
passing to sdca core.


--srini
> 

> Thanks,
> Charles

