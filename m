Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964021;
	b=FVmNMeWcEGFSGdf9cUEKQWyk32o+illZ54QafCESdQjJ9zVQ+i7Go7RwLGPTFMrayHNU
	 iFudgNzOG8XFpSUkyPv2kCwktkd6F68l0pny+fk/lFKRJTKD1IE3kzu6LEGn5sZYIkmNl
	 hXbjRDFL8s3yvfENu7Mnr4jIx4fUTqpNLmAynaUVexyWJCUct0UX6HCDsPyJsH9fjh7V6
	 NXakZaHtiWtkwAbOxmnIdAZ/PlPJOdjRyLO0aZSuxV7awdJ1YXidWF53qVkHdAPCTiWGY
	 p/0412eycio8/O7gp3AbAl+SfqUImUOk6nO/mNyvVavYg8LvMquG1+NEZFETEWtt+Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
	b=338LW0aBrtiZ7F+P8S6hOYrvNUSlt0PcOjidf5IKyZWnMK/mIjK0puSm0JZrq2+9Lctl
	 sxCVAzM1JOJAcXmXCldM/c4VV1THr2L5H/Fow4XFRQ8FIdCHRjJ/SqbcFlKsrO+Ie4gb1
	 KpfVX9dZgp6dbyxUprbq+B/EI246Fivs1ON6RphkpUmmQwAexVY2/xw5V9YzxNd34VaZw
	 rNUNrHIAdIg/huE3Adk4WjXfRYBoai4TwOpBmqW9kdh2tkeDpNIa4pwVd8kJ5WANagqtL
	 +vqkibQA4qjCBiOjv6w8vozO5tmcxTrSHOjHMBODm2jN59uTpCsglnYxMVvtbeNj/IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DUFumtMK;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4C7606A330
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E4C7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DUFumtMK
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3acd3105debso572421fa.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964019; x=1794568819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
        b=DUFumtMK1phvIfSGAyjvBixjvVUbWj1LhChEW4qMThx2dH1KWLjydGDlGxwzpHi34F
         ydA4JtviInKqlL9MBEr4abhaPmqh35/Uak9OQijt/vKOoxpyIl7pLa4orHyfSO4vuI8h
         SglDNnGd8ZUztb4n0NY4SsyAZ9xEeS9rvIb8Uji0t3mFVucpO92chNyBayYeqhSZXz7f
         pju8gY1T4R95xWyHa0+c6Mq3d7+y2EYrsAokrF5RWngcDjic2+Aau7B9OAqIXzMIdHn4
         4rVW8y1o56QVlQPc1f89iBiWKmHxDUxq16YvDKR0r+xTHHx+sXdDVn4V3wvaoTs7a4WC
         gHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964019; x=1794568819;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
        b=A8rTGRJ33Kue+6gyHb6jEKac7pGKzsX9yIO4keUaaC8ZUpAVWPRbyRKxwU2Cn3FTQ0
         4T5fCO49tH47BGXvw46fVe3AazTovhxW8wU8yf+V+JvKVeJcmsfgg6HVY2dbm1btFYdF
         LZ1+Ggq/VUc0jRZ3+/VmLVDpyYxaOZX58XSnfe1yERxX6tgn4mqHiv4P1slU/7qH7duq
         +8m8u9DnIWhX1ggvUvfpr1idZx8czXIbiWGmi2tDDwOYZM3uxGXGws9X+VLztTZ5+3OG
         TJf7NJiuxyCXZfed4vXe3vDRscmDX2zNgd3B1OEshhr3CrzRZ09AZ+suE+glKCceT6CJ
         ZUog==
X-Forwarded-Encrypted: i=1; AKwUvBxq0ib4G64+Wre3VtD3qJP7d7EX2cXn7bDJJx1X4B/82IbaL8GJeAe/w503iOjGTygiIQ5D49IwWk10@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yfg8ILamBJAO/Kewb9YkE+zIeVixMg4/8p3pLqrf0MqwlvEaz
	HYaYCqw7pS+6vs4VVwFkByF1Jg838P8XXp5nKJ/TFodKBvC9Hm2FUU1+wqIWCX+MX0w=
X-Gm-Gg: AYBFou33v0eePQb2twsEt09Ov4+7qDjKd5fogGIrjQzs+H6WbHiDjHcciPCY+pFCmZ7
	y7NdiJDdtinmiYRT/W7WB0wAf0XoFUMuuuyBUQoK5DPEUwTMK3pMmfe0kbQ6NZndxrmQ2UUD9/C
	Elj6xmg0dMoarMwUN+3EKc0oM/S5EWi12Vy9vXXcs8p6u73CaO7FaeYFfE5JzWsBMzectboM/gf
	VwH6WiBDbdskD0oskD7a5ljvopt2hbkWcb4BKkxX2DauF4eM6FlusauCyXU42wvvFxIwwWYGcht
	Kc8BLHFAc18XNTpEC9579z4eryVxEU+FfI+AEr67ssPasjIXw5S7j4QZptnZmZTmIzm0NOG36BO
	wyrBXJIvOLNbCYPzAqRmlANl+YkQtk31GDUEuxtvHw2dfDJLcn5+6rVN/SdROFnnIJS+r9m1x+A
	j6z7yBPH/U1/PXGiDebwP8GQw6+CWOIo26Zkn/4YCIMyCrhtJM4BRXX66zRmCFQB8M1mQLuiaB7
	OcGi6TvOFKObyKoPkc5u4yR0/jwPFwPxZlcGEM64KNrdQ/hUuYxaCYz1OHcMC5sxJJ6KXr/WxfG
	VoXRxCAjOHTBvtIx/BYao7edeedL/crdsyHxpELsUnKHWTXY7WrpXl+TDz5eP+cATfd83rYzYXa
	sy4xDFg==
X-Received: by 2002:a05:651c:a201:20b0:3ab:1864:5004 with SMTP id 38308e7fff4ca-3acf36dacb5mr4022961fa.0.1793964018157;
        Fri, 06 Nov 2026 03:20:18 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acf5facfe9sm2950231fa.21.2026.11.06.03.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:20:17 -0800 (PST)
Message-ID: <540014fb-d271-4e20-9a3c-3f2fb66723ce@linaro.org>
Date: Fri, 6 Nov 2026 13:20:16 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-2-39ee37787b00@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-2-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew.

On 11/6/26 05:24, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> instances, with 27 clocks, 12 interrupts, eight IOMMU streams, four
> interconnect paths and three power domains.
> 
> SM8150 has a different register layout, clock tree and power domain
> topology from SM8250, so describe it in a dedicated schema instead of
> using qcom,sm8250-camss as a fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/media/qcom,sm8150-camss.yaml          | 412 +++++++++++++++++++++
>   1 file changed, 412 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 000000000000..26f8939001df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,412 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8150-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8150 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Andrew Gigena <mail@andrewgigena.dev>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8150-camss
> +
> +  clocks:
> +    minItems: 27
> +    maxItems: 27
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer

I ask you to switch to the new CSI2 PHY driver, please exclude these I/O
spaces from the CAMSS container device.

It makes no sense to deal with all-phy-combined supplies and the multitude
of other solved problems.

The cost of changing the device to exploit the new CSIPHY driver is
close to zero.

-- 
Best wishes,
Vladimir
