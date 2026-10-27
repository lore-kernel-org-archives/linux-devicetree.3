Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103306;
	b=fQyQkpPzr+9xgZjWgI0d66a4VdqXH1q/heclD78FPbnnClglHguWtaJNMuP/e7ZAuajA
	 rOsw2f6x/WQFPjzv11CJ4JtkOixGNNmU86cntTxt5cAq72aKXzuzFfqbp6pkHRUT05Hvj
	 fsAHxmAySMGWlJ4qcLDojx4D5YtgavBokYt81jsKxFS+YzKGhio9AJsbLwzzatvHAbMbk
	 DLiJp5wxLt3ZEImyII4wqTNRap4I8FCSOGPGrv64iVkAeLWSFIsymAG1WhNgSxvaODypP
	 APKrQUsI4PcdWTVyRcpYfsBjjsUkBR1Gj4KZMeHfpZMkJOQlWLHDOZveLOdxXRCIYRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
	b=rmZaFILF36Jqeb3kaEiJpHfEAN9i5OkjRfimrPDosYLcvEL/EDEyYU54E0u1MIDRpaQh
	 9CG2ewoKOCFQyV8oxg/vj99OMp/YIWdLBaJUlxn6kpHmcD1SSt+c6jb4AYTXRXSez6OPk
	 PCmBrtcTCyvDSFGPTpFUtVD4rib+Wqx9e4elYh8x0ud7UaHkD5+wv5Ij3mxNjq0lDFzqp
	 fkdMnfZiZwwPUSJvvC7mKJ23yEhyipKG2tiDGBRz6e3JloU1NQk2dD1LOum2clT1AlIwk
	 VSO+fqRoUL9AhgaVWZqzwwSRDJ815czC4kCsLtHlH7CH/Xtf11RF8TVXYpT3x7JEIaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwgWJcIC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=earvUgEV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8CA60A6F46
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8CA60A6F46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwgWJcIC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=earvUgEV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe7Mo432894
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=; b=iwgWJcICdcc6gV3A
	qe0suHdChWmHmOKJsdg1kL1rZzjhWhOVWIGk9E6CtdYtKM35tb5ZgwZhL8sLnpID
	RfEnkAUttShz5+WVJ11jDGTgVP2LyGM+FxxxhKTnLK5g3PONLtzL/sAOu4izbKHc
	NGwAiq3tEy4lG8Ch5K+vxfaCTQVLl5fNwFGZx9IysMNinK/hI+tGYo8w5Q/wLzYK
	FTKLGf0FAdxr9F96r7F0bk06GOZCpBbt7isN0TP8Pl+cGykH89kf1l7isyFZACk6
	uiLWCcX/Nk0SR2isRw1YEqls9hn+Yovvd6v91ga3xC28qtnEYLthtExGZj8TL+hn
	7s+MrQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kqax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:15:05 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988ba2453abso64900241.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103304; x=1793708104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
        b=earvUgEV45W4sQyW6cT4D9W69MCVM/ofR9SAHYeIs2efFlqa3RnqT5PWx9vib5PNJO
         xZESJ2A4LjAU6QBI6ySuBmFBygHQI0Is2hOWX6i5o7PmpFc9p4Hr6MIH3d02O6OA8qk9
         giW/yTZgMtmm7dSx6F7HnrCpxKtE0HuANkTA4KdxaWk0DP1+RmFgyp/XqHOI2zny4sME
         rA+aTEn1K5HfBnMZWdi32A593DaTEvsYnMB78ybv1bg9wSx1mvhOHPFGkhOuxfewYslr
         /X1hxTrm0/AEivOaUIt0hV/REJ2D3qbpnLgsK9329ssXMabckKV+HeDnMU6ZT7brrexP
         dgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103304; x=1793708104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
        b=2K/XwgdiBfW6SwIRhZhXPqxiYbz9AozfjO8QIWStjHZ67nl8vLgfTucyyUBZrvW2V4
         IIibWhLIhEIQn4b30hqufNyHTAGY+LGDv9laQ0IlOJff20I6s/QIUD492fyjdYwfyGk2
         V5ayAvS3kFMSZFMkKroLiVaeU6W+csOxi5zplRQ6BsOrcednRMXqvrqLlS4zIDtuLpXk
         YX1j3VCCIhIyQU1WwL4DYPc5NHFeQiO2vdCsSIC0pclTwxzUNVONRm3TeAYmd5f6dPpM
         OXPYtXC+8vFDVhxj3x/eR01tIkLa0I1hz9I9nbRXEUip6pBic5o79vO5S+QSMdHbKs8t
         V0/w==
X-Forwarded-Encrypted: i=1; AKwUvBzucV6b2nyk93DMH4DgzAzLDrPgXeBeVB0v0z8F7nWK9/ShpegKb0Txd4TTR5vubWnBSl3xj4tVtxiy@vger.kernel.org
X-Gm-Message-State: AFq9FYLhi6KW+D32BHV0RRcAncE6ZgVRKM67NtAxZhbyyu9EkkTX+dfM
	YtMhKT98X8+o4HFhry52Qj4juIPy1exWUYltH4VspCxnByi4kuk7GGhOFcrX+fZRh17OP0n2mC9
	/uDfsyaqYSxW7Zp6SyTCya3J/GVyTBk3q1rKKHBOO6VG6tO37PAmJr95nMJBeaIv9
X-Gm-Gg: AYBFou0aP8yioDwcoGvIIrhrrxZ6i+MmsXzko3TQBm1/36SQYDVBOWr4niC1toUuTjK
	LNRX+XvA4qkEbeW9BvHBhZjYBkRSWDj9qMUXNquETrf+jRpDX1u74mZ1gAx7CGylGlw5bB3hDu6
	nY3DqFLZfv3CqutBHKdIn1q3NOjnfH5aELjUg4WmqXonT5vDb2WyAVExmvPQV4u4QSq/0CWZVll
	78mB3w3vPvN03bRx5MhmcTjVXXksjpZiUu7BsBHT6AciQS27rctCpNlfoN7ltRSpY+m5obZcUrp
	ZCk4d6KhQ+fagOsnILvRv2S1LdPZTTDE/u6I0W9odrKjeotMtWaSFMTM8ZzuW1VDBdDR8h3nZH0
	yUi3NGELrs9Xyirx1ezygmg==
X-Received: by 2002:a05:6123:5cf:20b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec23954451mr3371778e0c.0.1793103303878;
        Tue, 27 Oct 2026 05:15:03 -0700 (PDT)
X-Received: by 2002:a05:6123:5cf:20b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec23954451mr3371755e0c.0.1793103303398;
        Tue, 27 Oct 2026 05:15:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89dbsm432825166b.18.2026.10.27.05.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:15:02 -0700 (PDT)
Message-ID: <c0c38ce1-7491-47b8-af5a-d3968d755085@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:14:59 +0100
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
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX0H3KUYR1GvNR
 Wt0jMykRNmFDCxcTy+AsvHB1OeUsnJ4lqYq25gIT1rqToxRcZmYcOe5Z1iBM5eeurIR5JQuDncq
 1+EORpF2LbBOo0uPvi/VMJqfuQ/naDw=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae095c9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=2zQhOlC99_H9tdcWL1cA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: YKBYP4vi7hD8YbyF5eAfe5dGCN0jUFlZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX15XRo88rCzWe
 yMD51wwkkhw03ybcKDnzEKGvYB8rMIxNnL/u/Ni785Sv35NsnietqQL2+/lOIKy+MHh0nTdTAyO
 DHLXGWb1MOpB+YjdT0jzq6CClQ6UTX11pDkapkqyipeOBPyMDZprSbaBiibYTIV4tQRn/63/wHr
 zQuB2bE3SbzGGuYrlXUHTLQr0Tbdt3mBhGgmdJRB/QR98uAlaKq0qmWHylgOlXAGmwDaN/ecO0N
 O8hckhca4ou8KELlj2uusbqWTwt5mkJ7qq9NLBhS7uXvawdCp3zXJkJGZOioOLTsN+tdvvnoW2T
 hYM2iM6GepBKyQy5JqztpYZ4fFZOwhC92b9ISy1+Z8NIWwlD+HkuNyuC6X/VCI9q38wDi6Tjify
 9qX7L1fs788YhW2nF1SwQde88OZvmCqgWYAAwbJfJmLa10dUhdFdPTRNOgp23HiZGriSG/57yi5
 5wMB1oTPHzYZEfNB6Cg==
X-Proofpoint-GUID: YKBYP4vi7hD8YbyF5eAfe5dGCN0jUFlZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270048

On 10/27/26 5:35 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.

[...]

> +#define CX_GMU_CBCR_SLEEP_MASK		0xf
> +#define CX_GMU_CBCR_SLEEP_SHIFT		4
> +#define CX_GMU_CBCR_WAKE_MASK		0xf
> +#define CX_GMU_CBCR_WAKE_SHIFT		8

#define CX_GMU_CBCR_SLEEP_MASK		GENMASK(7, 4)
#define CX_GMU_CBCR_WAKE_MASK		GENMASK(11, 8)

[...]

> +static void gpu_cc_sm7250_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	unsigned int value, mask;
> +
> +	/*
> +	 * Configure gpu_cc_cx_gmu_clk with recommended
> +	 * wakeup/sleep settings
> +	 */
> +	mask = CX_GMU_CBCR_WAKE_MASK << CX_GMU_CBCR_WAKE_SHIFT;
> +	mask |= CX_GMU_CBCR_SLEEP_MASK << CX_GMU_CBCR_SLEEP_SHIFT;
> +	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
> +	regmap_update_bits(regmap, 0x1098, mask, value);

and then here:

mask = CX_GMU_CBCR_WAKE_MASK | CX_GMU_CBCR_SLEEP_MASK;
value = FIELD_PREP(CX_GMU_CBCR_WAKE_MASK, 0xf) |
	FIELD_PREP(CX_GMU_CBCR_SLEEP_MASK, 0xf);
regmap_update_bits(regmap, 0x1098, mask, value);


you'll also want .use_rpm in the desc struct

Konrad
