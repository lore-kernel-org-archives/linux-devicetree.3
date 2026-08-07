Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0683B1006
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092264; cv=none; b=Wf8TGzZgdFWbNew/vbXUGlFflxK5llbQBhxrIDVxJECQHLEvKr4/iedQC2s7OowsM2dIWtNEN/Wp94u+2R7ia2xlV0gJxiPa/0yXUpu4Yb6RYgN3heJX/rYKpVgRB+WcmIXOv4fYIUi4xrDKeoj8FHKgd6Bu8zytN2SFUKfTb8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092264; c=relaxed/simple;
	bh=VYpC7SyxVAKpfMRqHWlj3TRZ1XFbbO41s03zU2Wtpi4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gYSqpoeI+5KjG6kxPbDnmICGSIEEEFWXrvJygrFgHTOv51BSlXkUMPhOL8E83OdUj1R000VqDkJIWFpMzA03KWpkzYQjxb1+VqTsBZszljxAc3RC4hNWTX9ILUOtgWyGatHneAkwOyGPCidVnwKm+eOyBSMdNmry0390ot9+9FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1u1Byva; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1u1Byva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C0C1F000E9;
	Fri,  7 Aug 2026 08:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092259;
	bh=MvYlstslJvWGc3YnD8F+En7vRrggdF5n5DMfA6Ch3Yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l1u1ByvaUWKaCXEsLVoamAevqZVMRCf6KC6xsv+K/u+zo0TJHJFDVNl80vuFiNJTD
	 DVSHcf90XaObL+39SuiJrFB5xl4g58odStpqOqTDicy9hl5e26qBVeSv9zoI60MP7x
	 k4dit0yG38wkfFnOI5QKH1LmRmdiml+VcPd2XBglOWTJGQ1OPPqJGCaH8SPDB6X2v1
	 Mo8dOi87Y3e3kof6+sUXLwX7BZbGIJM8tGxXnBgppeK+36Tsa6jEK/lSOKm1wJg2be
	 piBbv5BmjnnH0MbbVEahsalQ/aL0ewil0rDEY54SCH9M9B+lgUMvKYfg9ZbMincKFY
	 5V64i6SV4uAsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] ARM: dts: aspeed: santabarbara: Add system
 monitoring GPIOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fred Chen" <fredchen.openbmc@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807083415.672008-2-fredchen.openbmc@gmail.com>
References: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
 <20260807083415.672008-2-fredchen.openbmc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:44:18 +0000
Message-Id: <20260807084419.46C0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The pre-existing gpio@27 node was not updated to route its inter=
rupt to the new ioexp0 aggregator, breaking the intended design.
- [Medium] The newly added gpio@28 node uses an I2C address (0x28) that is =
physically impossible for a standard PCA9555 chip.
- [Medium] The gpio@23 downstream expander node is missing from the device =
tree.
- [Medium] Conflict between interrupt assignments and SGPIO pin names for g=
pio@74 and ioexp0.
--

--- Patch [1]: [PATCH v3 1/5] ARM: dts: aspeed: santabarbara: Add system mo=
nitoring GPIOs ---
commit 8d0ec3e4ec2df315ded9be783e4deeb197721ee9
Author: Fred Chen <fredchen.openbmc@gmail.com>

ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs

This commit adds several GPIO expanders on the switch board for NIC, PEX,
and cable presence monitoring. Due to a design change, ioexp0 (0x20) now
aggregates interrupts from the downstream expanders (0x21-0x27) onto a
single sgpiom0 line.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dt=
s b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
> @@ -616,6 +616,8 @@ gpio@74 {
>  				reg =3D <0x74>;
>  				gpio-controller;
>  				#gpio-cells =3D <2>;
> +				interrupt-parent =3D <&sgpiom0>;
> +				interrupts =3D <146 IRQ_TYPE_LEVEL_LOW>;

[Severity: Medium]
Does this interrupt assignment conflict with the SGPIO pin names?

The interrupt 146 is assigned to gpio@74 here, but in sgpiom0's
gpio-line-names, line 146 is labeled 'FM_SMB_ALERT_MCIO_0A_N'.

Is this an intentional override or a hardware description mismatch that
could lead to incorrect interrupt handling?

[ ... ]

> +	ioexp0: gpio@20 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +		interrupt-parent =3D <&sgpiom0>;
> +		interrupts =3D <148 IRQ_TYPE_LEVEL_LOW>;

[Severity: Medium]
Similar to the issue above, interrupt 148 is assigned here to ioexp0,
but sgpiom0's line 148 is named 'I3C_MCIO_0B_ALERT_ISO_R_N'. Could this
conflict cause misinterpretation of alerts?

> +		gpio-line-names =3D
> +			"IOEXP_21h_INT_N","IOEXP_22h_INT_N",
> +			"IOEXP_23h_INT_N","IOEXP_24h_INT_N",

[Severity: Medium]
The commit message states that ioexp0 aggregates interrupts from the contig=
uous
downstream expanders range 0x21-0x27, and the line names here explicitly
reserve pin 2 for 'IOEXP_23h_INT_N'.

However, there doesn't seem to be a gpio@23 node provided in the device tre=
e.
Will the hardware connected to the 0x23 expander be unmanaged by the kernel?

[ ... ]

>  	gpio@27 {
>  		compatible =3D "nxp,pca9555";
>  		reg =3D <0x27>;
> @@ -1349,6 +1457,21 @@ gpio@27 {
>  			"SPI_MUX_SEL","","","";
>  	};

[Severity: Medium]
Since the commit explicitly changes the design to route 0x21-0x27 expander
interrupts to ioexp0, should this existing gpio@27 node also be updated with
an 'interrupt-parent =3D <&ioexp0>' property?

Without it, will the physical interrupts on the gpio@27 INT_N pin assert
ioexp0's line 6 but remain unhandled, potentially leading to an interrupt
storm?

> +	gpio@28 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x28>;

[Severity: Medium]
Can the PCA9555 physically respond to address 0x28?

The NXP PCA9555 hardware typically has 3 address pins (A0, A1, A2) and a fi=
xed
base of 0x20, meaning its valid 7-bit I2C addresses are strictly 0x20 throu=
gh
0x27. Will the kernel fail to probe the PCA9555 GPIO expander at this addre=
ss?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807083415.6720=
08-1-fredchen.openbmc@gmail.com?part=3D1
