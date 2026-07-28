Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80173DD85F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230995; cv=none; b=hON++a1Z0TJjh1kKZ4uqQ6wCyDQgirUCZZM9ocYEznGWXHpj+qxJ7lZHM1VP/N1NOnBuin/1Rv6eS7P56J92SgIFD2WewnHcRofZuFHKJGOKyzYQ3rQ9W4kes+fTDCCLz0JdUQKJb6i5Sj6isNxjQyYBcsPMSFpvlSQ1Q1ipUNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230995; c=relaxed/simple;
	bh=+cJ6lA0Ry4sm9jxuVqVS+Spb1104T8rj0lLFUr9YixA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtDEDpAwrTTZnrWX5VkIuJUPBSV4x15cmK5P2C86vieqykCydyckimRqldU7MrmbieaWP1zw39n6ElOPgxcYGYRAKwYxjOd+/8Hl52evdOwcLnTh8ib8Mh/fo2hn9mWdcsN0bAzE+Fjix173+hE2WVf+sRhYIi+AWoOcIuOYOcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bY4mFudN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UC8VbR1C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bY4mFudN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UC8VbR1C"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82F0H2480199
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GC/ZuBK1RLJ4ibzTXEvYuoddg6a2oCrBqfBM6hC1438=; b=bY4mFudNCbDLmTw7
	nT4W1b1w1tiKDSBRPCjiDIc7tdENyfJx6yQYk0dWIFO+Inbfrm1Wt61QMkt8pZbR
	TpQS9XdL7JGwiPPKAG+Wun1cgssUIZIbGxXtziFw/Ez00ksCRaijwzXxvBI/17Ys
	oIn/PFinPIrulCNeNYtAnHCmCXrgt3+40qPEVgC4ElyWIBHNZ1WaSrtH6Mzx6K9g
	VlIr2NYh0LrAqwG6YZGGrrUuWXjgZzrVdtxs4wxHRtJLmJFUI9v3nvbFSDaBt0mb
	GGdJJTbKezNB8fHxKtnGYQK8q0ayopddOmKZeT/ioGAldiJuxBFCenp1X/dtmfwT
	rmGvVQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy117s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:29:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51cab6f7517so6622181cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785230992; x=1785835792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC/ZuBK1RLJ4ibzTXEvYuoddg6a2oCrBqfBM6hC1438=;
        b=UC8VbR1CK8xO2QOfA+1eSoMQ/N2hH449LJ8tvuyib/v89J2/GKhv9pe/BwcNXPeTaR
         ve8qa7dmvBK4k/uUNgZFUdjPpxXEUmh8LTXMaYEjrpSeNBWyRZqqlUl2k4jyQqq1WVoQ
         naXBQUrOho1PJK/hjWs9GFtGLaiya6hw/PRbZBY3e9eY9L188dgO1Lk/UyePitEvlOlL
         gX2MotHzkHxW+9y48vi4qzWuyjX0DhYCW/0vbtHeGI0fdpeUVXgzWvAcMjnjQUfcO/cs
         2vfV8r0IBo7SKjktZWqWbge093uTGEQjozY+eMo6Wjdz0jqr4gXDTzcF2VKVMKb1NidO
         1cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230992; x=1785835792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC/ZuBK1RLJ4ibzTXEvYuoddg6a2oCrBqfBM6hC1438=;
        b=mcCqFRT5c/KdAYhP4lQiZ/yYqTNpGZ9yDgcIp2SKqLJgvBXJ0T8DQmMDwQY/jEwAWV
         0U+DdVHXfGrgaMOFWHe09SjjLpv/nhvBcIlpRCDa99NueKo/qaN+nv0tvmZE5NR1LBT/
         ce09pLY5fSUHhzCMzVHdAm3E4hz4ngCJ/eUq5v7bJ3KLrgm03MHqlHg85lD1EGbHR2gg
         a5pa7YouZNCXtQcEv43/sTdtDhAijlv5N8HDRkYSiXJp+uiJiBGYRKgKPpe8LnpRnra+
         NqX7Uf1LQedHuOFb0kKC4U/67SS3mlCORRTFQ2Y3Rv0z1RErnCJc6BipAJ9Ke7JYSp7z
         zdPg==
X-Forwarded-Encrypted: i=1; AHgh+RqN6jWdQlc5YISghp0/dmIiFJUbuOCshQofeVzWYeD/2MhxuliwdxCFrVnIRsqSb3QDtnj343c46Mjg@vger.kernel.org
X-Gm-Message-State: AOJu0YwRIGEHP1JQ/pfBgYWtMqO54q95Q6kTjkxenCW0YmPbSh0qh7dr
	0YSU4sIdkCeFNl4kq9tlKotKYsGGBgHSqS4FPXnn/GH7rXpPSTCAWWIFzpl/Q0IeK8vs9bnJVPi
	Sm4vu6lprtb6q9WPDubXqYO5Ts5/4Jc975vBeX8N4p+IpmF8xwJZtXmOC5/LG5gYg
X-Gm-Gg: AR+sD11rE9x53s6mSB6MRqymfTDBM15Ta7BV0ZxFCxbC/Wdhyi+APKEUOOGMMmdXjtj
	6OnrRhe5LCj56aOW2ZulebK2wrpkzNYaOY7Z5Vf4fISONU99+WG2eVcA+FnWZ1LFdZJog1DvlyE
	0UZdlQSGoV31xW+e1XB++LgRTqS8BQG2lxTUGKHW67QnaSULPSg/XBelyzX5nMfzgdvS5sLPkJx
	neQ2Rrk7coHT/uoVjNYDHMewihlPx6pigPbDPZuxxGT69kOwDl31xCu5lEDbtBAhKtSdQ21BD46
	R7holojT1/i3IEWbLoPp+HnoE/l5f+ytMVngYsSsQCO11OrpI6BawXvpjNwdFdy9nJUjrsUiWLb
	R0P1bWnBiUliynpudN2xiKeYn
X-Received: by 2002:a05:622a:15d5:b0:51b:ff78:f229 with SMTP id d75a77b69052e-529d6feaeabmr10813681cf.5.1785230991927;
        Tue, 28 Jul 2026 02:29:51 -0700 (PDT)
X-Received: by 2002:a05:622a:15d5:b0:51b:ff78:f229 with SMTP id d75a77b69052e-529d6feaeabmr10813591cf.5.1785230991598;
        Tue, 28 Jul 2026 02:29:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm3675170a12.15.2026.07.28.02.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:29:50 -0700 (PDT)
Message-ID: <a907cba4-c276-4355-986c-44f6e39c310a@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:29:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
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
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -0JMQkSOCf6TIZnsghtDjhWuW39p-4Mt
X-Proofpoint-ORIG-GUID: -0JMQkSOCf6TIZnsghtDjhWuW39p-4Mt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX6KiHhqdDunpx
 tzUbc/FE4I8WQnokgWlwP97XUQAVAUHamUd6L/FMYnfB8YwGNzucgLu6DNCuOcMgqREuwuWJucA
 N8Ow4l+9Ns+LKx9qiNrc96Yc+kdErZQVUOtIlIRv/2FkCQ/n8ZLTQ2ing0FAxRtHjhv86wfRWFD
 RkUu53119I0FK1cpuSOsMuJvroAxcfJ7WWku1dQW5M+zKfNcBNdeTzTobUs4Wzto9/2gsI5aB/j
 7Yeid+knl9aqat7n8VgDDSH8npwy8whJxn7JOfIYVtNslLwxfY3W6bQpw7iyW1ckMuj+uiwIPSk
 QgufceUW3In6GOtbP0nSrOIYNIr/tUjBEvxMzcVAfV1o1s6vlAz0d1HfasWADBy+hbfaWdNLUGY
 odMCH5DQjRfUSwTL4Zmzf6999pvrYBnrtBNA967lKOZpSZ5qyF2qwZV3y/Aus8O378hBhzX3AYX
 qbXeo/CyhVZF9EEZUYg==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a687691 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rcriG_6vuXrZ4KVOdM0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX1eBBBAwZfHhc
 ziTPjPEe+eYdvHV2bzEb4wxPvZ8/w2sqBZzPJLyfD2Ky+SJw7bThReORR2jk346vkAHcLq4eMyi
 9oIsERSg68gWdTzMwmcM7EqYqP5o9UM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On 7/24/26 5:00 PM, Luo Jie wrote:
> The NSS (network subsystem) clock is derived from the CMN PLL output
> divided by 2 and then further divided by a configurable 6-bit divider
> with a valid range of 8-63.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

This looks very similar to clk-regmap-divider.c (or at least to
the generic clk-divider.c implementation).

[...]

>  	/* Register the fixed rate output clocks. */
>  	for (i = 0; i < num_clks; i++) {
> -		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
> +		if (fixed_clk[i].rate) {
> +			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
> +
> +			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
> +									 fixed_clk[i].name,
> +									 &pdata, 0,
> +									 fixed_clk[i].rate);
> +		} else if (!strcmp(fixed_clk[i].name, "nss")) {
> +			hw = ipq_cmn_pll_nss_register(pdev, cmn_pll->regmap,
> +						      cmn_pll_hw);

Huge "no", this must be a compile-time constant and not rely on
some funky detection.

Konrad
