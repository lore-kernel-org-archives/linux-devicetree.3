Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ED030EF95
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784862873; cv=none; b=tiVn8t7n+QIf8gI/9nsCnyKOHvQwaS1IqF2lf5qym4hv00/bahDzl7jdZOwCPk/8hlpC7neGWE2gRFuSmsQez2sFPmM1/eDhT+RF5wE/e7YgyY1/0bk+lcG51LMQ7/HYEIeSDj/MQ3f/9b6U+pp9Sxdh8bobp9F+kveQ1Gr14bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784862873; c=relaxed/simple;
	bh=HF4d6zrltc7yW3OPQ6URMeKzQVhv3k9Ek1HfGgvlezI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xq8F5NJfusOSCJYrh/NMPfRy+seSSkfS6yNKw/8P1W1b7lAx9ESJtrhBdww5MB/fvnaTUNT6lj47p8JPkq24R8u9xAQpOfo5KzY3f9DduSYjzgymkF1WHzjSHMucRA4Fy2xYmX5MdPb2fRs1OS/Dnuj8BWprZ+YnKXYFACC41PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWwR7hDv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5wieL+z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWwR7hDv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5wieL+z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O2iHod1853401
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+cZu//uq3jqVyi8sU0PHp7XZPXvLOX48uYW36QdbxI=; b=fWwR7hDvXxJ52pUX
	L4Ea1zKpfZbMIMU8Cpqc069pSGdNYWvCI58vvsJ1m6CJTNZL7twJfsHMgRTkGO6s
	QpQ9U3AnF81j8PiU7zjgkA58g6tpLJWUOfgccSl1Q0go1IEk1cCozBehPvGcWEfE
	xy8VPehJr/TeVnJPgrBgTFggNEm9U/napz/ph7kdtxzQgZCDMgwJAqjzHUdNoSOQ
	j9g54uJyHRqDDE8I55fsaBhWyf/Byw6S+mQcumkKmeDB0Drb6mLx67T5OS05+fpl
	ajnG6gdRqL1lyD9nKKr3acRVPyNgFrgzXBKZYzPjgJQ//b/GoX+p+AGEvqnmlClN
	OZrKEg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamssm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:14:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso27355555ad.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784862870; x=1785467670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x+cZu//uq3jqVyi8sU0PHp7XZPXvLOX48uYW36QdbxI=;
        b=J5wieL+zGm++oDAq05c23lH6P0BWmbnkGUu3LNSWRRGZV5zxExpub/0gNi9i/X87Wz
         i1mPWls7DQH9jrqmRpvPHOS5LKKWsUIiX+tMfa/wgGpzNJe2An3ay/MIKmhwaVg8NBoZ
         BuhoOAECtoC9ydVdJFEdxiFKQFoODVGXJMTGEhpBivXCiOqAsWM+/XN7fYPnag3iiRa8
         SxYWDQqgdxhCVV08P5VypaD2dcuXbVrG3cl0P9rcAwjLBKgrZq1I/wg5A1UXVyHDTPe0
         sRJixmlcfmlC6piGgXLcZqlVITeFVWVk3ygaf5woRn5ANvzBp8VHpZSHWc/cecDvsiRM
         dYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784862870; x=1785467670;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+cZu//uq3jqVyi8sU0PHp7XZPXvLOX48uYW36QdbxI=;
        b=NpEsnHzEiay0DyY+BruKyNvycGiHbDmGXY+kdfInmeyvYrQ9l4bfnOxvdAACr0QKaz
         zdKevhQ/DSpJ17icR2I/I4vI8Qziw9Sm7bSJgMznArEIiRlXidBlqYSmdmRuC8k59QQe
         AGqSxN+5+sjTGff3iOWZ9xbQt5NuYmiW0nuJ35J8minFKP0hNGdsIjXYCFi2/kqaKtFL
         4eqoyiPfiKqub907TsB3JqnfJMMbLS35JSTrqmeQXtwzWGu467vAoii+9GOo0Lot9qh+
         O6DFU3U/mCNAW4UA+Eb8u/TmTn3GfagmnmTanQLreXZUleCCS6RfmuAreeyIFnuZYpfj
         npvA==
X-Forwarded-Encrypted: i=1; AHgh+RrXOzIEtsG8uc2XGwe0IACLuS18RI32fV/v2Vt5i/re31yEuZ2NBD6g6NXKwXQHbFml4BskIQ0clcn7@vger.kernel.org
X-Gm-Message-State: AOJu0YxqUCcanttvYszqB/2AshzcM4ENa/2AJttRq1wgq5Po/Y5FCzjX
	Xr94yv2fjp4YBO7q22NNkR1m9SMIjOcuwAu5jAcwmq+Lcz/YpMWiPdrqDVc9sbF8K+vkmrSDRwp
	09GdGir0xkZrhhc7qLDZygdrV7cxl62k2vWIB6KEocuIjBK7XyULdbQ1CNium96L3DNqS40C0
X-Gm-Gg: AR+sD11H5RPqFLfE+2YS5hE4CdESRwvVfWWBvZl4MUnlnFWd331sTZ1xXuQA5dY5p72
	t37K4AQIvKgMK30mqtlizUBh8Tcs/6anYwLErt484opwCGyVoMP1xSsxWmhuAxGcauEQZ2v3C11
	+AfJ73YCq+4B+XB9631XqxOtk48rTICxX8LAdeyKMXjViYfs1hLxuCtmGN65PTmhAp4YQfrQeb6
	NErb8VSsPgz4g2LnVGafXhQHkPZdaSVsiwO/85l0wxzg32sQflKPNm/Xg/3cRXBJQ/SROdRxjgP
	F/CdpmTLyPeAAtG79I0/sk42uDXHITdkURhr7JafoTnutkcFgV0yYoee9u3Dvj4DL+Rp6PYNyzh
	Oi4vkb6V97VsJPoWtzFw8yImphXV9jLsRn0YrX7lidoY0uiWuzNvPaROfZ2wPyhUVSfB6tGaD
X-Received: by 2002:a17:902:d490:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2cfa6bc41bemr74485645ad.21.1784862869881;
        Thu, 23 Jul 2026 20:14:29 -0700 (PDT)
X-Received: by 2002:a17:902:d490:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2cfa6bc41bemr74485355ad.21.1784862869451;
        Thu, 23 Jul 2026 20:14:29 -0700 (PDT)
Received: from [10.133.33.215] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f00a6f5sm43577125ad.37.2026.07.23.20.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 20:14:28 -0700 (PDT)
Message-ID: <0971c95d-d848-4688-b67a-87b8488fc9b8@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 11:14:23 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add x1e80100 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
 <20260722-devtool-v2-1-d7e609ef7388@oss.qualcomm.com>
 <20260723-impossible-invaluable-sturgeon-3b2ce1@quoll>
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
In-Reply-To: <20260723-impossible-invaluable-sturgeon-3b2ce1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAyNyBTYWx0ZWRfX8M3por2HZTIT
 nZTbmCJoGQGlrhBtyuhF8cNccAFOxpZYnPuA227/TMHFAzFD/9EnlAUBK03+5URzySbiedUEUoC
 OiHWCXPsr1i51i2n0svp6E2Z/jM/EKNRdQqoCMkFIoa/ocnPZCWn1GWddoZ15Dx05RDDQl98D7D
 5z4QdailbX75pR8i3J3PAeeXy4P1NC5J3CVOTtXAA7pIl6sgcLSHMVLoxwSySHmebuOoYaVoe2D
 ahCWlF14p24UHLxVuJEd+Z0RztbCSpnQPX2Jf89q/+7iN8LesAh7HVIcRCRF8F/ZyGiZ3nuLNzd
 kjCpPNc0HXDBFcruxLh5B4b8vD8cvgSla1DVSwmcNP1wslHvV75KW2cH+DmSdB8Z9n5zD4dBnff
 3OsrGJRhfEVRj+K+2yMpu+Fy3sXbZ4L/WzJhuowoXzZyBShCONbbfnU0mIqY/ytpdrX0G5E+TDx
 U3zmON2qBtkx1QMLtOA==
X-Proofpoint-GUID: dFhV8WyqadgMHB_oVQVNZLSI2KLhQgsG
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a62d896 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FcgZ0nHOkWYqsIbrD10A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAyNyBTYWx0ZWRfX+adY/Q40V9/6
 Rq1U7dnGviwUAWDU//OlW6B8Rl60DI925WRthwnHbJ3PcMpJhRhwLUQIPttwdXHyrTODE5X8rWG
 qdtfu2NevIkdt6D/Szd8SOysO2xpWLo=
X-Proofpoint-ORIG-GUID: dFhV8WyqadgMHB_oVQVNZLSI2KLhQgsG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240027


On 7/23/2026 4:15 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 22, 2026 at 05:26:28PM +0800, Wenjia Zhang wrote:
>> Document the compatible string for inline crypto engine found
>> on the Qualcomm X1E80100 SoC, used by the Hamoa IoT EVK board.
>>
>> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> This is incomplete, although maybe you based this on Kuldeep's work but
> nothing explains that here nor in the cover letter.
>
> Best regards,
> Krzysztof

I added the prerequisites and note information in the cover letter. Here 
is the linkage of the prerequisite [PATCH v4 1/6] dt-bindings: crypto: <https://lore.kernel.org/lkml/20260714-b4-shikra_crypto_changse-v4-1-06a4ea97c209@oss.qualcomm.com/>
qcom,inline-crypto-engine: Fix legacy/new SoC strictness split - Kuldeep 
Singh <https://lore.kernel.org/lkml/20260714-b4-shikra_crypto_changse-v4-1-06a4ea97c209@oss.qualcomm.com/>

Best regards,
Wenjia Zhang

