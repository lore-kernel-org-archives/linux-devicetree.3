Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA11B3750BC
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783663356; cv=none; b=Bd67CORNowEYDW9n8/cKcQgM0NRL+YdmaFZb0bTOW6UhTzYP3+2BO+FYOt7IQi3qXSzPoFeyXqd15qRPkAGyZ1EUZ0JCA2kTPCxktyYPIe228IwV3j23Ia2vdsRJWH/OdCF6SObcxypG0ooYLye30DHJOKwFxHZyMWHt39juiEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783663356; c=relaxed/simple;
	bh=i7+MyjZgf1Jk5tAroKpSXu+vfaDFclqPoxtKoJnBnec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNI13ymhrfztAcGpTW44H2DcmbsvNUQ1qt0zsjlXFZqFx0GM0K9/JMSpz1ahwOSzD3mmMdR/HyamdKeUieoYZH38zlZbWvP7rUo0MDELr49ROkVExA1Ez5fcHpuiswOpUBGbtX+WwDmphtMY04bVphXtGRhhC0XixxyEDjcHQOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GK89rhVm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IK2YOHeP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GK89rhVm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IK2YOHeP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3mjQK3898570
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dOKL3wk+8CSlHBP7DE5WbezsfbSE3CiEC4lz+wAgE0w=; b=GK89rhVm4ZGbKmHw
	5MKAfahQkB/wtQ5ezHDeVLGVOjD2DBhN5U4gdO1bJaJpRnXDlJ37Oyp/W6kJ1nby
	PoPs1opZy0cG5SRkIsRTyUADgiXMx8MZjaBA/7IWbN5d873OLYs3nbaYsOPqgU0w
	6Zz6d9eqbW8wG+rRQ2ScQCBxFnuVLkzV5ef3Iv0uiyuuU3JNi9tI5zOkIamTdiQm
	oDLXkcwhiZX58jDIalrY4k5OIt0PUtQIMo8czj8AmDcQOu6CUFYzBNOdzfE3z795
	fyJljcRNweACkKE/dEbGvbMsCVMuc+VpEMzGAscnHbTxJO8zXhp84ciim6mMABi4
	/YfpkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3k0xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:02:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d1cae5939so68543485a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 23:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783663353; x=1784268153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOKL3wk+8CSlHBP7DE5WbezsfbSE3CiEC4lz+wAgE0w=;
        b=IK2YOHeP11sieMF9Uc0nToI3fPyTIW9SPcsMW+Ns9eQ1qYwj1VbgjJPhov6XH+aY0Z
         fVQDQEkAXtq9bPSzNoSUBl7RGW1Qtm0kN5TTfgvqEKmLE/a0MTvlV8etu8jNDgDdrU4r
         C9BNL9mzfDOaWe06yGIv89Gbv4xwOHoPtaViYJ/Y8yHgpvhdIQztHb/sDR/15eEp40ZJ
         mUaFU/xXxTNnqOVPWHNWxZkQo00IKsjwe0xQ2tsA9o5nl+DDzhfKR3iLmH1l2gFGKLmc
         TQBYZ67PsxiFdfdLWiO2iOlakmxe+itNfeC1deJYTudHv2cHVhLa9A1MxpRsm9C8jXFg
         UuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783663353; x=1784268153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOKL3wk+8CSlHBP7DE5WbezsfbSE3CiEC4lz+wAgE0w=;
        b=ERKtt37Jt87LKSm2MAwJucot4oqwNg0i4rlfzr80CB6Pz38OLxdsz4DOo999uwu4jz
         9JUUGj2NIAil+UnSc0Yr+TAZhVtpXSZSGhqcppF8C/JSPb8zTmWzDELrWHXS7VYS8Ek2
         B4I+La+Sd+Gwt7V/Ifj9pw2VjoQXjDiaBFns7nWWW6136n8IWZNsXliVuNVNpSlSZgi0
         U5WbMGLuCpG/KcJC+114LTfyWGiT14LlV1kS/cPsK8QmGvAAyCU2ga5F0omWRPfB02Fu
         lD3zVqIzmiRzFPJzCBDMUDCiOvAQKNG4Pu6i67AAwL9K8jJlVidiunHyh25baBcDFTy5
         L/Vw==
X-Forwarded-Encrypted: i=1; AHgh+Roy1cWr84Q4cTC1hC4zi13KntpYkHmUT7Jvsdsxdp+hF/ShtGgCBIvXSBAQvjheF3dChLqGN2a7bgis@vger.kernel.org
X-Gm-Message-State: AOJu0YzZDEx5FsEWoNwcBgDi08KEPTrui6td45bIKVR6vrFQOonnetvB
	xnh0S3CnZz4YRJy85YPPlCN0w3RNbR83NZqEs+Nw5C42FDUNGvtTeGZx6bS0xUPIPvRDeXagPTf
	CBHaRkYt8lwNHzta9QXQd+mVSbuFpc4DIXb0vFNS4CaqRrLhjUcpXMq1uJZbamqBQ
X-Gm-Gg: AfdE7ckJvWCvB/5WPcmzGFtEWqVBO8jQtSV4tv81nMjMsjT85a9osPutZosXVWiVl6W
	DhomBmNv5RgiLIjqrKKzumK25D6dBVfWGm7tLMYdrc2MRCaVESZyli/PHLVmnOeWiJI+i1ptXRZ
	SQRcVMZ5jofzBNBxt96dTNsOAy0S8Vi0ax4ws1AdnzPcMrfg2luU5nxOXNZhuTYOd95xSlYp6iS
	Nv5xU6Fel9Y653K4+m07y/yv06HbgiZ9jXjznAuU7i4buR4aCCsIWMhzAOjwJAaZFd6u4GZFkAq
	xuT6xH7dJGa6rUwLKKWiC8sakNL6zo/ZwsONHE9zFZYmzVDplafxUcoXt8rXPxnfDW/YkcctegJ
	yNkNHoCm9Us8TArJLB4Q36SF66AtFVJZkViABdhP/Byr1Ng==
X-Received: by 2002:ac8:7e96:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-51c8b2aa0dcmr105230601cf.5.1783663353071;
        Thu, 09 Jul 2026 23:02:33 -0700 (PDT)
X-Received: by 2002:ac8:7e96:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-51c8b2aa0dcmr105229991cf.5.1783663352617;
        Thu, 09 Jul 2026 23:02:32 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.253.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d7a375sm10376469a12.15.2026.07.09.23.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 23:02:31 -0700 (PDT)
Message-ID: <201e8354-fc34-4d2a-89d5-8661a3a66133@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:32:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
 <h3kbrpbz7naivqv2urba6ai4sd7kpaqz7s7vxuxuktoc5q2ojx@u6zngnmrbenb>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <h3kbrpbz7naivqv2urba6ai4sd7kpaqz7s7vxuxuktoc5q2ojx@u6zngnmrbenb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA1NCBTYWx0ZWRfX6nU7T9U2PH1D
 O33FyHia64ASn83AiYDf86ECDJeClQvL5UmnqnL27FWPvk43TT2J5HT1TD3ZalbUKHSv2Ibv7JV
 8hgt4si3huc2A2bGgmu/5zTNvzFc0MGZ9QXQfSNR8bCJoJqSl9JBse47WJoSWG+b29gT0M4hjpI
 SAU9HcCHX0NbV1HET/n4gs7d+q05FqqaPTS+H8yPqPk8XVH9hwbhZUpVfe5/X9h7DJs10a+scqY
 x+nrWcl3+jtQiVDYwjQruYw6ozRrNhq20mlSjAghZL3e65PF3JxLLts4YFz6W6169uFeycPwCOH
 z2Go3bCVCdNwDLYVpBqomMSpHEfN4vstOuCN2hlKP3D1gxM1ER40UGu5JSv5YmfMxFxtK/rb5dW
 MNxtxO4n5VsJtbEuML1Z0h+GWp16gECmBAfDwy98sEHMJiwbPtbMV5ekQU54+Ww9rkJpy0mznhe
 s7Fm/oL+rSDNfTs4UCw==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a508afa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MoCqpHF70WjPNMFBpltNPQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=keBE5688ymhvkto9K50A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA1NCBTYWx0ZWRfX9lzTn8VE1Ovi
 Yh23brNKG5s+L9lj9YGLhIk+nwlwovqOzLyCU4Y58gIjWknUJh8MD3VqNMrm5OjZWHTgalhqAiE
 yVojTwRiPMUnUngNLw9w9n7TEdknOwg=
X-Proofpoint-GUID: l7UIsP6yodHOwbl7Wh1WIXPV4MPNzFLd
X-Proofpoint-ORIG-GUID: l7UIsP6yodHOwbl7Wh1WIXPV4MPNzFLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100054


On 7/9/2026 6:20 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 06:05:47PM +0530, Vikash Garodia wrote:
>> VPU hardwares have a limitation where VPU streams are associated with
>> dedicated addressable address range, as illustrated below
>>
>>      +-----------------------------------------------------------+
>>      | Stream A reserved region (600 MB)                         |
>>      | 0x00000000 - 0x25800000                                   |
>>      +-----------------------------------------------------------+
>>      | Stream B reserved region (3.5 GB)                         |
>>      | 0x00000000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>>      | Other reserved regions                                    |
>>      +-----------------------------------------------------------+
>>
>> Mapping a stream outside its expected range can cause unintended
>> behavior, including device crashes, as reported at:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> To address this limitation, the subset of stream/s are now represented as
>> sub nodes, so that they can be associated to the respective addressable
>> range.
>> The limitation could be exposed when running usecase like concurrent
>> video sessions. The binding have been validated with higher concurrent
>> sessions across the SOCs supported under this schema.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
>>   1 file changed, 63 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..bf4d24ce90bd38666704274390b98be450f708c0 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -91,6 +91,51 @@ properties:
>>     opp-table:
>>       type: object
>>   
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
>> +
>> +  non-pixel:
>> +    type: object
>> +    description:
>> +      Non pixel context bank is needed when video hardware have distinct iommus for non pixel
>> +      buffers. Non pixel buffers are compressed and internal buffers.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +      memory-region:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +      - memory-region
>> +    additionalProperties: false
>> +
>> +  pixel:
>> +    type: object
>> +    description:
>> +      Pixel context bank is needed when video hardware have distinct iommus for pixel buffers.
>> +      Pixel buffers are uncompressed buffers.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +    additionalProperties: false
>> +
>> +  firmware:
>> +    type: object
>> +    description:
>> +      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
>> +      VPU when no hypervisor is present.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +    additionalProperties: false
>> +
>>   required:
>>     - compatible
>>     - power-domain-names
>> @@ -98,9 +143,15 @@ required:
>>     - interconnect-names
>>     - resets
>>     - reset-names
>> -  - iommus
>>     - dma-coherent
>>   
>> +oneOf:
>> +  - required:
>> +      - iommus
>> +  - required:
>> +      - non-pixel
>> +      - pixel
>> +
>>   allOf:
>>     - if:
>>         properties:
>> @@ -177,12 +228,21 @@ examples:
>>           resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>           reset-names = "bus";
>>   
>> -        iommus = <&apps_smmu 0x1940 0x0000>,
>> -                 <&apps_smmu 0x1947 0x0000>;
>>           dma-coherent;
>>   
>>           operating-points-v2 = <&iris_opp_table>;
>>   
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
> 
> I think you need "ranges;" here. Also an empty line before the subnodes.

Could you please elaborate on what would be the use of "ranges;" in this 
case ?

> 
>> +        iris_non_pixel: non-pixel {
> 
> Drop useless labels.

Ack, labels can be dropped from schema.

> 
>> +            iommus = <&apps_smmu 0x1940 0x0000>;
>> +            memory-region = <&iris_resv>;
>> +        };
>> +
>> +        iris_pixel: pixel {
>> +            iommus = <&apps_smmu 0x1947 0x0000>;
>> +        };
>> +
>>           iris_opp_table: opp-table {
>>               compatible = "operating-points-v2";
>>   
>>
>> -- 
>> 2.34.1
>>
> 

Regards,
Vikash

