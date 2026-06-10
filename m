Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B439F9E8
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 18:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114930; cv=none; b=XqalwpCQwYrPvD78hPw+nZrlomPBrNGyWZ3QtIKwOQIx4dznus3SatWz9kaylbXLmGj1r025EfVc6cP2ngKX9I36FokRxnT7TKM8eHcT4FdNBsMw7DtRcIQZetksI8V3O/aa7Hw5hpb4OZ/B+6l45tkHl1HPGyN4uM42Fsq9rS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114930; c=relaxed/simple;
	bh=TzdZ74lGIi/K4VLWAJkI9NGpFSw7kZd2nzjV7/0g0YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZN+5oXTGBHvL8ok7C8vz7U7+tnB/O3cqCv16kpPTkogOwP9S+ljCWODT454wWYeaLJf7xZ3NhrCeiHnzfki6IMWGaUcYS+PpPwf9I9D9DfjZtuemXvcRFGNDj6/yqqp2UAd52Q+d9Cka1FSRkjmv/m0MpTkyjcldsYLxVkca0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEg4XyDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMqrTb7B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEg4XyDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PMqrTb7B"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwiIk1666487
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 18:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pU7x77a+8qRNZg86QYZx6zWKXSydK7ZBnV/K7oIcSUE=; b=QEg4XyDmpI4ju+vP
	MPoo7HCH6aSWRQbIvwupXeFI+Iy3YUWTZ3MelkBn0z9JB7DI3ZMkZ4I9Uapfz3FU
	xei8PaUkf86825RNTqFnscSAFRSlhM2dCHF6ClDQPauMTT1c4RFRORBXabIGLr0D
	zPpLU9wVOKzsBiGwjHt2r3SbUEqjVZmqH8PRjA+VYNrmVswH5xPUF7uPb1+u4fNZ
	xtywKTJXj4NkYo5958lN3J1/hTKDa/3MOFD4G45MpXioqf/Ss8g1h5E6s2rgOwlu
	19VFGVRS9axNe8G9MJMTj427yri1afNKHRLsk+nBD5yOS7es/sF7+LM39OXklKsq
	FyDD9Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh41gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 18:08:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751db2792dso3345243137.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781114928; x=1781719728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pU7x77a+8qRNZg86QYZx6zWKXSydK7ZBnV/K7oIcSUE=;
        b=PMqrTb7BISBpbsBNL4aNgdGrNsGMH5yQ9p6Xtchzysfje08es50y9HBStPvvHLu7Kz
         zNGTPCD4PiXhtl1lhjunEZ42HH3jOZ8Qy5TMEJxEecWiwGi/urgPJ+TRWW3sJNIT5pCM
         VrUc/ldXOoSByexnHqmA5t8RuT+8mmBBTKEZqgMjFd3jCRFi4Un2wmeWLCsyCDeC024M
         FIFHBzo+isUwbRJqYAzUC6GZPXrYFCSq+z6LbpR5AKejK9f0y6ebypamCTudJ7RYvHPk
         NdOAaLCVG5QbT7M7m67uUZ2Gph+50RFfd1Q9SqGwKxtgZLdqG/yNe2A4o2CjrfUd5Pau
         NSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114928; x=1781719728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pU7x77a+8qRNZg86QYZx6zWKXSydK7ZBnV/K7oIcSUE=;
        b=rZP/FgAHIGAwhOmWxUf4LaXKNJEJ51WxsNqY1W0mXCW5GaBDtNztQV5TMPtcNjTkrZ
         AjDseUcE89U1QrdDN66QDOwGJDmiGHeLty57iOxQzfPE80oYcfY1YqpLCCBjpqxUvVmT
         zHlkS4DxCvawh3W5X5yZMGMOKbmbR6Bnbw8XJQV8xCwwgNtdW4euiUoL3F9zOXxy3woX
         Hn6jc7XLcvAv60RTQhO7UQgWNmQxNRvv1Go7tv0jDQPEqM4CbqZ1CiXVm2PK0ElOh2+m
         IwugJbmcDLSmHPvRlcorQKIrRFtFlVErHI6hCuCWhbSVdNnu5MvtP4stRYFgmzvUUzMV
         09Vg==
X-Forwarded-Encrypted: i=1; AFNElJ+LhQ81pbo57/jqFboYgLUaiDrbFLVAB9f3MkAnuu7NUSTznD8fMHrqZlAaV4LagHivXZ8I9uCY6rEQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7wB+UlB+ZaXUQmILiHK1SgSLbCllPGtgQLveX2iZYXqMRc12a
	OBt8XT582cpBI2e+2QGS5J/HnA0NTGMFUe1JWVLuvnPrxO8/RYl+wna4CVN/ApDZzAt8dokNerU
	m9kuLYTS/ySlSOPa34E1igA7L/2b6aoRnyY8n9b22EWl1L0in0vourx+0+bQdIz4mcWiZFqL/
X-Gm-Gg: Acq92OGBaGfoXm+qT/CqXS5yLHf7HNdK7orPzFQ7zC1dAvRkcOTkB3IcI5tn4C8UzTM
	8sSBDe7d1ZwwPSHUudsSNhsD4s99qlBVYQm5x+3MsGKFnPcSfoXL4UostOCAs6maqdtwP2crTMh
	P6fpKEpgBx069wthpeC7ytt3WHIfEl0equdLeQ1qOfHEfUak/qNBuodfLJ8Ao9LVTv9Gv9+Lm2G
	kPK3NXsjcKI48mcQkdNDOHIMJwI1fy337tdtWNlvmF32CAX0Ug1ZO8jpYlI7AJBERr80R6QHwy4
	Vs9DfUy5hbWzOI3WXjjTlN/Y1Dt00unj8HXD12EdRHEIWmsxoEQuCfJuivReQRTTo04eDdyyCuo
	V4UWWOubgskNKnc3UygeN0g9vUN0gREObX9OfZI9E34w9Igr2fooXbnHJjG+UUs+ewOc=
X-Received: by 2002:a05:6102:5e82:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-71d1ffa545bmr70875137.12.1781114927782;
        Wed, 10 Jun 2026 11:08:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5e82:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-71d1ffa545bmr70859137.12.1781114927376;
        Wed, 10 Jun 2026 11:08:47 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055303fc6sm1229897066b.42.2026.06.10.11.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 11:08:46 -0700 (PDT)
Message-ID: <5e1be8c3-3e41-4a4f-bb70-3bc6bad7f26d@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 23:38:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <20260610-flexible-badger-of-dignity-bbaea0@quoll>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260610-flexible-badger-of-dignity-bbaea0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE3MCBTYWx0ZWRfX+T7SgrrpcAh5
 7Dpy0XKdk3rbxF+PqALdjT7HYThOBk9e6pLiOPRJ4WeRZDNCQZ3+SX9OhUBRqyiHpePnmhuKioG
 QvDrH8IKTTCPdfUgE5RLzwyBf5fleIvdrBqrYcDQz/glotdGQ4QKK9s00UEDs4ffqb9j1F64uuv
 bSR7Fcurhw/5nl8+5CrUbHfv6GBUSWNAaKMZGycikPPeL1+t3hVraWvEVTsMJEb5hBaxBhS5wGp
 ps6ibswCRYIMxozx5AnvdY+e2gaZqphjrQxNaj1tyOv5LZBnQ0elFisOX49FrfhvsEGos0UAjgW
 Gfu/yJ8LMITgNJqkDY7p6gpz6jpDtC/asD5BcgOth1XHio9dJzhcYiTi8cf9uxQOXvk+wyzCXik
 py9pZlhvmdh0+c5kttdwOaQcbK1UXMUf89ktd8+cK4Zza3UznRjxkvXJi6qm3MJR+m9VnNxmalt
 tnOyOYyuI+rglK5Odaw==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a29a830 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=tTcoO59C9ckK9alVnXkiOA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YZymR2wwIn4Cfu7efxMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: IR1nZhOzoWy7U1Yx7gqPkdb0_q_MV0y3
X-Proofpoint-GUID: IR1nZhOzoWy7U1Yx7gqPkdb0_q_MV0y3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100170



On 6/10/2026 2:47 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 09:45:40PM +0530, Vikash Garodia wrote:
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
>>   .../bindings/media/qcom,qcm2290-venus.yaml           | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> @@ -15,12 +15,27 @@ description:
>>   
>>   allOf:
>>     - $ref: qcom,venus-common.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,shikra-iris
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
>> +    else:
>> +      properties:
>> +        iommus:
>> +          maxItems: 2
> 
> allOf goes to the end, after required: block. See example-schema.
> 

Ack

> 
>>   
>>   properties:
>>     compatible:
>>       oneOf:
>>         - items:
>> -          - const: qcom,sm6115-venus
>> +          - enum:
>> +              - qcom,sm6115-venus
>> +              - qcom,shikra-iris
> 
> Messed order.
> 

Ack

>>             - const: qcom,qcm2290-venus
>>         - const: qcom,qcm2290-venus
> 
> Best regards,
> Krzysztof
> 

