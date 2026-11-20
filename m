Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157281;
	b=cLs4xdj0VLXVhWZzbuTHGW+cirVDCmcv4JCNBiiw2LHYbjq3JLYZs9ftHhjPWceGrgDK
	 7EeEs6yu7BEbfta/Xv2/Ub2leCBqhCmI5b4KNfCt4CV6EuDnrRc9lN6Sp4DqLjxtpYNqs
	 xENosDJBIszr/PYkp3Cym4afS2aJEulP//GAnn0wz6ddkFupsyI0Kt208kseGA/mhqxlO
	 fM5PI0tu4zVRnKRaLam6ZCDYabABm/MDIm22HS+JZHvH30VnlZ9VHQbyliL2xPImsUYIk
	 xhqINlnuFoEqIERn+IyQAim0cbOclaRQ36dWAkUFZ3sBB4e7WmcJIjtFRtrXVYFNcrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157281;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=;
	b=cqmwghQ0OBikwXheVuTwmvQBFQLT5zzU3i0OMnU8rcm/9A5nbOhVzAO7GIXa7dNBHOOc
	 067dO5H5p6+5Z+hRQMOUxCRSJyaKVzsdsPsDbzJe6rUCVn41DwbKmfQR1EvKp5ZoLM5l9
	 1Xk6MsfigMiPm/12s55axUXm7AihaqnEpjdTDyEVb96XVfNRaKi0QJ8raB0ZJJBvA3YEM
	 1389V8bGgbGmMnBZ9l76wPmSj6bZ8d5T95qim1yswvgT92Z3QTAVVtzT2jeRIYjXgiEza
	 9QSRW0UOU73TV58b3mDhjXAvoAxWDuZMR6nefN6LjYFNFSmdHeBeLhQu+sJlmazI2ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hkI4QR6u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UoL7P99/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BC0606A335
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21BC0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hkI4QR6u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoL7P99/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK6enNa513681
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=; b=hkI4QR6ucta5eWG1
	nyjdT1vUjsi3zvTTbwhohx6zH3N8uS7jrj1zPoY9ZP+PiTbUTqkHLSZ4KEMtSal/
	R4fcnQ8nz4z3aaQirfBCv9WObKJw3847lOJVxS8bm5p6Bj5jrQluFvmyVDxNvahF
	wRP3KVEhK6a9+xbLOdhyrXIXeJVhCd6fGhz75pkHLhwMiPtGxabtmCC3mACSej+n
	EwtePSZAQXWkWTKCXRhdTvT2iNMnnA7EjaLdUn1hXqcsYmDj18kjvFAQnlV/nw+v
	2Gfjcm1vvOX1uPdcpGe7Kwf1ILb3uM5eroHPBXjmtkFSJ63R8NFHJsrOH85dPJHT
	RfBX7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyj920-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:47:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2edd25534afso5248135ad.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 22:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795157278; x=1795762078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=;
        b=UoL7P99/nP8ae97HuQdP+qRNbqfxhH+rHwpJxRIn07lLNpUim+kbrE9SCySebAuZue
         7gWiDCCrvbIYpwITMTn3K0XPBkbcjrACh+9iJsQztZMK+sVE/hDiXJpkY5p3KDUqJXrD
         eGLKjRkQbYa/ZWStHRYc6CW0mKgE/HuhXxLc7ZOLdgiHivc4RbiVlRjOKO3VyPzRp4gR
         7tjtK0354Ek6QaDsVqhUKTxcwZsBKaOc21DLfn/KeqAQN+6Pws+bTI8sMbrIrQuldDEk
         Y2KnmD2BgR9kUXemi5T7dHdHFxp/yRzdZ2Y39CDSVu020BWHFhYePzTLWX8IBhGxbfsh
         Z0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157278; x=1795762078;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=;
        b=wR4lAX+Q4CLqc/RsnIjWcRemUaOaiEYutkLNnhzwK+pvnkxT6rPiIPGz8LcX/Z+LyE
         x82FILLotAytFTv4C6I5tSwh5SpSrnGLC7vOmW5n7n1zmtxZGry6UXu5d4RM91Gtdsht
         NMAe+6uAFYE6qHkJWWTjPpdZStzx6GM2OT8dSNIIBwfJDb1GBNwkmhGW3DSArBsHh6sX
         DgNZ3gl1k+6UERpxDEIjkNgqWlprKUsC5RjFDeNm+uzf7auo2t2T84r5+XFmFpjg0Rrq
         E7TNpCaBK9uh/bT1LT0+EDyqV6Q+rdmQ0b7u5Ckm7wQSyKMaRkuThwA77PPwi4QgowYe
         0YyQ==
X-Forwarded-Encrypted: i=1; AL+hErHRUI1LUUFq7iX9mcj+RZYtJYjHSYTW/W6SHBp6VO5z8dfzsgv4SohjBxyqr2sZRGvXFmnzUPIyy7jv@vger.kernel.org
X-Gm-Message-State: APuU4Z+cJiANxTBeVin2yGiOz0vHe5UFtT9vBZKkA2Zc4hWW0bh1DGya
	hLYHbfFkUMPQU5LqpQRYavq4OQrNiMVoGfbVSaESSXiZ3fS5NwXkEjhUPRuNMONhcki4HxCg6uC
	qUnHp69JJ10pb+p/Ep83EsDkQHjMei9w1XxZo4xreSFjV/sNFs9J9tNtBa0I3uX/5
X-Gm-Gg: AZFdTZdtaHRj4feGhZPaILXEQVW8qMpfN3hynLt+a61NXAkNHhIk4Eu0fjLMfot+DpR
	dc2qcbvpu7JBrcuyq6hLAna9BSyfea24V1kmwvPKT8SXLZkt6THg37pq4uoJMSZ1yWrx9HXKUBI
	EM71hBxrli3HLEvV/hEWlmP5X4XUAeZP6Q2G75oLT5go+BMNp9nwlNUySwnph8Ukf+VVbAUmLO1
	LEPLUZB4UJB9a2Eqmvz7pwl1eTBm5waGCZtduG+fXfSM2zlWNEQ+o4pdz9pvsRNcnWsyXx5GgE0
	EBhd8XwTB25sXHid6gPAujvXDcLnXEdZVWkzOsrRUyXvLebso3N0ldHV6Sjh/vx9h2SHR+QmzNy
	yhu669wfz+VI7CFxJycoDjvaxP8YZ5GOgauiLzxaDn3jfkzzIHh/wlX2d4/VKINdezxlSffUPRB
	q7goJk
X-Received: by 2002:a17:902:fc4b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2f03f1ba464mr20069585ad.34.1795157277819;
        Thu, 19 Nov 2026 22:47:57 -0800 (PST)
X-Received: by 2002:a17:902:fc4b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2f03f1ba464mr20069505ad.34.1795157277401;
        Thu, 19 Nov 2026 22:47:57 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm9781855ad.57.2026.11.19.22.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 22:47:57 -0800 (PST)
Message-ID: <eb44a4e1-fa9e-466d-9e97-f87f365ce44f@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 12:17:49 +0530
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
Subject: Re: [PATCH v3 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
 <20261113-thermal_bin-v3-1-878df6eef8bc@oss.qualcomm.com>
 <20261118205056.GA839455-robh@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20261118205056.GA839455-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX/J+O78lxqblV
 7KyI39yw+a8Bm4EKOUPGv0sauq5pyYVo40HNtE1xG/OW3ZIhRv1ZDCZn+c1tQM1A2SOV88nCZi8
 mwxpNC075lGGvntosloHDaG75VLldqA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX6iCuXau472Gy
 C++FVD1CI3vmHogurK92JayMj1RbeZ+cBkWDqDDB2WBEvUgGXuHXZWpmfp1N1BHWJ+fP6MYCf8X
 KHGiephKVu78KkKdAFr3zgJ0BUcPFpHvRdE9obeJUXJ2dHTdkeA8j+mJEZPXl1iDA85Yf+lDeBM
 wKH9+LQv8UM3BgwsJaJmK54jQOQXv7BBITpeN6JJdH6C5Rxv1WFLfIwAKh4nX1boSNsZqBb+gIk
 I7SoZ6Vl4Q/wMcjvA0mtL8KzaF70ng0jnUlEGWdOCq4gU7Sv9rgg6Jm0pJas7w1jY1NO1pEkDPn
 o0H2XD6yaK9+tVdPs3IWla2I+aEDNZ1Ad4RgQq48n+DXbEQp4HCCWNdDWi8ZQl14mU32CvgtuWf
 p+lApGgZq263SSr08sAdSI16iDLbsvTZnTzDso+lqEd1kOG533xTbIC+yzAxWEQkGRGGBGdfqKQ
 qw80j9RG5iYMzi8R15w==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6affed1f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fXwKFA8GOUhRkyI-wlYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 89sUSgmTTK2BdqrFN9Uq0reAWCfxXx60
X-Proofpoint-GUID: 89sUSgmTTK2BdqrFN9Uq0reAWCfxXx60
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200026



On 11/19/2026 2:20 AM, Rob Herring wrote:
> On Fri, Nov 13, 2026 at 02:13:44PM +0530, Gaurav Kohli wrote:
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
>>   .../devicetree/bindings/thermal/thermal-zones.yaml | 60 +++++++++++++++++++++-
>>   1 file changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> index 999ad40a20d5..cb9a8c96d053 100644
>> --- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> @@ -152,6 +152,58 @@ patternProperties:
>>                   situation where the trip gets constantly triggered soon after
>>                   cooling action is removed.
>>   
>> +            temperature-bin:
> 
> Use the standard unit suffix.

Sorry, my previous reply was sent only to linux-arm-msm by mistake. 
Resending to the full list.

Thanks Rob for the review.

Would temperature-bin-millicelsius work for the unit-suffixed name?
I’ll also add minItems: 2 and maxItems: 32 in the next revision.

> 
>> +              $ref: /schemas/types.yaml#/definitions/int32-array
>> +              items:
>> +                minimum: -273000
>> +                maximum: 200000
> 
> minItems: 2
> maxItems: 32 ?

