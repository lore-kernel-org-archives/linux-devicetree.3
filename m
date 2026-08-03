Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87EA3AE715
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743604; cv=none; b=M6IPP1JMFkqHdNHZqbEOpXwPG7tdfzOqUVmTDPtnSvegyIUilkID9w52k2xM0VjDsQCXdMRZU6/5UjxSxNNbGJv7FJbmVT3hDVm7ppM8xo2Qj3UGkse4JiqJVrV/p4rFSCKGj+QCnuAKvnOulyl+74XxGbAG/w5a++svkUf1xRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743604; c=relaxed/simple;
	bh=Ni6BfianyvaHw+Ia7y8QumGUphfL0yVJHE18bOeBOIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E+9bd7BZf72+xHUkI5zHjiOlAZLUFR/gCYG+iqwAlPqFCHieGoiQx3JYn/q/EyW/njHgC54NEr33TE/tq1NZCz23UwXV3gjRGGG01VXK/4Q5lCg1vPOkfip1C9DkpJ2ThtR365R8zGel3y9CSlz+aND86UJyd0Me/q9YNXwH7LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THznPp6Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THznPp6Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A601F000E9;
	Mon,  3 Aug 2026 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785743602;
	bh=Ff05jCNlpCSG5nOkLblF8lP21qg1eUO/a4CNiSL5iiA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=THznPp6Qsp0dOu6EIGrCPCUdnsRYo1ntDfV7gpVm75Y4qHlgdh9c5VA9wLkY66/zQ
	 NeDOVjjakF4e0jgAxk5rjr9LP9r2IfoAUsdh0fQsY82PDhfXpROyUYIriucf2mddFq
	 DGS+W/l4K/5x+L7IMU4Cx2vTajt8hTZDjqFAM1JXLiE133gg5hrF1Jiq5IFJIgL5wB
	 t3brgUae4d3SYHkuo04qv9mgRrJfoSeirqpOu039FJKygsf86BJc1/4xf8Zdt8ZA2J
	 fzewI8aLSdB5uLmO4yJvSbI925oE7bi8vw4BlJxdcnuNlbJK9ncXX508XkdnHlkhdb
	 GqDa9RHBoUyfA==
From: sashiko-bot@kernel.org
Subject: Re: [RESEND PATCH v7 02/16] arm64: dts: st: add power-domains to
 sdmmc1 on stm32mp231
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803074224.3821911-3-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
 <20260803074224.3821911-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 07:53:21 +0000
Message-Id: <20260803075322.31A601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch provid=
es an incomplete fix by only adding the missing `power-domains` property to=
 `sdmmc1` in `stm32mp231.dtsi`, leaving the identical omission unfixed in t=
he sibling SoC file `stm32mp251.dtsi`.
--

--- Patch [2]: [RESEND PATCH v7 02/16] arm64: dts: st: add power-domains to=
 sdmmc1 on stm32mp231 ---
commit 5347308e7a8cc88eceb04108886bd5138aa92189
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

arm64: dts: st: add power-domains to sdmmc1 on stm32mp231

This commit adds the missing power-domains property to the sdmmc1 node in
the stm32mp231 device tree. This aligns it with other peripheral nodes and
ensures proper power domain mapping.

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
This isn't a bug introduced by this patch, but does the sdmmc1 node in
stm32mp251.dtsi also need this property updated?

Looking at arch/arm64/boot/dts/st/stm32mp251.dtsi, the sdmmc1 node appears =
to
be missing the same property:

arch/arm64/boot/dts/st/stm32mp251.dtsi:sdmmc1:
			sdmmc1: mmc@48220000 {
				compatible =3D "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
				...

Without the power-domains property, the generic power domain framework is
unaware that sdmmc1 depends on cluster_pd. If no other active peripherals
hold a reference to cluster_pd, the framework could power it down, abruptly
cutting power to the sdmmc1 controller.

This would cause I/O errors or kernel panics on STM32MP25 boards utilizing
sdmmc1 when peripheral power domains are dynamically managed.

Could this identical omission be fixed in the sibling SoC file as well?

>  				status =3D "disabled";
>  			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803074224.3821=
911-1-dario.binacchi@amarulasolutions.com?part=3D2
