Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AA63E9F93
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696063; cv=none; b=UoeyiWExuDxpTT5SoiMbSHIUhgbFOWHcK3OUZ3fBMjBI/FIiod3Kim1Xs4X+giQBOT6yfwrAid6NMz9yDh0odQyAKdcDnfD5zyvVVFeuWrql2N+Sz6GEganvwEEw7dwdsYZLG7V4ZkkZSW6NC1Et9DdItnk8jFWV2Ek/1+JxJxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696063; c=relaxed/simple;
	bh=ZL6NzegjaQYk/nqnKbONUU0+tW/kHrBfXeGyEtWiwpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y55VjyNmJ+ZSxRbbl3f9qC5XU70kyw2Os4RUn9e1VlbPKWIrnzyIm55pDfuJJxurfu0nqKqctbP+sjYH4dZC2xId7JCyUkt2mg9XvHLItCEi9HFxUz7UvlMbSIoDIlrUJUuQVaVz8Wpe+PONFMT7+dl0YK7ZKTCs8DyPbyVErKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8XAmmUX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W00q7N9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8XAmmUX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W00q7N9R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UKQN239724
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3fJNaZNbVpx61MjZen3xJ80Xr0pmnhphRl4LG/r1wo=; b=c8XAmmUXUgoaaBnw
	c3a7aAggN+cpEBW4RLlN36Yc245I46wDmKLeBy1I7yIiOARyT8OU7fUpMBSWH+PA
	odXVxuHY3BuJU0fn7eU9/ciMFTRIruBEa6RMUQWLPGpEBgs06Ann6MrL9wyjrcO8
	uec2HQkxuaN+SXG+2yBxKoL4UE8A7uYL+oNwMqkvceO34oPFdclur0D47TIgtlz3
	UYx1uS1wll+w6nPmlPr9Ac9A9+YsoEOmV5peFpaxpCZUSNOlCmgXXSJGOD2I43PQ
	mXc+F8JuuRklniUJSWkKN3XuIZ7hikhN2bUphSY2ro9zAQ6BG/O3DpSdajkFiT3V
	ZmwNsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueepjtes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:34:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9160006de85so145808685a.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781696059; x=1782300859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3fJNaZNbVpx61MjZen3xJ80Xr0pmnhphRl4LG/r1wo=;
        b=W00q7N9R792yIjFbbJKLZpF95dp2vnFfEqgVoSHdeay8slWitFj84eZqkye9a/faU9
         4rnDUrfjMPlofD1M8gpImQSkkFQyVxvjwlyJ0j4xx2A7wdI6LJvL9vTegCA4w02w/VGM
         tbDL349w5fYy/1DpHAuabgPfKKxC5y/Y3QTzJtLuNGSLT4z2zCQB8AP3sDT1qFe/bA5j
         i4e6Co9azCTEkMHERcWeEB2qNywNE9f8eKZ7iYxyrAHs881U4OczVlaUfbnMVapPofGK
         Nljz/IAJwHYJpEcMIjZqcwr8PGX9o67ada1UZ8P9Ou0ADPXSDxpCO60p5BrwfN194Pys
         Fg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696059; x=1782300859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3fJNaZNbVpx61MjZen3xJ80Xr0pmnhphRl4LG/r1wo=;
        b=hNMMUnmBd2SBj+LN8iBWXcsDscP2vup/nH+D0UJvqA2Rq3sqvBT0u9vtObCg8NFm5h
         clBHMIxv9PIY1Eu9atMpnqu8xlQD4HqB9W6TmTkkyMgpsn1pCyvMkNZbhuo+OZbx2s2M
         zbvYysYci4VuFLEe18Go0uNHtVCnsRHDBtGLkTFMOeU57DCiinc2WE2eOaqra3GGV5cR
         S6i7e6ebS+PZ8+jokSv9qbpF6lXTmqwTVyfsYZDtojk0vuLBDHWZOzaJAodIwmehSIdo
         dkMAS2G6PxvatmOWTAw5GqCYXhff4qTvEq7JfYJ235i7xt9Att6kfSjEJbX08HeX1TPD
         jEyg==
X-Forwarded-Encrypted: i=1; AFNElJ81zgDaxIvvus5YgOLqYZrEdwT6sDlapjFJB2UUOjxX27ZiY+313mUiSO+y4e38MuMu4VhlGSumFb+Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwwNZ+h9fhNQN5wtO1kvce9u7Qww69Y+J3DynwaXJoNzWHZMxMh
	oUdpijNXmc4WQggO0vS+bUiK6F6zgfm63NwAzfM/B/5R6sXOZG55Nti4nmf3QjXjv1IwfYqcu60
	E7eI4nzGKJsVzDy2/8g6UFcSwxjetIEszCwCinlShIvqDZsvkjuPrzD52jIDqSIu9
X-Gm-Gg: Acq92OEfNXu4yBKJORyf334q1Xtzvh5rYGIdlhJA2jKxwVKkggiVZJqA0QsLp9xI9+5
	uoELt+62vYovoGQRUgVv47irKPQcEsGqtEsMe7tqWpPbfcUcIA4j9IeoWL9kf+Eyb+aiBQepARE
	HPlsnPYczc2gx9H67aHM7cUaDJdeVoUzbygG6nO7d4e4SR4oqZQDaizSN3tomDq2mNpUkdB1wga
	ATRwnziz6FbKHhBPsP6Fu2d9ZJsuFTL9qlDTsgwuyXvYGKE5/uuRreA8GNrmLuiSRARNPePpr6d
	JsZaN+BXHSscqpyNS0HYfIO4WOlp7HFBswHRR9ZqQi720e9Qy62Azj9/vq9nZ719zWavkoH1+Qh
	i8Py7XO4GU58NjScpvG1JyY6Uua3kwG/Zwt4=
X-Received: by 2002:a05:620a:4155:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91d85442f5amr358102085a.0.1781696059649;
        Wed, 17 Jun 2026 04:34:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4155:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91d85442f5amr358098585a.0.1781696059108;
        Wed, 17 Jun 2026 04:34:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dc48sm803810966b.36.2026.06.17.04.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:34:18 -0700 (PDT)
Message-ID: <3f850fc1-f116-4799-a489-444703314a65@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:34:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add EVA clock controller driver for
 Glymur SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
 <20260617-evacc_glymur-v2-3-905108dacaaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-3-905108dacaaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a32863c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KhKKGY6azsjSgFTL2HwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: rqIbTroQZ6tzLQXWazbLzC9s0anQTvBX
X-Proofpoint-ORIG-GUID: rqIbTroQZ6tzLQXWazbLzC9s0anQTvBX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfX5Us4sZ/BH1C9
 NCZ55VrAw8pbpMc6hWjb3awEBz5CE2YvVaUj5094EgJZGT+HRk/QCSOdE6L/YIcnbaX3aQXZ0JZ
 Thi7LMxElsAvY+ta/QjZOAAl+XzgU6z6RmGC6mfX4xeJBmH+LiqnrAOtH0RTc0WIKXOxJsRUeGD
 XcEt6/igy7/FGmZRO8yM3c2XxeT2YwicOhzJtYFUR93NVvCsXGGF2coW8KZFHSA5Od98hTSWIkB
 E+q8DYPNiUfgCc++oFM10Bn1IvH5NMyyYslARXlt1lf09HFj5QXqHqkm5k0Etdt/zb29VYCnwx1
 olHYi6FcnJnLCA4R6P/Ge5uL+yn74kBPHzkpY+bmlYR6ARCJ/dveRGGQGUCzJuOB0jCsH8brSpH
 egwci9SKo/GMkNZ+19IPG4W2iEYMVZC6HFmLfNt8bjHqyxqXpHZHZCdrVWTEbiesMzEti4O8FE1
 vG2ZKCj9OT6RdH4GQNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfX8MvgmOdlGJ0l
 XnpOBRuFZ3IRuNwT4W+JWFa5LeBUdhEUawgRfc9r7WRbuJTqyG0CabCYr+Kxbd8uPCbLRop13Zt
 kCzHS9lMjCwK1tQoj4gaH5VsY9sjMhw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170110

On 6/17/26 1:07 PM, Taniya Das wrote:
> Add the Enhanced Video Analytics (EVA) clock controller driver for
> the Glymur SoC. The EVACC manages the PLL, RCGs, branch clocks, GDSCs
> and resets for the EVA subsystem which handles vision processing
> workloads.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
