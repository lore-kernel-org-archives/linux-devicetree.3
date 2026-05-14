Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCF83F4106
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778786516; cv=none; b=VrMeWSmblGR4Fbykeup+Yr8oGUmqjjm54svcTRVxoHRye9pob9vKhx3DI/i74q5v7RWm9Wba6zD7wV7C6LD+UbGptOqi7Xn227i1Zpvr1duIBiy+PlHttUUL3LmMTM/eZyHVfmlTPaB+uNbm+YsAUl/u1SvzujOxegbmc3/DwmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778786516; c=relaxed/simple;
	bh=G3SN3SMhyZep59myPVkPDqo2OPzTJshMIK8y0Pe+V04=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uq3h9lcvO8MAnJJonmU2f82zD8zSlkLFTXznTVXDc6HMMgkgmnTx2BmSOQ5GWIc/g0dPl0fSnfBzaJVwY17cx4Ebvm5oHlPuOs1FGy/qZlCedZN1l43qCEfpyHtrem+5zfo99cKjr19HpQ4v660uFCFfuLrJw6vsG7Jvl8vLMws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vo0Pjhvc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vo0Pjhvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AF4C2BCB3;
	Thu, 14 May 2026 19:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778786515;
	bh=G3SN3SMhyZep59myPVkPDqo2OPzTJshMIK8y0Pe+V04=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Vo0PjhvckXLIYg3LcIAbUdsXKo8K7G3OTDXKbcMuLTMBjphNy+IFSh/DUZTnkCNUb
	 aWtaPj/uOT6CZ2dXnOhjKt1VE6yEHeSO4LApYb9fCFoh3CBdFwcFADBWp3pCy2Vhtk
	 arTSFuAxDPzcUDGf4JZ74N3jndLDQmpSOCiYSX1CA6U0YWZ+MWQhzYHhp4P1kkT7Dt
	 /lo1ftYk3n5CKgK7Drb7Mk4/pVHXenJiNbPerW5Li2svC9ZS6oAO/d/40GiGwyoNsP
	 smffxBmWBjAJH1rsnOlzFvrkpzl0BqH+U84K85MSjTrboCR7Q4ofvCs8s2hV442Tcs
	 VBlceVhB3n6nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1
 Redistributor description
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514125328.20954-1-marek.vasut+renesas@mailbox.org>
References: <20260514125328.20954-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:21:54 +0000
Message-Id: <20260514192155.54AF4C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] DT fragmentation creates a booby trap leading to a fatal Data Abor=
t if booted in View 0.
- [High] Splitting regions makes the GIC probe extremely brittle to sparse =
CPU topologies.
--

commit ff8b7280cc2b6f0b2be6c7d236cd18a4ed49d89b
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1 Redistributor descripti=
on

This commit splits the contiguous 8MB redistributor region into 32 separate
256KB regions. This attempts to work around the GIC-720AE View 1 behavior
where the first redistributor returns GICR_TYPER.Last =3D=3D 1.

> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/=
dts/renesas/r8a78000.dtsi
> index 4c97298fa7634..fd268604c0ec5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -689,8 +689,40 @@ gic: interrupt-controller@39000000 {
>  			#interrupt-cells =3D <3>;
>  			#address-cells =3D <0>;
>  			interrupt-controller;
> -			reg =3D <0 0x39000000 0 0x10000>,
> -			      <0 0x39080000 0 0x800000>;
> +			#redistributor-regions =3D <32>;
> +			reg =3D <0x0 0x39000000 0x0 0x10000>,
> +			      <0x0 0x39080000 0x0 0x40000>,
> +			      <0x0 0x390c0000 0x0 0x40000>,

Could this cause a Data Abort if the system is booted in View 0?

Because the Device Tree binding doesn't currently support setting
single_redist =3D true for these regions, each 256KB region is mapped exact=
ly
to that size via ioremap.

If booted in View 0, the hardware operates normally and intermediate
redistributors return GICR_TYPER.Last =3D=3D 0.

The GIC driver's gic_iterate_rdists() inner loop relies entirely on the
GICR_TYPER.Last =3D=3D 1 bit to break. Without it, the driver will advance =
ptr
and attempt to read gic_read_typer(ptr + GICR_TYPER) exactly at or beyond t=
he
256KB ioremap boundary, triggering a Data Abort and kernel panic during ear=
ly
boot.

Would it be safer to keep the DT as a single continuous region and add a
hardware-specific quirk to the GIC driver to bypass the LAST bit?

Additionally, does splitting these regions make the GIC probe brittle on
sparse CPU topologies?

If a redistributor is missing, such as a fused-off core, and returns an
invalid PIDR2, the driver will issue a warning and execute a break.

This break exits the entire outer for loop in gic_iterate_rdists(),
immediately aborting the discovery of all subsequent redistributor regions.

Any present CPUs located after a fused-off core would then fail to be
probed and will fail to boot.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514125328.2095=
4-1-marek.vasut+renesas@mailbox.org?part=3D1
