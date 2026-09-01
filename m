Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3091737A829
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 05:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788239513; cv=none; b=b13UUW2fdupC7N+ehum2sjH97cuoSn1SQePhkmp8408yy4KZPEFwx+hBFFlOPefGMibAezaG2/MSlH1attleGRu5DyMpOAgv4OWpPURgofv7OOoEyz8zpf5jcK4uc2/TMoMwwJ3OZqRCGw5HE4vaIe55ltF7MJtTFv4DHp6Ern4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788239513; c=relaxed/simple;
	bh=x0NrO0n6GxChfpnH8ELm1h39PRPCNSwlOKDZGdT2wtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5SmAiscVcICBr7QluefIecSMM6vhpjThk64eru9LkO7UoBbm2ayenXgcLTaIZRwnGVbWPpW1009ez/+oEQ4QNajqaB84clGC3eZ6kl/bM0Q65P2MMnjc9N8slXt0PYO9UtjhMNYMVHl84fTgOAvpLj/tUrAbGgH8x+++CSa+UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1Ha6V4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScorWUO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1Ha6V4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ScorWUO/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810oI921724712
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 05:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFcbwdf1bwEgbcNee+LwGRz29rh55N8u0w2mDPAykqw=; b=L1Ha6V4Oh+62c+5B
	oQOPeysVcXpfeTYXY4o/5oFAFrgNW2ORbTlp/rUTzNIh5QADa1Ga32VX8+9lp/GW
	HcEEwX8j1vDYY0HRAX8a6wJ2gaAjs1J2P2YQpPTUihdh4LSfgBiZ00A8fil/5pzj
	pjrO90SRq3z83snxMfEG5zjTfbj+Nt3pNJcZ7+H5jp309rEThroQK3L1jtz1yUnA
	HrxqZIM5JVpNGCavNBjVXxNTyyUosW8qF6l51otSRxxJ8DfgH8rxkAy12xXiWwtv
	7IZWaMGJ6xR0yV+1QqJmusLEoIiMc0PpUHkCM41Rw8+1RqedAGtelsPgT4q8lZoj
	CUvvNQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3agtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 05:11:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1436838a91.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 22:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788239510; x=1788844310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFcbwdf1bwEgbcNee+LwGRz29rh55N8u0w2mDPAykqw=;
        b=ScorWUO/lCnys/4/IsDcI+TJQshLyN1f3jPjOUujOmYlV08j9dboOzOn7HiHw/3idQ
         AIVgUv6UxEUmI7fSRfyY/6F8oTqa0qUjXRa8EbmqwFGgTZRPaMMkg1qrUeE1nT91w35L
         VLHL7v4YbmAk7qJ6NMf1X3BpDVOP3J7uL/IPR4WrdJ9/960Gt6ES5f6Toc1U5TlsM8A8
         UpyKrnhPlfeKoiAr7dZqpalURF19U+QFmlo4Q3hcbOxq5/McvNbR1X9nW0cGnEWu2s7a
         ld/vkfQS4iZM7dSZ2ukUjrUKkatRywxyG6CwkaGyJeMzBUF4dQ+8TdsE3gNAQlQ6OlSw
         53AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788239510; x=1788844310;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFcbwdf1bwEgbcNee+LwGRz29rh55N8u0w2mDPAykqw=;
        b=Xjg0ItB+yivtxIGIiPjy86HYi3UYmS3M6ULCQpkO18UFPZgQqAAxQq/Ysfa0WtAAtU
         TPxVI37RXyn7RARoE7qZ+U9qUJe5i6jnMCwGlKpY7W/fOdybayDb0Y8NBnqiKsJQNv2e
         2tlRXVQrOgEyGwWiPpKGIwHFqf6TKjdBeqZ6d2/Hpl0+3bmwiYRT+C2eFSy8SXU+EBow
         16F3R02vuV1PmbWjWyJDO9pp3kHvxKC4pOCERO5/T93CP5Jovv6XF4mWfQ0fUh7xbk63
         cV120SK6jw7SDTMnaFOz655e43JVgPfHjNPiYTlt0W9Ozqk58BpmeAx2Mi+Qry3SdVBP
         Q8ww==
X-Forwarded-Encrypted: i=1; AKwUvBxG9GCiWZN3hdv1y/7UeOIy3ORe+bofYBnn6sIWcRwrj/6cORnxT2+cASPqtdQ1+TFD/s5IO8N2+7x5@vger.kernel.org
X-Gm-Message-State: AFuF++nNRA4TAAkdmgk4b+wTECeuDkeBjTVugoTdgzG0WkRldjd06slc
	QXgmwsx778JQ7IgFwCu51lbwr8eyirDzLRdKYIE6VEIBCHE8NnXqTws172E/0vjZSNxg9XODFoG
	x7u8qCh0b5D33dLw1HeZ8THRPxs+5mQx4pZpAWLqpt5r5bKUfI7ktJKfBla5Zztao
X-Gm-Gg: AYBFou29yVxWMVESqbDBhDb1DPGk3nr9d5cI+7aW6V8c7pSe4zIAbZrURflvzN4ivGt
	oWsjF+TMcfA6VYe+Ec6L7kwYEs3WlLgClaFlnURTb0PpoTQrUkWG6w+O1C9EkYFWHZKDWcziKaC
	sxcSIH/3kd+uZ2Av7HZ9qoTEkoohPoWotFWLBYbYdtpnRYooyTfaevlj340cC/fhfP01T+OMY9J
	giDFcPgZiS4u4DdZw9L3vgBxTz2ytHUTBoY6eljJMxvmvSxtgFkLCgiZ6BS7fp/GzOxH09D9X4v
	+YuOux5IXP65mgV5bpwgVMAB94Fui5SNloRkSnY+yUZXFa1vP1W4R4bJglIMKApHauRfGcX0Qy7
	Fj2WRrXKCa8ESZAIOFax8gtmQXz3wcIRo0bZ7
X-Received: by 2002:a17:90b:1dcd:b0:398:9be5:b416 with SMTP id 98e67ed59e1d1-3989be5b4f8mr34457601a91.17.1788239509604;
        Mon, 31 Aug 2026 22:11:49 -0700 (PDT)
X-Received: by 2002:a17:90b:1dcd:b0:398:9be5:b416 with SMTP id 98e67ed59e1d1-3989be5b4f8mr34457346a91.17.1788239508046;
        Mon, 31 Aug 2026 22:11:48 -0700 (PDT)
Received: from [192.168.0.104] ([49.205.116.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9ecaa9sm36041948eec.26.2026.08.31.22.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 22:11:47 -0700 (PDT)
Message-ID: <19a8ee86-81eb-48f7-afdf-7bf5eecb8629@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 10:41:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
 <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
 <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
 <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
 <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com>
 <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA0NCBTYWx0ZWRfX4lCFNXxOxBJp
 UkBx1dv1571IL+rQnGnKDbj50fgjkgD+YJUeiEisQSwwUbKtGzvdBEL9tG+7CU64rOLpRYvWwzx
 7VDWYijQbYp5AwAU9wgcJCRX6tsDA42eCHeyKujTV1iiHCrimbWi6Y0YJPHhhwVdQi95Q+SrpH1
 CupehsvIZu1D2Ad9BH+xPx1h0lE8MTldVH0wVWB/2lhcxZzrnqXOW6RpOK5GoC3eUZlr2EJCFdP
 pK0XrB8+PL2Oq08c/ZGZz0NlI/u0oo/2AGCDJRqIi5K4b64hNnXypzQLxYU+D216OZE5tb7r9tD
 OoMrVithJ65QR+rjgUsNtYLHUZMJ1xcoXk7GrlkGV2e4xEwGb37FOMk5KTcwvzciz91A46d2tPQ
 j/dBpChHdzPLs6U8umTEPKThetPxsleGyc0E4lY/clSb3W82DHWp6ENDp3hqw0MBZ3k8TsTRNv+
 tKcp4ls3KXuNSfXkEgQ==
X-Proofpoint-GUID: eTghb3RT1vdSWTwrr6mQ19S2M8x6oxfr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA0NCBTYWx0ZWRfXya7oCfKy42ud
 DYJL/lv/MSJbSIhxPjpb9OybRRgeUHEzoBIIDU2ufejtrHBxRuOiQ3xMiA0UIYgMfqquEI9HOY9
 ktGQNqAh1AusE50AZjAqcHYLm6xLQQE=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a965e97 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=2ngnHYY/h7Qxskz9zhV0NA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=EIvSny-5AZ8Ximd9insA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: eTghb3RT1vdSWTwrr6mQ19S2M8x6oxfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010044


On 8/28/2026 6:12 PM, Srinivas Kandagatla wrote:
> On 8/28/26 1:37 PM, Srinivas Kandagatla wrote:
>> On 8/28/26 9:58 AM, Harendra Gautam wrote:
>>>>>>>>> +#define QAIF_CDC_DMA_VA_TX8  254
>>>>>>>>> +#define QAIF_CDC_DMA_VA_TX9  255
>>>>>>>>> +
>>>>>>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
>>>>>>>> card registration to fail.
>>>>>>>>
>>>>>>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
>>>>>>>> beyond the supported LPASS port range.
>>>>>>>>
>>>>>>>> Best Regards,
>>>>>>>> Rafi.
>>>>>>> Thanks for pointing this out. We can either add the range check for
>>>>>>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
>>>>>>> qcom/common.h to validate the supported DAI IDs across Qualcomm
>>>>>>> platforms.
>>>>>> You should add these ids to
>>>>>> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
>>>>>> conflicts with common code.
>>>>>>
>>>>>> --srini
>>>>> Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
>>>>> DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
>>>>> Q6 DSP involvement, would adding QAIF IDs there not be misleading?
>>>> These are IDs that will be reused across both dsp and non-dsp solution.
>>>> So it makes more sense to keep it in one single place to allow the
>>>> hardware description (DT) unchanged across different software solutions.
>>>>
>>>>
>>>>> would it be better to update the range check in common.c/common.h to
>>>>> accommodate both LPASS and QAIF DAI ID ranges instead?
>>>> No, that does not make sense because these numbering might conflicting
>>>> with other ports in future.
>>>>
>>>> --srini
>>> Srini, could you please confirm if adding QAIF DAIs to
>>> qcom,q6dsp-lpass-ports.h is acceptable given that it increases
>>> LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
>>> multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other
>> BTW, the dai ids are already added by Prasad
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h?h=next-20260827#n240
>>
>>
>> You should use them.
> Correction, he only added QAIF clk ids, not the dai ids, Not sure why
> dai ids are missing.
>
> That also raises question on how did Prasad test it without the QAIF dai
> ids.

Hi Srini,

Validation on Hawi/Shikra(DSP solutions) was done using the existing LPASS DAI IDs from qcom,q6dsp-lpass-ports.h,
since no dependency of introduce new QAIF-specific DAI IDs for testing.

@Harendra
As I understand it, the hardware interface mapping is almost similar between the DSP and CPU solutions,
May be the no.of interface count be different. Would reusing the existing DAI IDs therefore be sufficient for CPU solution as well?


Thanks,
Prasad

>
>
> --srini
>> to your question about increase in size, yes, this is know issue, i have
>> some changes to send which will remove the need of this static array
>> which should fix the concerns.
>>
>> But for now all the hardware dai ids for qualcomm SoCs should be in a
>> single place irrespective of dsp or non dsp solution.
>>
>>
>> --srini
>>> drivers eg below
>>> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6afe-dai.c#L30
>>> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c#L21
>>> -Harendra
