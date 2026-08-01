Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB093A255F
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 17:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785606236; cv=none; b=QIjz6DcUK5jkcRv7sdh1c1GFfbbFHuIII/aab/8IzmPLSnBZdfkPev7URwJrxLjAPiO01WAJ+bl8Cz1YuBLA5EPcBhXD1d4FmWkbYLV9KAQJZF8QJShy1zZzeSU+MoClo0L/JXeA4j3kXkLoAJhBiQpiBctoV7TRrOejr5u9AXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785606236; c=relaxed/simple;
	bh=PY8InaJHRFcc63/hbEXQx/vDtjSu+8gUmL+v1GZgJHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxQhjiCKliLegFwr3oqRl3eLLsK6usp2WUym2f6SXvBpLY9rNJXA+sNCTg8rdWN2RdniXqLrx5f/IU4SC+VQ1vyOuuU9PnFPoIBBRNqPltYbXGqXy9EkeN3LgI0yg/Ko2SVCzkwUQH0tU4EQUPJCZn7a1b9BiOIcCC/dPtfta/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mG7zWnqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnaQxeYs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mG7zWnqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnaQxeYs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671FaYAk3108325
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 17:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mde5ZJQsvXdc9zC8pk4PCiIyObIUlstkfgcsMyw9rgI=; b=mG7zWnqdeBcxklQA
	Uw/OB8PAFimi1Xb8kr4TNLGAVZqPkyWUEGOAZCgtp4bq6+aOiB+Ygw56gNgKXGYW
	EJcFkMSQ+IYWCxP2t1qJCGAQIwoZNtaxzgK2+UpQPsuOgVo/ROb078FUd2zhjHMy
	CiKjKIODcuHoEA6WRZ2O/3z+6iBqGGcVnvR6OvvVJHFn2D89R5OT1TeITW2LY377
	N8VWkRVUbf8HLvnbCa4gzTf/3n9s3dHtpkBtmOrR4MILHbQKExTu0YaXQhGRj8Bs
	6CwBF8f5B2J21KkcBX4odkyfPa1TVXg50bWDAfvjlcYLRwi15mpJJjgsjXTdo626
	cZA0hQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa3817y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 17:43:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so36417341cf.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 10:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785606233; x=1786211033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mde5ZJQsvXdc9zC8pk4PCiIyObIUlstkfgcsMyw9rgI=;
        b=FnaQxeYsdkuLpGvHKUuYZrnrRkDF0YsMLtRtxG3vz1110jmY89n08KSXZqqCmhufKF
         xQfANrgpMulC4HxcNqzr17SpzYvWM4vb6XcLGvTnZRKzWNXiIyhyy5FKAQYtyucC9CR7
         cTRPkIO10t6vQYLzMEU2y1qWex0OZH997jOIoNCFOh4oOMIsLzCKYEy8pM1vpRMsQMkA
         x/b7gV26EijNrT3orAQzXP6Lo+M4FvUqYlL3XTZC0pIHOCuNMHR/0MD9fPFbuFdIQ6pZ
         cCGvXVT3y1TyuOyrR42NjhPtOOSEv0etQyjW0I/WtFUzEYZrIrZJ7fUy8ypVBayKYoam
         BVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785606233; x=1786211033;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mde5ZJQsvXdc9zC8pk4PCiIyObIUlstkfgcsMyw9rgI=;
        b=b/2NpKfV0i8KhuGOEIqRRtRuuuG8EyAKEa3vMd9IhLPK9/csWdw03F6FpHfC+IbZB4
         Y11p35kwbY0EGgNr8CSfeufhfweqCSAaDnKngvcvbgJ8qUek49FA4A9qCEsXPu3HcnFN
         Pybfn3jBou1qRbBpGqXYrPlEXovsE6//R/yJBKEA7JsYrNu19v3UXX7KGGRDGy1Ef53f
         io7Vcnr0mgCj+g0cWGbV12J+Bn+eAZiyX/nGna5ERgm60ZC3UcFiAqsQsnLZ6h7Oqj5p
         NBL+b2VRMs7AzP2O6BvNwe4kC/jNkBc8AgnrNjlvTmQJi1EzTQJ0kcCXAaH/xuMV5k69
         /TgA==
X-Forwarded-Encrypted: i=1; AHgh+Rph4FQ2oJT3IzGj/vdOgfgZcDIgsKsu1k2ZWbPbqDQ45DpZ+jXXs4/CPYsVLP4mYinl2ZChIY0FzFTP@vger.kernel.org
X-Gm-Message-State: AOJu0YxzfrHTXzRmuyguR5hnqhF9W8kdeYx9bZ1/6Gaz1JUEB5TgwvEG
	mFG+Ph8L9Leo5JXsyU1KPqITa6SQCoVER1BdKfRI/JairxyhLOFIEq5NZ4Mr3JsRqnadctky6al
	FDJhmcRS77EO9gAf2gDNXys+mvMox3/OSPcS2Vt/yqM1FgqpRwV64r2fLETVTxrN1
X-Gm-Gg: AR+sD11b6SnQeN2MNnEXATzXItoXyDFYAhd5D6Jo7VOvGyJBRKtZla64KYVyxgzBEqe
	LAZUC9p3ZUG1DD3yiNfJ6DHvrAWAxsMP9/arNwg0YFE12iBAAsQRATLZQ76y9f51y46ibLo3K4X
	dsUXuGrmEZ3dU8gjqF5KaICn4zH5Px+bW5/IdQAxZtolwxl9xeBjSIFY0xH+FyLcR2er7kglzOR
	6TZcNCdx67NJZdXQPFvqvMsjCmXlivad6YNHnBFfGdAqNBVSW6KjoMPY8O/3N8XSeAfl6yT2p1q
	HGt+s64b65TD5d+x33VY+S1mYeVJDQpPTX4ufwqDY1xCcNJdX6tesl64/s23BfDBJoFEamxyYyr
	8LFVj4I1ZN1bniSQJMcK5o57N49A71w==
X-Received: by 2002:a05:622a:44b:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-52b567915e7mr73366051cf.36.1785606232973;
        Sat, 01 Aug 2026 10:43:52 -0700 (PDT)
X-Received: by 2002:a05:622a:44b:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-52b567915e7mr73365801cf.36.1785606232535;
        Sat, 01 Aug 2026 10:43:52 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2484sm18039276f8f.11.2026.08.01.10.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 10:43:51 -0700 (PDT)
Message-ID: <98d13cfe-b94e-40bf-bee7-541db92ac12b@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 19:43:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dtc: dt-check-style: Handle root node in overlays
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-3-b05b8f897670@oss.qualcomm.com>
 <20260726160058.229B71F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726160058.229B71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6e3059 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=BdnB_ZxoBvXoPZvaknkA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE0MiBTYWx0ZWRfX7srjh/nj/Ywr
 U/pPQUalUdVhneeyZ3dFY+ugo55zupyRoGQ2/X7JA279GgBTHvn91CPR+q3/M4hvCOG6sZi9omz
 S1DDgNiuJFHKbI4p+Wpf6vZnPjDi0ro=
X-Proofpoint-ORIG-GUID: 4-9YkkkWhmqvMdZhYuQo8HAkrqnrqsw7
X-Proofpoint-GUID: 4-9YkkkWhmqvMdZhYuQo8HAkrqnrqsw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE0MiBTYWx0ZWRfX7Dz1gDRRGNUv
 iywaJpOVH6Ef6omw3yVPN/rpEB7hqACQLW2XJKMYCY7rW3vRydR6/hf3qw+gRjxoB73iUO7EONi
 uexGlHhUhAgUbQGa61bO2hTEXFs03A6V0Eh+1MPgiy49V8gJ7+ej4iL0ehNeFoXv8uB6dMMOzoI
 aopgiB55ZsFUMJLC+O7/aQ60Oj3R8bL4//2aslc9Ayw6+XiQOx5EUhczNUrMU6EOzl5Y6c+4y0w
 bPBOtFgvFmt0JyNEIOhUNBe60ctUoyq0xoTnaCEho5rGKMciF19ydqQvzyQQB5JYxbMyCVaIPxQ
 2apJqTDo6PngyBySt2vGI4XjRIuTMm+78+61kjjLmlOWJM0x4E34nccgeQ6LKVmMX/GA5tv+uNS
 QE0iuVXYVaAwS6t20+RysRzjqu3Q71WShKHbcJQGiKJYLeefL33qkzCceIJozTQAKpEeGiU0cgS
 TIi1Sg/E3mHzpMfEaYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010142

On 26/07/2026 18:00, sashiko-bot@kernel.org wrote:
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
> 
> [ ... ]
> 
>> @@ -228,7 +229,10 @@ def classify_lines(text):
>>              continue
>>  
>>          if code.endswith('{'):
>> -            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
>> +            is_root = False
>> +            if code == '&{/} {' or code == '/ {':
> 
> [Severity: Medium]
> Will this exact string match handle valid alternative spacings or labels?
> For example, if the code contains a label like "label: / {" or extra

We don't label root node, but I will add a test for that.

> whitespace like "/  {", it seems this would fail to set is_root to True.

I'll add a test for that.

> 
>> +                is_root = True
>> +            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code, is_root=is_root)
>>              parse_node_header(dl)
>>              out.append(dl)
>>              depth += 1
> 
> [ ... ]
> 
>> @@ -550,7 +554,9 @@ def check_child_name_order(ctx):
>>          for c in children:
>>              if c.node_addr is not None:
>>                  continue
>> -            if c.node_name in (None, '/'):
>> +            if c.node_name is None:
>> +                continue
>> +            if c.is_root:
> 
> [Severity: Medium]
> Since this replaces the previous check for c.node_name in (None, '/'), could
> it cause valid root nodes that were missed by the exact string match in
> classify_lines() to incorrectly bypass this skip logic and trigger false
> positives?

is_root is added, so false positive.

Best regards,
Krzysztof
