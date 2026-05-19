Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A7E481226
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185131; cv=none; b=ltDsYSydGdbLzfriKnBuuYlAVFW/RZ/i5B6gkm2FpO5NFdhyl2MgU+pgjGBuF/e1yWyZb5EQfxegBf4AIDFs5/gRKpj2QdcCm2qvDqqe3lUBr67Uq9p+UEJW49TxOEhra3hRHZOx76Kgimau//YAv2nm53ViGIYHQU8uZYXzXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185131; c=relaxed/simple;
	bh=aiUu22fKEZ4R4sr/3LrVL3QdROkel8+gW0mlvYT0JP4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ahti2lRVd+hLAGKmdkEiVQWRipGPHCw2WwOncBD8MQi9mto6ML6vh5TA4HKzBFmWxLdAMgAa3GYR97ObQVdjIO9jzelvqmpK9XEBHEsAwjYzh49vOZuX5LAPhNYcOeDjrXqsCW5yyPulQser0bn2qIyYx8ZEtWmgvIvQMC5zEW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoTeWcTZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoTeWcTZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE879C2BCB3;
	Tue, 19 May 2026 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779185131;
	bh=aiUu22fKEZ4R4sr/3LrVL3QdROkel8+gW0mlvYT0JP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hoTeWcTZIGicXn1auNUdIVpCXKpoWLZe5i+pAshPv2tGLz7LuKGTJyxMDW9RDoGHN
	 ehwSFEV22Rxn7x98NH9L3BwvYNmIuwGvyv1gX6yNTA+Es/CZvUkTOvFedeeLdvl+WW
	 pAkgXFkeI1uZ/HuQOYSMKuKXtqCAPFjNd7uGgo0+li5Aef2ifgYEYBwm+6CM6zgPqq
	 5PPABgIB8aFZjAhZbxBITfynoocNgtFs3WYSfwBEUilmYuPZPhn1x6qnT5CMq2I0IO
	 4f4ammqjw9IOnETptfw79FP/fa3w0VSAukI6r1Ud/lhf2Y13beMALfo5yuMJ/0F19V
	 AGFvnj6kbSlcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vcc_sdio regulator max
 voltage on Pinebook Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hugo Osvaldo Barrera" <hugo@whynothugo.nl>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519094439.7918-1-hugo@whynothugo.nl>
References: <20260519094439.7918-1-hugo@whynothugo.nl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 10:05:30 +0000
Message-Id: <20260519100530.CE879C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch leaves `vcc3v0_sd` incorrectly defined as 3.0V, causing =
Linux to misconfigure `vcc_sdio` and expose the RK3399 I/O pins to overvolt=
age from the SD card.
- [High] `vcc_sdio` remains powered during suspend while the SD card VDD is=
 removed, causing potentially damaging back-powering.
--

commit 2b1796d52c7328502f3af71aefe96d0d149cf297
Author: Hugo Osvaldo Barrera <hugo@whynothugo.nl>

arm64: dts: rockchip: Fix vcc_sdio regulator max voltage on Pinebook Pro

This commit updates the vcc_sdio regulator to support a maximum of 3.4V,
matching the hardware capability. This fixes downstream u-boot issues where
it falls back to 1.8V, preventing SD card boot.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/=
arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> index b5c05928142c0..f21fcdc1b49a5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> @@ -526,7 +526,7 @@ vcc_sdio: LDO_REG4 {
>  				regulator-always-on;
>  				regulator-boot-on;
>  				regulator-min-microvolt =3D <1800000>;
> -				regulator-max-microvolt =3D <3000000>;
> +				regulator-max-microvolt =3D <3400000>;

This isn't a bug introduced by this patch, but should the vcc3v0_sd regulat=
or
also be updated to 3.3V?

The vcc3v0_sd regulator is defined as 3.0V in the DT, but it is a fixed load
switch powered by vcc3v3_sys (3.3V), so the SD card physically receives 3.3=
V.

The MMC core relies on vcc3v0_sd to determine the maximum SD card voltage,
limiting the I/O voltage (vqmmc, mapped to vcc_sdio) to 3.0V.

With the SD card operating at 3.3V and the RK3399 I/O pins powered at 3.0V,
will the SD card drive 3.3V data lines into the 3.0V I/O pins? This exceeds
the RK3399 absolute maximum rating for I/O pins (VCCIO + 0.3V), which could
risk hardware degradation and latch-up.

> =20
>  				regulator-state-mem {
>  					regulator-on-in-suspend;

This isn't a bug introduced by this patch, but does keeping vcc_sdio on dur=
ing
suspend cause back-powering issues?

The vcc_sdio regulator is configured with regulator-on-in-suspend and
regulator-suspend-microvolt =3D <3000000>, keeping the RK3399 sdmmc I/O dom=
ain
powered at 3.0V during suspend.

However, the SD card's main VDD supply (vcc3v0_sd) has regulator-off-in-sus=
pend,
dropping to 0V.

With the I/O lines pulled up to 3.0V by the RK3399 and the SD card unpowere=
d,
can current leak through the SD card's internal ESD protection diodes, drai=
ning
the battery during suspend and potentially causing latch-up or damage?

Since vcc_sdio only powers the sdmmc-supply IO domain on this board, should
its state memory be changed to regulator-off-in-suspend to match vcc3v0_sd?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519094439.7918=
-1-hugo@whynothugo.nl?part=3D1
