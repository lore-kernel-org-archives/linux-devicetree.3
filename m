Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A823DCD81
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344345; cv=none; b=RpjGTiPBVIluCr2VoB28xouEYtpQxJljoLi3JohhpA5kDAlET4qz2S+ACLAycFMxCuRmaEaninKBvu0rhJuqHeh+OxJH9jOq3you8hIeX58M/zY59naipsY7/rrQL8fqASRb9mB3cLH4yx52KJqAAsf7/w6NxyvWrlcSAbuy5nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344345; c=relaxed/simple;
	bh=izJj1l/o063vlBI+JI2AFwCtCQWHbI7j2rXuDXQoTCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcHzb9/2wVkAowCA2DpIcIefjm1YeFJMO2EDuuEi/7SpNOtGLmrGGYGL6ZdlYAhm9/0WN6lRarH0jtQOLN9l8waaY4/9s1oMAKi0u9HNTNXSdD+g+2aArKzJAJKKR3ziHXNSm2Je5b4i8vUbVJWlxLG4XMbb0IC1DnVX9+7w2H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqbevtOt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KF0ocvtm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqbevtOt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KF0ocvtm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4k66H1910825
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evOdHivffAtn9SWqkwOMnHChQNd/edxUNcG3hAURPt4=; b=PqbevtOtnvdxSY6m
	Ej3SMVubIRras7FnhjnaMvzPPHMBld0+t2tjSt+keT8E+nX3pcsOjZ0VF1OOOUvq
	aXjMHzn+GH5NivhK9jx3zcc94MSFeTP92nvHgs00qsw0Va5GjFU31vMe8gTyCpFg
	W0ndGX2I5AQGS8rH+uHIiXldq/lTd60Ctwys4enp/jx6oiTCCY8fPufnOT+5s02x
	Vy0f7dgtJG0+8Gd7D0S14BtdZ8sK+Tg1DcHkQxueDdlbRGdU5Zv6kd6Ph77NdfZ/
	HMnUyVstgA0uAo0GaqZL7ndnDqHTFLnaHMzXj4E3hs6UDZHGtwvlPb3YXlmi1K7L
	y9sEiQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awytqrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:25:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c68ac09f5so44123166d6.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774344335; x=1774949135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evOdHivffAtn9SWqkwOMnHChQNd/edxUNcG3hAURPt4=;
        b=KF0ocvtmwT3ZVKLk00MpKrsxFuXjOKKA3g4/sCHQbvH3KLAYffRaRcztIUjtwBA+Zx
         pqPzQIr2NAvS6xOJZkz6yHLY1cIR3QGYuNQ3O2UBZrnofoCTdbvUtFwz1w14j0Ycdgk2
         qvjYsKUn338fTJT+q94wX+JcSX3QTZ0QtdD+bCoqnzxigMqz3toEOsAqhXW+nhBEhd+O
         a4bwIy0rqdkx59HmAFdywTYKvvhvSgoQSaBfvzupTjV6iqndEzk5yMDDwLwN1gfyiEHI
         vim4F/nKXhWNpfVnKGLQhoT5Sss1QnHupPrkJaqa/H1lBXArlEyvUN9fOL1HXQscOVF4
         Y2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344335; x=1774949135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evOdHivffAtn9SWqkwOMnHChQNd/edxUNcG3hAURPt4=;
        b=qSG1oZ3bFi+MeNjLjTIObqvbmxz/4Z8AIaeUhjcovrck53u1QcTktnenbLzLrtgDSS
         1LcR8BnejVfvsaS7jkvJtyxFCYVCj5b4bPgg047/5tuH9EejeCKniEaj2xBzK018InQm
         2wCTWhcGT8/snebcd71eqQ0cTtwZ1APj5ABXHPA4S0tgvL0QEbgcoN0bXcfIxV+CbEqg
         Nyo9KKeA/Avroomr7CQMQ0S19CvrVrqS2y1/MeWq3frpOuCE+0u9I4lUb2Mtd71jarbl
         UHjwAQDPZ1pSzKRVj+VAWnS6yS5EUiHvRUUizRM5JJnOex9i2L9kuspMUlM8BFw8L16f
         yUug==
X-Forwarded-Encrypted: i=1; AJvYcCUy6nA92YY/5PhwDGyL5NfVHYUNZoVyjro83bWSxDhcwfMab2tr3w035s/ud2VvnJSSnqv4eJSUrV+U@vger.kernel.org
X-Gm-Message-State: AOJu0YzX+DI1LcirsRxF5GSnXzEIYfAJ86UHLol8kQ7pkSCFqAy3Q2Ef
	OFJGetxpQchEHik23/DdVtJT33IkCCfg91y2SIvCyPpw/2PSchJCJZAAx+1jUFTzRXvgUnZsk8m
	wbFH9EN73g3C0zCsBcoLQeAp8JDZMX6pdDCFp65PZc0GIcWDz7NTDWvDeRUGFBJYR
X-Gm-Gg: ATEYQzwmWCvqTNuHjt/nWM0Qaf1YxBnbkxN59riuKNVDt4LlaNNloNYAtr3iStxLvYZ
	8sbUKT8z2Mz7tkq3ScZCQ3NYlkezgqZTqEBtoc8cW4aBkihdjqz0B/Zu7gz4rC3D62wT+iD2u+j
	gSDDo3BJGMDyl3P8d0ZzXbR075A10vG+vD8kbKyheOwYXLN2vC2GRGRZ5kmIJpHruXgNcL7zzOk
	lB5lnrXOLTCYeNncvsRtzGfntxNiCw3H7kjJNF5zlUvvSrhWlIDN0l8ZI6ZZRq4eCXABQqLsJWT
	sEr5TF90Q9Di1/1Cc48apliTZwhvL8IJcbKdkihq6QaiGmPA4+FOUXFARHtTjxnaDcvgPqKbZN8
	rlvDhz3CYoSeqUaTjrPGXTKNX/aUW+B2i5/Z9f1UUijqML3cqmE7nOO0Z1wB9a4x5hw1982skuu
	qsUtQ=
X-Received: by 2002:a05:6214:e46:b0:89a:4b00:bf42 with SMTP id 6a1803df08f44-89c85a591ebmr170600926d6.4.1774344335141;
        Tue, 24 Mar 2026 02:25:35 -0700 (PDT)
X-Received: by 2002:a05:6214:e46:b0:89a:4b00:bf42 with SMTP id 6a1803df08f44-89c85a591ebmr170600666d6.4.1774344334662;
        Tue, 24 Mar 2026 02:25:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f88d02sm612495366b.14.2026.03.24.02.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:25:32 -0700 (PDT)
Message-ID: <7d13d449-17e5-4838-b4bf-f9ce14e1142e@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:25:30 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors with
 Hamoa
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
 <f25eb68c-3877-4ce7-b3cd-0910a00be30a@oss.qualcomm.com>
 <xy2jzlamtkpqfpcpegoysyh6u2cnfubkz5233yvuuzfutzpxkf@w3inytibm3sq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xy2jzlamtkpqfpcpegoysyh6u2cnfubkz5233yvuuzfutzpxkf@w3inytibm3sq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NSBTYWx0ZWRfX1vb8KrtrUTpM
 do/CpdyBFjEQrntd5LYuPKraCWGbRW3BXpMjN2u9YL9OXQMkmXz21vmgUgWedReD+yiEuoxy1M9
 nS042lCf6oQ11E/4yl+UHFNAxsN8Vmf1Ey94M95waHUzspHx82g6vXIA9nAXVyVf4vc8zE0asBj
 NIiBRKbffgQNFebrk9OVw/Ta4qxCxyRx0C5Fst51THBnwbtUTCW8bqDpQ8RHeSM3pAYKWD7/K5+
 IPuTjS9rAicCtIu+lhqOUEIWBStzufjcOJLEkV7c1DzD65Ihi7QD8H4BaCFXSvxEeY5oliFXRgX
 s5BQksTbFTPz08DrZgleamSlyJghpHnXa9E9x8YryaQXHq/Y1gUJ9uaOblyzSCFu55O35k1bU7P
 4P6k5tG30rMCbOxKf718gU9sDGn/NgUzDuhNAFuaBFGPJ7YFoVo6YLoSyaFtwJClttmefDNj40p
 i7tTWdKTk/fBATBJFGw==
X-Proofpoint-ORIG-GUID: coTlBuI8S1CssRNOArgpCxJr2pWJGb6G
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c25890 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oq399LLL9rgHG-W9LOwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: coTlBuI8S1CssRNOArgpCxJr2pWJGb6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240075

On 3/23/26 5:49 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 04:21:00PM +0100, Konrad Dybcio wrote:
>> On 3/20/26 3:33 AM, Dmitry Baryshkov wrote:
>>> Hamoa and Purwa have pretty close thermal zones definitions. The major
>>> difference is that several zones are absent (because of the lack of the
>>> CPU cluster) and several zones use tsens2 instead of tsens3.
>>>
>>> Instead of completely duplicating thermal zones for Purwa, reuse themal
>>> zones from Hamoa, patching them where required.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> Slightly reluctantly:
> 
> Why? I'd really interested here.

I suppose my reluctance comes from the decreased readability, but then
I suppose the silicon is not going to change if we get it right once, so
it's not a real concern..

Konrad
