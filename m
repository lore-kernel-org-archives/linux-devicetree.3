Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793937106E
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209697; cv=none; b=C4Avjo0fUOY0TshNDyV4omcc0+ZOxxfP8tzA3e9+yyiOvPRYWXcOWhZY5YNvo0u+07hHacr9zisGAKTnekFz/kUmYkr0mSKTXL8XtMGEqnrCRbdlENUhX/5b+POs5ZX0PrrNHJn6uuyd0iYTI3gBg2n70PIWC1DrzsLxISD+n0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209697; c=relaxed/simple;
	bh=h/l3OOAaPAcU357lUDWxx/hld8kSuU5DLqCXyjmPc0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFZ5e5wpIK+KVOcsfwjixE9MQZakuXwt3C9S0UWddhB+vlh3Fak1c4vPi1caCvMavdiuBNcAiMRgJ3AvfTlKit3ZXciR6p5fhKNwbE/dBF824JV4FMMxakwRh3mzpKHHpaRsJXneYAJupKg5ZqCMGlNuSlzlc+mfeTAP1n5Ieik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obgNGQwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFzUrq7a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obgNGQwX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFzUrq7a"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cWiu3338335
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	450XRmBYB9coVCv15NJUq1Jdx852zTHOAZqDbpHqzRo=; b=obgNGQwX/4KGfduk
	G7YSL/nqDnO+4C71caPRwXRIjqhPSMLd16oDTQhNyGFF4+eGtoibZMOVuzVZZAWY
	gUX070zC3AvaK4qHIAsqX/0FDzASldhd7WElwfABHgxETvNhHwv7mWcqOPkKCe9D
	593YdlRwAX0WAE15seXs9jumiXcx/yRzU4/oWtEA1ZKnG+pj4TyQ8mkTvN1AKJFc
	14txsSZPxBZ6kZjpvsgJkWuSwvN846wEchNsxIiuN4L/GqjL7MGkHUyyWV7rxmUh
	gEnBB81QRJMEzV4Ie5A/6lk9Z68eI26cKFACx+jx7vfDiLNf0GHFD0OqGKy5zPZS
	4Ku4jA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjhten-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:14:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6c431a04fso54184095ad.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209693; x=1782814493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=450XRmBYB9coVCv15NJUq1Jdx852zTHOAZqDbpHqzRo=;
        b=WFzUrq7a/bFNnKd3vAq3EFAXwopAWAvBNqkVVap8gI/PLnnfso8htRyAsRyQFhHh6A
         Sims8BfYANYU0FcZxw0mn4ESPvJ857HAKnS9mKnsJuH3SKi1tFZH+oU7A3pqOAy9yR1x
         oM+PjYkMZKEc47PZNLSxuxxF014etOhWOHUOWjxRQochGUGs5xutcf2zePs1BMAJK0fS
         +zdOwetoeDWuH9Rg9jByacaHMdhkOKV9kTsbuwpxvLdkT8TDdBmsisIa6iXMutXg/Ruy
         Y6zLD0rOc6YspVQUbE/2NqGAEI80z43Oe3ntXPq8/qwg2LoJ5NPymKLcerkWxB84Q6HI
         C+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209693; x=1782814493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=450XRmBYB9coVCv15NJUq1Jdx852zTHOAZqDbpHqzRo=;
        b=mVXLPsegxofTvJLXe6NSiBsLjsLugtSiCfBwfpW/POdsIdljbiGXQb9y5gXEHVHXJ2
         wVP9+LPyHHz7Z3nuMmLBzYXjBMFIRnTBuiqRy8C2QXTO2Z7gMRYLo/lK0X4TyD7C7WEf
         UJ60eXiK+UzVnCez2gfQDr19AH1WB+oiRc+6O0AEaMN0gFABoURYjcQmqFMSGQn2ZM0F
         5cTmyDDMNj1eJZNZz+q83V53KnylWFmn5UBm939rzUX+rnX7r+SAEkmjaa9IUxkshQRz
         leMKAlv8Oz1SKdu8AFpspPePcW96anpdxJuVyaqi4aAF0ZXcepk/3t8gLMfjPsTusPlf
         98IA==
X-Forwarded-Encrypted: i=1; AHgh+RruQfHGaKXdwmEzG5dGt10ah960BwpR1ws2/+IlknkW0Zo2tS+auRuE9WG+f1FbnmaKroPsNRTUr0A2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9qo98m3RlGtrmzFTO1os9CC/fffggMwNumi8Uw7V1rhMqOvaP
	Z90ZcaThVkYmrVGGPK3DgOAB3vBsUTxQ2RwY7qbmSBixJk/u7KjsC/YaqnP9fpSuqEtcFRozIT6
	DVo9HTxeA50JTimpVL88rB2bhauIFVzvShi6rGXqzqbIGkYJoY9ispU9oZRdAQdzp
X-Gm-Gg: AfdE7clAi6BOCTNbvocagURF/1hbWlXiNjuyJoXGEVLhJAAVd8Rb6al5g0T/QBnPpWO
	usGcE47BpSma/3PCry2BV2qQvIJZ9huIe2evs7DNHQ5aM+0OHdjTuT0YLFJ4eRRhPhCYu7q6tIB
	eNftxqn+8tvoiZC3Dczn7AqNHvGvw5gt07Hq6kgJdB1BtcI7CpqrsmOdeKYMgkjzEj+cp9Mx5DU
	h7HwBR2lhpT+C9thBhBUwqDZ/qvVd6ygv9ekFrdxfdR7ZM+6fyf3ABbAeJ172NNxycydxpwWwE/
	nyJRFF5APStYu9XnGBowKb9YEvVKK9Rvqm4vzRHG3vIWJJNsKUT2GCpuEwN8jDb+IpyxO6dconE
	t7x+/j8Q1snetrkWlfDH7M4R+ch5z5I5nmzYnspk=
X-Received: by 2002:a17:903:1a26:b0:2c0:f807:9bf3 with SMTP id d9443c01a7336-2c7423d65cemr145303415ad.10.1782209692790;
        Tue, 23 Jun 2026 03:14:52 -0700 (PDT)
X-Received: by 2002:a17:903:1a26:b0:2c0:f807:9bf3 with SMTP id d9443c01a7336-2c7423d65cemr145303055ad.10.1782209692306;
        Tue, 23 Jun 2026 03:14:52 -0700 (PDT)
Received: from [10.92.171.15] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe785sm99740775ad.66.2026.06.23.03.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:14:51 -0700 (PDT)
Message-ID: <4d0f96d7-3848-4442-a8e9-243a6c4a3495@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 15:44:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
 <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
 <487f0ed1-dfc2-4f7b-94ce-60045017a663@oss.qualcomm.com>
 <5ad33cf2-3168-44f2-89fe-a7fe1420f8f4@oss.qualcomm.com>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <5ad33cf2-3168-44f2-89fe-a7fe1420f8f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfXzKulb247q3+2
 +pBILJryfQUObw/guZJ/6CTsJrSls9zAXMB9zydwgFaNeOQUaGNxw40WTfv5N33N9AZBalKw3CI
 Q904wSyTF/7Dm/+fUVaJmoOfc1yzyEQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX/bXzO3//HgKp
 2En1JhrPcWSzxNdYa6VJ4PQbtv882lRfqOb+T2yuyDsebw3Q/JKMuT/fJp1TDry8RKXWrlw1zU9
 RbMleQi3pbmRElFbelhyKmmui0OADaZPYdOT5LnyigmrWdzr2JHh8Q/XbUcm5xB+HS0DFgMXeuh
 Bw/qdm6rgShICciHdzqwBmZuiabB2rz+hc9w+DnO8w9E3qV604nLw1dZzNdz682WGsWziB8G8tY
 ZFjf+gBKPPn55CzuJM24akwdi6u8iiu6FrpgeIp56K/pyE/Ry/egNahzm0tgFFREv1Wwi+UaqD2
 LyWoe3SWzU85asvTGc0c1C8BQ74z8nOyN5PG539pjT6s84cMt/YLT/y3Lie6V1srERPcaZuQpzv
 +qk9znBmhzwySssgIBRtBz14uRug5g==
X-Proofpoint-GUID: 3HVypUBbvBgHFfFFoJJWOl-Xect5EFj-
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a5c9d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oS_SqjwSy1YzO6rVN58A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3HVypUBbvBgHFfFFoJJWOl-Xect5EFj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230083



On 6/19/2026 5:44 PM, Konrad Dybcio wrote:
> On 6/19/26 8:45 AM, Sachin Gupta wrote:
>>
>>
>> On 6/16/2026 3:40 PM, Konrad Dybcio wrote:
>>> On 6/1/26 1:01 PM, Sachin Gupta wrote:
>>>> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>>
>>>> Add driver for the Qualcomm MBG thermal monitoring device. It monitors
>>>> the die temperature, and when there is a level 1 upper threshold
>>>> violation, it receives an interrupt over spmi. The driver reads
>>>> the fault status register and notifies thermal accordingly.
>>>>
>>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>>> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +    /*
>>>> +     * Configure the last_temp one degree higher, to ensure the
>>>> +     * violated temp is returned to thermal framework when it reads
>>>> +     * temperature for the first time after the violation happens.
>>>> +     * This is needed to account for the inaccuracy in the conversion
>>>> +     * formula used which leads to the thermal framework setting back
>>>> +     * the same thresholds in case the temperature it reads does not
>>>> +     * show violation.
>>>> +     */
>>>> +    chip->last_temp = temp + MBG_TEMP_CONSTANT;
>>>
>>> Will this work fine if the user tries to set the max temp supported
>>> by the hardware (i.e. is there headroom for max+1)?
>>>
>>
>> In the current implementation, temp == MBG_MAX_SUPPORTED_TEMP is not accepted (temp < MBG_MAX_SUPPORTED_TEMP), so the last_temp = temp + MBG_TEMP_CONSTANT path is never taken at absolute max. For accepted trips (strictly below max), there is headroom for the +1C adjustment.
> 
> You check for `temp < MBG_MAX_SUPPORTED_TEMP` and there's:
> 
> #define MBG_MAX_SUPPORTED_TEMP 160000,
> 
> so passing temp=159999 is "valid" and after the addition it becomes 160999,
> which in my understanding is outside the range
> 
> Konrad

chip->last_temp is only a software cache used in one place, 
mbg_tm_get_temp(), to return a synthetic “trip violated” reading once 
after the IRQ. It is not programmed into any hardware register. So temp 
+ MBG_TEMP_CONSTANT exceeding MBG_MAX_SUPPORTED_TEMP does not cause a 
hardware out-of-range condition.

Do you see this as an issue?

Thanks,
Sachin
