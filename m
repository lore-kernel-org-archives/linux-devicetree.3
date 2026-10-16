Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3312D470EA0
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152618; cv=none; b=HgJ6rBHbEAGZ1u4thvIiXI3uwiDpJcRYYoC768ivOlvPsuWRpWGC9WrRGZt0xaH3hWI3k1FZVAJqg5wTPK0EJNr0yxJL604C99x1xV8jX8GKB+B9pTVTWD9JTYKppq3Q2kZWdHHW/q6k+fKsApm47JqnqYZRIiQ4kA87VlZUhsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152618; c=relaxed/simple;
	bh=jQ/FSLrIkJtB17z8bh109FKYvGJkqaPWH/ZwQG3vnNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1sH2bs44ZpUkjCXc6V3HZQPfKlZHBrvfoW11pcrsW/NKG126sV2QH9YBAZKtvvkBX4NXaULuokz26lg9UaWNDpK4qPUhocyeIag42fdPlQHBkK/ymILj82Xy1w5eIuliH3SgvErl+qVBFVaVrcH3Eq7JbHZa+sBXjd5IKHjI+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3n3T5Bv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAN//r90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3n3T5Bv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAN//r90"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAN3W2496906
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gd1U7p+R5ZYI8dKfgvksJKbmgdW/OkpWP6JFK8vbi64=; b=L3n3T5BvyxHfcau6
	4a9x7SZJTotMFQGR0dy1xGiqjPL0hRis1NWitHrn4y7qtpwCdp75bgDBrOdIJrMx
	e2EyJEVUVUqGjKjU4+nJ7v3rsfiiBlDfS+NoiaepY4tUbFeMyLZUSOJc2pduh3SH
	0+DsMllgEm9wzDVL056OKMKDP2NGGTVGFZcempYNpJhhvUlvXF2l3ZOPNkO5T/1p
	NR5PMcY0MLwsfr9Ox0tLUBgDSU4sXcxbmD/BvEDpeO/mi/ZXOiZUY+77+KqYRrIu
	b7UPQg8oRO8aPJIxnWBVnajo96+//hC/sGwl2sWWQHcUfZEw5Wh4QoISUfW/RN+H
	U7ukFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa3mhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:10:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e85f74c21aso9531175ad.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792152615; x=1792757415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gd1U7p+R5ZYI8dKfgvksJKbmgdW/OkpWP6JFK8vbi64=;
        b=IAN//r90woLi3ZUrgSzM6lZxP3xvr1MkhfLade5F/JdeCcw8dcBVWteaSoW5kxDduA
         aU0cLaZWHaWMI9WS72feNjfB8/UdHydWA7ARD15sPSBhlXyHHNRhJ4LkQzxjnl2kSaLC
         +oklPzvfwQ7XCx3lG8aWg7BUun7oJXCKyzRagxEp+M02VZzyDG0EHuKEIoZMgHUit5e8
         lm0OQZr0hkoN5ZPbcOt0QVr+CKsO78tZveOUXEsBl3KvulCQ/nr9Nj8jYV359B9/wuj8
         a+HkztixVOWVwQN3ZxvOj9aJnfSQRO2UXsIA/YXbRnIQ1cjKS/EMZzzLpDKb2SXk6Ord
         fA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152615; x=1792757415;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gd1U7p+R5ZYI8dKfgvksJKbmgdW/OkpWP6JFK8vbi64=;
        b=k1dTwzs8EO9+ZOT2Ez6ptuq/Bva8ebdlFLust4iaIw3G3C91RYh7xihMfBjn1dbGXn
         H5P62HymjdfzYl4yFKqvjwOr4GgDEmhQw5GUGvenvq01znHrK8Bk4HamALbRkwcn/SqK
         TZFHwZ5g+OW0ScRE1duDJGewqZKUrg+MAHvyyAxbdZ+HBdw8Ne9Px1XhBwZ4IGv7bZMa
         hWVGd8x9roqwTsH9qDJ8NUj1PjFeYKrHfXXoaBRwRoJDbDeqoSJRPcOjiwMIXMbBPu+S
         W3BTBSSY2QSH6PdeR0YmTGZ2Ee/6++0shK/5CvPyb40IzAymzM/4BmeRt/o7Y0RtMNgX
         9YtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMLAF5AtMBopOceMAdJYjPtcFZq14fBzS2zWTlCdYaqzPAmmTZFoVm8XfernxVSum6+rDFGs6Aw5xW@vger.kernel.org
X-Gm-Message-State: AFq9FYJNK6NTKMsMKrtvGoqnNfYhXk8i0o9NdCRNH5xbfcO1SXXovTCU
	aUeqMkktap7ZNXqcRzfw+i8hg0O4YKIxflqlXCweqbyclo8AGL3a+31XHZqr/mxeNw4Iv2U29iS
	v3KJBObthNRIC3N+ReiC1Bt2DiDkg4vuEOE51JlfzfAaSvgnKPKmh2WGihaY9h5bP
X-Gm-Gg: AYBFou0EC7v2UYlyqEIWbcuJayZNZUfOIAomTHI+KHfmiJZqZU4tOilOSlm4EBiRSaY
	QTy5UY5MzF/+cdX2PMhZXA6mPrmc9msI8nKa7/bil8ingFjnxk3YbEZ6Kc0dFvOYYTQH3DoVhzz
	pjoxwRUN46mTSzqGHwEAwLnXClHVcAOKA0T4DXsKfUhmK/VYzaieYZoliNXv5Ek1rRhqmLhXgn7
	aniLH1le2ZbT3JTEDOhCc5D28Mdd7YVRk1nmUZxwFmsBW5CuH05mJ5ujQJs8FAAm9S77IjN/j8K
	K4VK4XH/1tikDdpmnYTMvLL1rUB3/6aj8eM1g/hbSKxLm5ZcJibR8bSF8pcPiun2+yJtuHHQXAW
	Nkt8Bqm8nv6O7uSP0EDy8P7tDJSUY7Ts=
X-Received: by 2002:a17:903:1a08:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2e977568618mr21987115ad.28.1792152614960;
        Fri, 16 Oct 2026 05:10:14 -0700 (PDT)
X-Received: by 2002:a17:903:1a08:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2e977568618mr21986735ad.28.1792152614236;
        Fri, 16 Oct 2026 05:10:14 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804ea9sm8953685ad.13.2026.10.16.05.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:10:13 -0700 (PDT)
Message-ID: <c6aea30e-337a-4747-93be-cbaeeaa933dc@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:40:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: crypto: Adjust Shikra compatible
 hierarchy
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
 <20261006-shikra_qce_fix-v1-1-8ac54d81edb4@oss.qualcomm.com>
 <20261013-pastoral-magic-perch-1a2e5a@quoll>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261013-pastoral-magic-perch-1a2e5a@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfX0MGEhfq5xteh
 VfU8cWhrtZyTt/3BmP9I94Pwn3S2vwp3n8tXTiKdyEigB+RDkQ3bcshJaF84sPbppXmxEvA5TbM
 RfVpvo7XqskGzsoeH7DW3IyFTIcNgAY=
X-Proofpoint-ORIG-GUID: 1kF6IakypPGH7WS59ozE5A9XiWfob0Cx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfXzGQ0/Gi/vgT4
 EQXhYlVgjzWQw4vYrePn68JfmOSNhlKXnG3ifW6djtGqsiraCF9joRhvE0ZpZ9pTQYjeJCoTTzD
 YYSoCtmD6snpkEfyHaNwdhKnLC9DXHiBDsiqpVj95EStRljSdBwOTN3CqhnOIOcus/wHXpOlGnM
 nmqkaVZ/Pp6mXlUXSaX5tu4VKjX3Lqm2yDb9agP+7/5xEVrKOHDZBlYAbIM6S8sTG6OyknW0gC9
 Y6QUN/6PUnXk2zvotaG/gX0JIMdfw1wbADveNOmxOg8JXWJbp4n0nqVSuDVEGshXzkGTmzgJG4m
 2OR6+r7E6JGrof3VVryRTkfFvCCd7WGRmsrz5JDnsQx48Wf9Ky3vWZxJiD2uFjgO0QLCoOPhXfG
 LfuGvEB3J6HIzpYS/A0DbxOqevQOm5yLuZajLfSBrjc1+RVed29DSFtsJFWMxshosGox4tqzO5+
 k15P2fTq6u6DXKYj02w==
X-Proofpoint-GUID: 1kF6IakypPGH7WS59ozE5A9XiWfob0Cx
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad21428 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9AdMxfjQAAAA:20 a=xNk55bQaariEeO8a7gcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160048

On 13-10-2026 12:14, Krzysztof Kozlowski wrote:
> On Tue, Oct 06, 2026 at 04:44:03PM +0530, Kuldeep Singh wrote:
>> Shikra reuses the same QCE integration as Agatti and should follow the
> 
> `git grep Agatti` gives zero.

Agatti is chipset name and compatible name is "qcom,qcm2290-qce".
Maybe I'll mention both next time.

> 
>> corresponding binding requirements too.
>>
>> Move the Shikra compatible to the appropriate binding hierarchy
>> (matching qcom,qcm2290-qce) to reflect the underlying hardware
>> description.
> 
> You do not change any binding hierarchy. You are changing fallback
> compatible which is ABI break without any reason.

Agatti and shikra both consume RPMCC managed clocks and clk-smd-rpm.c
does proxy clocks voting as of now even when no consumer is voting for
it. The required consumer i.e QCE need to vote for it explicitly as
proxy voting being dropped now in patch [1].

As agatti(qcom,qcm2290-qce) specifies explicit clock entry as per the
spec[2] and shikra is derivative of agatti hence, follow the same
convention.

Coming to updating fallback compatible introducing ABI break,
"qcom,shikra-qce" compatible in bindings got accepted in v7.3[3] but not
the corresponding DTS change[4](which consume this compatible), the DTS
change is queued for v7.4[5].

So we can straightaway update the hierarchy then?
> 
>>
>> Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Drop, that's v1, so this likely did not happen. Anyway, your SoB is
> supposed to be last.

Kindly check cover letter for more details, it's respin after receiving
feedback on previous series.
Quoting here again:
"
The previous patch-series[1] was sent to an older thread and with feedback
received, submitting a new series.

[1]
https://lore.kernel.org/lkml/20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com/
"

Seems using b4 shazam automatically add tags below SoB.
Let me fix it next time.

-- 
Regards
Kuldeep

[1]
https://lore.kernel.org/linux-arm-msm/20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com/
[2]
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/crypto/qcom-qce.yaml#L130
[3]
https://github.com/torvalds/linux/blob/v7.3-rc7/Documentation/devicetree/bindings/crypto/qcom-qce.yaml#L57
[4]
https://github.com/torvalds/linux/blob/v7.3-rc7/arch/arm64/boot/dts/qcom/shikra.dtsi
[5]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/qcom/shikra.dtsi?id=099cd05d200ba241bcc7497c4384b8d657a5632e
