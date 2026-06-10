Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C27408014
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098928; cv=none; b=IR3e+gqln92sAPaDOx0E9c/wExxydn0o9V8hvoScirpCIN6BCiXYs9ei5n83WtOV/rZ7e0ZsrMlHacJBZ2Oxoj3cqoPk3wjGS+IDxqMVi8cIn+qoe8HJQ6sh5OBbh9ZTsQlHDwvS9c3ewX7rx9lvStj0Y9PIpbyTbu3fpsVPY2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098928; c=relaxed/simple;
	bh=elJRuIraj9LIEayHYukMMgz/xD1kzi2NjhMOTQ5gYd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7jnURlpNPb+JkFf6/q5RhBdvf12R6hNh2qiloRd0s4TeXtqv4EW4YZK3foORXkmmt2Sl4O3oKZ0/nOH9aW8qGb8H9fEZBVWmJVaBnCGeQQeAZIo43y8nOiwRW4JIbAg+P9HOhcymv7Zu2whvPw32eqIdp1d3+B4b0cHoFxEbdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pP8b10wm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cmha2fxu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pP8b10wm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cmha2fxu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBwV71511483
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYnE2tPNTKuctm3/u9D3muC5XwJ0vpdtl+XoYeIZ1mc=; b=pP8b10wmZO//51Xl
	I5AMUWEu+gL7jwhLl/tVtpQttKyZ/us5SbZIIV9JyOI59XP08HmToOc14Ef6vRyI
	w2NJeK4GWAoQS1i//PIMVGkJTlhvlYz5fIntJqwzaBnh7Aa1/QDDv3zSD0G1Dcyf
	n6vJKOz+zLQzFgfmbDdCvda4ImCujHlk9sWDFC37+a3aMzLGQIciX4o0moI+Tbv2
	tMEOL/NOHAJwqIBDYk2jOY5RjIt9dV9HCdlqgHZ57MOi5RBy1KO8g+6oNibZ4ILP
	/SkUkvH/K/WtJsPzxOwqwOC1vf3cyBI4A/zRL2ti51q5BGKRakpMwv1D3dWsdiWk
	RRC3Iw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epukeu7xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:42:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157263095fso156058685a.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098926; x=1781703726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYnE2tPNTKuctm3/u9D3muC5XwJ0vpdtl+XoYeIZ1mc=;
        b=Cmha2fxuK2PtJa6WxEDK4B422Atc3XLOaplGtOtQTmQtH1ZUXUzdNr8vOio3ZGz4Gr
         +4LVfJdgFmcabogdltLpcG6nuUoRTCk1HUiH/Faf6GHYGHqIkkDiWUJtVB8SkShiqF/j
         +AKJMZQegshxEiB7BOxqRdb2Uh2sUXNR41kW0H2sp37y4Zd6LnJlfx0+Mz3Ud98MU2J8
         KrSyJMzLzbsHmFANgkcLqU6q8MbC71PPtHrdKMSUD7Qw6Rxspgpr7R2NYQgQurpX4zWe
         vUBnPCzcRFxIFjU9IjBPhA2HIZYn3+LxyaL9zSvJPC+g4UBNGB1Uk3yC4xFpuPDufTR2
         QFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098926; x=1781703726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYnE2tPNTKuctm3/u9D3muC5XwJ0vpdtl+XoYeIZ1mc=;
        b=UqlAObNI0ZC9ps46iPYPdnmtLmotblnQr8bZhTUURNDYuXRopT43PnQh+dPdntXEP1
         hZJTIpnZ+Mt9ycQkXvxP8Cc/+bBT7VlF+X3BKJKv/TEN9HVyPZCUX6mbd7Izi/Itzb9U
         MEPvWrZi7t1CavO9qRNbajCptWZcVZ2ctK1jK+jY6Url05mYtCtr+jqjXagK3x1Ao1tS
         7Fply7yjQaKMn6wFS4QW11qliciJznXxlmr9hD0PvbqBDfuOj+JJ30m3eIWWxiuWQpYn
         dU8PtAbyW3o5cFccagfwEm9r1Gfb+O2E9e3YWC65cQMjN0xIaxJylRxQJpE6kiRqBNYJ
         HpJg==
X-Forwarded-Encrypted: i=1; AFNElJ/+KzscVEVinbUxHIViHZWxYnpZ0fC3LyayQ4VdOl+UWSvJBZ0uKoiejYY2/J/vv+wbyCqJ+0Gpge5L@vger.kernel.org
X-Gm-Message-State: AOJu0YzhgeY1YnXU7p1Ci32dU2j7FRet2jZEeY3PNdBrDayQoVHyYvq9
	J53s140qVRcxdCoG/M0jyt7HTo9v893fUqoad2mav569t+pgXKUOiyjnsIrN0UnxDFXiW5qSw7P
	afJe1PclK20T96C+ZQvyuWqhfXt1ecroOgCCOZeCf2udi8I6a9bKEusqsdsgIkxhc
X-Gm-Gg: Acq92OFjSxiE3RUDVXSt0PJUZ4UPvoCDmvGmh0RC6VItLzTr77cE5HeFT9A5t5T+L1o
	WyRJWakXDBsM7dP0QPu8krGXNi+p+l7Uqe1gvcN9bw8kNWS1eZ875ZnlFVj939NOurhYaDQ2zXL
	RedT8fF3qyYgss+aAJ8g3mAbvX3xge7m/fbnGz1aLIuooV2hAF3zgAuKpf249xxR9A0KmkP6r/2
	1fpR8yQknQF0Jv59ZH+aXdzN6/CQADkoKYN7TRb3NsEbN4A+rnPtP3w36kUuYEavn92kwO3pydc
	cxKtUhJpfsqgvE71aXobCGYppvDwcbTxVVqcoeLr6QSdlCoDxa8Vy8e/ScaDVIVpyZFYTGHXV/x
	J5LnaQpF5/hIQD6VZVazIwGzBLhLpT6oD9u+O15QzKOVDgi4BE2lhNWEK
X-Received: by 2002:a05:620a:d45:b0:915:e7bf:e6fd with SMTP id af79cd13be357-915e7bff664mr501603385a.2.1781098925257;
        Wed, 10 Jun 2026 06:42:05 -0700 (PDT)
X-Received: by 2002:a05:620a:d45:b0:915:e7bf:e6fd with SMTP id af79cd13be357-915e7bff664mr501598585a.2.1781098924327;
        Wed, 10 Jun 2026 06:42:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ab61sm5457550e87.45.2026.06.10.06.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:42:03 -0700 (PDT)
Message-ID: <a19d593d-5b6f-43e6-9640-83305fe2f9cb@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:42:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] clk: qcom: gcc-mdm9607: Fix enable_reg for
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
 <20260609-qcom-clk-mdm9607-fixes-v1-3-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-3-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfXx8QZ1u6ZFWT+
 7ejUApxnUUivk9bDvhFTnDUnJ+s1dwlFh3WuqT5uH4lQAzARDz/6eXSOeKQkjeNh7sgR3EiWGIr
 QJ47Eg9LeeeSrpU/17xEvzN24y4Uf1bKYEUZZrtjwNKrpgnkZWrHkWYYHXJhPJr2Uge51yGJgyV
 qfBEqTVzIQjjhPaWTu91PDT7llTVmCSg8APPbWwsId/IrQW8UaRYsyrztZdRakH7o+EyAkCm3CD
 LT1KYA4ECYw+jj1g2ifPlb1U6X/Hac0bo/pVzKJ+BTBla7gNFgInAgR/o4iPlKxb/ClPe6DGVxo
 taPqV5juCChNnB48QXJex4N1J+kspgCscmq4NzI/7iyfWfglVboku6Jop81zPOy9bbFvQZAvt3w
 8H5tKxmyqT4WL5tnSQ8AbOw8GdC7R/Mc1Dm/z8Fux3tpyNKvRnjTRDKyc667cA4HmhIVuQ0my0n
 itAYGf7O8vO9FsCKbvA==
X-Proofpoint-ORIG-GUID: F9PDnbsHTyLTCwUOveX3otVAnGSA6hdB
X-Proofpoint-GUID: F9PDnbsHTyLTCwUOveX3otVAnGSA6hdB
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a2969ae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=94LYJJSoxN27RZodj4oA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> MDM9607 is similar to MSM8909, where the GCC_BLSP1_SLEEP_CBCR register is
> read-only and only has the CLK_OFF bit to check if the clock is running.
> This is a shared vote clock, the correct way to enable it is to vote for
> BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
