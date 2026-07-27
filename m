Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A013FB055
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150914; cv=none; b=hXoaLA/0f8OKfhuE2qSLgZ+bX3kCwbKgZY0ebTEIG/BcXsOcliLtSY9DQnuj5zimAzGPao/NVcxrw1tBxMTGzXvpXvJnv10y0aXfN9VCygq1tq1TQQWjrwptUf2vm1KPhsM5I4Ps1x/kTo27C6VRoQCdAYaCKfx4kKkc0UIBxfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150914; c=relaxed/simple;
	bh=KbWGLoamsRqt9EF91CYlnFd2rzTQDmCXIFAkw07Z+E8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qKyLzkVLU9ugYsWfkaiW++Ax5I7yWE0EQnV493Vuw+yErY50q4ypfUQxEff6/JDsybCYgeTD5GAJSaIQ3HATkjOr0kuiVTjAKxNRGbQRYSzcugZbzC0986m+gs6MC4lnVUI7a0rKYWDNhQtFETX6LwBai4y5fQ8pHcpBQogwDtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EAhbsMHC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EAhbsMHC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47de0093c42so1998457f8f.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150910; x=1785755710; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KbWGLoamsRqt9EF91CYlnFd2rzTQDmCXIFAkw07Z+E8=;
        b=EAhbsMHCDnoB8n+E7vM+bqCnkDJK3OvfeYMf2O+Q6hf1DYStosBTK4JK7Dv+6vm5Oy
         9NsBkhzzxclyopRAG0LOEaWhkPfv1i4PcM7LMddxGO+qV6K/dL7rSGI6fFH4qTfaQ5Vq
         7rFdfbQl4Hlk2aJ/KiLcK7A0PvyRcBNf/euQONODWEoKB0TtpwbHh1nRaICsQ3qEStBz
         T8syZYMyrUDvEGIIGhqm+s2JxQ861cIIdSFEtR2BfaPbCWmdnZ3BBnQx1vH8oibEaqLI
         zON3plaH7+S/KBsr9Z9fYdRrymvdOHGy0MusHLYO5gywXtqvOPdOVxBw1+ue2XYEBGSl
         NKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150910; x=1785755710;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbWGLoamsRqt9EF91CYlnFd2rzTQDmCXIFAkw07Z+E8=;
        b=fI4PSE//ucXTon8zZ5ltKrM+BZVFBnrToXkF9YICEs4rPMAY+rN1ytjHZcN1fIoL+X
         QJroqdWoUR8TNFtgzkL67WnGeB9NADhfEZXEGk175rgLvj6S5/R9m3qx6Xxgo3PaB8Ez
         ss6BFLD7AjoQ7xSArVYb2d9ti9ceAsBo06XvabsuZiw5RTfYtQmNiTDC9aYFQo/2vc9k
         OGyUJvLDc49YtZVI3FnLBrCJKuV5Q7RFNb7cje0WGZ7PTO6zwKYFBL5z8dSm9aleTBNJ
         QFlzA1ah09NXmR9g2x4n6hwBSoeHt/+JT0G6yx4zlaZDgXZ95bmUabqdm4D68u7MepJz
         eodA==
X-Forwarded-Encrypted: i=1; AHgh+Rqmu0ofITdtU5h8llTGQCUWvMr3PPidB9WDfOKv75UZiNTBJtSma/GW/6ol4Y9DdyTpL59+YL0KLETU@vger.kernel.org
X-Gm-Message-State: AOJu0YwShvNPoCfDVhFOLtVXp2GuFroi28qDpUYq6mgUHuec6pqA3FEV
	kV4h5pNtSgSybxaP62qPK58GjNoPCsPxpe9Pxvz24Un0frUlvXBiRM37gb+c8CDvjhg=
X-Gm-Gg: AR+sD13LrQq5mMhTP4eQJ8YjYJYtfD9GU1jSNoo42dhdLJvOuBn+Jc+Y79jwbGJP53w
	nsTmsAOD72jfzkMAP35CJC5u7Y57rPqS4uqhcTJ30+gnY68W463tcmpjYTvBCpezjarwbEYqM0A
	D/s4TN+VBSIXdXli6QzWogySaiIaUVEIZRWy0EstuXAEBLIg0LqblBkM39NtTWQmdWMEs0RJ3Dy
	fjOGPw8/5RXVYaEgXNtQ3TpMHfTlgyn+9ATz5+/QDLyBd6hLIRDW2Tp0yirSM0vB7uMqMaInkou
	pOQst9khU0lDxYgSxk7rZIYHOqxm8SoJ2oTFbGTb/Npln1ypmUvGjJiozJjBQMKUMOlqIAv4GpR
	XdgN1Fic5OBeni9Z0zuoYYGd5Tv+Aur+FFWKBAPLAFF8GDNvEP9kjm4JBqS3MLaFXmkg4VmkJKF
	RhQHtSjg==
X-Received: by 2002:a5d:64c3:0:b0:47f:838c:4256 with SMTP id ffacd0b85a97d-47f9fc92c01mr10623612f8f.16.1785150910326;
        Mon, 27 Jul 2026 04:15:10 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f939c1465sm33628401f8f.26.2026.07.27.04.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:15:09 -0700 (PDT)
Message-ID: <d97c2e514a7c97c311a98ecbb4d3da47adef27af.camel@linaro.org>
Subject: Re: [PATCH 2/8] arm64: dts: exynos: Align continued properties and
 add missing blank lines
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
Date: Mon, 27 Jul 2026 12:15:28 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-2-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-2-e9e3e9879d05@oss.qualcomm.com>
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
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>=20
> =C2=A0 [required-blank-lines] child node must be preceded by a blank line
> =C2=A0 [continuation-alignment] continuation should align to column 39 (u=
nder < or ")
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 19 ++
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |=C2=A0=C2=A0 8 =
+-
> =C2=A0.../boot/dts/exynos/exynos5433-tm2-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 120 ++++++-----
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 45 ++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 230 ++++++++++++---------
> =C2=A0arch/arm64/boot/dts/exynos/exynos7-espresso.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +-
> =C2=A0.../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |=C2=A0=C2=A0 7 =
+
> =C2=A0arch/arm64/boot/dts/exynos/exynos7.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 34 ++-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 4 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7870.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7885.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos850.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos8855.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos8895.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos9810.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos990.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov9.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov920.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 7 +
> =C2=A019 files changed, 359 insertions(+), 188 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
