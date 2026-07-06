Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE39416105
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342873; cv=none; b=MIqk8vpSjG64WXG4pDJo6+5JvzrQrpOohIqjYGu8hwLmo6RHoanN7FVIhTVGbE0ls33IM5RcbCgFlGf5YUhqCwiXQCzyfaKIFlSBNkmJFjpTLP1VWqc+ZhC/yIr41kWg8tTS4/vpPguowfB15y3z4CX9XSbhhTZOK11FVC0R5to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342873; c=relaxed/simple;
	bh=gIulxm52U2pGH7kvolaopSeoZ7amTnOimNMWFMqAX/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVN5hM3cALD5SwEBs4pd+C7WzAROOs71YR39S0u5BUZ5TEHoX1vj1lRjTjZ2wQmB9nuRgiNlfcpfSO+4NUceTEcGzhrcj729a7OIVYmHn/N3UInXAylw1ZxxiZlRmBEU5cGCaHWFs83qa/ebLFLYuOPKnYEoYXab4naZPSeR5y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVuAKBEs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mx3WKTkV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVuAKBEs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mx3WKTkV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxS7f369581
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PezbwLVx7HKugLssnJ1SOWYpFaEJMSvORVOhtdlHNpE=; b=pVuAKBEsXh9VJCHv
	ATzGsSA6zapipBOe4XLjPWRJjFlkUy236PEPtQo6HJlZKeAWq9yXmKNLI/IJmjkc
	faXxxc2y9wSvzBdHF49kk/shCzNMb9anqzGynlyL3WcZ9WpKCOUAAjFsMENFUeIG
	fFDrOMBjSadfLBiNx5YnDbQvlwQ6xkSEOHgiYTQJQ+91++IdoYzMuQHWjAa+Hjjr
	lY4ulTkLgSbFPSPtju8t/leMk9HGjqUh+3HExQqURoBL0+Y1B6rVekyzRwZElX3E
	e4FlXqmYn8vvng3SNjil6fWu8VdArxdgMLtLRYMZboqX9A7DXzr3MtjItH4wpCnZ
	1RC88Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9958j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:01:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso103254137.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342870; x=1783947670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PezbwLVx7HKugLssnJ1SOWYpFaEJMSvORVOhtdlHNpE=;
        b=Mx3WKTkVoi4Tq5CLTb3ImxX4xJElYYpbIkgBVwfJ0UKIq9BewT/zKwCMnw6gAgdQgM
         TCPk2PHUIn7GTVzBbxAr0Qrih7ZK5l81v8/84i9oc0cgxjWVIpT/2xXkb3z+mjPHbrdZ
         ENxBtoCdimf+hr6eENAUrKrIyOW0WeFbPhivjPKabG1dtIfYmBjqS2AgAm9n0vAk3bM5
         +cUcpqp52SAbyYXBJbMsxK1D3BMW/00pd6N8mH3/r78KToucPIcNyVtyUZx3kw+wKJiN
         Itglmn31brIem1o72epL9qRo95r2SINFCcz18FfIs9cx/XIuLX1KM+CRe/CJbh3aPCHz
         eTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342870; x=1783947670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PezbwLVx7HKugLssnJ1SOWYpFaEJMSvORVOhtdlHNpE=;
        b=p8SAwDcOVkUTLt2UZDvPDEC3fN89TF4/fb5WQKTbw7BYgCpWbRhgBEIkILUL51KvBM
         ecLwynFiCrOGCImrG08mQ7PcPtXU62HruUSAr0WGRMvpxdI9vsZJVbTAsd//M22UC3Nb
         D82AoPI27XPIcbOCAX/cPPoKgsB0tEIFTrkaFqwzz+Y0CYu6KTSfpPz/Q6q/2HZlBNyQ
         87/caPqP5oxNuIFUct4Hn3gLUFTaQa0i+ESERm4Eq3tY6BwBm/kqmebgaME+rSt2j5J6
         KJEi4qbQU9yOHJUe1qH5rgYGhGGBjUcyanlxO8vaRoOr/ka1KSxr6TdAaodCGlxlqi19
         18+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpS0Ain3wIklFQGSLPQ0aCgeazkUYv3yeYNsJh5g1vxghkDTgCuHEUGwmsR752LuqYRPnHQMeey3oVu@vger.kernel.org
X-Gm-Message-State: AOJu0YzXAPO4ulr45HmrDIo3pRdyTBA09ooogo6wWNhDZG2rC0U4LGkY
	cBlhe48xMVQAcHAE6oWBiPBnoHwMguanfSJPQEhTNSPrPXfQfehtasFe6s4b5r9AQDLMkfpkQZh
	4CGQZDz4S9vUQKuqOiVaxasLLfafI1mHi5xDHaIOPPYkvKw0xyTDToh0lRxhYBP5K
X-Gm-Gg: AfdE7ckVAMSvyXWTNX26dZxNtfxKl/+I8bbJp6h6qlZdGpROz3YAe7v10i+wzzUTpaU
	B+TH3xEitA9qIW9nuna4VK8dL7ySgV+SBv8M2qE78rlr2gVyLfg7NG55zbk3Gq7yKGmLRRB6TM2
	hJwZl5v7dfLqNPxIGlQ9I9o74vovAI+mx/4CSat4bPLG4pad1kfuxSO8HRpZGpMb/ua1maQA0c8
	EijcBxE76etN00gGGAxkZlHkTQT6UChyymP6evo6zkADg39WKyTFMDWh1uu2ilG9DISHh3owKJQ
	ycUs+8vJVo8yCmKQNEabRdTSJ5ZElKCPkqDOIlvMeEK3XnYWqnobY2FCy56ywd1twKPtph4OS0f
	L454+2QcjuSG7+nB866hzp/CNI+uZDYX3lZA=
X-Received: by 2002:a05:6102:e13:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-741e881e5b9mr1283849137.0.1783342870334;
        Mon, 06 Jul 2026 06:01:10 -0700 (PDT)
X-Received: by 2002:a05:6102:e13:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-741e881e5b9mr1283786137.0.1783342869189;
        Mon, 06 Jul 2026 06:01:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9e701sm4282774a12.21.2026.07.06.06.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:01:08 -0700 (PDT)
Message-ID: <bb789efe-efbf-4212-934d-a02913dbbdcf@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:01:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/19] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eGLx3Q1V9oi-kDTCU0B9gGBE-h8H-ZoI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX92w+isX1GD15
 sEOnT86ttUwyQdu8nJPH9B7WPLBng2+oMoX/EutldFVMW/Y7XNhPypgaYVPFHxOgoMOrEmlA0oR
 bCFHnD3rtdNaHh19T/mLjudN+xPOHUA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX8lsioDLRMXkj
 RX900lJdeugA7fdwAi6XpqZJdYlRWNhmmjaaP+GhZBhIiJj/IpSHPz68BXsrlJFtgZ+s+hHb4Nw
 66Ar9+EHfbxnYGxYe+T6gKRPPNhNH1FNdt6tpowQQ0SRjnTj3LKOgd+JKanFRFTyyWxAf7qX03L
 921DteJ+b7Cbifs/g7Quj/kjoJRP0NFqsrWm70cRPMuCV2Lg4cI+6KLGEcCorK7HGifj+P5mKLu
 E+ELlCETd0TqhXW0WsyVtxuceXMMT6SzltiHSiCkuzyVn9w56mNXKND84RcHN7j7zdemLbGrr4q
 MCeWX9/8CatqqvqxDMWEsicBnS7EOtJbWUh3Ku+12kjqSDe1lVNqGZrAUmOlTNpomN2eGMcR1d+
 nsXgIxBm7RYkK1Yvw8lyUwhtGrJ/W6tPwq/TcAZ6ED2kXAtxuRnFYmkihP2fb1Kt61+T2Z/kMLO
 AVRDQDxBcF9QrG2UTKg==
X-Proofpoint-GUID: eGLx3Q1V9oi-kDTCU0B9gGBE-h8H-ZoI
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4ba717 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060132

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Some GCC branch clocks are required to be kept always-on due to the
> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
> clocks and use the latest .clk_cbcr convention to keep them enabled from
> probe.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad
