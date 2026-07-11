Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DFE14B950
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 05:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783748808; cv=none; b=qt4jPd51Y1mCnHkR8GqWucmWLiR7lqjNePMYCWRBsGn1dByFSwD/6j8m4h2nozOF6O2iIBb5FjSM+35a/rHq3e55uGGPFrK9ZfoyEv7/IiT+1623ArsXXJN6AWicuDeb/jP8TVRng9PF3242WTRK38Kx/4SMGF2iepULyGXf7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783748808; c=relaxed/simple;
	bh=KdwWMKt9xEN3xDtoDCATPMzZIWVY48mme+8NbD8tZCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjtQ/K4HsyikIY597DV/oMgfH20MeWl1jSluhEVq+ZwQGXBZV82A0aU/Vl6EdkKwPFydP6wRE/97w92sytugKCGoIy/lhxHxkcpmVfba1E6chvDBq4Ght/hY1IzFaQ4LpAaz1Ak73MFVos2h/9E+CjLlsZsxNdROwcF7flbD8+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKdLSv3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MtycTzj2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKdLSv3u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MtycTzj2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B54t6H2808991
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 05:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gevgTNUs9RHgkaUGheSyiQ8zKdBVGGi1fUkWXs8Qot0=; b=lKdLSv3ufnyHePk8
	t9OJTg5Utyn+lWFHsXShB2UmSqXPgXtY+jwBr43owVpAxTiDjxXY6H/pTAKFTwQ4
	7NlZIlP5+wpiNecH3NkFD+nxiAQLv0T5j/ZqVmY2t+PXGCpkubkxjEeYHoMRBXJC
	OHk7Ele1xaAGjvpiBAeHsPvy8QnlkvgEoAGjJR6mbmfb0SjxXKBkeQygXybzwcEM
	2xMFRSlQkF+y4fsP6zPXqiqi3nJBrgmkKsROISmnlQrCtRXQLAfhA7uIWVCOwpWH
	5GG7Tt2FCTKIVh8tW3vyU31r1cKZ7xSLXVz7awBvY+tBITj3tS+1Aso+3wmrT7GI
	EjAYvw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf48032f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 05:46:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso16839591cf.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783748805; x=1784353605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gevgTNUs9RHgkaUGheSyiQ8zKdBVGGi1fUkWXs8Qot0=;
        b=MtycTzj2J+UuPZ3Isrzz2FSwzudfXRtx9HkeWkgaKfn10NfT38Bs0exrIOuTQbgSwi
         QCKmJIv7UQwPtoDHT7F6cltEslrJTswXNxpaPcDEMIg93f5e0EVwrX30xSWEHcZpPR+s
         exXJYOeoy3BOapf7I6XmdKvqRj6BBDHh7W77TB2eH8GZkx9RCxHljn26r/q36/czHDDR
         KKjGqX0+w72f6UMyALnscatMgHnQldTTDE5GY0bu0KpdO+RSFl6ggdlJkc+EH9Ys9pZO
         snEGOH7Ggaw/qvU4K5/AfMKDPA5Djp5/0kX/Fby8IJ/Aih5XSpvOqdgnSahiB1ZxQNOz
         87hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783748805; x=1784353605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gevgTNUs9RHgkaUGheSyiQ8zKdBVGGi1fUkWXs8Qot0=;
        b=VwSrU1MFimjQpzfqJFtX3VN124YLdbQMZlm/jgpTDvtBJcKENFlsRdEbD/UeX9nWCU
         BMN6SNIj5iY3sfHFrLny87k0+FONrHLMy8dKE4nyxKJhXoLhVOsN6dFtpw1wR4CBoETj
         z6gsILoh9DWwG3+76hHJnYM7Fv5NkrgLoMhhirjxraQVMSakSywZlfggyO+jrYKmkuZe
         jGUuJM7Oga7Mw3XySb2EF4Bum2qcONXVOefbL47EHK+3WMM0YeWxgoiEfBic1spm5tif
         2IYB3h40YvyYoT9qk6cyqz1VQK/IEeAk7BMzaLTicc7WsvTL64PnbYsb21cwsJQwMEXk
         sQDw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7DpwP9I2yVIMVhdbLddZ9SOZf82w2k9BRZh/iVFpMEv7b6snyizbGlSmlJ1emqjcv7pdGn5NSrzuX@vger.kernel.org
X-Gm-Message-State: AOJu0YyFTdYwPhG5Z2R2wHpgglzZ9vTxarUzoxKMY+qR97kkka2bD6Rc
	8h1+D7rmvb7pvmlAKs0Y288t6YaYqyuw3JHmvFbQkGMyqgHKz7huM93QvF836rDWx51CVoPCcqN
	E3bxO0E1vwfbSRvOYZHhmISWAIkRCOvkmChXt7/D7krp/mooWDABG3hhANivRp+AB
X-Gm-Gg: AfdE7ckFYv8iPatJs42Z1oODRHH7dT/33EiwKxP4wpZlGeNkJbGc6fhi+s7AkmSQ4tQ
	g8PnKz77JI5kX//G1pU3zCm3yygedKl6xOb8UpLcE7BzG6joizFL3Wv1rCZhUyZQStoLpuMpinO
	Z8I8lBxj1gTVeKc0H5rumrVCagGWTznTutCP7Ku1SRSgam/b5Mk8Cm9IVPpcKbHtpY1CjRasCal
	W8vv9G9ryouPVRp17M4Aa1VSohH+JrTyq6wEqH/TBLKfeyBaalfIx+tJ8Lu9lULRO4MheCagj/T
	eBLneNPNBeKomkJDp7JXBqMjpoigxXoybTHF8G4UTE6yDWiL3iWrSTiNXenEdUDjkU9av5FYY0o
	F6+uxFjjp5MkiGXiMUm33OxXa7xe2G7qqGnWpKAAhCVgt
X-Received: by 2002:a05:622a:2616:b0:517:9095:c329 with SMTP id d75a77b69052e-51cbf1fef01mr18790511cf.45.1783748804651;
        Fri, 10 Jul 2026 22:46:44 -0700 (PDT)
X-Received: by 2002:a05:622a:2616:b0:517:9095:c329 with SMTP id d75a77b69052e-51cbf1fef01mr18790251cf.45.1783748804101;
        Fri, 10 Jul 2026 22:46:44 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d81bbceesm457348966b.41.2026.07.10.22.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 22:46:41 -0700 (PDT)
Message-ID: <71733afc-732e-47f9-8497-b09600f93612@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 11:16:31 +0530
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
 <201e8354-fc34-4d2a-89d5-8661a3a66133@oss.qualcomm.com>
 <b6rhqjdjzmwme4obo6qdffg6pf6zgcjf7a25kneie44bucge3y@kr3v4ylsspfv>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <b6rhqjdjzmwme4obo6qdffg6pf6zgcjf7a25kneie44bucge3y@kr3v4ylsspfv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDA1MSBTYWx0ZWRfX9Ey08H2q6Ohv
 FmPYyd34OGiMTEMqY0TagXWJduIari1PngTT/Ag62v3l+gmWTlSoSBIPfXThUuc0OSepatIg0zz
 Z1pZLOen/b1rUPrFDP/d2Z+4URzzz58=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a51d8c5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wRxn6a4LM5KCmfMgYXCo/g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=2_L87j3xYGeytyR3NxoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDA1MSBTYWx0ZWRfX73UAY/f54fvP
 Okw3wy68u0JZlAdnrvFA2uQ52kXnt815tIK95bAAdLGCzuJ+W0sQoP3K2t72EnvgykFXvL04UfD
 yuFyXr1Kbtu7EcXn/C9oXwcwP5i2MVE/awOGRzvoi8FqreYes83LJw3Hkb7cl05LYmwItCtfxjy
 H10B9RXMfC24Q8egrCtuFA8zRrQUgmhYMyo5xTm8/wdwLhj2YP93unKJlbMePAu2VJ0X6FnvFkR
 zexfkTQIaSHXz1xAX7bgZ8lQL2DPjxXbU53h/JIIj7yvCw0GpKTumk0JAi0qbYcoXqFxOSLS5EV
 YAUxgwb2uBzB8byNWw8gDSmjZtCVYH9ZIymXUmji0IaqpJoIRkbsVmqiaeBWmD3t7kW7BDR6ZHV
 AKMElqX2FSCnEiE9JxVTTdZTHwUM8JCeNAzI/k8UEh2Sow1jvG063X7lm6xcTOpv0yyxxZcquaj
 OH3z8bJ8zskDVi+D4ig==
X-Proofpoint-GUID: RnEBL8iJMI_5nxbHwmwKzrmm5AOyvvo1
X-Proofpoint-ORIG-GUID: RnEBL8iJMI_5nxbHwmwKzrmm5AOyvvo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110051


On 7/10/2026 9:23 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 10, 2026 at 11:32:20AM +0530, Vikash Garodia wrote:
>>
>> On 7/9/2026 6:20 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jul 09, 2026 at 06:05:47PM +0530, Vikash Garodia wrote:
>>>> VPU hardwares have a limitation where VPU streams are associated with
>>>> dedicated addressable address range, as illustrated below
>>>>
>>>>       +-----------------------------------------------------------+
>>>>       | Stream A reserved region (600 MB)                         |
>>>>       | 0x00000000 - 0x25800000                                   |
>>>>       +-----------------------------------------------------------+
>>>>       | Stream B reserved region (3.5 GB)                         |
>>>>       | 0x00000000 - 0xe0000000                                   |
>>>>       +-----------------------------------------------------------+
>>>>       | Other reserved regions                                    |
>>>>       +-----------------------------------------------------------+
>>>>
>>>> Mapping a stream outside its expected range can cause unintended
>>>> behavior, including device crashes, as reported at:
>>>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>>>
>>>> To address this limitation, the subset of stream/s are now represented as
>>>> sub nodes, so that they can be associated to the respective addressable
>>>> range.
>>>> The limitation could be exposed when running usecase like concurrent
>>>> video sessions. The binding have been validated with higher concurrent
>>>> sessions across the SOCs supported under this schema.
>>>>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
>>>>    1 file changed, 63 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>>> index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..bf4d24ce90bd38666704274390b98be450f708c0 100644
>>>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>>> @@ -91,6 +91,51 @@ properties:
>>>>      opp-table:
>>>>        type: object
>>>> +  '#address-cells':
>>>> +    const: 2
>>>> +
>>>> +  '#size-cells':
>>>> +    const: 2
>>>> +
>>>> +  non-pixel:
>>>> +    type: object
>>>> +    description:
>>>> +      Non pixel context bank is needed when video hardware have distinct iommus for non pixel
>>>> +      buffers. Non pixel buffers are compressed and internal buffers.
>>>> +    properties:
>>>> +      iommus:
>>>> +        maxItems: 1
>>>> +      memory-region:
>>>> +        maxItems: 1
>>>> +    required:
>>>> +      - iommus
>>>> +      - memory-region
>>>> +    additionalProperties: false
>>>> +
>>>> +  pixel:
>>>> +    type: object
>>>> +    description:
>>>> +      Pixel context bank is needed when video hardware have distinct iommus for pixel buffers.
>>>> +      Pixel buffers are uncompressed buffers.
>>>> +    properties:
>>>> +      iommus:
>>>> +        maxItems: 1
>>>> +    required:
>>>> +      - iommus
>>>> +    additionalProperties: false
>>>> +
>>>> +  firmware:
>>>> +    type: object
>>>> +    description:
>>>> +      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
>>>> +      VPU when no hypervisor is present.
>>>> +    properties:
>>>> +      iommus:
>>>> +        maxItems: 1
>>>> +    required:
>>>> +      - iommus
>>>> +    additionalProperties: false
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - power-domain-names
>>>> @@ -98,9 +143,15 @@ required:
>>>>      - interconnect-names
>>>>      - resets
>>>>      - reset-names
>>>> -  - iommus
>>>>      - dma-coherent
>>>> +oneOf:
>>>> +  - required:
>>>> +      - iommus
>>>> +  - required:
>>>> +      - non-pixel
>>>> +      - pixel
>>>> +
>>>>    allOf:
>>>>      - if:
>>>>          properties:
>>>> @@ -177,12 +228,21 @@ examples:
>>>>            resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>>>            reset-names = "bus";
>>>> -        iommus = <&apps_smmu 0x1940 0x0000>,
>>>> -                 <&apps_smmu 0x1947 0x0000>;
>>>>            dma-coherent;
>>>>            operating-points-v2 = <&iris_opp_table>;
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>
>>> I think you need "ranges;" here. Also an empty line before the subnodes.
>>
>> Could you please elaborate on what would be the use of "ranges;" in this
>> case ?
> 
> That the subblock has the same address space as the parent. I might be
> completely wrong here.

Yes, i explored with the same definition of "ranges", but could not see 
a use of it in our case. I am dropping this for now, unless there are 
suggestion on this on applicability of it in this case.

> 
>>
>>>
>>>> +        iris_non_pixel: non-pixel {
>>>
>>> Drop useless labels.
>>
>> Ack, labels can be dropped from schema.
>>
>>>
>>>> +            iommus = <&apps_smmu 0x1940 0x0000>;
>>>> +            memory-region = <&iris_resv>;
>>>> +        };
>>>> +
>>>> +        iris_pixel: pixel {
>>>> +            iommus = <&apps_smmu 0x1947 0x0000>;
>>>> +        };
>>>> +
>>>>            iris_opp_table: opp-table {
>>>>                compatible = "operating-points-v2";
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> Regards,
>> Vikash
>>
> 

