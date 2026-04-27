Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCBF390998
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273367; cv=none; b=UPWAsXTdlhf6fuK2C3R37iyBWvH3plCkgcQTgtjLjdr2SNj7oql8tkJLQ3Nl0F75wCgaVEmmYLv3lmgSa7G/l6Iu83pneXl3XG6yHx2gR9b31wGqYdPT7y4Bff45YcAbiqeUCnWQ72sVuQs1xCLO6QMclH10+35DPn+qKaWXS7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273367; c=relaxed/simple;
	bh=ORZJohmK5TJwKjIgcSQwFdPYkt1hqJn+bhGVxAAdAq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIOoL7aTsUWdjViuTKmTIhF8+1io4PAeCrxyULQpeJU8Troq3o34AK/ogUgCSg88jVoikHNVqZqQPxH7t/vOLomJY7qQdEnC/XbrO7kNSDMAT4vFu/OMpp9nKNVeFBovuF58bTyHW78+o/pylyGG1lJrdC42Q61QBpJ6QiRWDDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQ3GIHZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YeEZb0R5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQ3GIHZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YeEZb0R5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R1GIfJ2070640
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oajbEDi6AH8TeUdZXd3YtGc5zJi3hNKy8edrrTbGiuM=; b=aQ3GIHZcs17YKb0u
	U0eBA69BeL6R4GoA+CulkE3V7ta5fG3HI1aNc5Jd5Z685bIG8i20AmgM54sXpfzj
	5E4FmxnF+T/cmt1FyJZSiOFZc5/cMOuUXCheUFV3rhLOsvZwijWfeQoXhduJIimJ
	Y9OpQzg4+vg4TJRz+TNQhFb71wKN7HXP8Vov+7ql8FcrWIMdcriPKKvpU1AGatmI
	7Immk7Oy38ZIe41ZjfyRrJjUurUhTO3kuvwTwwYf878G51otJf3I33LBak2KjutJ
	gKzwqgYE2Zd3/dXXOaCW9RlONq2H1gfHNd4Xe0a5IasPXteKohaGNPpnBlJXcjuk
	UuYs6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9cpwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:02:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so89992445ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273365; x=1777878165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oajbEDi6AH8TeUdZXd3YtGc5zJi3hNKy8edrrTbGiuM=;
        b=YeEZb0R5ZZ4VtXlVX+oK4dMN72Kmm7uVv7we+5q+G0+CEPvnQS20jwMTCK+b8XjTNN
         yqJ2C+G3MI6t0PvpHoySalZZb1qd5t9Sdc4Xa0P4pBTYmh7rgTHCk0LN2wEFcV9S5h+u
         nd8FoNC5qqrUAJYG7W3g6wZSkGK1pduXQtiG27gGAhiJRmgmy44iouQjz3tPTxyhnHy3
         ohQooAfoX4AxrpRyu7Rp9eh8PxOImXwp+KQZYYKI84zF/QHwggLITzM4XFdjSIK5dA39
         02zTkVr6g/B+F6fBY2FbX8PktuzocnzArUwOuPrHI8XJTet3pvy3xvAOblBh05npv8YV
         ECZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273365; x=1777878165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oajbEDi6AH8TeUdZXd3YtGc5zJi3hNKy8edrrTbGiuM=;
        b=AgWQpsF/iTLB8ZLmm1lU9IrlOXwEYorUv3H25KQoSZ8TgS3ZWs6jrdDipONDH9Mn/y
         RZd0saSmix6zIQ3HWpLvosaSUmZnw6OMvjIDmAreO/52Ah0FMq37WT4M8LBH1I3HN7B0
         QhbGGs1Apab9B6lGiOd71zFSo/bgUbO46esWiXAT5OD3fytzYIw5g7TvHAg1cxD4DOEu
         ui0STFPx1zBVZLOnxfw0BjYTyGtT9ivicLRz7C7dttxJxxIz7PQyeHjQ4EQcoeTosKjq
         hak3hPCTZfkpf6nF2RFC1IFxQrlwTpGCGxgGc5smR0Omdzou96NCjfK7x0ep65kgr4n3
         /gSg==
X-Forwarded-Encrypted: i=1; AFNElJ8RiXUwkiQPNdC6VjPRdlMkQL9h0mkbjL/+s97CiELVmaVnRJirRWCA/s4NzbZR+96lGLnSuLqeXLb7@vger.kernel.org
X-Gm-Message-State: AOJu0YwP5ND/VBlU2Bs/2sseZifrEVJ8WkBhDMHrY4tNLME6QGQT8a7U
	OihphEOWse2I11Ae/oN6zgvWdK1FU5WFNxxi9vyCwZNzLomjOLPfjo7v38q4UC78shBEHkfi7hg
	5yK7b96KICHHFQvIqKVl28bI3DWS0D9Dts6Waf0dW5UTqcmpPHNJ2PKY9X9y6lp+6
X-Gm-Gg: AeBDietbexZt8TcK3mXeiVANJq174Tuv7YyQOU+f1a4Vt4/OBRpSJUKyn2e8dcmjGDg
	rJkFCUXXTKgoDbPr5+uQPdIZbs9Xs240IJlB6hMa1BfKirN3tdJbznV0AE9SlnMWG4B5og6tUeM
	VvAug5wjf6nUkIPKXIA7L/XzSwlYQtJPbPi2+YF33mqj5Gm85RNH2OZhUv/lY7J/KVrqfAU2E1Q
	4EnFlsYfL9kJ+DLLZ8PFcQANKrMc2KV2Jy6GM37r4e3cWlAUdOiaqOqOb1m6+qLHPBsOCmQnhWx
	r9oq/4Ep1dgOILv2dT88iLaMIeYGJJ+y+ZXokb3q4v+fea0ie6XSo9KmYRhvGkSizzht4pnX1H0
	BgPxofPf6uu1JK6/Bm7kVvAStx6VHKmUa/vygoZnTU73RfsSjGhaA8wLybFWD
X-Received: by 2002:a05:6a20:3d85:b0:398:7912:cb05 with SMTP id adf61e73a8af0-3a08d8a3841mr48577480637.38.1777273364988;
        Mon, 27 Apr 2026 00:02:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d85:b0:398:7912:cb05 with SMTP id adf61e73a8af0-3a08d8a3841mr48577432637.38.1777273364492;
        Mon, 27 Apr 2026 00:02:44 -0700 (PDT)
Received: from [10.217.216.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f94204ac8sm30251203b3a.0.2026.04.27.00.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 00:02:44 -0700 (PDT)
Message-ID: <d71b1267-11f0-47fe-955e-b1183a00df0e@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:32:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: camcc-glymur: Add camera clock controller
 driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
 <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Lwl9HlyulPrbx5MFrEMuN64b0dnaKAEb
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef0a15 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_NJzdD1rvWRe6gqTKVsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfX7IChmaT5Igkt
 KzowHeXNFU55GO7MZh8vSaI/FgpXdEGvRG1uXHVufnS4YCLt7ChlLVHayd5T/vtZBgxCZ1u2TU8
 gpEHDQAvTOL9jIMVJQya8WsWgj176w1nx3oM2Cde0HIayI3z9qty9x6S+Q65soOYM4G/LeVjgqx
 ok1mDktLVGcwfMvCqFxxdVWtcqeYwRmlwr/atddzKIfcuvPUe8LgyO6VqtxF27BX4VHYnbDWhhr
 CDFhT7TZLkbGiCUY1BItMSJ1MwNzhhGJf3rcUcTVr/WCrkeFR+zyQffIz5colmivw5eza7ffEve
 LpIKoI+SWDZeOY4tiw1FhsOGI1uVxiYdY72QeaGLA1hrHsNeqfK+bDzEgCiZieJIakcotqE5dBp
 9c1nNceXWeEhZQSSZMCEZGhPMz7qnYl3UCzSWmUGNBtBNd61GtGeqrE3R+FW9e1JCABy26JdT0m
 lZ+4Q4EXJNHxQ5DrtRg==
X-Proofpoint-ORIG-GUID: Lwl9HlyulPrbx5MFrEMuN64b0dnaKAEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270073



On 4/2/2026 11:45 AM, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients
> to be able to request for camcc clocks on Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   10 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-glymur.c | 2280 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2291 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 22eb80be60ad3bde897f2c507ac9897951fbb8fe..b8306c89ae89867a8f72e02a3c64bfb47bd672f0 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -45,6 +45,16 @@ config CLK_ELIZA_TCSRCC
>  	  Support for the TCSR clock controller on Eliza devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

