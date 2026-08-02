Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6D81DA57
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785673232; cv=none; b=dmR+PO02xMEaqccpSFmGpRAg3uVwJfVUIVQxFbjCZTGc3q4AL7ryc+08GURYGS+1m3IUXwxKwYRMQx6fqtmmw5KwIv+pXWPkgElrP9X9fPft6kRdR4hkyxog7htX652xekQmEMCmpK4U3CmcnpzYxdtccJRyx9mMgUO7HZ6EdAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785673232; c=relaxed/simple;
	bh=yBxEQZUUobhXdaCeSjmCcAYNRxEpPRGyOHWh/pfWeDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5ZcyFf/26MyssZwXQ3E9DiC7LCHgP0Z6Ue9UiUG0AolNFOTbYFO56R63w0E1KxDiqJF2eTzIqJ6gq0hV3xAJ/D3xpuSAb6cM0U23oPC1PfBiiAbHtrWKUhdPV6l2qG5p07Lc16T030XJUdhrsFfX7GcFLqN8rAynz+MhSxaW2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Flp5xZsc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZniqJss1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Flp5xZsc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZniqJss1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6jqi1810162
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 12:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqVHXrcwuu95Z9fohd/vFiT/4PJIJ1W4uuigeft7fxI=; b=Flp5xZsc+ySsXIdw
	G6Z2BPQ+u21aheVOli+fWEa021eGcn3MHdt+05v6Ctl5o1xKo/iD8ueotsI/f0+c
	R7i71h9iTjWpfKswvwpltrXAIFV3/+HvoOnPYE+YB+3qdP7D4+WMh3kwILdfHl9c
	StswbWZTpHqetqW7SVVvnVcj1rLgh6W+O0+hE1VWGoi1tc51sszrAanb0yQgr+Uy
	7lw+OUHiXF1dozsYQzhvV19CQR/+qwWOx5DCUNXue4Cw3U4coxLCSiuuH5tNcsU6
	lgxfzFIEXvT3JK5sT93oNO3KlzF7TA5AOKf10xaX0if1Ya9PW2ewopU5QXNvoVXl
	NoOvBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q52tte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 12:20:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso21545601cf.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 05:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785673229; x=1786278029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OqVHXrcwuu95Z9fohd/vFiT/4PJIJ1W4uuigeft7fxI=;
        b=ZniqJss1/f6Dj7Fu6G+8FRkPIQEvpjVjBIyRl2QLXqZzlR/8ZspYMVoSsVFogGJZP4
         F52Ifr/gItH/xP02b+BT9DAzRIOfKouM1sk4Xvi96+yrqn7NpptBC6M8hgYob0eydqyr
         J+Id8Gq+xplgrb/5UY0f3LZTeKnYEVwCHIvHm3fmdKyEsbsk9vZ8Vom6ui8pVyxlRT5f
         nCMMNsatzjFn67ekVuw0JZXcJIqk2KMm/KdFd2o3dDkHSBAFvtmVakFKSRCR7KrRcEzH
         zN02HTEbIDyGma9nb/pTcGGdWhViQyc5wtA0DAGWK58LMwpsSj+G1ZZTg6+jXwmRHmbo
         hA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785673229; x=1786278029;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqVHXrcwuu95Z9fohd/vFiT/4PJIJ1W4uuigeft7fxI=;
        b=jyCqMFMKYFQ8pGrOmRX/yE9hZw2K3pzI+K7HGlJFa2pOaCY9yP/z/0KFF8Qqun+vgR
         45kbXMXxFOSrWxLybAWR208A0aLnmuSmpa709GevVMI9adEPbPoQIdexSjOBWhHFr4Ws
         dCeDFOUNyHrYN+O+RlKjW1m/Njaoca385FPIRR4B668iNvxkOVtnR9mPIm1mdPE5TRvM
         GnyjRdRyINP9ndZ4uH7jRlQui1Vh7RQbTK/JwIjoGHqBVSLtrpKc6nMjIkphL0Zuc3/i
         0v9HupgnlqyS+JwDu10iZkrn6RuuErPTbD12nfJseNbBDzGK/SO8PEqeMrlwAWkGuzmI
         ZV8g==
X-Forwarded-Encrypted: i=1; AHgh+RqJi/tvGg1OyhMHjvX81/8LNdZgSc3pJD87uDf2z0jDezeZXQI/AEuVcZgrn34K1B/LIUwm9BlQGbF8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8BIUoK5Ao9MNRW/TvqGD299hsQO8o/qQIjEYCDMa0mVGhfCo
	itrBGKGJd3wHw03gRBgoH2Eu2LvSdmIVdMjT9FZ9vQVYe3OgaHlFGCVOKxddFispD4ead0dYpqB
	Az9RQ5CgDpAf+cdOBJghsyuCcp2urayFFEFbMJNdMVfqeT2OBzZnf1KpDXAbzV6ws
X-Gm-Gg: AR+sD12g4LliAkPaqfwKn9hBAp+RrJIfbp6o2oxISou0ig8psCsnCJhkoxL6N8JAByD
	ejEonNFGKRjovETNSMI3D8icofSZRXBm1bs4gw5NvGEuNJBrWQhJW7hc/rkypn9oqOun8gzoArJ
	OZKMZiBavNkVRZ51Ki+doeh4M28vwFTEtnTvtLmpsA9Z2QCWJnzcNlghOTf5jKO/P7vtovpLvwT
	aNT/gldfGh9EReankGNQYTowE+qQRSzcGaXyxfsGCWPwSi88c2bJconegjzXKAQHQA2m5zGwkho
	rCoLhmcsEa2RQN4sjhmt0uAV9R0K60p/v+Ph2jSERAg5I2SMmTTMwi7u1jmnTHopIU8c9D9Gut+
	15b+bqPPR6Q594jvtgXX6Jv7zqFzang==
X-Received: by 2002:a05:622a:4c05:b0:51a:896c:9ab0 with SMTP id d75a77b69052e-52b566bf44amr134623291cf.10.1785673228724;
        Sun, 02 Aug 2026 05:20:28 -0700 (PDT)
X-Received: by 2002:a05:622a:4c05:b0:51a:896c:9ab0 with SMTP id d75a77b69052e-52b566bf44amr134622931cf.10.1785673228341;
        Sun, 02 Aug 2026 05:20:28 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b4d8absm62082785e9.0.2026.08.02.05.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 05:20:27 -0700 (PDT)
Message-ID: <e15eadba-b1b2-4293-9200-5ee8d2c4230d@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 14:20:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] dtc: dt-check-style: Fix alignment of values in
 continued property lines
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-6-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802085617.BDD711F00AC4@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260802085617.BDD711F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEwNyBTYWx0ZWRfX2MXNlsYFPx1G
 u7S+23vYOPsjNMOFWjNDLRPx7PeNCVr8ECRaHKws0CfLSG9Dh97u9hGLitd08ugzKxj/ixKst8c
 MtfZeQBZSu+NT1ofEF5tjG2YuE9mo2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEwNyBTYWx0ZWRfX07Y5RVc/zb17
 pXAUzxnDgNK/kU8XQdx5hOi3UMIPtqD8Ri2my7G6qxD5fDbr/CBjp9q+R2WLNnL6MMh5GJZaCcv
 0GrbeN6671RCHoQ9qRnzO9SmmCpOf6Xx7A0HMwBJmVKPnA+Z985VKc7poMhHjrqnQDEWnHZ51Eo
 /a+Nlhi+iUWHvcd4yQuTueJp/mbWElMAHqqnkdkpEp26ANN1FcHwxAUjS3jlyROY2kZJg5r6OPt
 MTFK3Ca3q80yf6u6enX45cbFpg/xyKpGaq77k1lDw9IpxXrcXIZIRVQTpFtfRcVLFM18IZcM71L
 WtlH1QWSdUuEGaIRd9LYM4o6AtrMhezO36YMzk/k7xlK4Ei2Vcznll/jiVkHunwM9GDCWtySs5c
 BDi/DslYCt5/Cj9dXmimxVlm1nwOHK3bViDzwr8IA7O987Q3FRy3NkeQVraxnY8firlZQPmKxfI
 ce1XqtqNs71xjC4wAEA==
X-Proofpoint-GUID: SGSxume7IR8FSWgY4Iua1P_acUcVT-f8
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6f360d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YGTj8SeafjBK6mebBwgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: SGSxume7IR8FSWgY4Iua1P_acUcVT-f8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020107

On 02/08/2026 10:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Continuation alignment check incorrectly treats valid top-level elements like closing brackets (`>`) and array openers (`[` or `/bits/`) as inner values, causing false positives on properly aligned device tree code.
> --
> 
> --- Patch [6]: [PATCH v2 06/11] dtc: dt-check-style: Fix alignment of values in continued property lines ---
> commit de051474019f5f4a78cb7dedef4cd8e6a02500cf
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Fix alignment of values in continued property lines
> 
> This commit updates the device tree style checker to enforce different
> alignments for property continuations depending on whether the continuation
> starts a new phandle or continues an existing inner value.
> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> index 04247e39a78e3..cb3cdfda5e739 100755
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
> 
> [ ... ]
> 
>> @@ -942,15 +943,20 @@ def check_continuation_alignment(ctx):
>>              continue
>>          # First '<' or '"' after '='
>>          rest = dl.raw[eq + 1:]
>> -        m = re.search(r'[<"]', rest)
>> +        m = re.search(r'\s*([<"])', rest)
>>          if not m:
>>              continue
>> -        target_col = _display_col(dl.raw[:eq + 1 + m.start()])
>> +        target_col = _display_col(dl.raw[:eq + 1 + m.start(1)])
>>          for cont in dl.continuations:
>> -            if _display_col(cont.indent_str) != target_col:
>> +            target_offset = 0
>> +            err_msg_explanation = 'to < or "'
>> +            if not re.match(r'[<"]', cont.stripped):
>> +                target_offset = 1
>> +                err_msg_explanation = 'to the value under <'
> 
> [Severity: Medium]
> If a multi-line property continuation begins with characters like >, [,
> or / instead of < or ", this logic applies target_offset = 1.
> 
> This seems to force closing brackets and array openers to indent to the inner
> value rather than aligning with the opening bracket, which could produce
> false-positive linting errors on valid device tree formatting.
> 
> Does this regex incorrectly treat top-level structural characters as inner
> values?

Well, maybe, too complex to implement now...

> 
>> diff --git a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
>> index 36fb4eefcd83b..1a1c07c09a415 100644
>> --- a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
>> +++ b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
> 
> [ ... ]
> 
>> @@ -18,9 +18,12 @@ interrupt-controller@10000 {
>>  		interrupts = <1 2 3>,
>>  			     <4 5 6>,
>>  			     <7 8 9>;
>> -		pinmux = <
>> -			 0x01
>> -			 0x02
>> -			 >;
>> +		pinmux = <0x01
>> +			  0x02>,
>> +			 <0x03
>> +			  0x04>;
> 
> [Severity: Medium]
> Since > isn't matched by the [<"] pattern in check_continuation_alignment,
> it seems the tool might now incorrectly flag properly aligned closing brackets
> as a style violation if they are on a continuation line.
> 
> Was this previously passing test case removed because the new regex fails on
> the standalone > character?

False positive

Best regards,
Krzysztof
