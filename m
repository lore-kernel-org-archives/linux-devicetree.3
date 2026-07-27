Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2673F3281
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150516; cv=none; b=JrMEOTk8AN68+HEg06HYXzqSxHhbeP0zSUI2CdarTo3MASCrv7YRBsd7OvCBvjAWpKz4DWl8kCb2/GpzNV0j9yWf7aAptbLnA6S5MinY0tEO8z+81ANjWFrx00nqhEhwxCrTXuRd3S03JbjytAN2M0oGUDZqghuPd1TUiISDKwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150516; c=relaxed/simple;
	bh=ZpoUI0pXe24xXjZcPALea9gBO3auN5oFlq0lj4D/PZc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mb0P+h93YGnCRIRRlyFCquacejCPJfsgpYFV+onK2Au0KHeko0RdN1k+ueNNdB/6DXFJv0uuM78G8XPGXq00XTaLW4tL2dddUKQKS4542mDkuWSBnK2jnsSvIixOm5436opKwGhunzJE9zcKRNsIzs3DYm8ktK3xiCTe9SbyWS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vFdqFs12; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vFdqFs12"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c169ae1cb26so606155666b.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150513; x=1785755313; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZpoUI0pXe24xXjZcPALea9gBO3auN5oFlq0lj4D/PZc=;
        b=vFdqFs12OkNuvrwRhpYuprOPOfl6ECuY2A08j72aXYaibifCMXYpuLKSjr5gxrpuca
         ruC2nRnLhfP0Hje/ZiW/RF6As0PbzobbrL0AdsjizVSwKzzlRDTE/NjqsFWKdp5Rl07B
         5FZrQMfm3lL8EWn6ET0VTkiThN/v9f7Gm3+rIl7ip5LHRQpF/mw5qzlwWnIqbx5QvLuP
         CMJZgZLzOX/drlAA8q3S5G5rKY6/+J1wXkBqDwfWfMvE09L4h8ZHnkfAq9DzUBOqgZbM
         FAYnuice6x40VBDs4zCvM0QAWpdMBZWPAIyFJkusFyHAQoPLsAJWby0Z5NwTukik+Ahr
         gSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150513; x=1785755313;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpoUI0pXe24xXjZcPALea9gBO3auN5oFlq0lj4D/PZc=;
        b=dcpfUNB0npcCwghkNQDjF8ZZf2qa6tCdq/trX04Am/SEoGuF42WOthE3HEP16ji0kx
         O8saiMDiLQQ5z9RZ4kKdo83HnGCiFE9vX7SWXCamx+9MUFYftn6ATL7qQgOgqocP0XVr
         ECkb22X12aai1Yki6gy5NCLut6TRZ0c71KahFzLk6sWlP8xeOZ5v73/2aBdDzlWUDfHw
         26Na/g7mOBiOuOQPAVlr5t+DFXsuKXo3iPamMOwJ2LdxtYwmNpA2iao8wldSoNh8NOqN
         GyQDqGL+FyPUSISStx0DIHQ/ak5xcB25DK+WORl730MOmEwVlKBDMl+TQ2CxmQezIiS8
         ecPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDu5h+j2D30veSxKeD6hC8/yWBGwYNh1zHm8Hbs3jk1hOp2BSAPGXeLg9Bn0Yp6/cA2ktqIL+RPTot@vger.kernel.org
X-Gm-Message-State: AOJu0YzQN04EvzztFmSoyP4S5AUv+cVBnu9bgYyE/6Fp/J6ENrExaX0x
	OzqTaeiuR8YeivJo983M6PSUTEX6nD/062KqfHPtOy0EHm1PDz3AKsNq6Fi7hQFF9pE=
X-Gm-Gg: AR+sD12S3iznm2nfipxepGqzvZGRPtaS3rj/3HActeC0ysC9KD8pna+BWkvZTlEptZC
	sSS0qvYhMp+9K4I8qz69MZlxv7HwUAXqwqRlfCXGr0GwVk64vIAl8Qn+yMuSs5Q3rp8LlLW/C5q
	kRwNBMYOXd1j/rkg2NokGJW7vZYT9+Pop3Adypa9AvG/UpZvV2myY6qKh9/A1OsG1MCac7hX6pf
	ga/qBElHYIWRl5wjO78y5N6FkO3EYM+ixMadU2FcxD5iUlrgrbUGC7AdsHgrQ8t2U9qvhRHy6RJ
	btG58GzidLCXCCe+Lbarc+MmKTbn7IKY38zorOsF7QGcNcPL1D3B94RO1JN+RjAGG/iwP8fOSW6
	l8lUvyByoPUtmKWOkliQEuI/gJuASfTTQ2Ed+dtx0AZOQy0eFQS68LkIHCqFv2R7nJcTJHJ0tte
	3BVOijskt3RshllS9N
X-Received: by 2002:a17:907:72c5:b0:c16:6be0:77d4 with SMTP id a640c23a62f3a-c1f1fcaf96amr403599466b.14.1785150512826;
        Mon, 27 Jul 2026 04:08:32 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f13cb4sm634351066b.61.2026.07.27.04.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:08:32 -0700 (PDT)
Message-ID: <c66d9d55d0c00e7ae43b9c075dc046fec2397a9b.camel@linaro.org>
Subject: Re: [PATCH 5/8] arm64: dts: google: Move 'status' to the end to
 match coding style
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
Date: Mon, 27 Jul 2026 12:08:40 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-5-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-5-e9e3e9879d05@oss.qualcomm.com>
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
> 'status' property is special, thus DTS coding style expects it to be
> always the last property preceded with a blank line, as reported by
> dt-check-style:
>=20
> =C2=A0 [required-blank-lines] "status" must be preceded by a blank line
> =C2=A0 [property-order] property 'vcc-supply' out of canonical order (sho=
uld sort before 'status')
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |=C2=A0 2 +
> =C2=A0.../boot/dts/exynos/google/gs101-pixel-common.dtsi | 12 +++-
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101-raven.dts=C2=A0 |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 70 ++++++++++++++++++++++
> =C2=A04 files changed, 85 insertions(+), 1 deletion(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>,
