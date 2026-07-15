Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2346218592
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097240; cv=none; b=B6beYI18ppXUqKMDs9uviXv0Tp8s+/P0SmXucR2pdyKeWrOgHtgy71E51i1nKNpiOKO3Bq2vh90BzhYXAWnRyrG4A2YNS+YqqwKAQsi9hI3I3NML22lTVEXSDYrx404UwAa//pT4CC0neGlQMf9kgl6qXedMlryc+9rNcuzySKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097240; c=relaxed/simple;
	bh=2FiWOVJivsHiiW/u4X7D2IoYhEJo7SGwzthBd0qOrWI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lSIOLloG3z1OMjn+cDJAmvu0V2Wk8Xemp6jzszqCwOzyOJyxPfjCrWmTB8i24RHwTx/2hVIwiHhk7sRh0zfA0IwQQGYzKYPcEjDG5PTWrlB/I8InXkmIhs8dPo0rjKj6y8NpOxUfYPqBzW8IG8MqJi8aJ+rlUV4qJ0OQy4OZrE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9cGix3v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9cGix3v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C391F000E9;
	Wed, 15 Jul 2026 06:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784097239;
	bh=FgDQn6aVq2+5AN8pm3ZEajlkPKgQSbGFoBUlzedcg7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D9cGix3vQ+IhU39aMTkLzECTh3T+HkEXpvJUMndxDO/cyn0shSfxPfBg9niZ9iW1S
	 QnWiOfCvgKJ8rRSYefwF9UwQjGzv4SOplTW2/t60ZREj9a9XLeshXXogqTHXQJwa6S
	 hxZ3SrPkG1oARySHjya6h6Wif3Ykr9kHx4RaLH+0jFKxpbsKfWaVg7eubQ+QRySKjY
	 YGo8CAGXE66krrVqe88I1gofuWHYGlbEQ5eluUPR8eK75qPrH8xVyTVVerX+w/om91
	 vJnk0eirSn3Y+msDItHJbFrUu0CfpwetOR6ia8XzeVnKIILIj8HVgyZGxoH2/6INtP
	 rueJpTIkGscZQ==
From: sashiko-bot@kernel.org
Subject: Re: [RESEND PATCH v7 02/16] arm64: dts: st: add power-domains to
 sdmmc1 on stm32mp231
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715062201.3599458-3-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
 <20260715062201.3599458-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 06:33:58 +0000
Message-Id: <20260715063359.23C391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix: missing `power-domains` property in `sdmmc1` for `=
stm32mp251.dtsi`
--

--- Patch [2]: [RESEND PATCH v7 02/16] arm64: dts: st: add power-domains to=
 sdmmc1 on stm32mp231 ---
commit 769d56084241db8b67f4b5d03d7c0c7f1c901c53
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

arm64: dts: st: add power-domains to sdmmc1 on stm32mp231

This commit adds the missing power-domains property to the sdmmc1 node in
stm32mp231.dtsi to map the power domain that was missed during early bring-=
up.

> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts=
/st/stm32mp231.dtsi
> index 9e1d240888ff2..0feb8943efae6 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
>  				cap-mmc-highspeed;
>  				max-frequency =3D <120000000>;
>  				access-controllers =3D <&rifsc 76>;
> +				power-domains =3D <&cluster_pd>;

[Severity: High]
This isn't a bug introduced by this patch, but should the same power-domains
property be added to sdmmc1 in arch/arm64/boot/dts/st/stm32mp251.dtsi?

Looking at sdmmc1 in stm32mp251.dtsi:

			sdmmc1: mmc@48220000 {
				compatible =3D "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
				arm,primecell-periphid =3D <0x00353180>;
				reg =3D <0x48220000 0x400>, <0x44230400 0x8>;
				interrupts =3D <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
				clocks =3D <&rcc CK_KER_SDMMC1 >;
				clock-names =3D "apb_pclk";
				resets =3D <&rcc SDMMC1_R>;
				cap-sd-highspeed;
				cap-mmc-highspeed;
				max-frequency =3D <120000000>;
				access-controllers =3D <&rifsc 76>;
				status =3D "disabled";
			};

It appears to suffer from the same omission described in the commit message.

If a board includes stm32mp251.dtsi, enables sdmmc1, and the kernel attempts
to probe the controller while its power domain is off, could this cause a
synchronous external abort or kernel panic?

>  				status =3D "disabled";
>  			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715062201.3599=
458-1-dario.binacchi@amarulasolutions.com?part=3D2
