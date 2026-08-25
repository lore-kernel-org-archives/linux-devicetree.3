Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594193B388B
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 18:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683954; cv=none; b=pqnCWyqPsy0dkXEl/F7a4cRBv87oVAkiDEiX6QhhfEhf1b/wzA1vGE13d5jNaHvIVgeixlXhzPjqgEAEuNxJE95Zm9G3b5+vz82iHj6fOwZQA02Z65ejq8cU4OEndgzjbok8tZlDaTcjGbPYSkPkBG6q7jLZceudnqC14M4OFSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683954; c=relaxed/simple;
	bh=iStqqgKaDOp8m1KWZdx/6hHxM8ne6J1JQXJJy3Fb+f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUelQDSzgotvkG+ZLJpx8tfpSSOH59OEkEvynPCTnBnp0oeJW66ZUXt7ZvhftCF8AUmoBqF9DONZS4HoX2ZzxeNlQiJSC9B6NgXLIflfpyMOrTHskQL8aAqKdSVgWFSL+ytWPKf8qK+TQ0vcjYRLGTcwX0jc1Du2anXrxyX3J4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgnZ1aFO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsHvT4kT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgnZ1aFO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MsHvT4kT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdMvR2154885
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 18:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfBd5iljf3sWm63em7lw8B2SG/E3mmlz2ll4N9yEOmU=; b=VgnZ1aFO7Vkvlw7x
	FV5+s9eAreScu2NIupxB7T+CSpbKghHNmOLqzk52Y+kyVWTEM652X0jMdMCfbwKF
	OwORz2RmZQyOAWcHDmuXWMZq+AsEAoKY5kY2AuoX7zHpxu/w8AJNBCxcS7pp1/s7
	mxFXIr2ZWpVI7I7hK/zbxPtCTL0olpNbGceOtzDyuk87DccVHt7EOSXaabsH89ps
	tCjW91wir5mChY73YjK0d+ew8g17qQLEcBLjGFk6I96ZaL9ruMNcuq3+gL6IS6sa
	7Zxvc0QN0okRH8g6SJOnMpj+V3snjDNKZ0PUkgMpDGOg820mrmp4yA3L5EH5ShYD
	NBxAgw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g98hp2ax3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 18:52:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso2277401cf.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 11:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787683950; x=1788288750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EfBd5iljf3sWm63em7lw8B2SG/E3mmlz2ll4N9yEOmU=;
        b=MsHvT4kTmKlRHW1CHZaxBt/7/ZbAX2RRxUZEPrHvtMOUrgnjyPUXPaBVv529LNLdn6
         G/BBX5P16EZYQ83RdobwxQwnx1IZsLPtyCqGHedCOQ6Sd890l66v9MJS0qxaauRTcIiA
         H8NPfLzAnD7Jb4vrUX8qc2jGplBKaChiprkDumIM7eeDXycVVnY6RYwZLnENFpj6zaio
         LTbrkx8LQRsWo7H99yAOr355NWp9qN286koRhEkZocosdPYk7TUyhTCtD7W/clUwb4Z1
         HQ22scBhGvilIrh7+DCqmYFJW1hV/1+FBCm0THT7WI3ZSWMMXo3mYWuGdXHGGc7L3e1U
         acaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683950; x=1788288750;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfBd5iljf3sWm63em7lw8B2SG/E3mmlz2ll4N9yEOmU=;
        b=aYpabfWYkVVW3x2FIV59X3FX6O7TEy7cXOS4xwa8qcwjeycrKLu4DZyZpWdoxApdl9
         bF4flzYuuVvX/70/g4HZqO8ffBXnKx7q1+/fOLmxDaxLowv+h5gzNR7RKwfUca40SeRL
         ow/gBBPQ32+sPB3HKl54frO1C7obQgxf5UE4VvKLgTgUtwhQ/WCAP7ucI4HLxUWzM3EV
         MYoMlrHKHpJZFncrafk12qJcsKPObZOUyDt34LIG73w8KZYibqYrrlqe+0UYAAibEvUq
         poWaK+UpBjNr7OVcbCrbODDgyR3LERA8LNZRs18Bx7IxgI4PPU901NHQYtIP8JSC7C7N
         rmLg==
X-Gm-Message-State: AFuF++ntPR+5c0Ndh0FSYf/gt0KMLLrSkA3nLtWnKab9+LrZqYeX3jZD
	jfbk2KgXkOM6VwCIyxYHvCLXGkJUeMom8+o9z0bMnlv8IekEnYRytJdXn881uuP+Di6rypTol4E
	afsyXAl5CEInl1uLOfIMXe2etyjxmgIhGBMY3sdVBjrFINzaXiMwt2yFFRokVh/dU
X-Gm-Gg: AR+sD12eDqAMPvWFeuMs7eSuIdM79xdYvViN3S0G7Z6dktvWbTDWmYcrAto9WUvLpl8
	q4EHEqU7HMy1uJ56onKSoiI+aKRkJMr4x0AFYPKYqqvtQUsno/JmZINcil9d01MHARnV8HHLLgq
	PIJNpHHwUs169lyTAJepxjZ5s8saNwZumOu8eTscd+6Y6BcoP6XD4spO8hh/9PeavRtwRAjIgkY
	DIwoS5CZYVpue1+p01BmITXVhkT0sHk6YVhx4MeZscI0gSbkR0EnX1qY6/fKnJx0vDuCYVQW7k/
	jzFZehksyqYClOW8b2HkxC/mTSSDxgGupIdwCR4Ppuavn1fG+gAzmT5Xj00yw+ESWISWco8/A/b
	M+Os43SZ6XAMSpduzdkv5a7tqkeoF
X-Received: by 2002:ac8:5747:0:b0:51b:e92f:ec5 with SMTP id d75a77b69052e-52e4222de12mr12288341cf.3.1787683949619;
        Tue, 25 Aug 2026 11:52:29 -0700 (PDT)
X-Received: by 2002:ac8:5747:0:b0:51b:e92f:ec5 with SMTP id d75a77b69052e-52e4222de12mr12287631cf.3.1787683948886;
        Tue, 25 Aug 2026 11:52:28 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac46sm102859966b.29.2026.08.25.11.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 11:52:27 -0700 (PDT)
Message-ID: <f2705937-0966-4161-96df-88541762f147@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 20:52:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] dtc: dt-check-style: Handle root node in
 overlays
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-3-6c9776928cea@oss.qualcomm.com>
 <20260803091808.99C0C1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260803091808.99C0C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YPds2cIEtVmAlpOHrs_raYePgDdIZZ7-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE2MCBTYWx0ZWRfXxeb3NIdw4spQ
 hBHc8t7icC4a/hmdE5ImpdeGGaEth1xW5ZJNTFvcgjwVOXR+NnjHd3kTqmMjHNtzLUs3zVsevLK
 r5uNuYfYnHpE+CddEUT3QDBT34IUGbo/6f0TvRFJdyGWLoN8IJVsvqQ5Hi1/WpzMlJuZm552b3V
 cZhDDvJOCzAKvcBTovAZnmnUJgUWblPnAK5iyC5BoeWWPpU71aJ6pHX3WoLZ4ffGHgummZ5HHuT
 5OMKHnEvv2KIc7JJKDClYOoch9uro5gakoXTROCb6scRR9ftUoihwmg4TwDjSYksyVv0x6soq+Q
 FHwhNtoiEBQu+e63Ojg81QSArlidh/s6wyHLaTUPJY1DOPyb8p1QmKnnYUWRTA2nKkCa/7fRiNt
 jX2oDKaAWfW2LexIGyP5d0XQ/NyBstks+jUIdMsTAJ5w28I4tYJ8ImZL6dKEer0gbIJ6wfMXwtM
 edkoNnz9mOrdgSbnAjQ==
X-Authority-Analysis: v=2.4 cv=B7CJFutM c=1 sm=1 tr=0 ts=6a8de46e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Rrq01w7Obhnz-bXyAW4A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: YPds2cIEtVmAlpOHrs_raYePgDdIZZ7-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE2MCBTYWx0ZWRfX02LCnAn5udrt
 1DIDWv9FPaG7lhanlxhXUz7yC4vEsw/Ty1KfylmCoMKmx+/J7Rm5zSmnijc9uDJvaAMk2osLwIc
 d92XP9eP2GKUkGGAAR+N+2pt+dFqlgo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250160

On 03/08/2026 11:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch fails to address the issue claimed in the commit message, introduces dead logic for overlay root nodes, and causes a regression for standard unspaced root nodes.
> --
> 
> --- Patch [3]: [PATCH v3 03/11] dtc: dt-check-style: Handle root node in overlays ---
> commit 099936d5537a0ed41e9b6886979ab1b9de2421d1
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Handle root node in overlays
> 
> This patch aims to handle root nodes in overlays correctly by detecting
> them and storing an is_root attribute in DtsLine, intending to fix false
> positives for property order.
> 
>> This fixes false positives for property order for root nodes in overlays.
> 
> [Severity: Medium]
> Does this patch actually update check_property_order()? 
> 
> The diff modifies check_child_name_order() instead, leaving the
> check_property_order() function completely unchanged.

False positive

> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> index 96deffc0d8a7c..d9f76d6d9179e 100755
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
> [ ... ]
>> @@ -228,7 +229,10 @@ def classify_lines(text):
>>              continue
>>  
>>          if code.endswith('{'):
>> -            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
>> +            is_root = False
>> +            if code == '&{/} {' or re.search(r'^/\s+\{$', code):
>> +                is_root = True
>> +            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code, is_root=is_root)
> 
> [Severity: Medium]
> Will this regex handle standard unspaced root nodes like "/{"?

Ack

> 
> The regex pattern ^/\s+\{$ strictly requires whitespace. Valid unspaced
> root nodes or labelled root nodes might bypass this logic and incorrectly
> evaluate to is_root = False.
> 
> [ ... ]
>> @@ -550,7 +554,9 @@ def check_child_name_order(ctx):
>>          for c in children:
>>              if c.node_addr is not None:
>>                  continue
>> -            if c.node_name in (None, '/'):
>> +            if c.node_name is None:
>> +                continue
>> +            if c.is_root:
>>                  continue
> 
> [Severity: Medium]
> Is the c.is_root check reachable for overlay root nodes?

Seems this change is not needed.

Best regards,
Krzysztof
