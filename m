Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161BF32E128
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782487267; cv=none; b=iO0mEg8vCbVBTwKBMcQSVpDMzAzu9cp2QKIH25GruaViLQTK4KKhAUuorxrsXAHFRU9jz5pV9WqUZ7HhKrN3XfxpFXrAsnZmUhoirMM6upzvzDyqYHXRL9DiNfdPLhyvIsi9vdcS03NiYSixqczHMesnTdxT+An5fE1ZkwlwbTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782487267; c=relaxed/simple;
	bh=ltF69OA17UroLUHIyRP59/gUxyGuE4XTfNICw6WzzjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3ZFWiHp2+5MYZ2VJWv7kCIxPIWxyCURWR1fENlcTIeBXk4L6PDIxpTMrG310F05dKhr7WJ0rYBmTFc5mxEP0jAk7QOHxhaEUXn6GlZwYz/52mbAEfso0djBph2jFeBrzIHnkQX2/zQxP5i5yUDwtBI5rsgjwImy3bLdRcGHLn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMyMKV93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuFhQAuF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMyMKV93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuFhQAuF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF3pjo1086776
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xsLefAcDlircrvxuJgRyUJKceptb02A05dP+2K8RIh4=; b=YMyMKV93K5L61CUJ
	RnXS++4Q5kEcgoNkQq1IDRQKQV09BaAaHqQGbhtExVfiBH7V196vgY6y2iIJlLwZ
	Z+/wiev1EOWfH2XDF0k/sXh2qNKAlVm0sw/kq+Nt3Pos2SPq3deHEqwXmh2uZn11
	9jT8ccJp/ntRjCewDSdFtxRIxnL/Qh4VgwX0bSC8TzU5RtmKAbfuPnh7LPg3vOoo
	IGvnKv+jXqRezr10fc3y1nbr2mL+SdJpGcVritQc+w2apuLlTSYucaLcwRoSNbyY
	v7kVpkrHuVs9dU3j3Lgz/be0Lo2UccLKqpmeThJNTlvK7Frff0nTxVPLqEiWXRbi
	wNxCbQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1j1njjjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:21:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-729420bc3c5so48212137.2
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782487264; x=1783092064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsLefAcDlircrvxuJgRyUJKceptb02A05dP+2K8RIh4=;
        b=XuFhQAuF8eAlWhY1uhqkkq4dAk1yi6mWGwquBdJEg/hJkfu2U3/Fe/sgVcB3VsITN6
         e/ImoP1Yse9CVN3VxcdtvpU1HOrpcMvmx/yF4MiZzmubxl6a1GR6CCrrSBB/CK1ZGtQt
         FU/Uk0n/U/wuH9De2theHaLImFr4XaBSvZ1hKT1OOcxatRGGFjqd8oihLAjUO8ZkNhZt
         F1l5x/wna1JAMZrtgwMCIX7Md1CAxyiZvRrIktkJjhQS8ELaFDnSp9afSnATZdxOVAHW
         q5qNlQ8ecoaC3IF8HxspSbev9RsN9rSYVqraAUm8g/4fF5GbZmje7BRyH3HvLBzhqHhx
         xWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782487264; x=1783092064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsLefAcDlircrvxuJgRyUJKceptb02A05dP+2K8RIh4=;
        b=hA2aJ3RYzyUyP/dhdVdeL9BZzakXlIMgem1Y3euJ7I9ZrpgdNxfNUIPGTDgmR9LTk9
         0UCUpf7rPcxLsbP6LyUSXxGaLfB9SayvAqW/fUpN1I7ekVhczw38SpWOc/ebJ6BFceZb
         Sq0aQ+mBsiiYRiV7kfVn9WPXeaQd2/lF5s12uZ/XA2dj2dzosePh5IkvgZ2AV21iuHU3
         LIXSekv5KEvlNiZByEmHJZy5fAQuh4iiDJ5WX8G4ioqyHrZDa8nPZK2fwcShj41+Z6oh
         M4uy2s0/CPxtViziD4S3ndQGKaVJyxkWCmbLGCYOdeMJ3NpUclkYvnow0bQgHzCSQsIz
         ku9w==
X-Forwarded-Encrypted: i=1; AHgh+Rq4DhyNQmslcp2/Mvgd3KCpV/emtJYwtkwimGv3BQg0Tde/3FW9gHHaAoytctOjkZtmvrD5IW/geR2l@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Wk0xaLRTosWkMJcp4Q9nN9Tv80wFzWYRTuIBKNXWsZx/4uXI
	SMXQL7W2LjdPmb3U8E63iMxaxipDbE8/Ebpi4LLhonEz2fMk+IfC0W3SuklGT2i/8MsHYgupL9I
	FioDvjBBNB7pEDnfakfMXh6JXN7uJZRWnEIQtK0amQcBa/Br6S2F4IrtDuT89pTKB
X-Gm-Gg: AfdE7cmRVD2m+WyBrcb2GS8lMtLOLC9ptVKakYQMK48RT8vvss/4FSFPs5pXfUgFAYs
	q3iaZ7O2xWGlAqTnhWGg2kGOZ2if1BmTaz880UJtCrgTWjW6mHJ0WX3+vo35H4awMKcoGvJwzUD
	Fv1r56U9dK3Jys362efWR+O/i9wbwnZrdg6yJ3NLeNKdCXJuRYrtFsKMCFvGjkdrv8ePgXHAOpH
	GMJwq0Zj5RO7qhwUhJSMwjuQjWICmvpYSdyDH9w3qM+P6xLbPFsAGdNPJq6fTGhmnfY/GQdaAIc
	PQObXUiDg5N4J8EvrdJOpJ0Qr/4GYXcQ3ZthKknuBwDfLiqOsH+Ngy7ugodS4fN5m1W4U8xi31w
	xluMolqS3ITOJYVP/ZNEL9kXW3KFID/Sm2f8=
X-Received: by 2002:a05:6102:cd3:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-734366bedd7mr1212349137.5.1782487264329;
        Fri, 26 Jun 2026 08:21:04 -0700 (PDT)
X-Received: by 2002:a05:6102:cd3:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-734366bedd7mr1212332137.5.1782487263890;
        Fri, 26 Jun 2026 08:21:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a7a6sm3475196e87.40.2026.06.26.08.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:21:03 -0700 (PDT)
Message-ID: <f07dce35-f807-48bd-a04d-76d69ae74f37@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:21:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix DWC3 core register size
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260626-sc8280xp-fix-dwc3-reg-size-v1-1-ddcba897b19d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-sc8280xp-fix-dwc3-reg-size-v1-1-ddcba897b19d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Am7wWIgLzCNSOv7-uRPao0ahbPwfTXcU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfXwwovSTBUA+R9
 bJiy/iu+2dvmVfefvEHRf68cHqRCR6tgGUqNqCThSOB3bxNks97xLQ/i1hngHZJoutaQVYcTStm
 eMhyKLsymHDbPqLnljVIrovWjQj6FxUBrr4fTCQNfWuSD7DH7MKK0ZzmEITvG/EC79LOX+07Ub+
 KzRltRfzrP9N7DbBiW/WpcPYN1X3e477iJ6Ver/jWzJ/d8bakcRIb+D+6OzIejPREiprIyMHXJK
 CZo/cyhIOz6h5HetIdSFQW9GgNef4V82OFJ8syGvhoyHNcm9cihSkUGPdUK/T/H1LC7RqJabaUf
 3XAkSy1bgDBoo91OeEyI2GsTxASnFQnAIYC78arYuNInD8OISmoc/mx6vvXqJp5XyRMxvz9krcy
 y5P3oDfQSwHTWOOCTvI1n27GkUnibIZ36VTflCNtPLuFZJAxDd6ZM8Ka4YFXHG4lGj0pOrnrDmi
 UxUA0a7xHZTSY7J6fSQ==
X-Authority-Analysis: v=2.4 cv=W+cIkxWk c=1 sm=1 tr=0 ts=6a3e98e1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8 a=8AAO5B-9T0azXVr5E88A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfX0pRBrGISzVD5
 dhqG76io91iOUA2mq82NVHZaAmjHLfBmkjqecXHyr/mHK3UVcDYHzuQ9X1npWCgkE+JpQK793hW
 VxxDGWdArGxYFAbmfEU4SoqZWQs4zRc=
X-Proofpoint-ORIG-GUID: Am7wWIgLzCNSOv7-uRPao0ahbPwfTXcU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260126

On 6/26/26 5:07 PM, Xilin Wu wrote:
> The SC8280XP DWC3 core register regions are currently described as 0xcd00
> bytes, but the hardware register block extends further. In particular, the
> DWC_usb31 LLUCTL registers start at 0xd024 and are accessed by the DWC3
> driver when a controller is limited to SuperSpeed using
> maximum-speed = "super-speed".
> 
> With the shorter resource, probing such a controller can fault when the
> driver programs LLUCTL.FORCE_GEN1. Use the correct 0xd950-byte register
> size for all SC8280XP DWC3 core instances.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Fixes: 3170a2c906c6 ("arm64: dts: qcom: sc8280xp: Add USB DWC3 Multiport controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index a2bd6b10e475..d06f79b7680c 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4034,7 +4034,7 @@ usb_2: usb@a4f8800 {
>  
>  			usb_2_dwc3: usb@a400000 {
>  				compatible = "snps,dwc3";
> -				reg = <0 0x0a400000 0 0xcd00>;
> +				reg = <0 0x0a400000 0 0xd950>;

Let's do 0xfc100, the QC glue driver already does out-of-bounds
accesses into the base+0xfxxx space..

Konrad
