Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656906;
	b=sWSZ20z64gBLJBU1JY0r0u9gS0VbY/PNMYObUpNnLAU2OKd9Sl8iMo6dsct7Jc5NJgI7
	 Y9eXG6AzgZLg9gOG3VmExKGxR8+2QsKIAI78FSWuTylmHi6ofaW36bViZzgaZB3HN0kBm
	 Sx/7tK9du1F6sswN4JzWqUfeMJJkEMayVXQ2sgiGkonYUajOmGW+KbbV0zuq44/bEr1U6
	 KYAy6I+Lkt3J84/4CfxBGhlTz1d2tQVWoWF7ZapVsNmPoHV8iw/ZD+5rUI9w8NDLW8JXK
	 glRJn+J9/Cww0mu8i9lZPUW0gpYWH92yIBsJDALccOL9Y5wz4KuC1IfEZMg0aKVMy6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=;
	b=BVB9TspjwsiaQq4kQOtsyx4itrbFlAD/2jxqT5rdGwPNaxdPKdZ2xXApMysphgm44aGi
	 fJbDpM0XGqMFakZstuqacrbVj0f4MVyIZ+GyAY4/DdUI5wyb/F0p9ipw7jXSUm71YIIN6
	 7EYzUy5lyp1oyh3x05Pa3uXYAyXHhgotu9LcqOC8DMpep4SkiUBJVf8CAqpexMLsGuMEH
	 qreL2wBDrAzg2kZ/4R+jTsUQZlSaOVP8MeJmy+XongQr+8SWqlr9k48mZ/cDOY8yaYNJl
	 HWDkZAoEJjlol7R86pb63pio234NTNCUKa3KV5x4D2Bmed7XYMZB6w9ScQm3bsl/ZTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0htjNc1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlWHBvr2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A98606A31F
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A98606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0htjNc1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlWHBvr2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M704lP4110606
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=; b=h0htjNc1Gi/TTbwB
	2XaQK37cydh256mj0l2Rc0f+BGpNaxoxQoc3hEBAJiR7L3RhAtuyzKVwwDMbLSnV
	VUuVpIM6jVR+bqd0f0HzxHl74JKQJye2ntDhuLTDGdvPa5P3o1scr8nYIFij6S1S
	FuYvYcp+PvVTbmR4BuLvOquJqncLx2xoD7pv7k2CRu+tatmn2nP/UhSVv5D4fX14
	bzLmCHY2bJ5MA4by3LwBTlXj5fvFUqFaZwiVek1eGkKeaDKlE3ofgWNBgzuIXH2C
	gJ0GBSlNIJa4VNvuzs6L0EZH1OltbNx5X/PnBopbQ32Zd0hdIc9n6i5965OENs41
	fSzl5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahdt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:14:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so39525585a.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656899; x=1793261699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=;
        b=QlWHBvr2SOtc3LhdVgVZ83IOTkjuV64keRaSqkKYHPGD3rwCb9LE5lU1trMFm0SYcL
         Bapm5usmdK6QthVgWxT2txhW3aFU5dUYFRb7ZGniPZStcV93dLkPCg9u51355cf1hox3
         ej+DaxaKPXkF9xe6pU77GmmvC15gcenx7s+RzHDjKgqBN9omCOfThTs8cYjvVMtco8F3
         QEULofhSZBOwk75mpjj0tZQqhlL+tEd3FfZMh/UFatGpDOGgPexOBm0RoYok6AadsKr6
         t6gFerEujX1bo+iuiUd98bllFeKYMvmMi36CuggqRjT+7tytlufVG+hOxvYjNkjUZvl6
         gfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656899; x=1793261699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=;
        b=oC1NamKm2RcDmRYHkBbPZokHA7TeNbO9oStkZ8kkz668Ssh45TnQZEhaLj8dk5oKXL
         EMM4tyICnnZHrprfUpi+eikrvMPNehIySZh3LdDADdWue3FmjrB24mjS3ARmk3IoI7fX
         4a0tEaMQi3wRkP4A9xjtERlXUSdoLFYodo0zIyetU3XRLaPltW1XhjLrrZHE2AcwLVt7
         e91vU3ocYZwYj1PH7mmrvJHDrc+9EP91C2LZbr7OtD+JfKSqI7yICi7agVjzhuNgsSYF
         FHr2II1pIp6koKcYLC/UK9aFtiepCtM9acrOYcH2hIjP1dKsm5AR9Ppr7yhZgo8f+Fq3
         2etQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjphzusZq2orFe9Gc8+xKUnUC0rmbQL3kpsB/cvP/lDUgs8kL4SObxSjYrBs40+9GWZG45aTS3oJdS@vger.kernel.org
X-Gm-Message-State: AFq9FYIb3xSBaKwuoQAHGiDFHQq4w2RAVbrVemg8yuHHxRTXGTPQ7Zfv
	yPEdk12mWio1EDzIrXfuEeOCLNfbtpJDhEE5ykfI0/fBW66fdSKZXTcK1mnJ2DLSs2SHSQne4uz
	uyntr4oynFC24NAF+2bxC8QLzdkkV9li2h2DzMEZXk9k3jWoxQZTsonq+v933Ywk9
X-Gm-Gg: AYBFou3y13YKBWtjayLSxvsTXKJakxXPnWF3N9SUNGnGVNM8Dr8G6Io/uIdDHU9IYIt
	VqaWnTBUdLymV+raxCPDt0MCbKGGjvXTCLr/BHo3ArqFhSDOf2zS7ASPn/g0juHxrB5qvhznRWv
	0Cm95S7i5vp9xyDP3gPXWIXmH94YKtw22agprwafQY12cFGWB0zMASHtPfizHHd+CW3DMp2iQ4K
	mvSj34fuLEeimhtA2tNIx3hGPYrNmTm0BMgFGIEBpPX3KsXbiNqUcn7hpn0irRakxon/fojRfI/
	rQfepcZemMtGQN7YaITIc+k2MWIyXR96SCdzW/8bH6LyOs1O1asbVWEu0T0jsWjLSakqOkTIJf9
	g1H8wEYgblvU7IOzzHS0gXA==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr970996985a.1.1792656898931;
        Thu, 22 Oct 2026 01:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr970994985a.1.1792656898555;
        Thu, 22 Oct 2026 01:14:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c1c3sm80367966b.32.2026.10.22.01.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:14:57 -0700 (PDT)
Message-ID: <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:14:54 +0200
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
Subject: Re: [PATCH 0/7] arm64: dts: qcom: shikra: Add display overlays for
 EVK boards
To: vishnu.saini@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX59XjJE7zfuzz
 I4PO4FqX2WJ1b1+wgywRrlpm0mGc3gM3Fufnu4HDzCjXJw+jVUUduUDijDlQMoQd7g3cNcMw1g7
 cTBTEPIgIvCfqZe7E+TbUjT9Y3pr9WD4yiUTWcM20JLtNkmEGDgtEpJGsBqQb84myDy4xoltusY
 cl8YFrES43j9Cq6WmA5j48s+24vg8Mc1dIAD2AV0L8qyXbWC8Z0U2EyWeZGkLNERVfI1pSqfvcf
 deC6p+ZznnIBlDnQRGRRdzcBeYsnQ4I6HiOGR7BuQMEOdgKgcLytQ0SCDL/GDuIH0e/cHiBCXGa
 AIVMEvlInpiU8KW1V0JoIl0IIXmDymRsXcviYR2nSxAlj2NLauOcZkmRrD2/SqzaL6+RXxOBMfs
 e/KLZULlahpnj8+wXDO9pvgzK8vI1P1V9j/p3N/LKfGpM372y2bkFm1zjS/jX7+g77GHErMl7+K
 XmTSSNyY85TMTlLnQPQ==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9c603 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XF8Mg0B5h9f6Zh5FesEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: JCVs3dkpg4_xbF6NCUOq_q2f3MgqdSjz
X-Proofpoint-GUID: JCVs3dkpg4_xbF6NCUOq_q2f3MgqdSjz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX/RNonr0Hu0CR
 9lZqt70/USF68iuMaeqX3TWp97Cmo090F+ABg19bM8pD1UsL/Uvqaz7kWvShfFoP3rHK1UwAG7i
 fi8xrS63k8ZD6tT4mTXaOGa62H1zefg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> Shikra EVK SoC cards (CQS, CQM, and IQS) are mounted on the Lyra carrier
> card. The DSI0 interface from SoC card is routed to either the 22-pin DSI
> connector on carrier card named as JDISP1 DSI0 or to the B2B connector
> named as PDISP1 DSI0, though a MUX which can be selected by a hardware
> DIP switch. There are multiple daughter cards designed that can be
> connected to this PDISP1 DSI0 B2B connector.
> 
> The below B2B display interfaces are enabled by default in base DTB:
> - IQS: DSI-to-HDMI using the LT9611UXD daughter card
> - CQS/CMS: DLC0697 DSI panel using a DLC daughter card

But if they're daughter cards, they should probably be overlays too?

Konrad
