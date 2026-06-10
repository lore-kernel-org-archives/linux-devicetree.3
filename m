Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C169408634
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098154; cv=none; b=hcnRf5UL6XWn1gS7xDXFYm0sTUygw6JVwSs8yZqVykXD6NcuN4L8hLNTn2iNkQxTf79T4HIdjeUDSQn5jTJh2ppfTQcmaRIwCWvQzvxG+KAjLe6BP6iPm/MQ4Mt75YXb/j87aJKLFcWmsoC7T2hmy+JVPpAR98f8eb0dRHlvMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098154; c=relaxed/simple;
	bh=XlUfeydIkfGOxP+AXkc7DyRx4OXIbShc1WzhxwU3BzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9CcthLWO1qY8SjR00UeOXndL4zi3D8Aw0//1WldqY5emqnPAEC9zsmCqhCgVfHoHFh1wcFpbdlg3BFlvY6YvSbqriqC7sg5+E4lWQQ2+UYEvdaj+qr3Hu/EEhDpEOJUJrehoY9/p7BM7MF/p5sRw4/Cls1cBvx5FEmK+m8Mbog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJ37jiM/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHjlDsmg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJ37jiM/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHjlDsmg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCpkR1598846
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPBM2SY7J2ytmLbs6zwvhphdQ1vF34NxqujsJ2DX2UE=; b=aJ37jiM/IY80OeCg
	Hnhd5j5glOLnWr+Mep0CMHhkt3XDyue6UNjvUXC7xmLnhidk6Go3htheIyIL9G+l
	WqemQ4PphBO6vCSo9Zs3PLnAjzWU29BUCHs1pnrtrePguM0uMGB05UGYbHSJr1Tf
	1B7Zf/4pqYG4gjFut4scG1POUaqEuXHHRSIJjsIJBmBnZp3My7ci14jne3Xuk6fF
	v5wLxt1cBJYzjdFTNfwwcd8ruMvEayoEkTDJ9hPJDYMsZVhLAFWjdg3tSXiIW4NW
	KA8ffAsa3B5add3L1f1bl+j1yTjHsN0PcDmNZY2kw2IEPvsQ+U0fHSGJnQdGVVHR
	d1pc3A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2sehjyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:29:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51768e1d798so17323031cf.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098152; x=1781702952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oPBM2SY7J2ytmLbs6zwvhphdQ1vF34NxqujsJ2DX2UE=;
        b=kHjlDsmgZNIXGxqsV/IAQI4XsaGz6xoevcaFEDlRzrRdeNRw6fzGgcaLEtgix62DDD
         lWd9GxZdJp/WYUTq7FoCob/KYUr5v/OsA4ZPAKqmBrr/J9W+LwIaOJvfoN3fSr0ZFz0M
         N6+xGvpCXMRfUr4nHAb8Ut99r20/Vk3r13RQ22JgavI2c2a/3rnDb3PfKwxUfRuF/hFf
         lUjVU0DeOpc2oeY5KPNV7CFvjQ02rd6b/IMaYlhEVpmzP4yjCFFOHOy5bB/aBHjkeu0b
         3wLIlIaJH0nGjJ8c4aws1HTy1QBVPxEx5GrbJJ0kX0EwdlXSox3hPVKj90X2YI7MzTi4
         oM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098152; x=1781702952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPBM2SY7J2ytmLbs6zwvhphdQ1vF34NxqujsJ2DX2UE=;
        b=U3dbAubsVFpOSJxFzeejHPjWBI38M5Jp1Z7wSlMJh2rdXxvi1XfHvaFWGpypzWWQmv
         ahOW9u3S03BmWBo95I9Q6ImOWW0XzMpoi8EJGto9y1UhkVvuPzWi26Cm0LHTTQR/EqZT
         SIHuLn9UwccNk5l4pqdTk+o25IF1P8viLh4hwKB/m5Ly8C2OteH926AturZ+muHbgjfe
         J7RlmN9SMvJTSAXqsBvMUPznGIQEy0WIbf4bV00p2IQLvU1auvCTKSb6+hQ+YDHptXcq
         Ac4zkV2tLaD7C8RzPjph18p31Lm73+OcqK/VthjkVjpbec4acIYCSWXyoUJDtd3XgbGf
         6sZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HmeumqSWh7lma28Fc0JDoGvWUknGZmnf6kNgkOf5dvJkkQowy908uTn2JDmyhlTbE1Ya1/TrPpAw/@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJvXEyWEv/IrQ7VxQKZVtnnb555Fy1jSUtjo0xL/1xPzvhtZ3
	Yxn1BdFYsSFbgCmJOeIc7qb94/CRuEDpkvUkjBCPbT3+WMUC5XV73ODRopw4aXD8VVE2oPAnJFG
	KLmhBCErhHFzCNENJS9I7V7GfaVL/9kT1nn6cllRzWv/NcvakBNANKvybv8a7fiBn
X-Gm-Gg: Acq92OHQSTv5rA+zjkmvjdspsOKz0YejkOt3T92jIHQDjLa989Osz9gJ91dV6f4c1Ab
	qFAudYqIaK2/V8P3dj8I6Nivps6VI7oRmMLnf+Qi4JHW8M4Edxchl59KMBnk4emC2W0M1r4xf7o
	Po+D0i26kSKguH7rJq0CE070o6reY7Xh3QknrZDoanRp7av+M09BlOh4an7wHAywbME28bIxXf9
	gw4UC8DJjVv1s+gFFIuV9BuLWerNfc1xcTtIjeeu1+ngw3A+0P6QqUphEYmWr1RNxVy0R9oSs97
	AzxxfR1spa183FsQ2xsHTTgKxM+bKNnGF1ztSeei987hdJShfsNFi5GTl73dDq5x2OS6BMo1OiC
	Gcj4pHtKN7sNvL8Uq6cnT43rRIAtVYbbUU9MXPXjtWioQwk4HF/pg3j62
X-Received: by 2002:a05:620a:198f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-915a9db3db3mr2313110085a.6.1781098151448;
        Wed, 10 Jun 2026 06:29:11 -0700 (PDT)
X-Received: by 2002:a05:620a:198f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-915a9db3db3mr2313104985a.6.1781098150880;
        Wed, 10 Jun 2026 06:29:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm1196208866b.38.2026.06.10.06.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:29:09 -0700 (PDT)
Message-ID: <5759d855-e365-4aca-96d8-cea2c4ff630c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:29:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] arm64: dts: qcom: msm8939: Add venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
 <20260526-msm8939-venus-rfc-v9-6-bb1069f3fe02@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-6-bb1069f3fe02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kH1ow8_sMhIMh1sVWU9gvZKAHAS8S9Mp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfXxzniqE+JImTQ
 1DTI7sN3lwEKoW2dput/vpuEC8jfb5D92YF43P5DyKOLLP1OrQecaRPdWBNVtipxvCayGiS0CMn
 EFcOAf+B6biFXXT0hqmxNRlYTrF+0SFfvTy3jIuh8xi99PuR4YwPLFuqmuMInYwKfp3GVhnBo9d
 g4Q9YuydPxEE1hAm/3jl4KgIgF3mfbNX24saykqfILgZ/Cil3yEuGT81EuR/dWt9TL8iGF2z+LH
 KOZowMeGeZvhWUFnLF4ZtAvDcPtzxYCl3Rq2e1Aet0RJl64+9UHEUIMbyiHvhgcbJHFKIadIGhl
 3IRekBVT/10VS8V5/3f1Z9Ki824Ft58HbLzEm7OILM7Y1oIgFilaSZzn2z4pFOAG0swvDXTDmJE
 g82/OTjRmBYR+Z7JGiNAhfkylaKWR5LMRQ9BKjwDBvEQESuLoMK/Z1KAEHap6wOtE5132zhJzC1
 Ed4O1kYXnbBiiovIKQQ==
X-Proofpoint-ORIG-GUID: kH1ow8_sMhIMh1sVWU9gvZKAHAS8S9Mp
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a2966a8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=HDjIzE35AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=s5tj8q4C22HW4gDRz6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100129

On 5/26/26 3:24 PM, Erikas Bitovtas wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Add DT entries for the msm8939 venus encoder/decoder.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> index d4d7b0c9206c..71e22584a46b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> @@ -1627,6 +1627,29 @@ opp-19200000 {
>  			};
>  		};
>  
> +		venus: video-codec@1d00000 {
> +			compatible = "qcom,msm8939-venus";
> +			reg = <0x01d00000 0xff000>;
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
> +				 <&gcc GCC_VENUS0_AHB_CLK>,
> +				 <&gcc GCC_VENUS0_AXI_CLK>,
> +				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
> +				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
> +			clock-names = "core",
> +				      "iface",
> +				      "bus",
> +				      "vcodec0_core",
> +				      "vcodec1_core";
> +			power-domains = <&gcc VENUS_GDSC>,
> +					<&gcc VENUS_CORE0_GDSC>,
> +					<&gcc VENUS_CORE1_GDSC>;
> +			power-domain-names = "venus", "vcodec0", "vcodec1";
> +			iommus = <&apps_iommu 5>;
> +			memory-region = <&venus_mem>;
> +			status = "disabled";
> +		};

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

in case you're going to resend, please add a \n before 'status'
and make power-domain-names a vertical list (like clock-names)

Konrad
