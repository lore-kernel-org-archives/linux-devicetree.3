Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48556472F97
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813610; cv=none; b=arNsNSVTqbGAXOwYbOOn3YtYa4+fSvBrOgQfg6J5RAgxBpCF9dOynLzxjBHW1bRyWRJ+wlDz763Fw9oG+3htKqcVwPiT3J5QYFQEtLkt89ZMWExBbkaM6xM0OWSeGnqeprWuZeZ7A5Hy7j+2fk0VvSwf9jHKyS/i32zUxWC/Tdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813610; c=relaxed/simple;
	bh=pWsZFrbNUS6eEaXbQAM66UZCQPvicce1zTVxzu/L6nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3RM0lc4DJ7y4DRQKPbNPy7SQ7OQPopieH36v89G8YLvjqPhbxcJ0gyaQqDp980bFMJ4ibSum8EYPBM96yOp93THOlubeEz3NjJnuhwd5j0IpEbqlP14Qs8BTPhij7uTUuMg+DY4vTI8H7A3Ez748JBDY2wmrT0J4DIFWEjoxYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5itg1F0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J11p23F9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5itg1F0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J11p23F9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvkGc4050184
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=; b=d5itg1F0Kk0mU1DI
	fimuZV/3TiUVVzE8yLSvIflcj1ApAf2/HjRwb7DE9KCmAND+kTWLsTmaE1tMl4Q2
	NZbjavDKoY3MQaNgufXBodHRUpggkEEVDXCTtYAoGY1+4MC+hSGfkiuFEf/438I5
	+J471LtDsPK/R+svfiWFa13EYwD3nFw+/P1iyCuIpBFgSptn9UBlyGeOFZFbMrK3
	BXikjjCnAB0eQDgE7eB8b6iAw/6DCAIlpavYu0qrj3AqwwvWk5xBdPnxIWlHXYDj
	qeFuxIKnk2wFpmY3bocGO7H0uFlVwSiQYr+voyuhZnPeJHTmLDXYSM14Z5hfn04i
	k6Jong==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28vmbnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:33:27 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7ebeeb51976so515465a34.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813606; x=1785418406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=;
        b=J11p23F9BfB6j79a6DacxHlNmDE8vSliGBWTa5RDSfADKHUNrzNHCNy6OW2NxzO8yv
         ZeutIuCtBFtbRb76nSyAeBzA4x2t5BXloH+X3hmxFqqdOgjUt9r6FlYLIbB3cw8pohQW
         RRrqCsBkotktbQbhCIVM4ocpsgNe49tUmDMe6grj9493yqu6osmv0AQEzpQ3TZvRU5FR
         +ol3BVaVUEZ86dRWJgl87JCJWeiNXnzoudrAEWZCqhaXyj3B2pDomx1Vh+xUTrTHXtsF
         j8WGEwB9NNv3TME5RC3iyCTJzHFMlf4wtAQLHjHW3BaQNZ3iqccWCRC0uiRU7xGXBLSV
         WUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813606; x=1785418406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=;
        b=BkVemHT5oF3w7FH9yBFgntbs7fiqri0FOqDuVnDPEoqG+up2ohuJ9aFJMAo3RLEabE
         y7OfPRdntNOyt0nrmctf9d4W1oP1tLu5NRQgyyDCRdM43c4x4OgwWTVWzXLqSimEr5m6
         pmnkPIZToWiuZxxURNoDQkI90tOJgYbkG66aOROCIQvXA4Z3JxPRfSyd0/CI0EitZlJh
         ItcvbKm8HCFsVJ/0+pIvl6ngf4/LR8FA1SlBeWg7HzoiL1yoxnV0cg4vZxoC7Z2lIAmf
         yNyyGnFsG6Qztuxsysg/Jk3WfgwrMcj1ryNI4avRGPzPhxQQd7DC5ywHg78EKUOQYlwj
         Swtg==
X-Forwarded-Encrypted: i=1; AHgh+RqP45XZqikTPSX97SRS7RtXy8DzbG8/aaFySYQznD2GPCf7D5fP/r12s1tuOlNXJrleZTuIhwcB0A3k@vger.kernel.org
X-Gm-Message-State: AOJu0YzJiK5TmYb6/Huw5+nM2HZi4NafdwO10foF+z8qCLetqyUhnw3k
	QGyw4JUAGgpfliz08VmPSsIhRgC6jIrlkpCNZQZyn7x40ooYNM3CQtYn8MGp1kf3EJBDIGFB+ky
	U2FkzUZ8R30dnVpIYbVlunEpxATc6yzP2qISIZiiEE+7b4TqPdFR24YnOw/TaLDuf
X-Gm-Gg: AR+sD11mAdGiEaWwh3cPXB6i3hI7rn1Jj8ri0kyhpZOGoJzascz2UGDH9yg6PPYfqOs
	HIpguVD1e95N6EakjmVH6epusTp+pq+U+skcE301/kUZbRao/K4pNzq2moMq/jYKD7oW/PCIej8
	CZrRaZvzhFfvIWSY0dHDsdJaCus7zhuoVPgbdLVzHtfXoKWe/LFltHvwTYMYPQ/F4zJA7RwJTin
	bj2vIPokR7+kq2lquGvP6Alv3GNqPxvXePwboxapoYHG37AjJTzrFoFwdF+2VR9s2ED6CHghsMW
	TwfOL/6i6VCbcEn/cjTjn7GMvQha3vevcRDWNMr51UgheC9+S5ANbHW9lq8kk5mwyFtkSQ3ilJz
	HP7SZas7qfNM6f44+uy696glKmL6UjEB9gPo=
X-Received: by 2002:a9d:7d8c:0:b0:7e9:dd46:b9f8 with SMTP id 46e09a7af769-7ee471926ebmr889201a34.15.1784813606336;
        Thu, 23 Jul 2026 06:33:26 -0700 (PDT)
X-Received: by 2002:a9d:7d8c:0:b0:7e9:dd46:b9f8 with SMTP id 46e09a7af769-7ee471926ebmr889159a34.15.1784813605732;
        Thu, 23 Jul 2026 06:33:25 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee2a0b3803sm3569083a34.21.2026.07.23.06.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:33:25 -0700 (PDT)
Message-ID: <0ee2667f-db43-4e5a-9b4d-2c2404d4ae5b@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:03:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 06/13] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-6-e7453c548c21@oss.qualcomm.com>
 <20260722171108.GA1097879-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260722171108.GA1097879-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX4zKaGtCcqa0W
 +RmAiBRN9icM27pvuKT6BYEMRFa5m0SkKWdZnmEXq6ztM82CkFUZ4c3AY8x9V+AYr+ef2nfj3gR
 pG/vHXTrB0f+R4B/+5pDWdwc1hY/m88=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX/z1gUcjO0bTX
 OcwRGS/AC8p/wlt5L02A2WHmblnAJ2TJ+OqxLSTI+0SX8a4Q1t+eMkajO+VrqHMVIzc0/VETQUF
 qNw63Ig7S+6BYJRyxzQJu9cj52Dm4AKYTSnUMUC7P0qvzzYnCtpd0baWOWc2wPJhkywYYwfrrVY
 2Ms4mB8Ym8eMSO4el14bz3zZ5HsLorvD/wXT47x/bwVSdwateGizJGOHqDoh46C4PAlUWY31Hm9
 I19t9KaWQjgyKjY3JxF2E1PSFaNR6osjM45BkXaRO1J7SURQ46KFw8JOomBqRsVJo2SjCxZzqwP
 ZDWXsY8Dml+NGV90WnXXbdzxL3g+ibGbiMGUfZVYacNO8k32tD4yDZVw0SvDp/6ev6MdGHODuel
 9o7Z6h4O0jwnP1ZN2tdveHJig0nVvPxAXrFIjvwFC6Wk31uKZ/okcAWTiqaCwgERCoxKIwXU7e0
 dji165XEalOF1fqYAzQ==
X-Proofpoint-ORIG-GUID: bIp0fnD0ZwZogTJhVkPePvBa0JQulJRQ
X-Proofpoint-GUID: bIp0fnD0ZwZogTJhVkPePvBa0JQulJRQ
X-Authority-Analysis: v=2.4 cv=D4V37PRj c=1 sm=1 tr=0 ts=6a621827 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PV7ZYYKFBiq-RxTmBQMA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230133



On 22-07-2026 22:41, Rob Herring wrote:
> On Tue, Jul 14, 2026 at 10:46:34PM +0530, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/psci.yaml | 54 +++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>> index 6e2e0c551841..11b90e8affb3 100644
>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
>> @@ -98,6 +98,37 @@ properties:
>>         [1] Kernel documentation - ARM idle states bindings
>>           Documentation/devicetree/bindings/cpu/idle-states.yaml
>>   
>> +  reboot-mode:
>> +    type: object
>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
>> +    additionalProperties: false
>> +    properties:
>> +      # "mode-normal" is just SYSTEM_RESET
>> +      mode-normal: false
>> +    patternProperties:
>> +      "^mode-.*$":
> 
> Since your example violates naming rules:
> 
> "^mode-[a-z0-9]+$"
> 
>> +        minItems: 1
>> +        maxItems: 3
>> +        items:
>> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
>> +            minimum: 0x80000000
>> +          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>> +          - description: arg3 (cookie_lo in 3-cell form)
>> +        description: |
>> +          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
>> +          after "mode-" maps a reboot mode to a vendor-specific reset.
>> +          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
>> +          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
>> +          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
>> +          where:
>> +          - arg1 is reset_type and must be >= 0x80000000.
>> +          - In 2-cell form, arg2 is lower 32 bits of cookie.
>> +          - In 3-cell form, arg2 is high 32 bits of cookie
>> +            and arg3 is low 32 bits of cookie.
>> +
>> +          All values should be provided as per the PSCI SYSTEM_RESET2
>> +          specification.
>> +
>>   patternProperties:
>>     "^power-domain-":
>>       $ref: /schemas/power/power-domain.yaml#
>> @@ -137,6 +168,15 @@ allOf:
>>         required:
>>           - cpu_off
>>           - cpu_on
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: arm,psci-1.0
>> +    then:
>> +      properties:
>> +        reboot-mode: false
>>   
>>   additionalProperties: false
>>   
>> @@ -260,4 +300,18 @@ examples:
>>           domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
>>         };
>>       };
>> +
>> +  - |+
>> +
>> +    // Case 5: SYSTEM_RESET2 vendor resets
>> +    psci {
>> +      compatible = "arm,psci-1.0";
>> +      method = "smc";
>> +
>> +      reboot-mode {
>> +        mode-edl = <0x80000000 0x00000001>;
>> +        mode-bootloader = <0x80010001 0x00000002>;
>> +        mode-needscookie_64 = <0x80000000 0x00000001 0x00000002>;
> 
> Don't use '_' in property names. This is a W=2 warning.

sure thanks. Will fix this.

thanks,
Shivendra
