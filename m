Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C871C3074B1
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781519701; cv=none; b=IcxqyMaxzObZvuJH4VP8DFTz3RsjVgP/ftsaJ0GYLV2HUTpPYJhrK6nJU0gl5/tmmR2VM6v4aaITCeTdmPEsZ3wCb3EJjVGo1mvajS4FoAZbSgK1aqy6y2m5MjeKaohtznybYmeCvV2YjneK6gd5RRlDPd1KGVeBSomQkrbPP3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781519701; c=relaxed/simple;
	bh=ypBctaFL7zGGiToTo8r9a8VYheJSEu0MfATFvA99hvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gn7GXvk/lyN5QTF4WoVwg37HOxa/OD0oObfYIZraxc6x13cyF8hiqxR3jQZ4NGsSJ/RSnx0+jf1wjSf5WxYWyEOH4vD0RqCANvbukwlxGuF7BHKShI5VzBt7Q6IsikfDNMz+l4LMVAL4lXxRaw1V7TtPvN545AzueY45YDYg8Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3TC/Ii7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcisMqyn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3TC/Ii7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcisMqyn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAIZje2410245
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hVyefM75Zw370S/eMkrghTpPTfewflO0/F6QE0G56A0=; b=n3TC/Ii7lkQow8q3
	/MnBEYSCoIk5ZB8W7nj47y9dD2AqiGDhaoGGnYMzvGAgDAclQAc8Ks6B1TqIxoXQ
	4WbYSH9gqlVST0nsnPVWsQ29Kdpw0Hm9ZBsmJ1UDqUN/kSQW6hyaMoY9lZzTs5fZ
	dz3+2uiyQd4iPoQR6Lm/5ahnl274jejy5LdduoJv2RgfwHQzrFG8+d6DzAXmbAkV
	pyp52ZCO0w1WsYk9Sboh3lF3Dl12xNNKahwYOcnmaDkCeih5NVzfnP6wbF+ftTca
	UysG6XKo+rVLcl6YludvRrDi1BxP9jTTWXJ3J2iqsBEzT7L6o81gblS3HJ9KodSB
	D6q9ZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete980e7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:35:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9181f3cc5ecso352443985a.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781519699; x=1782124499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hVyefM75Zw370S/eMkrghTpPTfewflO0/F6QE0G56A0=;
        b=hcisMqynZRxwMHGUXMEjWxdlXr5d0I/hWK92VUipHqexp4gbZ5TfZQYVTwrBWKTwPV
         RVf9EB7lQ/eNjYFfNUdSQHr/S7pplLRElb8wYusamonAQvSwNdvy0pCVCDEVZ+E70HFz
         y+Q+aUQ1+GmQLhOWQmI1f0qE+jWHguwLSCe1NqBxHrgKr+k6ZLVlmcrOz/1DTO3HCqWR
         7i92S57ukNWrCwLP1YUc7Y4UhMLxpLDRBHGHqty64TXX9FR8ZZuLhGKGEsGBDEy2aC7M
         zM4sj1sqTrwSNnkvNsBg11bFtNmb1iKc1rpE5t6pX6QZ0oru9XSYOlIyShJUcHEkkxJt
         eDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781519699; x=1782124499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVyefM75Zw370S/eMkrghTpPTfewflO0/F6QE0G56A0=;
        b=Y+r9Nd8qj88NzazJCHoTZByNv3NAj/tR9X38hT0GLnBAYzkCRp/RPPSE9/Dz+Y+7Ip
         WKw05P3Mv80x4S/0fMA9xF9yceuJYEAnnggQKTuZmkhcbyPw4l22NPkDzPjBwIHM9B8h
         +hv8vcUlQAtq+/WK8Mkg/Eon1eiSTaPJGLWqlcoeXjf3lo0xUl44f/2tRrvESFylK5B/
         IVX2am/+b1ltQa11ZYqMyytrq5EP02miI6EvN/SpwoZCyBS4AMcWp3gM7kU5IySzhZTI
         4w5TvqF4sXBLJkmbkx1RzzRDE2MasIjZOY7fIqQrrA/aaoMj1/fLCHSp6V0URBxXPXMd
         IYPA==
X-Forwarded-Encrypted: i=1; AFNElJ8s/M6hSv9MjtwsFmIc9Jn3NPm1rQLz8EoiTR8L4BralaFei5tvwsXCvr8xcEWbPO3btwiNrEV08Tqi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw045fPTdnC30vbx9CBGbS0QOoKB7M3sUATWtm//QiGd/O4o95s
	f/Dhx3mzolPyuhJM2iL5K44ShYokzjXFAKntXzG7gVfIkKRsN467vQLKpVnDwYcoG5iO5c/zP7z
	vaYJ7K4d96tixej3BsHgBypGlKBu35MMHUof40YOHHWaFuzdJMWZAdJ9cctYxnYCD
X-Gm-Gg: Acq92OHYOZ/1qMKHrlo9t/73qyz3OXm7s0tq8GaJMIOXcLUCLMtJxzrGxOcWH3JCY0u
	3Z1FIf60+4Y5pCjhxi0Xp33jd8b9EmZAqnaOq1r4ta3TIVGhQZydswpDx99AO7gLP0YjVfLLngJ
	0RbrR3ZYvB4fbqPyBS0N29lf6/f0TafNxcFH4gDc/7MegQFfDFnk+HGQ2IaWMD7LSDw1nLqS4er
	AXzTibq21JB6ygWqrTfo8+hH0TIMC+dmqlI0MQuLTe+wviWSR0qYXynIfh3eaan84AuLS40DHp6
	kGBqxnhzl/NaiU/fY6TWLbPicXGT1HsgpMI7DvYK6qnQz78ZAWdscf8uFgowHdZOx/IK9gSW9A0
	ponXAU3acdNHFaHJeEWCkW9Tazk9X9UWzfD3dDcp3EMyoF/FJfkFOdQ76TPpYNKt2biXGTaHU6F
	Po3OgWRsnX
X-Received: by 2002:a05:620a:2894:b0:914:bdfa:c782 with SMTP id af79cd13be357-91619f2bf0dmr1784334085a.29.1781519699030;
        Mon, 15 Jun 2026 03:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2894:b0:914:bdfa:c782 with SMTP id af79cd13be357-91619f2bf0dmr1784331785a.29.1781519698620;
        Mon, 15 Jun 2026 03:34:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:766f:2395:dbef:b08d? ([2a05:6e02:1041:c10:766f:2395:dbef:b08d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263923sm33671703f8f.2.2026.06.15.03.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:34:57 -0700 (PDT)
Message-ID: <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:34:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a2fd554 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=zPFEeeBhd_1xptEjU_4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 6GyrjN5dwr50UCvCMgjRp_tUJ23t9MRt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDExMCBTYWx0ZWRfX3i1mD6D4irhz
 5nYIdr1DKqa9r2UePJL1ta3nFHUkAY4lY1l0sCiNMY3CN26qpYzt8j+b99vPmdMT9/symNtlBZk
 EClnko8FNVu11pmazROpjjeTqIrEQw4=
X-Proofpoint-ORIG-GUID: 6GyrjN5dwr50UCvCMgjRp_tUJ23t9MRt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDExMCBTYWx0ZWRfX7vwvagAKUk5H
 ruAvGGcJ2bRT59uprTVwforMA042GRa4NQjl0X9giFOUQ0x9/y+NihWMPqZcrQSIJl3B7ccPyOV
 MNhvPnQj5kxF/pKclN9Z6Je3uLU8G3kyrYnvYnPYuIcfdlfniKvTALLNc1FRphdvbKHhdskJJNy
 L1/8OSRgiN2zFDA+AybbenPK6OGffAs/38Hzw7yy2ZOsF1y/TCFmD8iSQ+WrosjfQ3J0Jqx505g
 zfYefXeCg6l19XPQfjti7J07H/QSoTyfZTn1kN8MrhJkvmr/rMjevlQksSyibLqx0TQmU6tOZW+
 uatL7iRhyS9isXNr74eXJ6tOUcDKdRBJQuvNK09cs3NHF9ytHo7qUenb6txHzJ5hBsxbv18uxG/
 oCkX3Y5ulLwESfIft7wB6B10o7oQSRK0++TmPLA5jTTxLUmwx6rmftol5eZsH8rw5k4UkvpppUK
 JjoAQIy7NOY3DxW+L3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150110

On 6/13/26 13:05, Gaurav Kohli wrote:
> 
> 
> On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
>> On 12/06/2026 15:52, Gaurav Kohli wrote:
>>>
>>>
>>> On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
>>>> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>>>>> Why? And where is this generic property defined? You cannot just
>>>>>> sprinkle generic properties in random bindings.
>>>>>>
>>>>>
>>>>> Ack, will add why part.
>>>>> These names are matched with the thermal mitigation device identifiers
>>>>> populated by remote firmware over QMI and define mitigation devices 
>>>>> are
>>>>> exposed as cooling devices.
>>>>
>>>> No, -names correspond to values passed via DT, not some remote 
>>>> firmware.
>>>> The remote firmware should give you interface which is explicit and 
>>>> does
>>>> not need such properties.
>>>
>>> thanks Krzysztof for review, We need tmd-names because of following 
>>> reasons:
>>>
>>> Following Daniel's series [1], the thermal framework supports
>>> mapping multiple cooling devices per remoteproc/device via indexed
>>> cooling-cells.
>>>
>>> 1) The thermal framework's cooling-maps reference
>>> cooling devices by index (for #cooling-cells = <3>). Without tmd-names,
>>> there's no way to know which index corresponds to which TMD, as firmware
>>> may return tmd-names in any order.
>>>
>>> below are the changes post new thermal mapping changes:
>>> DT: tmd-names = "cdsp_sw", "xyz";
>>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
>>
>> names property are not to instruct drivers to register or not to
>> register something.
>>
>> I don't understand the problem and explanation in the binding is
>> basically non-existing.
>>
>> Remember that all lists and indices ARE FIXED, so driver knows exactly
>> which index means what.
>>
> 
> thanks for review, shall i use driver data, which is basically pas data 
> structure like below:
> 
> static const struct qcom_pas_data {
>      .crash_reason_smem = 601,
>      .firmware_name = "cdsp.mdt",
>      .tmd_names = (const char *[]){"xyz", NULL},
>      .num_tmds = 1,
> 
> Is something like above acceptable? and this will also help to filter 
> tmd names as well?


How the thermal framework will bind the thermal zone with the TMD ? 
(node pointer, id) ?

