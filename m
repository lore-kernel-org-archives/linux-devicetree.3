Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0313E92B6
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779232; cv=none; b=WGhDvcgPPcPFoBf4KY2CkTls4XcvtehIpOCVHjmj67hWZXz9aH4oGk/TBB39WuAwFvwMgev80Yp/zbI5QMmwz3WTRzmldZSbj+h1ldqeJYQf+zjqRV5a8xZytntsuhem7CqSHlv9jW2SXh/EdccUB2t1qZUCco1XmxTYTyrkgTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779232; c=relaxed/simple;
	bh=gsYNCX/9+Vip4KrqQQXpkJb2UzV+VlxwZ/q3RO9kkTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BeDmIDdX+MnOIZgYWIX1kboTG9k7TA9QK5Bd89p9XPvBn4Za+3Dq1t1yWT1DpkXhXR8/WnkL8O1NEtvx9My+dzrei7DiVLgvBHsU9ghqwQsBHqd56muY4baKJ+PoUAa7Z9wBW9wIzUrKogw/lyu+vc6QzkI6nZ0AFcihX47wZEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjRFYxDn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TUCNoX5t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjRFYxDn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TUCNoX5t"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Dpsp668063
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yP9M3eLD5p2SPiE+RFjEgZ8XR/E+CVlBqdnyyCJmBmw=; b=SjRFYxDnN26e2UPx
	a3tWgXl2s4Pss7bKXVy86/qbBdHgCsZzuqIHRZ4cqbLroBH/a0DINK8lsMd8H5rg
	3WZ96dV0w5WDyGk8EIQAug34bE16fOs+J6QA2UJKC24tNNL1JEgh5Ety1vag6CL8
	uSz1vl80ih7ost8L1ognZI8C4pRu5J9S1KT13p7O9EbxUUzwRSw/4sfGTTIJ5fC2
	5lr4F5KD+j7hkBlAD2lTsLojXvfij7ZZtEriAl9EX5rubzjIh9pzwjq8ymQbSY5m
	u6xgV8ZOOqnGlJ1OTgDmNdkD3Z/Mzb4wINg9p28Y4DURHD2rrgsOXna+M/5PvmBB
	KwZJNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vm31ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-917fd2bafdbso17823685a.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779227; x=1782384027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yP9M3eLD5p2SPiE+RFjEgZ8XR/E+CVlBqdnyyCJmBmw=;
        b=TUCNoX5tV92/je8FArfjSUAzG0nmopPtHBnOoGNUVq1HHrArcgbs54G3PLgxFtTNmE
         32Gal6Qw+E15IKSeFPrb3cBEPwytyRK9Txvd18hiM7fT2dcG3naaNPEKvA1mlq37Q+8n
         hY1iwuCT1/DJsWAII6cSMQ3b6hB0u5LefsNaMqrazkgRXLYs38Eclxfso+hcpz5/CFOE
         Q/Yeo1GftjajsUTz911f/DplVZ4q76d+dWhXG/qEaKg1WbjD5K2Mwcaf82Rj93B0xIbF
         5oxR1FsSKH7X9q/5uLkj6IERX+ONcWahX/1ME2lc2hU7RIyN/rjJPbqUEOLuO1wec4Sx
         miqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779227; x=1782384027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yP9M3eLD5p2SPiE+RFjEgZ8XR/E+CVlBqdnyyCJmBmw=;
        b=chbyr2B93heD/ErUWZ7dWRaDnX8H/f3bIPNairg6oUhpF+YibzDkqKMfE6a9vaMu3e
         zLFPzoW6mqaSui8becdY4WrPoWl12sWq0uwJMcKtYS9aJxJyWyOx2kwKnXOXyAi7KpEY
         pM6e3ibIIyZbJborDAxZ/FOXkAmTYmLcGfP4D9rTOwagpDGLwjIvrTJ6a4HyGsEB2UAQ
         xInJdvq6B32ammONT2lUbNi3Ln/9N/pUiMNBIb3ytQ7h0ppCYhQ5Usgu180PGn5nj+yE
         T6FSWuQ7kOhLUIKZr6RkwigYtyKC07yJ+dHQPPL12Rmwjsv2PD+f4i96u/bKiLaT1937
         1wOw==
X-Forwarded-Encrypted: i=1; AFNElJ/m1nEqkoJQ8/mq/+CVeYfphNEgAXjD9y5PJYFcQtKKC8EQiXqO7rKMKoxVOF13vTBUHfUZ9tK6YykP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+WYBn7jYTeZULnn3YtACJ3B8DuLPzwj59YpmwMQwwt1yapYi
	PTV2b9lSqeX8pd2GFuEcx88lR2R/lpeC92jPxtfOdmpvi3QH3GzTTeJE89NsTaMSQdIuhkIDO1Z
	eJVcLvgckusgdH2x6ndjShIsWHpJkTC89CMYdKGqvdrfUNj68/EUIE2zFkcG93uQI
X-Gm-Gg: Acq92OH4gdxtLAEmv6vu4SM/f6OsUP08qAcCli2qZW2MA6gRCL4/2Chgst8zFwysSh+
	vsFR84Zr8RM63kbOKjfsLnMekHIO7WWA6/kXkWLTQuRWdwqTZzoJzZFKyb6b5kTE7NPPaB2h4uf
	W8DRX/RUgzPvRgOuwqBYLfEdqsTMA1hLIZPnbGte+m7AFUew1fSUOL0oEcLqbq5gf8lKagCwSUB
	Mg657Qg3t2ts/UpO1zQLW0SoiwSjxwGH6m2be7St/UnvkA/p6qIybKf2ZxZ/S1XNRRKwqVhygPN
	+zvG18HQzjt6lSRcBY5mZtGGHde4jTfJ66hEGrVfyjF4dycsaVVaxWaTQVvMdJFaNV8+k1gFh8/
	x73Vr/I81resF/QyKuBNENeor3Oip/vez6WU=
X-Received: by 2002:a05:620a:4150:b0:911:295d:59a1 with SMTP id af79cd13be357-91f2b093a48mr262225285a.8.1781779227205;
        Thu, 18 Jun 2026 03:40:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:911:295d:59a1 with SMTP id af79cd13be357-91f2b093a48mr262222985a.8.1781779226746;
        Thu, 18 Jun 2026 03:40:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b23f8fsm904300666b.53.2026.06.18.03.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:40:25 -0700 (PDT)
Message-ID: <ed1563c1-ecf8-440c-a39f-f8335db77b97@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 12:40:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX7KzQ2JkvJjEO
 wpiBdbZnhiWIAX+pmUj8NSMx5xJgi/kaTe6pzRkseppnBLlsLNFcgnV1Jnva+9bLqbtDBeIhQjb
 brLJbQgkRjgUPkgAOtY4CDbtKGkls6teuRdE/IAXT7dbExgwoy8FonOWAh34/hpzF3wXxHfty4r
 IGVFTK0PLz5H8WI1sH14N87sdxbZVfd/ZXVtoiL8J3wa35S0qNatalI8zTtGKHLFv6gpucJddj1
 GZl1uwj8twTrq0tAey1uAfZJ2IzLjF5lba0dxi6m0uMTI1INvLlYbUhe7Lf79rtES9PtB2TmZi9
 2JHn781cZYpgcoOYZgPAXldTpKD9hOgyjtq5tuwPYt5MdyDC+YfmRpM1nP1CcUTWSZ/SSYZvkfP
 tlXSm3oJkwHPMcvNI+zxeGdztKkUzcTMBlV9aRVF/ihmUyaxSeHHlUOdSGuQsSutYjKvYYeNNOn
 ArfztsiS5ERG0GZDHlA==
X-Proofpoint-ORIG-GUID: VS29ByoNSCwSe-LKVlviA-rH860Sz68r
X-Authority-Analysis: v=2.4 cv=UrRT8ewB c=1 sm=1 tr=0 ts=6a33cb1c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=-5NnJTC0Us8thdTu4NUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VS29ByoNSCwSe-LKVlviA-rH860Sz68r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX461n8dZFXKuZ
 bw1NKalBzGlvyuHbeKPqzfej0mHH85pOIrHRog32Bgb3Tn9mkHD7VmaVoEXe37tgDUrRSyrQxba
 VRVhT2Vhty+vgaFd7xF3N0DTFc15mFE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180099

On 6/17/26 2:53 PM, Neil Armstrong wrote:
> Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
> found on the PMK8550 which allow reading ADC data on the PMK8550
> and other PMICs on the system.
> 
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> Depends on:
> - https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v4:
> - Rebase on https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com/
> - Change all defines
> - Reorder nodes
> - Link to v3: https://patch.msgid.link/20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org

wrt

https://lore.kernel.org/all/qgjntewdw2qesvkeabvx46zxcwrikvpkgthk7e2cqw7biuhmqt@2khmbjh2dt26/

you added a comment:

/* use the default settle time */

which the bindings tell me is 15. +Dmitry did you grab that value
from the downstream kernel or something?

Konrad
