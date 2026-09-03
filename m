Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7432E3F4829
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 11:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436685; cv=none; b=O89kjIhogD+WmqXG8CVs49OUfo38wdltRH9m2W68GKx8aTIduhgcuPcJueAgIS0RmMsgxzTLV8XhaFY4JPfflHG7mUn0dNtilHA1oa3KpOV6WzG+RH9PCl98KcyQ/P4QCCVFfrl9XuRWsn0ZdeoGBZugSsKo1kBb335FTEZw+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436685; c=relaxed/simple;
	bh=kS8sab3+oqQ16BkkWTgftQpd9FY6WwLaiCkt6PdFW58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVykHRNCbH7bDYE/AkUEQ2cIeCvXh5gFna5cl+/iO93dETCq4gYjyxYcIOJB8jEY4YMsv9yob2BZAswztkzeyn0XwD72fWmOPCWqZ9X8tsXCmYnYgwusFxvyTUv0DevAWGJhcQsRz8QF6dxrIvTmBmO/rX1RP6EtTVqKUWOPXGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcLDftjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSqlG8d4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcLDftjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSqlG8d4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683Ar1Zw740926
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 11:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=; b=jcLDftjBcHBpvXD1
	CXxXFHNudhYx8FGU5VwxJKzWM8el536Q5h3XyiZnOZrQ6Et+E0FyhZlWYj0Id4jD
	k/jdoziPvaF5N7R+50mShcmf0ydpQK25FdvxmleWoYcMgIH74qL4TFyALI92IF3X
	Xpx+aauUDHIUp3Uxs3eGTcZ1HEYS4oJ70agschGic9XQxQzjjTVdNIeMUYt0QiIu
	uwrAOo4Tb1Ng3iPw/hLHuZ5j7Ga4ogUnmbOfaav4KqVY/F1fu5TUK0cMRxHga7gg
	FuNk3YzlwUMeqYUAsQyRMCTOGTs7Wfqai7f+hWnXvVLnRroP3MpCeAAcsXBo2MBU
	+Xn5Gw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hm74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:57:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso54460985a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 04:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436677; x=1789041477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=;
        b=FSqlG8d43Ph8L34ex/6WAxPV4Y8NBwU5iupDX1pDsdIpVY+lZ09dqm9ja5ergpVWpG
         wRRgfwRp0nr3Wm4rHcfmr7LxWzcpXM2gBrgVtTkvLg/AVeI+YGR/4CZfZHUq2+8FxojR
         3u0ovrUffcm/+WykFdmn9E06SZuhIngOerSF7wHZEnehJjwZDHRu8z2ClYu3ThfjDifj
         5F0No7GV4qo7XL984eGfXuCaYhZohWPd1OH5UQTlSMiq/+NukXKqDTzrERHY/d9Bwg0a
         K8zM22Ji0Waj0FrKHl/XKkg8gtED2ZtqH9h182OlcpMnt623vlB1xvFpjm7h1h9nNimO
         RpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436677; x=1789041477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=;
        b=nlSSM9/UI/CEyC3uNZJO9ygVLK9rBgvWKUVMhsUyzu6d28voy6yki9DbsgVnsdwRjI
         ZPt7cAnPPPpss6MM9GRKpJ8sR8M2ip3a3fdtnz4czTYfS6beO3FviKtpI4w7q++0Wbkh
         kJJnt2QNXHb40HUoGqhM0LYP8tb0HAAz5MSUl4UWtX4YWUQDiwQcJKHSdIumib9eWPIg
         j1gV+/vc8UAMYZ+cPOpvZRmxQAbewTA8OIePEBbwHJj0fUyWd2OdtKQhLFn5fKX6HSin
         L+044XZlCG8QZMEEd8al9vrUktg6n0aRJkYeSyzdvLy57HQ8dieMJlZILFXDbQS7bm2Y
         jzcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUneC6mQRbN84QBdKx9lPM2ae6eG0jFHsWnrbQXSZGvtNNAw3CVro7DZCqoGeYJ+mDtnSPeb9h/jZQ@vger.kernel.org
X-Gm-Message-State: AFuF++mkNFBwSgnRJ7bs5vnVb+thHl3SPI8LjqToUfUvYz6q/dc1ywhF
	SPfGxmJd5OmgXLWyQiXQswBDZqh38hgT6bzN242a0bbttxQWdcq3B7k+OfO8CYalFZhLcaV4b8i
	ba459W0jbDIUWhXf7Due8Wrf3KQTq7/8GP1U4MUUuXLOSrii90ENQdX1F6vwTgkjW
X-Gm-Gg: AYBFou1hGSPSR4bJV0Uv/7CJvCfuZYzMUbiDOvPaapDIs0sKGXBC1oJ5Z9Zl0vjd2uh
	dWbAQjkzH3KBXnqO+Bm6D97wKc6TfTMFbXSmZYCvHIOk0nCdmPNWzhXflmOpmwuUDzYshiUzg5w
	pWfAUzv+tYLexKsX8xACYswcQsASnywk5OqzacHHCZMrXIAsrk+M+pr3hKScmMrJi+ZHyCzeJoa
	X8SVBRDhciKPaO1yhwMAhek3qYHq+cw+vqri/jn39CxOpoVH2Ou0T4pwYOfTkWGabB9EAABZMKq
	6ohkYL8QkHF9UEypLPzOT3IQBAewUjE8zFgrp+aDHnTGI5AlT4tG25hp1cJqwIqY2EneVXj2hrP
	/szYh1N3DNdmOvykAzs+ojA==
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr898835285a.2.1788436677433;
        Thu, 03 Sep 2026 04:57:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr898832485a.2.1788436676972;
        Thu, 03 Sep 2026 04:57:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4174d7csm89224366b.15.2026.09.03.04.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:57:56 -0700 (PDT)
Message-ID: <7e32b791-b27a-4b0d-8143-ff4eadd11fa2@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:57:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a9960c6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7Q0HT--lCe2piuyCE3MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: W7TheFOR5wY_lbarQtXYyv9tbiJGoLPO
X-Proofpoint-ORIG-GUID: W7TheFOR5wY_lbarQtXYyv9tbiJGoLPO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfXwFyPlq7dzFD0
 uBaOiVzKHWwoVGEvBRms1xPhLaUPNC/it2ED3ufcftlg7lwzKtMvJMnk7aGiXsXPiB7oqiuKHXe
 TViDI4yLCOfCRHoNeqHHGFzglCVqWOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfXyJoOlIMc4wvZ
 JdMq5mQsu0mLPrqfyZMGf32bmd6UgwTIvUZfa99sCt/PBIqkBJf8iBz74fIrHNAJ0O9vvij4BaM
 6niNOBZjaWrlbU8+FhqOhk20aG3o3Y3fiMpBJnyEufQvC0/yqDqU/SOGwjuvpaH8DB/TePbu+a6
 lj22s9DrP1neTa06igeOlW0k+G+bS9Ovowlzhjqe28lIkiK7QIxsqU1Wxt1k4Fr5W6IN5OqRcSC
 DAh3pxWTsLuPEKRjNgXthIn1tQdLhL02n5V6vPI/gktOspgvzsjNl94UYDd0TcvzWNOOMneIOwR
 qz5XBcehKv/uCf7N5umtPlt4fbyQTPmebpVXUNyzMPs/I7YyEJehHyJt+A8IO0U3pBreMKSDFZB
 yyQOIqUae2EIlKaWRNjIswT5rNVzL5cmGo9Pel3RWubzsdwJg80oTxPbYyWEixNjh4YtI1qBvOq
 TGWaM/Rjuvp5P8PWu4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104

On 8/14/26 2:48 PM, Luo Jie wrote:
> The PON (Passive Optical Network) reference clock's parent is
> cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
> configurable 8-bit divider (1-255). The clock supports two modes:

[...]

> +static const struct clk_ops clk_pon_clk_ops = {
> +	.enable = clk_pon_clk_enable,

clk_enable_regmap
> +	.disable = clk_pon_clk_disable,

clk_disable_regmap

> +	.is_enabled = clk_pon_clk_is_enabled,

clk_is_enabled_regmap

> +	.recalc_rate = clk_pon_clk_recalc_rate,
> +	.determine_rate = clk_pon_clk_determine_rate,
> +	.set_rate = clk_pon_clk_set_rate,

These seem genuinely new

Konrad
