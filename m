Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7431390989
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 16:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640709; cv=none; b=c4SQOxNR13l6mxSRpwn2TUsSLmrfdXK9PmCQUTDfvd8BdGEn5a5dbE0UU9ajPH+GbjPlxSDfSfyRczc+X0EsyN31sNMjKd1oalLlVZA4c9DOKdED4VjFQC09nzn5UQUw+8SgJgi+f4odR6OqZjfhq6Jeu/7UzbJpisSeX+SWdqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640709; c=relaxed/simple;
	bh=nZ8uD2E3cWwF3V8jToxtNK3Knu4/IB447jIT76/zTbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGSDgt9aN1cNvdeEEXzK8o3a4a9qb7Mx9BjQCqu4TE9V6+XmDwuI7K81+ch/rf5oqAPrIo+tkV52HlUij6EVV78pJd6HaAalVjPvRubDWpdAwTJlthrsTBZjHJRVEn5vP7PwzhgVww7ZlIQhEM3IbMdYyW0214AphC8ikeKUbf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIrnan5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jydSDTqu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIrnan5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jydSDTqu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OErUwq3628088
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 16:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VXsbIGfE/YGMhTf/DNGAiwi0
	TECdbjhbag3+7cTDv9k=; b=SIrnan5gB1jAJWsSJPjwGzlEU0sRG+SUfFPAS+dM
	PO4mUtGh7aP2yIIRTd/2B983/QN26DJ4MFUOzvmlHzPKXfr7TWI3r04JceRo7MuK
	asr+XPAbJwqsR9JoXb1sNnqoH7v/O6boHetmm+IB8tE0H5bYqFXCLIqp1GyS9Yk+
	ZdN1MBLNDIhfMxLqWNEgpiHk/L5ZL93RRpqrxFTdfNnlnj4bgjoWh2bJ0WlP/45f
	VXPARvsqhPyRPf3bB4FtRVKtXw0+9veBnNddzIpLGu0f0vKN3XR2lQF+VAkvCd0i
	3DN9IQoMugg9yW7WmUKj53uzvsfoz9uk6TOri7PIF/tP6A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386krun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 16:38:26 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63136c0b6fbso13886856137.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 09:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779640706; x=1780245506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VXsbIGfE/YGMhTf/DNGAiwi0TECdbjhbag3+7cTDv9k=;
        b=jydSDTquhS7dpPhv/Jlh3Mx/zr8ZF3reyhYoIN/qorwnYcsLbzSuT54i/JVwzZu37U
         kkN4Cp3bDb6RHw+gqudcyS1Jms3yt20u5uLVSh9OyvlGPWYdUHj7GNiNtNrngIWfrMX3
         ApbC/gLrjFUGxycRPbsOQId0sZoqf8IuygOTPx0qA4k0F27hfJJy7uTW/HkdAvLqvih3
         F1MQ6qUne58y3ZdvUHNjPfzlvz1kKhPNlldO2XzUbInojVASQdOqu1N6yKBVPcRkDvNY
         qv11+HSVprof1zeFWtJJwpU2idCOd4AiFKO1Ekbf7XF51ZYEGr8oHpyHD06I1h2V4rsh
         ir5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779640706; x=1780245506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXsbIGfE/YGMhTf/DNGAiwi0TECdbjhbag3+7cTDv9k=;
        b=Z40RNEFfwFUpsfubtJp1h6G/0NOCa8rUxSTsUK+G++lxo7X8vg+aMMjvwkM5/aUVJH
         GT2Aj5QlQimkAZ+/er/cQhfGN9paCSgb1kzIGz9i80h66N10iLgf1Hx+UFb8ociwwPlX
         sm9kj6C+1V6I6W6Z5nu2qWRimtyItYtTjbVb/vu958I7198lXVhwEly+AnykQehqHUSH
         6xBfxRa+wgWFpbCDFjqKVJbfb+g4eKgFpru4ouQPFrXnT1ut40s2sF4hTBkVcb8tnB2a
         60Av6o6zuKUevfUEn6rrTGRdeL+HRu/baW3ngpOG4UbJIw/7+Z9trHVulkedYNMSFzg8
         hF5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/kDpXTE4H7sCyWM3keS4GRhCoI1GcpWZZOId/biLIbDtFHOwwd7QrHzvKKBbevZydauwczd7SeRDIR@vger.kernel.org
X-Gm-Message-State: AOJu0YyOp449PtyFhJMVxKRE56Lppvvi81L4QI3Dh4U4ChoD9gf0Js4c
	0owyyrH4iopCfhsGptAvu8mov5mzXPYDDC12bNWlJ7J8YOs/Y57ykpnkALeFeZV55VrDn5g4k6H
	i/wgSxU+M9mzvMVufwoIpg4d8y6QfSPF/oElOyyA/2OHBhKXuVomW4NTp57Xnamkr7d+ujDNH
X-Gm-Gg: Acq92OFpKax+oD4PLhdQGJbhLw+nGExgH7q3YL9AwpWTH3SPz8xorlFi1Fcu9Bqzv+Q
	QXSt//1suMD0lgNplbOiYcz/tRGdUtd9lrIgBZc/BonqiLRJlMyj2M7YJDXonyvNYE8wGsRbeGO
	RrjN02/pn6yqyeEWWLVNR6NRvuiiIJfww7Tw8kerrTC1UW42MzQjbfgwxbXVsNxHrXiQdsWwvfn
	id3Qni5InsLaGCH2AhJ5bYRpIgZ4KfHPHplsKHfyJ6RDV2FFr4bxHND8EUAgm6i2Ympo96Q01Cu
	7D1TuK0X59eABcGjS0is4GX/utX29PAFHaPRWYuF7b6imKcMhX9rA3MQ9xOz6OkSonKK36+fBBQ
	s1kejTrrN3RFMsEUWkRUCLUXcsnNgODUKR3uq4gzotG8KzVvGIEy0iD0muyZToxTxhmZRR08Aob
	VYzR6Poo1sQ3KVCa29StRvAveexRoimJCe9e8=
X-Received: by 2002:a05:6102:8641:10b0:631:9366:da89 with SMTP id ada2fe7eead31-673c31671d9mr4237854137.8.1779640705990;
        Sun, 24 May 2026 09:38:25 -0700 (PDT)
X-Received: by 2002:a05:6102:8641:10b0:631:9366:da89 with SMTP id ada2fe7eead31-673c31671d9mr4237842137.8.1779640705537;
        Sun, 24 May 2026 09:38:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cc08c0sm2020669e87.36.2026.05.24.09.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 09:38:24 -0700 (PDT)
Date: Sun, 24 May 2026 19:38:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Graham O'Connor <graham.oconnor@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Add
 regulator supplies and disable EUD
Message-ID: <hwlkksr2nbarur6n7i7gt56ghhuxxscaey2idff75cx2sthsqz@cd52yzmhyybp>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-5-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522060645.4399-5-graham.oconnor@gmail.com>
X-Proofpoint-ORIG-GUID: A71pTKj58XX6KKubs9Bho73U8JN_LB6I
X-Proofpoint-GUID: A71pTKj58XX6KKubs9Bho73U8JN_LB6I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE2NyBTYWx0ZWRfX8z46h3k46kxe
 NvzetvxRNx3vykOYHOWwbpyMXBUe6im3X4YhlLY+k+YQQDbkvZv6LQk43vBfnc04wsg2Ym2tNpN
 zJ84Z5ZyPxbdFQ+SJ2WKMw7LTr9NMs7kdhCR8SGK8htEZWCm7b9fa7PyrfNKd86s81BVkmbMmYz
 i7n5LJ/jebdiUvoUCtDijIwXz/kZ5WSwdTAn6KeXVFiIZCcMmiGbtkf99/gYXzchh8Jk7EZhJQP
 oP45EFYxINfKDKvM7jIOvTK7SrgmtEquPinJY3oziYGfgp6rNQMnqVQ0ZajLidkWcWKDLAyzYQg
 UnZzzoQMJcBl0vwezMDqlAhC6OUq+/Od2GJ9EifyhpO5kAzU/R43ftlTn+BmEJ++CZ2ZirolqWy
 aooBd2QQzGqpz7icH3svnaHUtnGKDnICZVbzt3m6vrCvPDlOVwVnWQoMq8Idx9iIr/jWEJIOIHQ
 SQSVwOgAZ7STCDezcRw==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a132982 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=xsPyQ2l8_84pY8PHn1gA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240167

On Fri, May 22, 2026 at 06:06:43PM +1200, Graham O'Connor wrote:
> Add missing regulator supplies for qfprom and the PCIe controllers.
> The qfprom node requires vcc-supply for correct eFuse reading. The
> PCIe controllers require vdda and vddpe-3v3 supplies for the PHY and
> connector power rails.

vddpe-3v3 is a legacy property for specifying power rails for connected
devices rather than the controller.

> 
> Disable the Embedded USB Debugger (EUD) as it conflicts with normal
> USB operation on this board.

Separate commot please, with the description of the conflict.

> 
> Tested on Radxa Dragon Q6A (QCS6490)
> 
> Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
> ---
>  .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index bb5a42b03..4003837ad 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -1093,3 +1093,23 @@ &sdc2_data {
>  	bias-pull-up;
>  	drive-strength = <10>;
>  };
> +
> +/* Provide required regulator supplies for qfprom and PCIe controllers */
> +&qfprom {
> +	vcc-supply = <&vreg_l1c_1p8>;
> +};

Please keep the nodes sorted.

> +
> +&pcie0 {
> +	vdda-supply = <&vreg_l1c_1p8>;
> +	vddpe-3v3-supply = <&vreg_bob_3p296>;
> +};
> +
> +&pcie1 {
> +	vdda-supply = <&vreg_l1c_1p8>;
> +	vddpe-3v3-supply = <&vreg_bob_3p296>;
> +};
> +
> +/* Disable EUD as it conflicts with USB operation */
> +&eud {
> +	status = "disabled";
> +};
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
