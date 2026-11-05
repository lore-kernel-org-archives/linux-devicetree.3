Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862789;
	b=FigLUR8LJe7OY6YFFq6UeQJh05MWR38ppulGmOfX6LSJMWlvlkzhL3b43r8YJ7a/v5nI
	 s6qzbS0paf2LXH8Jm3ktbTUYxPKUT35VIcPNy0pXaMDD/QabV1C+I8BG4N+ohbMJDfRkZ
	 EvOT7eDaSbiui0lMeL75JtIcNwV37KwqratM4/r1NJcHAVFA/793ig9Patoxx5AoHYVqZ
	 cHHGqF8NCxcB+6tJmVYDrfp/DPhksj8sNChqUnECjoVck8FKtkKtYK/poJm67jChI6wfs
	 rbyy14CKitJggVIzDkS6Sd2/Hxnn+SlWVmC64Q+XyArOej8pn9vOWseS/q/BmsTOpIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862789;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oh4OF6Rm15x7PJHOSd9Yt3aa+nOQhRl3mvZGn8j4vPk=;
	b=kQEQzCn+7dTuNskdn234w7K8e+KKZdGfS/JJ5+neWTNIBz3Pg1M9AtCcfaRpvNSK9b3X
	 ZZYAnE3TBdazKppdD7tZra2+Wj2qz3O7H61FunXUaaP+oQCa6ygU3D35ohgoTNJBTRXOa
	 pVoz5qt7pumjuwkY3Vxfw39e/ipnKK3FauOAd1tWGDkcbl1RNQhQo79Er+XCzD+b8dn8U
	 tr2AfCA+1XV2XOA0jRBsSK1AiHwCWf6WS8Q33gXCJp+NqbbFAS3yIP3XDvey/V3bCe11J
	 W1W3nuVmUh+75aN01SUBPC3G9vJRdQYwfkdwsQSdL3mcAx/SFL/2d0RZzLVBxuSG7OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="j752hD/9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0h2pQEh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E5E606A339
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 07:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E5E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j752hD/9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0h2pQEh
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UAVa565192
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 07:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oh4OF6Rm15x7PJHOSd9Yt3aa+nOQhRl3mvZGn8j4vPk=; b=j752hD/9eggSZjZy
	wV7Yz7JMMOZlmGJjrNh0NjqO1iPWRzi9mNMGvL5WfRebTKNjqjmNjAnsKlKJP2w8
	92q9RWUk25YGpE7Wjrn5I2RU5SbcULyLEnwgtcOrhN82BcB2NG0h8mupervH8TPQ
	PVuIQt5rJIyLyWlkhmbf6/QPz9n4R9DcxsJg/MoDrh2mvbyjHn+86RnVFpEwGWXA
	TUtnHDzdp4rjMYnGf27lH8C5U0R5nXctVRj624kO2KLq7FJ2gk6ue9HDJIWcuNfq
	M60t8JL5Y8x1KQkOOoM0nBswU04UUTM1LU5X8unRFOq9lldvlLy9ihnScYXPIkz4
	af1ApQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq8ftf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:13:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so1474708a91.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 23:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793862786; x=1794467586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oh4OF6Rm15x7PJHOSd9Yt3aa+nOQhRl3mvZGn8j4vPk=;
        b=S0h2pQEh/BXj83KKrOcG5sDoq1bt96bHO5fceYWBHCEF5RJ4c3Hq1TMEDN2rKV3L0X
         +zgnZSc8taleyvv7z7+h2HK03mXXeLwjCsWH7rt7t13uiP1O4YqWQU6iXkB3xCnLyoLi
         nYPLwP3sJzgtdPl47/4VqXJxo8WN9b/WQhGM1udJrlEHMMOHJvWL+X19j8xVZlgvrgG0
         diAY4Go9i4ZEdEz5Qv3AQwXMQ8FHvWXv0GYsyzrHNa/67SC1PK5n4Jk/IAgzmcHf6yAZ
         krPoDH+QNwtPZP+ul0HCtAqnCtXAHFKqdwfoI+dP2TI3DCWBZU2JulrHzDvTcbDlkziQ
         KyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862786; x=1794467586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oh4OF6Rm15x7PJHOSd9Yt3aa+nOQhRl3mvZGn8j4vPk=;
        b=LYgJKfpA3eettLmiuOMMeFg/vK0A9sOGJ7NvPywPAgITUMBcfe3eThudrh8V6VScj6
         /vvdzipbdggTyv4qZas+SDM7DNSrPKSqK4ekfP6FcY9Sny6+FKJMXKPuehBr4vO4/I31
         GOmD+O5EHXVK+poUeLeUv/jLHcTHxl+Nn4BcymyckLvbXgNVugmlPhCfk203C2Uo3eu4
         MknriGwPrWKv5qqGEmlImTR+pjUQSBAjOvRmDv54KqOkVEdD5TicoEKsTmDoD/gXO3A6
         WVTPAD0K1DE8T2nBYy33aAEtiDnOoD9yQ++OyNJe6DLQftmGMWDLUeQzBy55HeN+pGEp
         S3FA==
X-Forwarded-Encrypted: i=1; AKwUvBzbiCnmF5csrXrh7W+krXcRAyMLa+khxcEzO3JqyYTk8uYyJzEuBLj9ZXHmlqyM84mWJIGVLBgLCzne@vger.kernel.org
X-Gm-Message-State: APuU4Z+NTwZ2CvSvRI40P3eYu78998zN/n/DHQ9YMS9wjlo1gQN9jcT7
	TK/d3Ejvoy9SqGnzOrFKujGg/q6TvFzevXdZfFz28la9S+rc8LgIoLMzR1Y7hqd/bQZpUGST9Yq
	4Ut7gAyx5bx7eA4SfCbFmGTJ0kZlLDYG7kZePuJQHbWxPfSo0/jnEoywOhwZiPii/
X-Gm-Gg: AYBFou38uulgGpo63beAg21PqRmnT6LB7xAECPsDZSPY+3F8LhAZJaMqG4DQOLb9OuV
	gsf8CzUBOEW2py6+/72Iy5K58/N9SDn8PQ5vxxw6O0zoBrwwyZG8uojgS8opod5pCUw7z3b0bi/
	VUCekoMrNAHROLJzdRHlh2+g6PszppTynZCVfzrLmqRl3ebyxjnHX8HhsaVoSZtWqCl7jbe7CBU
	cCD65KE7E2nZ1zz6uxADfXM8bRgwZQ5eEkaAL+971z0mJzkd+xMoPixT3rFFwHo8qJZuREUTjKT
	I/KR2rWKFB7sYkOeIFnFpRjg+Dh6UkvghZ51enB3kqHmUtygPzQbDFBEpgEwxf7SQAohFMfXrvL
	6Q1ZsbzUYn5pxjZiCRBL/2wIHi7qnVSvXMw7wg61fixi0uJNQGn0rYdnTCkoURkAno1iFgkpQuT
	HtDWI=
X-Received: by 2002:a17:90a:f307:b0:3ae:9944:3bf0 with SMTP id 98e67ed59e1d1-3ae99443c7bmr10398813a91.34.1793862785893;
        Wed, 04 Nov 2026 23:13:05 -0800 (PST)
X-Received: by 2002:a17:90a:f307:b0:3ae:9944:3bf0 with SMTP id 98e67ed59e1d1-3ae99443c7bmr10398787a91.34.1793862785350;
        Wed, 04 Nov 2026 23:13:05 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3160634sm2537144a91.6.2026.11.04.23.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:13:04 -0800 (PST)
Message-ID: <200a8fe0-d1e2-454c-a40c-8f8caf0e53f4@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 12:42:56 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
 <20261031-thermal_bin-v2-1-d76fd073ae98@oss.qualcomm.com>
 <20261104-chivalrous-terrier-of-honor-9b3d2f@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20261104-chivalrous-terrier-of-honor-9b3d2f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2IqrN6gQUl6nwVZVSjkKDWPTaQU-_MhE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyOCBTYWx0ZWRfX/pkixKuL8MGv
 aCDFvSp8pcloET6eQdTLrda8hywFnhm75J1LElk0Uu/cDTy/1ZN9KGjeqbK4fYtdvNdBuTiEJaU
 DqOnmdPgU0WwHa0+iZKfT3oBWbqTxFo=
X-Proofpoint-ORIG-GUID: 2IqrN6gQUl6nwVZVSjkKDWPTaQU-_MhE
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec2c82 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1l-ioMR2BQVrcz0cqCEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyOCBTYWx0ZWRfX8srGtuFwg2Dn
 ROU6JqUZNYFaH8C6ipz32doXphI6+bJHjVgp/iOVGZEbCZiiCm80rDtjafq0taWQsiusTfugKHS
 ZZ8arJhV4Iu9WFDSATytzkb5JINLQT7PY63V/DVymSidDRY64RwoVVZiWgvJhUKAVfjJX05fxQL
 HCxQw5L82Tv652UVSIMmI9Qc3XEA6vxHmOaKgPM140qrLW2EoruIY+83cZ2WhSVNWweJ3TORgB5
 cFgNT27nPGERa/vjnIPjQ2cSbZ/hTbTyyO/4Z8zfHOGm9GVqJqLzEe8sLYvhSvHNqwwrLghpkDA
 p8yb2Z8xNleX2JtVVhGUxfbCbF/cpduTKS58ZnHy+Kue1u/TVtZwR8f1DlLDEJUH21m2NUt2Y0k
 3NF9zyaASxbRYX6cdra102RdG+11zJ0TVyCYNYgknC2LVAKBGIk47nQPvyzGD3C/Q8PxE0F0ecx
 8wWHXSCPCTKTkDT19xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050028



On 11/4/2026 6:13 PM, Krzysztof Kozlowski wrote:
> On Sat, Oct 31, 2026 at 06:52:47PM +0530, Gaurav Kohli wrote:
>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>
>> Differences in SoC packaging can be used to provide multiple SoC SKUs at
>> different thermal and performance characteristics. The underlying SoC
>> remains the same except for how much heat the packaging can dissipate,
>> thereby influencing the critical trip point at which an SoC SKU needs to
>> be throttled. This SKU-specific data is typically burned into fuses
>> during manufacturing and can be read back at runtime.
>>
>> Add two optional trip-point properties to describe this:
>>
>>    - 'temperature-bin': an array of per-bin trip temperatures, used
>>      instead of 'temperature' when the trip depends on the hardware
>>      revision encoded in fuses.
>>
>>    - 'thermal-hw-bin': one or more bitmask groups describing the hardware
>>      revisions for which a trip point is valid, modeled on the
>>      'opp-supported-hw' property of the OPP framework.
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/thermal/thermal-zones.yaml | 57 +++++++++++++++++++++-
>>   1 file changed, 56 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> index 999ad40a20d5..62590dfc77bf 100644
>> --- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> @@ -152,6 +152,55 @@ patternProperties:
>>                   situation where the trip gets constantly triggered soon after
>>                   cooling action is removed.
>>   
>> +            temperature-bin:
>> +              $ref: /schemas/types.yaml#/definitions/int32-array
>> +              items:
>> +                minimum: -273000
>> +                maximum: 200000
>> +              description: |
>> +                An array of integers expressing trip temperatures in
>> +                millicelsius, one entry per hardware bin sub-group defined
>> +                in the thermal-hw-bin property.  Each value is the trip
>> +                temperature for the corresponding hardware bin.
>> +
>> +                Use this property instead of 'temperature' when the trip
>> +                temperature depends on the SoC hardware revision as encoded
>> +                in fuse values.  The platform driver reads the fuse and
>> +                registers the hardware-version bitfields with the thermal
>> +                zone; the framework then selects the matching entry.
>> +
>> +                Exactly one of 'temperature' or 'temperature-bin' must be
>> +                present in each trip node.
>> +
>> +            thermal-hw-bin:
>> +              $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +              description: |
>> +                Optional bitmask(s) describing the hardware revisions for
>> +                which this trip point is valid.
>> +
>> +                Uses the same format and semantics as the opp-supported-hw
>> +                property in the OPP framework.  The platform provides N
>> +                32-bit values describing the hardware it is running on.
> 
> ', in a format specific to the thermal sensor provided in
> "thermal-sensors" property.'
> 

Thanks Krzysztof for the review.

I will add minItems/maxItems for thermal-hw-bin and update the 
description to avoid tying it to the thermal-sensors provider.

> This basically ties it to the thermal sensor which will disallow growing
> the thermal-sensors to more than one phandle. The plural in
> "thermal-sensors" name is confusing...
> 
>> +                Each trip node may provide one or more groups of N 32-bit
>> +                mask values.
>> +
>> +                The total number of 32-bit cells must be a multiple of N.
>> +                Each contiguous group of N cells forms a sub-group.  A
>> +                sub-group matches if, for all i in [0 .. N-1], the bitwise
>> +                AND of the i-th mask and the i-th platform hardware value
>> +                is non-zero.  The trip point is enabled if any sub-group
>> +                matches.  If multiple sub-groups match, the first matching
>> +                sub-group selects the corresponding temperature-bin entry.
>> +
>> +                When used together with 'temperature-bin', the number of
>> +                sub-groups must equal the number of entries in
>> +                'temperature-bin'.
>> +
>> +                If absent, the trip point is valid for all hardware.
> 
> minItems: 1
> maxItems: 32
> 
> Best regards,
> Krzysztof

