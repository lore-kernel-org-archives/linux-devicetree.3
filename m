Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484FA3ACA7E
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931079; cv=none; b=WIWgQnodM3sdI3iYwjROMTNYDQ1Z38GUZnR2xdmLn5byxc/Vze92liyE8JnXttik9LgD9u6Up4alNDYRQNeZegJCheK1PQ+eMp9HcMwgyc9eFcuyOrO/wY1fkvVqe6wt1yCgyP5HuT1WxIxG09f/TXaP0TXg1Gf2Y1+bJum6fhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931079; c=relaxed/simple;
	bh=sAcLEJrrx4v8nuf0z28rIvu0BNNVc+kU+REaphTJnnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhQhM4gBdReEtlVnM7BIiaQMGDjYc4jEi/skNV+IhnsR8L5vwedjFQJEU50m4bld7Qo7PyhjD+Tk3gg4kqGc23v7W0PW+As5C1/f6ynoERdeUEyuPdA4WlALqPGC2AQiUEq+0hGVGuuwsao7xaLmpE0L0QEQFXf1G8udO86Yi0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5QtdjtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kmY3mirf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5QtdjtX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kmY3mirf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6ONIU473851
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AtYfxbeH2oeMrlG9JnAbkDQDcuirWg4SXSYHEeZMRKQ=; b=V5QtdjtXRBo/SA1F
	grlAc3p+1+FbseoCfYzj57+/CDn1tiHY2i1p7/whzNAx8L+4r+Tbd8YZE+EfU5yP
	FPbFGajWf7RxkhUFxiRG3X60s/zI9VDYVCwoUO3aza0M2HpY36CKLvjcdNyoOVxG
	Hua8S9qBBrNJSvSwIG7vJy9npLv4DtMC/iWYEu/EnPg8J4eOTH3ECf1ZwHej7wa+
	1b9pazgZLDURmDFtGzysEcjj6dfZfY7e1N8xLxvvtMAK7eijkd2AD3RB0NGkU3Cb
	z9a8waaPKEMezCNlp3wCLHV9nKwQZnCs5vg/ao1tcMvGqU4Jevyl91DlTNNtIq1U
	0SAA1g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9n7x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:24:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso47471321cf.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931077; x=1784535877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AtYfxbeH2oeMrlG9JnAbkDQDcuirWg4SXSYHEeZMRKQ=;
        b=kmY3mirfydtZQiwZvm4jY9ZxtdeknRdwI1ZqtaJSlNhVV1cHbzYn+c5B8i6cKr6fCO
         2RbJC9LWUgMOVcNjz7NbcVaUo7wR82Hl1j19uX9YpaffSMaLk9ydlo5Uyg0qbmUTeZKn
         TjfUOT3gYu/ehH+q4DmDIO8VuNU3iBjjL9FvFKShPmLl5S26axPCIFWHqWUHqcqBIGpE
         g5kirxeQH/QYkgKS4c9uOBzhIltfMjB7AuVYt9d6jJ5ft/8frntI+Vc7A15r4j2wiyt3
         T58L48bSNbqPPsghzlR1Sxy+ZeZFrHf1xZd5h/OrhwtqeOVLZIEOgLfYhlwHhUbRdY5l
         3c3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931077; x=1784535877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtYfxbeH2oeMrlG9JnAbkDQDcuirWg4SXSYHEeZMRKQ=;
        b=RZsXY6XO8opo/XL65M4qxmoThw8SIqsVjxhwN14lOVILAvHAes6CTnQ9r0FcJgZ9+/
         Dikdxj1msox8Wckgpv7DBxEa2Z5TYjX24vJAVT0QRkrbFRlH+0i4SF99nu6q4KIP29Lo
         6Udzzpi6TSBGazVwwwI7QOGPIYc+eXMzF1sHILHfI/ZPxn7xnv/jqpia8tVEkz6WQ/dF
         Amf2eBo2kSckMo3kVztu5zaeOrfS+PJeymFuNjRwQ1GuK31ICmdpkV/LlYc17KsWaBSV
         sFHbDE7qmu8juWwmatBwSz7GxnWVQjV0nPOSFlHpCTlCi5CgfLbzfogunOUwsoMKTYOm
         G/GQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrNGwcvt/XI2KTY2UBI9tuh4KtJ7vXC+8K9jYUA/1l1Akrk3De2PgTUJOM04pngbc2FLbREQrIe3Tw@vger.kernel.org
X-Gm-Message-State: AOJu0YwO2UUUU+bUDk3FWmjsrFCLUuodufQGjFtamsnLQddO6dqKtB19
	ohUp2K52kuMStQ+DDF1nI99EIAkGJDGIeaGnkVQsfXCTNKFt/24vvyceyXiproTx1KyiTtiTqIl
	eEkowa/mx3QP5itqu4kS4qSC4QJlQ2aewTDfBpxlW0ZEHNOoOCcfocizB3TxtmPnx
X-Gm-Gg: AfdE7cmSIL/AdBiNx/lQNGgD0+He+bR7a6kbKe/iLzACwOahFymsdVZlDNqLcnKAPKx
	w3ltgwoiNVxsYIWHgUbxgt0x3n+nffTr9jmXejUPu08zSyN3LMD3/IFEqUJyd/H/IbseiCol5H4
	7/GZskiUgW7wJp09vY1addQZh/hMZEubxrEcI60WzLOMqi2N6ywTJmaO0EDVDsIEcQK9+Msm5IW
	rs+FkkCdLbtyPlvL4dpeXHAk/3nlij2xxWyWblPe/xUkiRLmKQffqW+NfsEh0PSFGGg70NldfYw
	+17d0rfoCpVeAUJeIhz29elQVwW+878r+UAiAcbWnpPo9ob7p1dy6be6sszg9RBfAI4vbaTg+cI
	zhMuX7TGrYGYN5PeLCF3uRorPpuJ0j2cnCRomjW4RN4U=
X-Received: by 2002:a05:622a:2487:b0:51c:7b11:41b7 with SMTP id d75a77b69052e-51cbf2eeb1cmr84915071cf.83.1783931076607;
        Mon, 13 Jul 2026 01:24:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2487:b0:51c:7b11:41b7 with SMTP id d75a77b69052e-51cbf2eeb1cmr84914871cf.83.1783931076170;
        Mon, 13 Jul 2026 01:24:36 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15df03dccfsm633450966b.62.2026.07.13.01.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:24:35 -0700 (PDT)
Message-ID: <88de7531-e93e-4972-8e24-b83cc9011167@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:24:34 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] dt-bindings: media: qcom,sm8250-camss: allow JPEG
 encoder child node
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-3-atanas.filipov@oss.qualcomm.com>
 <c233b312-9077-4d1b-bdcf-75561690d181@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <c233b312-9077-4d1b-bdcf-75561690d181@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX5AmmNpocVu9m
 38Z8RUAHXza4a2DkRanLFY0mSqq912BLZishz74h10Mk1DYdMy7S7Dyz7sAdkgn02caydHDZPB9
 VlLWvSMuwLhQGCbTOpUAwTlge/QoAJU=
X-Proofpoint-GUID: w9ScRV5XaNkf6HS8UpmPMWJBPlNE6txN
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a54a0c5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=F2T7rKbpvuPzS9wY3l8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX9dwsXrdDNrci
 CGoqYpVfxL6VcPnBiJ6xAYn57tof/1uBGq3vwi5M/7xHEBLIO1mAmZRb2RX931jH4E0qDMPZGEt
 HHfvQHnPm6895+YKS8yj+KWzwlamelhXlWtpo0y1I4nnaA1/M6ZoDhMULJ9+/Gy8fwooCPLebiE
 s53DzJ2f1mRQ4jx/LMAaS88GoB1ik4UoBTgk9TGd/s1wz5ftf+dUVUT08Qyj7tVJtIIgoI3e9MG
 B14fwQqM/MOGUfdwtyjzJmm5Z9v7zRgN7p0AUzBcNJkL4Bb/c7sg7p+r2z2FOljEwy8UaX/KmjI
 LF1rry6lr4Y5/ls3u8vjC5SmFQYx+tODhlGOR+xYpI21qZJGHqkSlGpoKz6JSPEE5a9a3ejkEgd
 y5vgPza3KHCH8yDpS03mAVB9JuoHO/8VQVfz3e6jwtBUau5QmGvt/3bRXUowfP1Mu/xXochfv9E
 cfA1mO33nD7siAm5jiQ==
X-Proofpoint-ORIG-GUID: w9ScRV5XaNkf6HS8UpmPMWJBPlNE6txN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130087

On 7/6/2026 3:11 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> The CAMSS node uses #address-cells = <2>, #size-cells = <2> and ranges
>> to act as a bus for child IP blocks such as the JPEG encoder. Add these
>> properties to the binding so that dtbs_check does not reject them.
> 
> There are no children, so above are not valid.
> 
>>
>> Use unevaluatedProperties: false instead of additionalProperties: false
>> so that child nodes are validated against their own schema (matched by
> 
> This is not the purpose of unevaluatedProperties and it is not even true.
> 
> 
>> compatible) without requiring the parent binding to enumerate each child
>> type explicitly. This is the correct approach for a bus-like container
>> node and avoids updating the camss binding for every new child device
>> added in the future.
>>
>> No functional change.
> 
> I see significant functional changes - you switched to unevaluatedProperties
> 
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,sm8250-camss.yaml   | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> index a509d4bbcb4a..6008938ee369 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> @@ -102,6 +102,14 @@ properties:
>>         - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
>>         - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
>>   
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
>> +
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>   
>> @@ -317,7 +325,7 @@ required:
>>     - vdda-phy-supply
>>     - vdda-pll-supply
>>   
>> -additionalProperties: false
>> +unevaluatedProperties: false
> 
> No, NAK. I do not see how this patch makes any sense.
> 
>>   
>>   examples:
>>     - |
> 
> 
> Best regards,
> Krzysztof

Acknowledged. This patch is dropped in v5. JPEG is modelled as a
standalone peer node — no changes to the camss binding are needed.

Best regards,
Atanas
