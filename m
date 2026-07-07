Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03243B6F1
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783446382; cv=none; b=Obd3xyEKp76NYBe73ygEpHejNTK8gUyWrv33weiUWjPRNZ3R/P7QBCnL7+jNQ+QzmTzUmYalajV7njXN0UoYH4nRaXSQpqfKUyoMybcuQ7KY38cLw+5DKxca2qKwg9N3ie1QJsI8eBy/P8i7ZWgpFvZYNJu5TCpgI762jYZVeJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783446382; c=relaxed/simple;
	bh=UJHy+4fNGIppWeJZqbXwBUa9YncdTApJbIpjCz18jrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXuiNb/kwVSVT/DYXuOgbl7FGE0Gx+R8Pvk5W9rcxNF2GbCor5PJ6wfqjP9kTestl4Y3dYezGncsx8lu09bcxVtJyU8n+6bLAFOWjGkdRl7PA79p3RX3/mq3c+9aUCQSzJrNc7F4XF9CKi5g9pm1hNx4mESQ7VBzmXcj8c996dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KshfqSeQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvzeKAkO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KshfqSeQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvzeKAkO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT8AT017943
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 17:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lj6ipWG8/ZCBp2SdIngrB7J1LRaa3Myn9bd+SxBiSmg=; b=KshfqSeQT5t06b4u
	tRJfl9ugoF/wayAl611H2E9RzC74isPR2tlslDgyDSJFI5uOtZ9logHHQtcWo7Ef
	g/cdv7DDMln63b06YUHcYaIqPWuD2A1lXln6PTjL4ixBjCGWFEqYtYY61cTw5VT3
	47A2RGTRcBQzEdiVA4d73mnTGQF1hyT0y9viSRj0PdKnt7i6f+ZMh+QwmPf/BG5Z
	uqYaJSDC1ooRbZ7bTVUUTJDYI0DUhWvkKrUheywJl7HLNKcH7+23IKUEOn2Ojdtx
	/yo7jdSEFHOtlu239e3o/1lGLLFK2x1d1Ra1vMOInIHU8E+eCAZhvDUuuKmpS2lH
	Y74JsA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep2h17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:46:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso4089573a12.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783446379; x=1784051179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lj6ipWG8/ZCBp2SdIngrB7J1LRaa3Myn9bd+SxBiSmg=;
        b=GvzeKAkO1+QqGyCfwsJiDtOBjc9CSFbqBlXOo7G1Sq4Obg2dFC13SO4Zzu6rD+gwKI
         khWaApus0SsBYv8nyqwe1ltmSeJQ440j2xwEY6PXTScYRdI6qV22nr/VbhN490dSP0nB
         f4awLOdAUsz+FRiXlWdA+UpnSOYgtbvKvoCisaCcwP0zlyJPTiWgUlZOr16Mxo8ExWv+
         3Q4TE8/CwwP2LNHIbs/8A25SUHiXC2VzwRg5XWdY3wA00PCe1liSrmxlOMWWRd7WwpVV
         +cB8eqi000re5rJrJXSahDAfP/u/nbezidOwcVTUnYHcoGA+nV+xNIVXoOxbC6OnbC1K
         t+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783446379; x=1784051179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj6ipWG8/ZCBp2SdIngrB7J1LRaa3Myn9bd+SxBiSmg=;
        b=nDavf79rhAKjLSoWd1bMDJQWX2JGkhbhZVe0mXZ8ta91lSGKn5c/S2XRXsfi4n5dyw
         m+DXYd8R/pCKYDbAXOzhKcC4N3osn8JgHyPkiBaA/NxGMtBJVeLFc+/OdMoe5GnUGFBF
         11/93qUDa69JnUHVhdEzoEcQNELOnVv/oAE1j4duaAfaIOp2ar8syQDAJhxLhvK/RPHS
         HoMs5dRPFOQWFSqv1aksh1lC5i7Wxs4dN+iK++e0uQS2Xm/R/1EuxcRufgvA0mtyTVl6
         +K75Zk5cAKk2oOiyV/6jrSOWrMoSNdw1uA0uFH6Q5BdDOsGnFchIF2F+cnlOsN0H8D1D
         BrwA==
X-Forwarded-Encrypted: i=1; AHgh+RpSRndkfaBD5x5toT2cotMWHTZ/7uR8WiyaNAq/66hIkTrOWkLZBTMeki7n6SCOli/hks2y9Ovq1lil@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2pVvImKjKEdF8STTMk6PcDH3aU04glc0WN+eApELkAv5m4G+6
	6m1RG6I21d0GWhTv8FQrTFolaGKgfOVO/kd48cGQjuPBEYMwL/tkjwUnb/8gGKJYF650MyAkkbq
	tUfGyq+nGutWrn/vYa3gKOPiX85lx8Z8Nnzo7AkhIKDWa+DLrX6gAkjFNtP3KYL9c
X-Gm-Gg: AfdE7cmSqE6o1ltB4cbshig+WBGtcHXfN4J5H/3VTVd/kYyH/lwUWKSLgFyVtQBiM+i
	7rO9UAR2pQijbFdEkV888Iy7fuNAc2kWX+MJvUBD2LDhNEZXjj/Ag80ASkIEpm0SyEvNq+USmsx
	XOeUBDoJPg/ILMV3LJVwL6EKdSen+e7SJLLCPzeLcHhe8FDv9zUINlQf5/oonwpd+Jp3kKEI0a/
	7EZex6A6QCXDC5FBi1vkwV9IhATKFDOunX586Jl6XQmzJNpPSEqAa4r8dbt5GyBaTvBZLw5OU9Y
	cGa5VikDiflvEfsEVIc3Emm+7lz8TnX/dpC9RruDID0UR8fMF/RgHwJppm7dnehis4y5L77r16B
	+eHZfkO0Rfey4OdM+8MG+GQXLcIAcJWDwbt362/LWAF0/Jg==
X-Received: by 2002:a05:6a20:a11d:b0:3bf:bde7:d671 with SMTP id adf61e73a8af0-3c08ece59e0mr6971993637.20.1783446379003;
        Tue, 07 Jul 2026 10:46:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11d:b0:3bf:bde7:d671 with SMTP id adf61e73a8af0-3c08ece59e0mr6971968637.20.1783446378509;
        Tue, 07 Jul 2026 10:46:18 -0700 (PDT)
Received: from [192.168.0.105] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm16062585c88.14.2026.07.07.10.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 10:46:18 -0700 (PDT)
Message-ID: <921ef440-ff39-4c0f-a258-f9fa95876226@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 23:16:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add WSA8855 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
 <20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com>
 <96e3edaa-3fac-4006-9941-5e620e61f3b4@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <96e3edaa-3fac-4006-9941-5e620e61f3b4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q1JfkmOjZJDQ6N9mkARtLu4fMCY8AIvJ
X-Proofpoint-ORIG-GUID: Q1JfkmOjZJDQ6N9mkARtLu4fMCY8AIvJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3NCBTYWx0ZWRfX89xbEOwzlFpb
 ZcvvTdDB8e7mKB/FcWyfJeHpzzxXM5CGRbNacHZ3/bLyPTPDCfSVlJZDo8xK12DQzmC3r24chrl
 nsj/ERVeF17+SnnXwcPR+/wDO7R0gHdtaz2876jp9eL+EbeMRhBB/xYLPH7luIAg0gHz+brQ8WR
 DtOKI5cu2RTzKfmOJoYw/T26joCfUfZwlciKdMFlwfgZoobpI5zkx6/gMR3xqRl3+SE43M4qQiv
 jFLc5lvH7QStQfNfIgq9Fjhs7h5+KJ2vTyCjYDzMAZirVNzm4cGFUnV7Zl+oUVX1/GnzEF5YFgi
 SnZn1/00MgTBlMRyEaFx6XU7YnwN5V6H4c6yfrTDCWpyEtBXS3O1Wrf/E87WNHVWTdsMQWa0cvY
 tM/BYA1QbEed8EAMCxz8sd+PB5KALuId4vta7BKHaaOhLW6UTfq+4vAZONxdWcXeiZuP8xx8uiO
 dkHqW5ysj53hyl4jLEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3NCBTYWx0ZWRfX9EpzSsCxxl2w
 iFC917X3XybDVNs3ogQl6ADXbkOK7GcjluGg9xpowxrF/7DDEcCCBRtnKGWudJhXB101KzCnZfk
 iZN7+MkFmfsZ1ojuWWZ94aHBikjkRuo=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d3b6b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=364ozoyseeM246Uf7v8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070174


On 7/7/2026 6:43 PM, Krzysztof Kozlowski wrote:
> On 01/07/2026 15:59, Prasad Kumpatla wrote:
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description:
>> +  WSA885X is a Qualcomm Aqstic stereo smart speaker amplifier. It uses a PCM
>> +  audio interface, an I2C control interface, and a Class-H amplifier path for
>> +  high efficiency, low output noise, and low idle power consumption.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,wsa8855
> This will need exception and I am in process of rewriting qcom-soc file.
> I can include this one there.
Sure.
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#sound-dai-cells':
>> +    const: 0
>> +
>> +  powerdown-gpios:
>> +    description: GPIO controlling the SD_N powerdown pin.
>> +    maxItems: 1
> So the pin will never be shared? Are you sure? This is discouraged and
> it looks like you upstream old code.

Right now, we have only one WSA8855 attached to Hawi and Shikra. A 
shared pin code would be a nice addition.

I’ll include it in the next version.

Thanks,
Prasad

>
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
> Best regards,
> Krzysztof
