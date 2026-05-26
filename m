Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADDA3CBE79
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781177; cv=none; b=c2SSUx8eo7jACp18p9rp/IzZuyadk80J9K5AoBGK66DETFvzcDEnQT17rH+dtdPjlH/KXDd4TkUtjho5jIN+jfjmDeGJjHHr1EHL6CuI9W4VRw7eBnWlrnA/4cDmOc2nQagiKxzRHjksE/BRj7zrS5tXxPG3+7oqkWf7imSFIus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781177; c=relaxed/simple;
	bh=QROzjesojsza6o6DWliDyVXRJb1pE7GEdq3E60S7bsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gs+rbX5XijvZgfp7ecN1NnXHCfQeKUfIh0/Gm852MZ9HT8UxD0QOIspSdLIlrbd8nG0Syr9PDkPe12oFyUy0F1VNqvGi6yAajf7gqRqzxhE/zejSGYw2xiZwAbdz6oYYpAD6FzJPz6v5QuSbq22WDTYpaGvLAWWn2ZXvK8hkTDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jS8/PSjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBECVF4P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jS8/PSjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBECVF4P"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2mDiU2823029
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jIGEP+z60S2yqQzDYqC9TS8A9yx2NRGZ+os1M5/9i8=; b=jS8/PSjE4Rp+Up6r
	vD1iIuYTubxtazNDwSGTnbqn3xAOoGu5A0Zmo1XrldHvCOJfdiKqIEYGWjgasV7P
	7q7wuvyUB2co8lZceHNHhQBXJ0b5hxsjOvOG0YlcIvE2v8kIGf3KkP/eqrpc3M14
	8ykWAyPcQeoyfS8L95KQiC/jxeoxYLDqNxBsOUYRqv/DE8RQhd25J6YnyiuKL1Jl
	xUtOEtTY1CQPbkq/jmRZKuEudA1iUBH2wrF3FkC9MZ095sACyZoddpf6ZJ1H0XS/
	Ypu6w9JI1OaV7f4u87q0gaPMVaMDMeWzLUX9HlJJ0YTSHLMeJZLhM+zoafOWYHIB
	y5YlXg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwtmjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:39:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso3413152a91.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781175; x=1780385975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4jIGEP+z60S2yqQzDYqC9TS8A9yx2NRGZ+os1M5/9i8=;
        b=jBECVF4PoXk1X1kqSS3OPfgsBaKLes27/21aCXBAiuq88NzoO2J6ZZC1WLtOU46wcr
         34bxcJzb45IdUK96mvgBxMaAwvzAyyjc1LqnvqICnN2QgzjBvLXbT4sZKETopflCKKxs
         /qIfQkmMcI+17/81VWpO72nM/v//btGsOnAP+b8zgl7do98VNrDGmSZ7QZ0hxjd9WmX7
         8EbbuIwECqyg8/8kE0cYd3zehq9hUJtRffVDpIHD3VObrZ8KXjflDBt0cScFrHOj2iUX
         KdE2c1TuR1/BUakZq2yjKOm7w1AoaS8ffGcdsn6D8imzD42YDrrp+fp23wqIB8Hc73cg
         uyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781175; x=1780385975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jIGEP+z60S2yqQzDYqC9TS8A9yx2NRGZ+os1M5/9i8=;
        b=Cn1As0xLI+ilZdLZAvfDd4+fBa8lGJ/PIW6z5Rs/vyzBYVSwhqT1CYhIyvawoNawNX
         r3eJt5JTEuAh90BC6VST4NbhjAwsR1wn8gI5TM0HHV6+pRlR+KzawPib/eKmWIFtnv35
         NBfqAd5tN/vV767QF3hFqTVqoqusmuOb/Urwy+KapGkS1Pj8+DCwaqPjgSTk+tkLlHvO
         MemR/QlHFmm8LpZ7VrRBmxtsf7IiErBOtEdba27v5mpG0jaOxJRLKlfx5Gn5mvUqeEgn
         9rcyvzZHSyZ6ICNjG7vkCWl3t2OpfGfcWf4IjGbGTs9QaY6+CQEfA9fCpTrQFFg1oLrL
         QhOg==
X-Forwarded-Encrypted: i=1; AFNElJ9YJWFXTUgAE95VYNIsdI9ndAgOYrcCnu060H6ZSpnq2RZ6Y5+/hfjYWJlf9rX2mR9Zmkz76u8J4Mya@vger.kernel.org
X-Gm-Message-State: AOJu0YyLaSEEh2HmzD8cW2WMrUzfM2bZMigTgNvIn/PXwjKE5o+dNmTL
	YrbXbtLEpqwcZOZZUrymKxC8rvepEAxmiJLt/6+2t0QVOZd/rvJuQWo16O4cBRP5/HCGRublCho
	ZoWHqRKUfK/dbI4Hq2+XAM+Qmi5OvwLx8iJ3Sm9AQWzJMUghNtrFQIBklAkRxgwcB
X-Gm-Gg: Acq92OGWec/JAETM8oigPD3bcMFxS1AqU4gx9hrmuUrVO0NhKZLmAnqIqsvpZvi1xPF
	72EQ/YRm0uZ8Lr5LNmvdKMdyDceodGJdTMHDFwP5m1DkNe3u490M91wrLpiqKsMEvN/JCW+xSIU
	W123ElE4RvoaHGo8O1nYWG9pYf65KFvpji2JlY+3vdvRANKb45pxTk87nq/Iu6Z8FLAgv08Cuih
	MT5u3hN67+C/9yA2l9EL3HXH81WF1J46nZLrgpoG0p6EwnLd2WnspMHdmRACKaBplo3adsQy6Za
	ejF7BF4i/jzWW2G76Ah4sKIH+nZERJe5wtUk4aUV/ymNdz8F2c78DnoIgRmX5cKvx9uqJ3wLeib
	7LE5sQzAz2vdvYu/9AEPFtI6nwJ8aePBr9kWuqZjQqw/2hOCq97yLKa+vl0Q=
X-Received: by 2002:a05:6a20:c90b:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3b328c4d6d0mr17344477637.4.1779781174707;
        Tue, 26 May 2026 00:39:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:c90b:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3b328c4d6d0mr17344438637.4.1779781174206;
        Tue, 26 May 2026 00:39:34 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056d767sm9446299a12.25.2026.05.26.00.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:39:33 -0700 (PDT)
Message-ID: <e339703d-1a10-4594-a8af-64e6acbc6cd3@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:09:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mps,mp8899: Add binding for
 MP8899 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
 <20260519-mp8899-regulator-driver-v1-1-30d14421b7f1@oss.qualcomm.com>
 <20260520-passionate-handsome-dogfish-9fc65b@quoll>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260520-passionate-handsome-dogfish-9fc65b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DuqHymV2k8tEjZNHaqJLBZLTKwTNTroT
X-Proofpoint-GUID: DuqHymV2k8tEjZNHaqJLBZLTKwTNTroT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfX75KdNPdejIpH
 f1EMImC1KTeo+/VCoxM4vxyarW0Uou/Xu72BgldY92jPx1No0515sXUQ/CmT3hyG2YQNkOheAys
 coFZtW3CbMm5xRrll6UH/zd2r09EJmRPX1FkPDqiQrm5OQa9GguiAQE0ABXrRfJ/UcU/D+gEAd7
 L7e1/6fZhwc/bJfW4GCL/UliH6eaHcu7pzfFodZmLWBd0TDACvFJVpPpod7UedSDZ6atTeiZr0W
 7KnN40u+jKU4rA7mAN9wJ3Ec9mZwg6VN0IIrQGfrusgj0+G0jwLm5pp6vdg3ajXQLw4ro3oMX7h
 2iiijxsdrwX4YblfkB7BDYNAB2zh6Ve2lC9J3qrottaoft59XwllXjqFJhAJHWy1fqACDfMwit+
 y38jnos3ZqgyXktem1rz4mCOl3PgxBAYe0IWi4YvNd0Q9YUpmBzSaCU2zhrVoeD1ITqlRb4EjBh
 gtXXB6IwRyzpIuT9+PQ==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a154e37 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Ov9h6TAEAQTuY_HzltgA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260064



On 5/20/2026 3:57 PM, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 11:51:05PM +0530, Vignesh Viswanathan wrote:
>> Add devicetree binding documentation for the Monolithic Power Systems
>> MP8899 PMIC, which provides four synchronous buck converters controlled
>> over I2C.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
>>
>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/regulator/mps,mp8899.yaml  | 66 ++++++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml b/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml
>> new file mode 100644
>> index 000000000000..3225c92db2c8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml
>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/mps,mp8899.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Monolithic Power System MP8899 PMIC
>> +
>> +maintainers:
>> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^pmic@[0-9a-f]{1,2}$"
> 
> Drop nodename.

Ack.
> 
>> +  compatible:
>> +    enum:
>> +      - mps,mp8899
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  regulators:
>> +    type: object
>> +
>> +    description: |
> 
> Do not need '|' unless you need to preserve formatting.

Ack.
> 
>> +      list of regulators provided by this controller, must be named
>> +      after their hardware counterparts BUCK[1-4]
> 
> Drop description.

Ack.
> 
>> +
>> +    patternProperties:
>> +      "^buck[1-4]$":
>> +        type: object
>> +        $ref: regulator.yaml#
>> +
> 
> Droip blank line

Ack.
> 
>> +        unevaluatedProperties: false
>> +
>> +    additionalProperties: false
> 
> Put this additionalProps after type.

Ack.

Thanks,
Vignesh
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - regulators
> 
> Best regards,
> Krzysztof
> 

