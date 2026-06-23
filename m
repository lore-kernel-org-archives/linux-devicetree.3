Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6B2772D
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214316; cv=none; b=WtYGp/LWuYN1OorbvtH7Gu16MGO7k2pb18qy9zF5Pov2UiB4+AfrTdCcRR1QDay4uktrlYJyPTqsLROZ+2gVh0qVxrDELq7fybYWMOXc56WlARLKRwMHkH/w0pL5Sr8tyVtM2gVEA+ZHqKvT1Z5PKtQ8v03O2LB2fI1NqwMXuyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214316; c=relaxed/simple;
	bh=1bRuAxubTp1oa3c5PbjGwQxf40xJs2oOmi2fOgTZr74=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GHkkvN62GBnDjRJU3qMgrVAfmBspWKESD8BM3ByHa+hoCu06Bfq+/J4C/V7WY15b9synskYQ9NIOf4FUzV9ZZ9UHwq3EL//tzGRL2qznM6onsEcf9lMlr3vHb337MOx2huvwddeA9ON/rWsaD8lpNF9yOyg0+3IXZvBVNL7ELs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAdqmWk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNg6OEd+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAdqmWk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNg6OEd+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsUb01066780
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBj5btd9lTLA6Ue9MEFblXr0NGN6kaTZJJqXH2m+DHk=; b=ZAdqmWk76vOgXAuw
	AvhITsoWOfnJfQVoHVDgmW3s6HKESt9PazuywBHl7ITpJ8ox9fp/vkjslfy9prw0
	7lRhuG7nABXUoMcmpHYKdDo4Hkc5/CY7V6SRxJuESmj1qGd7e5hfyOmBBdjL1Hgl
	sG+z8xfOVu/0axsYHzBgrJ8Tzbsufc8dFjV5nRBqZUCFnqH99fKBRGVMXb6j8eG8
	13MMerSGIO5CuxU3ovtGc6X3Xs5lPjpNZe0u1ojq5GNOGWW7H6LmqSmAZCFvO5Gs
	pgIpvASj6pBirsDBfGjh8cRrYBKlgHH0tiJQDqfzIYhZG9yO5QUsorsBh8kIr5wl
	ptMjYw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28raby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:31:54 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso2281057241.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 04:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214314; x=1782819114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cBj5btd9lTLA6Ue9MEFblXr0NGN6kaTZJJqXH2m+DHk=;
        b=QNg6OEd+VlUkx8b5ERdSa8O9/gJPe6HrKJW7gMp9II0PNT+ECQJeuWQEk7N+UeFewE
         LwNmfIZolCHf0MsYw60DRW4lqj5eL0Jc45IsJJjB6rwI8Sajf0U/SDZGPt8BPKjzr6+/
         U3xzJPen+572eAyj9f1JE/4X6u1m09HFgQiMsmm2IYWBaYKKxfkoRCZqdnXWxH8d+Cfn
         NKEf6ULSu8ifDPv5FMOQTUtw54RESaaIk0OPXvD6TXvY3wjwK90Re3crZ4kN+2vLmoqZ
         z1qC1EUSw+cF8QQACbb2aZV90fHX+YBjU0DIlNPsfcGh9pdG3v5Htokq+i03SrSakyNi
         K5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214314; x=1782819114;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBj5btd9lTLA6Ue9MEFblXr0NGN6kaTZJJqXH2m+DHk=;
        b=Bk4iNm6qiXW4dw1Pw5pamzOiC9C0npGRVBuwhNiYhaYmYhjKorOV+uYxPT9mfMrgm7
         avTNVD+TyKdN2EQjYLjQEKcd2HoXJIpKWqA1FZEnL5ctCADW44VLI+xKGE8PVsxTfb8j
         tuQ9g+WSlm75ydLXDmOgkC7gG2tJN1om3YOhxBJa8rkcXax/4ZjeOBL6y7PBHEdsffkc
         d+rgsTInOyzgXlsyI95lDW6d2NTBgb776wa5V6Bk5OSru0X+B0mfkR5WWZVlor9OQojZ
         UYPc5tLztzfmp9zUthAR/XwOqhF7116XeMvOyvhajNmsf0K39O8unhWpCQVIxIz7eanH
         aiqg==
X-Forwarded-Encrypted: i=1; AFNElJ+G7EGeltzIkfbLZdaWOh3X/JbZc6oOTcABzO/12o8EIhb8/sw1fsTe+tRKJUM+/CyH9HmQWs7BVyXw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz96l17yh2dV8a/kBZtaxsY7Gzdojs4M5/aISDK3lllET5INXYf
	OaPrAQIpf0HXJK+7cJGYnDnZ3843CMQgOV5Hw6xb5GkIx4RKoVna1oimZQ7cjInVkg6j2sTKa2b
	arvkP3WxiWfab1oWm5djtbr5RIcm0e4UUd0pnJ45JygbSDgxQkT1nyVMX9SR2I2Vm
X-Gm-Gg: AfdE7ckLM2OeeypWBuKVlIRRIxxzy/GoULTytK0bPxqgJqcJTyQvf7lu6a6FAn2+bot
	2kz4Uz+T76+ROYM/QedHVq/HRMELKLJapuKIC1CPzvVYsaBNC4Q/E9nS0N/fcBgWzuB1+JYM57a
	OhTNpSvu14YBpx7UmFYAnPZKpSpSLiC5Y7+rjB5Q2vYSWlpgBCxgl8z0vO97j3QQZmwMd9n40p9
	TMdxMwRr/g5zGwjcDOdQsEviwvjb8tJrDH3syNUk7TDidIl06QFT/bac1K7oERd3v7Z66YcvHqt
	7Rp/Fm1NIhmBSdcsDiuIkOZtzwZgCvSxhTaoK/JkJUVdA8UCM5kNNWTHGb21LgWdyYTCTlgNFO5
	Smrav9/yWosOe7WYddVj4g6+YknchrCEIZqOq0bW/
X-Received: by 2002:a05:6102:dcd:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-72a19f9bac9mr10458301137.0.1782214313725;
        Tue, 23 Jun 2026 04:31:53 -0700 (PDT)
X-Received: by 2002:a05:6102:dcd:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-72a19f9bac9mr10458247137.0.1782214313240;
        Tue, 23 Jun 2026 04:31:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238bfbsm309629475e9.5.2026.06.23.04.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:31:52 -0700 (PDT)
Message-ID: <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:31:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX/l0fFtw9zLY8
 n31U0X25vwHyJOSPYUdTYoT57eutzhaYi21tCQwbHdrYtuuVTziwTY8cmQhZ+DkGUHSIx2hHwMe
 AFHkZyjHFsWBfysNR55RQqjR/qof7vQ=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a6eaa cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pX4Y2oqsHS_uD1ZpdeUA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: CUsIgSehQTKxIUqsfoyJ5M7tr4ziIvdU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX/NbvcOmm0v0m
 mvi/fyWTtM1iSRJQVTNHXcGw/YzzeOSW3d0GtdQUN4bQjN0TkZSC/M5N8npsr6tjMahPKXG8x7Z
 sIQAl7g0fc9UvQBxSeHEhaeuh5dxDEsHcqonrMSVZ/r//LgnLe05Bsi/9Aajjb3DCiblkQXKafo
 bvngKENSF7tq6sfVowF0SYGx/A6m1rYxlxbJ58scUYdLse64403cdCxqWxvzCGtQ7tgh5fStEPP
 DfObX6sJ0F1Yo4ndlLNL72nr1F4Z3yd0VxxEN8P0PqRsOk6A/Ju0x0yxxxG4uqj2XZyTuMXLfkc
 kK98PP5EV7ypIBJ+lCjHlH/+Y5z8FzUsie7TFs94MZZ6TtFVsXWwzhTH3BWiEBT2LpdiIduzeHW
 XY43SnGtZyjShSCrYHqbGlyM0lYxHl7wCyuLglSh56KKCo5vq3rkryW2YHSA+xLOWRAnl2VkEE0
 6i4TUaJaEauKE61tU0g==
X-Proofpoint-ORIG-GUID: CUsIgSehQTKxIUqsfoyJ5M7tr4ziIvdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230094

On 23/06/2026 13:27, Krzysztof Kozlowski wrote:
> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
> Display Clock Controller is enabled and references parent clocks from
> DSI PHYs.  Devices which in base DTSI do not have all required resources
> available (e.g. because they are simply disabled), should not be enabled
> in the first place.
> 
> Having DISPCC enabled without DSI PHYs causes clock reparenting issues
> and warning on Eliza EVK:
> 
>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>   ...
>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>     platform_probe (drivers/base/platform.c:1432)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
>  arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
>  2 files changed, 5 insertions(+)


I should call it RFC, because this feels like a band-aid and should be
fixed in clock drivers maybe. Eventually DISPCC should be enabled on
Eliza EVK for HDMI, but DSI PHY will stay disabled.

Best regards,
Krzysztof
