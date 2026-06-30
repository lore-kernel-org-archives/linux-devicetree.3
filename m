Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6C3EA94A
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828568; cv=none; b=sJbHb8GlDr7NJEZGlZIkzuI1U1RmTcsz04m62cKJUEN7ucHuj31s35F43seIDUpKGR7nUsAz9jRpxq7SD2M3Xki1owovymh0UEPXHRBUgTE++PGmik5wfFSttbZyCac107dmdyALQjmYD2mlZ+6Y3Q06OHbcNKmkS6y1bQJh8iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828568; c=relaxed/simple;
	bh=cB1rzD8ttt3+Pf+ZC36TaOXTRkhlR9lFs2JuBGQUUfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgVxLAlTQcpknv1n/A1QNtNZcMPzw2vTntYBefqjy2c4wwfPeQKdk4MJDqk0kE7ZOL2BmWWttQFdSed2WW6qxpQUxpQc9x7dudXOEb53mB8Z39ZBOB9mgEsQm6RM4i7c5FEmhMK6eWm0/JswtCaeuJpeNvLp/sFdEE4aVFemD8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+ZGPTR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKeF2hpb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+ZGPTR/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKeF2hpb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mtij1522278
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=; b=l+ZGPTR/vmlcOdho
	OUfrMpbjEUKfVs9bvMHEcwv6H4b39fhh1wPo8Dm7jgzukwZl/PSbgsaLZaMbzy1q
	ITBLEm5XdUUIN0mCuUOTCB7l7Ud8iuA4d19qSvbcDdTySF0RHqxCfRI7LlxFCclY
	0EffM3nelQKouYnkvfVvUDP4xJQKR8H7bSwkj6FYluvSQny+v5SzX21ZTjUMPMR+
	v5XhSEA6kQ35BepHizcN307Txcn12IBPKnU7+7xsX603GaJ8XSpOCZGZSyqd5Xhh
	2RTf4hC8Emv9RIawxllPdEslvboyos5lszxELdnMOugQX3nfKgPQomvfgZ4sXLPa
	iNlckA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw93sc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:09:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7392d893428so170789137.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828553; x=1783433353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=;
        b=fKeF2hpbt7cXhINuGgZ6DIXNpPtufTxL/sv2gumgUj0QyiAC/nPaDNBAQ6tbrtUDuJ
         HGhqXGkJRjndvHsg03y408/OAAE4AzCCJ2AU70pV89KK3BRps9bDluL/j4v44ylAk6dY
         rGgxcPl2TP447E680n8ECTXoMpt2gntL6inutUuYxz+dYLvWexxYoBr/LO8MP/KDELeM
         vp7uHasfcMWf278d4Mz1hc3ugOvR2TV/XbKnAkzYt1JPBgJCWX202uigf3VyfzOxVXWN
         tB0gCxegtPRLWvEpuEP+rn4w7l5yr5wkSmSHkcfn5DKR22F0ap8pCCrYkk19AQ8aIZ76
         xTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828553; x=1783433353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=;
        b=SVOxhAeylfmQpnX4Whxi9ch+FM2/B66vCKBk5NxVxlDOkVWG2LIHJR5MNwGHF9divw
         E73BrC/ktKhKWoJuH/5RWCseEV4TMga1oSVeJlwn+FyaGyxtnKFQttqI6V8cKe+TiG/T
         ZONmR/5jsFMAsWdB8uMUz2FlvNWv2y+Nv2+xZ+w2IKPgji0wkoFeCUbSbFqLpe8+tOJS
         9aqKZYAXoOYHtsJd+AnaKpF4Plif38yu6O0Rnsl+7PSeYrqldH7uumdM3gh42fcfXFmN
         9tRcnGx/0+bE1m+9KVove2cWnJkhgQHcwz1W/86wQ3WYyH1MUTehMqWRk9sqQD3AOdb0
         Uhig==
X-Forwarded-Encrypted: i=1; AHgh+Ro1BczJg3eH9i43f1VMOkpsXAQM2C7MCXyZrtFGKBMmyMAosw4pF1iaJ/1u99dRZuI5Ps7Lvz+Ng8rU@vger.kernel.org
X-Gm-Message-State: AOJu0YzT3bVhBSlbjUt6ixx0oZJPmaC6W0wIzgmDCIW9UGzhuDKdPriV
	252vQ8a2Pke4sHiwgMjld8fScYL7nizRITaBCGaEdfyb/0nw0DNk/RUUBskDYiF5Okdx/C02sBh
	qdPPXZIg9Lqt08y2a0eknaO4A7eISWxx1b0CGoBXqXej8G5CTn6NyCrU1dRE0mNTr
X-Gm-Gg: AfdE7ckcUTriGCWnYTto1F7olPw8RxV8UjHQmH/QEliBSPLh9p5p7ygcExBgx0IOiNK
	BZPIcyFZCA4KX3S2DUd7XbUY4LltbfL67f7mKmmjAlUQfq17cCHgNJITi5qa/px0+pmJieYdDW3
	YXM3/Cs6HdkMLV6pvt37k+/qZ8ACGjBgRXEn1XijzqgMH6RgiN6ztJu83T1liL++5mq6Ad1kZok
	JXHL2WtwjdBE//yhoPhkMrTq1CyZCcXpQRXgtK1cUHcyJcmf96oP+WFtEDV5rCdiBRakHFD+1pJ
	pKkAeD7JJ7vV1gAy7PECsGXg1ufCgchMcm2uf39yFNXYNN6Mj/Xmi7kDhEFcI0pfzA01X6wyfVj
	wQVa3ro6KPoiRDC3g3KD0eHdn01hzVH4OTso=
X-Received: by 2002:a05:6102:8081:b0:72f:6669:286a with SMTP id ada2fe7eead31-73a363e653fmr674951137.2.1782828553190;
        Tue, 30 Jun 2026 07:09:13 -0700 (PDT)
X-Received: by 2002:a05:6102:8081:b0:72f:6669:286a with SMTP id ada2fe7eead31-73a363e653fmr674926137.2.1782828552777;
        Tue, 30 Jun 2026 07:09:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc1esm135860766b.41.2026.06.30.07.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:09:11 -0700 (PDT)
Message-ID: <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:09:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfX+Bc7cHwJZIYp
 y5NJN/pu4H+R0Wj3jEzfxqw6uVgSG9TwRo1rH+shA2e3zkgpdY81E/ZtU2MYqrvSqhlG0ZgoVG4
 DLOB+Ordn1PRkWPFDqOQWF3643ewR0k=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43ce15 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6vCOFkJVGQXElGg4amEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: ArMpWkc8AhdXvSgR_mSyrk-MsGrzeUPe
X-Proofpoint-ORIG-GUID: ArMpWkc8AhdXvSgR_mSyrk-MsGrzeUPe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfXw3aRZuByLEA4
 TYAJ1D58MfuDOTQ6SV+GnrL1Up/dUVeCFdnoCcnnkWdtGNYqRte/snFFJg3U9bV2zkQ9mg9CpnX
 AJ7GuyTfi/UkXSbHd2a7gpyjLdpVcua/RAB3rgYeWuQLenFAMCqHXku6pE6x0agh1JJ9AX91IM5
 GGFL/gkQfkYecvLEBYut36PKzbrYdAAvQc6v+KjR96NSC1fuZtsy4P83clUlZt1wiR9v8Q48lgG
 1otgsPwOqzu8dEs2e7aZMGGCvMlbTR8Xi70EnOXvKJwEIztLrMtp3dIyaryBX8cQmSPTy6guUCM
 Shr7tiE141zLfBQDKJXKZ+sPN36ISA013mebKXSusD7byDc5uIYAt2NJP3wWUYENG09vPr4BwQt
 udqb2XHxLBV3rlz4Gak/GTQMpA66XzC3M4Npa5eTEfsLN2C1Sym4F3tMr/vDa69izbSm5U239H+
 iyq5XD/MA7cpTfpr95A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300132

On 6/9/26 5:02 PM, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Almost all of these nodes lack power-domains, meaning the
aggregated performance state requests will not be translated
into RPMH requests

Konrad
