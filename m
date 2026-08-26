Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1539438D407
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737395; cv=none; b=Cgx8gfqJMXVyofnM5Ev4ou9MN0N7YDLdX+ZoETaYguQyFWp6a+JE5WMBN5WqGpHHweFf+zKNEkxsBcG7ev/nohYeM0uyxqYe1EoV3SxMYv6ZYo9FUicrtfyYLGOFVL34JRg/eAbHLzgP/yYZyaV2NuBAbB4EeWX9+FF5eL2q3p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737395; c=relaxed/simple;
	bh=RxPP/KygzieReiaUUbnP9JD84gbVNpUwLXjmMEnNHeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUvex07JHLVQH1qmOmOQcuFM2DpcU7L7hJ4NoXksmgBTmx2EwZvmxQtrrGkYzko0A7VI42iCFhfjIqxdOvxvycBW46XX9bs+wb3pX5XJRRXYF3qvw5g9a+MEvyETwZPf6XjJG07zkKmQ9gFbW+ra/nFbVo28PH+T4fjTHK5xAiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJ/EGBr7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcqwxDyM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJ/EGBr7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcqwxDyM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CZ3u1062588
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjQhBuqskdUFBO0f/zqMao6iOGEdlMCcGr7zbekgvn8=; b=NJ/EGBr7DDQg845a
	CkrvXcF/DlBqRz98cy6yANqOMNls+bJEpTXMYzm6U2S9daX9RlCZ6xypsYYpr13X
	BUPHhF7kv4HrbpFUmE9uI9r8nL+O9AwPZPLhgkL0QKkxgOIG9NIyklMFJl2IOrCU
	+p7iIthftlV9YiPoiZHMn7G7x10Up59gAi32++3Z5ztDzcR8uP0irkUYs/slf3H5
	tZedVoK+bZ8qTSmVOn5SQdd70aSDGxAsh5OEGFFnVTwqSN/g+hgqX5VbfFREP2uX
	AmMxmPhC5OjE2ksJofMPzDiDNLd5T6SAjRHGkaMoxDVhDchjPKej15X9ja853hAR
	w8AksA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxk8t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:43:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283df62d68so8777951cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787737392; x=1788342192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjQhBuqskdUFBO0f/zqMao6iOGEdlMCcGr7zbekgvn8=;
        b=ZcqwxDyM0yW/9wbI6pPCBWFu2Aci/PHYMmh6VX1E+lQ/FPfCdc1lr6hAkvkXH7Ursz
         rafGyOC/BfwIGcyXOnjTUHIomG2oKPogmWJIGIHXafmFuDrO0v0zFKXNGt0l5iFA1Wei
         l2O6ZCPxBaJSoCWWgUMVbNYugOMeeYN9jyeGTTOuuNC2UKoZf6KIEXVcMgvq7DKPJoiH
         /QQwI7RAMqVqNyRFp8xGQJ5hH0YiL4jtOVLbzLf5QlmIfAf3Fq1Qz5kxflKjY5j+jChI
         f9kXmR1OitXKs1q/CW/upZHfXvn4gd0gj63YXD+YnSfcFr2GBkHPfasLzXZhJon78rtF
         DUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737392; x=1788342192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjQhBuqskdUFBO0f/zqMao6iOGEdlMCcGr7zbekgvn8=;
        b=muugqfewVpyViys45UD3srm85nxizdey2W/Qul9zR0HJlH2ZWfcNb+QamZgFGz1bYl
         8EYim/Sj3N5FxoDA7cnp7xxWsu6gWSk2T1kj7sFuB7sjAs0ScwOv7KcnuF2Yi5qtk6GR
         BkN7212w4uplUapuqbHwxaPjHLLzpfbtVdluFdzG3W89lWL4v6R54ZCOO50tZMf/ekV2
         RGtTtGlp2rqBKfTQJ89ApzxOtwhOzc0dC10W7YnUznMnJCt42j3umMw00Z8tjegkil5t
         Mh8QiJ57gN852KFMjCm0E921CdlZX6lm6ODPKck/k/yvfDsyeqbmfO7h3hOJBSzGDSL4
         GAlw==
X-Forwarded-Encrypted: i=1; AHgh+RrhhZALUdfIeVlWGsiKG5U67+2eRnw+IRosAWN3y4qlqfWbdN8UlKEa/WWDi7zXPrjrfYLGO85tHnZy@vger.kernel.org
X-Gm-Message-State: AFuF++lPw+oqJy8WRps+a1xMB9EztTxJVZgwv0fTDo7MhI+HxFjzLJEN
	KkX4/rYGs++EcuBPgKxGVIZ6i/hngnYfJdYAWbpJ8rfMetj/vrhdJESgtABinJ79oVbc7kt/P0c
	ZQ+Od5w4iPm45XHm0AqxwRx8GUpmZQno8eEqaG16PEzZ1wdPoYQzpP5BOI+M82jzQ
X-Gm-Gg: AR+sD10CK3YScS18V9KauDOOlUtcpxVJta/B4NDO5qUrZE6A/v2d5ORVHNSVFQhr3PB
	jr/tOsUhPFydB7pKhO0l/By1O+4Z5yXMQTLQGH6UlwVN8Erzh3w2DOHaXm2cPhVVfqjo54CN9n1
	aXct6P/77929kNVAaLM04IqdcrDPakFaQtiDmVd2cu2mzvVMdNxkortfXgvyZGiAi7mI24kPgXh
	xeFX/tDLObefddU4Qi7BtZYy3Ki+9AVJjPkuF/29YEB02efA15ldX2h6W8/VL1sZPBvrZ1F4Ks4
	YfHJutuKr1BEhJUDwc+yOt+nURmL4XXv2bephBwZuFAVOciEhkWQJMs/hEeO930laxSz8/9SQ/j
	JK96fVE1xXVV/DBDSPL8AYYRqPgs=
X-Received: by 2002:a05:622a:244e:b0:528:3ae6:14b1 with SMTP id d75a77b69052e-52e423e3af9mr52733491cf.43.1787737392353;
        Wed, 26 Aug 2026 02:43:12 -0700 (PDT)
X-Received: by 2002:a05:622a:244e:b0:528:3ae6:14b1 with SMTP id d75a77b69052e-52e423e3af9mr52733071cf.43.1787737391945;
        Wed, 26 Aug 2026 02:43:11 -0700 (PDT)
Received: from [192.168.68.107] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e4f0c8f7sm1448336f8f.27.2026.08.26.02.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:43:11 -0700 (PDT)
Message-ID: <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:43:09 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
 <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8eb531 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CtHDKKOw7fTWfhNV2KYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: RvzWyXhtAEDn1uCG7T0jgsIwSvFbq8gY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MCBTYWx0ZWRfX+7rXDu6OMtOX
 wHrC3qlLxkRKfYcpJ8hYRq67TnUSy8d3kIXES++Yunf/nYeBJGdgGep0svbSQNgEd22pARBY5kr
 QR2XHXyK3k9RugKK+naUKjB+yCXX1vMquy5UuJDXh0W7pALN4nFnm57l3o02M+cJJVbvOuuC8q4
 HoyyVmj4eK6j/OeVn0IWT8BunGLWtSVnWNy8OGSNmyYoyeiEnU1dm5DWVaQjJTFTcM7nxPME++r
 lgvmFijIYgtTYqVocuRGcHCqLtI3m9se8pszrrGshB0FhildM8Vw65e96rp73Ph7d9H3EmQ78MM
 ay1h7LvIZ/p9oMLW/bu3uLVelL3vUsprvXxzY7xhq4kwDzFzw+VsKTkeMdcle5jhHPIIMYpHL4i
 niIAG8rWimD+d9L6ywNoS2Qyzvn1fiiS9zGtvx7WFDHF/TurrvIP4nxmecJdsWv22ilG8Qaffd4
 vqFGJ3xulKgZMmEAMxg==
X-Proofpoint-GUID: RvzWyXhtAEDn1uCG7T0jgsIwSvFbq8gY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MCBTYWx0ZWRfX/E1b/bQ4pQ/n
 y3WdeuudtqQKCwFatwIZ9MuCwA5fU3Ndgmp+PLuTI0IH84uw3ESaOcAarWPPmQ9N4WT3fcPE3wf
 HZBmDmtfDl2XnXBw1SOkjihKqe/Txk4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260080



On 8/26/26 10:39 AM, Harendra Gautam wrote:
>>> + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activity codec.
>>> + * WRDMA channels collect audio from the VA codec and write it to memory.
>>> + */
>>> +#define QAIF_CDC_DMA_VA_TX0  246
>>> +#define QAIF_CDC_DMA_VA_TX1  247
>>> +#define QAIF_CDC_DMA_VA_TX2  248
>>> +#define QAIF_CDC_DMA_VA_TX3  249
>>> +#define QAIF_CDC_DMA_VA_TX4  250
>>> +#define QAIF_CDC_DMA_VA_TX5  251
>>> +#define QAIF_CDC_DMA_VA_TX6  252
>>> +#define QAIF_CDC_DMA_VA_TX7  253
>>> +#define QAIF_CDC_DMA_VA_TX8  254
>>> +#define QAIF_CDC_DMA_VA_TX9  255
>>> +
>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
>> card registration to fail.
>>
>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
>> beyond the supported LPASS port range.
>>
>> Best Regards,
>> Rafi.
> Thanks for pointing this out. We can either add the range check for
> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
> qcom/common.h to validate the supported DAI IDs across Qualcomm
> platforms.

You should add these ids to
include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
conflicts with common code.

--srini
> -Harendra

