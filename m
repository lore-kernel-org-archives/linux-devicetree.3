Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9353F6600
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150388; cv=none; b=bmtoykRntVlyZNq50mDNgyqj3oTNYAbbv52J8h0CbQik/0VPn0AB6bSkOanNcvZCu/PqNJ0KBkw8Zx8S5JSKzmzKy4Oog8HIUm64WCj3yaS/5mv+acjNWTf0Q4EZwj/+0lQJf65gFIhiXhKMXAEWKMtfe7Gng1+SXwCG/Mp0y00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150388; c=relaxed/simple;
	bh=v+pIXqI4Yn7FIR8fGNeli3S1YAjHULa95SiXJrMUGHo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DPGBaZhmKJ114MRoyIm1bpIAYIA8OtMjRDrs70uhBNqvtrcmO1yIguR9A8u+XL2KYaWV8iCUaasOUhEzkawtmRbu+eWn53TZMf+yTYchmleEN33cidjcPgy9hJ4zEJMx2U+eHfeSS3Wwh6GjlJzw2BfeoLSWpFaUNdaMbMjGjiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NdgIsk8X; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NdgIsk8X"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69fec980a30so1090626a12.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150384; x=1785755184; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v+pIXqI4Yn7FIR8fGNeli3S1YAjHULa95SiXJrMUGHo=;
        b=NdgIsk8XCg3LLIhLHMixB9MG8CZxscoycsRQ7vWldblSaT46VykeBq/lUJLRo46CpC
         JoH3bRqVF3p1xeAlVQQHVLuIGWesxKy5lm3VXTSkHUa+b2JRFHF8Sl5L3of2K7YXikuK
         Xk0HUYS1e7ChaThWGGU7c0tO67Zu47XeRrMYYPvtvjB5VA/aR0NEba7f01aMe4/qMPFx
         PaLiE5gj+RuGH6ukUBOgD2vHPUkA8dCxl9OoWKxueOxlrLxwyrW1OUKAw62WRJE2dRHW
         NAfNmkS8g+SbMZGxrGtGeNMuE/bdsC6Q01gZuc9mhIbClzoLW+2LjPprWuuAYFrmUASq
         xMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150384; x=1785755184;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+pIXqI4Yn7FIR8fGNeli3S1YAjHULa95SiXJrMUGHo=;
        b=jtzdbKt8dhtNiScaD9B0eSXYgJudxEtjMtg38l3TvvKWBgOpg/RrYFOnJBFyI6sAPK
         d7CmdN+tnt8nixWj1I6v5fAMNVHKyhhHPaUqgqEwp+wTiNk6Ic++vGwNYiqf9WUaFgi8
         l/9QUwWJRS8TC/BrDpgU/LErW36lKnLEA6gqHYeN+UINJwBwifHECwEg0g54/lofA3Jf
         a7nH71eJDPGq98BG0bEHUk558l6SWGZ1FFf0pRXAaJ1msHzlr08RTGNaNQSsU5kZyO9X
         e3ytPmrPRsz2c7/obdvk3rh1bKk52vaIEFVcrkqNOW04VAysPlRQ1XCJZNVk4xeg5NOF
         Bb0A==
X-Forwarded-Encrypted: i=1; AHgh+RqWk3evDzVT9WDk9X/SSoB+QM9v0d74p+D8Sufd7AMuePgG8Y/fjuGbxlKSBhptFo7EoAMY9GD81RfJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr/UdF9ifdjMEiiD496Zwcr/N/N9733xujdT37H8pjmahs/Tr6
	OAoTWN/cuPmQm5J677uuFS+mTzSs2CvtilZ8SgIC8Pd0EvTbDUrlkPehVa6YZHyLIk0=
X-Gm-Gg: AR+sD1325rHWxEasfKa4g8jS1WrVLqn27rMPdgAuoOgIx+lzCUwCD+eNnTysGiuvOeq
	SOop9czQrUU2pCk5f4guEhJFb7Wgmxx4cQpCShlhUtOA7pWE9MBzQ4m0Zcd/w2t1ratoRsQ9vRN
	cZ7YcNm/8RLulfik98IO8efkZtW2b9XjYzpfFiHg38DAz77uojHj4ZWkJjt05OGTHybj0+bl2Lv
	qlM9y0zmfFzDgdqkgvqTn5AfN8URHXaiREx4rzjEQbZtCqkGfBqw8EyvbswSjHyygeVsJLR6/AU
	H5DB4r+jt8hTMlkyIzt1HdbOZfIY/5UDoQPNW+28NzLY3gpFpQgpzF8IuOPLII3kAoTKkcYIGB5
	0q+PNlzw4vxc4JlHqXAQlfjWuswIKn578czOgM/tXoFFE6STr6uQNMH5VqR95cs73UTOgWb0cdX
	YXb9xPAw==
X-Received: by 2002:a05:6402:28c9:b0:699:e496:870e with SMTP id 4fb4d7f45d1cf-69fc1159931mr2804954a12.20.1785150384355;
        Mon, 27 Jul 2026 04:06:24 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb55439absm2454955a12.19.2026.07.27.04.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:06:23 -0700 (PDT)
Message-ID: <32582351575d8cbc06fc68ab3d12d598bd317ab5.camel@linaro.org>
Subject: Re: [PATCH 3/8] arm64: dts: exynos5433: Override thermal zones by
 phandle
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:06:41 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-3-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-3-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> Fix indentation of DTSI file with thermal zones (two opening { brackets,
> but only one indent) by using a safer choice of phandle/label override.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 4 +---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 =
| 3 +++
> =C2=A02 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
