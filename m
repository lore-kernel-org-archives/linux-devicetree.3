Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8C38F64C
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926293; cv=none; b=H8NWuBa8HmOyfwMa3FCgixqme/R8NvxvWL2VgLG2FcipfiLNRUewhJUAa9+jxBUgjfVXqHWmTVjNkF5h//YteCAb/0acE3JN/Mr6tM26eCpwkxz4Qu/Ppkk2v5gsXx6SMzMHOsZgnTGDqzAPmLDtxvbeuGaZYpcSg9g8tCVLg/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926293; c=relaxed/simple;
	bh=ADv8HQSn0bAWEjRLgvvHbC8lDudXzS5pm8sdS5zAgW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBfdexRZBkO5IXGUpjPeUEKi3tJ4QKUhVmNXadf5lLLkDCJTe4KOxzEl6HGB9ts64BoH2g2womVwpX2ISOhkGADdlCgS4eowoXZ0Y7Gs3ZFG4QASvVMil+PubrzbzU8Ltig3EAf/XUwCh2hYug/uLMzd9mk3TBtuLmG+U17a+0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rk4qYFZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=deJIO2/i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rk4qYFZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="deJIO2/i"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRaFi3230480
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UBeLLeGd6D9gfelgbASleoaGWcIHd60b02pysLN6WeQ=; b=Rk4qYFZpGnlkGGw0
	R3e/WBEm9RaoOSBpuO65hpi+rZ3tPqtV1E9zMZ2HqK9xdim43SifwVfqbo07GHrM
	Ju5dw0NOumxW0CEDPfaJ30J+lDNgKkUsoF6WCZEh4N2Wb+KMRfa+QRgFkprQWFTk
	iunZ+6qnCMVFMxu6pAJ0J+3LTJoDbpyT+cZYY//NyyXHWArvYc8qEmuRSgBDCUux
	NxDFHKhAJG0LCkk/eAKucK+LXxCAKcQabgOugfozTymldl8iDtm48NhNCrktjlqA
	ATL+7rp16SUgQIXbWD78hULIbIGtCx85dFsMd2JLM+KhemVstOmLtODKZlRwSbrv
	GPetDw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgywfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:44:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c3315d31so48014135ad.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926290; x=1781531090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBeLLeGd6D9gfelgbASleoaGWcIHd60b02pysLN6WeQ=;
        b=deJIO2/itOhtBIAbxLDxAUzKkKlxWAVh5Cz678maO8NHAAdjYRHpxi0nGTDiFMXrNr
         pWhku8OjzLtPGMcJ59ZDAC/QuzHBOQwI2WLYbHzDrnisvdtGMhp2ui2isp0Qte3L/cY0
         tWJOAGZxzQA8n5ZcxFnzZMYrDdwxztBuZpE8LNCcYbzPLayA89dA/P0VZLMg3WyR/L3o
         3oKilUn0woJepG/xmcOeO3hblCNf+lvlyLYIlHtU88tUIsxcE2UjQzqiVvXpO0qkyvM3
         K/aJhe4+786hmwP2BDRhzP0S7Gt7J2zlbNziD4YkLoxymFa/MexeU/1C2QimF4nv9jvg
         YA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926290; x=1781531090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBeLLeGd6D9gfelgbASleoaGWcIHd60b02pysLN6WeQ=;
        b=HoPNHw+Gm9PtjLCVnEY+eHgSr+sHPGKkgue4rBkunNJkxePyhPdKwAI64OD7j5NsVq
         hpEquHwKUJ0A5P8xB+l/cpDkI+RjuIb8kz5BM+OORrcgPUD1PhdU035G98k7FD0EZEoa
         Egchi5/0lAhKdUU6jYjKpr1cYf1wPP6RnMYd1irPnP4uHB5mz1B/doSpA2N5MPZpgrUV
         OFoP5zN4vFW5WSx1NunL/BECPhPKOREGV+lk34l9LT6ihs8IXIbDu8Z4mmLvt3HLgMzl
         qdaZu0Jtrwsxha3t+ewTVdTsev0D2q2Unzyj3haYk1V9kS20pgs+928zfSsrVNmRCEUb
         iW9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9G4VnHdeCqwDStFjoRv+Uq+gCTjFbqCDWrN1zIWStDpJoYJFUQMy2IBgXwaZzEkX2COt1b46BTJsnv@vger.kernel.org
X-Gm-Message-State: AOJu0YxLgPXPwnf5X9Q+xYOXCxSf+S8IQFcJZSVVLYAOswgoY2ymT4ag
	3IS7rcmqStfjllsPS8SnKQlASJfH+GQiS0/27om3IC/k6VZKkB/1HmAG/nN3hcxY8GaUhZHv9Q0
	21QkfNSiAdwJT81J0O2suPHDiRSa6Al8ymHWvF5BrXS0aU27wfsCj33PECxAMWuHj
X-Gm-Gg: Acq92OExsSj5ZEb0FPdOQFIgh8hbHgdVfK9OYXzp8SCtDOFp1+WZlneS7MZKIyjJU+W
	F7V32z8e+pcZC89HfRCne4qrPkxCuRO5KmL/B97K+pPGbM+EDLFVP44RksTPwDclKyJH8G0YXF/
	wa9Fq5E2bEqnPDdq/brq1mWMujDClQQjPhu3cKymkevh2wLOWQocZc1jLrGL/yMU/SpFn2EHOxs
	u/5UBpbdAO+DYkeShsOp3Q0izptMmVoXUjjZ3bwtFXi+6qzEt2DkAXhDODfb4HfZr3wzzoT+lqU
	oFyZEGCVyIBW7bQkxN480KxOZZ7jHmbBQLZnKOVYvG/W8R3oTiN3GuTcNI7eMnzJRVQmfJxVcvK
	45mrszjfy+dd8RYpq9iYSdKpM+YN3cTdjaxo4E6hyYW2Eap72FsxV2wEqO5lt
X-Received: by 2002:a17:902:f543:b0:2c2:27be:39a3 with SMTP id d9443c01a7336-2c227be3b4fmr113831815ad.29.1780926290256;
        Mon, 08 Jun 2026 06:44:50 -0700 (PDT)
X-Received: by 2002:a17:902:f543:b0:2c2:27be:39a3 with SMTP id d9443c01a7336-2c227be3b4fmr113831305ad.29.1780926289645;
        Mon, 08 Jun 2026 06:44:49 -0700 (PDT)
Received: from [10.218.33.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f88473sm200506985ad.25.2026.06.08.06.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:44:49 -0700 (PDT)
Message-ID: <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 19:14:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26c753 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nHMyhPlvQ-XDY_K2CzoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: cC-JcXULIr104tWCJKDJcNe2QqCVTaSR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMCBTYWx0ZWRfXwPhkHnErZ41l
 DY6OYzhXGf1wjqxdLyg84R7Ozl/K85K/he9hNxz8jUwmNPhpn2VAN0+yHatmyzKnpbmwLNDSQC9
 poyua4am6YLroe0BuO5OXcmQgNY8r2s7mBM7ihs72dy3pNRBGnxGezLM++oI8vVGjTqWr4qJFo/
 GBt6vJPitR+iTNs/QQ1Wm4P9FltuOXxG0dM4zkRc6lhNDe4RwqR9WI5XXxWBKHEaAVrkNKu1zeP
 I6kRzELoA9kwkNfB62Sd75e6isenp7rIRnRgVG4FlQok90ek8qlYYwF5LgSWoYOPgQKjZ+o4Hzv
 oueEKUVFVuBe806PGFWg9Ek2KEKZzeJ9tLQTeXw3oawa2/SUwfdniQ85O0T4XJjYDfDIGxww8h8
 PunIFJTyhwPfJfvQkLPU153500aHvzZ/9oacSwDfeuUo45nKU0hVhJu654OuWAwTOQPjK7gBRfX
 sxToqX/PiPJq9fuccvQ==
X-Proofpoint-ORIG-GUID: cC-JcXULIr104tWCJKDJcNe2QqCVTaSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080130



On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
> On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
>> Some SoC implementations require a bandwidth vote on an interconnect
>> path before the SMMU register space is accessible. Add the optional
>> 'interconnects' property to the binding to allow platform DT nodes
>> to describe this path.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -243,6 +243,13 @@ properties:
>>       minItems: 1
>>       maxItems: 3
>>   
>> +  interconnects:
>> +    maxItems: 1
>> +    description:
>> +      Interconnect path to the SMMU register space. Required on SoCs
>> +      where the SMMU registers are only accessible after a bandwidth
>> +      vote has been placed on the interconnect fabric.
>> +
>>     nvidia,memory-controller:
>>       description: |
>>         A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
>> @@ -602,6 +609,26 @@ allOf:
>>           clock-names: false
>>           clocks: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - enum:
>> +                - qcom,qcs615-smmu-500
>> +                - qcom,qcs8300-smmu-500
>> +                - qcom,sa8775p-smmu-500
>> +                - qcom,sc7280-smmu-500
> 
> This is a list of targets that happen to be supported by QLI.. but should
> this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
> 
> Perhaps
> 
> if: properties: compatible: contains: qcom,adreno-smmu
> 
> ?
> 

As of now platforms where the issues [1] getting reported are added, the
list will grow.
<We still have to evaluate and test on other non-QLI platforms hosted in
upstream [2]>

[1]: https://github.com/qualcomm-linux/kernel/issues/297
[2]: 
https://lore.kernel.org/all/a437f9f9-3560-40f8-85ea-35433e33c428@oss.qualcomm.com/

> Konrad

