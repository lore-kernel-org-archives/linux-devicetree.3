Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EB438643B
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077874; cv=none; b=QJgLSi4aTPMHtLh0FczYh/wIFmBdHc6RGC240kNEnWLl72UAeldh2oLEdK09q89vQHgLXA7P9x8cmxPUnuRZKkDscl1S1z/PAItaNnyg5bL4Re+I4HnvUHQHcGsHfwhXcAV95MflREl08dFfXkHKpZOzSzNYJjt04JCy+1aZBZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077874; c=relaxed/simple;
	bh=s3LvsG7dqZtXg8YMDIyxXyAHsoMeRXF9W+hw1548QZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bey1RVLg6jJOoyUtDzTpQN5zYDUagk4RXUxhkCUmdiSLNARWszI4CHB7644qO6b21neWPykdAmIXOoXOZ0ROoVAWDyrn3Ql84Cgzr/TmBwxGY158iwE6Rw7wQwhdO1MMK5ODa29P9BcOBUgp/IFB8ZVyEweG3xXmih1TNQsYfaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+Pb0pXi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qh5kdsiQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+Pb0pXi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qh5kdsiQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i4YJ531720
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZ2TbxNINDfUbarOe96uj/eig+iAWkoAY3INvn7LE1o=; b=b+Pb0pXimZUw0xfo
	G4YkE9E75w7NqBp+ro7eSV8UBARFgC4RGLy8lTBA/YQ6xPMKWUMd0sVTlqVIrSkT
	itQbjpiCH9/8pwITZqDaksVgkzDypZ41y7DA5SXRcnnv5rfcPeCmHAhJhuXRXD8z
	IiheO4cmU4XUar5wtCPR7p1mScos871SqGID7SBOB++GITZc9enxVVaZjyNXIRKT
	L7Ugtd4O4SYAXF56skquAd/V1xSUXh1OBzisxd8I4+Rzm3HLVmE4rlGLRBSbpWCy
	7QL9MyGqHnlXwRgqmY3VdAVqmBYALqFl35AJdorPA8Dsm+SLzOiVPVAdYkiAbK8u
	xeCk8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1cvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:51:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178aed25baso134047341cf.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781077871; x=1781682671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZ2TbxNINDfUbarOe96uj/eig+iAWkoAY3INvn7LE1o=;
        b=Qh5kdsiQhNH2BsPmnbscM6+VYp3iHSKLduOdCYAI+VJ4O1LUFpkWPLKMfsVO0uPinh
         BBiVxRtewY1rzq9IoGIZ252bx3TcIwITB5PfjlxC2s074viNMCK0VfUkXMiCJ5YcHVi7
         2UqAcgp7tKaIHxZ2/LCgTakUOzBxX9LFs3DtldXvP6NN6BLIeaN1JpqIZ5jmO9X0KoaP
         qaSxNM9DyLJdlm3qzp/FDgmJhjWjKgZLxbiUFI3YQVmM1YlG31NgAjRlcHSZsGyyjgdm
         JpLADVbCnGTkZkVQ9zi4MQIFrRgNi1HyGNdZb5BBlfaa9h2ovvgs55+21YMcEjc0Eyel
         eKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077871; x=1781682671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZ2TbxNINDfUbarOe96uj/eig+iAWkoAY3INvn7LE1o=;
        b=JndSQZAw7NWxw83YLAeHLv/BMv1LPQO04nL007XBUkq26P9D13iXxrTQ8ncIHjJ+87
         sAZ+2PXvDCg0lmxweWKnhi/xNlrfVHd0/8dsi+P37cbbLkTjHqlD4lVE7YvRvzNB1i8r
         ij15O3pyyXUzyKKT/kkGKCxxmbAQy2yWp4rU+AixOZ8PJAnVt+qyfn77hX4O4l0ItouW
         QjILMH8HUpU0vFi4RE9Pa+cbYI8C6b8N/SMnIsADLPEJgqC91qCUPX7CPauGMqAtCN1I
         GfrwCHglpJrDSTrOwZ/S4OqPf13I3bxQ5SF12LTJ2TzLxFUF9qt8Y4vFPbKHt8Ed9g/E
         VeDQ==
X-Forwarded-Encrypted: i=1; AFNElJ90aR3W6qB90QCNzFh/PEE9xDCoAVJNdot2v41y1xKdwnTJTDxSkw5yVMTbchYaKZqRyoYyPWS+xj/e@vger.kernel.org
X-Gm-Message-State: AOJu0YwpmAs7LFQw8mRGvfujNMzCivBuNI09ZPZhM/QCTStWNmjS2e/l
	m6FElnKF7LK2NnVvN5D+4VRoD2UvAsfjeC622/hlVP5OAP0Moi/ZMQhA8zd2P/LX5Ecv5Z+c2fc
	cyfhmbrThgqE1udCWzSSXtloSe//zE49afN/rq9vFp/pJL7ADcnfE60QGaVJ728Ojrt2YXQM9
X-Gm-Gg: Acq92OEKm85VBqMJtcj2djl61Zv6olKMnMAVAKsY1eRhhwtKMuFDYNEBDp+OvqSVYcz
	J9hQKXqSD8lRUiAMNm1mhmtJnIehTQPFMmcY4nLJmm8bSU2Rfi2iFKjMGCdNWF72Lvx9Qiwk9uI
	C7xwXDRPRXyuEn6r3Rk7ZaDiz9A9QnvvV9Ehpjx0RnVjBDH8YIjL+lz9TweQoEAi7fknl46dL8H
	0ekDaFIs+x+akC3t4H2MpJMBfUaLjyjuD0NwAKt099jiOcKlJARFR7pQnQAe7JMQlq4M53ujfeu
	VDLppaxYw9w4Fh4+VwsLmEms8fOXeFljS9W7mOReq9WrdTcVYAkeXo6JuTYY7PTZMb9fVtaz+xt
	6aatssspcCY/fQocpNEZ2neCXVguEVNFnShbNHulV5DetoBySMI1VW7VEgPZeWm0LabU=
X-Received: by 2002:a05:622a:514:b0:517:6b9c:58e4 with SMTP id d75a77b69052e-51795bbf26bmr339153961cf.51.1781077871411;
        Wed, 10 Jun 2026 00:51:11 -0700 (PDT)
X-Received: by 2002:a05:622a:514:b0:517:6b9c:58e4 with SMTP id d75a77b69052e-51795bbf26bmr339153541cf.51.1781077870842;
        Wed, 10 Jun 2026 00:51:10 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.156])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm9496504a12.0.2026.06.10.00.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 00:51:09 -0700 (PDT)
Message-ID: <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:20:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <5YTsRTMAUGw0it3GAWHhKIh77_Hk823-xRJ4WxzQ-ENpdnC9-ttUvWhJI_CqFEetmFXcRel50GK_o2UMGzwZmg==@protonmail.internalid>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3MSBTYWx0ZWRfXwKBEW9AEtfYw
 t28FoXPpUwFZOLGegcjNsdh0wS1AibXXAiGdpvnsufjCwa5OpadSw6S0VRHcFZgvOmXke1UIZJe
 Q1WnG9sLznwK2w5xFDCBe5W22xk7QX0D9AjqGGnvOi4edsz6Qf7zg1jC1qOkPP4Oo0LJpiUUat1
 PqPW50kSOVYrE8QilqpLFUycjTQdProKMNSCd5Hr41SAGN7FDNuwVAwIOuaA5NaPDV8WdjZlT06
 sxKRoER99TXH8boaYenUaTEPBg7lAVZ/JC0fzykpjK3fZnaYggVDbtyNXqgRTANSX1vkYTjC5AE
 AZh30JwWmnpGs7WKZxeu4VdwZohEls+Te6G/gQKpLFDPXKWGDWtwqypAvkXp6S7gkKWBhCa5IOD
 m7nD/9ag9JqtbHR8whqUO2M1CPX2rsTX6UkY6z11ijC4DxJBLZ3I94HexeSItfdKrr8ogrnBrki
 tyQGRY6rbwIiZcFy4tg==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a291770 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=tTcoO59C9ckK9alVnXkiOA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gdZobvEme04k_sSWYcEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: O0RxNq9z1PNFcT2GzNdDGrHKq7IuH9z9
X-Proofpoint-GUID: O0RxNq9z1PNFcT2GzNdDGrHKq7IuH9z9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100071


On 6/10/2026 2:07 AM, Bryan O'Donoghue wrote:
> On 09/06/2026 17:15, Vikash Garodia wrote:
>> Document the iris video accelerator used on shikra platforms by adding
>> the qcom,shikra-iris compatible.
>>
>> Although QCM2290 and shikra share the same video hardware and overall
>> integration, their SMMU programming differs. QCM2290 exposes separate
>> stream IDs for the video hardware and the Xtensa path, requiring two
>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
>> and Xtensa isolation requirements, such SMR masking is not applicable on
>> QCM2290 platforms.
>> Since shikra uses the same video hardware as QCM2290 and shares the same
>> programming model and capabilities, it is added as a fallback compatible
>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>> two IOMMU entries.
>>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,qcm2290-venus.yaml           | 20 ++++++++++ 
>> ++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290- 
>> venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290- 
>> venus.yaml
>> index 
>> 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> @@ -15,12 +15,27 @@ description:
>>
>>   allOf:
>>     - $ref: qcom,venus-common.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,shikra-iris
> 
> Should this be "iris" in a venus yaml ?

given the vpu core was first enabled on venus and now it same core on a 
different SOC being enabled on iris. There are 2 ways to do this
1. Add the compat to existing schema which defines the binding for that 
core i.e existing patch
2. Write a new schema (or say duplicate it) with ...shikra-iris.yaml, 
but again, the shikra compat would fallback to "qcom,qcm2290-venus" 
compat. hence even iris yaml would then need to carry the venus *string*.

I followed the first option.

Regards,
Vikash

> 
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
>> +    else:
>> +      properties:
>> +        iommus:
>> +          maxItems: 2
>>
>>   properties:
>>     compatible:
>>       oneOf:
>>         - items:
>> -          - const: qcom,sm6115-venus
>> +          - enum:
>> +              - qcom,sm6115-venus
>> +              - qcom,shikra-iris
>>             - const: qcom,qcm2290-venus
>>         - const: qcom,qcm2290-venus
>>
>> @@ -45,9 +60,6 @@ properties:
>>         - const: vcodec0_core
>>         - const: vcodec0_bus
>>
>> -  iommus:
>> -    maxItems: 2
>> -
>>     interconnects:
>>       maxItems: 2
>>
>>
>> -- 
>> 2.34.1
>>
> 
> ---
> bod

