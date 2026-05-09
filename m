Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED72191F91
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778346268; cv=none; b=ObVQ8tgA0cUh4oWNpg78goPrRyv1zYj77/7nj0PvXUSulEOS3RUw3Y63yGIN8Vs6oUsA8aO12iA53egUVKRZNiYtG2MQkeQM/C1/UKvLuu38xlvukDRwWpnadNfPe2p9dZQa3Ru9jsc7nnLvC/vrrzt52r2u+b7j1/wf15IfJZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778346268; c=relaxed/simple;
	bh=RBhf7gOBQeFMdmGddxtbuEgjDEyoEauq2gnBu8JuHrA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NQ724UGiUvtv0B5hMPfZxe8U/21gMKR45elYV5x6ok5GW2GRjVyAHGxIOvBTdzFwpyw0NPGUFYoyHmXCQThHurbRKWpYn6gWe7ZjB+9URkmjpA/LsiEE8LA5t6ZGcuyRlnUZAbnFoFoF7n0eLnQ5P4F5v3PFjM54Hn3sBlaBanE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4iVjjn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hztpt6op; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4iVjjn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hztpt6op"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64928oLq3600484
	for <devicetree@vger.kernel.org>; Sat, 9 May 2026 17:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWnmkIj1X0h4iZ/07axseI9cZy0pQq+izXTg9Q4Q7Ao=; b=E4iVjjn9NHR2HMrm
	5iKaHumJmOd8aMEhBY+IzL4i+OnpljS2aYD+sYV4WEYSP5Qrl6dMkSBcEBVmw5TB
	5dnPXyl8ZRLQY7tHGygxPyvehitUUn8UfH+Al0Y6r/8FxIGp8WnstlCJiR87mVQE
	dtsSYyDYOxry/UpPDgPHr87322qXK3Ww7FeGdBvV/7g44nyYe73PWHuB1qwEIAG8
	CPNDxDra8QErexkNd60tfpragONN27FWkklrSFCG82IzrmEKljgqj25uEqPx/cCt
	lsNLI7Lp8PhNniIKf5wHgTN5j5uDON2Brl8NVt5j+TFJHblUbfuXcS5ujUWB9cew
	TXLdjA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1uvshhry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 09 May 2026 17:04:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso31715115ad.1
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778346266; x=1778951066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LWnmkIj1X0h4iZ/07axseI9cZy0pQq+izXTg9Q4Q7Ao=;
        b=hztpt6opcy7nGR/t8C/3ssyAQgn/uh59+5KqZBwBKjddV1HI7RckLSKVsaNSRGorkz
         WIa6sQ7dpNbi2BjhNjJeuEHv4IAWPFPYiEi2GnZypDZRdthuKelU6nLj/0sBgNpUBXZQ
         PvajaEL+q1a3a05fXf62bmNI4dFxBUunolM82glKKqaVNWOR5AlzAuoPCWJVBbr7f224
         x8gAymG1kB5vFz8J/+l6D8YygpeDQQ8cP73MS4S1z3pMlXLD2iyF1ea8NhP0d+KgAMIU
         TelT7/d9o/QNypEZD4vfzpMkq5nKigbe6KanRd9YGxT4Bt2+1ZjvuQfTf57szPWNxjuM
         DjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778346266; x=1778951066;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LWnmkIj1X0h4iZ/07axseI9cZy0pQq+izXTg9Q4Q7Ao=;
        b=J5/AHVLJsavF3z08/NgCCKgC7lvrWjd1TwLmaaEmtAOTonw4FPVpHfWzT5PJeMav0h
         mQhdlINQehZpBlkcSWjBQaTHdaEiBWcEzeeTDnrk/AFofMFq8h8PBpCK0m4XOtLDx/ww
         r9vtuqZxj4sgEjrJ2pNcaAyHYaejlufTKFY9PSDwslB0fe6Dk8j6ZsGjqaXGrTs8emh/
         y5XEvrjfFzP2dh2CyEFQDWVhj2Py0IapwaEa/eH+KlgJ1rO+rIDizcR3wBFOXAVwEFwh
         LR1mFz9OBOwXA6DhEq6i9bVVmCV7dRnjvl4C3NkuNFPQzQ1UeDSi4k+KA+43s64JwSqd
         HJ3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+kEmXzy6JSKrR6AZ5lShESI2cipOh5fUNVj5qNOdnV82STOW6LJLmi0n5yBQr4BSkafc+gUA1wTro2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj3jh+2bBIiJn0413IFMr1jOuVtbXlhlVmC89O7FgvT1Jd+Y0R
	NAR6dTPwo67BLSbCn+4TWcCmZIdu7g7qo4A2IvdfxUb/TxGM8dTcKhH3zJDrG6MTP3DkFKp4gda
	NzibSVUXRmrAhKAcct/+RctmuulcDO7RS16NucGlyYB34KcLFBcfZvYac2wcMkSyr
X-Gm-Gg: Acq92OFa8llCPKm7obEIgWDu5Ay+ZzmlMlfOfCu7sJ+qV4tZcerNeLQPgm1FxNobAMN
	dDfOMCjsThDUwBj8DiRrntmF8rlWOfBDjBAij7ztcAwCjWSGVdWZylnAcMpxTrGbIqTb0vTUqN8
	og2KO89HFi/kG8D7uTLxiDL1T9Lf7B8Xc65BXfXJqzQz85kOzhGQiGujl9SqZqQ2iTbB8YzI9aS
	7Eh/peVTPVq0qxRAC6nCp5VwEyrZPPK7AQdqFZ1gDPxQU23cJlGEt/MgiX6hLVsrNAzCGQeOmfM
	lgpDBf7vbH3ewJd1P3WMukNOakX1L+G75vVdsKfkwOuS+2LlDQdAZjfKf/jw7Atl1VCh6GZTMuH
	h7EhTplCXZw/ihaWMHGul2t6XBBmfxYQILdBPNoamWl3mSpXYDsk=
X-Received: by 2002:a17:903:4b03:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2ba799d06d7mr164878755ad.18.1778346265624;
        Sat, 09 May 2026 10:04:25 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2ba799d06d7mr164878445ad.18.1778346265007;
        Sat, 09 May 2026 10:04:25 -0700 (PDT)
Received: from [192.168.0.9] ([49.205.255.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27254sm55364225ad.4.2026.05.09.10.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 10:04:24 -0700 (PDT)
Message-ID: <fc188af5-ec7e-bebb-2654-62312d79e60f@oss.qualcomm.com>
Date: Sat, 9 May 2026 22:34:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/14] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
 <35zfskmyogpazxy7wsw2jg36fvpnnc7hng23j4heq2jy5ookai@q7d2vl7nn7ck>
Content-Language: en-US
In-Reply-To: <35zfskmyogpazxy7wsw2jg36fvpnnc7hng23j4heq2jy5ookai@q7d2vl7nn7ck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE4NSBTYWx0ZWRfX+oDqxjqsyOu0
 CD4TWv+8gHvPaXTqRF9OIwcfiEw+jyu5Vuy8WZUCHiolUd3qSGMDY+WGrGCsGoKXNPr1FpY0yMm
 L62R6JBjBqyMHqhtM5WjUoTDSwN3taNuSlAEablrfV/60GKk0QRKRdnkfOCTzN4nBwqMmxYwI4Q
 sBvpDlH2duJSIgX5QudGW1ZgcmEC7a/17xQ57IwcdPPhAHJOa5cLK0YUgxkhpUOfajOfZoOo53G
 okuvznqhHAqI8eSJL/7uzpW4JpLe1tkOn8ccSw7PPLPiYly7Fr8NqPmUZV6K7ps3Ee/G76pPuns
 bSkdatzAHUgCs5PZVzMwe9RjxbyHg8KRTXSEiJ3ht/0efJXENio3p9+WM+jj9WXQ5sb3K5Wf1Fg
 vCesbsKmPyW7ByTB7ovrm8Xv4ipVHPDpKVLrDBghN6EGNAcfNsbDaZCp5QDjSR6P24X8o35OT31
 vB+fbq2V6B/oSI+2E1Q==
X-Authority-Analysis: v=2.4 cv=dujrzVg4 c=1 sm=1 tr=0 ts=69ff691a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=SpcZ+gRb+6o1zy8jT5J+bQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6XTuGWwdhPdsyaIifgkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: hzWcccUFv-vUoVM2fN9YwZhnOuzgVj06
X-Proofpoint-GUID: hzWcccUFv-vUoVM2fN9YwZhnOuzgVj06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090185


On 5/9/2026 12:52 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:29:53AM +0530, Vishnu Reddy wrote:
>> The common schema defines minItems and maxItems for clocks, power-domains,
>> and iommus. This suggests that the number of these resources can vary,
>> while in reality they are fixed constraints per platform.
> It really doesn't. It provides common definitions, while individual
> platform schemas tighten those.

If a new platform requires more resources than the current maxItems listed in
the common-schema (e.g.,Glymur due to its dual vcodec core design), we need
to keep bumping maxItems in the common schema every time a new platform exceeds
the previous limit. That makes the common schema a moving target driven by
platform specific.

I am fine with increasing maxItems in the common schema instead of removing.
I can set it to a reasonable value (for example, up to 20) so that it
accommodates future platforms without frequent changes. Anyway, each platform
schema must define fixed constraints, since clocks and power-domains are
mandatory per platform.

Could you please let me know which one you would prefer going forward?

>> Remove these constraints from the common schema. Each platform specific
>> schema already defines its own exact fixed constraints for these
>> properties. Additionally, remove these from the required list and update
>> all schemas that reference this common schema.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  .../bindings/media/qcom,msm8916-venus.yaml         |  3 +++
>>  .../bindings/media/qcom,msm8996-venus.yaml         |  3 +++
>>  .../bindings/media/qcom,qcm2290-venus.yaml         |  3 +++
>>  .../bindings/media/qcom,sc7180-venus.yaml          |  3 +++
>>  .../bindings/media/qcom,sc7280-venus.yaml          |  3 +++
>>  .../bindings/media/qcom,sdm660-venus.yaml          |  3 +++
>>  .../bindings/media/qcom,sdm845-venus-v2.yaml       |  3 +++
>>  .../bindings/media/qcom,sdm845-venus.yaml          |  3 +++
>>  .../bindings/media/qcom,sm8250-venus.yaml          |  3 +++
>>  .../bindings/media/qcom,sm8750-iris.yaml           |  3 +++
>>  .../bindings/media/qcom,venus-common.yaml          | 23 ----------------------
>>  11 files changed, 30 insertions(+), 23 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
>> index da140c2e3d3f..b1046a112e17 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
>> @@ -62,8 +62,11 @@ properties:
>>      additionalProperties: false
>>  
>>  required:
>> +  - clocks
>> +  - clock-names
>>    - compatible
>>    - iommus
>> +  - power-domains
>>  
>>  unevaluatedProperties: false
>>  
> [...]
>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> index 3153d91f9d18..060be67574c7 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> @@ -18,35 +18,15 @@ properties:
>>    reg:
>>      maxItems: 1
>>  
>> -  clocks:
>> -    minItems: 3
>> -    maxItems: 7
>> -
>> -  clock-names:
>> -    minItems: 3
>> -    maxItems: 7
>> -
>>    firmware-name:
>>      maxItems: 1
>>  
>>    interrupts:
>>      maxItems: 1
>>  
>> -  iommus:
>> -    minItems: 1
>> -    maxItems: 20
>> -
>>    memory-region:
>>      maxItems: 1
>>  
>> -  power-domains:
>> -    minItems: 1
>> -    maxItems: 4
>> -
>> -  power-domain-names:
>> -    minItems: 1
>> -    maxItems: 4
>> -
>>    video-firmware:
>>      type: object
>>      additionalProperties: false
>> @@ -64,10 +44,7 @@ properties:
>>  
>>  required:
>>    - reg
>> -  - clocks
>> -  - clock-names
>>    - interrupts
>>    - memory-region
>> -  - power-domains
> Do we expect the platforms with Venus / Iris not having either clocks or
> power domains.

All Venus / Iris platforms have clocks and power-domains. These removed from here
and added in each platform schema.

>>  
>>  additionalProperties: true
>>
>> -- 
>> 2.34.1
>>
