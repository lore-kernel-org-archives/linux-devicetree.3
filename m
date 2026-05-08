Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C84636212F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 06:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221492; cv=none; b=pAl+4pLzHRslZryUugDcNmStrkMl3KPE+6fKEeNggfnJl4KPYxXBAARbEc05KxaoP3jXiIIlOzYU2pmKPyxdTyd67PFFXMSa70lKdf7nlzkhD1MhllKiQRWxXc/MBnXSX5UKPJDLGVdQtPrQ97KbXi4aBLnIWixt6X8tDbcZ7pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221492; c=relaxed/simple;
	bh=AYucIGE/XxHjtr30OpowBjVhJAyxN7nxsd80Fvb+b0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b2Gs9kbLCHeDBwaUETYICT7PRgd5BwruCupA2cf5pAsQJ5/fqnat/PA8E/9JC9XxTsW+SKStijHGtI9IpAE2bd0bYzFx7EN0vgfIZq9z6MljjZe0qaSTyQm2SzGnnhD0V4mCTX0kLA4wUD5rejGKg5ylETQXTUi1Y5ytHEiYl0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QssvYCmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTOqv23r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QssvYCmm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTOqv23r"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64867GLb1173914
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 06:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ObJL9sENHeTc1JXRa+Fb6potoCEo6WZOsrJoz9aAaYE=; b=QssvYCmmJW20hBJv
	fhGHJM6VU7h1I5BJwrPVZnHXt9udku3Ume7w2zFsCVcdwjBF9u5bB39LX/SL+4Xb
	7dyqqzHL9avf5OfOSO5WcVNJeKCa65vX3hxh0iKDEp1Y6ZE6PojzqBc1huMHpn0Y
	2MEwZ8lMKUaXKNt4eSRC4gJQ2uLfEC5mwvVtiAWA9tw8OwKBo0NMTDkFON+3e5Z0
	KZzZWsjNTwdsXl8QOVvSKQT1WZ2dLi6rcTa2DXtxuf7Lf+Jqybh8Znd0N2hpeQCe
	g7z2ZFukfT3keloBYocKHTq5CyqHIdQV0HQ9xaPRd0cnXQ5objNa2Ra1UNWrx8RW
	+ghGPw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132h9h29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 06:24:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-835417ba8c8so941036b3a.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 23:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778221483; x=1778826283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ObJL9sENHeTc1JXRa+Fb6potoCEo6WZOsrJoz9aAaYE=;
        b=QTOqv23rqawTOqRpfxLVyFWg8CSxoGJn2kNBnNdusqUw+m0ZFIj9hZhOS/WqlsNqVh
         38ywT6q681xIA4m/mOeqANq6gymYlY4MBQ1ioNA0DGCcr94rf8I57YyXbMzdE5QAHeI7
         ryTuuFzr1W+PendXMSI7IDJy4qAf/YQfcFd2hRjdEfrk4kD5Dwk59SOO1exBbmFWXLrh
         J6MM11W5o+2Oxi4jKUBSWBXihb8AlCqodzB6ugxWYXsAM32X50XMuoTOI7lVMUVZLfrz
         oHa09f1dxWRTGxy82AovWr+EoGXtXmxlERy0pULdKwtcIeXnkJfliYY6FtHpKkt48Bfz
         1a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221483; x=1778826283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObJL9sENHeTc1JXRa+Fb6potoCEo6WZOsrJoz9aAaYE=;
        b=L7kwauAWYSEW2KBd4mJMGp5OwM0lM4i3Kk00D7nO9ebEBBKGifkLQwia7AOoLTeo7M
         7vdq0ZX19NtK1MK03pLrlCKiu7X9Wz6S/dMzAOEIsiLR4uwL5KpdlINu4oH+Uy/a+O+m
         LNWrv51xzcBW1JxjuQM5S5YZVXd2/y1kuvDjrFt22Z9JFLXezC2z3lM8Rxipu7Em42il
         jQC7oK0Xer2ZSbu6v0CuUzChRam0neWDpzKvwQrOtlhBLrLmC3mSlq35JBgHYFVAdLuW
         5aRJsoW4/dYsgCJYAlt+tp9o5JS4HH+G3zMQ7yLf0c222ULPjTA7TnsVDRXFwl/QKkQo
         wEaw==
X-Forwarded-Encrypted: i=1; AFNElJ/GtHhA+6HqfjARGi90f7gTNcUiQZi8JYfm2SpII9F1hCP8VnEU+6MucSflpsyXSoyuRZqbs25LYiFB@vger.kernel.org
X-Gm-Message-State: AOJu0YwDGBl7GVqmf+urjNPvrYuXbWDQwdbpciU50lrWSDw6kgQjTbmz
	lfeX8CQ4TitdfaAIxgvSWkepLOX7eGfl7zIlIZliyfsOpRIa8aV3tec+7Vd2WXaj6OhskEKD9az
	aZnhswXOWVfgffvOIGyGgodK9kTzRB9p/JxrxANURVw0lnlpn6XO0/fETSlipHzIN
X-Gm-Gg: AeBDietd123+pR4KAEl0Qmved25Y2BFKL6bn0BMda5+2rf9erBdH9/tqGTbIgj5sDf+
	JDup9sneRnVomp/fdZhuWryhyODiBoF3Xx9mLZmRobVLLwJ9xnEAzb/4lyVtt8MjZDqz8yMs6k2
	JgzxfP2ckfryVMnq6GRq9DUELCl4ojelGJtljHRZBTkDR1XQwDp6eWd5YpvnySEeCAo8pHLeheT
	ODoQyt3LheEj+icQakdYt5wWmSYtFQpFkCR/DIA/36Kt9rdtsnTKDh7nbSNhK6tzVoY0VUENZNW
	W1J4w/wC1VnBK5Yt6ilaYLF+rB0Djlkka3il8ayV49UZyqPNXpj73hNFDSAGdsVGNusvgB32n1Q
	Bi3TbRs12amNPgiy/tmUkXbIyhe8XYpyN3htVSA3SPVJgDGtj
X-Received: by 2002:a05:6a00:9096:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-83a5dc5ed7dmr11395762b3a.38.1778221483233;
        Thu, 07 May 2026 23:24:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:9096:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-83a5dc5ed7dmr11395720b3a.38.1778221482631;
        Thu, 07 May 2026 23:24:42 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682abd39sm10888950b3a.52.2026.05.07.23.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 23:24:41 -0700 (PDT)
Message-ID: <1d7141d7-3440-4360-bed2-d690fb30a116@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:54:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Shikra
 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
 <20260504-utopian-civet-of-symmetry-ed48a1@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260504-utopian-civet-of-symmetry-ed48a1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA2MCBTYWx0ZWRfX4x4+OMnQDi/d
 NnGiRvKXDMFLIDep3ltqx8CXFxGF0PR7eBk7dEyPaocgOqyTpEznDnj6sXPAWTz264fwRF/Fz7b
 +xs2DgthrRZidMc6dHbuqp6uboqWLAvkLxTvMcAWgtC4o8qggv9D5sF0kPwGHIki6ggRcaEz7Y0
 l5YQxVsGoCARWMG8Iz9LStgOudf8ftkSxlYD5Sq4DqQljIiwH5DER0+8ij1VBvdaCDmh2vzwViQ
 95nGUJXt97WhIp743eTavvaG5W7e6RmtSd2Cm7om0x68bGWbBPTZVx/0fsxhCQ/QiqOQjAHmaNw
 tEDjzfpOScmFKdi/I4TylRsgova7cvP8LHBpx3VoZkH2yf3SloR33JM8KWwYvhz62UqwuJFDVKm
 z8OHPc+ERcfZx9eEuyFYK7T8otRta6h1617GZiZfMMXBrYWdlB4Lx3/FiYVDKPsu8rmsR81Z7YX
 9+4MBHNnD+HrC52G3nQ==
X-Proofpoint-ORIG-GUID: vyMb9tnEOibNqsvWCbnXOdEYOFZzfE7J
X-Proofpoint-GUID: vyMb9tnEOibNqsvWCbnXOdEYOFZzfE7J
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fd81ac cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=212fnMXnYh6t1oBpmLEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080060

On 5/4/2026 4:33 PM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 11:23:46PM +0530, Komal Bajaj wrote:
>> Document the SCM compatible for the Shikra SoC.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>> index 7918d31f58b4..bb1e0a0d1d3c 100644
>> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>> @@ -65,6 +65,7 @@ properties:
>>             - qcom,scm-sdx55
>>             - qcom,scm-sdx65
>>             - qcom,scm-sdx75
>> +          - qcom,scm-shikra
>>             - qcom,scm-sm6115
>>             - qcom,scm-sm6125
>>             - qcom,scm-sm6350
>> @@ -146,6 +147,7 @@ allOf:
>>                 - qcom,scm-msm8974
>>                 - qcom,scm-msm8976
>>                 - qcom,scm-qcm2290
>> +              - qcom,scm-shikra
>>                 - qcom,scm-sm6375
>>       then:
>>         required:
>> @@ -165,6 +167,7 @@ allOf:
>>                 - qcom,scm-msm8660
>>                 - qcom,scm-msm8960
>>                 - qcom,scm-qcm2290
>> +              - qcom,scm-shikra
>>                 - qcom,scm-sm6375
> This looks wrong or the diff hunks are confusing. Aren't you changing
> one if:then: block for clocks and then second different one which
> disallows clocks?
>
> dtbs_check on your DTS would tell you...

The two hunks touch two separate allOf blocks:

- Block 1 (required: [clocks, clock-names]): SoCs that need clocks at all
- Block 2 (clock-names: [core], clocks maxItems: SoCs using exactly one 
clock named core

Both hunks are intentional.
Verified with dtbs_check — no complaints.

Thanks
Komal

>
> Best regards,
> Krzysztof
>

