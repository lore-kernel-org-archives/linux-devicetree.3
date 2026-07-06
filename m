Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B217238E8C2
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325790; cv=none; b=qPz55DVesYaewi3UzWmdnDppzVVLH6vs5Wg0HnB57mdnny0ElA6lEEUvYT3F+pB41lcLDYrSBHJhRZ9mGHk2LxXArMFsz6w2CAdyd9UksibD/m8LBAdM2r7ZhFUxUuvP8tCUWMO/fZoCsA/ResEwN7J45hPr0kbujAlIol6TqMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325790; c=relaxed/simple;
	bh=7By+TedtKbm6J+CxXElrbh3EPfmKOCWIM+fgrujbOrc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lhyQzZfW/8ZghB2oxajL35OePToI5JifMraRAWc3ErhySSruV2RVZf5T9YquJC9rXnfTuLxxzgggC17RIwUPU3PGH7r5cfH/ouwYAxbZqlFjg7MAsYZT3ZMHRQfsfpY7qjdX5qsf+ahbWKenlrQChUa7B39LDkjCRfyadubrUOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqHL8jRy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqHL8jRy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAFB1F000E9;
	Mon,  6 Jul 2026 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783325783;
	bh=0cJ1/FfpMd5Fu1oekl++RqCpdeMBo7Tt8abIgXICNAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mqHL8jRyoUMhLPnnYVzXlinvkAN20jFlORITu4HWM/EXeBuuetcQFR+Ddo2RCMRx1
	 yX6ohz6xcscXwXnxLxY55vh3jnMT90gs3TlP/vlxzwqJkVvHJmUPy/SxtgEvK6dqJ2
	 6gCd5eTxwP7l1rnB1QBzawcg6totVhT4cvA8I+YqertyhYhxXo/DjJZL35RqVL3jCI
	 pZyegF+ypoWnXXv6zOe0ajPL6G8q1k9DK0N33nif7eqgU+ahZlaQVK2s0QgjbADA6f
	 VcENBrm1nobeDE//T6inMJ7QWrxVKA0k4jE7XpohCDUnJ3CgUTq9AAcmoTS+YJbXJM
	 tesPubuMqJPRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/8] riscv: dts: eswin: add clock generator for
 EIC7700 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706081055.1126275-3-pinkesh.vaghela@einfochips.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
 <20260706081055.1126275-3-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 08:16:22 +0000
Message-Id: <20260706081623.5AAFB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The fixed-clock node in the SoC .dtsi is named 'clock-24m' but omit=
s the 'clock-frequency' property, deferring it to the board-specific .dts.
--

commit 5bc9617a8cdce75f4ec3cb72e9a91cca1ea64a55
Author: Pritesh Patel <pritesh.patel@einfochips.com>

riscv: dts: eswin: add clock generator for EIC7700 SoC
   =20
Add clock generator node for EIC7700 SoC. HiFive Premier P550 boards have
24MHz crystal oscillator to provide the input clock.

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index 430a210f01e66..af9e40d8739ad 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
[ ... ]
> @@ -203,6 +204,11 @@ pmu {
>  				<0x00000000 0x0000000f 0xfffffffc 0x000000ff 0x00000078>;
>  	};
> =20
> +	clock_24m: clock-24m {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +	};
> +

[Severity: Low]
Does this node naming and structure make sense if the frequency can vary per
board?

If the oscillator frequency can vary per board, shouldn't the node name in =
the
eic7700.dtsi file be generic like 'oscillator' rather than hardcoding
'clock-24m'?

Conversely, if the frequency is strictly fixed at 24MHz for all EIC7700
implementations, shouldn't clock-frequency =3D <24000000>; be defined direc=
tly
here in the .dtsi to prevent boilerplate duplication across board files?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706081055.1126=
275-1-pinkesh.vaghela@einfochips.com?part=3D2
