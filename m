Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D3E27057D
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048490; cv=none; b=cBf+Uj12FDK95SfuX342MwI2tNbYzxDanEDEYc1tl8dBtK2ojXTLJzruKludiFWuk+8WjpcBZZw86Xx8QUowOS73N7HItAXIWUmipOHS37bG3o5ekv2yZVHRYB64TJypuqITE2+MyStfxHzlWBmqfBLNs2ldVDC/tiVq6Q+cXCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048490; c=relaxed/simple;
	bh=uko67U/o+/uE1QxwkAOnARE2HDN0VUWZgA6HGN5aKVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qg2t6b8vLC0vm3SfH5n1Cl0m7c+Q4fCRnoVbFswTaXZViEWGNoYLBJwN+K6KBaVXmqepCnWkcGR6n1kJrHiCLo+SSJrh8g41eRndytiQ/rMw0ecdvmJntHGn6TYddQs+6RPixB2sMxL5gOaQ8s7TsIsAHsaEToBrpjjBhBvfXpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTD9IyRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmdoeNGx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTD9IyRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmdoeNGx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6pBd92121583
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=; b=CTD9IyRazc3AEoBL
	FWTpki+wdfWOWtwGXQbVlwKeTCzDT1PUHWMwd//DAIBTtTeoJm5c28k6RR6cpLBa
	a+xDsTUtEiZ1o8S8nhzp/vQXfOsKBubqQvgkEgDatB/TtRTAemnRUGPgetouy9en
	ttgJFvPR0Zn2j3tbogHMTOhQGDIA8HB8vn0fhqYHKUI4BFakGuRTYRpdaQfSwqR7
	CQ+99kXf5cTyn1Uk9tqSEbfdLSmVz0r/CNsfX0iRY9FHCVEpLWA6UvxdUzswWgfQ
	EPQKlU+uX7rEz+r6UG1CGF4tqb9Ju8yHGwSz5N3F16zalFwOi2l9btbBWohWN8T2
	Xdf1TQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1d3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:14:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso7503783eec.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 00:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048469; x=1792653269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=;
        b=bmdoeNGxNRtbjnHwhfgd83lQMCcmZv+J36UPT0BXN/LaSPodBgGjXPWjDkcnt3IamE
         ggv5Yeg+Vp9Ugd15QdS+Y7vSZMAyYTHpX3tdUz+4X45ovPX6KIuVut7kufSDjDOjqF+d
         FqprNTZFMvuKpyxgiN5gRncGWY3dbH2dcE33CMVhgNDFwLo13r1A2/e9UMHNhyEpNexc
         dR9sp91xNh7dEttB+konaE+St4gybOpWZyl7nRiDdJ+uUQFCsZ6ReEA2ZbAKpiAZFI3c
         aGs1BDEqc9PQdBN1KIcNpcOmDatwTJUaP19phUNJg/ySPJgEREl0fLW0SfN2Hnq7ktzo
         srkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048469; x=1792653269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=;
        b=H0s9HOgE0bav+q4s4gFUce/7HS8yru986urRu8B4EJX++2dUKRA3nQY2Mf3BG3Z6sH
         4/qw6rHj9kGCNPs8CiS9HNA+Rfr89k03pfnXZu3gf3rX22HU/DaaI+86E/3QcxYeBDn/
         Y0x+NHfFJ0wNLqckAd40nqrYk/POalJpEgz8JNNa97QygQtLcVU22/yjxVu928qmf6Bn
         66xRLTx5YEZjpiu8qKuLeFIw9zK2BMCR6wXTxHcLC+nAIERoVWzYM3cwi07C99zEt0Xf
         iyP4ddPCNfGKUKky8PmoDFo4NoNutVe1w6iLj8whD8WDkeUdJo9OgGb67Mnidrjwps0L
         p7Lg==
X-Forwarded-Encrypted: i=1; AKwUvBxnG5qk8orzLAhpYa+zBbY+ZSfcVdUq5b9eVdByd2gp1V+x0gv+V/Ce229OkBxrtT6YkhGUKqC61tuG@vger.kernel.org
X-Gm-Message-State: AFq9FYJGm/BEyLwN5dql2wRXMPzBJk2v153qDPIy/judfi3zIdWI48XA
	AmYqKlwhB3vpXsyLeT6bVTgJ4p1PrEbNByVToqUtUveeD3beDlpiN6gqQJfDYnNIVoC2rY1YxPh
	sp0swbF508AV5mqxTJo72IJpj8THb92qNkKVHo5ndWBJsd1sDydkjPIDe3b/6VZRA
X-Gm-Gg: AYBFou25YnXRghrMViN2xV54lOSpxXmAgLiZZVTVhfRYx6QwgKbK+ltcYCV3tmEYEu0
	25DPFVuz3DJBO5T9xeINyWybQGTvcTwRrqrLZEsN6o0cMPhZ3UEBFV9OumeHrtzjdNVWdX1aWxm
	oHBJfyNtYwwhsCbJZHvCOELmqNbfsQX+SvqAln+QTpgBrMDyBiJponKyHABlmv/I7Ne7/jC6X9L
	ZICBFLqwjr6mNPZu0kJu9bfdJimKcUbUy5PZurDFCDS9/5DsG3NTpsXzUmFB6EbcokRC+ul1qki
	RcJUipg1MUTQvwA/N79SRlropGi7mtBbv3qRIb9i6vLgBBTVLuKtqAjc4dmBmf4SY7f2GJJyqel
	+nyjCsjTFvTYUo2Q4waaZGphgOTo=
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr16226421eec.22.1792048469376;
        Thu, 15 Oct 2026 00:14:29 -0700 (PDT)
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr16226373eec.22.1792048468803;
        Thu, 15 Oct 2026 00:14:28 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm14059954eec.25.2026.10.15.00.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:14:25 -0700 (PDT)
Message-ID: <0cb8005e-964c-43e2-8e9d-4e955cf2ff90@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:44:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
 <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX5pX+6pMXaHh3
 ccB4DpwkiCKRlSBYd7pnA4ApsJIwPuZslVOPl22e5YNeONKQ4EqSDw4K01WAIAGvszAjs5vt6Wq
 HcbCwWKoABPfu5mzobKJNQ21K3mMHTuDmCxnY26Lg2jXQRylX3ARPmb0OzGw4YNW9x7qNwNY0/h
 e8CiXJqJ0n7XpsMLT+Afe/i9VU2PWKBE9QwMiweXpJ/VAqEXaNr5awmX03UgIxYBy9HfJbdGhp4
 rIgNAXWU+Un3gbWsvi8U3nDJ81X4HpThhqheRbtRXfNe7eQ7RZg5NRFQpePiIrpVI0Is9d2fcfD
 7FFWOSsS/J8Kfw1/xg1CrqtgYRaKeQfx0HEYteezHLLiAyP1+fdUN1xpSWKN8E5wGVZcWQbojFm
 SVVSC0y3aao8zcr91UTjXK6UJ7EqghpRoBbw7M8a0+Dq+wcIxDL4YRTh4MpwmdXm90QeshQfAmg
 Vrow1AY1hqhPegcFBmw==
X-Proofpoint-GUID: quA8Z7NXOqfHOL3AcFfFImMiqxIhkVES
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX4DjKGBLNr2DE
 ow4Rge1Y41uqEbpt8V4QhhE6/5BpwJXvUy6vN9EBC62kIHwmNoHFL2ENaKaivcoeKq7pA2/OM0Z
 Wwgb4CyUlXVLWTuZumETUsNcjFKIGaI=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad07d56 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xfIMX-YVTLGOWNOYmacA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: quA8Z7NXOqfHOL3AcFfFImMiqxIhkVES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150028



On 6/9/2026 4:13 AM, Linus Walleij wrote:
> On Tue, Jun 2, 2026 at 5:22 PM Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> 
>> Add the gp_mn pin mux function to the TLMM pin controllers for the
>> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
>> divider clock output on a dedicated GPIO pin, allowing the clock signal
>> to be routed externally.
>>
>> - QCS8300: gpio32
>> - SA8775P: gpio35
>> - SC7280:  gpio60
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> This looks all right and no-one is saying anything about it, should
> I just apply this one patch to the pin control tree? It doesn't seem
> to have any dependencies.
> 
Linus Walleij, sorry for the late response. I will split the patches as
per comments from Konrad.

-- 
Thanks,
Taniya Das

