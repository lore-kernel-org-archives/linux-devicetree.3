Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9AA3DE423
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389476; cv=none; b=ToL3YwBQ25A+zvfvumSJsk+aLFRAnXqJG0aGgCUEl9i+TV9R8nuIrQqg4kZJveaJypOb+TPfLQXK57Vk6oP7+QLpu7WLXBoTVZXwavYkbXNA0+4zTJYtai9VmUtZakEiOlHQ9UAR2/86EmybTxXLTVavHXrxZuVdUHafpEGrbIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389476; c=relaxed/simple;
	bh=tV3yc7DTn62GD7Zm1wS88cLz53thT0It9thfy3TmK0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3cne3roETsbrLaQqdVDy9ngD7z57P/L+D6VbH1Hu3w5fvppF6+SbfWnaCCGb+4xrayZLd0RjHt24oLtcdIFch8H4OWLFxnQ+v/1YinLagL7+gH5SYiKhEyQ+lt7l7I7dorVXu7xaxcubJSc71TzF5S8PpwB+VaP7MOx3ENfjDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtkG5Mfl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rkf80nFQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtkG5Mfl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rkf80nFQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jsjJ3077128
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2YllTtCfCoqMpmwdlY/pY89WhIfIh5ZfqB70kDmBSM=; b=QtkG5MflReWFGW4g
	MWP5NLSI0nnGmLp+PyixbSCxQsyQZ8FcSNONtvbRV3RPzbCajlyFHdWFBo1MMTFw
	Rw1ks4xFrGYI2mv7I+D1Qoo1oA+llaWGBodk18jcaAofVhd42Ogc4EkKisUbGyoU
	keo2Yn9m5HtfDF0+Kb50eGr7GpQSfEh84FN+q0OBM1fqmGi+wD/G+iw8xQG6ct76
	ZozlOT5hPoAayOuMrUv8iKioufSyiNrEMIFDxPNOYyLPy+60yPXTr6tzp0Bk4Nr0
	1UdeyjdI8d0Tklnpf3xmDH610UBdiIuZFf594XGmoqkIt2b9uNu3IaZG5NCHI8uZ
	R8AvAg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yyns294-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:11:14 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c6d4a825d5so105458137.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389474; x=1782994274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2YllTtCfCoqMpmwdlY/pY89WhIfIh5ZfqB70kDmBSM=;
        b=Rkf80nFQWxSGPLv3ZNKYjsVU1rUxbXviLAjMTUVB6WvnKzgKj9aPw2Q3OcuTwxiExl
         4R/uDLpeeRMH3Y/RQhZR17jhtJNYdScz1Te9fzAmmbdYJbl8qthKgPfbmUYTVTxnxI2m
         aSYjpu/XoHrWDrtv7OIvhhMIHwLJo7+s5E9mkgZ/Bn8Bmz2o4pb/tCqj6jX/hheCESTR
         wbHLhWG2hrO5hvy5Udro0rFn57GUlQLW0nei5gCPFhTWnGAYTknzSy2ccsYRKdEy8WiI
         aux0EoRo5uRKzzAk8AtMF9J7CP3jkrsUyYNhV8sDGxxxxIGyDY63BzlmUJEqVwxTTT08
         wkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389474; x=1782994274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2YllTtCfCoqMpmwdlY/pY89WhIfIh5ZfqB70kDmBSM=;
        b=osDuXs2ctE+qowxb7NRZQ+iWJksEjIXeYX5cSEdx4XqBJvch+/f0/2XjxZvxRSPivg
         ahMXo9ezDLV21oNLQjiW+uZjwSAEx7XEFPZcLlVO94kLYBuUt7rWqC/gSuI6b6ZrKKYV
         kQujK9droA6fbnV0FgxQ7/B3Qn2Jtgk2XUC5s2tm4PT/aJnr7s5cSvHrIjdkEYWsC6aZ
         A2DCm1XaPNxY7Pj7tL/akuxVRF0Dr5YOqPZoSFifpRCacPhYaUoXRstWaCanuqxcRBwJ
         8ZUBD3YFkumqHgJrVWESw75A+nPxAW929d0kDIdl4iVmeiYWm0VWbTalBWYp18pmv5w3
         MNOA==
X-Forwarded-Encrypted: i=1; AHgh+RrumapISLWQjhoKDKtenfNbl94VHUeMPs1C9fV30QUreULyErkaa8v18xYUGCz0RV5qpC4ih942naGw@vger.kernel.org
X-Gm-Message-State: AOJu0YwYIf1rOKKJ/DSyZR9rHai/TIbnPOzMPUZnCyvC7+hJJ8DcTUOi
	CPx0h4OokCR6u1rtjXzeG6Cl5YFjwy1g4kUktMDa43Ir40bwBZrlE39y9Nt42iKL4JqgwqZZaU+
	kHao16IoT0a5M0hz9G3RqJBPPWAvf5n+UR03uLrwIGjHfMijJz/JswW4I0k6bsnq0
X-Gm-Gg: AfdE7cm4e4SUt3aK7JMOoRal5C0hgerBADG87qEyzCnh2N6F0uf3erG2Kz+sulwtC8q
	tig4EIcswmVuQvyQjjw/J1TGv9pOJ7jnvtvDUOd1HTFOL3ZLou2ppzg9gsbN+A8bPbFUd4IVzJL
	/0wKsLfUazOrwB2BAvZdbLSdSSe8RTX0rXhnPhPSsZn/iojzohTMPHdYT+J6NaFdpKVkB18ipQe
	ceQdKd+6T7BGa3E9X1u6jBheMzT/AtYjtibyj5F5aPjvtblhu7jODK1BKcdkZVCOsOqylXC6e9M
	NkN9x5xUr5HWX/IxsQqQl2PD7XTEsB81Kj4dWuaq025Wh1uckZfnwuJYcc8obodH93SWQ/tITTJ
	KpEMiFGMyrGXrVQFefq6S3/Rah7VoasOgY08=
X-Received: by 2002:a05:6102:4194:b0:602:b87a:3524 with SMTP id ada2fe7eead31-73437102852mr238085137.8.1782389473960;
        Thu, 25 Jun 2026 05:11:13 -0700 (PDT)
X-Received: by 2002:a05:6102:4194:b0:602:b87a:3524 with SMTP id ada2fe7eead31-73437102852mr238070137.8.1782389473446;
        Thu, 25 Jun 2026 05:11:13 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa5desm174943466b.2.2026.06.25.05.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:11:12 -0700 (PDT)
Message-ID: <0f91b335-35b8-4b71-8601-0d2c4dc53950@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:11:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
 <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
 <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
 <7948feb4-9eca-48f2-944e-ec982b6823dd@oss.qualcomm.com>
 <CAC-tS8Af8GNQ1rq2PN6Yr-wG8_D55ddU9t77H4CUEvWfaP=Gkw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAC-tS8Af8GNQ1rq2PN6Yr-wG8_D55ddU9t77H4CUEvWfaP=Gkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX0Z/Zi1WCnEz/
 Tkxf9nu58hSdQ5eryKLTE0VZBDIQwn1Pn0hjc+h/Fn4p7aAzbjy+LxK7G/rYm1qnfGUQrUgfnxe
 zlo8eheb28i5jVZJWyWimA/SnVB4qfE4ZquwpoW5PyVkgy9/JBpkfDiWU2wOR5yJ8bdQ6t11Jbd
 kt7RHe8QLKo+c/muI4rUaC8giEMDSIkGf3jujUppFaNutSS9i6zhB0wvpMDXqVE/JcGiv/oatLm
 AOm9m9tCoxJq5i6QCVNn5k30aJObOzgFQH99OUpJ3rcAETx46894DRuZ8Yqd81eIvmbBSwGOz2T
 ZZ4aHPvldB6WHk+70aJhTdLbBW1kMBI8Kl4iLHl9MpFbmksILzAGs06uSQCi6NsDBKXqegyO5B/
 5KNRQV2AIBwd8j/QypfNOfa83JY59rdTgGgYlBfQuNllbDPE7kAVl/s2uATHwgOV4ESP0WeUhxd
 gylobTJ4Do5t79xBbSg==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3d1ae3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=x89O3XCtICJXY1Mg0nMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: JNk6I_O81hGBUTt-ed3-1GN52W2C-n2h
X-Proofpoint-GUID: JNk6I_O81hGBUTt-ed3-1GN52W2C-n2h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfXz6fblHeotkpE
 lYyXED2MASuzXnHo8Iaz4H04F0hkpfVpRqfB5rLtjxUBFGt81E9sVPKVEhagCZN5yQ7eYqxnJbt
 +wRRkEgfeY5OygUMtqVMeWhbJDmRX1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250104

On 6/24/26 8:59 AM, Harendra Gautam wrote:
> On Tue, Jun 23, 2026 at 9:18 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/23/26 2:26 PM, Harendra Gautam wrote:
>>> On Tue, Jun 9, 2026 at 3:27 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:

[...]

>>>>> +      qcom,qaif-aif-sync-mode:
>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +        description:
>>>>> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse)
>>>>> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
>>>>> +      qcom,qaif-aif-sync-src:
>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +        description:
>>>>> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
>>>>> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
>>>>
>>>> Should these be boolean flags then?
>>> It should not be, the intention is to define explicitly, for better
>>> readability I can rename these flags as EXTERNAL/INTERNAL, Please
>>> suggest.
>>
>> Are all 4 combinations of them being present/absent valid on shikra?
>>
>> Konrad
> Sorry if I did not put details properly, I will be correcting in the
> next patch. sync-src can be external clock or internal clock, where 0
> means external and 1 means internal.

What I meant to ask is whether all combinations of qcom,qaif-aif-sync-mode
and qcom,qaif-aif-sync-src being present/absent (set to 0/1) are actually
valid and should be supported

Konrad
