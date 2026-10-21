Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583039;
	b=VyucAzAeBNiyXcRkw5dDdkSYou0ubfG3RobYsDZREpTiJo/S9Ia8xMuCqeZYgc60ZpfW
	 6hS7+wLDLV2JvJKbjR+SO66UWZ6nulf/iNyJjegGgybN6S+UFgqgvrIP/6s/EPxdWUAe6
	 DatnyJVh8DoPE0sqsWKvxnw8nS6EtOtNY0/fbv/dK+HURNKSqTvkaPOForNEWRci3Xl1V
	 0uzrOTmE8SGd3TixCaFmDwo7Bo+w7kgB8dJ6qgyRVnPhel7a7rDcnaJnWQZd1H0I5xc55
	 vFFnfBlwZZaZYO/j6uhQB7b4eMCk2Jb7hdWhwIBbVcMwVZd4X0PaitGxQxo/Ns1vAcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xIPW256AZ+imGupCIhtsV229OdDYpy+ktfp8HqshjI4=;
	b=UfE/d0diovoyRlwxgsAAE1vxuT+PxLmipsBz1P2qI+g2czaNpN0wChnKoVX8vjV3YHQ6
	 OCmhTa+TlJbQW/xN+EyoK8RfI6c4HMlthT5gx8sCjIyfrYCh5CqQrGLkVaD5dLB8V6Nsc
	 PaQZnDXinU2noLYhqXQORh+fsZOjcFqimxKeUkwWbdi7f79N8nbtYT6YX+RqHm68AZtCa
	 QFWzUjC08a0/dC0o2THgdWc8i9mN9EgvCap58BUDuUZlERPzIkLXG9vIwW5g2n3X/y1lj
	 CPWOEdbMyBiSzT4jwB9wUlC0ccusQblx4nMFFDJcSyfMHhJvPjnYjNhg8aLLEb/2N7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jyaCsiy4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AD64nvaL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F52606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86F52606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jyaCsiy4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AD64nvaL
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgN064168163
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIPW256AZ+imGupCIhtsV229OdDYpy+ktfp8HqshjI4=; b=jyaCsiy4aRW2CehF
	5U2ELI2XhD/nJsn/SeqVsAyvJpvuVqUuDoTe8ANndyE9mJuGJPfohQMIGRVotJMW
	syNqmJR03oYobhS3xe9DBgjGjjgWxw8h5tCNh/JtltZtbL3yHzTxFg4mk0sJ7gpS
	V3pFFIoAyzW124ZTpK7FApBHz6e3hZlPICy3gIcQ7/EKhapEFY7wuHkiLd1zkIQ3
	YmkZd9rKdD4XIz/IHUa94hyqbBugwbLgh6G06s17bBgJdpI6ue3KUnF8BzytFQMe
	Z2wXnSDdoQBLoC+KGYjdDg71g53ungFzt/wzo+EKZlTKr1EbTAmFXhAwcpT20nLx
	OwQLyA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kpte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:43:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso992638eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583038; x=1793187838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIPW256AZ+imGupCIhtsV229OdDYpy+ktfp8HqshjI4=;
        b=AD64nvaLC6JMPj7YMlRVwFVPm81RND35cCscgQLcsWDLBU+iaZFB67+ZS1+k+n1qeG
         yA5IjRpgRW5fY+cfUvIv6eW0eBco9HJpXCaJWU2/pe8mSSPE3OYRdYRDhgHSUy5RNbqv
         DPa9nIljoGzPY5OoIEEKmISmXQC0Ug/Cc6E98WQJp+OoF8hLwsjSrna93yIkZtwUApQw
         VkoouQJHDoLn9RFuapMdte3Ljjquv26D1m1G/ga8QmG8QM7Lt1ATEBZQ1A1jN2CHNpHh
         Si6vX6I9XTLNXTF+lPke4PcXFaMPKrrmD8gdSYAkfzP0nObkLmJTyrj1sL42zWJP9AJQ
         XuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583038; x=1793187838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIPW256AZ+imGupCIhtsV229OdDYpy+ktfp8HqshjI4=;
        b=K/t0Mg7vs79b1PTKDFFoabEmJTsDCRw17Ra8oJ2V19GWcFdLGqbpTTVAWsbuCiqq4H
         z3R1qzaLwvYdLV4OjyFcU95eqTm2l5jo0w4MAqRaTtgdQexVfrnkpSmBaBt2GFbZH/D2
         62I+pWjKJFfz7Je9osubkJo12PATe8TeVwm4tNkTRkzGZORzwFzTJJCsvdsbvqtVhfP2
         ufOJMlykUUC7iOWXqJX3FAjH+7oW3UEdpKzE7xY7yvjiIW4HiikbKyKIGmXcqwcPWW2N
         i86n9OIS2XnKven466gpR2zgOffYj263kprnldTt0xUeMCkByHtdQzuUMJsp+D4LvUMD
         RcAw==
X-Gm-Message-State: AFq9FYIolGDDwpMwnairhT71yUa7XSPzqESU/pXhdpPHp2t7DQhadPy8
	CFwCDSOYtI6/TtGWNDHZG3UZOG21INUlAnvlsAOz53h7PPlOS+96eL0YAdvK/7KA+i2mIJO6LNm
	i03VA8qWTVIpKgvu6X3z1DRC3MpeBkFjCdcAHQklXWF9bVokQx3QsH76HtAOh9lKrdGrXyhr/
X-Gm-Gg: AYBFou2rt4CGcneXoENcJOnoFVODGjEC9ZI4qFoyCiZzDV7Cvq8zjeGP6CZhgvdthW0
	DPDcRlMuuZ0j0p4yR25hYcJznZFSTeYR8WchMTAo0RfU5fXbQhN8xHWCU5YUS9FN6xxBy2XaoF1
	6dE4FI3LPLhgEOHDMbDaXbB6Cgdil8NR054IgQLM1s0GBwZgsQWjqQRkX4qFZ2iKJfo/t/bPaTt
	LBOxnZdFn3wsDZNoY0uZnkkv/g237Bi0v53cBunZppnW61HhtLS4LMHcbhI3QbJ95JYAqYv2akT
	569kaTjCVKiSA8+qQLf1twGg01v8EN5X/18LSmPCjAdQxcje+RWStq4hFGVzl6XFLb0nlE3Qx+B
	nJyuGFg+95GyGxCfbcmPLekmo6pW/ky75
X-Received: by 2002:a05:7301:e116:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-3674e0521f2mr2798224eec.22.1792583037698;
        Wed, 21 Oct 2026 04:43:57 -0700 (PDT)
X-Received: by 2002:a05:7301:e116:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-3674e0521f2mr2798191eec.22.1792583037124;
        Wed, 21 Oct 2026 04:43:57 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bc89fsm8009104eec.16.2026.10.21.04.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:43:56 -0700 (PDT)
Message-ID: <be848b5c-8d66-426c-8dca-4358317e2a89@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:13:53 +0530
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
Subject: Re: [PATCH 1/4] dt-bindings: cache: qcom,llcc: allow optional second
 interrupt for LCP/SRP ECC
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>
 <sashiko-outbox-171513@kernel.org>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-171513@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX+t7ARM470dZA
 T6ugrVbYuXfrJr5Dvl0ANiywhlpoJ/ZzqCDyBK234q0fBU7zcIiTLtORclf5OZRqF7YZPy6bt9m
 liQYXthew4cQBgc7RcPrQ7J+LQXqxDYcot10apXkv810ssFBSH64E4+jWF3yPQINccQMTkZS+gi
 TRYtFlCXR4rVbJimZ2Jhrtx4JRkljbgu+cuAyByhH0hqATAD4cGTKgt9INU1ZupmenjF8Ycgwuq
 E4M5sTFGqfO94HMGGLTLZhE1iL2V//xnzHtKlZrXCyAD/Dj0X9VswGqGbQCTlniTO0EcL9bRdAB
 3AYodYHHBu8hd4mDNZ6FYxIX4gPfrAPL1PgY1RiILtWb8uEVixN74ayHAVX7GbDxabBFtktYnWA
 XNzczhw8B2G0H8jEB2Kh8buhFqrmdGcb9SqiiRxBDeBofbxCPanPWcKOMfIzOAYPnHAG+MRHyhS
 wB3P6wDz3zO1q2ylMSA==
X-Proofpoint-ORIG-GUID: Ye_9ElM5P8gbgq_bjyzm19BNHyfP18hG
X-Proofpoint-GUID: Ye_9ElM5P8gbgq_bjyzm19BNHyfP18hG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX3H4MAQYYHEUD
 BYko12iZgRS5Qt7MsduKLN5aQ2zC+eKquunm2SWL3FC/V+XPkhSPuAeLFlS5G+JEUOVddONw4nQ
 GE7+rPQPFh+Dw03XnfDwRlUNA1hRhA0=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8a57e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A_4eXHUubm_z0tGzWTkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210046



On 14-10-2026 21:35, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: missing maxItems constraint for legacy interrupts
> --
> 
> commit 50febfa0c04f4bae15f676db2e6662c8855b0e3c
> Author: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
> 
> dt-bindings: cache: qcom,llcc: allow optional second interrupt for LCP/SRP ECC
> 
> QCM2390 (Shikra) has an LCP/SRP block that signals DDR DRAM ECC errors
> on a dedicated interrupt line separate from the existing TRP/DRP cache
> ECC interrupt. This commit allows an optional second interrupt in the
> LLCC binding and enforces both are present for qcom,shikra-llcc.
> 
>> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> index 2141e5d4de63b..3546cf7c25195 100644
>> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> @@ -64,7 +64,17 @@ properties:
>>      maxItems: 18
>>  
>>    interrupts:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: TRP/DRP LLCC cache ECC (ddrss_apps_interrupt[2])
>> +      - description: LCP/SRP DDR DRAM ECC (ddrss_apps_interrupt[1]), present
>> +          on platforms with an LCP/SRP block such as QCM2390
> 
> [Severity: Low]
> Does this implicitly raise the maximum number of interrupts to 2 for all
> compatible strings?
> 
> Since maxItems: 1 was removed globally, a device tree for older hardware 
> could erroneously define two interrupts without failing schema validation.
> 
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    items:
>> +      - const: llcc-ecc
>> +      - const: llcc-lcp-ecc
>>  
>>    memory-region:
>>      maxItems: 1
> 
> [ ... ]
> 
>> @@ -234,6 +244,20 @@ allOf:
>>              - const: llcc1_base
>>              - const: llcc_broadcast_base
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,shikra-llcc
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          minItems: 2
>> +        interrupt-names:
>> +          minItems: 2
>> +      required:
>> +        - interrupt-names
>> +
> 
> [Severity: Low]
> Should there be an else clause here to restrict legacy platforms back to
> maxItems: 1 for interrupts and interrupt-names?
> 
Valid finding — without an else clause a non-Shikra platform can declare
two interrupts without failing schema validation. Fixed in v2 by adding
an else branch to the allOf block:

  else:
    properties:
      interrupts:
        maxItems: 1
      interrupt-names:
        maxItems: 1

platforms except qcom,shikra-llcc, which requires both.
This restores the original single-interrupt constraint for all

Thanks & regards,
Mohammed Faiyaz
