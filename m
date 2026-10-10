Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACD32DC79B
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 02:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600990; cv=none; b=JHPnZoYPsiTMuz4qkyTd4pTyYRaLe30iZcv1ueEouPGvkMLK5I5V0LL6LABgiLg4x3CalSyr0wF7o4X0fxAksQE+pEFERGHd/7ugqE8bw3XQT69im6pZOXZ3QPDYlE33iVQ8vGxtJeAs+Ki6k2sHYgkoxORG2kn3hpF3clIj4aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600990; c=relaxed/simple;
	bh=6TmWKkSGeDBWaz8DbgLvcTRT7TOD0rj4IwvfWvpbCGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFDA5EJ3fXAXyzQ4JN6pAPS0+g0IuL92DoFe0Ith57el/9DwlsEj2D6X/2U7tDDk6YxhABqEhc+fcbDEQ0EvOcv8rUoeLzvdVQwZdk2hwaT87S3SFTklYyPjXYOqX8sN7mn6Ey/cfAu7Ju2ojhN+bx2nv0oVI1KDZSOr09iZO/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9Dpl1Ic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAlUi9qM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9Dpl1Ic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAlUi9qM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2plfe4150815
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 02:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoFcr0nByFsncvzYnULswKwZOIHMuD+c+aAEs6lpFT0=; b=D9Dpl1IczexHoxqF
	eYHsLdPDnRksvYvxp7c4dL+ANwnCj3txyQSGe0iUJcldda1oKUzJrYXHPYTcZAx3
	hJuIwx0LheWUjv0h/GH1zLT4JCpDNBVx4vGSX+KzhNtQAjwuLG5CA9/nLRM6CqwR
	V7zR1gTjveyxOUmCJaniKuUf1FzbyXUN1xjeEe9xLcZSs+YNUYxb79L+z86644cm
	VkT1ZQF1Ju4dq8kWx3Kjt1s7jWjR/fH+W/8ynF8My1QXYlaoa3GIFPS3wSQhrJuO
	/q2NthlweHPI0pp6DAKQyHiC816A3xuDn76AKbzvFoziyMvq9Sq/7h98hYkwQ/8N
	otiLmg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxg09t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 02:56:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso325759a12.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 19:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791600987; x=1792205787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoFcr0nByFsncvzYnULswKwZOIHMuD+c+aAEs6lpFT0=;
        b=FAlUi9qMqpDcMjNDfFnOvgLXR4OBWCiVAW1ttVX5aafJaAVWDgHOEnWxPfnotnnjdB
         VGgdzrCUQ5QXkkbGfRqZZgbDxf852JgtAac0lgnIQ7CU2GZdTQ1hftNkUSyrOEOqaUFB
         EDvfAv1AxEaB21e9Ixs7y5q7lLndYDsvptNQQr6cKQMp5Mpbon7wzswt2Jk97Fr4ubvN
         nbAFYyKar3KnVAKFITk4PkJuNXlOyqiM1hgjIawFTRW3VyDpmgxJnDOSfMBTjwuzyqxy
         FhXojqdF1RNqbhD0Rx31stSf7w3nxBeGA80JB6fEKTgH9bpm6UNXruh9EDooPTuoTWix
         QUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600987; x=1792205787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoFcr0nByFsncvzYnULswKwZOIHMuD+c+aAEs6lpFT0=;
        b=Bn8HXr79ccgTeK0vAjygsLTyxNWCvev0aVGhTa8wZqt45POBymSerlNlYgI9n1AquP
         8TXZSYhMtmjTGvwazie3Gonv6mf0kqOwgY2pDUNbns82YKOrz7eyrRjxPRZG6d4F2azY
         wFVp9SiyyNDfXl4k7YactTeUuNS+3T4j70CwrwgWlC459kbWIvhSHnrqiTEMmd06ddPf
         dlZ22xBlKEecDu/yXYq6dcAVHMPJwqmfFphth67dlOxIH0OqVvGJ5NAdhC5cQhgbwhP4
         kOJ/TofVHwGj2l0iiFWdiXcuiR28j+muBh4ryNqcaonGVtYtqWmx2Zse9VAradM2NEwu
         etxg==
X-Forwarded-Encrypted: i=1; AKwUvBwnG8QzTGRKjrEDWSflNmkoyGrIhkFwq5qdH9562S9NvcJU/Z+0fLpeBZOvArV2u5bSnJ8Whopqz2sZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLKogjwTpe8e3kgmiRZ7lcseS21tT8srYjNXj+u8Pef8Drkvv0x
	G93KGPeS/8mYiTqQnuOX/o4++5jfs2VDfsfp4yGIubW+lggiM5NZPMNTpPxWyiCvdeXb7zsIsae
	1jYNG7NiA5HWh3r5Yz4h8w3vPMLQIn0aa1beDpR0c33VmJwmQsFbSW0spWUbeF6hQ
X-Gm-Gg: AYBFou0+7vk1iyGAQQjcGbEalE64MfOGBsY6stQl2tp+btT2TD7E3IwLb9moux6PiVL
	1P1pYDWEQzrK87uHTN2MOV9x33V6dI74Qo/42cQiixQlLqVR/KnXsf2Q8GBzRcN4xnWXAR5BbiQ
	fNQRJpeWWtD9E5Fpivv9b7bj5z7r7LiAzhmkjEQSXENVOP84ES+duIspPYkJiVogWIHIcI51nqP
	qj8lC9SfEIv6wBcAQQY5NAp1xwu6XwelUMeDzO9qkZ3oG1hanXe4G1ZP5uKW5955XahGgEV70rf
	r3YcobQELOaH4hfi2xs8JaHg0b53wBGAi4vzoBxSCyf2I2GkOLPOmivLQB1EubN1fZheugGvE+G
	wUErJgIgYG64fvRJvVu1AglJ2
X-Received: by 2002:a05:6a00:1706:b0:891:3e34:e06f with SMTP id d2e1a72fcca58-897c83afb3dmr3244439b3a.44.1791600987016;
        Fri, 09 Oct 2026 19:56:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:1706:b0:891:3e34:e06f with SMTP id d2e1a72fcca58-897c83afb3dmr3244429b3a.44.1791600986534;
        Fri, 09 Oct 2026 19:56:26 -0700 (PDT)
Received: from [192.168.1.227] ([183.192.31.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c41bbb27sm1792222b3a.40.2026.10.09.19.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 19:56:26 -0700 (PDT)
Message-ID: <2befe56f-dd6b-402e-992c-a2e55ce0d1a6@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 10:56:23 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 03/11] dt-bindings: net: qcom,ipq9574-ppe: Add
 IPQ5424 PPE support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <20261008-qcom_ipq5424_ppe-v1-3-16caf43e44ee@oss.qualcomm.com>
 <sashiko-outbox-165733@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-165733@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gcBBk9859plVJJCWreN0Hi2XRdcK4UsM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMSBTYWx0ZWRfX0S3u3PBvQqNC
 i2hEfS4Zry/eG9vEKUU9HBafqkTUfiLvaYyA5zRFm4ZWK5QJAPd/LEg57YB6PBEYeSzuiIWCk/e
 6TuDKk2vFXXKof+iJ1pwU30o4B3z1uU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMSBTYWx0ZWRfX5g6mU2YUTUdn
 Qe5liyCcx5w+obdlnStJ0kV3euCoHypDQGfFAIIjHd4xDtviZL+6MVE98zLyYGklq4KzMrBraIn
 6RrKM8kbNK+WommDLtpUnP5mvR5FOvg3ZyMH2Ra9+8S6mtHOY3ppGPNEPSBw9EacrdUT4mOOXBa
 pWqWfR15xPpNc+uQ9irViRg+jgI4rbt2/6dcT6n8zcFz2X+cde3YV6kd8GtUD4K09FQk84KD8WA
 Chney1XP5IWeLJYiwwclP/04xKOC7+prA9gxA/RfdbCJQtg2oyYwdtb1SJvBfFvxOxCuX2fdbp3
 xkxRq2IGKUCvji5HzejX8dBiO89aX7wwBBLG3iJ2yoQ9r2/9ulKFf3Qx+cMj2OgcD3yKPUsFGOx
 iFeWLNYBTpUIMId4zFRZNE0JwWK244Ejb8TQiJU6MQ/t6cIhAoQrvyBQq3l2EWpdjROF0iADWpg
 cpaj5QaYKZ0KsrZtO1Q==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6ac9a95c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=N18iw5ntM+1D/B/PUaPCgg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PAOFls9YpP1Q-fK0OEoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: gcBBk9859plVJJCWreN0Hi2XRdcK4UsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100011



On 10/9/2026 10:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] dt-bindings: missing minItems/maxItems in conditionals allows incorrect array lengths
> - [Low] dt-bindings: incomplete ethernet-ports restriction allows out-of-bounds ports
> --
> 
> commit dead4fe7fe0227c2a98000bdee56dfba287669d7
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> dt-bindings: net: qcom,ipq9574-ppe: Add IPQ5424 PPE support
> 
> This commit adds the IPQ5424 compatible to the IPQ9574 PPE binding. It
> describes the interconnect paths for each SoC and limits the Ethernet ports
> for IPQ5424 to ports 1-3.
> 
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>> --- a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
> [ ... ]
>> @@ -236,6 +233,62 @@ required:
>>  
>>  allOf:
>>    - $ref: ethernet-switch.yaml
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,ipq9574-ppe
>> +    then:
>> +      properties:
>> +        interconnects:
>> +          items:
>> +            - description: Bus interconnect path leading to PPE switch core function
>> +            - description: Bus interconnect path leading to PPE register access
>> +            - description: Bus interconnect path leading to QoS generation
>> +            - description: Bus interconnect path leading to timeout reference
>> +            - description: Bus interconnect path leading to NSS NOC from memory NOC
>> +            - description: Bus interconnect path leading to memory NOC from NSS NOC
>> +            - description: Bus interconnect path leading to enhanced memory NOC from NSS NOC
> 
> [Severity: Medium]
> Does this array need explicit minItems and maxItems to strictly enforce the
> length?
> 
> According to standard JSON Schema rules, an items array inside a conditional
> block validates the matching indices but does not enforce the array length
> unless minItems and maxItems are explicitly declared. 
> 
> Since the global schema allows minItems: 5, could an incomplete IPQ9574
> node with only 5 interconnects falsely pass validation here?
> 

dtschema already sets minItems/maxItems to the length of an items list,
No change needed.

>> +
>> +        interconnect-names:
>> +          items:
>> +            - const: ppe
>> +            - const: ppe_cfg
>> +            - const: qos_gen
>> +            - const: timeout_ref
>> +            - const: nssnoc_memnoc
>> +            - const: memnoc_nssnoc
>> +            - const: memnoc_nssnoc_1
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,ipq5424-ppe
>> +    then:
>> +      properties:
>> +        interconnects:
>> +          items:
>> +            - description: Bus interconnect path leading to PPE switch core function
>> +            - description: Bus interconnect path leading to PPE register access
>> +            - description: Bus interconnect path leading to CE AXI
>> +            - description: Bus interconnect path leading to CE APB
>> +            - description: Bus interconnect path leading to NSS CSR access
> 
> [Severity: Medium]
> Similarly, should minItems and maxItems be explicitly set to 5 here?
> 
> Without these limits, an IPQ5424 node could declare 7 interconnects and pass
> because it satisfies the global maxItems: 7 constraint, leaving the trailing
> 2 elements unchecked.
> 

No change is needed here either, for the same reason as above.

>> +
>> +        interconnect-names:
>> +          items:
>> +            - const: ppe
>> +            - const: ppe_cfg
>> +            - const: nssnoc_ce_axi
>> +            - const: nssnoc_ce_apb
>> +            - const: nssnoc_nss_csr
>> +
>> +        ethernet-ports:
>> +          patternProperties:
>> +            "^ethernet-port@[1-3]$":
>> +              properties:
>> +                reg:
>> +                  maximum: 3
>> +            "^ethernet-port@[4-6]$": false
> 
> [Severity: Low]
> Does this workaround fully restrict the out-of-bounds ports for IPQ5424?
> 
> The top-level ethernet-ports container lacks an unevaluatedProperties: false
> constraint. Because ethernet-switch.yaml (included via allOf) dynamically
> matches any port matching ^(ethernet-)?port@[0-9a-f]+$ as a generic object,
> out-of-bounds nodes like ethernet-port@7 would pass ethernet-switch.yaml's
> checks.
> 
> Since this block explicitly sets ^ethernet-port@[4-6]$: false but does not
> cap the container itself, will ports 7 and above silently pass schema
> validation?
> 

I will update it in the next version by matching all ethernet-port@
nodes and relying on the reg range limits.
