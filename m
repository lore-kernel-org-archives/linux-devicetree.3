Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA0630EF77
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783841029; cv=none; b=DyuQrqgwYQtEQpO8ArX5VaK408zwuPqd15kVrs0vgBj43PBOfSCaIK8jV94AP4HNrTQvfrLnz+BmCSKWY7G1S6kwg5+FnBsf5BPVj3SlUJLo3W3KYVK5AVF1TSw4sr6/J9jIrU4ZXGrBMEe2c2U2O6Eg5uFWx7zQ3pL3bFWBW68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783841029; c=relaxed/simple;
	bh=zzaSQvQ6qUTdo/1ge2G22s62C8xOROBZH0f069/U//k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKH6RafrTvTR8SWIl27BEu+aqqHa+n5KwCKA1o1iaSWBLjWHZpq/ERqORYbbCMyA8rWxsNBbbosfzgqQz5Cu9vKLf1rbwE1K6sZjfzudct0P1vevj4sjLmh3XKMnUxPha8hLsU7djWNAdmM7irWeLQpminy12+FBXajeGQEWdUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4piwR+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dR02JWbP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4piwR+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dR02JWbP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C3wsdl1558846
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 07:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TS/dzdJ2RihXa75Xbm87Mn0assdfINSB12mbBx4lBiQ=; b=f4piwR+8wjzMOTAw
	f/uEFmPsEAnDLmfweP2dYPyhSS1syT6N3JFijAcphDFztMe5UMGvXHvl9rRntdD/
	Du37yAsl4/o9PrR7dcurrlkOwMcCLBUBMauOQj1GuYbxCj2e2yjkLXAAVFrqfkHk
	q26AWAu3pBMLUH790VdC5wCvEF9ORqTwV2FiKLe9zJCOq5iKr9I+9g9gydhLlQ13
	8SPTMMxAGHiql9ERI5MpnK1DnFhdS2AIXGI1qksxP7C/4Vmpbi40SiGwpzrbvMbf
	SmiMEiTv8//SRr0W6GEaNuw12AiJfDUeSd84buPPzbxkzQqA/3hjkAQjjwLqk3ss
	xEQkww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr29we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 07:23:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca860baea9fso2561030a12.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 00:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783841026; x=1784445826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TS/dzdJ2RihXa75Xbm87Mn0assdfINSB12mbBx4lBiQ=;
        b=dR02JWbPsn+UkRybL/Jsos4hi0pIIX/ilXm1ptc9DONk0tmd8gy9+dYFoZBuoWuQuh
         EC44qzbatr21jwxe5G8TPgyILuN74shc059TsfZckphhg2/WAVVnQMTDUgnxabyiXzWz
         LIRRguCl5F5D5eBhE8V3wiQ+0OjZw7xqvu/JHrShL7OwbzsohiIcFOxfIwUtJIc9Mecr
         l2VL7u+lJOFk8IQ34VS0b0kIhwc75EYYTOsE+ZkYcaBSAS2m5O2iuDxx2McP0IxqHqNk
         KDERI8Lx26Yv0ACDIcqbC55HvbJFLIdIM6GpAuGZasSwJVqzTEZfhM7c1q7klFOxmiNw
         5+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783841026; x=1784445826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TS/dzdJ2RihXa75Xbm87Mn0assdfINSB12mbBx4lBiQ=;
        b=XtGDbQlCp4893hRxVKj2xA36Ye9JRgpJ7tM3GsSkWVPmoUUOBmOzmxkQggBgHwX1yZ
         WD50A2Vp49Rof9yBx7wQM8ZiDtyecx+U+GoS/1XP2EA4iiNKh8Dre7E/UllFdGsB8XF3
         gTKHF9OMlUps/Ar1R+Oj8gYmFgfgAaUVYwk5FGSCJJ1Qp1oQUzoRQ4Ou0v+a2SZLLv2m
         7Nex9Y3M2XfM8CRLz8+2Y4SDeEwMxL5gf2icCUF1EyOFXHhzdG8r05HVtX77PXINW/TE
         OEnN4qdEzA9cVvUMcyfdW30dLN+AtonmGxPXtKoDZGUfqULpxoLqT86llPn3cAfB7Xzc
         z4dQ==
X-Gm-Message-State: AOJu0Yyh5Hhhhn+/YDRUazGg+2t8riawrv7z/sCgopmNSw3nT+LbBOV3
	7M55EFNLfLLrQ/dyj5b5Q9Cis209Xh05/570dBDZhwzvTbzyITT/GRIvGv1qmgVKETxVQQ6LytG
	kQTzliMWeoNToXysNKQMb42pElAwBe4Ow59GnALDEByC7T3wbVaFevSUt10Kjpfrn
X-Gm-Gg: AfdE7clZXdRPnQUAibJFNY/wMChvNFPChgFbHcGODp7r1Ad74nGBQ7TXZvD1nN34b5l
	bKVPkCZg076BDGn4ODtAS1jiJzWCKwBN2BpKL8FX/tpkXpx1Zzt4apEtReYLIHdh5iox1FlTjFr
	nkO7u0Gl7mX4p5E0gVklVkkdxLrPJeAWe5+zhxnDL0GXZDnIXkYFtlra1oqRJHav8GMIOtR6iC7
	+1Wlpn5VouB7pqUQvoefEEoMjX68+awtB4P82NWZuHX8qmtyJ5vZUEiaxExZ9JNCFnBHd/MGB8x
	m1MdSgK3aKjPZun64wm66fZii0DJ04ps5+A3NTB4oLwHtvYHlGmnDYXiDXzYIAVZIEYUyr7Zn6E
	SKYfxLw7gMkuKKNPEAD+HqDvFiMXklz2RiYZufOPGOOTx2A==
X-Received: by 2002:a05:6a20:a124:b0:3b3:be05:2b73 with SMTP id adf61e73a8af0-3c11015a232mr5858411637.18.1783841026472;
        Sun, 12 Jul 2026 00:23:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:a124:b0:3b3:be05:2b73 with SMTP id adf61e73a8af0-3c11015a232mr5858394637.18.1783841026070;
        Sun, 12 Jul 2026 00:23:46 -0700 (PDT)
Received: from [192.168.0.106] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9a67c217sm1483652c88.8.2026.07.12.00.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 00:23:45 -0700 (PDT)
Message-ID: <9d830e54-a9bc-4498-8799-2dd7e6d9aa00@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 12:53:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock
 ID
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com>
 <20260708114924.1069239-2-prasad.kumpatla@oss.qualcomm.com>
 <20260708120022.963171F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260708120022.963171F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDA3NCBTYWx0ZWRfX+DNVBKoawCJn
 cRPvptX4K4VdTb6qBjcvEyA5XWapYpaax2HNWKt3kaCsXhJ/Y+1sli6c1C4MiHmQhwrLbkjhMGw
 /7Huapqh3XlEUyAvCpuYPJf4A8MxFiY=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a534103 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=6DnBdPXkYeQUWTBryLMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: uYLen5KOsLYf6KxJAwEAxqmOwWedJXJG
X-Proofpoint-ORIG-GUID: uYLen5KOsLYf6KxJAwEAxqmOwWedJXJG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDA3NCBTYWx0ZWRfXyH3R5Nw+eTVl
 VDMZUWMbKBemeZaIcR9gG1n2ZIR7YXQSeOIREnHCDe9qe8TjbSw3YyJS6W3l3sC/I42WYAP6gs7
 GxCNHRQE9HlNFrPl7/Pa+xo7YW2JKn3CnbFcGy1HWFX/k3jWUOxCU+wYhLp9fzF9tjE5WzhW0mK
 qJ5qSuGKqW3Bl12HtTurC8ge+ytEidIy+X/29gQKuMJ07KJpqMkilSstqQGorHT+OXS2YR+wWCN
 hS3Fqw73nXybX+O7qJpyOHa6bj4bybGcty6cTPlaqfPle0Voh3Han6PrORnPQH3B1W/ES5xot/k
 e2ZN7PPlMEmbJm0XKjyJzb5FevSqYtxIFcvGQTYpgKYRh2md49gzcPbDhk64optlHyT70roaVpv
 8kTjczUqYuJfofCemqq04mqQL18g2ZlaUCH/969vDncyPqz6kZW+k0gUyWxK9zh3ljZ8KCyMUl9
 2wRXCtXoJGnPYa0fHPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120074


On 7/8/2026 5:30 PM, sashiko-bot@kernel.org wrote:
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 45850f2d43425..06ca2c287ab2f 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -236,8 +236,9 @@
>>   #define LPASS_HW_AVTIMER_VOTE		101
>>   #define LPASS_HW_MACRO_VOTE		102
>>   #define LPASS_HW_DCODEC_VOTE		103
>> +#define LPASS_HW_LPR_VOTE		104
> [Severity: High]
> Is the corresponding driver implementation missing for this new clock ID?
>
> Looking at the clock provider in sound/soc/qcom/qdsp6/q6prm-clocks.c, the
> q6prm_clks array doesn't appear to have an entry for LPASS_HW_LPR_VOTE,
> which means the clock would never be registered when a client device attempts
> to request it.
>
> [Severity: High]
> Will the hardcoded limit in the driver reject lookups for this new ID?
>
> In sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c, Q6DSP_MAX_CLK_ID is hardcoded
> to 104. When a client device requests the new clock ID 104, it looks like it
> would be rejected here:
>
> sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c:q6dsp_of_clk_hw_get() {
>      ...
>      if (idx >= Q6DSP_MAX_CLK_ID || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
>          ...
>          return ERR_PTR(-EINVAL);
>      }
>      ...
> }
>
> Could this result in -EINVAL being returned instead of the expected clock?
>
> Also, if the clock is later added to the initialization array without updating
> the Q6DSP_MAX_CLK_ID macro, is there a risk of an out-of-bounds write during
> driver initialization since the array size remains 104?

Thanks for the review.

This is addressed in patch 2 of the series.

Patch 1 only adds the new binding ID (LPASS_HW_LPR_VOTE = 104) and 
updates Q6AFE_MAX_CLK_ID to 105.

Patch 2 adds the corresponding driver support by:

   - registering LPASS_HW_LPR_VOTE in q6prm_clks[]
   - adding Q6PRM_HW_LPR_VOTE
   - handling it through PARAM_ID_RSC_CPU_LPR
   - replacing the hardcoded Q6DSP_MAX_CLK_ID with Q6AFE_MAX_CLK_ID

So clock ID 104 will not be rejected, and there is no out-of-bounds 
access because the array size is updated to cover IDs 0..104.

Thanks,
Prasad

>>   
>> -#define Q6AFE_MAX_CLK_ID			104
>> +#define Q6AFE_MAX_CLK_ID			105
>>   
>>   #define LPASS_CLK_ATTRIBUTE_INVALID		0x0
>>   #define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
