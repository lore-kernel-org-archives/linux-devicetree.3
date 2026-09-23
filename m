Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6893A1B142D
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142112; cv=none; b=NVwuzRvVinNJguwBYdcOaBeJGZ8bfPWiTAvNxiVm86EV8EhX/BRzF50C8fF2z2HdVDKEyjeKUE/4tiXqSS5qwcQbfLmi4j7Y3FlzSuR/hCaBFgZtyPcl/Jtbj5wUHzl2tbrM6LmKRc6oB4zfAHIDNDBpb0qjUJ4juqQjT9x4pe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142112; c=relaxed/simple;
	bh=UIAx05CZrvM8N5t8BucuFcjpo4iq7isDMnPF5+mhZsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2Mu5AkCkYJNxp7zYdJKCGP2YV0Htz6rQN1XGPgt1ZfsXFtwOGFcB1XEQfv70pn49Oc/AVnW1EbxBCXLZ+Fe19ApZboiQkyBettQ87y2SW8H0AOfWiGYS8wlF7ypMr+1vt8Usr6KpPYWodX1NF3ZCU2o+gu29FU244ie/hXIgwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxKFFDsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOumyeZg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxKFFDsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOumyeZg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iV6B1399322
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/aKOtHIofqNw5/DRlGI2QTk8pCfM57nPrUMsZyHrh4=; b=jxKFFDsBPSA38++5
	WNRY7oUGBrf7pXW+w8jns5gCg7oMJf1eOsGgCAG2O9O69HB6zn5B8Iw4SpArKzyV
	9nCxPYSnlYarNwO4WcM/o0jDT0vcJgjMKSqVLYrzA3FBOpMrEf4xJUFHCTdYup7C
	QQjlOrIrbPvorCFvHJrgO7+FaTMeTxyEY41/OgulmmDx0f2mVP9g62P4Kgh9JJao
	ZKtMv241Md2x2swRm8JzOjpVboawXUNbGc0zpGmicNmeREIYRYAyBGa8XNzgqZPw
	4lrNNlK4X8OkvgSOqP5cx9QDMU1kUg/+vqYwf+J8BMsnLVBHeFifscBqwnq9hZlG
	mjHXrA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec3rfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:41:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3284bbaa89dso2075290eec.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790142109; x=1790746909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/aKOtHIofqNw5/DRlGI2QTk8pCfM57nPrUMsZyHrh4=;
        b=ZOumyeZgLS1QN4FKFaSHhVVDwslLn/7oFQfBpqylLhBEFrTGr4FT6b00UugXWFmVfj
         pLqYNgzWHfGYlL3wFuHiXFOJBX/Sgwnq7/+6EMSXbNhNaUeVbRYeL9sULIBShXMd7zva
         duoX3DQ72rQaVoUBIOcDkhKqaXR2qzf3xxOSerN2haPl9OwsGhxAivws0ZclJY+yqbhl
         Jn0kSusGzXgkVe9hnD3X9jcrjWOha4IhibM8qXuxTsOtYfkTCUdPUieZnddcdPJQbC3R
         cWNUMMbiDE6E92ZCqjN9GkKC3BwS45KqEF7Kuv4CPTHX1ShruNnQmBcM/eqfeOGxv/Eo
         LKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142109; x=1790746909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/aKOtHIofqNw5/DRlGI2QTk8pCfM57nPrUMsZyHrh4=;
        b=XOqZBmBYtRCpkDuKbeGKAC0r5hhL733CuPZKM7r1//UY5kesnGMg5bGGUXbAYxX2Bp
         PzNC9sswjcSX72pPUdv8lqzleYYFRSzMuyOyzUF+zGSLmRGi2sGdKtHYwFNozEAkUuHb
         l4eKhkROJYfJmso8TDeIRaiAPxenxeGmg17kr7tYBYmU9lifDo8bv+o4fUX3KSf7zgxP
         38fgJD3EJLOic2haQ08ZjM2fzFvzGjcW7vQGAEwgkN0UOYlholSxN/xcMiJsL8RmCI/N
         m+bRqhZVqoIdJvyhvJnXg6gAAtd9Mf24W2YQV382cN6pt36GnK0kaqtQZoPpKPrUsZ5j
         7FCA==
X-Forwarded-Encrypted: i=1; AKwUvBxn17+WQ1f/kUssCGECT/LofKF0BX1WMhvRy15dXTFucKf0mKMKsHxt0cT1uPKgf2YEGYdRdKCdEsEF@vger.kernel.org
X-Gm-Message-State: AFuF++nlR97BcGxANMMzZ5bNP1eAGjGROUJzj4vRAOuh7Khn1CK8ofMQ
	h3JaSg/AEhhgoOGnnbLjQwtT1PTeFicj0bvGvH6OQZTkNkQ4nAAHJ5izU1k2DwgtWiMovXeTc6C
	5gWm+4osSesgBQdYxys7j1Cy6xkpZD8o3IGhaEJHsq0kzIHLQgQQuKqjb+4Vhfei2
X-Gm-Gg: AYBFou1GU5mZrqSUEVYZiJndf6VWe/85nv8qzXCeUdpN19e7rGLtP4F19Vo7dd5SIi5
	8ufxM+OzJ4yzimoF19vrHQ0egVQZePB8NFPO2p2aDf7jite9zWyYumCKG59MQ3ryxdpMdZSb6e/
	kds5AjdRa3V/uglIU+TmMpKW2yJO/Tm3x+fPiheR+Xykxid280H9IxGt7YJ1KY5CvGpaSzyNs0q
	02V93EqEwWRg7T6GKef26mEuNt9smeZ96SNElXMwLJYUBu4Ua4N2zenN6X++BSOsMZ8YkAqXQX4
	zkotSnh8VcfxamI8sgqCpz10OAdJwUq6vHuhQpiqU/ueAjKWrxeUXLOUGCM7epHGyhL3C/+RWc1
	XT1fyFbt9L8s9GE3p2xHtytNxPgMiOFg=
X-Received: by 2002:a05:7300:b291:b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-33e8e69cb4bmr1709649eec.40.1790142109035;
        Tue, 22 Sep 2026 22:41:49 -0700 (PDT)
X-Received: by 2002:a05:7300:b291:b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-33e8e69cb4bmr1709602eec.40.1790142108165;
        Tue, 22 Sep 2026 22:41:48 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm3193280eec.12.2026.09.22.22.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 22:41:47 -0700 (PDT)
Message-ID: <335528fa-72b1-b61c-a2f2-aa1e15c8f3ec@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:11:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 1/9] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com>
 <pk5j7gr5m23eocsliy2rtqcwbtzonzxidxdon7w3doysgehiiy@yxtjrrp337ex>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <pk5j7gr5m23eocsliy2rtqcwbtzonzxidxdon7w3doysgehiiy@yxtjrrp337ex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyMiBTYWx0ZWRfX8erzcaJYVMDI
 An2X5aEf3O0/ma+P31EWV6eYCxoNt5890XOkHtESFNIbmCwNrosBK/B1N1fpleJePWSzfTkNPb2
 Vy+xvZKw3wCWR2iQ9G4f5C+8id1i9wRj5PpAtz0d5MXVYGZhs+X9uqNzo4upgKp+RaBI55Mf2TC
 ntIZVbQeU9g5y8Hpq335+ws0CNmh1p3+481HgBwobToH3BOjfXAm35TvJSgnTvPsuPKMbZw6AiK
 Z28IIj7XfzWJYDZDz5ZqYoeneKv1eEZMQw9mPJPz5kA8OHUxX/ZtiHKsMMt6Fh/1WJZoy8FpZmo
 uFIufRgYmrjrQwgNOed6oEPqaeRxHVaa85cRsNmzS30f6avKJYU8pvIllCpVgYsNZdr1onFbD64
 xZdBISSxNGA1xpA3FzmyKnv34RCJBmG9JlMqpgaEww+sMkf/dLVJEAHbqSHSULr+y6/DzUOQUQT
 z/mqYbXn/25WJ38rXxw==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab3669e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=6X4DAO4X2HBH6bcfxsAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Q3QA3q9UBZiSiec7gRMLE9nKsfZT0DfR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyMiBTYWx0ZWRfX1tLITjrgJZRC
 aa+L1JmHnlNCfc++4GNgEVZEM5fvCryfDjJ+kWjkyctMG15j/DeSG6A5Ot9kujAojp/GzT/vm8U
 uT4IYJlEj8V/BqAyzPRrJiRS8LRQ90w=
X-Proofpoint-ORIG-GUID: Q3QA3q9UBZiSiec7gRMLE9nKsfZT0DfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230022


On 9/22/2026 6:29 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 17, 2026 at 10:30:20AM +0530, Vishnu Reddy wrote:
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence. The
>> current maxItems constraints for clocks, power-domains and non-pixel
>> iommus in the common venus schema were sized for platforms available at
>> the time of authoring. The glymur platform introduces a dual core
>> architecture that requires more clocks and power domains, exceeding these
>> limits. Raise maxItems for clocks, clock-names, power-domains,
>> power-domain-names and non-pixel iommus to accommodate glymur platform.
>> The glymur platform specific schema have fixed constraints for these
>> properties, so the common schema only acts as an upper bound. Since the
>> common schema now only acts as an upper bound, add explicit maxItems
>> overrides for the non-pixel iommus in the qcom,sm8550-iris and
>> qcom,sm8750-iris schemas to keep the fixed constraints as before.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  .../bindings/media/qcom,glymur-iris.yaml           | 218 +++++++++++++++++++++
>>  .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
>>  .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
>>  .../bindings/media/qcom,venus-common.yaml          |  11 +-
>>  4 files changed, 236 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> new file mode 100644
>> index 000000000000..de4792f3b658
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> @@ -0,0 +1,218 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Glymur SoC Iris video encoder and decoder
>> +
>> +maintainers:
>> +  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> +
>> +description:
>> +  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
>> +  decode accelerator.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,glymur-iris
>> +
>> +  clocks:
>> +    maxItems: 9
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core_iface
>> +      - const: core
>> +      - const: vcodec0_core
>> +      - const: vcodec0_iface
>> +      - const: core_freerun
>> +      - const: vcodec0_core_freerun
>> +      - const: vcodec1_iface
>> +      - const: vcodec1_core
> Nit: is there any logic in the order of the clocks? Why vcodec0_core
> comes before vcodec0_iface, but vcodec1_core comes after vcodec1_iface?

I followed the clock ordering from the SM8750 binding for the existing entries.
For the additional glymur clocks, I appended them at the end and kept the new
pair in the same interface-before-core style as the inherited clock list. That
is why vcodec1_iface appears before vcodec1_core. There was no specific
functional dependency intended by this ordering. Let me know if you have any
preference on reordering.

>> +      - const: vcodec1_core_freerun
>> +
>> +  dma-coherent: true
>> +
>> +  interconnects:
>> +    maxItems: 2
>
