Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426167;
	b=vbiDpLxN8lyze6RbisVbvvzL24eXAjocy8u1if8haBojbShPuPrFViDa1P2uio1hpNsV
	 fbyQIw/N4Xg3Lr9uS5dzFGtbqqt5/7eBxlKA8JxDJ3xUF4YhLAV19S6SkuDUUOmKKwyAS
	 m1blfZCHx+7A/uBgX61j5KbsgpmHIgwbQUfgPgpcsP8ky7PuT+XeYavW3jxBXFsM7Vi5V
	 KxlxiTgIh+MzmcDrG5cBzXNWBA81Gc6Svvb0BYuk07lAzkOoPJNQpCtKM3FN0sgEBexdK
	 1IygdjnsSy30O8r6qhWRfYFuWgUq/8t5sVPKBKswetiPfsC10J8Gd/GXPopBs5vJFDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426167;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OjCvPPBJRfinyfsh0nJkEZstEcSjV/41TXkNaIVQ2jg=;
	b=YV9W5fKgxTYn8uTXyB6hrMPoWWytdlIXddoDtBi58fpgTCXhlkN388yi11En7PCSS4RP
	 nhfb44nKCNJ74sZAvpYFS7kHE532xrg/X2hSOy/fisn8DqqOPxV3whdVVhT55GR7ahKMw
	 tds/X5RIdXC0NNuMapD1g9OfQkFz0zHwTaO2EJ5wAFfBIi+hDxXyqZkN/T+y86+6ocIFX
	 mmtbGE1/R+4/PIDNX2Lr3FKfoo6UFQ3IBtPIDbSi9oYMrV8C0xJKveUGYkebcRsp6BaH4
	 7GGE+yOW/xccacw8ZuolO9J0u2DRmqYZ9g1YUPwTNh+nrYqvcxS4eJQYMFPIqsl3Jfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J48Kcj49;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D7E606A332
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J48Kcj49
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5451F000CF;
	Mon, 23 Nov 2026 09:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426166;
	bh=OjCvPPBJRfinyfsh0nJkEZstEcSjV/41TXkNaIVQ2jg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J48Kcj49/7dUWi1M7HZ7QU/wQMdVKR/80+FrmLWxldk+qEpIbUOC+SKVzEjlbDWu4
	 E2CtyhCPmiZ57POtQI7GE/fAxZ+euPL6fbtk3EPvXPC1iD0jV+JOLysppTJHeACs+K
	 oVO4uE7uCZGraecW0XC3FWD5LeaaHadaAaK+YYMyKWYGhmO5fL2Uyn7uhMZtb8Uzx8
	 HW2zitdz/QFXNP6ah5wWU1XVRsuYngCmfbN8kYWsZCMNF2BZBX6r8HX1Q0CunDPquw
	 tKjHiA8DFQRBdfPVzcWXHS3CzgXM9REPMSXFWw6r9kSWJ+PAe8M1pfHy0Gl0Rp7rWJ
	 c66jtxwFH3N6g==
Message-ID: <sashiko-outbox-228973@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos: exynos7885-jackpotlte:
 Enable USB support
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Virag" <virag.david003@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123092244.1792040-6-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
 <20261123092244.1792040-6-virag.david003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 09:29:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: exynos: status placed before supply properties in
  usbdrd node
--

commit efb93eac6c5ba5a303715dcd3358d29290401517
Author: David Virag <virag.david003@gmail.com>

arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support

This commit enables the USB DRD controller, DWC3 peripheral mode, and
USB PHY nodes on the Samsung Galaxy A8 (2018) with a temporary dummy
fixed regulator.

> diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/=
arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> index 4b1961ca365be..5550b21e4113b 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts

[ ... ]

> @@ -112,3 +118,17 @@ key_power: key-power-pins {
>  &serial_2 {
>  	status =3D "okay";
>  };
> +
> +&usbdrd {
> +	status =3D "okay";
> +	vdd10-supply =3D <&reg_dummy>;
> +	vdd33-supply =3D <&reg_dummy>;
> +};

[Severity: Low]
This isn't a bug, but per the Devicetree coding style (and matching
&mmc_0 in this file), should status =3D "okay" be placed last in &usbdrd
after a blank line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123092244.1792=
040-1-virag.david003@gmail.com?part=3D5
