Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAF641A510
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528154; cv=none; b=XXe2zthcZf83Mylj1nw2xYwqSC8GRXjqdvOYXYRavnQRE56UrZAlKyKCdBeC+oCQMaFbWyjQEc9rcc5Ymie4g8pHFoftJeTVLLR/xHvmJz0UXBEUNpndMQ56trn9msG0NNEb3c2SolZDmB4AHj1SbzWWe2rgXnL5ID3dselPxck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528154; c=relaxed/simple;
	bh=P6ujx7qOjSu41EG6TJTf/zZQEyn0i35Pb1cqX51ocwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXy8lMPWX+Dq1HQ8Lfb+K8UdA6lasAQpZkbMqWugT9hOMgxW1F1r8eYr/mJj4llisPmhWDHrhqxRn7bmZBk0uaSawv/vBF2pYSm+gywAvDM2j+6GmEYs+09Gwl9PQGJq2YtqTDVQu48aRR92xZ0IphQmUXSKvZj1CLBsR5XH4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5kcRMBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Je61rVct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5kcRMBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Je61rVct"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fpcd3777827
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSWCi66YE8ErYbSgjBsfYJ+A2/hYpl117IJirU0vLro=; b=B5kcRMBRxZ4oleDp
	4qtfimQechtTailYt75vgJtuARqnyhjMLbWsDJUEgnmxlACNM1tV9BT/W5jdzkIK
	qTo8UG4vTzsffQkTppnTFCvWwV7v3wa7tPeZQEMVL/kWVb8kr9XTUPgDiEvbxh0b
	ZM2v3H5GGKN42KrIq7fZHOfF5AwvgovELcPDtim3s+a9NtodtjkyDQnkJLiO19NZ
	hNiELf66VxnaVHvr8Wc3j1E7OAXGcCqvobbQx/73yczsnEC6meLHH1/n92GQ+YgQ
	08YWxuaIvTzZ7THFyFtk8LLy2QXiTIUOMtaOILIPrNRY6s6NZhPiPDnDh2x9hF6b
	13Wt7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nucg65x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:49:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso14007201cf.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786528151; x=1787132951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSWCi66YE8ErYbSgjBsfYJ+A2/hYpl117IJirU0vLro=;
        b=Je61rVctj4CUmOZrWWLVfcI1oHznfjr2j+aXI0b/wBQiK99wkdxi7hqGFeMLWKdx6Y
         EXqS/DKsZrGdeIkVQGMPEt8tDiguWQyKDywTyBZsMtydi8GVyeVdQESxYKle+YkqDFLn
         W1rjY4aQRLZfKWITlZc4NZ2pSkuuPUNRptIGg6/BqWdXCkTRtjXbuRVh0dfOCnR5Bzru
         I5MMoCTOfSElahLRWrwPaM179TfPPZUlh6TPEzttCZ4HekTCbd0p+5W5lFVRQyyGKyQE
         /vuAHteOS4IyMYEWlyQR29gDgLwDMq5SrT1uE+h4j4Fpa2wt9WDRTBlQl6v00vBh0qSl
         7POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528151; x=1787132951;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSWCi66YE8ErYbSgjBsfYJ+A2/hYpl117IJirU0vLro=;
        b=E0XBu0moSICkBueqvKOzGD2riC6TRHzkqXhDx6P3ftcyHOZyKWqpuCHXM41A2sg80F
         62wry1aqXA0cRwZ3ISafjaSRXJ2Q/FmHoFM3qLuCeFuZPEUW3mh1g8ok+clm+ghQFrrv
         bwn3VInESFlB5U29QWkmLs5wCgOGuckWKKovQSMJ72869qBcp6bgNqSWkogsmW1BlHCt
         7iLzidLI0DPxYCrV+rh+fCVPSLAEJytwcImxwBE5qMouDt+37p8JO/2ZQV+BEHo03KNK
         ZqkDQW3Qxh65sTD1JxWXPmvwbwE7PWTJ7mPTuUv7e+S0cOhq45lzYbHu7GZd9vuU2WwT
         JJeA==
X-Gm-Message-State: AOJu0Yxn3KW7WIAZ8SHrLPQTCk/P+BJbn82lu07lCNh35Yp62x8FGdxG
	3qCAJHhybPYpWneTqLwBP04Lg86nOWafq2ubeB9QSDqfE8Z8mw2W+AKzfSqQWohutc9N8V62l5M
	2jsT/2VfPUW+5YSISE+bzoQmAegd0OHazhJ0EbpupNPixE9/dNsQm2Sj8DIJ365tB
X-Gm-Gg: AR+sD10aMqcEgkyCyH99GFuhNdg97BF5l7o7nc3OHQmG9tkBG2/I4x0oxCYKfqjh3uD
	9OSfrEB+1bbz6lANJphcW9GwMRPYaYEbxDDaSHAqZ9wRJSuGm8RqVW+b1FuLyJUl44BtI5bQSpv
	v8lUwOo75ILp7y27h1gsrQLFGLVtSFPtVnbu4JiPHZerswf3RpSuA+e+fNuoI7iRH3R0KAVUfB4
	I3UDir0T8s7m+uDsxBTDxkwXtlG+pA/3jEZGhGNzur3GcD0ufKGvTESGBydmfpzoeV7RfVzPWmK
	FLnilb0vO7J6eaA5FlYnTQyVGAmlyUZgle1oxcjoM9sTccp6NSUNx79QP6eLDb77TBr9jjENWBa
	EbtqlZ08/MnyG5ZSfFPMF9uygVSq9Yw==
X-Received: by 2002:a05:622a:1a8c:b0:51c:1590:8e13 with SMTP id d75a77b69052e-52d646b45bbmr24962101cf.4.1786528151298;
        Wed, 12 Aug 2026 02:49:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8c:b0:51c:1590:8e13 with SMTP id d75a77b69052e-52d646b45bbmr24961791cf.4.1786528150895;
        Wed, 12 Aug 2026 02:49:10 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d709dfsm5950355f8f.35.2026.08.12.02.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:49:09 -0700 (PDT)
Message-ID: <d55ed65c-b066-47aa-b285-c9582894b84f@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:49:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        =?UTF-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?UTF-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
        "bmasney@redhat.com" <bmasney@redhat.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
        =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
 <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
 <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JJrY8n_9p2iB6YTSdVVLUjKTn2g2wreP
X-Proofpoint-ORIG-GUID: JJrY8n_9p2iB6YTSdVVLUjKTn2g2wreP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3OCBTYWx0ZWRfX04mVBAmm8guO
 02M7N8fbu2e717nAbN4G8iLUVy53/BwgG1aI0GUAdmYIYjC7246CMogg4EjCZmwJxviHb95a9Ju
 BZRecvT5x2mQuT5/XxUb6Iovz5JF9o++WUD4z1E8wuF1+Ojp2XI4DV7WfjpoG/5eewX/6iSUOMj
 uOBAQMgBnWWOUtojY2wcxb5H9yyG/nZJwXwR47JUdV3+THio7URMJkhx3e6KDGfVSC3sB0y7wTx
 n33IFL0N0GvHBKm09fhsagzAdic3XSOFW4n6PkOtY2PyjHflEtwgnJLCG3A7E4fCGtBo2oAexUm
 fb3D9ZC6BEUGYnpgvVGLmSDb9VQNgCX6WVVjxX/lt+ZXx30aaBuQtSZrSvcEeauatJ/L2x3ybQa
 eLuWXI2eNvA8jfnbfZbiUzTFJt9FbVEBriZae5VtmRH44WdXSO2gjJrnzCZYSxBKT/MJg4wFj57
 5Y9qXXeg0goOOpKV55g==
X-Authority-Analysis: v=2.4 cv=VcjH+lp9 c=1 sm=1 tr=0 ts=6a7c4197 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n9Sqmae0AAAA:8 a=WMIDViIH5NI-YaAP1ZcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3OCBTYWx0ZWRfXxF4fDeki/WYM
 O1h9wVYhBhszflQYE4rQzqcTqh6jElcTBjOKmwkagn+YaBVhkk5YfTHSMsinFK6ARQ63v+3TOE4
 U2JSYE/NxTCdL91wBK+Ykt7D9dImAmk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120078

On 12/08/2026 11:41, Yu-Chun Lin [林祐君] wrote:
> Hi Krzysztof,
> 
>> On 12/08/2026 03:59, Yu-Chun Lin wrote:
>>> Add DT binding schema for Realtek RTD1625 clock and reset controller
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> How my tag could appear here?
>>
>> Look:
>> https://lore.kernel.org/lkml/20260324025332.3416977-2-eleanor.lin@realtek.c
>> om/
>>
>>> Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
>>> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
>>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>>
>> Who added my tag? What is the actual flow of this patch?
>>
> 
> You gave your Reviewed-by tag in v5. However, after that, Stephon provided
> additional feedback. In v6, I modified the patch based on Stephon's
> comments and made some other changes. Furthermore, I added the clock ID
> 144 in v11.

So how my tag could appear before Cheng-Yu Lee signed off the patch?

Best regards,
Krzysztof
