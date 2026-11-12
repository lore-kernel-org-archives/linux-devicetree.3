Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475980;
	b=sDIUvwXv2m2D0vMwb5G8/dg7pJtSXqrSZdV5tQxdjqNEsMJhH0nuTpqo+dUch5Q2+pUk
	 9e6z+p+DUbilbSgf7rLXHZUkt70J2IgSKVuRzHmHMJRxvu2vUtJnlmOOtz1XCk2fpf6bF
	 7Ep6oYuGksZ4GGDIFHoElACO5yeC/LMJ3VFKADsBQ9Rb/137lH3FVWyPnoe8i40q6aZne
	 gIYw2qZUMbfK3/kTC9SQHUc1svDCYNpVEuhZdGy146EmqtYMTO8wxRxUBxI1U9Q7L9n49
	 bC3LP1j6C6lpL5SqZmAmnf00L2qltOhMZ5KD0zGgSeyzmVNyQnxad68c2lmIm0Ke53w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=;
	b=YsKynIdqKIEcXWyZGZWHA6mZ6n7SJ2HqRoRDj+0AiYIs6VYx6ffndvoYaN75Z19u0BGx
	 SAuh4JY5PfqYZ8D3r1k8inw3R9lowvasbZMxcFFqjcUkuDNPkJH4f7ugE9OJIzwHeVXfM
	 LkO0yLRI66elR+yW+/FTFTFlA/Eiq3wq88zR+Z3NGyVxf6FAMRAXKDHJ+7ZF+pg2OuAfh
	 Ei4qnKQhNrxOdI86JoiLagybmEAFLJ9cm/5kdUKkR6Bc4VoNeWy+09YjejVdmU1FwOZxn
	 ymYSHHA63+wTu+XeUrC2aXrqFnSrIB8FcYWs/tw2eTCIguhK2esg5YPOS4TSC0pf5iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QNEs1OqV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ky6gW3mE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3928E606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3928E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QNEs1OqV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ky6gW3mE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9JtZl2514118
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=; b=QNEs1OqVZhxSqcNz
	7CaxEGvyYxcn8sWAwKPUwf3KHCkip2UMa2qvizkBgf9TCcd02mfsD+Th3nFelV5U
	fpr1KlN7ZkMZLeiHNyMKXfISrr4tOzr4oIZfitDPsleBaB+MjTrX7nWMjKl88cgH
	hDNMhMeWDqstOTNs9TykMxIOUmaqApcZYuElS2knDaSr81Cx3eZaV7nif8X+mHnJ
	PJRNDg4on4bnV+KAPwwCW50QG/7grnxxVavXmGET/uForAz8HKBpmqq+ce+2+i4j
	1albDF1n9ctEO0og8+r2joQds1yFStNm4+A7xkdqR0nUe+7CGVvrH9XieFhYI7GZ
	AcMPnw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1txqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:32:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so3881679a91.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794475979; x=1795080779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=;
        b=Ky6gW3mEIC1B7T1WO9PFjZObF2eDUuYmhulCnTrvnrNcGCI12pwzH6V6YM3NtkLhkL
         Y04NUvtaMvMyx1rV9sVAJwYzXQ8Sc42CkSHo7PikAH0+8AtG91t28yN0bu/RJKNQaT94
         9rDr6EZsyZV6us/nIfHR1IrqRiffYooY+R6qW3Rs/UzZ8JKqR+GjmBp5qARMgvxtNlQI
         t/qy+W+RJlClfr7kDayTuEvHYWQQZP8I4nPJsu97vvnoxMMHZDPqfXLP56h1sA9G4heU
         RY6K13XfM576WaZdOu5V+F6WSqmlMtd/3U5oYF9KYCqSSLvXLBUjRcQxM+JMdRs11j5H
         zteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475979; x=1795080779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=;
        b=gE633RJjpKN99HsuPlLaZ2Qn7dCQe67xXiEVBLuAKTsC5cZw/0c/mAMlAJCN63UV7O
         +X9DPeEh0vom1DAtQ4PBL4goQdw3QMfcqZGztuLKdhNwyMM0Wt7EoX1friL9Inr7d5rk
         2z4b0MFkkvU7H+8eIusQBq9xcFSJnJVadiKSH0ffdFxwZ+e6cpD0KiWjGMneT8xBNC8s
         5Ji9rovvFVMWfLhYl4IWnu9gTX+1Z65cThTokQ9bPoRkxqjW+DgEyKk0gIND9WgFanUI
         vo3ldAfGU0fCo/n+vzb+sKyaH6zoQ8vc6XRQuuwn8vUtx2YiTb9kLEwCR+T0nmK2TX25
         dTUQ==
X-Forwarded-Encrypted: i=1; AL+hErGxyWqX7qs2htMZJnXTMY4S0sNt1QyaacKASFjrrecq2ISjaIjiScdz4+TNCHm+vwdkABXlVnrWBk+Z@vger.kernel.org
X-Gm-Message-State: APuU4Z8r2k703gFVcu/ocJ6SBDU1ucFXQe0QyKj1AP6WNOa3SU3QM6er
	m6pAJKTUyBvdpuWtaceizXzzrRqKq3clN8po11ot8WuU5ziSF+YljQMEoCc/nZiRVurV10+JXQe
	JrTCm32SIw935+fn5A6Em6GtmjfdCGuf4qv/CfqD3icB66/MMQ+o6QEQI/o5bCJ7R
X-Gm-Gg: AYBFou00UVps9L8DcS3ZqcOpGW3mvcvj8hwFuYRXf7lILkk1PwNmnj1I4WdYf1bvL+2
	q+8o96mOQr90b54jdfD57Yopovgv+SmEcNdjlsnRZK//zwbQMysNn0eao0O3Lh5E5yBB2RW8cGN
	bt148r5DRR4MDdPDl8lsqC2Z7ldQCOzfGv1NOsBuoc2YeIjhXJ/4KZblu+8UW8UaSGJyhCtmvkP
	ivqzU1phnKhf0QJevWfFYsdaO4dsI0Kl7F581mMieirkCFLXAo5KlA48O5MHXsqAzFCqOdC4Pad
	gd7NBy3O6pKWy3iK+3nTcz9T0pXEA8RY/2AS4duhysD/rbJU9RlB21ksafposlBJ4XmD4wYuKFl
	TjC6QgJMB9ku6DHDzPR6WFeGVFcqwU3LDt/7F9V4AckTVosKr2zcRMe9UELxjJUwxpFJEZJthju
	p7
X-Received: by 2002:a17:90b:2250:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3b182f57e28mr5448958a91.34.1794475978573;
        Thu, 12 Nov 2026 01:32:58 -0800 (PST)
X-Received: by 2002:a17:90b:2250:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3b182f57e28mr5448935a91.34.1794475978124;
        Thu, 12 Nov 2026 01:32:58 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d916c0sm31396185ad.41.2026.11.12.01.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:32:57 -0800 (PST)
Message-ID: <1b1c69fd-580c-4104-969b-ba09693ec6d7@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:02:51 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm Nord and Shikra SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-3-d5f575010427@oss.qualcomm.com>
 <20261109-statuesque-polecat-from-lemuria-1b8ade@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261109-statuesque-polecat-from-lemuria-1b8ade@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af587cb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8x6Hp9lnLVyU3yzMCIwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: G1qz_BlOlN3B2l72IrJTSxye4qDhWvVD
X-Proofpoint-ORIG-GUID: G1qz_BlOlN3B2l72IrJTSxye4qDhWvVD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX1e+j2BNNKceT
 GxPH2swfCfMNHiFwTzRed6GuGqV8oHnqoW2GjuxaUT5T9D/N5Zjer3l0sSixkyXaGje9mgnl6bJ
 E6BxYyuH6x61nnX2OaqyQex+XylnnF/yDYQWi0MRwi5My/a7TYeYEYy60cF1fpzVePfouy1jHwh
 Pq3AvjHVp2bt5duPL0CY7fPvWuq+RLEAAY+RyzfrCN/rXakeTVStyKSC9gE5CHDGP66ecY/nqwb
 C5x5gRPwc7N6VJJomeCQo4gL9yDyrCNXjtjlZyOEApGd0cA7UEh217pWlC+EgekJQwZWuzG/LKA
 aZohDxv8OfATAc8P0dIHfNxV9MYqNiRR+u13AoY4VfYkacjXs+BdEKSwrFPHzEcXoya3M/f7NUW
 QOWFDM8PhA9Lwb9LzhznNEA/Fd05H4Q0ncrejt38nadC5wqrq7oJUWnAsapka+fcn/pHxZ2yquE
 9t3ayY1FXlFyRU1lJvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX5trX9EiYl3m+
 +AsV5Jmi56CC84H3dTIhbFH3y3jkdbni1Y5s2MAi8w6WVZNFBJDpEATcDnMkDHk0hdwZ6tx4uJe
 uynkMoBoaVnmAT+7svz8Ff807VYMtYo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120037



On 09-11-2026 06:21 pm, Krzysztof Kozlowski wrote:
> On Sun, Nov 08, 2026 at 06:48:24PM +0530, Imran Shaik wrote:
>> +  interrupt-names:
>> +    items:
>> +      - const: etu_summary
>> +
>> +  pinctrl-names:
>> +    minItems: 1
>> +    maxItems: 32
> 
> So here there is difference, that justifies different binding file.
> 
>> +    items:
>> +      pattern: "^slice[0-9]+$"
>> +
>> +  qcom,etu-slice:
>> +    description:
>> +      ETU slice number for each entry in pinctrl-<n>, pinctrl-names and
>> +      qcom,etu-event-sel.
>> +    minItems: 1
>> +    maxItems: 32
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +
>> +  qcom,etu-event-sel:
> 
> Anyway, you need common schema defining qcom,etu-slice and
> qcom,etu-event-sel properties. Maybe also pinctrl-names and other common
> properties. The individual device schemas should only override/narrow
> constraints
> 

Sure, I will introduce a common schema qcom,tscss.yaml with the shared 
properties. Per-SoC files will take care of overriding their own 
constraints.

Thanks,
Imran

> 
>> +    description:
>> +      External event selection value for each ETU slice listed in
>> +      qcom,etu-slice.
> 
> Best regards,
> Krzysztof
> 

