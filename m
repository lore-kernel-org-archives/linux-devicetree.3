Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3FD3FBEBC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187256; cv=none; b=g1kNoP+/4NDBGL8DCPnqW6H1Fx320k8p0qRs6vjhwELWVPe/6pRNE9C194xvk8yhMARVCK1oKtJ/3ZdfJt184vboiRUH0qVh7saMoP0g6bUNcCUlNKk2EeNmIY71EyLXnWKzLquvzpykrF+4rmDdHnZKIRwA475lxoISIwv4BCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187256; c=relaxed/simple;
	bh=/KXfgHqvKtIKL7qU20XZzM/WnBHXM4OFw2OoYJ39uDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJpqIz5n4BAMg/fQ05PIwJa/rR/77IWAzVwx3b4z/FBfmfDizt4sJbkmjT3ByvlWXaSxn22D+uVB/yaZDx/dnooJPtGjVEoTckYCHK7gjtXhRt9eoIJl4FdmgiAsb0qqXVi309Dnqbx9xgc7kyK6rrMomynBOJJ/+yFayds6Kjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/Qln5nu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YI0XGX1H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/Qln5nu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YI0XGX1H"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCSpUj546417
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BT1cmZgyC5OEU1NGiHjMPSjXyj8whKVB9HRG3NFstnE=; b=R/Qln5nuVBgPV919
	sfIX6c1x5AAUsW+SqhU8GbRqOn5FZxTnLGF5MMhTjop9k1CUzkBfGHVUnlWWwm1X
	1Ng8RG2z9BRw4UZI/gmpL9ZUyah+dbAMp3/7yoS4MCRk+h6YXmrIgx5LFtcRGtAq
	FACCU7+UcuEKjp+4DJVN9iyxc4xpc9q0qNH5tZkaGER5fiwr5qk1pr+BDX/3rVIe
	G45pLBwkU5lLfN/gtJIjtsuopbAxGvhvZH44xYl70gphNzjymbz+1RRKnQawi3Yd
	mj8E/DyNSYI9M+rp0CI2owsN3PhGB0qPST7FnV7pIyJQMJcgSbCXSkKn1sLa1AKm
	fF+CRw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6skw9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:14:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842278a630dso9922871b3a.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781187253; x=1781792053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BT1cmZgyC5OEU1NGiHjMPSjXyj8whKVB9HRG3NFstnE=;
        b=YI0XGX1HAgDkT5L1E5TaLTgMTs8U42xWNdiq29xvjKSiz29KFmXI5pt49QnB4Y31hp
         w/K/iNwQ66L4Kib3ldHpU0uXFpdnLQqc3iY2Ppt82VAuhcg06zPxnyqxSMIaa7tbBthn
         BbzanQ06y/amr7TkeUH/IaGMDKaj3ey9QhCVPdli3GyK0wIFoREkKNNg8yEUQyMIWCXK
         rdzuW/pu8Wiegk1wABo7cgACmngqn4JBsH79C209nTRC8KZks5bDhMdkJKVB7He9qoSL
         wPzJs88oSXZ6AZIBONg6ZE+o+z1DHtx1dZyy/BIfkoGIua8oU7ETI5/CiqnKyXX1Ior1
         ZY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781187253; x=1781792053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BT1cmZgyC5OEU1NGiHjMPSjXyj8whKVB9HRG3NFstnE=;
        b=BguDtUK/oW3ngqBRMCjWvj5yhLvCp+NR1UibhLcvYiG1qc4/qIKxoUAz5jvXl7emNd
         /UoNevwvTYJ9RZvseCMwXPW8hZuaRvmsQknVjFlgKHRbLwFxS4bjgtE0hh9dM/SUf2nN
         /TN3zralgNmCUxihoBK45Y7tB0Wr1JTgym9ctbtnSdW7kLE3fdvrOQduttrsDtGnqgz7
         Z/Z7/HpRVWFvC04YLcV3fT09B2EKx2Acf5Ftr9imJ1HDDaPVOTjRa7cnnGT5oEEhrEDo
         FjWhYXSTJFOcVUxA3Ff+5ayTUo2Yxwq9ALpqbOx/wVsNupVsOudYmn2ZKthYQ8/zVd/k
         S30Q==
X-Forwarded-Encrypted: i=1; AFNElJ+dqrgSuvUUMmmXWE3XoabObhsSOG3/MrR5la/Ba/5vVA5ZfxkbneEfsvkVWxCtaDnCotPyg0JVY8M8@vger.kernel.org
X-Gm-Message-State: AOJu0YwKE+np5hjeH0RrDRcYD0LS9He+jM0xLZqQUn+1dbGcMlUYgRCT
	KU/5+RHp3ttDWL41k8UbYMTcpMffJ8cxNX5hMpfD2iCOVKSaqGxvAoJbiuoWjtOc6fEKgJZGFw0
	WwNptaGpZVKzlsgyjDLm4+wV3ryZOY6SvboRU5liCRbSCc4vmQmNgufiBJVKS30qs
X-Gm-Gg: Acq92OElX9o0lqBMxfr3XnJUEB7CHlzLqL2kIgVPk5F30i6aPNPKI2SJOCLY+DHDxJ1
	aESFJckwBqnKYTfd+z1UCLPfkez6dEAUTLDA20a9TcqFTR6NqQ+wBcGqRZX1bVjIw4AfiP/0vqZ
	0Hs8wAV/SU2/FpyHOoydvS8BhkVilI8IjtCcC7oE8n4IPPgAb4aLwrPlnkgP1MI1ZEnIOrKAg51
	x19SnZrkvoorqyoQ9LDqcN4jA1Ow/9y7iU+V4oS2VhLRtUmNjkD/v1LT3CpmG+w3wBb5k7YJVVu
	S1ThJI7Ov6KqleLtX2HmxlpOvG9iz/tCwIMx3tr4wj9Bsa2iVoorBvs7UuEEezldl4cHbyiYR9e
	AdjJ3GptAJ1Zzy8HUhNzy5MX3EyKaqE6YAT9+/90j7WYkWznUHmZS9km+lJ9azRFcxeBB3geLiX
	yUUbMHu5AlRqFLcXar3ixsBg==
X-Received: by 2002:a05:6a00:8d8d:b0:842:6004:3fcf with SMTP id d2e1a72fcca58-84336a8b12cmr3445492b3a.29.1781187253303;
        Thu, 11 Jun 2026 07:14:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d8d:b0:842:6004:3fcf with SMTP id d2e1a72fcca58-84336a8b12cmr3445454b3a.29.1781187252798;
        Thu, 11 Jun 2026 07:14:12 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337be7097sm2391884b3a.24.2026.06.11.07.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 07:14:12 -0700 (PDT)
Message-ID: <ec582b2d-012f-4bba-a247-4b7040d02df9@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 22:14:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dt-bindings: ufs: Document static TX Equalization
 settings properties
To: Krzysztof Kozlowski <krzk@kernel.org>, bvanassche@acm.org,
        beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Zhaoming Luo <zhml@posteo.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260610071516.3763916-1-can.guo@oss.qualcomm.com>
 <20260610071516.3763916-2-can.guo@oss.qualcomm.com>
 <b62e7f1a-bc13-442c-ad7b-0969e3b9073d@kernel.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <b62e7f1a-bc13-442c-ad7b-0969e3b9073d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2ac2b6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qkbM5XvOScw6ZQYEvzUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: jR7IfWL6erFdStMVwQ89qkU0Fb1sQw7x
X-Proofpoint-GUID: jR7IfWL6erFdStMVwQ89qkU0Fb1sQw7x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MyBTYWx0ZWRfXwuXrfBF3wMmn
 C3Izn6AQ5Y1OdkWyJxSvg7T768dWh4pvNVEp2hvvfRK6jN/oqmR9SwHScIFWvg1kROFDMfzgIdK
 SRRdM+UFWRvQK/Rx8sXQm/dKFeo1w2L6eMThC5HerGksNuZjBC7Mus7db8/1XeQ3BDzhScU22nx
 Qoxb6DK0KajP53ohVU2aBS5MiL715cknJlV/jgFR1DV97CGT9RO10UK0j4PWL1nJShe5aUEnIvO
 UH0/IYlzwLJgP6hORObJuzLcdmIqWuaNO4R3UmTmL+UAYhLGNdMfuZHvxlxVWBiEQ6zg7XUMeZB
 1D3jQpZx8vrYLXRicGdQkxmWhyl7nR82mpkkbwB15yLM6XZLwZqmtA5I6u2jSpGkMso8B++gkyu
 VMyyLgLdtkPKqKYRntnTtgHDl3hzY7swpB3hCwNiMh5DIaxvZHVgaK0bd55JxjfZN0Pj4iD5iDW
 WpmiUWmV5z0tF3Cnt3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MyBTYWx0ZWRfX9lQyExjS8Cbo
 Nx9p5R7WKDf4cAQT/fzO87lGWHevNOYqQCXmNrTrs1r3vhkhlfC161z6CgaFxi86STWVQM2haD9
 VJ8+V0gslLVEd2H3+A+BSrMljN9FmJ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110143



On 6/11/2026 9:32 PM, Krzysztof Kozlowski wrote:
> On 10/06/2026 09:15, Can Guo wrote:
>> UFS v5.0/UFSHCI v5.0 add HS-G6 support via UniPro v3.0 and M-PHY v6.0.
>> These specs define TX Equalization for all High Speed Gears, and HS-G6 may
>> also require TX precode depending on channel characteristics.
>>
>> Document vendor-neutral DT properties in ufs-common.yaml:
>>
>> - patternProperties for txeq-preshoot-g[1-6] and txeq-deemphasis-g[1-6]
>> - tx-precode-g6-host-lanes
>> - tx-precode-g6-device-lanes
>>
>> txeq-preshoot-g[1-6] and txeq-deemphasis-g[1-6] accept per-lane tuples:
>> <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>]
> Instead of repeating the diff, you should explain why these properties
> are needed. Insufficient explanation was also pointed out at v1.
>
> Why this cannot be deduced from the IP compatible? Does it depend on the
> device memory? Who determines the values here and what do they depend
> on? Also here you explain lack of auto tuning for example.
I will give more explanations in next version.
>
>> PreShoot and DeEmphasis values are 0..7 and accept 2 or 4 values for x1/x2
>> lane configurations.
>>
> ...
>
>
>> +      Lane indices for static Host-side TX precode enable settings for HS-G6
>> +      only. Listed lanes have precode enabled; unlisted lanes are disabled.
>> +
>> +  tx-precode-g6-device-lanes:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 2
>> +    uniqueItems: true
>> +    items:
>> +      minimum: 0
>> +      maximum: 1
>> +    description: |
>> +      Lane indices for static Device-side TX precode enable settings for HS-G6
>> +      only. Listed lanes have precode enabled; unlisted lanes are disabled.
>
> I need to reverse my opinion and let's go to v6 implementation. These
> properties look more consistent in v6 with respect to preshoot and
> deepmhasis properties.
>
> You want actually matrix, so:
>
>    tx-precode-enable-g6:
>      $ref: /schemas/types.yaml#/definitions/uint32-matrix
>      oneOf:
>        - items:
>            - description: Host_Lane0 precode
>            - description: Device_Lane0 precode
>        - items:
>            - description: Host_Lane0 precode
>            - description: Device_Lane0 precode
>            - description: Host_Lane1 precode
>            - description: Device_Lane1 precode
>      items:
>        enum: [0, 1]
>      description:
>        Static TX Precode enable values for HS-G6 only.
>
> And similar style with items also for preshoot and deepmhasis.
Thanks for the suggestions. Will update in next version and come back.

Best Regards,
Can Guo.
>
>
> Best regards,
> Krzysztof

