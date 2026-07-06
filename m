Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB44A3890F1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327944; cv=none; b=C1PPpPTcmSKRbeRcKrWIdszJ5QrtCI/+ncBFo4cCmeDI7cIgWOFO9jT3rs1c0nlAXYyRvXm6g0FsfSy5AYOFtKwk4bBrnZZXCeKzH5kPLti39mM3sIHT6W0T6jexOMx+ASE06C+pJNTCBSACaEztnRtGsIAHgJAUQhSal5l8bqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327944; c=relaxed/simple;
	bh=tYtKorlCjSEc+kIak32nX5p+8YIlegseq0j59+xyY80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXrxskGV3ziF61ZFSRBTtB6eRRdHZundOVKL5rnLGwcvpyi0+f+JKf7HnJa0IN/Cd04UjFC59vft7VsJprG9BQq5g3i072qi728IiXVKkAWS6Mx6U0VxmjSKAbo8vGMZ7Pz4ekvaFlZTUy8yHJ18yG2ht3qyssJj4dcvKVdOtB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tq3L3rjf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJ5bkz/8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tq3L3rjf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJ5bkz/8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641joA3617923
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjFNLgTs6Mexw45vQ9qrAv84qz6gDD4xFsiNHpVE9Sk=; b=Tq3L3rjf180cAZKe
	+Dc/jkaNBOrUwy8VZMIZEurYnuq5UBOIVbh5Km/mxnVwZU+waMqGzmoOEyBqQUjO
	5N7TJXoMBja8scaga0v/A48mwf6NTxB04hbPfz4BY64E9t46fvUSTTANMqucxO7k
	Ilk3pg/Q1lLRRPE7r8AAYFs1wacHrButgMdXUafOJGlwc1tG1nTNS7l2Qzczdt2u
	WSCm8uXPTZwVlhqZApLYAArTPrCiEPo0HYYapaftRwvMJBxPeJX9rT5bJUUlgYcv
	iGJxabWo+GcwskJeG9jnhP1/a+yZBx8kKOqu/gpYqkMUlWLpVQGYeYo5seCczCFY
	DJ+wRQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64ngmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:52:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso52897175ad.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327932; x=1783932732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjFNLgTs6Mexw45vQ9qrAv84qz6gDD4xFsiNHpVE9Sk=;
        b=bJ5bkz/8iBByo4/ethiCkfUED0paX4bn4Hd4syrQOaMBx5OdGLb4U/ozYdS9EHIurj
         pPzNa8iUcI5xbfrHQLPGNFxbKUsgiaMuK0RqsnDmYe0KZyJm05mn4sWcLYYl//9IzGwq
         bA2ylyWUEztzROsYUEzSqG9SPAQtR0RqDDmWX5JbF7qNHFZ80kmZYCM8gP9aJ4FhZOUn
         RlYYdfcZCWVAPqLzCOksJkIAwKwAJYlZnqF0iD4XbBSF7rCemVxgnOGZU+cd6OB6iWAB
         vh8dO2D7OJDyPOBh2IUfSXqCtnBXFB20yIbOZ/Z0eNKrazQq3bDu4eSFSHn59Z7g8KeQ
         gmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327932; x=1783932732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjFNLgTs6Mexw45vQ9qrAv84qz6gDD4xFsiNHpVE9Sk=;
        b=OOauylH89r5/oVDYt6JwlioDLRX98MFrKIDCm0vv50uqCLC1krzgY57E3Rdv1kspBE
         n4JRSBlDbeU9TuyCPDeDaDyendBuKcyl7rTHfFowiOr6BpZkhNFRmsFDoCgH3TgRwglD
         /PkuqNMvp0SBqF8TtYqnuVz56I98FSByqLGDa9I8lQNpL787hmLLofFC/9aPOHiTY35e
         9uRBjjBW+yA/ri2Ka3uNobRgakX9YYXUSjOSXWY7zLkc1vpOfK0CCmulERGh021Mhwfj
         aCtgtDJ0OXTsbtJdMPcdzZVOPDqVpqiNPqz3rOb7NsLJwN+hr4ctV2PY8Q68LufVW02w
         LxBA==
X-Forwarded-Encrypted: i=1; AHgh+RoI7i/altokh1K9IbDRgPkfh7HEcLf7cYor9tAxyro+aHAjgZhqBEljPCQD+byf2Z9J7fGqZUjZaKCk@vger.kernel.org
X-Gm-Message-State: AOJu0YzeyTrvM8qLCQZ3SzqlTiNibS7Z8xcnQc28tdxw0d7mIXb/OvWO
	3AM8KtOoiMhAp2yKtxaD1esgt/8aj9sL50c5nMql7YDaTD1Tnf3TaWYYeQsKJS7eZYlFHaqAii4
	q3cAy7jdbKznQHkXyIPt3c0+fqpSMCsb7g/zDi5EYQRfHeyTveoEsQEQPI07QGZ8Y
X-Gm-Gg: AfdE7ckhVvFRMmAOoq05QF406K+z7V2lWLDEXedqHd4HoIbUiEu5wdmF0h5ZGpeXPts
	1jC8oLEfIhPrTgfO1csWbjmzX9RVDQ2u/hb0iCodHr0rA9bliZoI6lutd+iogaDHFlRqJ1J/suE
	aQ/eBJP1x+zx09rodv4MRulcLutQt/1LcNXKXanWQPa+u2xT2Bp5mhogwc5+7COZSgmww3cpnJZ
	SVIXLEm535FA+TGtbQ3VbEqiR1vHc8vBmiIe7OcUbRoMNhoqcwUeMl857GbU8tvS3NoXgfyRp3m
	vrkcZ61fYEZ4J5KfJcD0pnCa8qHw2E8S9O9kSXVBOltk8m4Eu9Dv1aztZShHKxfIKEU2SF8EFVz
	3aYMR883kczf1sDgXPFuNt5BwEJaI7VHSK6edpQjR
X-Received: by 2002:a17:903:3845:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2ccaa36ce09mr20820755ad.14.1783327931904;
        Mon, 06 Jul 2026 01:52:11 -0700 (PDT)
X-Received: by 2002:a17:903:3845:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2ccaa36ce09mr20820495ad.14.1783327931503;
        Mon, 06 Jul 2026 01:52:11 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260acsm46383945ad.6.2026.07.06.01.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:52:10 -0700 (PDT)
Message-ID: <52b7ee6e-bd99-4555-8a49-6cdde1331714@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:22:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <7815e3ac-30c7-4564-9a7a-6a1ecb9278c8@kernel.org>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <7815e3ac-30c7-4564-9a7a-6a1ecb9278c8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX0mwln2AYAtP4
 +g9yGoP9EzI8FFIr6tmUiaU/wGWkLlm8ycw6xDNaCfWoFdMu4uCPPjlNLrIOthPaRKFSUWCuDLE
 ij7j4G8CDei9AiZmTF8kJ7hoeA2zETpQH3NZUIRUzT4WMEaWtRi+QeOczLRszgGMDy8Drcv6k4/
 y8h+xTTOBfbVCkZpxCDd1amO6mrpZZilhieuqO3wCOJrgXRA5JgxTm3FZp6Ph74ZkhY69w4qaAF
 k6yOxA5ewcKCejYcc1Lx6bGpqWCxLPc3D5sOOVMX2Q0rZZ5IirYZ3VifRs6aZPnNh41PI+vsJ7j
 W+/CjbJ3fhBvyTfFKAon9YrDdFeCv4IKGrfKLoY4KPfJoDCLRQx9JYNr+21sh7ubDkDGDXLFN+R
 I00h11e3ECMkPU24xQwFzZKFS0NlPv1sGab2gxrfW73z3+obZmyzEfGWaEKey3hAXFoTougPW4q
 OJjdxkJbsQgiiS6bbTA==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b6cbc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=DWWUBYW1OiKU4YM7QbkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: fI36bMEU9WSj-K8ZbIbH9jsjENsvhkp_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfXwAhHtTNjgxXc
 B19DjSTwNjKEbhI6/ms3vI4kAKQu5d9eWEoNM61+z1CaQGr4bySUctIaM8r/JaL6Mk5BI1/PuxX
 oA6cRbFE+P0NWY2xDSc2YQKH0Wd7JhQ=
X-Proofpoint-GUID: fI36bMEU9WSj-K8ZbIbH9jsjENsvhkp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060088

Hi Krzyszto,

On 7/6/2026 12:03 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 08:04, Nabige Aala wrote:
>> +	lcd_bias: regulator-lcd-bias {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "lcd_bias";
>> +		vin-supply = <&vph_pwr>;
>> +		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-0 = <&lcd_bias_en>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>> +	vph_pwr: vph-pwr-regulator {
> Why so inconsistent names?
>
> Anyway, drop the node, not used and not controllable.

As per the schematics of LCD display Bias driver , vph_pwr is used as 
vin for that.

So I created vph_pwr , if you want , I can drop that in next patchset.

Thanks,

Arpit

>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vph_pwr";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>
>
> Best regards,
> Krzysztof
