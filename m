Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6CD40F8ED
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542130; cv=none; b=T5n+v2u5DuhBUiCiR83w+pUVm0oy48hLIqaYDQ/I0IMjdebQ6qqQ1B9lyDszxoqr9ZJ+AAKvVs4Xkm5mihMtPJYoUNXASO4k6fHAen2j9UJ/JWp6efrQ3cqkxMg5Hzt5Fp24bgimKqMAsIaufTDG0OKfZuigKr3pKUpr8u+vWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542130; c=relaxed/simple;
	bh=+H7/xJ0u8V7rPds7nxD25fdyLiLvfaBeodi7R2CCUic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnZFHIWcfNxdiAB1SNelfuFT/50n2XgH8+45sFGFyfgLG55QR7+RPfJikqKfixXYGYjQe9d5Srhmuzd8uLBSql0pELRQ2Agr7oKd9N/coIRp9KwRTIF62ozX4rV7SvJF7QjF+idoSskRvpyou7lOd7xx16ZaddAqLHENVZAnIE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dL70VqwJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjTJsPVN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dL70VqwJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjTJsPVN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhg5B347848
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIMuXijjjJTR3EDSM7uSnEsn4hZwcVL3x3B6MRh+Xg0=; b=dL70VqwJXdUke43b
	ydmmbkPkFqYanETuthFSOiaCR+Q1ddqw2hmqomhOpdadgiZd3bPcMFJz7R1xUqoG
	XUesiJ22mdc49yfrOJCYXF8RmehMcMzOQy0OOwae+didMfTWfXht/zc6zixmQB8J
	CeyEEOgyrZfScyt4skBDnoxWXujKBa7B2il5LXppIM7PyUQQwQx1aeK5uA7Q3Ca5
	gxh1I2EaTo7IMPSDN+aSmUPh6KO9gwYBWg4WjKCegPSS0D2WwlZbYEQTNiD1ZhUW
	o/SCteqc+99i2Qhorf3rYplnRUXpNMrWmqMDibCaGczjAfYXePQ+IEYDInRDfwS7
	Fc97XA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjsvxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:48:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ce9ddfa7ccso8664536d6.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781542127; x=1782146927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WIMuXijjjJTR3EDSM7uSnEsn4hZwcVL3x3B6MRh+Xg0=;
        b=cjTJsPVNsY7QSp7bnL39pgREtMSwvhyEh1+TiaoYGiI87R3d97IFF7oXqIFegB6Wec
         D6NuzJOLCXdCUPB5kMQg1hA8VOhiXVjCOnhkGySWZj5AOcDEUUi+HZD0NfIS6dz3EeEa
         ZV16LkoVhvsvjmHzueC6i5hf1DvQCC2p+AfElR8hJJ80X5KfSQC3CE+0y6ZObMSUJJhZ
         ARYw+kLtqRiX3dYy80bz8lyouzkLnUZtL8QmeQu0ftU+CTErcIfrkf9b727WqevNe65A
         rwmbua5S2VWkl4InjmmgeR5ZIVsRHzTfWPRTxYDcUji0YNc3BBI/DLGhGmGB5ESHuZtY
         W7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542127; x=1782146927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIMuXijjjJTR3EDSM7uSnEsn4hZwcVL3x3B6MRh+Xg0=;
        b=fhaH79bwlCtofez1kOJj6eTLN2MCJ3dKwjR4zTqsQB5de6a1oYyJ/2rSfBwSnCWPPx
         A+A/LWbzx6Qrd1/vWZ70Ge2Sbl1xd0Sn+G129R07Vd8g3RIqSEpZ1JZLyCRHe/N+3V6E
         KjjemaR30yTUmypHY2hKIdeQDIWb8zN3ogAx9iGmdLwFj6iPWBSNjgXNUtkrS4RW6H8y
         KRfAPeWYtYdnavgztr7STpmKZMf+yYfSPsaI6Z+5DRMcciUhOeKkR+AlBkLN9QJ+bzqC
         2l6VbtgQq6Sq022IN0ms3TJVOoA2x+3kDnosYo3l7JvsuSonV6RG1Xe6QDiqzPNIx8bZ
         LHtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Q60vQKfDJy1K0INzhEYqlrDwcTE7Fy8nM+9Ac/WC8mG+XqHAy6ISstSQXI22tZzBnT9MXerMDtVJB@vger.kernel.org
X-Gm-Message-State: AOJu0YwdF2QKBeBhIGsmueIAp5x/aIKNpzcati/P0zVPgdBp8SR4Ph4L
	yleWPHXpo3vRkO4rBiM62awFMaoKIq+4I1vxxfpAmZ7c/kpL/b//YigYW3Esi+fkYYlOKwCTT2S
	rBIgwiyly+ELl2yUdoSw+cel8BoOVirQT195KkyWYKuU5g9pZEnqDSOLT+QS633Bt
X-Gm-Gg: Acq92OFJG/TlAmbCBL8LUJD3kbYn6kzrH+gWPuNj0CW3/WlRdrCPHM6d4j9wnHAU892
	aGyUKE4TRJpdUo/kEWSKwDWz6XweZEWnJnKwlhrfjw1hb4InASh3Vvcb1QNPFhSKcLCl+D/kI7H
	BzkCl1sp68LKIPEhJ4dXaLpkL4k7r46QE1ZN0+2r1aC2n1hHzDJarv1e7syHIHRu+zn8l99CEvE
	A2vQOv6zFICZWCo/erPtMpBSknKzuAErDDnGVnykQaX3gER6E4Pw9di7A8Nv+xwI18LUW8tDNVb
	iSyNFJHlvu0voYuC5aVXMBf20vni4Ksqr6gtLKDB0ht5tt/4UfVMJ7QH71hHiAG4diX1OLZI9qY
	5wm3hFb3kGDQMM3jKWz+C1y6njAkVl6JjkA3uFpE4abr7jw==
X-Received: by 2002:ad4:5ba9:0:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8d32869209fmr152792486d6.0.1781542127375;
        Mon, 15 Jun 2026 09:48:47 -0700 (PDT)
X-Received: by 2002:ad4:5ba9:0:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8d32869209fmr152791996d6.0.1781542126730;
        Mon, 15 Jun 2026 09:48:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c066007sm783581fa.18.2026.06.15.09.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 09:48:45 -0700 (PDT)
Message-ID: <bae5b5be-16a9-4581-9863-4ca4eca88754@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:48:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-1-ab2bb40fd490@oss.qualcomm.com>
 <60170148-2fef-4282-ad68-f784e4fdfe23@oss.qualcomm.com>
 <831ed020-4a1f-46af-95c6-38ef1f875fd1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <831ed020-4a1f-46af-95c6-38ef1f875fd1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE3NyBTYWx0ZWRfXy2Akq4rJI7Q+
 WV6PvUcFcbJz92OU+0bs2X/mmlG8nrBgCoe9ZKBGihqctqkqrIaCjdf2N3Bt8ES48mPGRCYDcvu
 P0+Rvy4ulTCp6bkIGV+ZGMmJ3zrZBiUq+CMEVjoQ/ywRBQrXKVM9FGQidmpQ91Pz80bYCvFzanp
 HXhGYLhqr0T9PgfD5H+sYrwf8pEE/XGRXdnTvKtwYV+5ctQmTGhOUPx8//ZBRXAyTq93jPgc3cb
 j2MwCb8H8jdL3XjAQZq24hKKSOHuwEx9GnLAXrdcMlVEU95z7hqgFgtQFb7hZItP89Yx6fins/7
 a7cknvQzGindoqVr5amdCJQnMKuvHBfarQwwSYxPLZsv/std8ZMkzNVLR7zCuAZmE3ZVVX6K8Nv
 2n0pYMl6OiVjWstQtAHpxH3BXvlX9yh1DZ2AyiCrDOyye+lakGcHDDIgb9vGRlJ7CTvWRpfiYQq
 ZUAOvJOFcMb5I84rJQA==
X-Proofpoint-ORIG-GUID: uZOhC6BSblVIluwkKSejIGIjK176MzX1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE3NyBTYWx0ZWRfX4A0VoCtlmIru
 7oj93y0e+mBV9K1t1BDPFGYw2BMDqwzk8Gg86SK0LJHLDqEJ/Gm6GMCTQGKSuC6izK4ORWHDrM/
 GAkEND9FUp6gIQnlJ+bNDLzsHV2fe+4=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a302cf0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9RCi9ZdM10RZw5nSpo0A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uZOhC6BSblVIluwkKSejIGIjK176MzX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150177

On 6/15/26 6:39 PM, Neil Armstrong wrote:
> Hi,
> 
> On 6/15/26 17:55, Konrad Dybcio wrote:
>> On 4/30/26 10:58 AM, Jishnu Prakash wrote:
>>> Add macro definitions for virtual channels (combination of ADC channel
>>> number and PMIC SID number), to be used in devicetree by clients of ADC5
>>> GEN3 device and in the "reg" property of ADC channels.
>>>
>>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> And what happens with my patch [1] ?
> 
> I had zero feedback so far
> 
> [1] https://lore.kernel.org/all/20260504-topic-sm8x50-adc5-gen3-v2-1-5cc04d6ecda0@linaro.org/

I think this approach (single generic header) is better. The existing
ADC7 bindings which your series draws inspiration from come with a ton
of boilerplate.

There are some non-trivial mappings in there though, e.g.:

+#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_100K_PU)

but these would presumably be deducible from downstream

Konrad
