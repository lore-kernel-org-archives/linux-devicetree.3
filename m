Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008822;
	b=QuLzlPL0RzHT9io1x3r4tl/X2e7uRE0DIHQkTLeKODvCpg5/eMuv0+yGttZWURi9jneD
	 YGTRi+vMEiTiOBUyQS0XzRaqVwxfjEV6t1Ei1PjmvcjGTFS1wBcCaAKdrXa4si4bDIm43
	 ThqkoXHCo6KuMCUnCXzpkrbm2NK0j9arUYkqYFBDGEEwN2si3+UGQaZSzVIYQYNrha48B
	 JzLsmGQRc7FCkTaHvn8SxBbVcjo9ipNW+gz3Dfym7xbiyiH/uEd9vpyPw2JwFLGMxPqMW
	 bMfFny0G9/hNSallsRWE6Iovos6K4lmzTUV7mgKrgHCYugBXB75sVNMHzSe1WhMzEOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=;
	b=IlcBUNdW0PKmaInIWuoIpcZ2Wc5bNTSyX39rDfIW+XraQBX4fBQDR/qv3KpTYUsLZk/U
	 xXVA5mK9HP5rSs7ruXMV/TrG6eWSuxkmSFOLayTOLKGtIe2+EnFp3cxAnUnRxR3ZSajBz
	 uX5fZpg4P3T9b1Vh4q/BMi0f/RCyuK5dDOz07UkmECatW8OQonInRHbGxFv9lI23S/pJH
	 x99VwWt2efTibhP3S5g+nF4U7N/uESq9yiHFnLIdv7a1M28OK3J0/K1yEGT42ELcZk15M
	 vpmSnTZ1BQ/A/utuDuOxMITI25YZghZTQM0wdG2yJSbJD7QxlNSguoxSyZHJdxL0Hrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jP14w2rA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="itopHW/t";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6AB606CF8D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6AB606CF8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jP14w2rA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=itopHW/t
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q8xD2O1911410
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=; b=jP14w2rApGTMbMf6
	l+QzyozzoWyE1HyH1ji7tFA5QK90VUOBhExRB2YXAGIexXP9mlbaebp7txRuz1TZ
	ZywYN9s51uiwKDXUAAiZCukYdSI5Xk6JzHwJSKNuuHaoRGHitl64iqHCfmwcJLhg
	APLqVHkxmFHUhMN3PaiQxmN7ucGmwOYwDxqUIZt2LDyWxYWQtmRxuYVmxwWsVZxA
	gbJKpXXYUimEQVk/e2+8RDn1D2qS38xfDwAKAp0Dsl2LI3Wxz/RF1evukLr4P3tl
	2sfoN5c3bcc9szj1Do3b7BdklkFZG1env3abowSbnJ8BWeoMHeHygEWoL4DWnUGo
	hbRVzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60784-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:00:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso11990951cf.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008819; x=1793613619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=;
        b=itopHW/tIgtLD54QjqF+F1fhH71t03r1aenaEdt2s8NJKNp8wTwUbVgp2yws3ifuIr
         l9Z9h5DHBJOtf75ZxmRf2SQqjVlQGpC2hMtLbmY0MoVePWJs9AZOMX0+NRc7Ord6Fcjp
         ksTrNgj0jv/palJGOfpbr6i18dQkuzaEr903JoeF1O3oS209/GQrOlCXSgl2yX917GMy
         jflGWcEDF3oLKoWP2e+0N53qUh7/otdy+1yG53TGKccVkG3yNdmSI9VJqYKD9PnDllZi
         0vlHFSkXCMyMKPkFqMVW9uPPutJBgiVqtkf9Zji21GVBeA7OnXRj/FKy/zEqa/NWjQmX
         noxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008819; x=1793613619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=;
        b=AYxBHpIU1e93GlORDwmB3oo2BrYFBhWrtI5eQ8jqbFEWvcw048xmaf69KN2UL0d4Wu
         czzgLZZ53Y7ACnP6pkFlf3boPPtfwd5zZ5hieCEn4x4nAtrGyxTAk+C1PozZx/t4L68/
         f3TDeRm+pOou6i5bMSWwXXM+YwloX/YDr4bRk0xo5HU4YjG0NUbwSRU+OTlteD/LTrGk
         gaXmQbFIvGJ11RzOQ8XRD/tDZsbrHQBhpFQ8z/nKtS9DTe51INQEUMq1wlceWeuG2BVx
         dnGp8fW5xb0R7vSp1IAjPXaMBSfeGyWhx2p8gbR33lQYU24fVHwl/+NZOwiJu4zFeUAK
         GEvA==
X-Forwarded-Encrypted: i=1; AKwUvBwKnHeFY0c7FCtAu2wTi7xbGTIKNE1wuqW+WHekfUicOSSiuX1dmyQ2kEA7u/A54uThfUtM+4qmNcjI@vger.kernel.org
X-Gm-Message-State: AFq9FYLTcQQoqVDibtbFcJEJF+c8kzJZNHAvkr5gdtBnS3pFodou19ge
	i0LGL3d1kIYpxFedkymK87Uc3hOJqqfpAiH5VLVZus+QvVVtSuHCD0vKJu6bZNoPI0svtDYmi5K
	VzluxFSytkpUPGUL9Psci4HrmoYUUCO9gPvxQu+/k25EHwYmUSjS8NhenOSt2i0CR
X-Gm-Gg: AYBFou2K3yAWSKAwbVQt8clvEmkCewyet1UpKYJtYkiILHuhQZMbcpfw6E/5d87AxrC
	9mm6XvuC867ksvUUa2IrZkiJQthihfe7sDETEgiWE9npNzqDllAOMkFlgbJUOQTtv5IUp+T94yv
	3sAVn9th7V0FZ2M5b7rMXUSw0dsK38t8U8kTPIVq99tGLmSNgz/5PyqDNng3xBZ07KYqYSopl7g
	D4lE5GILFIYUfbIqA1Lya8bim/t/UmeyenxCx3RXCtHWpdUfqITXJ2wFcyuCTB3U0vz0IYohtNb
	WTr96QrisQ3cPaWP2iWBpQYHIaXdeoxah9r4ZghNu7LB9VAidjotR09KoO3VMMEsmNiDR5NCLUm
	GvpJpS34dm13epCugRd/SOg==
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr907963785a.3.1793008818894;
        Mon, 26 Oct 2026 03:00:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr907957185a.3.1793008818264;
        Mon, 26 Oct 2026 03:00:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm295380766b.81.2026.10.26.03.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:00:17 -0700 (PDT)
Message-ID: <0a36d49a-a1c8-4434-a9c9-36cb1ccfc097@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:00:14 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Add
 PWM backlight
To: ferreira@se-rg.io, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zu14qznY-e8-3jWPiUJgEB8GUjBP5jtz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX26zzs4YJOwtK
 mOEwaFQQ+Is8ukOrNOOvkZ1IpoQF3QgYav+O22kiwiY7wHJnVpdNPndgUFr6bqOdMu5NS6xDmWI
 9R5jxbjtosj4DIkXJHSv0WcL/rW310NQPNNzVrf0YUIflFC71LKMSQdZGRl2e1EThIlMa/L6mFh
 lkS/z0MQbu4XRxkb86nqBqtCoMiCpW4evqDeMR+gqQXAJgUAQb9O0yGDCKHItLlIJoRHAqI92M2
 qMm1EQ4tTk3T7Oh6afQ33H3k0+AgunG8Z/J+oQYYcCWBt5zTeb/IqWMed1xDT1ZRPqMr1asM2Fe
 Fq5r9/hj86id+PBICClVoulxPlsW4LKQI+bu0boSKeTHYHhbi5PFB6RfWc+rNm+cz4hthDDe4ua
 CcqkEj8su6azHxrNRnWpENJSfj/zby+UhLCiILRWeRppLlPTSOgolE8XC8lwZLAWQDzQtFblj9t
 c4NU30EE6qHjNYh6ysQ==
X-Proofpoint-ORIG-GUID: zu14qznY-e8-3jWPiUJgEB8GUjBP5jtz
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf24b4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=85Z2xdU_f4vHkJConSkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX1FakwBggBm+U
 eSUlxYicl0v+9csJ/yDr+nodBTktkmbdPc5adMdLOS+a/ScogPQzjMvw1jfzblP/G1QgM3SyGQA
 F+YIPGRm7Yc4LSagTvLHiP9XqiBtB+I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On 10/25/26 8:51 AM, Sérgio Ferreira via B4 Relay wrote:
> From: Sérgio Ferreira <ferreira@se-rg.io>
> 
> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
> set over eDP AUX. With no backlight phandle on the panel, panel-edp
> falls back to the DP AUX backlight, which registers dp_aux_backlight
> with a maximum brightness of 0, so brightness control has no effect.
> 
> Brightness is driven by PWM instead. UEFI leaves PM8550 LPG channel 3
> running and the PWM output configured on PM8550 GPIO 8, and drives
> PMC8380_3 GPIO 4 high as the backlight enable:
> 
>   pm8550 gpio8 : out low func1 vin-0 no pull push-pull medium
>   pmc8380_3 gpio4 : out  high normal  vin-1 pull-down push-pull medium
> 
> The panel configuration in the Windows ACPI tables confirmed this.
> (PMIC-controlled PWM, PMIC 1, bank 3, 9-bit, 2 kHz).
> 
> Describe this with a pwm-backlight node: enable pm8550_pwm, add pinctrl
> states for the enable GPIO and for gpio8 func1, and attach the
> backlight to the panel.
> 
> Tested on a Medion SPRCHRGD 14 S1 (X1E78100): brightness control over
> the full range, brightness keys, suspend/resume and restore after
> reboot.
> 
> Assisted-by: LLM
> Signed-off-by: Sérgio Ferreira <ferreira@se-rg.io>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
