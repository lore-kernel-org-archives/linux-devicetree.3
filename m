Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB17259C80
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 06:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329255; cv=none; b=cNRifHAh6sn1RpTbyIIaOGmB/KG6253C3K020wW7f9ZRBxGpaI/ULvnMaL1SIU4zoTFxJ70pS64xQoslCytv7cSKFahOL+v9VhylNqxNLLRIABJG2hePylU6MSTw7fYmzX9NDY77a4GQ1CWtOTFmm9GgQzHIb6z64RKPX8lP+uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329255; c=relaxed/simple;
	bh=AFXAuSVH1GkG/HxqK6U8yiCLCayak7VVaCKNFKmgrN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsd5shEwri/7rD3GBoJFl+0AzSrTWMTKYJNJmMdf2DqHu/Loxdx9/2wmpabd4HXFf38NFTzYUa/lJYywGwGPL1riJSTIn2K3LKiL5oQ0rw2z6v5490xzIZo9ISn0SNrIOa4Si2M0GYiG5b43A2QeMOZyA61WG/wh/fE5cCj6nZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnTdOEq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jl644QIW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnTdOEq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jl644QIW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YNgo3630845
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 06:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YGIeLdp/aOOJVWwMgvngGzX7kWn5LzP/jqHCxVOKqQ=; b=MnTdOEq7kI+78wuj
	zwhFPlCpVtMXaKHUhgXeszWErVJKOV3L40/E5N/9cSvjMWAOvNbxbYbfowJ0JEy6
	lvl0mFeVjb+oYVNWeWGzO2aJcDDw8oMsh4RKXnQgAKe4uklfagGcjrFNfdECdhXk
	WPOf5asr4EBFr3gyVmxYM+CU7iZxpfoeSiM0DXDHYgxS3n0Xn7pe4ceN49mG/K+W
	+jZI7mtwJQeekQqhEY5VebZrkWD0SHjBk67BjRJmG5Mwjq/waz8ZrxOVtcCx3fkd
	DT+QnFVcMfR6YzCGSokys1VhF2zScmSCJUDCEXBV7uvCoEeVQRotNOg0i8uAMNci
	96zfiA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39cjbnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 06:07:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso855024a91.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 23:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788329252; x=1788934052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YGIeLdp/aOOJVWwMgvngGzX7kWn5LzP/jqHCxVOKqQ=;
        b=Jl644QIW6uQzvIPkEA4vTyfFRDvOi2kDlzjMt51rRH+FRAXO9bUgKLT2kbEBbAUjZs
         KZiKEOHRbb3S4R8qIB9b1IIhbFToF+4v9VoNib+jl0XwglVWKwlMt4z3Dhq/I72EDkdx
         bNvUEXgEUV7hvnnfIYgrJYi46kTdhH5iRMrL+FNFU9vEOH/NnelTN6OYIBtPDMojFbzh
         hlJM0p3qah9MJa7/WIEvI7+1aJVnPrnytvxeqo6JphfDQP5c0G4tFXFr4qSO2IKhVA/p
         Pcq8H+31tRx6wOPPAX6SrVITEGD2obBuBguj31eHQkBGjNLZGYbNBFJrLGFd1+3rtrwr
         mOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329252; x=1788934052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5YGIeLdp/aOOJVWwMgvngGzX7kWn5LzP/jqHCxVOKqQ=;
        b=rMMp/483yo5NaZtfiSGqdf2MdqgRMSDWkhFcofaKh9dy7U953an1Qkl14cnxR18YkK
         itXB0VFxB1b74fMeMDpEMaZpQ0fwOX1O7B6KpoTJRdqxFWUHPwM+X0SIyY/dy7blRKYd
         xLgfKsYgVMaGZgGo8gawBoWjXFW76fKBOPOKy68tB9U/1viG8h2eTc/4gWOLeVzNGal9
         hUQKytXLO16ZeFeCkiG8FWabDAHBr4HKH4OLb/KeTbQvWOLq9GuS4jJVTqr+Ju0soFah
         jps1VC0snSwqGCJqySle1t/KXOfu1sPLLTNXlLiwA1m0jQvGLb81zYDuq2hlgj0BFsqK
         wQ5A==
X-Forwarded-Encrypted: i=1; AKwUvBzig0WaHmgy9zbVeBuTG+wt2i5S+CldPoWn5172CW19gKtI1nKxizBVHkSbTJzXVGHlyoHprXnWv83E@vger.kernel.org
X-Gm-Message-State: AFuF++mtAPpxY7sLMVZP4K5Qi6C625HOmZKJQ2JAdCT42MG28GpgSaoK
	Ztg2mQxOk2llxSuzxy67DiLl/cShOtMdI1BsZd445qv5rS+D+f5tmJBRcQjFAe+BtR/D3MFbZrl
	XZT+/mtvPQBevnZa9r4GOSRs+jo48Yn4S+chsHFPFUmMcUZ9HRGTfooHncNqkUCbGH+W6yeCp
X-Gm-Gg: AYBFou2VOwV9Vq02of20NOUI+zCmBMAXu1YqESbmTS67mzxfGm+n7vaYm6Pqr25iS+Z
	twbojFcbzfsewSaV2pbEbosZC4uvTHyxhhMrQHZr/gEpNT5hnCzu86EOnOfDztEnRS4yM6IRDWi
	oxLoeL/o3kUYBdJh0aephRBdvaEtTlthnLp7SBgCG95veUxmzMNTEH/ewS6jKJLCajaFro188US
	te0mFkuRLRRC1u1oWmAqkiklMUNVMZVFzL0d5nHEUWRJpi5xe+uCc8jc5PD/EeXQsWmT4IMvK33
	i3wN/X/Yfk+JGCJludOSNK3k/u09yAOuH+5kjLdJ3eQxPnhSgnrR5/wlh9O6pdEUhL8I6gmWoX9
	EakqMLFqsH8ttoZ6ZYZbrvp6MvKbj
X-Received: by 2002:a17:90b:2e50:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39aee1a9994mr3971103a91.22.1788329252499;
        Tue, 01 Sep 2026 23:07:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2e50:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39aee1a9994mr3971031a91.22.1788329252002;
        Tue, 01 Sep 2026 23:07:32 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f077fad2dsm3478828eec.0.2026.09.01.23.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:07:31 -0700 (PDT)
Message-ID: <51413da4-eed6-4251-b2eb-5d2ad8cb36ec@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:37:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: qcom,q6apm-dai: add stage-2
 (SCM/VMID) access model
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
 <006617c6-e3b0-4a3b-85e5-6b5af8f11879@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <006617c6-e3b0-4a3b-85e5-6b5af8f11879@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97bd25 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=lwpQu5wjzsTp6H5rI3AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MIE8s4fiWeJHGGv573XBSFjYFacoydU7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MyBTYWx0ZWRfX9QtoaFq8ItZa
 W2LzH6ZWMieKHo7lEqKBIKzm4012DWuZhUKFIZmhdEBJ6aviRSAS062h1X7CDTsrUcEYhwqmHDo
 EsqgP2ssbCXWJ43LQxerW2+4V9oBemA=
X-Proofpoint-GUID: MIE8s4fiWeJHGGv573XBSFjYFacoydU7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MyBTYWx0ZWRfX3YQ+BVGMFahN
 0wUe3ToZN7WD6pjQPKyPkyKzxVxRLWJZFmlRd5sMTbAYU/SnFg1A/YJ5eK2FGjTOXOn0C/fTDYQ
 EkpHQESjBfV/uMzdWjL3LDdBr9PCeLW6K7IMlwRA9QlwsuOhOLzxq8udYF9VDBk6UAA+vCj73Kn
 LrDj1zKi//FYV3vMi/kzduL9Q+mp9gZyWhn0f2AXkqg57S4o/ycqTdA248GR97oMxKofdTjtWl5
 Kr0OMksLaqF/Uk+Qxh9Opdv9SK367bkTIp7QEFt3xFTlKr1Jy1xAMoBcgr5OlEwNkRMsCTfdtp6
 mXxlTzb+1Y/PCmgi+sepa7XQ4gbWEgL712tAeEwqw8aQiU38+nSKl6EN+t3BH6y88CxQaWL5BeK
 fRLyqSbIkbDBLBSQ+9Gwu7cSrmy0Y9hYDHvclwfL7kX4awVgszy/UMQ240zJ8FcU2t6ipKPkRHj
 ayKulLStsq/ZfR0UGFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020053



On 8/27/2026 11:33 AM, Krzysztof Kozlowski wrote:
> On 25/08/2026 20:40, Ajay Kumar Nandam wrote:
>> The APM DAIs expose PCM buffers that the backing DSP must be able to
>> reach. On existing targets the DSP runs in a stage-1 context and the
>> buffers are described to the SMMU via the iommus property.
>>
>> On platforms such as Qualcomm Shikra, where audio is served by the modem
>> DSP (mDSP) rather than the ADSP, the DSP runs in a stage-2 protected
>> context and cannot use the SMMU. The buffers are reachable only after
>> hypervisor (SCM) memory assignment to the fixed set of consumer Virtual
>> Machine IDs (VMIDs) that own that protected context. Describe those
>> consumers with a new qcom,vmids property.
>>
>> The two access models are mutually exclusive: a node carries either
>> iommus (stage-1/SMMU) or qcom,vmids (stage-2/SCM), expressed with a
>> oneOf constraint. iommus is therefore no longer unconditionally required.
>> SCM assignment replaces the buffer's current owners with the supplied
>> destination set, so the driver always adds HLOS to that set itself to
>> retain host access; HLOS must not be listed in qcom,vmids.
>>
>> When qcom,vmids is present the PCM buffers must reside in reserved-memory
>> carveouts that are SCM-assigned to the consumer VMIDs. Add an optional
>> memory-region property listing those carveouts. The first entry is the
>> control-path buffer and subsequent entries are data-path buffers.
>> memory-region is only meaningful alongside qcom,vmids, enforced via
>> dependentRequired.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  | 72 +++++++++++++++++++++-
>>   1 file changed, 70 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
>> index 9e5b30d9c6e6..d9a6bc4a14f2 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
>> @@ -10,7 +10,15 @@ maintainers:
>>     - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>   
>>   description: |
>> -  This binding describes the Qualcomm APM DAIs in DSP
>> +  This binding describes the Qualcomm APM DAIs in DSP.
>> +
>> +  The DSP that runs the APM must be able to reach the PCM buffers. On
>> +  existing targets the DSP runs in a stage-1 context and the buffers are
>> +  described to the SMMU via iommus. On targets whose APM DSP runs in a
>> +  stage-2 protected context that cannot use the SMMU, the buffers are
>> +  reachable only after hypervisor (SCM) memory assignment to the fixed
>> +  set of consumer VMIDs that own that protected context, described by
>> +  qcom,vmids. The two access models are mutually exclusive.
>>   
>>   properties:
>>     compatible:
>> @@ -20,9 +28,42 @@ properties:
>>       minItems: 1
>>       maxItems: 2
> 
> As I said last time, different hardware, different programming
> interface, different features, so a different compatible.


The APM DAI block is the same packet format.  The driver uses a single 
of_device_id entry with no match data; there is no code path dispatched 
by the compatible string.

The iommu vs VMID distinction is a property of the memory topology,
not the DAI hardware, and is already described by the mutually exclusive
iommus / qcom,vmids properties.  The DSP identity (ADSP vs mDSP) is
carried by the GPR node's qcom,domain property and read at the send
layer — the DAI node itself does not need to know which DSP it talks to.

Happy to add a new compatible if there is a concrete functional
difference I'm missing.

> 
> 
>>   
>> +  memory-region:
>> +    description:
>> +      Reserved-memory carveouts (shared-dma-pool, no-map) that hold the
>> +      PCM buffers and must be SCM-assigned to the VMIDs in qcom,vmids.
>> +      The first entry is the control-path buffer; the second entry is
>> +      the data-path buffer. Only used together with qcom,vmids.
>> +    minItems: 1
>> +    maxItems: 2
> 
> List the items with description, isntead of free form text
> 
> items:
>    - description:
>    - description:
> 
>> +
>> +  qcom,vmids:
>> +    description:
>> +      Virtual Machine IDs (VMIDs) of the processors that consume the PCM
>> +      buffers and therefore must be granted access through SCM memory
>> +      assignment. Required on targets whose APM DSP runs in a stage-2
>> +      protected context and cannot use the SMMU; mutually exclusive with
>> +      iommus. SCM assignment replaces the buffer's current owners with the
>> +      supplied set, so the driver always adds HLOS to the destination list
>> +      itself to retain host access; HLOS must not be listed here. All
>> +      listed VMIDs and HLOS receive read-write access.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 2
>> +    uniqueItems: true
>> +
>>   required:
>>     - compatible
>> -  - iommus
>> +
>> +oneOf:
>> +  - required:
>> +      - iommus
>> +  - required:
>> +      - qcom,vmids
>> +
>> +dependentRequired:
>> +  memory-region:
>> +    - qcom,vmids
>>   
>>   additionalProperties: false
>>   
>> @@ -32,3 +73,30 @@ examples:
>>           compatible = "qcom,q6apm-dais";
>>           iommus = <&apps_smmu 0x1801 0x0>;
>>       };
>> +  - |
>> +    #include <dt-bindings/firmware/qcom,scm.h>
>> +
>> +    reserved-memory {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        ranges;
>> +
>> +        audio_heap_mem: audio-heap@a1000000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x0 0xa1000000 0x0 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        audio_mdsp_carveout_mem: audio-carveout@a1100000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x0 0xa1100000 0x0 0x400000>;
>> +            no-map;
>> +        };
>> +    };
> 
> Drop entire node, not really relevant.

ACK, will update in V3

Thanks & Regards
Ajay Kumar

> 
>> +
>> +    dais {
>> +        compatible = "qcom,q6apm-dais";
>> +        /* index 0: control path, index 1: data path */
>> +        memory-region = <&audio_heap_mem>, <&audio_mdsp_carveout_mem>;
>> +        qcom,vmids = <QCOM_SCM_VMID_LPASS QCOM_SCM_VMID_MSS_MSA>;
>> +    };
>>
> 
> 
> Best regards,
> Krzysztof

