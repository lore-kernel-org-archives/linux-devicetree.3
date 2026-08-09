Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B83822A4E1
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278348; cv=none; b=E2IISr+ZlRocprUawfTqfCDXflP9h+9NDcOHd2+dsIGabHMUOTks3g/m835iHsDKF3clDEtQlnQH6m1qBETnJ8tLPieghVrMrhCqUXwCYMlNxqR+jz6iSqzblSjKF+V13RldzuoLZWwnx0vVtvfNhWH7gtWMMOlLUi9n141gu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278348; c=relaxed/simple;
	bh=QUEl6UiYbHWT0k48QXA7zSE64pfkFXigcTSiAI37zKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nS339UWOsrcd5+kdLQVl1uI5xIAl9AL6hOJD8tqVXUtm6ltaRZqNjzy2ATTM5KsyG6BMFUGx/7Q+0Wk8wlYwQPwPK/p3koOTYIKpL5K21MbcnjT15SzwWS9RCweEFxPOwv9j3kZC2yXpuolrn42CeJPaYUhUAIWkpoR9qdH8ezU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2U7Hw9c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpDCZmbp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2U7Hw9c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpDCZmbp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1w962687535
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 12:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eFvwZPyjWrJ40SAo7E1SSw0UlXA/XiaovP/4wphuTaI=; b=Z2U7Hw9cd+Dd1rjs
	MiUr29MeDo169P+/kU8Nis/0sS+bTAuYZnu7X/bhfRlYRqnRNeq7syJtvl2JhWkc
	bNmwe0cTYu+/kJ5Zj5C9ulDyRl+FMsL30Rud9P1LUD9O6lYN5F6QdTNFdCR4nnW6
	KvCovBmAR/E/eWWGwJM5fjslNqZK2zUxMihU45bOHpOu7Hk5/s6Rnn4+Lh7WvyZt
	BdyFBhlaoFNEhamM/Q0nvXAoW9qpi5pAjkHkwTceDKqCAYLqWeHb9MdLwHXiIA//
	Y3uZCbIY5TmlYKC1wqXdIxu4oFU+3byRIzmBr9gSXsm6mcvAmDe2kaWj8mdcJrNG
	flxOJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp34ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 12:25:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so2555749a12.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278345; x=1786883145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFvwZPyjWrJ40SAo7E1SSw0UlXA/XiaovP/4wphuTaI=;
        b=gpDCZmbpkngpQjd7vcALU9F0bt55veGlaFi8s0pWWeVa+AQewfEoi9yGuG458Fx6xC
         mbiC4A4gXmyMWF1xYTE1e3AYEZVXiz+n83KYc7UKSo9cg8MBZD59Qcf1JL0VTQXST/PT
         b/pByHpmSEzdtD2XoC6reEDPrC+svwINm3Gz5c/VpyHbxYumAEA1ahKrOtkH1h0SrGf3
         QqqIlHkbfGLgkO4FIX8ie2heFxpleYYfMJtyI7XXPP+Z/pX5sL1PuZ7fUZ/nOXOoUfJ2
         ZE0JC6KgtN89LAc+A0Q9kQgEZLoo0hinlSxxZ8s4zYwNwQD3g9LpLPs0mKnjAblLpWNN
         Y7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278345; x=1786883145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFvwZPyjWrJ40SAo7E1SSw0UlXA/XiaovP/4wphuTaI=;
        b=eXYj61/4aZOR1z0Zxk85wsGdrM0WZS6ZENfo9ZzHbzotGGg0spQCQ8JPh2Kbwm0lAa
         zuSuYbVeJTpDyagVq0e3yXZvSttaaAZsvPgsrG4/HmiAfgljdsAfsjVnxExvU+v/aFkw
         TWMyqs3ZGgymt+bag1KthvnsWzODnD+KY9Capvq6cKUY6td+0BFXUUo4PnLcZ+UvAyex
         HLEzsxZmSk4VK2HTlZe+aougLjIUqZU1/NN1suZZoaVnFrgXdxqgsqj384lxW1h1NK34
         bNeo9ysQrRQ4ORYaOOfObqHczKs9obGHpms4R33xpKdcTcvdierxp3ssSdmG6KxWLCT8
         xyyA==
X-Forwarded-Encrypted: i=1; AHgh+RrXBiNyUaKy093OGXZ1qkcfpF93mWXWuYshPu4hEOFU/Iydm3mHJxDQatNNvWlGbDvTyomL6FX2eAlq@vger.kernel.org
X-Gm-Message-State: AOJu0YyWb7BqcqoAjEmN6i79YjV71GSl2gkDMu4rp1W+SjjhHZKox+cG
	0CGRf//6Iw+u5pGcfYDAXqV7jeN1xHrmNlAiYKnTdWEAudXUBhS0KPFYq4CL46LPC0XBtQPXAT5
	/S2EdAcXCciaCnDnt/iYiQ+VkU8F9rmUx7PLt8spvcA4Ttd/h+93EI21/rprJz9kNh2TvsuQ1
X-Gm-Gg: AR+sD10Dz3Lpq8DhURCFYXPJJdC7OL30JQk+Ul+7UN4TPAhbM9UIBiFCITeyxhXaCuq
	eUvD0saCaVVXpoyrsoZpCG8kcudujOkR/hrWYKn4KXK5InVjF1Ktu4KZV4Zmo9HsBL7cm+VSQL0
	uvbKYblZqXzy4bVRuxCRUiucLuFDMtzsgkvgtSPyVMTWOMTnOsF+tp3dOn1qwBJPR+zJQYGPMtK
	V7vzuaRciNDJQ/WEEN5k6Q6htWCWNUzv8sRzUS7MadpIssSwILeJMGRe+tfLc/hMmVkTwQYQu0O
	uUt7UNTYaS4FMSRjx+C54aU4riuizIn+kHEFrp1glARCjlsbYPJfQA+cWZ/Z5G35yf+zGq0oRMH
	SL0P95qBpezT9PwACbL2blnTaf0GX99sEJUU=
X-Received: by 2002:a17:90a:dfcf:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-392847505bfmr5855905a91.15.1786278344932;
        Sun, 09 Aug 2026 05:25:44 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcf:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-392847505bfmr5855882a91.15.1786278344414;
        Sun, 09 Aug 2026 05:25:44 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101a5ee91sm25049479c88.11.2026.08.09.05.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 05:25:43 -0700 (PDT)
Message-ID: <409e0b5d-9064-4a98-a03e-878065b4f239@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 17:55:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename
 QAIF clock IDs
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-2-prasad.kumpatla@oss.qualcomm.com>
 <20260808184533.5C37B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260808184533.5C37B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LftsLut5bpzsaiTDSTJsY7V8s3FKFReg
X-Proofpoint-ORIG-GUID: LftsLut5bpzsaiTDSTJsY7V8s3FKFReg
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a7871c9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=g91HuVkBe_aeT2P-Lb0A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDEwOSBTYWx0ZWRfXxcGgYtfSqZYM
 GcHQIjdSPy0ZZfKBzIAbnRTMLYY97fm+ZeS1cpSQunbx78WA2Q1JA19mTGOishC2r2IiXaC+RvP
 kWodOv3PFxf82FAak9e7x6KAogQfJ9+WLQj3jyX3LGbPk2jwxv2/Wu1ztLuiZ0Scja50enI7RYI
 2KrfnC8kcnH+ELtIcoTkgeOPP15StIcULOIbYVSeyfv/8nTjQG3oWTYXAib8HmMk7vTJ5qlTwMb
 F/B7gNBUDdoVtc3LEDqiAlleiZB4B2WiEjyRgbZgtlIbhjYL/l6XLI9HRtBKUexF6S3wdqWcivF
 Zic924+uhaBtB4lbrI8A6j9oE6GMbHlPVASZ/Sk5PL5GejrSusfWZwg9D7U++fO/fdAnGlJ7JDF
 RywvW82LWTPnEFc7QnxPdxgFS2HzJrMK9giYNvbH5+Q3uPZD58tqKkyHOZPjcO7rt+Z/guO8FdL
 uJU5+pB33KvJbNlJvjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDEwOSBTYWx0ZWRfXzS4cJGtRMO51
 Fb/Fc71/p9KSFqZx0KPkiiNRYwJF/20ttcZa1ExuUkv7hjrb4k2nzqAYV75T7Twe9/Gkwv6i28N
 s1iWY/6ERy/1WzO74vVEbmgV5g88zKE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608090109


On 8/9/2026 12:15 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Renaming macro definitions in the dt-bindings header without updating corresponding driver usages breaks the kernel build.
> --
>
> --- Patch [1]: [PATCH v1 1/5] dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs ---
> commit 24389528fddee532f4b72dd537118240033f4a3e
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs
>
> The patch renames the LAPSS_CLK_ID_QAIF_* macros to LPASS_CLK_ID_QAIF_*
> in the dt-bindings header to fix a spelling typo in the prefix.
>
> Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
>
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 2e879a3c09aef..3a99703dbc4a0 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> [ ... ]
>
>> -#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
>> -#define LAPSS_CLK_ID_QAIF_IF0_EBIT		72
>> -#define LAPSS_CLK_ID_QAIF_IF1_IBIT		73
>> -#define LAPSS_CLK_ID_QAIF_IF1_EBIT		74
> [ ... ]
>> -#define LAPSS_CLK_ID_VA_QAIF_IF0_IBIT	97
>> -#define LAPSS_CLK_ID_VA_QAIF_IF0_EBIT	98
>> +#define LPASS_CLK_ID_QAIF_IF0_IBIT		71
>> +#define LPASS_CLK_ID_QAIF_IF0_EBIT		72
>> +#define LPASS_CLK_ID_QAIF_IF1_IBIT		73
>> +#define LPASS_CLK_ID_QAIF_IF1_EBIT		74
> [Severity: Low]
> Does renaming these macros here without updating the dependent driver files
> break the build?
Hi Sashiko,

Thanks for the review.

The old LAPSS_* definitions are not used by any in-tree users, so
removing them does not introduce a build regression. The
corresponding Q6PRM updates are handled in the related changes.

Thanks,
Prasad
>
> Looking at q6prm_clks in sound/soc/qcom/qdsp6/q6prm-clocks.c, it appears
> to still reference the old macro names:
>
> sound/soc/qcom/qdsp6/q6prm-clocks.c:q6prm_clks() {
>      ...
>      Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
>      Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
>      ...
> }
>
> Because Q6PRM_CLK(id) concatenates Q6PRM_##id, the corresponding target macros
> in sound/soc/qcom/qdsp6/q6prm.h also still use the LAPSS spelling:
>
> sound/soc/qcom/qdsp6/q6prm.h:
> #define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_IBIT        0x500
> #define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_EBIT        0x501
>
> Do these C headers and source files need to be updated in this same commit to
> prevent undeclared identifier errors during compilation?
>
