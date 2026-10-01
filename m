Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671234BD363
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846491; cv=none; b=QqQgDvn3Ikrf49uar72pvd0rHXN8MrHr9DFI9UjFk25u38sNRhqBB6J2zqGEm5qG7oqgDyLfJXHUiTF0PKXXedyK/Rd709ryEgD101JDiy2i6M2hJGdju5+FT2WvO8oaZ5p5gyAdCu8is8j0bh9szqU1+WJR8dFysm0xVlMEIxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846491; c=relaxed/simple;
	bh=/gbOxSOrolLkmQgvxHnI2ULujiAh+pgAvB0yGV93klo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQ4WQIa+towpKxooGFOTFADv3F6At1xNHGqbg3v8AI5r2DtuRX6emiyczxWs1w0u2I2pBqupy/dQMIw7IIxOMfFN1lxJUIgLcD3IC+I9R7ucoEVBBSUa5xYLtWF3rjczZxPPLoLQm0HtbXYY8DdOScBlNrdcdBczvSRX3YtriAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ah8Kps6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvLjCq0p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ah8Kps6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvLjCq0p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xgCn962581
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 09:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hlj1RSurk6tC0HLKwc5LugbIH1Gsp5iZA1JLGbZPNMU=; b=Ah8Kps6hIMgy36Mz
	2GaDcpjEkzmYoQkO6c/D0J1q74DtVmnJ189WwybqoHyCcLZPXKnwHQWYN6UhIJ04
	AvnbfTX33JdNxSLe7xR2BdcfQDlRM+dStFB/hM7IOfAcrF9K8IJkRLc4YZpjNprs
	WkeqUZxZKpjfZeHBMkMPop4N/t4HrfxiEDEll2OtWNIevlPyowWSwkOlVPXr7Wu5
	2Ei1kadE8vcj9SP0QrmUa67UYTAnkNf57cwCgjb7IeJEczNCmPuIDO1nZfPVj/5V
	4cqhpJ9MErcw+8cGeSs79kdHwRvEyX66Rv0GjPNWFE/cN9sfytdB/IThgbcGz+1k
	am5B7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcuac8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:21:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c6abcc2ffso45044985a.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790846486; x=1791451286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlj1RSurk6tC0HLKwc5LugbIH1Gsp5iZA1JLGbZPNMU=;
        b=MvLjCq0p7knYMiy0vOG7WT9Kq4F/I0iWK/RzhsxKYQ8v7PrO/9f0DhMIiv2bZgECS7
         atcsQEEbK66UuuNS/necaai+AfhJTEPkYsK1DRS7GSec5Zz21vE1aC/KM/knnK2stNcs
         YZJYdgnbPA30naZaFNHyU8hwxx724er92xszDqGSQhSsPUn2nazF1H0gl5dLufGe/L7U
         gPdhgr2BNgoMrQH7v6y/bZC3T+L5VaQ3fIC+KEicSSsHsM9T+wE6O++odzSaisDnl3o4
         W6uoi/1zrOJ5MrIjGMh7bcq+x+MGYgZrGmTi5JnheZgMMVTkiKgenemp+AYosL+P6nm+
         ZeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846486; x=1791451286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlj1RSurk6tC0HLKwc5LugbIH1Gsp5iZA1JLGbZPNMU=;
        b=1Ka36eAwWOwz/XNosWcCVTHI5RZimvTQ9O09lIiZDhPd9gMtOrT6bdfPu5lGYS8Mtu
         SpzfcVnNIpYVAAkbjNTFpGEDexWoGfdg2yrfcFsMxebOyvbZlNe0yuwl7BrLl4Iywk/j
         SIxaF2rDF8OXiPzgVZwZj7w5U9Nryt9bpZLUtveKXnHRvvy40XZ1SQZRSG82DVDGA9oe
         izjzE1r+ciiDa1qXnGzu1tDd6Isghawx/Q39pedSS3AEgK9lM/XrFQugtiAL1UJFzStM
         1YM/TZwdkEPO31pEc2FwcQ64aJgjQPhZZx6zxMw5kikO4ff5tX/HXCC8PJA6R8aS2c9P
         9Gwg==
X-Forwarded-Encrypted: i=1; AKwUvBytkAsXHy5cZov/CCXn/CQ/3fULN6YkiBn0INCNaeCdCgS27+zcvP51CuDO/X82nORu8PkNaPNwYY5a@vger.kernel.org
X-Gm-Message-State: AFuF++ksLkMUx1FDflpBldAKFeTkoeyoHoFnFYzp16fVihfaoG+H4UTG
	gDlIs6Q5mgux5/t2/ApiE9QIYO/hbBKw1ZQx1aNG49mV+a//ZWRavTmCwAYvbwBmMHKrVl17pIb
	ANqw1yC6qwHONaOZuDthEhG55x1MONShacUhabstS+WTgnhbyjHUW9hPvdaRhyJ0p
X-Gm-Gg: AYBFou2TCBObzfuxD/Cra9uGRN3UyTVFf3fL3btFqdAD2QegIaMQeg7+OLcxXvwqczw
	i6oJ5F8d1Tegvlai/DEBiybl5Rvconwj06E91pYy+O3HCCMzZTzqk+iyfSMy7qiB1mOm98YOS97
	rT1oCincl4/dsWshVaS+sKAEx8hsjIu2lQ9dFypoaoxTOFSvi+LchdjwQrpYxnwcIVDwQoB9JZ5
	mXVHgk2INVDaUhz30z4DQqflsfs/WYkeHsDIAkwm2QR1MryxLbSBYlLH14ZU48npDjSWt126BH1
	R9Ymhs5oEH/Xd945FQSN5/4h611K2FmHduufpl2/TONx18rnL+bfFSb6pGZ1YTFCTkvNbfjdaSm
	IVyLKttEN1ouoMJEOBZPgng==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr693566785a.0.1790846486439;
        Thu, 01 Oct 2026 02:21:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr693562285a.0.1790846485939;
        Thu, 01 Oct 2026 02:21:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dd9fbfsm117573566b.71.2026.10.01.02.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 02:21:25 -0700 (PDT)
Message-ID: <9fbbbb0c-372c-4e60-88c8-13c11a4c3599@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 11:21:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] MSM8917/MSM8937/MSM8953 fix prng
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Dang Huynh <danct12@riseup.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>,
        Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261001-prng-fix-v1-0-72f924527465@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-prng-fix-v1-0-72f924527465@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfXyMvzyZ+Inrww
 16WRrNzh+nxJafSy8UT4LQ16o2ZhWEz/xZMkTnI02hk9wETbLeemxvW2XP2uWjLZwm6b6YlSaeX
 WlzKjoiGXpNrA/17bf//1768YfaCamscbHm4fvwkqmqPGFaQvy6q87LWroo/4lGpdEa0ucZ+37J
 scPwpWhAZTKIN3d2CydtVHmd0v6G2isGj8Zshlyc34qvatsgfJnSht+Bl/ozgzYcmntyFhCNsjL
 y7gU9skAEIShoelv37E3YFU+g5RRili9DZnOVJwhmaqIJABDE5rtFNHoXSoj9Ekk4SnHX80602o
 P4W/GGJghMwU1hzg/Ni/OS2OBT3HMNSRpc3S3a4uYH/JY0CXTQmqjAQs9VMQLBevRHbzCBU5/t9
 UWnxG+/3TvOVOWWHYhYpa0dUpswSvoUNVxQksdVc5N4GWeuXjySttna6N9HHUtiMopUxFBn/lrU
 1I41C0ZJliLRA72353w==
X-Proofpoint-GUID: -daWkDM9VE93nYN3TBsSqRFDgDSlMb3y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfX52KzpTQqlN2Q
 4iMLhofqYegoW4iWXKQ+gJvDfvZPjeksahMRP0ApVqeWJXnD6UdZzU11ym4816IE5UuKjYdlDvg
 uB6bpnod860iF6gxgYCwm+Oc5w99A4M=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe2617 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OBZ-G_CF7z2MtCSAfMkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: -daWkDM9VE93nYN3TBsSqRFDgDSlMb3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010037

On 10/1/26 7:51 AM, Barnabás Czémán wrote:
> On MSM8917/MSM8937/MSM8953 HW QRNG is configured by TZ.
> qcom-rng driver will not have access to the configuration registers.
> Change the compatible to qcom,prng-ee for skip the initialization sequence.
> 
> Compatbile changes are fixing this issue:
> Call trace:
>  qcom_rng_init+0x6c/0xe8 [qcom_rng] (P)
>  crypto_create_tfm_node+0x154/0x198
>  crypto_alloc_tfm_node+0xa4/0x1b4
>  crypto_alloc_rng+0x34/0x48
>  rng_bind+0x60/0xa8 [algif_rng]
>  alg_bind+0x15c/0x1f4 [af_alg]
>  __arm64_sys_bind+0xb8/0x120
>  invoke_syscall+0x6c/0x11c
>  el0_svc_common+0x98/0xe8
>  do_el0_svc+0x2c/0x3c
>  el0_svc+0x40/0x9c
>  el0t_64_sync_handler+0x88/0x134
>  el0t_64_sync+0x1a0/0x1a4
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
