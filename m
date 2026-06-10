Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6C3D8128
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098823; cv=none; b=p7fkPCLJfwt3MOww1bPyEq5OK37mYBrdcyJaSTPeW7DX4RH2qbuHwCA428Em4LDaDOMRFzx5o2kgi3sq/EQ46MXTONPcyd7mIqrEAkdmKnJiOmJdtGsKuigT9p2QvFCRUaifd99ZlAA+1SaeKyX9MvJfDV8wbCZgMPmUAojy8cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098823; c=relaxed/simple;
	bh=mVXvA3wixa6hyZFvV4amyK9ItwAKUiD/qlGCQPnK1To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWy62L3rb2f1nH76mWz725xEY4jbGN51rA58fT/1JylH++up6ligec25IghUe/+pT0+0ZGym04tOrWsKkEmhvzRRBZeqpf7kuAu1z1YlqPG9TY641qmocEqRp0O9Lzxr51UDCdzc2P0BSZhr7ZiCnZh9Jtsq7QQNRbZfGeWnyyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAYsM9+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXRLiozE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAYsM9+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXRLiozE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBlVN1072711
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZHZRNhM99+ka//kSSbW2vbtqwvtfObRGMFtOdCmG4k=; b=SAYsM9+C7UMEjemZ
	WNe/d19a0wFv802RiOdQc4e/jh9FrAor1JlhtZ+eYi6qPTIXkupbvXqYWi04JImP
	aPejNR6Hsb5PFE0WVYetuKJh3eqgeCzPzOITgzbZuqDa3/lmOsT8+AGOA7RSU95Q
	Yo7sx6KQoUDY9a5yFrgIZ4w2Rb3tELanRyPVI8tWXNA0e8Km2nQErLmfzNqlu8F0
	W7mldqwPbcPsfTpVK580JKBddmpmmhF2UAZ7z1YoHh8ngfNzpayoD2dPIQjxK4VM
	buSwG376ECMWbGSjHM4fXFllt01ws3pDsdaiZfLlcK8m/QT9gidSqzDQxEHsuCHS
	CZsHAA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvjd9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:40:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c7bdde6912so381615137.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098820; x=1781703620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZHZRNhM99+ka//kSSbW2vbtqwvtfObRGMFtOdCmG4k=;
        b=MXRLiozEn19Jut2rd6yehpseoF5+qjYhVwLAICKR8ATxu0rXEpsA9/i00ZWJ/SnU9B
         sb2gfF7PJOozkwESp1uVPy+iTVlZF+Rt797m0iXUSxZ1i3acGt/tExlcnUN61YjrOUNw
         L0XyPYGyMSsgTWC97degG+nFhrfp9UTW9Bn/kXYO8hLz449BCHG2tGjGvP8NkKoz42Qz
         +HNw/SAaOmW8Veg8xxKRKpwc3NizHd4ulJ7lJgy07x8mymWjdNsjSyvOkrd3Y9wWc1i5
         j8azHVEogDeyytfbzNcpUJp7nqdryUNlZZj5sdNnKZ5G42QfqNAv66u9HeQs6d/oOgvq
         /5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098820; x=1781703620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZHZRNhM99+ka//kSSbW2vbtqwvtfObRGMFtOdCmG4k=;
        b=A+/1Jvada4xTwd2oF3nVPQOqQ+E+nRTkylivVkNs6zz4MU89EEx52Xx7mp6WlyayqZ
         Umwa9Brre0DUbcXqdFjP+yNPR3MGb+0q1l5Mlw7uMXHMcv7NflZ9SdsO2mG2nszqMG0d
         xGWeNJAQRRtpdII/1W5m3l+Mhq1yufRZ9sUJ4bUylrZl/65eYUlBoGHRrzYqukujZUgJ
         E2xUxF/350GWMumThwP+CuJwN/tr+0B7/ztsS0aM2ntcra6U/nr4xLBqybhVDC8Q1GZq
         tcShjES0RMMZvNwDsAIQ/4cVSNz4h7+zeOVGi/itdxcWpAaA2DWWvcnns49+JDXPxXCo
         FsLg==
X-Forwarded-Encrypted: i=1; AFNElJ/aVTPUK5N0YmIwKv3e6x+zjEeuIzZW9T4w2Zw0vPD4zkwBBDwwznhTVQup4eu0tlSRD1s/vC3pOL7G@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgx/kZepulfeJfioXjjcz4wd6X4eb4JbOkRPT9JTlvUUz3ueZe
	sLx1P0h17MVv5xdsJWfhqI6gG+bOcSlReZEmCzgzCOBG/5W0xUInh+M620FDg4+4YMl7jaf4VAQ
	5Wh3K+GWtawhJ75gxfPGWTP/I1AlryvKYwDddlaQSq46p82stGVhQh2J6lA56v9gX
X-Gm-Gg: Acq92OFouatIj2dDBE9kw75HWVA90CJJK2TnRgXe15s6Crm7x8fMr9R8kltZ+Y/Qy21
	/Hk9mrQlyxZ7tupuMqzGXuaxer0A1e2HwtYlXTfoKX9cWNkpc+cnkhwneofB3yz5T/f7JY6zzPJ
	eYAaD8NuVX4E0liDcQJTF9RchRO2W0+JhwZ7nSfpQrvZnQbtJ/IX8rFsjMD+04Q/0BUaQbqbM+m
	G5KCd9zWwrdpNYFhOvjYDUxNYe0kneLymbM9H5SqryTlvQ/bQrdUPG60YJIEpBozdEyd+8XsyQu
	sBftrOtNNbF9dspc4nlfECeyecBw395IQQ3W6badUzLI5qrO54YU5msxGHpeYQh1rl+JFB0U8zP
	hqFNhQ7NXsvk7hpQAxPA2sWywYFxaa5xVG6PtvS+2qMlTJ8J4ZoKKoRm0
X-Received: by 2002:a05:6102:6890:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-6feffb06cd2mr3913363137.3.1781098820503;
        Wed, 10 Jun 2026 06:40:20 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-6feffb06cd2mr3913354137.3.1781098820062;
        Wed, 10 Jun 2026 06:40:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac07e243sm64054131fa.12.2026.06.10.06.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:40:19 -0700 (PDT)
Message-ID: <29d23bba-4952-4c03-9aad-5f7325e1cd77@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:40:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] clk: qcom: gcc-msm8916: Fix enable_reg for
 gcc_blsp1_sleep_clk
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-1-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-1-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gO0YILJzNunwNoNdTv2eKAZeYvZsCs0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfXznrhvc2CXPxo
 4RkeH3w6auB4Y6qsEjf3xt7z5wrKYs0Pq9xC9iEFpGBqQNfch5TOQGBU1IGES0qXnnhYM46uvcR
 liFWhR40TQKV5cVRI4zX7B7jBuM3lLXGT+N5Eul2pmIaw6fbTacjudV+FeGAlZP2shlR1uHHJYk
 xUMusruMjwpiQE3oYsd1FrMF4z50Y93t6JKKBY18JfhnyBsKSbpRbZXbIba6LBI24OZaaGgwk+A
 Q4LExpH0dEQdTxey+kdkydbcktssDzmYZBQXWo5y/E9Ndup6Ms+JGAGDtN5qTRJsbXU6aSyIXmt
 pGkLnnM9ZB4yTgBxR67RY5aZoQGEFPMRh4KU+wXUPGGmeSv684m37fo1F4EBJyxWL2VzytW4ciu
 c9uufhE+n2GPHzwGq96mk8Ow8UVqfJ6Zn+1jzVTAjG6z1iXjQAFK2UV7Rn6TVVcNc+aOohkWCG1
 ocjwNevg5Gw2/z9OoBQ==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a296945 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=94LYJJSoxN27RZodj4oA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gO0YILJzNunwNoNdTv2eKAZeYvZsCs0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> According to the APQ8016E TRM, the GCC_BLSP1_SLEEP_CBCR register is
> read-only and only has the CLK_OFF bit to check if the clock is running.
> This is a shared vote clock, the correct way to enable it is to vote for
> BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).
> 
> Cc: stable@vger.kernel.org
> Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

My sources concur that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
