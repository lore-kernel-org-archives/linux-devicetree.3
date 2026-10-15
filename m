Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBE9513557
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060345; cv=none; b=SeVVjM9HL7l6n9jcEmnKo+faddBwCaq9/m3PbH2z2y2JgK1ZODhQuwAiPby4kfH8ZrWVKhQI46GJjCMAXsvm8a59wn6coi99KWwTMc1+k66ffMe6yFGReKHPNNpCANwhvNUd7Pw5HNe5QIuJKKl5gJ6XEqPTVv6dhpp0LthQGrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060345; c=relaxed/simple;
	bh=BwzEGGlN0Cr4GFybOAnQmDAQNaVFm68oam3tFIqZVcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOPQv37uPcYBLfDB1IpZl680dpxc1ogJI4KMCmghm/t/ScjloOs0VsgQQ38FzeprAZtAynXcw5Grr2unaGTTmnxP0RxNWMc3stiC4Q+wyyRvkeOFw/ws19iMFVxy6APimF1THfGwtjsxkQZsIYPNdjhenLqBx7+Q6ApYv+gxpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3M5MG4J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CX0mvH2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3M5MG4J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CX0mvH2A"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jpMj3408892
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOqER+APW2quOl6eAUdj+IURL6XVEPDt5bilHrFyOYU=; b=J3M5MG4J+PU7QrQh
	jIjbJx0CX28k37jKuOCEZp6sRSxzBGkD5QuDTmJHJOXQIP6VaT/Zod1zddtMGlGG
	FjGMPa1dxSBqw7qSQjrwp3oz9zmDU0VNK0pjt546dg++HvfOWbrNhJIprJYQy0eQ
	53atIiLBYoK4Hf35xNIMFjtk3FcRNSj0rpzyKw6kJNpE6t0jQamZPnlyTga0sYVW
	f12IbSHk1vx3BFZJtWW0TAwaytQE22kIjdA23Zry4Yn/AEe/0JSvWMDDPnRopbGT
	AmIfJ4M6Ut9FSRJnOmxraD5HqToq4FQIuP0RjWjqExPuyhadAHv1lj1Oqg8ksFf5
	XYqMcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn29ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:32:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so3486782a91.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060342; x=1792665142; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hOqER+APW2quOl6eAUdj+IURL6XVEPDt5bilHrFyOYU=;
        b=CX0mvH2ATSmAF9CpZdMLhQUiUIKC7ri1+XLmyEFMwZnGCjA6LsGzezubvhOXansAYn
         idOErjyg7t23gAMB1Hq4T+EuaSKXeFvQe/fKR8cF9Z+IH5WbUZPZYSYnjKZ879N/DtCQ
         EFanKh3NmXBL5yV0meJYSQSk9hsFnpAkznykIkaG67vWe9AfrCO81Vf4D/f7XaQBJPgm
         ypP4BPBkJrlm4Lja5esqbQJHRaeLTAVB7Tv84s/bMfwFcmvxGrb+wk3oMKqBQv1gLiHr
         i61uGXzJnfjNByx/EhKAHm6PZjTWJOFO43atkZUhsepFmnjX2nI2WrcMMp9vsP7Yg018
         MHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060342; x=1792665142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hOqER+APW2quOl6eAUdj+IURL6XVEPDt5bilHrFyOYU=;
        b=hWsmSVpuw18chnyC9iQS8Y9tRSIxvL+Osi8ku4hSkosB162rLzRuYeI8ZRuVeMcoLV
         RGoI7P7L+3Jxkd3CVP1ap/zEp3RE4DCW4Gpw2KDc8hw63uXjig2rK50IdkhAqAa/3Hlu
         7l61pWKUNDgQ8cl1QItXcFVzETBwTgdOj1sa1tqVq6MIAkXclYnnN11e2HWHXGBk9Lbs
         IcLrbantTc0RsMb3FDujKwPmeJH0AYck4efBNn/UXBLICj9/nB7qI1xuHzcnKRF6qnQy
         G+aCX8k1ngHVWXSsvNW1PvJ1nfFkK04S6EZyxsXA3un5VMFCv+l/3GEwPIliDqx+9tLr
         dSBg==
X-Forwarded-Encrypted: i=1; AKwUvBx18c8CBPVpNox/YxRPFsM9SOoA9FjuV773YU4V1QogLs5rRpP2U0IMg2f7siDbqvGxQaYiFlAc5but@vger.kernel.org
X-Gm-Message-State: AFq9FYJVRlZP4mxln6Hv+i1NWJEfSVdgE+Yn2FypP1W6Tn0Tt+jx6bWL
	v6vpVrs120YGBC7A8H81r5+yVbgn6gqRKW5QEU0OTnt+REwFiJjrfCnE7gYL3+2HY/bThWGd+7d
	1/EnZ8SRcAJF/HzeRcI7EkoVfGut67Lj92dAm/71sOfvHB5iuVJwIyNlJGu5unoLP
X-Gm-Gg: AYBFou05b9kBDgO1KihweMSW3l+KMUDF+e5PmQoDDX9qt1Ar8JmPta/24iII23HViLl
	HytepwphT9AjemoBGyYmiiB9hhFggF14OPW6cHaY6+hE9xLF3OLaARn8ZV1hpMykz38MD9oDvCb
	ubncZFrrsu4BcobdlGnVKXNMz2fTXOXwelaKWjZvvWWdAoSp8+0sNfl5KHv5wgw2nbBd0PAN4um
	ThLR+5Btp60cmsLqqXHi5q/dPLT4CBWld93DGaHunKc2lDgVK3eyBSuJDNhu52flOKKYKL7e9qR
	o8I32ue6ZJAA218z+FpWP4v71nHNOMpY0q133vKn54YhymElhwUXxYGmBkb2tj9JdOg3NFBsybA
	bkvRbLjSjESFWBxoSVo8CQIBdtFRYZpF4pVw5xCCJIg==
X-Received: by 2002:a17:90a:d2c7:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ab3a99aa95mr16287920a91.22.1792060342177;
        Thu, 15 Oct 2026 03:32:22 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ab3a99aa95mr16287893a91.22.1792060341482;
        Thu, 15 Oct 2026 03:32:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9461d71esm3716055a91.7.2026.10.15.03.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:32:21 -0700 (PDT)
Date: Thu, 15 Oct 2026 18:32:13 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: nord: Add iris video node
Message-ID: <atCrrSI_XaR8Qe0e@QCOM-aGQu4IUr3Y>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-2-94428761ec06@oss.qualcomm.com>
 <aq_cmcYa1wL69Hq4@QCOM-aGQu4IUr3Y>
 <3b58ccbe-bf6a-4b96-86c5-584d7feeeb6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b58ccbe-bf6a-4b96-86c5-584d7feeeb6f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXxjOP1cxwXiZm
 JOsdAwpLnsnHY3vVTBLZ29gSLvfBjvYeIjmBd9dQCqgaiXtfMS8y8NfUfLS6jE5+C279smGCVx9
 kOtlGOm+VZorStNfxBWUNozhgUO8rQbxL00QhYObP1q5/2uvUYrMLriM+D3VDUbHERcsGkr/lLw
 YiQ8uhq38FTxISAhJAABRzg5RqUIN/lgIjrsRSnvwgrk6JYu/8VbpvQ15+c5KAd7d/pMuKETqvC
 wav5+fQAwZ1xdnikkk3Im3qgVOGQEo7SGgrHBOwZRNz9nF1aiMjryzWOXl3QCY8GTOnOeG/+KOQ
 dOibUAg9zHvZFeCDJmdZm0HOWJtLcaxwSj0SGDcwwv+VfiB2kcdcXRciqUcIR7Xhq1v9INkDs0m
 fluV3JtjvcdfTk5jmxfXKqlvGU5A6LPJiYGJu/wCqKIUOyPAmK1PJEocO57kXvomySRV0SqMAwY
 YtpI4zGyHeYjAXUWY1w==
X-Proofpoint-GUID: fbcHYfULj7h6GQWppu_IHlBje1eV9FEH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXwV8q/TSuYbhr
 X8XKE/XRzKgnhHytTC/gADtyDa2JeJHuATGhsReb3RawzRSqz8JKqQxfNaSUK1DBtvZKjL3ArH2
 rKLC4jK0E54dlh/KhQzH2xOF95YXXqk=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0abb7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=u3jKQLErjpDJdSScM9wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: fbcHYfULj7h6GQWppu_IHlBje1eV9FEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150041

On Thu, Oct 15, 2026 at 02:41:26PM +0530, Gourav Kumar wrote:
> 
> 
> On 9/20/2026 6:46 PM, Shawn Guo wrote:
> > On Sat, Sep 19, 2026 at 10:14:56AM +0530, Vishnu Reddy wrote:
> >> Add iris video codec to nord SoC, which comes with significantly different
> >> powering up sequence than previous platforms, thus different clocks and
> >> resets.
> >>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 114 ++++++++++++++++++++++++++++
> >>  1 file changed, 114 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> >> index 74f4e6be8652..03f827f3e5fc 100644
> >> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> >> @@ -1428,6 +1428,120 @@ camcc: clock-controller@9ce0000 {
> >>  		#power-domain-cells = <1>;
> >>  	};
> >>  
> >> +	iris: video-codec@aa00000 {
> >> +		compatible = "qcom,nord-iris", "qcom,glymur-iris";
> >> +		reg = <0x0 0x0aa00000 0x0 0xf0000>;
> > 
> > nord-embedded.dtsi is a place to accommodate Nord Embedded variant
> > specific resource descriptions, like clock, regulator, pinctrl,
> > interconnect, power domain, PHY, etc. The rest of descriptions should
> > go to nord.dtsi, like reg, interrupts, iommu, dma, etc.
> > 
> 
> Iris depends on providers such as videocc, nwgcc, hscnoc, and mc_virt,
> which are defined only in nord-embedded.dtsi.
> Moving the Iris node into nord.dtsi would leave unresolved references in
> DTS variants that don’t include the embedded file, causing DTB build
> failures.
> We should keep the iris node in nord-embedded.dtsi.

Could you read my comment one more time? I was asking to split the Iris
node, move descriptions like reg, interrupts, iommu, dma, etc to
nord.dtsi, and keep clocks, resets, interconnects, power domains, etc
in nord-embedded.dtsi. Take a look at the existing device nodes as
examples, that's already what we are doing.

Shawn
