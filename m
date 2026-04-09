Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50973A3E94
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728728; cv=none; b=KMuKZBuFzlvAC04P7LPC0EtoOgVTw+WBC81MuuoD8S7Nq5RZ5pIklKCWhqZKNYVebjx7w+EwbZbv2/6SOnfGvqm8D1USDG0TKFOIifC1cZ2ajx6UMEFKPyfsQNHjfeNHY5kNqBDwcP9d8DzSLQFff7cIIwsiluF+qnjVyf9/fMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728728; c=relaxed/simple;
	bh=RFIO5Ygsi54nu/E6qPofsAonhzM03v473H19OVkrDcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BYSmhYoZ7Y3eaiJf8XpojrtLmRg2sWoMXBM13I/7VkZnFr42+742ZEk0jS4S1ZLdjvNkq+OoxoM8zIKg02KUXT57o8d4vqPByolJnF6OOmI+AMvIElCDi9FwBPqSbHhNOnpweiYHTG5pgcAI4e0B1MbXeeGDW4ExBnDAqD2VEio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItuBgfmc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAQ1AnPF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItuBgfmc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAQ1AnPF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397ManN3781421
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJ+jo4qMJc048CRlu7Zistk1++CeTHJY2gPbX0b2qkA=; b=ItuBgfmc8Q5H8wmP
	BFaeoz/FZ3V+4LuqH75djkoSAW/BKUf9BNjJDRWgHLnldnROF2n7tMfYPGdLpNu+
	8CDEG26NxkhFWi9qd+M4VSvlTMPIIzeZEtbIwB2SbTxXDwIaAdj1way+3Pc0GzQf
	aV9cevkRP3xpak6m9cM91Y5/Q2DdB1im+DapQwbexxIwC1ZS4hdMOlS9zx4X7Gwy
	tg7jAuf23Y72CAx5SfAuxdmChMosRBxqjjIWvmLY+COB7RxqsCjDVEXWxJIzsCv3
	K3DFkQEKwQBRxikok1+o963vEGSYQxZpm11W0fkPI1iC2sCF5+dNJnB6P20ACRr3
	tUJnrw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6ybfva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:58:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cd541c0edso3867706d6.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775728725; x=1776333525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJ+jo4qMJc048CRlu7Zistk1++CeTHJY2gPbX0b2qkA=;
        b=RAQ1AnPFkk0V4XQiAaoaxPHkYKiy49wbd55rnFquXwa+KbgmZDbVtafw9iZIQilzPK
         tua7OQ/LlcHTJ/VXPMPmRyhGd1mM4wcOVQd/C4tdJcvtNoJ/kAYrWT+LH69ZCnm3XSwz
         6QrdVCYNF60XClNOfJ+IsbT5TupveuRfftVtT7qk4dKvg9GnAhNwdHeS5Wu9ZMVOuPNt
         DMO5VCdyRpRoqYQYtD3AtIpKjaT6BlESyHoA2/QAVm0HSivk3+8agd60hLZC7iT4hbzA
         jryEkb521SeNrR6RqRxbt8YjPApBcNjijNDgrh/kibd/dsUatIAgZqFf46npAVEWKvdT
         FA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775728725; x=1776333525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJ+jo4qMJc048CRlu7Zistk1++CeTHJY2gPbX0b2qkA=;
        b=cij+4KM7nvdb/hB5ntvtolt7KrKLgqaz3LlafLSDC2Vmm5RYPZc8PLcqs7zRuBSqLc
         6/7ha1Bw+tAVf61VB2lEVJoEKPp9NEYVw+1qv0LFzxm9fPHWa6veQKd8jhkqrvk/fgre
         G6+Bs3I8TGJMZORl+Bi08l9XwwpDe4LcjVxZ+lqa9FZFMJWFcB098YjyMDDQACXSZDDU
         H3pUwlVUyZcv6jYb/IK3s8OVfw6LWlEMXYN5D0BTJe7J1UHrIMLeppXq9hdLIAgX33Cp
         0B1WzPj/GqRn2mJ/xZSw6shYU3hlSKO8anrtDLkhEdkoj6U/THyUvY2m1mvOrSVzcN43
         o6uw==
X-Forwarded-Encrypted: i=1; AJvYcCWGBFETjCcBfQjEJpXbbm/pJtJdKskN/hbcr/dyDQ7/s0KD0pME7Pt2dD+ZEixD2+tRnFm9nXM6cVbK@vger.kernel.org
X-Gm-Message-State: AOJu0YwQz5TKEXr4rD5AFoC9uKs2D2AoEz7WM7G0vf/YOX45Y5HI4x+g
	6uazCC01mvJpXeBuCqxwCF2BPZq82HLbHhCnabzhqezLgPpMUTUafeTHGloi4VBPu09CFWNEzLC
	/Y+3QxehHhv6vj3suh3Lh9hTUQOB+1jmIdG/nCyVon6QTQA5/X/z46hpCpU3SE2wq
X-Gm-Gg: AeBDiesD06oO7d3Bll3HSCk69SUaE46R7qXoC5Sl8mmAvuM7W1PVoVHmzRi+3YAb9MC
	EJZZN83mwjAhfx5p/tY1i1OtA3kYSDUzAgnkLlrXp8TY92mzj5lZUxlMmHKicsYhg6tEqaW5iCE
	KhXYVlZle6aKrQUWmTt3dIAwNgSAp47xSNkot5JgLtTsJ3IhOa27MVUikNUMObalLzTx+Cwpur/
	uWB1gkcz7pwLNEwFtCYUrox5ALsl9/tTYkLqKa1pcjfqGEe4sxHqoJ5jTZ0GxOB1pboiUHJfnUM
	8efCOZqe6mwfPhW/+59N1qPAMiMnDNfiY/CToKWyalZbzylVhQbPzgmNbRC0avPUgN8rF9fUHy9
	dH7fH2jWvjkv84kWUSddqd2ApUScrL0jPmYzYDJWazaM+yYaLhun+cMsksSDUaB+P5QEkigrUsC
	QEu78=
X-Received: by 2002:a05:6214:cae:b0:8a4:c5:1b1b with SMTP id 6a1803df08f44-8ac63ee9e7fmr83232836d6.2.1775728724784;
        Thu, 09 Apr 2026 02:58:44 -0700 (PDT)
X-Received: by 2002:a05:6214:cae:b0:8a4:c5:1b1b with SMTP id 6a1803df08f44-8ac63ee9e7fmr83232596d6.2.1775728724375;
        Thu, 09 Apr 2026 02:58:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff1c3dsm724630266b.49.2026.04.09.02.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 02:58:43 -0700 (PDT)
Message-ID: <971ca6eb-1d52-4496-97c9-0e1208e6e740@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 11:58:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: sram: Allow multiple-word prefixes to sram
 subnode
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20260408-topic-sram_dtbindings_misc-v1-1-00556167e136@oss.qualcomm.com>
 <20260409-augmented-stalwart-crow-3fcd3a@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-augmented-stalwart-crow-3fcd3a@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xMyO_exQSTebxa_uS3Ux-Q4su_ZezVcC
X-Proofpoint-GUID: xMyO_exQSTebxa_uS3Ux-Q4su_ZezVcC
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d77855 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wngihDGEaqkxMxDrrewA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4OSBTYWx0ZWRfX/bZQEkkeZb73
 wkRaaVbmUQNkRFb4a7FDKzw/bbRYe0RSGdUoutgFqbKPd+RNlZFc6Ds5DYjYVZEbJeQlZajHvSo
 CCISgKJ+z0uMzyMcV9e8QR9culBzPHBFhzHhQgZX/d+0lPjFSrl74+qmDZmEGvSKBAtOF0k1Nk5
 hxpTzSiujrSLZHiY3lNVFbPbpLOuovvf03EjcTlFrCw2zKbfgO+CaRRMVjqUAbKYPAgZscclYWT
 tafIAGxIXKs95yGzR1b742vPf0GnWX6qv5kh27G2cIW8zk3tS2qXUxRCor6b/M6o/Qx6tHrvAgh
 7dz863YtM6Z65O8TTyV0XlR2Ff1tawv5NZxU22+XPMrAS6tpdpBnwxffN6EUj8trOJjw1L0YCKD
 ThzYSKxkOopaULl04ZWe4TQdtJeWPFgpALSECkCf+jGylvH/N+9oznW68IigUhAOl8plsZDv6aN
 yg32xsiWO27NVmluq3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090089

On 4/9/26 10:45 AM, Krzysztof Kozlowski wrote:
> On Wed, Apr 08, 2026 at 03:28:13PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Currently, foo-sram is allowed, but foo-bar-sram is not.
>>
>> Allow it so that more complex names aren't unnecessarily simplified.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/sram/sram.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
>> index c451140962c8..b65c2ff846f1 100644
>> --- a/Documentation/devicetree/bindings/sram/sram.yaml
>> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
>> @@ -65,7 +65,7 @@ properties:
>>      type: boolean
>>  
>>  patternProperties:
>> -  "^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$":
>> +  "^([a-z0-9]*-|)+sram(-section)?@[a-f0-9]+$":
> 
> '|)' is an odd syntax, not really intuitive. Why this cannot be:
> ([a-z0-9]+-)*

Might as well

> ?
> (replacing also * -> + inside)

Yeah good idea

Although, as a fun tangent, I just checked and DTC accepts node
names starting with a hyphen.. We should probably change that..

Konrad
