Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14C31F993
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779947132; cv=none; b=jlL3pK/xfayzv3w+SPyUEbkmMfM+h7St90LUH3KjYSAU2CK60WSsUL8W37fcVCUYL/TLfAgxzrzJZoQtAl0kZduNScLePBwfQw0mL84VEeKkzgkmIeN5YGMiHz+tDQbmReDo78nGnVOTjdpxoiMM9G96XIHsInZyACCxidorPJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779947132; c=relaxed/simple;
	bh=+BRY5Ev2OjsvbCVdAE+7YhGkWHuzg9WQhnS/0LU3TUk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tNJAJUlGN2wacx7rzFWGfYWXxx+rOBrPg+iKZHQjzIKE3OK6a891Yt0T2oHFuhwZTe3tyW3JyCHlKY8aqeWBkM86uHQNWXqryjVrB2iK+N6zZLfJ3/ctJOF3Bt8QIaS19k75Xfg5R4veTeFnw1Dq0A7SpcoOcgRJY12cgc1k6dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVe2FdKs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVe2FdKs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB70E1F00A3A;
	Thu, 28 May 2026 05:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779947131;
	bh=vrJpv7Z9CYykUTwq3qpLIvyV5BObPw3ltosYYcwZNpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GVe2FdKsGbHQFwv1G3h7L9VOK9+VB26D2T36RFDMN67WAdTxngZLBQcP1tH9fmPI/
	 ph+qLzWDDXK79v+pPdvrvKWtYJIbWY5Wbi4/umlf7X0/BTJ+B6M4bQg7uWTjprX8Oo
	 IcZGwdDaAa9bcT8cyy1GNa0TVQd20YJfiHyiTYZSDlH8yWx88oDsZ5WC2zigO/bYFY
	 xArSC7oKsBkJNraPf1jOXtsZpVffyhFAWSaJwj0z+oPzv1n3WCHnndKhZa60IH5dvV
	 gHjF/3ZGTK+DqADllyvzdVm7Exw64b/s9B/I0VMDozJduHQFnJIClSwcfDH1vjLIyb
	 cvckoD/D6ELJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref
 into independent pinctrl groups
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260528-bpi-cm6-v2-2-d0eb3f236cea@pigmoral.tech>
References: <20260528-bpi-cm6-v2-2-d0eb3f236cea@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 05:45:30 +0000
Message-Id: <20260528054530.DB70E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch separates `gmac_clk_ref` pins into independent pinctrl g=
roups but fails to update the OrangePi RV2 board device tree (`k1-orangepi-=
rv2.dts`), silently dropping its Ethernet reference clock pinmux configurat=
ion.
--

commit 4736202eaeb8dff5f83c1f6977e4a98ac6644bcc
Author: Junhui Liu <junhui.liu@pigmoral.tech>

riscv: dts: spacemit: k1: Split gmac_clk_ref into independent pinctrl groups

The gmac_clk_ref signal is optional for the GMAC controller and is not
strictly required for all hardware designs. The pins for gmac0_clk_ref
(GPIO 45) and gmac1_clk_ref (GPIO 46) may also be used as GPIOs for
other functions even when the Ethernet controller is active.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k1-pinctrl.dtsi
> index b13dcb10f4d66..39682e8b4ed91 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -27,8 +27,16 @@ gmac0-pins {
>  				 <K1_PADCONF(11, 1)>,	/* gmac0_tx_en */
>  				 <K1_PADCONF(12, 1)>,	/* gmac0_mdc */
>  				 <K1_PADCONF(13, 1)>,	/* gmac0_mdio */
> -				 <K1_PADCONF(14, 1)>,	/* gmac0_int_n */
> -				 <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
> +				 <K1_PADCONF(14, 1)>;	/* gmac0_int_n */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <21>;
> +		};
> +	};

[ ... ]

> @@ -51,8 +59,16 @@ gmac1-pins {
>  				 <K1_PADCONF(40, 1)>,	/* gmac1_tx_en */
>  				 <K1_PADCONF(41, 1)>,	/* gmac1_mdc */
>  				 <K1_PADCONF(42, 1)>,	/* gmac1_mdio */
> -				 <K1_PADCONF(43, 1)>,	/* gmac1_int_n */
> -				 <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
> +				 <K1_PADCONF(43, 1)>;	/* gmac1_int_n */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <21>;
> +		};
> +	};

[Severity: High]
Does this change silently drop the Ethernet reference clock pinmux
configuration for the OrangePi RV2 board?

The k1-orangepi-rv2.dts board file still relies on &gmac0_cfg and &gmac1_cfg
but wasn't updated in this patch to include the new &gmac0_clk_ref_cfg and
&gmac1_clk_ref_cfg groups. Without this update, OrangePi RV2 will lose the
pinmux configurations for GPIO 45 and 46, which may cause network failure.

The commit message mentions an intent to preserve the previous pinmux behav=
ior
for boards without public schematics. It seems the omission of OrangePi RV2
breaks this contract. A search forward in the patch series confirms this is=
sue
is not resolved by a later commit.

Could k1-orangepi-rv2.dts be updated to include the new pinmux groups to
preserve its original configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-bpi-cm6-v2=
-0-d0eb3f236cea@pigmoral.tech?part=3D2
