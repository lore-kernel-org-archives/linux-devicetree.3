Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A273BCD0B
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517678; cv=none; b=Ej3hmglUdb4N3iGATeJbeh8xHUYUsakmZ7cQgDPe/ApdBMsaFiwCYxZfmcwixwpslVUu79VDzCuT8i0jz1KxPaCrhX5InQYwgXOtihfJgUQjnNchI/AKcZlBJb8v2gzHskO1QfPMhl1jqpuIqBkn4n65/P106LQ2bPUgctLtZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517678; c=relaxed/simple;
	bh=Zsk8ft04qdvSEdnEA4d3lHI/L+Z01W2/XK/UnHgaOSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTkVZubiLO7m7OK4PgaeRZKPSaiO5XVLUNVyoUb7wOltyFIPll+qEsqn6RzQuxLAIlf5LcgqTnDoPzsPqyn2Lkn/8EKu0dDEPPDB5CDgc/9SCwh0CsSsug+AFL+XeQ9FPHoYNk5j7dEgbi1Oxx3ygdrMHYh81lE0xOdthq2bcHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjNyiWAO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDz87b5Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjNyiWAO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDz87b5Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68R3htUk2734384
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 14:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32qSM6gqzXQy8rRCohGgscYGvz9tnM3yqJODoCorV24=; b=JjNyiWAOByR6I3a0
	891btXWw6iBzW1HUOVP2jwu42IVDOUz+PvRzocEzuPCJzovQidketxQn8gmwEik3
	TWuOJDp40dyQTqwNh3tz1j0HAlFz3Yef5qI3/ZlYRC8x05VS7Lc36FSUi0xOU324
	LERLxFnE9du5IhdTys6KRp9lViyhAPtUnXe5NjTOp05jvOQn6ZqiFhJ9NiNAnH0P
	UVdLJmdpfcM7BZFZMY4bQPQOLD6BkeXMDsfRJAzle+oaCirE8sBfPK90YcDdk8PX
	FrMZIcXxQQvcGz8qI2NySX557IWKBJ2v6RSQuV1hBPfcrUOjBSdDVz7+fox+C+fq
	/hW3DA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfuc8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 14:01:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3437d0cc8c7so2058825eec.0
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 07:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790517675; x=1791122475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32qSM6gqzXQy8rRCohGgscYGvz9tnM3yqJODoCorV24=;
        b=SDz87b5YhT2HO2Iq1qjVTA+73aQrzr6lzqThZcAQ5bZahqvTGvsrWv5UoHovu+pJB3
         f3ZTo3py85Vu7QQwFUI11C3BktdNbdghld4EV3tPJ30xyrveED5v/rRvW8llUu8meYMz
         THBiZ0Ium2ExVHiJ9SjyGeYJKs7i5HKAGnlL63T+3beDOv7jxyJDIx5tUxVdcF344ZSd
         EHrdxKvltg5DByRkhZeM03nFY8dKMasiTL9rZ5ige+u5KLzCnKYbKck0V1mrxjCcqVoB
         dSw1i8RCQuWWlISkwqPK3MAaq4lQvnBLWhq06PPYSOC7o1bb3Lw9IfoDse6A0Hw0pxQM
         ajIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790517675; x=1791122475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32qSM6gqzXQy8rRCohGgscYGvz9tnM3yqJODoCorV24=;
        b=frlSyPWbk896D/iJgwLFe/Piy64nXzca0dAsHYUCdATe2lRILVDjajfIS7yBJ8rWpz
         S+pOivR8p37TQIrLUe8AyYPt5iIFp57S4/vSv3Kd15bgM6fvN+UhXp98Moa/yUm6XxAP
         fy36ZCVh+OQRbEswWgmFEFhl/MRduCV3s+9aQgi4CVsvgC1fjyyOPjoz+W4X0MNknYXu
         pJhEAr/bOnntY0i2MEQVOyyQHSCPpSqAax6bmrF3tBfvXE4z5+hbwR33Gg0D/7XUkvNq
         GbIdvqFyZk2PjRthgUTPGtYc30wKd8MQuggp8la2XkkcB10C5Htbf9CJF5TvgmW8PtHI
         pW+g==
X-Forwarded-Encrypted: i=1; AKwUvBzWAJR0Vw9T1FRctyFLYvSCrPV7nZCZLxqNgNUhBaX3zXu5Kmg9vN1BH+ZUllKU2zknsfmOcTACg0sS@vger.kernel.org
X-Gm-Message-State: AFq9FYKmSKAxC5LxoSES1Em5u4sPg8w/dfr+ELBOmHaWh1cSJkym/NrB
	UYeORwQN+xbxJoIOf+kpnlVF8sQ9Yw6e2Wa4IB43EG95YV3E3e73VSnLl98m2rDx64sxKUIe3mR
	7tXvqT2948wOu6uj745V/aEiwa9Lb5cP/BZ3lYTtDSB+FmPkh9bu9G/qWCYeVi0tW
X-Gm-Gg: AYBFou1vK0I4EEVqwhqHw9W17WJGqshpPZKI+DeNETl2JWoR5d2301M8qZ/CJhFBXMM
	qLSInCNdgyTt0t6XZTbZ6qFmyoMvchXfJqN+iHJB/JKQWkE7f4BgpSWWZv6PIr4p4ZWXEDuZm+a
	CjAO/AqzJ6mKPTLNCNXVWwq6YyNbDAUEFeG3LLvCwfpKbhWnjUaWxqOl2oLWHTnxl6fQc78/72X
	9ldHk9UNQ0GffYzvZ5h7AOv8y7t/agAsDCKC9rUQnWYwRKL6dNZsCF8uPonJFTtbo/2dS+MoFUV
	sRc9HUxdOxgPTlRO197fDZNKmE5KnD6zs5+5Gfq1Ldgd//pWC0EGeW7suN9ktyYI6YHwKSSCFw1
	zjvNDsxCrvhbk21/dgnwtWk+nHlk3dybVAZr9MEMLSmM=
X-Received: by 2002:a05:7301:b05:b0:33b:e842:d272 with SMTP id 5a478bee46e88-342705b97f5mr6074697eec.5.1790517674483;
        Sun, 27 Sep 2026 07:01:14 -0700 (PDT)
X-Received: by 2002:a05:7301:b05:b0:33b:e842:d272 with SMTP id 5a478bee46e88-342705b97f5mr6074660eec.5.1790517673774;
        Sun, 27 Sep 2026 07:01:13 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3433628f5basm12850921eec.18.2026.09.27.07.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 07:01:13 -0700 (PDT)
Message-ID: <fb7b898b-441b-41cf-89d3-1d513730a75c@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 19:31:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: add reset to SDHC
To: Robert Marko <robert.marko@sartura.hr>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260925191706.1579990-1-robert.marko@sartura.hr>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260925191706.1579990-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1NSBTYWx0ZWRfX1r0O4SZsjouJ
 6RjVIuQfGuzbcDzEJUJwmgrmMxrIhpxcYB3SjFnYizGWq47BrEK+BvXIQIm35cNz8cZ5k6MCsGB
 ipDJqQAx0Dk9iYz3GG+D3mS2vH2quNw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1NSBTYWx0ZWRfX1iDPF3Zrf46L
 cLoleiU4132R7SSe4B9eqVFet3cSDYKdn7E7gCZmBtf5rJSMZAD6htG1p3ypPUlFye8K21hKha4
 o1C19P7b+vBjw5ZUZS7wj97RHj0uJHFokvgPG5jU8XvVnIjd+dR21MejR3oAYlvA7/NQhnLupLI
 DTXHggIhTJHH/YaX3C4RpXPjFJw/rRkygn/gz6uxWY4KEehlkmXDrEWCtTdt1WBX+a3Rd2+DY9Y
 ofMeus0Rozt1tBNS7BMHhUHd4uiAoYjrKdAE3n6K8vVTZpAJ+5GHq2dRluSchFs5IsC9ercqqDo
 FR2Bf1Roo+nhlPaPIVl8SzDQFNepMeSKHoSopn4oakvjAbDbJpDtz37vsSiLgojJ/PD5ulRfAJ8
 Ji7LEFUDVsoK8Re8nWVnU3RebfT2xwP/RKmRHyT8Np77/7luEVisEgxM5rhQ2ojSh8yeUyDnhwp
 iWr+Qqmzkac4XWmE4kQ==
X-Proofpoint-GUID: yehYPzR8Tu46g55aPeGApU8SR6Yue1qF
X-Proofpoint-ORIG-GUID: yehYPzR8Tu46g55aPeGApU8SR6Yue1qF
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab921ab cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=M4XmOyF+KGVEWXraXaCqgQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EPIbeGyanE4VvX7pOL0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270055


On 9/26/2026 12:46 AM, Robert Marko wrote:
> Add reset to SDHCI controller so it can be reset to avoid timeout issues
> after software reset due to bootloader set configuration.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

Thanks for submitting this. Similar change is needed for other IPQ SoCs 
which is in my TODO list. I will submit those changes in the coming weeks.

> ---
>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 5a5bda5f21a11..ecafd4cda6e7a 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -471,6 +471,7 @@ sdhc_1: mmc@7804000 {
>   				 <&xo_board_clk>,
>   				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>   			clock-names = "iface", "core", "xo", "ice";
> +			resets = <&gcc GCC_SDCC_BCR>;
>   			non-removable;
>   			supports-cqe;
>   			pinctrl-0 = <&sdc_default_state>;
