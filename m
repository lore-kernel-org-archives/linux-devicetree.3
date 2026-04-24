Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4B63B774B
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030243; cv=none; b=dCQnukDD8iZxcvYasbubbvNW1JO34Kw0RaiG387TdNPMV4ZenPmZCq61ZhnQmdS0Pd+cx28pAlqfo6aZckYbwxZ1eAKuOwy1wLXWw+Tx4Nh7J0eQcKI+9YaXOZ5lMv1nQvbRsnj9ukHyTeeiT52lO58mhv30Km/FQfcnemMpoXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030243; c=relaxed/simple;
	bh=vileOc2RfzmEYgD7Pm9+BBS3DOPaMysWk/823CMJgWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcz/8TZr7L8zWrFp0CDOYAusbgCB3mYvLxCDhsJ4JO3N1MwB+XAtmledQhFOiJKm/ZhciI3MWrp9FgDavTcNI1QGnQQ87S+cEicgMkFxwmiAIJs2jgavPKGyu1KEGYdDIYhqW+Z97rnsVNywvkP5inqzlnYBZqvZsuNsE8f+OkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VcqpPRYA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qm9ntpPr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcqpPRYA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm9ntpPr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8T8Oa4012360
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXhU7QcJ2kzFol++lxq6Z9jVb1uM1NWQqGmWD9/Hycc=; b=VcqpPRYAuhsO+kNw
	1bFVZdoV+X2GaE/RWnh3uBx221N7Uzzim5tbMtoozBTQoRB/Xe20FHbpnd0kKj4w
	YJ8Wm7k9/8PBj+0Kmsmt65OP+lda4ju5o6ha+4L8VvsHHMe5q1XlbcQofQfVe8Tq
	eD3p7dpIWbExGmLbl9GH45cjcXk7FmrstaO2QWll+S0eoH74bwZSXDVwf47Iqs5I
	vE6yiXGK6F+3uivSAhhNYhmfeikIL2NI/k4/AnAYpwqCFWc+oZKeyNpFHbOX+UGP
	9/X3ilHdh3wGGbOYeHkQoPOUNH/0klIdkkHjjZVcCOmGnYtWmG8CvR+IMsleN4dN
	fIlByg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9v4ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:30:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eec753a7bdso114502485a.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030240; x=1777635040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VXhU7QcJ2kzFol++lxq6Z9jVb1uM1NWQqGmWD9/Hycc=;
        b=Qm9ntpPrAjhCwFKa8wwGNgZcvTsvRJggzzRC5Uc7Pp2Of8eUlFF1qTMNvy5OFzwrSw
         p7rJNoRsstLVTjNKPfmCFhTkiFbJbuNfcRp6rXYnRxKMmP3+7U/EmvyLJWNsiNSy8yK3
         RtfNY9u10FOh0A9C5M/nRg2LQgHiJeBWOBhyTecCQ+9frV/RLqLedEFrbSctgFpecqPx
         IaABmuE1X0HJ3NSYWtw3KCnQGGJxGbrAoEG2yWaFmqIg8VkUvBTqNrheKLBv6YRtfVhZ
         7ucn7P3UpETLPiwytlUYTz8yzudXwJMQPa1jkP8Gso24+ztt+aimyeIUTnef8Ro7Z4e4
         OxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030240; x=1777635040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXhU7QcJ2kzFol++lxq6Z9jVb1uM1NWQqGmWD9/Hycc=;
        b=qCaDPRYk0QtZcvTtxu09a9mcyCoeav/BTyrL1HkdI+GxePnSeJtSsT2AUbclIjtnf1
         EswMfwr7Z2O9fFpcUF15ffFDplBn0Y/UegoAHlqBlpD/bGwtY6LeC89Ba90QvijzTTyK
         IDWUq63W9mUgaqq9SaFtv7SiXA61AzgjfxIqzJ9F965maMEKdrpa6XTzOL/4uXmrJ2wb
         LeWyrzeuAzy5RtK/U7kH0IlzzFSoNAiLFUQbJrvp/bp9CSL3t9CVwRoagy7zNpkYZ88L
         mQMCcYClCATzd/W9j0iTNaAHlzX3mVmL4OndapCIAcA/+cNXIf9Webg8e4peU9UzbLXo
         SEMg==
X-Forwarded-Encrypted: i=1; AFNElJ9FEax+vFy71M5yrUas8jd6vuBoSjbj5sT5V9anYr4SDxvs9WlLTF6fZGznPdXPVX/O6gPGltCe75s4@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ2TpJG9Ro1nscP5lBVdQNUFcK4W0ZX9kExiUlDwiqqD64NHML
	HSVNngD+VOIfPj4O+VcmHADbD36oDb2XGY3Psto3WP2rldCoOsC75OeaOSMqua8qVK9KuCB+RAn
	CToUN+lspmtKc5CwcGAcRLc8aX2lSksD0fwB75FxlfkXfG+8zSW4RspKKi5ZwFUuR
X-Gm-Gg: AeBDiesSksoyFvQicGgMjN4R6CZ8/gABhzrR4Zd2r1/x2D5jvYvc9SHSUEgr87vv9up
	m7zxhB0R+x5/kDkMXEpGDPtjeFnKZqAHVFQ1wXoxyxRF76g5LhU0VswNwI9vEFou+tJbQvkz6Pf
	Je8h3kr+CiK5fBMfbf0ZMLnqHVDDlCx03iRHPfa1WW2k+1WrWj+Sx5pLrhduB/Z5zXi2wsugfu/
	5noKxJ997tnhEY3h3/9L+tRGjg8YpeOeR1Yo0dLJiKUyRZ48wmVb17/vEAouZcGYKvvcf+HMJ5m
	pxKEekCitLle9K24iLg9nENUmmKAXkWqi1lS03DvIct2mmjCZ3c6N7EZsBtcUDWjJK+0egl1hDu
	1+DKAizkdYdMjNRpZd72mM3TGhejffjS4yyQSnQY60h8+6jZcivcmF8wAV/Y88zHzZ6l5hMheek
	f70DlTCUZ5caNdyA==
X-Received: by 2002:a05:620a:4101:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8e79217c512mr3005250385a.6.1777030239901;
        Fri, 24 Apr 2026 04:30:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4101:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8e79217c512mr3005240785a.6.1777030239300;
        Fri, 24 Apr 2026 04:30:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d6f63fsm4763703a12.31.2026.04.24.04.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:30:37 -0700 (PDT)
Message-ID: <6ca50a86-0b2a-4eb1-8873-cb80f893174d@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:30:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ9650 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwOSBTYWx0ZWRfXwNAT/Qko+hMj
 vXgVfLvo5xd8MYA7fYa92SQjyjcvmmdKwljmbeHqmXt+WRAezNinF9QAQ67gcwFlOnYfr0/s83M
 L122i2iGK/80hj4gZjeZqglobhI+EAh7y7cS9vn60pGKc3w0R90jeaBqrgqluOYP7snUKTH3qdM
 3FEfphjygnDMGX1lIMGYAGKfC2al0jxEWsFwYend84SxSjTWYOA0CFxJPfAZm7AgoINrKSk4Lo0
 lpXrM9AEydHF/U9JgE+0qHXRqqVlsGfpng+yuRaMnkWhl5d6j4tNB6ww+oRl3Z2n2Rxznh/8iPs
 uW0o6/xHBPGyN9IvhEdf4+Kk4J8PLxnTmOf90HbZK918AvjreVZ6dxB11DmqnAQyItEPZqWax9K
 ggEZkWZ9rPmMU100/jLzOYgxyP+KjSzBfw37HeWudGc/hYSW/AgndA9kLrRp7LfE2PM4YVGDfc2
 /z1+fYZQL7m6Ib4wZSA==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb5460 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yenN7Bsoyp7keh_6dZ8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: p0suCBLWv2ltWs4Hwm31PNlk___SGEvZ
X-Proofpoint-ORIG-GUID: p0suCBLWv2ltWs4Hwm31PNlk___SGEvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240109

On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
> Add support for the global clock controller found on IPQ9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

> +static struct clk_rcg2 gcc_pcnoc_bfdcd_clk_src = {
> +	.cmd_rcgr = 0x31004,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = gcc_parent_map_0,
> +	.freq_tbl = ftbl_gcc_pcnoc_bfdcd_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "gcc_pcnoc_bfdcd_clk_src",
> +		.parent_data = gcc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> +		/*
> +		 * There are no consumers for this source in kernel yet,
> +		 * (will be added soon), so the clock framework
> +		 * disables this source. But some of the clocks
> +		 * initialized by boot loaders uses this source. So we
> +		 * need to keep this clock ON. Add the
> +		 * CLK_IGNORE_UNUSED flag so the clock will not be
> +		 * disabled. Once the consumer in kernel is added, we
> +		 * can get rid of this flag.
> +		 */
> +		.flags = CLK_IS_CRITICAL,

I think this clock is normally governed by RPM.. is there RPM/H on this
platform? (doc access still pending..)

If not, what's your plan for this? icc-clk?

Konrad
