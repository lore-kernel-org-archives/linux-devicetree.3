Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AABE3DB309
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179222; cv=none; b=cBqd8bBgoAva0KrI2ryqqYejjj+9/VHkfK5XwqNSKViyzQTC1JGqWScOajhB1SO9r6ACA7uuZB2rgc+rC++dhfKjak6+XRBDU+SwomAwAO1m3FfS3wCdMSdfRtVHmBthPGGZXBi+pedZGSKOk7Q4m51pTktE7w/syh9eX9XsrS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179222; c=relaxed/simple;
	bh=mfwra88telGHmlK8pwk/qUqf4z2Dpnxn0DRxiXNQG+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHG24DR6rkq3l8iwk0MIpXMAX93ls2/8+3ez1vi/1iRGGePwYUxnSMik3VFmPnX5S2XG4eBFMw/cCe4JIhbyCUvimz8wGzdhQyUd3S2BZWBsJtbAQBGV17MwasoJudKTkontVgVjnqSiolV2TxKwbZobnprIUu0XTkduPEJyJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjPsErVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IftUlu+J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjPsErVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IftUlu+J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA1VSc168328
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JzeBJn8FIGue9gwzl3iuXpkwL3cazzGEmpclsocTaAE=; b=UjPsErViRphn8y8O
	JS2I0WSC4C5ooDIbTf6q/ZBSj70ciUN9zgW6fhpNcu9dMt+s2hMPoTurw1WnwaE7
	FT/VYDye+nt0Q3IC2mBVcvsFgY16Dg8oRGfFGnDTTpgl8Gdeb6v4BSWHeXOWVhTH
	Qm0pDB22qazQbSvOnFsDY0l2YehhJRlQ6G17Kin5RUIon4VgZOiqpjLRa14OvqcW
	sG+OJpg40JR6i36tFZ2zwMMzJpKWGybbXBA5bKKYi0xDLLzwyH8hEaqJwRg0Nohh
	6/tqDErtbWqHAYEkMUevV2urNcCTp7dXyZX8aBFQzW+7xN/RRqzjjAAit/dU/oI+
	gg9G0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ub8pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:00:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51757324dcdso16875491cf.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179219; x=1781784019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzeBJn8FIGue9gwzl3iuXpkwL3cazzGEmpclsocTaAE=;
        b=IftUlu+JtUYW+OKgjlxs6w4CNnf/qXpHb+SzGjzxxujPcr9W20tBp2V7/4OfZQdf1r
         o5wPSEdnIyvwTr1ZVBcn+DjdYjdEp7mz5tjoVUTE5cidKzPOmDnQZ2O3iOPAhEnmDhVy
         eS/93plwL/tqbmTzSE2Dg/koBKlz04c0NNkYAj+IZkprnXYsDMwQp3Tr0gyVqOr7+1aB
         iJJn/QHMLinzlcrT+7V/og/9ZcoxMfSDswPF73cAYtkwp3ltClraE11M5FJUIq+y/TRp
         8TqoIDaiVtnm6CPBdOg0lSKShBZzrOZDELtl7bMAqH28FwelGgh7gNSE5ODGnA3jOIO6
         eqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179219; x=1781784019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzeBJn8FIGue9gwzl3iuXpkwL3cazzGEmpclsocTaAE=;
        b=W0hylIvbDczc8TK48E3W9QYRk/yZLi85RrC+T/nt3y7nqEXXWdcEV5tuG7V6IkBFxz
         QeTH7hWx8DkOpBPA8jt2CQ6bZMgvwWoq6reO202xb9WCqITwZ5KyBo2QEpkBrPzFqMBo
         3Exv7ELRrKYs2RCzzJiOu9Tbxc+8kgXUmaH9/kbB0TROJkFT/VZyaVwejNBWsZ8VXXD1
         9bcq155LQbxnMQr3JDtVSFEckWckMzEIuo/oLYI3lnb/dlFeXZvwHTqzM1dxbswhaHpx
         kiqJ3NNkeFscTj8h7pljbsZnYnUsFnT4X2iztlFzHO1Czkj80Cc9xQ9IXFgkbygJURL1
         u9/A==
X-Forwarded-Encrypted: i=1; AFNElJ81jKDqCxpCDYZtERDVdGsGCxbtRs2Dke4+6S2xSUIRTufl+VMH/VeuZ5V8xJ/+VXzVoDyGcVZIpdcC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3In/MK8Og9h5KObtke4PfFo7cg06c1P/Wv7EbY0t/co0rvWrr
	QH1Luuj24fbhhoMB9KqCXmcrTlB13Djzbaq7HxrhIxIVJoX+If4CTek0MwlyOG7Gk196J/F95Xd
	tHdBFQsKiU91x9TmTv0JO2bobEw16yXhS6XQG2DlqoxOYhA9UE0lmgXAQCiZ37XzJ
X-Gm-Gg: Acq92OETwARYIErle53FSzKu7Ux2IqW1DjeXcdk2Z2X+MSyL0aCr7oUVAEe9+RGu12u
	c9L90+8gfr86j/fqwvxeCmioxjGEtsgPwB7AHbtCBz03Jt0W4aelJr+CMDTcqyofEv+KmHQY+ZW
	qk8o48gPmuPGoXI8xb6G/QNz1oteaGXrjrrXtfDx+CAAWnmc0IVLIwlx8od3SqqoL9I4ZbxxrHn
	MFd0q38QOGo59SfVdHJFGxrHhFXKfkzr7Qb84v2VRYBnvKhGjiJIxd58HVfjNynNvzADIcFMsRf
	L8L/7km45WmonzY8x3itNt7ZDMmhvDeU/8buCMvdlzAdvl6K6wLD4jPZoXdUKGATkk/oRipth43
	qJw5aC3j1P2N1qBbCcmwzMtmVZNyj+OkT0nkOKmZbDVIisevZGChzAjKM
X-Received: by 2002:a05:622a:4287:b0:50e:6311:7380 with SMTP id d75a77b69052e-517ee3c76f6mr22740201cf.6.1781179219279;
        Thu, 11 Jun 2026 05:00:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4287:b0:50e:6311:7380 with SMTP id d75a77b69052e-517ee3c76f6mr22739371cf.6.1781179218495;
        Thu, 11 Jun 2026 05:00:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14cbdsm55083266b.2.2026.06.11.05.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:00:17 -0700 (PDT)
Message-ID: <67d7280f-54e5-4e16-931c-92049bee3e00@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:00:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add EVA clock controller driver for Glymur
 SoC
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
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-3-b61c7755c403@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-3-b61c7755c403@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX0F6PuH8CGV6q
 dFSOTqq/ncpp41vporMGnzvTB0weAbPkzbTwIitJJtXpN2xNVkVKgWekvjOizjj/k0RZvYSdqW8
 aNXmXPchz6q9ZcDKcig1l8vum3FZ0Ks=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2aa354 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KhKKGY6azsjSgFTL2HwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX0F7S6cAMQzUZ
 aGErdLD5JBCG/zOgoEEYVjAzJVYxtgpk8w2St+ZgnwxspDHDVQ6TxmvHSmF8K73M/JXs83GYOXd
 gmN49p07ZWmDgov6CDAFLCYNps32Kd3i8CoGd/ttGAFgjE190yG5yho+mEZJJ0u95HboGTTMVuz
 MZuhooS2SIEYCFFN361W0BVGPILKBU9UeV07tlDW+s1qjTe8AO3P83FxBnubL2PRb6f1Lghv4Zi
 NqxTqnkltKBO3EQdc+tmk2/lp/6N3P6HW2r7SgYmpIzNXkb9FTZo6VMDlzARwtikC+ZL/+kxoIH
 LG9rhJhQ2vXtrvNvdKMLDpCM5ZWLgfzvxqtzggtGnLHZ7zQdnBj8tYL0hEudMIDLkvYObaSvbKf
 6MUBgM2rf3aSVw9yVUO2cOFxJb+sIA7/FqAfDyuOccWaGe3bMwkfpJlQ3f/+taHbqBczopxszwg
 aee11Vb8HIyZsfKwUEg==
X-Proofpoint-GUID: bnrptK_3zL5d8kIbWumCLZggDTqDf48D
X-Proofpoint-ORIG-GUID: bnrptK_3zL5d8kIbWumCLZggDTqDf48D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110120

On 5/26/26 7:29 AM, Taniya Das wrote:
> Add the Enhanced Video Analytics (EVA) clock controller driver for
> the Glymur SoC. The EVACC manages the PLL, RCGs, branch clocks, GDSCs
> and resets for the EVA subsystem which handles vision processing
> workloads.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +enum {
> +	DT_AHB_CLK,
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,

DT_BI_TCXO_AO is unused, will it ever be?

[...]

> +static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/* Update CTRL_IN register */

Is there any better comment we could share here?

> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));

regmap_set_bits()

otherwise lgtm

Konrad
