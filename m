Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCC333936D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717856; cv=none; b=kwlYEkxizgbygtP9pwr8iHgO3ONY6FE84egn79tMtLJweOglUF55cxib2G+eEqSeo08gdGBtxRJJHXKMF0OPyqViu2ZfCl7hs2I9U5u1DTImI21tDZMysO3bn1dx1jfxsFT83i9aTMo/sjYgAy0+rsUAgdWlqPKCLWCAfa7eObU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717856; c=relaxed/simple;
	bh=QiqrnBFrCvZUnptW7XlcwHn5QfWSr5rCEk5a5HPz7Ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3bL9aWo0tyl1D+aBO8YkqbsyYEwJjNABMqYJDT6g+kbi9XLZxLNJBosvVZHCB4ev2kVeEhIoChT3i0PtQiCXAz0Q+VAzv4lX8QKm0fYU6ywpMY8sFX3ugxf4GLcKts++puqj0q/e8Sh+fChDQMAtoyg2x6R4x2+V64OITrXR9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KX3Ketxz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SB3vjJPt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KX3Ketxz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SB3vjJPt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M9Dqgx049896
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdElDgr0A6I5Ago58sw99HOz++aFFA5p06ZnufGOKLM=; b=KX3KetxzRk+DsMfN
	UdxPmJCcJ7hU6OMV02fGz/W6tKLUSUg2e9K5KFAYOI7ExrC4WPErjMaA+cXCyxd7
	qRjKk4Uvbx9g667+LyVI6X8IThHbXZ8nvyqD00ziA1BDWkhqVxqSBi5rlJ5pN1VN
	kHg3iUGOS+3I4H1iioV8YiysCAlaHGK4sBuMvDQ+TMpZfMsgEmGkOEiHH5PklQ0m
	908j3MfMbShHrLqVg+LjlhudUlFd8BdZodjZ0tgP+PkghtC3Y6Fq58xcWiPupxiJ
	kBK0qIbXFN5bQaRtp0mKaqPyOn4K1oFTaxo4GHXcr6uFwSaAkASeRuh94zgazNaM
	ICyJPg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju228dm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:57:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1552442a91.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717853; x=1785322653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdElDgr0A6I5Ago58sw99HOz++aFFA5p06ZnufGOKLM=;
        b=SB3vjJPtTIzsMlvSm1KGVwyHbM2qX3S/QU7NwuKVVz4lIvVvpZ5iVToWq+8oAKaczX
         zh/JshHEqSdHUSBzPWrTDTIgVfELPmSOAnxq1csob3gPTyD6Ve02vxz0UjPYXQEMZQk8
         gai8dxqmFELAZjti9MPY9chM/QzjchYdkpN82YIcaAVfN9FQs9W/X21zsZ15vy5fFTWB
         sGfqqkcFNZArZbhWzZYTFSaZuDMiV5AjSjf2wiBAojBZS/n2Vyt4Z0evIsT0byHQd1S2
         9BCRPbUyG6n74cL07tl4AW1pv44tAwcW4SY5I3qNNmEiNkVWJN+AexQOxFae6tp5OrIh
         Szkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717853; x=1785322653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdElDgr0A6I5Ago58sw99HOz++aFFA5p06ZnufGOKLM=;
        b=pZTUiVXpqtAe08FU9ztkaD3FXJLAaBdtV/Yh/WfKUw5KF8r09RiJtwVXR4EDCJoIZo
         LGHiodCvdquKzmgNb7EzrpiQPs8cZVbcUbjRzJ13Cg4Mw+wSpWxcW9U10mxbEgZ5Pr0I
         tqtsXF1QFonaQqG66jmzoxvLO5ITIBOeI02Z/noKfs9YePLCIZ1BdgaDykx0INZUK6YA
         8cKshnPqQla+lEI6rDgPbJCcDt1aKSUjxHdt5MEKr9ZltOpQEpeEtQSiHrCUYStIauAe
         VppKMXICKiuiuqr8qePcyHoi+OHNzPbW4ctklzSXqQi+gH6DeQYYCHF7yR6g/rEO5JBY
         KuSg==
X-Forwarded-Encrypted: i=1; AHgh+RpBJqQxOGds4lNNGTamIuEFI/rF+NXM1d17ImP6NelYhfhKu2HSL/WidX4KJu/aHZBbgVpE2tbwlKVS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9IS27QaPLykVxGutkQRZgBUFBGjnsJAa1xTTrRs5WWlGhn2DT
	2l16mJ6+QBOSxXaZHfsneWdQ3qAFb0b58SPhQj+KQvjtoESIX07muVTEw6t5tCSU/kDkb+eemYU
	XgTUHttX+2x4gGC9vN9tUzxxBbVLSqg8ksSFD5oFq4SrjS9oNdSIeN7q7OjZz9l/+
X-Gm-Gg: AR+sD12m+fZCNXLLdL20Zy6ZvDakZm0e3jL3H4aJ9+k/pJ92l/CK2pDD5y4RzHl2nlF
	RBEXeCrTvfWOpmA3a3f2BB1rPgVG1pDRyG4QA2WqpwjrEYJl1L4MzzpBV81754GclSm2NGZaDXu
	kknj/fJ/xKFHzzh3DODHZe/rVLnYkETHNvEteFpUO3ybdQfUU51l6cgJzr8SdRGbrRq16AwAmbT
	MdRl6MtrsoTHEJjqmV09684ZSrMy86lRxQ+NsM6OrsnH+AGiEELoYVOOBaSgvaeDq5DZ61GoclK
	zVnbRyn7sDIcdcmcJfo58FovWYANhwPcPjLqksKG4X2PfBN+ZAMjHdiV81L7Zf2WB22oXRVGkKV
	uXIS4+ynqm4yLZ/suoaAw+fVTH/kAVmaQ
X-Received: by 2002:a05:6300:95:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3c3ad7a31eemr23581352637.31.1784717853295;
        Wed, 22 Jul 2026 03:57:33 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3c3ad7a31eemr23581317637.31.1784717852784;
        Wed, 22 Jul 2026 03:57:32 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm9074959eec.4.2026.07.22.03.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:57:32 -0700 (PDT)
Message-ID: <c8fd7746-7568-453e-ba00-3d5e6a9dc74e@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:27:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
 <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
 <20260722-rainbow-sapphire-leech-e3debe@quoll>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260722-rainbow-sapphire-leech-e3debe@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60a21e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Bf9jZRNvZzbIE5bmIgIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: g3GohTF5dfmjA8k21ojrPbM3qnOAi8LC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX105JFIyuE36w
 ushUTGkFmziZEAIcFcj/8ixvv7KEGByQA/0oWAcD7BsdjAsl3bO3u68e/TGBAimGTnaiPhDbYgE
 0MCVJBdHpxOEiS/F+OllJnncoM2+J28=
X-Proofpoint-ORIG-GUID: g3GohTF5dfmjA8k21ojrPbM3qnOAi8LC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX61aWQXJCPDM7
 RpTsd69Y3pMCx4BLjkGNrUtN5RQl1XaYL/a1uclegov7qIAX9Juf5G/adEATH4ogaFTCRNtBiXm
 9+GwqXLImPIMKI5tu4IvywBeUk/XdEKyfqHZmHaWNvpcOtOEmlrl5A27s8lCMkDAoGnI8rEaP/h
 /A+yriNHhL6wLtDVV6kJO/ZYCJw7t9f9k05qUjD/MPHXZ/Kt0VD8fustkvDZ/SMs9tK6cCELPm0
 JrsEyaixX39hBWuo0QkpXs8i+icif5vKNKLv1J32jf2NxrXJMHIPFSRZ/XN5khCOgGUsUVip0Mr
 ofNr0TfZZq22yk7tCSBMTxvnHh6Fp9cD2BYRgCihYNBYU1JkOxgNSY5P9zv7ZhCl7zK4Wi1MbZf
 3BCDZfQ79L9e6tuQcSrWoIOZS4DPg4nC3o/4UdDQybdZY76S+JKNEUuU/mzwH58lFX5EgAL4iMR
 c5nTzJbFccmNLwVixEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106


On 7/22/2026 12:45 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 21, 2026 at 11:02:25PM +0530, Vikash Garodia wrote:
>> Document the iris video accelerator used on shikra platforms by adding
>> the qcom,shikra-iris compatible.
> 
> iris here, venus in the compatible. Please decide which one.

Ack. Should fix the commit here to mention it as qcom,shikra-venus.

> 
>>
>> Although QCM2290 and shikra share the same video hardware and overall
>> integration, their SMMU programming differs. QCM2290 exposes separate
>> stream IDs for the video hardware and the Xtensa path, requiring two
>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
>> and Xtensa isolation requirements, such SMR masking is not applicable on
>> QCM2290 platforms.
> 
> This paragraph suggests devices are not compatible. Will Shikra Iris
> work fine when driver matches with qcom,qcm2290-venus?
> 

Validated shikra with qcom,shikra-venus as fallback compatible to 
qcom,qcm2290-venus.

>> Since shikra uses the same video hardware as QCM2290 and shares the same
>> programming model and capabilities, it is added as a fallback compatible
>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>> two IOMMU entries.
>> Common schema is updated to accommodate the iova restriction of 600MB.
>> VPU restricts usage of 600MB for specific streams, which could otherwise
>> lead to device crash.
>>
>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
>>   .../bindings/media/qcom,venus-common.yaml          |  5 ++++-
>>   2 files changed, 23 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..b27899ebf164229ceff1ca5cda50ee30d875e953 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> @@ -13,14 +13,13 @@ description:
>>     The Venus AR50_LITE IP is a video encode and decode accelerator present
>>     on Qualcomm platforms.
>>   
>> -allOf:
>> -  - $ref: qcom,venus-common.yaml#
>> -
>>   properties:
>>     compatible:
>>       oneOf:
>>         - items:
>> -          - const: qcom,sm6115-venus
>> +          - enum:
>> +              - qcom,shikra-venus
>> +              - qcom,sm6115-venus
>>             - const: qcom,qcm2290-venus
>>         - const: qcom,qcm2290-venus
>>   
>> @@ -45,9 +44,6 @@ properties:
>>         - const: vcodec0_core
>>         - const: vcodec0_bus
>>   
>> -  iommus:
>> -    maxItems: 2
>> -
>>     interconnects:
>>       maxItems: 2
>>   
>> @@ -65,6 +61,22 @@ required:
>>     - power-domain-names
>>     - iommus
>>   
>> +allOf:
>> +  - $ref: qcom,venus-common.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,shikra-venus
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
>> +    else:
>> +      properties:
>> +        iommus:
>> +          maxItems: 2
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> index 59a3fde846d2196ab1e4588eb396012ba6860712..0be2f9119e78233928d23af86836ac294aa769ee 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> @@ -37,7 +37,10 @@ properties:
>>       maxItems: 20
>>   
>>     memory-region:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: Firmware-loaded codec carveout
>> +      - description: IOMMU IOVA reservation region
> 
> This adds second region to several other devices using
> qcom,venus-common.yaml, thus should be its own commit with its own
> rationale why all devices take the IOMMU IOVA region now.
> 

Sure, i can split the common yaml as a separate preceding commit with 
justification on need of separate IOVA region.

Regards,
Vikash

>>   
>>     power-domains:
>>       minItems: 1
>>
>> -- 
>> 2.34.1
>>

