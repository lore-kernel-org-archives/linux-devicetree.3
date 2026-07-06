Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92A5434E31
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352161; cv=none; b=YFyVZOnTOZq4yjxENSmdX597jukX2RHqsQqsA57PUnPb4jRdfL6Lw3fjYG0eGHw+MVsfYDiiPrjUQ4BPB1eBRCnn2w3nuJ7uCnXVz7UjT1N1YYj0sjnMtwMF3YOlZb0z6tx2b8eW7UBYo0q/Vp1k3VIAMti0bwfaGNFj0B6NJ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352161; c=relaxed/simple;
	bh=HdwwW2iPxMo55xo31PeaYKaC9C9c5lBoecOPey2HqeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOHQMFeQ19VLFLsICR40JYojjYYfDXxaTpf2vACYfftMMZxSGoYo46zqp4OhyxwQDFRlUTdVeAmNSTjGAWmIA8k0nefbxDy8GkGgVR4nTUvdzoYlV6kCjHFDPC7t8uLQBJrzzfkwhxYKeuCDREVfzj3oNZBhjDTXGq1p+BIin/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P62yl7vc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNZI4Wva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P62yl7vc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNZI4Wva"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFBaL900892
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFu3+CLuR1Wqk1McfQvrk9SrE2yO/Tatw0kE1ejFwos=; b=P62yl7vc/Mvt/dzV
	3MyUrF1pEILkx2F8C9VTrmpmnpEXKoX/nIqigX1Eqadb6Iskeqieg/r0WgGHA/+b
	YGg0RfeJMF0/JeRBjLIHBSP9/xl6Vt0zBHIqCW0b8NSXiFnjQDwV9mcP1SWiNfmj
	0ffPIkGdxV2t9iNW3ytls7tDvsO8Oq1ITDgk58jgNzMMgOwmqPd/17r0howEGJJP
	PUm829Rz6vDfXXLa5M/VyJBr99UDZODxA1RgxsU1GeBNNNC4jqzd8ooksV8p7Hvu
	myfw8om36IA1MClvpkCbcVpRNwcX3ozB82pzY8iRqM1uLzXLFtuLZY5PRo90NYJm
	evu/GQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7j5p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:35:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07313be5so3863231cf.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352158; x=1783956958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CFu3+CLuR1Wqk1McfQvrk9SrE2yO/Tatw0kE1ejFwos=;
        b=jNZI4Wva4yedgQ8aTrGP8Q4Jt2L0uDe8MvEv0IuN4dNgA0DxjTKCMPcPlrEneNkPmg
         cNt7l+4X76yCe8ASDmoHENhPWv1aVi3Nrw+fp+DyKFWFsID+VCHBTsRs6xGqZqxq+0mw
         8nWJaphjHYd6aoakJIdo14XjnfV5u2d5HYrkDfXv6E7s2+/O3h+L7ZdQtQG/dpKZOtKX
         05Jdi5jFOrjasAIqgVMRHNfJhYQUfI9ueHmi9pNUhhX9wMBG4StwX+CzMGC7osM8zk1f
         Rf8RDBhUKdZyQUpKQHeqGLwawY7XoylH9G/Lsek8N0jE7Y8qdYewoDsn44ijTZwKj3wU
         CXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352158; x=1783956958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFu3+CLuR1Wqk1McfQvrk9SrE2yO/Tatw0kE1ejFwos=;
        b=iKrzkpSHgEcmqTgUeCs1s89wIt41JiMzq6YZsDHeneCLA9aOH3oFrJXFfe9GXoVu01
         SSuqo0kg5glFYf3Gn1mUorg1DadODZN77RPOyiF7Kn1KA6WaKjzoxAtuBJAUjhO9aZBZ
         TU650rH1qH15kO1jWqhe8A7XV0TvmvVWpZiN5mLu7Ng/cfv8zDukgFg7wiV04OBJoQY9
         G5XlmF61LOYGCAUHF7Ip/qz+Gis5veKf3mPLW1TvqwJDET8URQuWNB8JIlK4D13ixW97
         CZK0nUsHxOYb+8ZFZ1nR9hQ6Ian8m9VxLs8F2ty7ra1fNBKFaK2B6n61Uj4AjOrezQnb
         V8kA==
X-Forwarded-Encrypted: i=1; AHgh+Rpqez7cc1Kv3Kr6Osq5L+y+vUxyVASiKkeJN8x+FJfhMH0+5obrsyDJAGRS2CVNjEjkYZ1OH5Q7T2az@vger.kernel.org
X-Gm-Message-State: AOJu0YyhlbH0yBKsls/rX4TXCkGdchIP4eobTGK625pchsM0eZDbsY8B
	Whz5ox/47PxI2CNeT/NBqUNKUGDzvVPiItROqqmK2YKQ43iKWBqXrS3cDoxmUnttCsaUWobjtm8
	AvdtlKOQ8kbFlk24JTYUn5yYLCj1X26Nno/E6i86BjRaErz4KJo3LAcUX4doea1Sk
X-Gm-Gg: AfdE7cljhfoU0uuj73P6Cqr562qp1cnfRfGeyxB2QaPSIGVNWLjPdvjMi7iu25xyNCW
	ZX219rTGxpr4yz/revxzLV+ZlJ7V9SNvmz3VLFZ8VWMamldNckv2HPKAAugD+y3gTA3XIRso7uh
	vNZpmeLXGh+SojxNPWGanzxR72cfiAWlUO6oGde3KiI36eXBHSI1JjsErvYFUxrVr3I6nxbacKa
	DkmqrEsb3JPDZcw76P0yTIn+f5WndRiFqtQMn54wSxrShgGWnFSLHPfq/in6TF1jiMjY1yQEA4Y
	9Kcstf8MU5aEqMHCBEFKRNhSjxwomYp9fC+DvJoyPNeKaLMvBYFBujYgP57Tnj/FLR5GgQ8sMLw
	/Nx1ScvvxjvGB+QCpVQMr0waWUcHw3UCHVvc=
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr106810781cf.2.1783352158106;
        Mon, 06 Jul 2026 08:35:58 -0700 (PDT)
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr106810451cf.2.1783352157695;
        Mon, 06 Jul 2026 08:35:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6290972sm775556466b.41.2026.07.06.08.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:35:56 -0700 (PDT)
Message-ID: <97a4a44b-7982-4705-85ec-664838658b63@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:35:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL
 and related clocks
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
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
 <20260706-qcom-clk-mdm9607-fixes-v2-8-745565101869@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-8-745565101869@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfX84EV+sktFo/5
 r82j7n9panXNYZjA5fg5oJ2YJFDSaV2/AQzH1tADAtwvWpi5UGlOe8Vd7k931PLeTnwn+50tfvg
 sevRq6W3999zVVXe2M0yF9einJnInFV2fCXRiK6NKAEc3v29RrS86fod3k7ySdj+qe9Visp6wCF
 M/aus3izqRn/SymOX8yqv8MHFf0owit3mxo9ZUaIGj6FvBCWTCcxGOjP9mKyqih0hVQaiYYuyUq
 YeN7verSBtnYvXCaHl8DCuTKGXU9i529C/JwBqu9jQPF+iTNAN149lzycP5Um7GBRsH7f8SBO4g
 doryhrFM3S1wgPTifkgX24w5OjPkQDRAyWlin5A4M8dKsqSV5oZ5Hb8p5Gxd2q5GgrgkOI1kzmT
 WS8QCzu8SAT8VOCf1xxB4fdKJa5B4DJNvtscg4mNFb0ZPop1v2fZmvSHbrp3gnWtIE/clvBEY7p
 OKdu50ncKqej9YSv3fg==
X-Proofpoint-ORIG-GUID: weDwCcPfOFMK6Iv8vEbWceqV4qvhmK2y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfX63OjaiVOjQIy
 L8B+RqYr+HH4BNJ54B/A02ZkGQWYnB8e4v54WyS2e/Cpzh7hiRas8eKZDELztWQDXiAMkgtKNi3
 8DNP+orq9z3DgCMJbOKKRO5ePbU8GUk=
X-Proofpoint-GUID: weDwCcPfOFMK6Iv8vEbWceqV4qvhmK2y
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bcb5e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Sy-nuy6jZFkMOSGpH-IA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060157

On 7/6/26 5:02 PM, Stephan Gerhold wrote:
> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> match nowadays is gcc-msm8909. Looking at the differences between
> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> definitions for the BIMC PLL.
> 
> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> used for GPLL2.
> 
> In practice, the BIMC PLL is exclusively controlled by the RPM firmware and
> Linux should not touch it. So far, it was defined to model the full clock
> hierarchy, but even in read-only mode with CLK_GET_RATE_NOCACHE this is
> problematic since the RPM will silently change the clock parents without
> notifying Linux about it. The clock framework reads the clock parent only
> once during boot, so the resulting rates will still be often wrong.
> 
> Follow the example of more recent SoCs and drop the BIMC PLL and all
> remaining related clocks to avoid reporting stale status data. This means
> we cannot determine the rate of these clocks anymore. This is not a big
> problem in practice, since these are NoC-related clocks that are
> independently managed through the interconnect subsystem.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
