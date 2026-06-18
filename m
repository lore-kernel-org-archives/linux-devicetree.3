Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FACA30F80C
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771140; cv=none; b=IVsNF98cdfb5VOqzIu2yWTwCjAns/mOvdQf+gToz4orObUlRLfZEqQtY1SyhXt5f698tzul6BQKV9p/Xvl75wHmlUpTXIqNFjsYeemARmku+HnjKvS/ETUttnE7DiNZBgYcsPR57rJOsQc6fX0at4zuHEDWb87v88wPt1FKAz2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771140; c=relaxed/simple;
	bh=pm2VtnvqcvMnJSio6ia4u9khRcw61jB8oisjRb+xz3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ+deHiRk+6hFqtZplZSB2VxafGQVJuc4k+dM0sxz50+tBmzLmg1Ytta7o5DTRiL9RVlgOi+plE94qv12y24D8Cl0YULOji5qiFgAVg6DVvPah6fBV9bHcb+UJ8Aj7Nn3TJJDdzsvHRwUH/raTNSjd774MlgUmRlsKGTCdZqRLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqXj3NZi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHd14Qbx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqXj3NZi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHd14Qbx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FRfi975748
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MeDmhxrvASjNeDkV1hsiBNxFRH8Rp1diigHnmLO3HNg=; b=iqXj3NZiFMBRoReQ
	+SkKV0A8A04bmQsPqJqGL1N/ACL2daDUgNmcKQgqVpNraxlQQfhnk5AEMwlPdLCC
	qezhLFZr7gEw6XuGnTXihm60nc7Xk0hPV2E3W9PMtNpBEuJTQj0ILiuDSa1bUCyO
	Q72SOsuD4ankMrubFUkAgfkZxkbrmjJkGMoDF9LOf8S0tOElPOovSnPmi9ja66sn
	iUivhB+ciTxVftZ5tMRg2eXDxf/D3oc3bqKtTT0Kf6xHFgvJ2vriqioAc6cWrUnG
	O7/AVdTqumsWxEoJnu14RzFUSl4bvEKS441ME9TXEUChVK+KnDOkw1n9/pyVTqF+
	V42tUw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc2av7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:25:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9160006de85so21830585a.2
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 01:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781771138; x=1782375938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MeDmhxrvASjNeDkV1hsiBNxFRH8Rp1diigHnmLO3HNg=;
        b=jHd14QbxcEVjbcnJKwM5XDQ2GDRy3YeX+x8CPQ3e5nikXFVVYsfcGI6TPqYQ2kFFgM
         ylyrV5L5gr9BUplxPCpWXLb+ScgxiRxeG91nf16ETiqcLAqA1iz3demvGRBqoe8LuQf5
         0xzpWO8shQQ+TVcTtCV0VXpYxWxEZJLqlOOs7yJzbxYhgNCbdVOHiIWURylANX3Fz8HE
         iCAbzj8VFDGKjhVZ5UnQitbJcmCq3MvYR6NaIAiGtiEJfTdpxM5B9kgqWt0iI7bmjrEL
         jfl1iDh3t4gDrxyXN1gAD/4/25/1GtX0vPzo4SkTfBWR/P/ZfqZGGodtn2OJSu14jPs6
         B6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781771138; x=1782375938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeDmhxrvASjNeDkV1hsiBNxFRH8Rp1diigHnmLO3HNg=;
        b=ZnRx+RX7ruOKshmH3FtjAVXrsAlm6xhhv3HAk63lzCnKJgeZUSuu7Rh6Yj7H9tOpLZ
         tfewfq8jNVMZTAsL5guM0jdQeyVriD3vzEdiyqYUAUQeYoChuKPQMqSBuN4kGpeQVmoi
         iC2Bd1tI0OvYjbemv2JU+vLZnb/6la8EcOazdjcXZPRMQMK6MNPXq6nvYVsmC842XBSL
         HlhoEYInL9Wg5yrQ/dGmes4WVhyR4mLfCgHeRILveHZmGAJ9nsI5SXmcVcluIkBhcKGJ
         zqmdHGl+JTS505R/lltQGyNzT0z4WUeXkxKDazzIsdczu1xQSnWuKLsd8mJW2FNIPPvU
         M5og==
X-Forwarded-Encrypted: i=1; AFNElJ+Oar64ockIdbIUYwXIwz6mzq3shkhi2q51S08hUrKbFuNHZS/L+oGWr3UL547U4PpFDJx+hSa6OeW9@vger.kernel.org
X-Gm-Message-State: AOJu0YyTSCDddf8e3lwGvqj4B+5r00V9GjPFDsfMrBHykB1q4HjYoBWT
	j/1p26m1hbfCvtq5LNTh6NbXHy3RLuYGxIzOcbGcNZq1cm/StvsIQPKqV/TvHmD0Rd1+PvcMkaY
	JqKKcCpuRmYuEIzD/UH51ctV58/EehyEAJ8kh2yvOVRrTjeS5Hx4PNWdN84Q1vIjx
X-Gm-Gg: Acq92OHXQExwgAr0pyXcX69lRpfpHnMm/mE+iWTnwexSeQC+BRm8CmVZFrdHO/rMxbv
	OyfhPuFT1wp2hnb/Tjmrq6/j2coUb8JFRp374ybcbWlZus18pnTcQEAAt8JCKBxkrpR0hN34biz
	aFBfOBi/XMHUqWNb4TwzxQi/MqR+euKU4u30y0tAWepgscMEGyCIoz48m4uc2e1WICoZVLhvEDI
	Iz7/U5nxu6QKINq2Tsc/PA75qmcyGBUcHyBzpRYPnOdqe5T22tN3COf5xfGeGvaAMpGUlGnWLvH
	k51xnoPtQWzP1EraF6UuWrYsI1MH9mZe7EsHXJlD5HgCIK2LiF9I0VDqwXZHhWTE7rpTT6lFiey
	6rbevPOE3kjMLb2ONgtgXsYfgldWcOm3DL74=
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr259245985a.0.1781771138031;
        Thu, 18 Jun 2026 01:25:38 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr259243985a.0.1781771137655;
        Thu, 18 Jun 2026 01:25:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6954c2a4450sm1871940a12.16.2026.06.18.01.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:25:36 -0700 (PDT)
Message-ID: <c039b31f-fc14-4a0a-bd77-dce00ae36eb2@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:25:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: x1e80100: Add deepest idle state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-8-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-8-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a33ab82 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LGoL8ljZ1bDskmoh4PAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TvkZr6saDQxRZFodKGgzXmZ9AVeDjuFm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3NiBTYWx0ZWRfX18SoFmMtyRnN
 aDobu4HqgnMCBfgH9Nv3W5nZNn3W+PRkPP2oVvBreL3J8rB0ynAcoZb8frt2F2P52J8G/bYAi55
 Hdm94x0PrWAybwpTHSP8+/MtF1VI3LY=
X-Proofpoint-ORIG-GUID: TvkZr6saDQxRZFodKGgzXmZ9AVeDjuFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3NiBTYWx0ZWRfX6BiYSJW9hbmb
 8/dU/qpNrmieOC3MArNHC3+fw1cY0OwN76Z999ur73PbuaxjvnYtKh3z3qfvwsP8oRPz/8/tPXe
 J/zzZ8a/KTJy8Cimuj62guyM4Qvq83UpKTqq37OhmtZYrt0ZNXg84oNlWbT6ggbLZ7Dyx/hHF3+
 EY9tPbVnE7yRzi+7wE35hDh+aQdadqtHyrpbmtLW44kcMSdO9v144OnN3XtWO4qpTR+NnI5R7xm
 onnRqC9fwOxyb3ldiaaFSkiGD/sryEt9/y7XjGFi7PKlf6nDBRM0PBU4d6Z7elr1WMKgJINgTmW
 g7qUh+EMWTQib2+35QRznLNAXTyf5Rn6uXm4jLFelvkCRtQeSYJ2DwIsqBgShoQ6nMaXPx0U+oL
 qvPBpEnHs5lplNYig1C9X+bxVDohhsQLcq0R7h7URnaEx8b3kjnoDGENZTjlYCpAuWxJhLEd/To
 aZiOTqQztIRzJbeuZRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180076

On 6/16/26 11:25 AM, Maulik Shah wrote:
> Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
> in deepest idle state.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 4ba751a65142..47e425003028 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -302,6 +302,14 @@ cluster_cl5: cluster-sleep-1 {
>  				exit-latency-us = <4000>;
>  				min-residency-us = <7000>;
>  			};
> +
> +			domain_ss3: domain-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x0200c354>;
> +				entry-latency-us = <2800>;
> +				exit-latency-us = <4400>;

The DSDT has "wake_latency" (presumably the same as exit latency) set
to 5000 us, should we follow?

FWIW, the 2800/4400 numbers here are the exact same as for sm8650..
which doesn't sound very reassuring


> +				min-residency-us = <9000>;

This number matches the DSDT

Should the entry latency then be 9000 - 5000 = 4000?


On a separate note, the DSDT also defines:

SS1 (0x02000154, total=7500, exit=500)
SS2 (0x02000254, total=8000, exit=3000)

These are obviously shallower states, but perhaps they could still
be useful?

Konrad
