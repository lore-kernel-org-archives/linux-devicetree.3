Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2803C342D
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927375; cv=none; b=hATY98kqQYQOQeFN2FGlgN0F3Eq8sOvPamqp84c5nGXtfbipc3rpj/4vrNtN+rzNNlVEgXIUWmNWvYp8USNa0qXaV5ThOb51ctEx6OoHnOjXjObd3G7E9urao3pzvtaicu+5kus7c1DBmjdrTVtl5CRLexi/EBLBYeoxaiRyHvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927375; c=relaxed/simple;
	bh=7eUwF3VpozAWjRC2kEOp0J91+kRbU/gNOu1dAGf/Pjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHLjEDxeQqTWc4+US/avsr0Pfx8e3r66mZ8knJR6Wqds78s0XwfHnBgM5e2+719qYFa2Rqu5NXjkyD3QddyYt0h8jeHr5L9ygfBPVJpJECdpv00i/MpPPFaoQsb1FAqu57EQA93vyYGczSD96g3VCz2CF0ZP8RRz01zeGvmfNgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wdo6rjfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jx+MB5ZF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wdo6rjfu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jx+MB5ZF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR4BQ3336023
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 14:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	si0lI3WfDCA17zxk71mM2P+Dt0kHG2CEwaIr9z/aN+c=; b=Wdo6rjfujIvTY/9p
	15eP/N8LMz5JgDuO650z57EpNpNumTWOFRlwRw47+U7B1Wnti2d7+5nQBClu7T4U
	XnNYF29aWKIeuuBQE8QHfab58qqvIFP42fd7DPpPScWWhnmoEhil65SXy8Z9OTP9
	mr+lXNIk2RyBP6MuArSbQC9tmw792lSxJNBxTSiK7fjjJEDEvKsU5bpJdbN2AcqM
	FqWsL73tUtVOMWM1oMOJ0LCr88ysdaSxtwjmFAmxlvyMF+L59Xqs5onY/KmjTYP5
	KKT0vr/zeSz/y4bW3/q8iDRcVdpHNdX8WOSKl48WVNPIH/u6WpPrEvf5vaScL/nl
	EAvZQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun410pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 14:02:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf281d523eso33029265ad.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927373; x=1781532173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=si0lI3WfDCA17zxk71mM2P+Dt0kHG2CEwaIr9z/aN+c=;
        b=Jx+MB5ZFzp3SrAyL1zsml2q6YVpuh7XOgJAI1YPUPkreUAM/7W+liXp+qrJ2IDtIZ4
         7MNgmYDFRM6SAowMY68LDIYK9qfvVKa11adkfIahUvG+iQ2BsC+ColXc8Y6lvseCyJhr
         ZcmWGVE7BuC4hr+StL6UUwzr02/6IRsSxlEVr8B3A9u9Pel0wP2Po11vU2R/27nXU7HP
         KgaMcSZHCEOevM5aGJMtM8mfZqsyPAMzpwpbtRNvuhLpLH7WsMl9rXMgympRz85vQsAz
         kY+x+m5fykQyQuVj6UaiarRyguOgz+jJjwqQWYFQWYjnzGmyt9XKJz0Um1YtCSfiETTK
         Z1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927373; x=1781532173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=si0lI3WfDCA17zxk71mM2P+Dt0kHG2CEwaIr9z/aN+c=;
        b=NrrCLegjrDgwJ/KXB327afCv7f87j3Le5pzWQg/BXT1JhurAgaa32++p440ziDXMVg
         T7P4HPZMCrpMvEfYoxKwRJPJ8cUkhB7n9POAe4xlyi/frl8FEvzbKkMCzUbnT57GTaAm
         rUF28IeGuEkNNgnM+zQva5X52UvMXHe4266rBB1JzTMFXt+UvAdLTl2EONmGKR5Lu6xf
         CksSSrKB5z6Hy4074whg5NzR4xIYbQ+DymNEQE26mPyqeVRA/rhnMM7pbuEtpCRy6a5m
         vAgJq7r4pDicfvbDxLOEJ3grwqLPVtK3YaVIJCfzlJjwVUs/E331tcNKibQ7+H7IXID7
         JOlw==
X-Forwarded-Encrypted: i=1; AFNElJ9HUQ0xkVSpR22frKgrB6OcY5AFG1dJJfjbSAkjxi8SGA8gU2mW2W4KMGj9VRXCx/J2i3T+PXTdLuwN@vger.kernel.org
X-Gm-Message-State: AOJu0YzBV784Qqzq/6GUE44T307R0g3kaBCx5xo+zTZL0ZlnueOC8FcP
	gsmWOry2rAh9UfnmxSC7u0+AZa5kNgWOIqy0vDjrLe3Z483vSceBMn9qWu6tuYMidR6kcKto4fG
	Onr88jq9MuAHvcxTsIbcPmhWPs5Z1F6Ri50ly4G8ybcEI4kw58PRjn7L4oMFrNlDG
X-Gm-Gg: Acq92OGKF3nAU8bgRFoIYViBjKdigqumE4LPMBlYGlGvA7GvmWwXM4pUAb7gGlh0yAz
	GOH/+71d+lB6v2+ZhdahrTU5OwYm/psb8e0t2k0Tp0zJRrd20PIdBePfsd8CcmXn8WKnfBG5On2
	3nYpBmMtfentZZKK97Ww21/rB/ug8mhYlXIB8ob/9pnh69IMDq6Blio2ye9/jOYxEkc0Jp4qzQQ
	LVboa+sNu6voUAKWBZfoNYt6f5OJ72fef0rqSOlrBVh/vzETDBT8W+Olx20KCob6KGVMHkxJ/Tg
	OaoQhIu0DyXPO9jRicT4xuF5pESue+Z6HDGDGsYl+at3cHDUxtG2mWickxgQ4Nk81WHMqgY+OL2
	T5BJtcOAxJr055cJnb3z5m8ZquqVK4tFEh/eBJFnVZ+dTJNmHwMRyZhQdh6MP
X-Received: by 2002:a05:6a20:2d14:b0:3aa:ec1c:84e5 with SMTP id adf61e73a8af0-3b4cd09ace8mr18854508637.43.1780927372824;
        Mon, 08 Jun 2026 07:02:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d14:b0:3aa:ec1c:84e5 with SMTP id adf61e73a8af0-3b4cd09ace8mr18854371637.43.1780927371975;
        Mon, 08 Jun 2026 07:02:51 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm18010993a12.1.2026.06.08.07.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:02:51 -0700 (PDT)
Message-ID: <a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 19:32:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
 <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
 <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX3pOI56cmawFH
 NkxkTWrVb5nhrUzAtES73oLWvKXPNqiEMpZoSedWh2WpyMEr9shBnmsF3/LvbaJLG8MnhG1ghes
 iPtIEb/lDzKZeNUXiLkOClXQR3E9DBF+03GpTfTiWk8qh5EI0dW4DQJVVcChbuZ9GOO9+p3gToa
 XerS2Fh1aCQvbx51T3edLYd8SyrpwKAA3BP2QZs6yE8Usk0NNwCjrup02Q8+NFU9WVkHWt6aqh1
 nHQzrEJepaGNqUDPRxF4+SWKyDOV+mzoD434Ecm7OQkHT+7LdJ4BVFnDD+x1O0YY+ulQRUbp2Br
 lFtBAMVpnquHY6tOh3unwK9S9oEBd6EufK45ggDUJ9VBUu3HCc6TfQ9BTe8kCV3EGvSpRyy7Zsz
 UD85+rszRnfZ5amA22xivT+bHD41YIWY5m6UXWyfWp8Uy5ha/f7qRwD97dEjegKx2Q80l7E55ZN
 nsZysnC0TBiABPE31+Q==
X-Proofpoint-ORIG-GUID: JR6U66bRlzuOLXbHxMwHpbc1yQskTdBG
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26cb8d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N6J3eu7hh-G8EisLkUMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: JR6U66bRlzuOLXbHxMwHpbc1yQskTdBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133



On 6/8/2026 7:19 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 07:14:43PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
>>> On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
>>>> Some SoC implementations require a bandwidth vote on an interconnect
>>>> path before the SMMU register space is accessible. Add the optional
>>>> 'interconnects' property to the binding to allow platform DT nodes
>>>> to describe this path.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>>>    1 file changed, 27 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
>>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> @@ -243,6 +243,13 @@ properties:
>>>>        minItems: 1
>>>>        maxItems: 3
>>>> +  interconnects:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Interconnect path to the SMMU register space. Required on SoCs
>>>> +      where the SMMU registers are only accessible after a bandwidth
>>>> +      vote has been placed on the interconnect fabric.
>>>> +
>>>>      nvidia,memory-controller:
>>>>        description: |
>>>>          A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
>>>> @@ -602,6 +609,26 @@ allOf:
>>>>            clock-names: false
>>>>            clocks: false
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          items:
>>>> +            - enum:
>>>> +                - qcom,qcs615-smmu-500
>>>> +                - qcom,qcs8300-smmu-500
>>>> +                - qcom,sa8775p-smmu-500
>>>> +                - qcom,sc7280-smmu-500
>>>
>>> This is a list of targets that happen to be supported by QLI.. but should
>>> this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
>>>
>>> Perhaps
>>>
>>> if: properties: compatible: contains: qcom,adreno-smmu
>>>
>>> ?
>>>
>>
>> As of now platforms where the issues [1] getting reported are added, the
>> list will grow.
>> <We still have to evaluate and test on other non-QLI platforms hosted in
>> upstream [2]>
> 
> Do you really need to test, which platforms have an interconnect, or can
> you predict it by checking the SoC documentation? I strongly belive, the
> latter is the case.
> 

Agree, for interconnect path we can surely predict from the SoC 
documentation,
But for the corresponding FLAGS/values (MASTER_GPU_TCU, SLAVE_EBI1), it 
would need some testing before finalizing the change on corresponding 
platforms.

Thanks,
Bibek

>>
>> [1]: https://github.com/qualcomm-linux/kernel/issues/297
>> [2]: https://lore.kernel.org/all/a437f9f9-3560-40f8-85ea-35433e33c428@oss.qualcomm.com/
>>
>>> Konrad
>>
> 

