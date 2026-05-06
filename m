Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDF035E93C
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059124; cv=none; b=DJCr/S4J6KTzaX+SNqXBnTNcq9SQpWf/7hajox140ymq0b/4ns1Q7yrm8w7jLXWI1G8jBPQhbvKd/lNcH3EATSHOMsSOv7fgNNmpucGiYEpP5vTlEX+3qbdJyAcMdeRAcNQEz9aKtNxdW55LdZcOc9qpLAyc+KWFZhTrz6Y8UMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059124; c=relaxed/simple;
	bh=xXhpM+uwgKbQ8hANUPCTjKLpHngvDWYDJI4oV8CRQX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHtUU3w3Ftg8jfIaA0tJ/AWsR2YPpLwOSbj3OK957MfvZqO38MVjHlReUS+Aj6Q5UTZOTdFZ0ilf8/s59zlscr6qw0KTSDnnKIErY67ouvFKetfrp0yq+4oid/Hpvb8tAU7oFs/mZYTdjHIVj0ZxJFE0FRiwc9Zw9eXYfHwwGq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPwQiFql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaR+n63t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPwQiFql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OaR+n63t"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466xWag1515405
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 09:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPy4HMvP/fkoxz+Ied32gFDs3rh7j//T6g8oHDAcI5Y=; b=GPwQiFql3ME9kips
	M22JsxqetRptCLvYbq9FMKn+ftcp0c9umZqEGz004mAmEGV0FvGWpcDvlgSRo6r6
	MZoUVan9+1zqH9MIzOXb2OGAUZCeJFgix0IPM8z0aanKo3RIERGIbO768XExhy8X
	5sv0jtyooZB2moJQrQ73AX/JBqXzqQ8X9kJumLmWGirL04CRAtHYKbIRq5gnV0K/
	XCKL82NVupQmtRsEP4Vvj6ufHw/BL6I1rlyFPMjs80TAU/kghjJC0FX3PZQxovud
	PgNJAhN9BKiH57taLvbaYtSewToBQHPOb/cCcBJNi0sE4FtFI5nmPYvSZHSA1/L6
	U6v1HQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e00v1rng9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:18:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d076d88so14631661cf.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778059120; x=1778663920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPy4HMvP/fkoxz+Ied32gFDs3rh7j//T6g8oHDAcI5Y=;
        b=OaR+n63td9LdvJ68GpE6aJc9MA9Yq6/TeP3tocLOM4HmBSaOpW4/0ftC5nl1dDtb7V
         oUa7AGgvgc5oOxHoOxXE/t/doEDWWu0IZH1K7hQQwbt7c3bSm0E/w6/dDc7crsK0zaOT
         euz00B6PerNYWxd/qJX9a27kJAu4Q69pIci0ewakXUD8gXRNe0uomGocLvQLPEXDy65N
         sKPAGgZSm0Yh4Q00PHi+LhR2NK5JS7/hi1oSg/3/PxXsLQ6AZaYk6W5FBjSJvtzr33dH
         jQB1Slslma4yE/vwkzymHN8hezEFKPBJ4vnXVsgqPVKOPX1WxzzxhZ8VqljvC7WddM78
         CpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059120; x=1778663920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPy4HMvP/fkoxz+Ied32gFDs3rh7j//T6g8oHDAcI5Y=;
        b=R4fx1zj2uXBvZD61nUJnplpCvhaP/se4VrEgJtMYU3YFml3vSqJoSCUco18v3eWdiW
         xuzgBPkT2A8Fp4wSm6cW+58BfgvcksQps9cLLoUAIGPg/sYNxMon5V7gw6kUXg/WEr0I
         hhdc3aUM7Os0Vs9r33BGWW6h4DpMvKpJTtZowCkGJCcGYtWg87Tpqp+Lk+dD0oklcN64
         edKIcMCqp8kOTPadw+2/wi6xqX/PKZl2D1YLmMeVbxle0Z83ZJNr2IG/6uxirssVuVo6
         7gd4pjGJm1BF3LMXSex+RNN7hFvGQMAULk+R4o8P8nygaKSJEQNMxYEuo8a+Rxax/qSy
         qMjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gCm0CuAhZjiPew9rdzhszTGjm8qkWsDgPFEnLZRhfA9/V+eKQDrEdFb+kpbB1FAyWYi/lh/RmqkDC@vger.kernel.org
X-Gm-Message-State: AOJu0YwRVVGVjsYDP0xsJmm1tFVL5SrjiLRodvTyZobsfy/Pb0E12ryW
	HOmjzgMyaEUD5dwEVMjyd8TXfcnMO+oNX0UFIUPdt9ukmb/OWJPXT4J5LiByFUo/IpOESU5riBx
	FQf9qQ6BA6U4pCts6VWMJhEi9jpcmk3JyRC6Eh4HSrltDAFfRNJYXPU2ahhEGYH3w
X-Gm-Gg: AeBDieuTRKxpgV6tU1ZVoM1jDs/RDQHWJVATeIHSQjfysixi+4/uBlNWfS8lVunVjf6
	wOZFmqJCGhpgI0AnWcg+V3bb+3iCiWk43jSXmptZFv73k0dKT/40Fkk6xentvszZV8zfaALrDJd
	lDJ5+VrWTzKeHREwd3H4+Ghxd5BXW+NAD7ptY0a9MU7EbSm8dVpbYOyzUrbBJGC/CbgEL69XZyG
	aFndUypqUKybSd1ERtXkdM4dKvYUPa53nXaInnc0ItaoN7NmLphwXuMQaAS0hielf1OBaHHJA3H
	l7ggntw/80BFjZ4b2A8PEkqPXk7giS9K65oCNNRWbkrF8oGA+ycJx0/XcqAbYiBqNzLc10Ju2nr
	VM4yK+sXpx0K/Dyjo38Rm/6pyJXyNfIVO4RD/rVPkwd5NvgTVHPzJgOv60KIXR6EF1Sb0iiLujh
	v6DlHU0ZCccnkASQ==
X-Received: by 2002:a05:622a:6094:b0:50f:e5a1:29c4 with SMTP id d75a77b69052e-51462884edamr21764601cf.4.1778059119772;
        Wed, 06 May 2026 02:18:39 -0700 (PDT)
X-Received: by 2002:a05:622a:6094:b0:50f:e5a1:29c4 with SMTP id d75a77b69052e-51462884edamr21764411cf.4.1778059119116;
        Wed, 06 May 2026 02:18:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91a4716sm1078509a12.16.2026.05.06.02.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:18:38 -0700 (PDT)
Message-ID: <e7c9b78f-f6ce-4f17-88e1-ee8e6620fef6@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:18:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
 <4a41079d-4e3a-438c-9996-c756206c0c3a@kernel.org>
 <f759f97f-1231-48bf-8d2f-6c13ccc841e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f759f97f-1231-48bf-8d2f-6c13ccc841e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TTkKslMJU53Jf9wu9rOUOe0stmdPBICk
X-Proofpoint-GUID: TTkKslMJU53Jf9wu9rOUOe0stmdPBICk
X-Authority-Analysis: v=2.4 cv=cKXQdFeN c=1 sm=1 tr=0 ts=69fb0770 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=or55UZEs4ujotfME51oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MCBTYWx0ZWRfX9ikOn40KV1uS
 FHsy2UAwKZeoETLZEis2ngsirGHBQggGcEHxFWZMS0wtOWHIdcqsFkn6/495Ssgv6WScFNyOj9t
 Vs2us5ADxQ6hUMTv/QWbpgdPCpcGmHTPuQimXFNm0wnXQ5OLxbR5K8NjU/sEgvgqbafWx4LPnfd
 +7IocnppL5UggDXALLqmxQMPNZBHx0USMCjZjWwqTUqci+sSsrAW8F5fKQAL2FP4wvbRFVdsZAW
 9laEFKR3MYr7UY7b7hweAimpTiZMOetiaM9X3sqiUWjwFYlsYHYOyHy2uBOlb6UdHLZUjYCOzxI
 emw/OLdtBeUowGE+HN6wuPqMshkVGFa/IiDxCt/gJS0dQRWIEDJvCPnsIy/OqNG7RwMNHsvZxJz
 5hiqr3lo7TZUxMAJjcmSKuKCSUIcRKwS80fneENmvQneUqcB3jc10WV+4POB/coucD4PtvmjcKN
 4451R8CZW8++ELBKkDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060090

On 5/5/26 3:53 PM, Umang Chheda wrote:
> Hello Krzysztof,
> 
> On 5/5/2026 1:49 AM, Krzysztof Kozlowski wrote:
>> On 04/05/2026 14:57, Konrad Dybcio wrote:
>>> On 4/27/26 7:05 PM, Umang Chheda wrote:
>>>> The monaco-ac EVK is a new board variant which shares the majority of
>>>> its hardware description with the existing monaco-evk board.
>>>>
>>>> In preparation for adding this variant, extract the common hardware
>>>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>>>> include file, and update monaco-evk.dts to include it and keep only
>>>> board-specific overrides.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>> ---
>>>
>>> The patch is a bit difficult to view as-is, but the gist of it is that
>>> the resulting monaco-evk.dts is:
>>
>> Diff should be fixed and since this is not even b4, than producing
>> proper patch detecting rename is trivial. :/
> 
> I acknowledge it's hard to review the patch this way.
> 
> I’ll rework the patch to use a proper rename (git mv) and keep the
> follow-up changes minimal, so the diff cleanly shows the extraction into
> monaco-evk-common.dtsi.

Try adding this hunk to your gitconfig:

[diff]
        renameLimit = 999999
        algorithm = histogram # or patience
        renames = copies


Konrad
