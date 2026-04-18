Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666282FD68B
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776526484; cv=none; b=bcDAeROwGOkUOALBCYmOanrKJH8Di6dpeN4V/K34JFmSllxLlTd8MX5MXqYUe9wSsMQExgX2q0FVeFgMYpV53C24SyzFoGhicczMuYzLu7/iMKq/SMO089+LUuncwmMoZBV7oTIf85FU9mUz5pl9yqnIoWK6508y8QEWrJEKFQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776526484; c=relaxed/simple;
	bh=TPzN5DMU8T/18hixWg+6FbE+3zhkzJJf8xccVhqSMfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKrrzi5SmhTzB/NWZdGWIDC8cRdnVEItP+nOVSdp0M1SgARx1jt1QaTKo/Qrzei3MLah3vTJk87lO7iOfNr0YDuABcE8vRHmBvT0SL8DwpH1LZ0lpywxfEXxK4FYQTbwdtIjI8oec28rP1q4HQoIcdbdCnvdSNDd9xCk3o2OojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2sPNMUH; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2sPNMUH"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79495b1aaa7so14781927b3.1
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776526480; x=1777131280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NhKODv+ebTXJdAnj2Ac0AlyQFoZRAIerJIUSEYuuE+s=;
        b=e2sPNMUHwQKNFxBRt9bexCJ7KiZUbIjPEp2KZ0QTgLwoeUhdJAZDtlQ3wqLmm9ftq4
         9AYQRdBbeOKzg2VMOaxw4iNCTkrADpJAY16VodX/oxhSX1kyXVRpTXSxPAUd5BCPhuJg
         sAH8Ee24NG+6UJyXveWJywzJiyz22ktRBQsD98lLstJ1+yTdVXMZYuXRpHA++lp8mdK1
         TfcziVZqgAtU7Jd57bx46JWaW3FQxYl8LG6ywgiI+EN1jyzQAaaS2GQ4BHFxESFoLElc
         yaQiSwCXP/cqy3qlRAktz3Q+CuOx/uvso2i/HPRkQ8yh/a2auhOegn6U9ENP+FLKOvDQ
         GdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776526480; x=1777131280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhKODv+ebTXJdAnj2Ac0AlyQFoZRAIerJIUSEYuuE+s=;
        b=dxoNWujWZTmaM86i2WjyceN8KgO21RCNpHr3Hr3FbCGM0KQEo/iwlapWQoDh8sZB/Q
         PLLCixVo09oQmfaFdd7/BxB9F2vl6yPghuXZJ8LBoRlRYLLU/N7aiL3BOXPdSLfcF2op
         a6OZ/S/EsHNi+XS5RlT4nGVyOM2pXJaBx+50Bgyw8wC/b5yzt+Q/rmn+b6ZEwKGHLdj+
         o9/l4EFucgFzNtMzC2zuqDPWl3SzAhqWopn8z+jYo+jRQbfFSWScYIlqRBXa01hmTUiZ
         4Lqb+kr4Y1AYMqEOBwb44WNVB3DiVEHTI716m7NI3EPxCLM8iA/DUQr3KqQnXH4NcyIo
         cpww==
X-Forwarded-Encrypted: i=1; AFNElJ89/BoMQLLyv0UoZIuQaUjc6UW0WogJZ8I4woJx+4LCSu34pUOCDv8GUXKm8XR8Y6LX1cK4xkBYfSy9@vger.kernel.org
X-Gm-Message-State: AOJu0YyQVGV9z5Ql6ru9Di7eSbYzz/MTR5j17ElMUCL1xLToKVRRHPgT
	3rCtqw6bKngOWKmVTb8GH4AiLCjK5kMyaZFehnkxSV8tHGbtrlUKjNoe
X-Gm-Gg: AeBDiev8xSF+WYZ1yTvmWA4DUsyO/OgpCPCpNRJNgcD0CmeXWWubbn7z4CtJDwrMHpa
	lK8XxRpD6KIn/Yqprl6N8ETr6Ulp8KTNqtcs7OpmiA32ghCPKZENlcV6JzEW8YA2UZJS5HafG7m
	mGXjHrjexlk8Ej2A93TS6sARsADy4Gv+c4Ubw2vBLVIuiQ04/KE29CkMxDm0otDMzJCQ6UuxNWJ
	DtzKrVlV5+NoikkCCYA1RNuYa24GdEDb1Cm3IvAPRmpRuwYbIqCEq+t7V1yht+w7tog2loo5Vqf
	spWKt+ieW2Oo5hjnrwD2G3MQ/QYsDLn1BzIp/i+H2LmWbLBJT9dUHGYJCoKf5RRtG+pDaimy0vY
	ZUC7xoIehdvRjyLMRzd+3oRanQA/Tgf8ABinE6StrtSNHKbajmHDrnCqLrwFQlrzTQmR96xMp5p
	OKSf/K7Tv3e86GUVAIJgf1hhMdtIO2s2G1QU0Q
X-Received: by 2002:a05:690c:e3cb:b0:7b2:9347:7be1 with SMTP id 00721157ae682-7b9ecf86543mr73129417b3.29.1776526480099;
        Sat, 18 Apr 2026 08:34:40 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm20380427b3.6.2026.04.18.08.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2026 08:34:39 -0700 (PDT)
Message-ID: <717459db-479a-4a68-84d1-a718c8ba5a54@gmail.com>
Date: Sat, 18 Apr 2026 18:34:33 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/10] arm64: dts: qcom: msm8939: Add venus node
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <KV8KCGTrLcQnaBrdbcO-8yqIObRcqYTBQgEYv3TaeT9dT0e9phTPowW1fza6BV9LfqNc6ZORybdss4WGdvnUTA==@protonmail.internalid>
 <20260416-msm8939-venus-rfc-v1-4-a09fcf2c23df@gmail.com>
 <ac54d018-78e2-4f8d-97f5-3cfdb5151aa0@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <ac54d018-78e2-4f8d-97f5-3cfdb5151aa0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/16/26 5:31 PM, Bryan O'Donoghue wrote:
> On 16/04/2026 14:43, Erikas Bitovtas wrote:
>> +            video-decoder {
>> +                compatible = "venus-decoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
> 
> This doesn't make sense.
> 
> You have two cores => assign one to encoder and the other to decoder.
> 

This way during decode only one of the cores gets powered up instead of
both, resulting in power collapse fails.
Core clocks and power domains can be moved into Venus node instead of
sub-nodes, like this:
venus: video-codec@1d00000 {
	compatible = "qcom,msm8939-venus";
	reg = <0x01d00000 0xff000>;
	interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
		 <&gcc GCC_VENUS0_AHB_CLK>,
		 <&gcc GCC_VENUS0_AXI_CLK>,
		 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
		 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
	clock-names = "core",
		      "iface",
		      "bus",
		      "core0",
		      "core1";
	power-domains = <&gcc VENUS_GDSC>,
			<&gcc VENUS_C0RE0_GDSC>,
			<&gcc VENUS_CORE1_GDSC>;
	power-domain-names = "venus", "core0", "core1";
};

And then they can be powered up regardless if the session is for
encoding or decoding.
My first question was actually about this - whether these cores should
be powered up only decoding or for encoding as well. Bus configs
downstream signify they are only for decoding:
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/Documentation/devicetree/bindings/media/video/msm-vidc.txt#L35
Unfortunately, I couldn't test encoding on my device. It appears to be
broken.
