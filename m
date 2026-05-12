Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434D13C553C
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574455; cv=none; b=RljWjneLQQx/k0LVYjHg90bZLPlvj35S4IKe8qr/19ZZG4ILj2LuzylmhoLm9+CyCCVCPXsEswQO3TH6nI/P9L9dOK/tNc3DcsZoMiQP8H1JzQa13QjXHfb7LelFeQEAPNxXpHbPvkoLf/zmDRtDJPrzS3VSfk2KtnoBJl01fP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574455; c=relaxed/simple;
	bh=fp+V34hpoB4yOssKdt0U5isqsJCDpUTiW9m4DUr8URs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3BcCRxy9OTXUqPD1i2LUbIPplpP4OLqjFSAkSjvD7L5zr3Fc/5Zg5OjzY/bvwWwnUQnA85baTyfHOHe+OkpOoEODpeKyGgsIZFICH98Uh+ImecbfTI9W6Mw/EEydogpgf/KaQaucOAtc5erWHtv9Xs7TDMCF62lAfYzsBJFzwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEnV6RHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1fesyPn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEnV6RHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1fesyPn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C6sP7r207474
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+qOXO0EbEhr59vYIl1KFFAbXwwczXSC3203+FTat12I=; b=HEnV6RHMDE4ksLLg
	IEaGiz2OR8zAqO1LerOH0lU+PAy4b5wNxrY9c9U5uTFxTGWm9QgiSi0Hhmdy4MHB
	pG4F3GeTaHtLd2glTpAetIfgj39iXLPal9qQaAecm3IBpzUwYp6Ba0hpSb2nEv+W
	2pBGfqeZKkw2LnxszX1expqBrAaBTK8Sk4YgMG7U/N2kIFqKfmzaedlze2P1fUmw
	kO4YWxBjGdA+h7AWnQjX/u7iRfu4ZPukZ5G43k9Rg8vzpN3XGY8zv9dSd6NO7BeV
	mAxvxbK68mqak6VB7l+w0HwGdbtqZm10YXRitdMKsKK831LmdCxpWUq8DMXDBNPy
	YW9WBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0t8yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:27:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e575a50bcso34911981cf.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778574451; x=1779179251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qOXO0EbEhr59vYIl1KFFAbXwwczXSC3203+FTat12I=;
        b=c1fesyPnvyYxCUTVrflmRdKR2aUaRSBQSR5bwHXf8zi5nwrc9kkPqArFeOUKEeVhUB
         ndy0QZBCWaLr6vukAurdrwGvl+lL+Fg1iCZ+GM+uQHYrBcZyPa2VHxe29G4Koy0FJWFh
         OSAaClRwZ3eqkQ+9o8jI7FOEUSkaPBa8j7ZZk9VRTeS06zeyDCK7EYdmESUSIg3XbZzZ
         dDY9SPc2cT3GP9NNamNO/WNI960vfw+KEIQbBxsjOp7Zz4b+QdNdHxwBg+mVEOVD3VV0
         IbziAW46I/Wx/1JAA7lRhqJBb7iyvjq3EZowD0aKy1cFuz2zR2Hn9yjsYomripsoS+7K
         cvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574451; x=1779179251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qOXO0EbEhr59vYIl1KFFAbXwwczXSC3203+FTat12I=;
        b=jMIMc0pheNqCOzHll8D6ybXIzN8w07/aWfPpDRdc0/kqagW+sNXzeT9s68r/DfPfyZ
         tKPmt6ThxEpxgxNQGBI3rIylGnbb2WygPaE7qyTd3kakLLYE0fkcBhhrZearvJkNMtPO
         xq+iotaMu1LD85vt65nZYA3iW+jnLZdsBNcUFZRmJ3u88giHOWYJe5XcbkMS20AxBFI6
         VjJtlW6toArGTugIpexbgoB7DTos6+v4xss9FGpOskbskK7uLizXw7J7yQnnsjHjVCBt
         WUO13uZsGT89Eoa23cIax4pshP1Ea7Dbfb7MTyyyn61H2sYDeOzmvIpT1m37bucEoHdp
         HT3w==
X-Forwarded-Encrypted: i=1; AFNElJ+Q3+hwGNsFjtt30FgsX2A54CNlBQdBZSVUDmn9VlKYAgZcOui1p663gjHi+WLg8e5oORlbSe+YOAh4@vger.kernel.org
X-Gm-Message-State: AOJu0YyG5ZzWRUtA21J7ZLazA6JRbX2/NI+fJNs+KEyUJSa5v+CNYemD
	biqrVCqwpEQ+UXJ9xiEE6JN8d+/k/Z8PuvtjXQ17S3j8xdxAORE5F1ZHoBUcAf7ReRP8UZEglu/
	ox2oC+Y+aT+zWKjBgdyPULn3a/gxwdVhol3b1sHD9E49NtgcTioJ87mkSefqtIOdO
X-Gm-Gg: Acq92OH8PpYF2CyRyvHscH2RB146CJEa6ytZeYGvNOwKWh4b9DJBHzBX280Ml3k/zjn
	ecmpVWHxXTZbiJeynG4Fg8tX3BQv9dvQOsU25FENOfKgK7KzxO3YrorXkGL9rDl54hPvvqTPXvQ
	QPB0NlKFIsBYtigfG/Sx7FbZ1AMtaFLk+NviO17YiVjSqRwMosxT/GePJD1rVBeN9PkdxHHRUwE
	KaGP66IFsbuyU+aBJRtHyQLaDA+KDDKBkxjkWKh/4m5Jyt5G6SXqBEExPIJYAv08Rlv3ArKW1B6
	euUNivKkEEmFzvgJLoZNHCybErXsaMPO7sQHS3etC0LtvnN6GdCP7ix9UJwRQ4nAVQqnDeXmcbe
	QW3twegGeCYFSrpjquTsmSfqpWg3NiZaOXWBlzsGeE6lWx6Ql
X-Received: by 2002:a05:622a:2613:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-51461f9fc6bmr388503491cf.38.1778574451516;
        Tue, 12 May 2026 01:27:31 -0700 (PDT)
X-Received: by 2002:a05:622a:2613:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-51461f9fc6bmr388503351cf.38.1778574451002;
        Tue, 12 May 2026 01:27:31 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45ba2aaec3asm589796f8f.15.2026.05.12.01.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:27:30 -0700 (PDT)
Message-ID: <2acc3606-2e34-4037-94c5-9f6f28e497d2@oss.qualcomm.com>
Date: Tue, 12 May 2026 08:27:29 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260402081118.348071-14-srinivas.kandagatla@oss.qualcomm.com>
 <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a02e474 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LiCzDUw_Kzk_wQzT1yQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: lYv3qiRCnVnMYFW_Tm8f23OfXPwIomud
X-Proofpoint-ORIG-GUID: lYv3qiRCnVnMYFW_Tm8f23OfXPwIomud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4NCBTYWx0ZWRfX3x9rq4jELNUj
 8skAoO6CDvDPW/rRJAgn3bgYu4fcUBTKx6CexEvv/0oG7BStZXK7cXScmdW2Xxjt74Qb3r1Cj5M
 GSkgbHpA/gXkhCvCc/Ocf+CWKeFSOXfpHlD/LWhNFwS56NATT2PrxthQzUPSYHKBO4r2M0V2//Q
 WbpattX3QVtCnxM9c0UgxkG36Q5AyCZwKnkDxDG3r+92SDYlMWi/iC4alkyCmrJa6zHUrBiJnM6
 N0VvlJQTsPv9f2Q+Nm/bX234c7BMDPRRHOKwM0oVOESmA4qJnhnULUo612etdTloZCcHSg0F9Rr
 lFv/AJfVj5pdCR1/7nMIWaxvcByxaci7m73Jl5CpMeTGyO9zBr1YV0rli1WofVIBe+kV2c72qSE
 HaZc1PzbkpR5lhpfqm8cnD0KWifKGuSg2TZdk0K6eO9OOPQbUGFtOHvfHJzCCikV8rMqQWFO8yj
 V86yXgLxxKKCXxV1F8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120084

On 5/12/26 5:09 AM, Jens Glathe wrote:
> On 02.04.26 10:11, Srinivas Kandagatla wrote:
>> Buffers are allocated on pcm_new and mapped in the dsp on every
>> prepare call, which is inefficient and unnecessary.
>>
>> Add new functions q6apm_[un]map_memory_fixed_region to map it on
>> to dsp only once after allocation.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c |  60 ------------
>>   sound/soc/qcom/qdsp6/audioreach.h |   5 +-
>>   sound/soc/qcom/qdsp6/q6apm-dai.c  | 107 ++++++++++++++++++---
>>   sound/soc/qcom/qdsp6/q6apm.c      | 151 +++++++++++++++++++-----------
>>   sound/soc/qcom/qdsp6/q6apm.h      |  14 +--
>>   5 files changed, 202 insertions(+), 135 deletions(-)
> 
> Hi there,
> 
> I had to revert this patch from the series to get back working sound on
> sc8280xp (Blackrock) on 7.1. And hitting the right patch was pure luck,
> tbh, since I integrated the series on 6.19 and couldn't apply the last 2
> cleanly. But figured these are cleanup/refactoring and left them out.
> 
> The errors I'm getting on Blackrock are these:
> 
> Mai 11 21:26:32 volterra kernel: q6apm-dai 3000000.remoteproc:glink-
> edge:gpr:service@1:dais: Audio Start: Buffer Allocation failed rc = -22
> Mai 11 21:26:32 volterra kernel: q6apm-dai 3000000.remoteproc:glink-
> edge:gpr:service@1:dais: ASoC error (-22): at
> snd_soc_pcm_component_new() on 3000000.remoteproc:glink-
> edge:gpr:service@1:dais
> 
> Since I'm way out of my depth here, I won't cite from the Great
> Hallucinator's analysis. Only reporting that this refactoring breaks
> sound on sc8280xp.

Thanks Jens for reporting this, Let me investigate this and get back.

--srini
> 
> with best regards
> 
> Jens
> 

