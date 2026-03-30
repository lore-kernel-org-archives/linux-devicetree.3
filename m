Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911CD396D1A
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853416; cv=none; b=RvG/Ga+d3wn1XaKpbZPU0+1PTRe+Q2XfQP6IzmEWRd8GcQQwRp2SYli+ymMATEl3XlWrr/UyPqnmVm1CdE1DBYKQaL5rjJSKXZeMQYFT0tjY3shZjCGBGjSAEBUX6OwMdhmknKvd5bkOeYT907U4rdhop0dA1U6bEyl9xU1Ca6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853416; c=relaxed/simple;
	bh=je6osE2miB0U5fNQUle/gyUsHF8QHGaoopvitfw3pDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rt6RYAPpvbR5uhMkEy+dp3Au0kSu8RRYNxBdaf0ZKY5DPjPgB6vYS2aAtkYaHFFA+0H+eu8xmB0MXgjRX0dsXdCjJ6Y4CgP1+oiIIiHjLXEnd3FGPipfu1tLG+hX2mCQn3ThChD7pWRqEmupkpQK/iJIYiclKDqJDM+Z6LZ5zaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k90y3EVZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXxHuo46; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k90y3EVZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXxHuo46"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TKuJ1K2055784
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8EzE5ONVAec5XrV//KBWMuylVYq1TDy1dmOy2l/5uE=; b=k90y3EVZTYdm7rKs
	KzwjtwXk17gkGy7VI5GG36G2JC2x81EF+92em8EN6w7oNAqdaMRLOVzOeJI+UnZa
	56mcdaf2EdxWtgM2HZHcZbwfWEgKQWhwzorOo/5POWWJIcQaNuvtnQqn0WnE6ky+
	VXITVfJZtx8DCL/pDaxqmxjiGlTnyem5nCN3kb8atEbEDV4RXrkEDyXIKz5jdaEO
	jCpbynL4vOroGGJUuaDg6h1b9UUbsdGxZM1Se8IWYbqHXAzKTWFaYmU6Jf5Lup38
	v0Bx08Sgks8B8BgBnHGZuwj1UezdwHoOfxKjliMM3kgBi2Pw24gMg2AuvEAv2PF0
	58Vprg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7cv2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:50:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23eb4f94fso12495925ad.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774853411; x=1775458211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8EzE5ONVAec5XrV//KBWMuylVYq1TDy1dmOy2l/5uE=;
        b=RXxHuo46daNGT7GY+8Yvct6JesLqA1hMLHitFeMHUq4Qml9eYi//ti1SvFu2t7pS59
         yrX4oQPIN8NKdqi1mWzlZJLeLwboLduz2IYkMsNCLlxOCaDNM4Bo0UTFHZlpe/Zm6ERj
         jpFD1ph7OGsFv/JbWKzG0HwoIpWqwhbEwgU4A25tPgxLNrPCL0KtKe5Mieyf8Fhw/9yR
         l8EWsz8JFOnc8m+iPa1KnCDZTFKerGgbLQI3ezbMcpMdzElFP0vfS1tA8oreikUnOXEh
         +o9koj2ikQ5XpCx8v23DfjvbzCSLK7lgbYzXqdfiVlrqbGqtrmAghHrI+1cfwQRl6PBv
         PPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774853411; x=1775458211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8EzE5ONVAec5XrV//KBWMuylVYq1TDy1dmOy2l/5uE=;
        b=NW2SqI8oA8CDxbC9aaOAmFd0N/bk/G9gNpwbtLHzH5yR1SoKf0f6leTrXLABeiG6sF
         KmZPOjbO1W00G2CIcUz35fi97XfeODrTa/HEMhBqdZaZMgifGR9fFXpl7igozoNZrqbW
         AnChxlXAi/jfpPWmIk0RRHpzeWDzfXL8VqdfrklZ4wZFqQm1ZbMOEXPEU72QCoolKE4Z
         byiQOQLY4LUiUy16wKNd7SBWpbUtf1453R563b1pSRYBn7pu4KohSG/Uzs5Gd13EYs1D
         ZL2EwPgBAgVqdQVDkZHbHbsAFRbdXd94kNQ6eq/ysBxsN4jzCVfh9hhhrGzGoYMF5dtW
         gFYA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Kmxacl4tn5stA8Z5dwOq3elJhA9D6iks/6saQaDiIOc4zhFzPVgzP69nMmUkfe8HltaqPOwxPXl9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2USTYZpf8l13f3B5b56zYfuK2jWYIlfB0hH/5RwMM3NHLqDeY
	L0DUiFrcNcKR3n1IVz8DH9qo4ou2AcNGJFpHCwGBXGaTv7Q7ULUEqWAiC/W/VcC3drnG0xB1iGV
	56JEUkiW6sRrc7Ivh/n6uy+O21fBTvfjiimy3x6+FvqY5H20YncCWMIOn61j0EvzI
X-Gm-Gg: ATEYQzyCYJfXR+NhPApr6Mvhop5+LWYxmFvjAA9F4VRbl7ZLc3cyy4M5NDX0ZSV8jJn
	oQ5SYS8YkcVa8DRN5M+uyvEF5zbzJmFxFVaNbmy2voALqDvFfjyc24bUPCxIYt8z/Gte2AsqBqt
	SqMTCs38qz8S2n4UcL8kTPLckiNbTPtWzLD00Y6EYS9SlWe6GWUvNupjk5IzT1MHQP7szhWZklB
	ca2qfYSZSwU4T9pKC5Li2qr6yj7tvtDcIFOicOXs6MqAzEyiuPHCrsb+ji1AOhnbgbzIoNBa3cp
	FyynpuBLjwt2Uxb5Yj+jRKbiEIryG76Mkm9jJ5R2ZCm9oUwlv1/AatLShkSZK2qVluH/nobcijd
	lSzIN7QUQjmW7jeghgGe1f6AtKKX4r0ZWf4pWBs5T+rrQrfpkIw==
X-Received: by 2002:a17:902:d4c5:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b0cdcfb268mr73421495ad.7.1774853410954;
        Sun, 29 Mar 2026 23:50:10 -0700 (PDT)
X-Received: by 2002:a17:902:d4c5:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b0cdcfb268mr73421295ad.7.1774853410461;
        Sun, 29 Mar 2026 23:50:10 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264224esm69967945ad.15.2026.03.29.23.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 23:50:10 -0700 (PDT)
Message-ID: <f7e63fa7-2579-4dce-974a-8c81a1aee00f@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:20:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac-sku support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
 <20260328-monaco-evk-ac-sku-v1-1-79d166fa5571@oss.qualcomm.com>
 <20260329-accelerated-pigeon-of-joy-c6c903@quoll>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260329-accelerated-pigeon-of-joy-c6c903@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69ca1d24 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Shnu4zvgYbmvQT2Ik1EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 8Rzlp0m2rT_GpHxRTbirjgVUGq-n7YMK
X-Proofpoint-ORIG-GUID: 8Rzlp0m2rT_GpHxRTbirjgVUGq-n7YMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA1MSBTYWx0ZWRfXyOByG3o/kFIb
 mclfe34BSfd3SJtMGIajJ5CAjBg2YQd/oTiS9xuTXHvALgDjbvj3PEFnVPOxbmvGm+9ZFY/RluZ
 Pm1ffkD7UjDNcU7O2yYzKhSqYA+ySqsJp+frGiWgqlQ8uLkz2V2HqENWvYQlVCMBHl0TpdTVM8U
 kef9371qiOi/zyLUqUv+YukyQDocY4uWRMUmE7S2uMfnEk8S4i8PLb4VuqC1WUGg1tGB5gOSxZA
 J7c8Kq0F2HznfEFO1lt3KhLBmG+IkGj/yxaA7t9n65k6Rw5LEOUav8G0oF60emXj3n/urixLbsQ
 tawZ/nNCIlmb97dzAgF7rSq58ZGd1xqrhBitTT6pB/kPspVQqpaSWb+Hm9FxsOBjlFPwS8SqCJt
 uN3UfnV5BmHYiGsFETMtRpJjEDdPJpyofz5KjQ2Ri4P4DwKK7U3SfapuGpYK6tfpn62qGNY2CGS
 k3tgXtOdmK6HXQ7rVMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300051

Hello Krzysztof,

On 3/29/2026 3:22 PM, Krzysztof Kozlowski wrote:
> On Sat, Mar 28, 2026 at 05:11:17PM +0530, Umang Chheda wrote:
>> Introduce new bindings for the monaco-evk-ac-sku,
>> an IoT board based on the QCS8300-AC variant SoC.
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597


Ack

>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ca880c105f3b..07053cc2ac1c 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -918,6 +918,7 @@ properties:
>>            - enum:
>>                - arduino,monza
>>                - qcom,monaco-evk
>> +              - qcom,monaco-evk-ac-sku
> Why adding name 'sku' to the compatible? What's the meaning here?


Monaco SoC has 2 variants  - monaco-aa and monaco-ac -- "monaco-evk" board uses monaco-aa variant of SoC and this new
introduced board uses the monaco-ac variant SoC. Hence added the compatible as "monaco-evk-ac-sku" to differentiate it from
monaco-evk board.

>
> Best regards,
> Krzysztof


Thanks,
Umang

