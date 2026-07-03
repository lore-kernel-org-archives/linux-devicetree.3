Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B6F253340
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783083371; cv=none; b=dDcsES7YyrU+DKpUSkNlGSF778XwSZdEDfxqlhOsEI5zxxYSOD0BE8+sno30WzG5HEqEGR5YQ2m06OEK4eDcOXT22apL6puV0Ia+f7tGVcZzw9uGtBlzIXZWPn0e8+cFnfF9x+N+zhA1HTJz1ibJ/98g7bEi00gJlq7A6rISH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783083371; c=relaxed/simple;
	bh=XKenb24cyHA07A8u+hB3j6Qubru48od1kWVkkCKhjww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QGem9h3yyYibP54rphLxZmsli2TMbOoS8m2wW2laTJUIY2wdhD8aRo0TlGQbQML7OSwn9X/K3AqBUAk3PmneO5jkI5bKbUViXNnX/U1rXukLmc3np2SgqD2NCZB/PtRAZ6umZ+beNOfCPiB1dI0B9H9P846LITdvOIHIfkMvdSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcmlTrMC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcmlTrMC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8511F000E9;
	Fri,  3 Jul 2026 12:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783083369;
	bh=aKtJOQ1rHhkzGixkXPfLffFEwB1x7/PR7U2gCPhrnEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kcmlTrMC2NtVJ200PHdsBaMpYbxP/4KoeD1JSdWagNMiyOEiF8fru+hdeW4dMFEIL
	 U1B0PoKYECeQ35cYsfR1gFknBhEfPe2ypLBkJLC6ZBJwfCW/92b3IkHxUAR6VMT7j9
	 W6BnrIfTIWopaNPhnPSkv/upJbDyeOGOAxXJEY9XtECA2vVEf4frV7nOk5OuTgN4ti
	 ogjZfFwn8dxSz1BfGP8P+XgJ8C2wCQ3Ft0JPju+1tK8MzGYqjX561ouS4iJnyikuOV
	 7vCxheOO395you2Grburi6bEavNsu5ibN85kIoteZaMNKk99BO+hVg2FtkSd8bGzuc
	 kjuYWKU9NcvVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 3/3] arm64: dts: renesas: r8a779g0: Add gPTP
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702125525.2230427-4-niklas.soderlund+renesas@ragnatech.se>
References: <20260702125525.2230427-1-niklas.soderlund+renesas@ragnatech.se>
 <20260702125525.2230427-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 12:56:08 +0000
Message-Id: <20260703125609.8C8511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Resource conflict and probe failure due to overlapping MMIO mappin=
gs between gptp and tsn0 nodes.
- [High] Hardware state corruption of the shared gPTP module due to an unco=
ordinated shared reset line.
--

commit 6d2ee2b897e0e7be7fd397823f8cda63b923ce38
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

arm64: dts: renesas: r8a779g0: Add gPTP node

The gPTP module is shared between the RAVB and RTSN Ethernet devices on
the SoC.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 82a7278836e57..b9b860ef70351 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -589,6 +589,15 @@ tmu4: timer@ffc00000 {
>  			status =3D "disabled";
>  		};
> =20
> +		gptp: ptp@e6449000 {
> +			compatible =3D "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> +			reg =3D <0 0xe6449000 0 0x500>;

[Severity: High]
Will this result in a probe failure when requesting the memory region?

The new gptp node claims the 0xe6449000 memory region here, but the
existing tsn0 node below incorrectly retains the exact same region.

The drivers for these nodes both request exclusive access to the memory:

drivers/ptp/ptp_rcar_gen4.c:ptp_rcar_gen4_probe() {
    ...
    priv->base =3D devm_platform_ioremap_resource(pdev, 0);
    ...
}

drivers/net/ethernet/renesas/rtsn.c:rtsn_probe() {
    ...
    ptpaddr =3D devm_ioremap_resource(&pdev->dev, res);
    ...
}

Since these wrappers enforce exclusive access, whichever driver probes
second will get an -EBUSY failure.

Should the tsn0 node be updated to drop this overlapping region?

> +			clocks =3D <&cpg CPG_MOD 2723>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 2723>;

[Severity: High]
Can an interface reset corrupt the shared gPTP hardware state?

The gptp node is assigned the shared reset line 2723 here, and the commit
message notes that the gPTP module is shared between the RAVB and RTSN
Ethernet devices.

However, the rtsn driver aggressively asserts this shared reset line:

drivers/net/ethernet/renesas/rtsn.c:rtsn_reset() {
    ...
    reset_control_reset(priv->reset);
    ...
}

If a network administrator toggles the tsn0 interface state, will this
abruptly wipe out the clock state of the shared gPTP hardware and break
other consumers like RAVB that rely on it?

> +			status =3D "disabled";
> +		};
> +
>  		tsn0: ethernet@e6460000 {
>  			compatible =3D "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethert=
sn";
>  			reg =3D <0 0xe6460000 0 0x7000>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702125525.2230=
427-1-niklas.soderlund+renesas@ragnatech.se?part=3D3
