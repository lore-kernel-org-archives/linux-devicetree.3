Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB8E3B19BC
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280281; cv=none; b=BkwqvUewOWP1uc1CB8RccspPNCtUAC3mAnZ3usWZNaWBQuU8OAa3r2XemNf6qTorDhvNfTa7THf76fycSmK47GMEgjIYrxg7hNbmUBoqj4fFLmv+gz7j8+jhYt4hu4n/mg6i+RdnKKDNIPtUhQy43Xx5SD5QYjIYwk3ckMYEcjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280281; c=relaxed/simple;
	bh=fle84fxG8v7Y97aLg01gA8qEy/l9d3XHUYPOq+DwHDc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Hk9XRdR9jo0n1inuIWtYiYeApbvd5jmLvl6AuMAI7mDZHgKRa3ojFNT8kHCue0eZCdA4eE/9oYZsbpY+FnjlMEGu+cAD8rKghthAay+TRbs+Ee5ya9YsUuulDC5pYfR74ZHADmcz5ThzgnW+blEaeekBroOaTvRp0kqZ5O8npMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=egUpfqTR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="egUpfqTR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439d8df7620so2827552f8f.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774280277; x=1774885077; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+799mjtJ424ayaFpNGDyPK5HSrH/GAuIDLlXAToI0C0=;
        b=egUpfqTRHKE+79O2/V4Ji2aR7vL7UMIh9t7S9dRhdZd9g477MFSpjyfSL3n8Py8k9O
         IH5eXHNC1dk3RUahWyOum1/5w6x6z32uyD4drU9wdyG3ePJzZHMN6BAJa8G+yEthlnRc
         6zRE0Y1fx32QUR+Am6Z852U2Auh19QCL6+UNJffxPUID99oMKInD3h3XKjSSxj7Or+PK
         xD5v/5Mt3TtJNaJgMxLktjPZBgyoicn9Kr+7hvZZ2ehoG1dWe32ETQNAe+8GbqsawK5V
         vCjePb7Z9mWDv9AvdgnO9nDSQBQIEemep03UrxnR3E4FDh6jEiQc3jxD9LuYA027lesL
         qUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280277; x=1774885077;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+799mjtJ424ayaFpNGDyPK5HSrH/GAuIDLlXAToI0C0=;
        b=PACaidoH/QKZpLtm2UBRI5vbaX7gMl0yIwNsh2cdG6UWMDDPtSkZOhEYEUnp8xG6nT
         9T4/W5QPTe8RmP2FZSeLlWvxddeRf22ziQRsenVYOZf9eZEOag4ZjikSSKH8Zm6E2t6I
         beNPUHhKJ0nKaAVj/K/gFye66jQxuRO56+c6HsljvuJ0KpbbyFQs5a1DdQENdyKsrdLf
         wAxXSELKmlIf1OSUssZQ8IMK54Ktq5z1Ps2erZsMP9KqoMyAH+YbftcCw5QXL7C5yeml
         i2qKaH6hFNOJ1xo4PzqUit4D2rbOpNYkKrRpe+BBHs/UmpjCW7D3MDYhXkHeGJcPkkzf
         /SAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdOSghHhmDp/UJ9t7i2S8YLMAUFK0VWjRebCqmR8LHmCcJCk77P2SHBhBDkza8lQdnhdkT+YUiah4d@vger.kernel.org
X-Gm-Message-State: AOJu0YxDpHmzptHxTmfWsvWhcvv7V0MuI3aiATN1dB7LyXdQMHb6uAYh
	2dAwMRFJgAAu3E9hN6SYnH2lRgcl+u8dTcOkzs5gG16gjD7Ov7QEWqU/nS40UVSfSik=
X-Gm-Gg: ATEYQzxprnLWREdAqDUm00D+criC3+mQwxXNDADewvgOnwfafUVoGXzzcDEcTeFLdrn
	wFMMDh7DDyjvyfRlrfaBWQWLsGCaIoi2u8z8sPs8GnhU7fc0wnazrV1Z/6qYDCLs0f8SbnVKTkZ
	Hi8PwG5zSsL0MXvro1tDvDFw99kQJKDjhd6/pJY2e9FPIoCP4wFsvYux2Ol/vaYdibykKtoS8bO
	vxMn4IBrXtRTSAgr0ZNWBnFRA8Nwpa06PWAraqGmFcsUZBVKbFteUv29Mxf2tpFYhVaMOyGvXnN
	aMLusN5A37uMCAp1BTfDYTwPa+Pa6NPwIoc1fX3Zfwha1pX5xjVfEGuvxDvu2o7A1eFld4muHbN
	ydCdX/ecJQoYqu3mJZdJebrl0rYR5MI0tZpxdxdSL6wxbh0Yp9771EuBzQ/B5rsBGv25veJhp2r
	gka3BJ3PpJxmxBO1SsShDEOv+V14so8AbJ8zaFSyJkj2DEfrVVf+xOexBSG6/3Mn9FVTEQaxaRe
	zMf/EQW6obE
X-Received: by 2002:a5d:588a:0:b0:43b:634a:8ee3 with SMTP id ffacd0b85a97d-43b642755cbmr20095191f8f.34.1774280277500;
        Mon, 23 Mar 2026 08:37:57 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bf1c5sm33324552f8f.14.2026.03.23.08.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 15:37:55 +0000
Message-Id: <DHA9V6AKRSFP.357L2LIJ2X96U@linaro.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 8/8] arm64: dts: exynos850: add PMU interrupt
 generation node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-8-71d7c4063382@linaro.org>
 <20175026-1576-468f-b68e-4af18d22b875@kernel.org>
In-Reply-To: <20175026-1576-468f-b68e-4af18d22b875@kernel.org>

On Sat Mar 7, 2026 at 5:08 PM GMT, Krzysztof Kozlowski wrote:
> On 26/02/2026 16:47, Alexey Klimov wrote:
>> Add pmu_intr_gen node for Exynos850. This hw block is required
>> for different power management routines like CPU hotplug and
>> different sleep and idle states.
>> Also reference this node from main PMU node.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index cb55015c8dce..e3f4fe6ee118 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -211,9 +211,15 @@ gic: interrupt-controller@12a01000 {
>>  						 IRQ_TYPE_LEVEL_HIGH)>;
>>  		};
>> =20
>> +		pmu_intr_gen: syscon@11870000 {
>
> Does not look ordered. Randomness of this file does not make it easier,
> so assuming this will be resorted someday we come with a tool, please
> place it after @11800000.

Ack. Thanks.

BR,
Alexey
