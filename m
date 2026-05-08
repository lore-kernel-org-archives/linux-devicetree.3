Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92178368968
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284774; cv=none; b=gX8VwD6tK8G0/twarZJFXBt/uEc5QBeRUysP6AoNiiUqik7k237Vl/2BJS9Pl4cRATw/9qlBIfKVcqSZMOq/TvtNIE92ujF2+/Wbk0h2NHwwcY+tj7w1K+pDHbym+nJ4lMmaWeyNlbATeUQ0kA1Qme7UjGgOaJ+x5UuqBKr/m8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284774; c=relaxed/simple;
	bh=PDt6hK3u6d4whX9RSLq+kXGyQPtOoISE/8gVD66iJ3w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cuxrEjBuLbSAvZTlDvGqrYfl/aC/b43o15KyJcsJeyT/lVSgk5RRTFNU0+LWcc1/EdTch8086uF5yhsZPSBNyNQ1ixnfjYA941T3orzuDcAkhcmJFir0yqAqe0WgzyQZcoo5ligN8lZA39MDsdtk5yhd0Ymtt/4ChjRnwNQHx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huwwA0Rj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huwwA0Rj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF3DC2BCB4;
	Fri,  8 May 2026 23:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778284774;
	bh=PDt6hK3u6d4whX9RSLq+kXGyQPtOoISE/8gVD66iJ3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=huwwA0RjxJDaqEc/k36qAkkDDhXrUu1eQ74Zv0YEqqRyOCZUSiCqX0WC1skLyArR5
	 8q1SixnsSviIMAWOpCW64URmV2vkvAKA6zMoXzD/H6k8SKg1A0qTEF5bxzNjz34Vym
	 bAPzvMdR2Lvi1s3M6/wW2+NJN97pDQw5fUDMGJ+cQ8FxPxn/lm4FEynnS4C/k/sI6E
	 gqvdVmgAgYqoEDxC0bzUSMwV5y0oKIhaOy3Okwo6rq5fCPen4KykJ20BrYbPSbPKSu
	 CC019g75qruIiR/fbkvuQrN78ay/m2puI7DTis4vVvygF0R/zWESRtBcAkEB6Q1BnC
	 A9b9mNyKqePfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: defconfig: Enable drivers for BeagleBadge
Reply-To: sashiko@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508230341.1891450-4-jm@ti.com>
References: <20260508230341.1891450-4-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:59:33 +0000
Message-Id: <20260508235934.1EF3DC2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added configurations `CONFIG_SENSORS_SHT4x` and `CONFIG_L=
EDS_PWM_MULTICOLOR` are not placed in the correct `savedefconfig` sequence.
--

commit 6f7a4afa4cd800dc21fa4233eabb09b5e3390bc1
Author: Judith Mendez <jm@ti.com>

arm64: defconfig: Enable drivers for BeagleBadge

This commit enables several drivers as modules or built-in for the
BeagleBadge device. The enabled drivers include LED PWM Multicolor, MCP SPI
IO Expander, Seven Segment display GPIO, and Temperature Sensor.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d905a0777f939..0e4cf5e01146f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
[ ... ]
> @@ -764,6 +765,7 @@ CONFIG_SENSORS_MACSMC_HWMON=3Dm
>  CONFIG_SENSORS_LM75=3Dm
>  CONFIG_SENSORS_LM90=3Dm
>  CONFIG_SENSORS_PWM_FAN=3Dm
> +CONFIG_SENSORS_SHT4x=3Dm

This isn't a bug, but was this defconfig updated using make savedefconfig?

Manual insertions can disrupt the canonical Kconfig parsing order. Based on
the definitions in drivers/hwmon/Kconfig, SENSORS_SHT4x is defined after
SENSORS_SL28CPLD and before SENSORS_AMC6821, so its proper canonical
placement would be between those two entries.

>  CONFIG_SENSORS_RASPBERRYPI_HWMON=3Dm
>  CONFIG_SENSORS_SL28CPLD=3Dm
>  CONFIG_SENSORS_AMC6821=3Dm
[ ... ]
> @@ -1333,6 +1337,7 @@ CONFIG_LEDS_PWM=3Dy
>  CONFIG_LEDS_SYSCON=3Dy
>  CONFIG_LEDS_QCOM_FLASH=3Dm
>  CONFIG_LEDS_QCOM_LPG=3Dm
> +CONFIG_LEDS_PWM_MULTICOLOR=3Dm

Similarly, should CONFIG_LEDS_PWM_MULTICOLOR precede CONFIG_LEDS_QCOM_LPG
to match the order in drivers/leds/rgb/Kconfig?

>  CONFIG_LEDS_TRIGGER_TIMER=3Dy
>  CONFIG_LEDS_TRIGGER_DISK=3Dy
>  CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508230341.1891=
450-1-jm@ti.com?part=3D3
