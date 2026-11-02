Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609980;
	b=WC69zGfgBRZG1+9aWOxO6vDAEj721k2Z4AGfrNtNsQ2LVFIVd4M037YSDdKaZiKncDmH
	 VzMC8TcAjeTaaHaTGyXYypHr3NPiERli2Ig8LYzivYQlaJlrYHbUo2rGwswQhBU/k07fV
	 w6tmxFDlkPQNtf+6V4NLzBAoqW75kN2yLqHGEYA29kHIaOEx5Vg0oxIw8dAcLI6KtLK19
	 kDqrR7Hu7MQo/6gTwwy7NuEIcKE/uHigpwSZ1dxP1WA7SOvc0K3m2N+Izhf5Z8hwOQyje
	 5sgw9yLsNOHP+jlD42WDq3vKlRVuFOrpfYG9fxbIqMk9iQYKLBVEnnuHhuWcyFLP0vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FsIkMVZuvY8WXZz0BTapBeCRIHu02AP1S5EsOfuC+MQ=;
	b=Of8Jh2Mv2Z7y7+yn8Xv+qs2jm4LKyIYxA5P3GhcdyqPLhoPO8Xmo7H4TFPL8PmP5IuuH
	 0L0kIYvD4AZdTveU7pm3CXgD0IrysR2G95iwyrAk9Q6IZxkZX3G2rhyPDU24sgcvIytm4
	 plhv5jiTeeXZMj7uCuoEXNNpCVnddAMbTWwN6EN2S9ekbV1p4vcXGDheYVobFZXsSkwNI
	 4MFeFXs9C863T4FOrCcyzqxC4R4SWlycfvO4ximlf4MgkhNcayJvg73U1XHruevPdu9e4
	 xKnNCWbr6PETULQBwMCKwKynuoANgT/bzR1zbh7pVGkBJZqLfse5RsPZHq0p7sc133A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MPicOz3G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UK2LgM47;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C59606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C59606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MPicOz3G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UK2LgM47
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vK7s1676192
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 08:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FsIkMVZuvY8WXZz0BTapBeCRIHu02AP1S5EsOfuC+MQ=; b=MPicOz3GBcz6eNJj
	mA5q8TfXjJpCMDNTEXk0HtIIDoSdFRGOgeg+uwljdC7H/HGk5OFpo/C00hZTR2Ji
	J3o1lsjpaPqv0BMztT4NmJwqLaL8P+dgunwun/5ImLFrDBrqM7yEcXgeEZ2eMoSc
	9IrPXBkLrj7F6WtSUfgJsIJCmP7p6H4CUKrh3PHrZCr4Tvb9VhLlfGRFdBuClHWT
	R/PbxASCcM2sb/m4r+3yCstfLkI9FPoYj3upikMxpeB9G2/tCDqQ+1WP67d5q/w+
	fODw0MCpXrmoYGRXw9xmDKj4W5vSsw7aS1zMCrvJLcayHYtu7M7Ljd9ZNDJO1dy8
	dSzZig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7x1bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 08:59:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5360b8cf8f5so6517721cf.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 00:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609979; x=1794214779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FsIkMVZuvY8WXZz0BTapBeCRIHu02AP1S5EsOfuC+MQ=;
        b=UK2LgM47KuBrPVsJy6q3nTJOMB+d7Kti2Yn8M8pamM4OS7F5lo1ekloFIVuU1hqrcG
         S+OOigeVsBecE5ESD6WeY5NnbK7sI16URM0Uo6XNbVe8ROgVmKG/hFaqw9culVVvZhsN
         faxzxjfZNDjnx3+dcCz3s4HIBlhLxemzoDVAswTwfTh5PDlx7Y3rFp7bIcDHszL3fIbb
         UqDwgkOCaQMZMzyYtt7Qkgmut6GlL5gAZBqrTuNM/AoSadjBTZ48hux1HdxjnRHoXLMF
         oS4GZ6fteZUk6qIepJTLnC7UcygNW3J0nb2iesUpd/thnfTjv7ucShW0go37GKMUFMcu
         mVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609979; x=1794214779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsIkMVZuvY8WXZz0BTapBeCRIHu02AP1S5EsOfuC+MQ=;
        b=e34KKXsMjIJ9hoiQljrFPvB20TrelvO/HgpC866EKGjUS7wwdtGMJDQ8kupM3rWsu+
         iMB3Ey/oUtH56PZOtqZTGJzjo5+fvHghtZdnglFW44TNZ3wSb3ekSX/KB6D+4npptoMy
         hs3MFOkb+JblZ9lAR4ZT5Ls8tG626ThN/x0PbSRpzuXvJXUyc9OTA8JtjZbJN0+wfPDN
         zNcPCXKV3oDgl5RPw1Tq7WlMwmWBSEDNoOK9jjB6bT9Oemfi8zx1dZsJOS4nJcwlmBoF
         9IQ08U90ss3E/pseTHuV2Rsdd104Umo8uthNNt3bI6wScg0YKTTrb0oC5w9k+reuUbCO
         wuMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPlArpt590FDs5L7LXGIv09NMSzP5f7J6X+xIqR76FMaCr6b9IZW+P3BV4UUAgLfiGMoQ6qqVkAIqj@vger.kernel.org
X-Gm-Message-State: AFq9FYJl6Cu9njephByhhP7Zwh2mgnNHyjlIV9Mlp+mx8tAasYRHXJdC
	XGjJu9AX7khPrSGPN9w1EHUBinvylmr6vju+Vd5j9qAbU3QrdvHPxQcU6G8uiPqBdwlGfvfzM1o
	hDXEQAn6g77q+pbSZvAQOiWVVI3Fu6+/Lay9dX3v093HmDR4zvBEOe9+5prAmi+on
X-Gm-Gg: AYBFou1ymqPssB2/FQPwK2KZ4VqoIDcJHe3Qi6hCPmGiCCqUUosQPJliL5Yuhof9Uus
	YedB4iym2dGzUbBpzDAESPKu2Xn+hqypFbnxh+EQIHVbeQ06oDU8ml52u3glpKITasu9WwE6HCq
	Z3V6OemLKUst7wlGADHKye4QPn1qsp5Vb/hn7g8r+W6HFvE1MyHLQD7sOoDx3gHkK2HIgdJKvS0
	BT7FAoAgXUbDALPKpUHVktPJUKNv67zZyRLaGxju2mwefx+gMbl+Yhe4S/DG2vc6Q9FQ1VRbJRI
	UTwqsCsLSFvZ3wpmpgABs8HtAy0tAPdR7YRTk7qXjCf4+xvpeLHoBLOria3BmZM1fTG0tooy8zQ
	Uw51IveulNV8qrp/KckJL4odvhkaZxKpzs0OAO75jTCb81wqR3tbzU2Yj5mVkDEB8z2bhs/w=
X-Received: by 2002:a05:620a:98b:b0:93f:740f:5a62 with SMTP id af79cd13be357-9442176afe9mr1467287785a.6.1793609978595;
        Mon, 02 Nov 2026 00:59:38 -0800 (PST)
X-Received: by 2002:a05:620a:98b:b0:93f:740f:5a62 with SMTP id af79cd13be357-9442176afe9mr1467285685a.6.1793609978162;
        Mon, 02 Nov 2026 00:59:38 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cab9dc577sm361042766b.0.2026.11.02.00.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:59:37 -0800 (PST)
Message-ID: <dddc808a-6407-4db1-aa72-0ebe5652f97c@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:59:35 +0100
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
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sm8750-lenovo-elden: describe
 the WL2868C regulators
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        linux-regulator@vger.kernel.org, devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261102060458.461372-5-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102060458.461372-5-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kMuZExFsLnZ6dDt3Wl0M_Dw5cRmSXVpo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX/uhPFhpJg5Cp
 YAtYlp/etxeNUapnBYZRv6aPAtt5qD6FAGZ2EGS+nxrHO3f9+BF9Af+b6lnKuLcZdD260JiuFzH
 gv3wh/fnqtyK8Nc0dp2m3+AhhEZfwn8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfXxCODCsWy7w09
 S8izDNHSlWIJMeyXgz0Q6p8EFMh0uTlPiEQw+q2/6AiptIVaFwMYuPH1yrZOhGxtAXThwFDf+u+
 RF3GVfHBbL4Rq3WmrpRes9vVIP+Lwnk8SJlrIpQjhXy4/CbNEOJA6QH8TABbLbSRWgoOF/m9aOY
 IXNuGhCmEJlhCGfkY9UeULarfy55cwAim/0AZKw+7BD05MiHZEFh8kQEVNzih6yU3gCQE/nYH4f
 F5Kyu2hanDE73XXqxCMnNseSwVaQcC4g3atftw2n49YvC4myY9EzpW3jd0OhdCOeXAKbgVLe2yg
 1Y5h5ru88Zhukie1wup2cLxNQJ833H4HMqUvZN2n64K9xSs0Kyx5zNhns9Iyk0iHd91lMiTW/1e
 bdHC8F/xg0UDrsUxWKFgnVW+Cft6r6ugkAfkoUPA0jllhaBaoG713tTwj6Dle69glHK3efJC1VS
 W+Acp8hxDpC7XYygwTA==
X-Proofpoint-GUID: kMuZExFsLnZ6dDt3Wl0M_Dw5cRmSXVpo
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae850fb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=RKBUxXkDnibkq30DnYQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

On 11/2/26 7:04 AM, Qianhui Xu wrote:
> The Lenovo Legion Y700 Gen4 (TB322FC) is an SM8750 tablet. Its camera
> devices are powered by a WL2868C camera PMIC on i2c10: LDO1 feeds the
> rear sensor DVDD, LDO2 the front sensor DVDD, LDO3 the front sensor
> AVDD, LDO4 the rear sensor AVDD, LDO5 the VCM VDD, LDO7 the DOVDD of
> both sensors and the VCM VDDIO, all at fixed voltages including the
> offsets programmed by the stock firmware. LDO2 and LDO3 are wired to
> the front sensor, whose binding is still pending, so its node follows
> with that series. LDO6 is not wired out on this board.
> 
> The rear camera hangs off cci0 with the VCM. The front camera hangs
> off cci1 and arrives together with its binding. The rear sensor and VCM
> compatibles are the ones documented by the bindings sent separately to
> the media list; the CSI endpoint receiver follows with the SM8750 CAMSS
> series, which is why the endpoint has no remote-endpoint yet.
> 
> i2c10 is a GENI I2C controller inside the qupv3_2 wrapper, so both
> qupv3_2 and its gpi_dma2 parent are enabled alongside, otherwise
> i2c10 never populates and the regulators would never register.
> 
> The board clocks (XO, sleep clock and the two divided CXO derivatives)
> that the SM8750 dtsi consumes are described here, as done on the other
> SM8750 boards. The board compatible is added to arm/qcom.yaml here, as
> it documents this board and not the regulator binding.
> 
> The file is otherwise limited to the camera PMIC and its consumers: the
> rest of the board enablement (SPMI PMICs including the parents of the
> WL2868C inputs, console and storage) cannot be validated on hardware in
> this series and is left to a separate board series.

What's the reason for including it here then? You already gave us the
meaningful part of this as an example in dt-bindings

Konrad
