Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8D92C11CB
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256597; cv=none; b=GKjSv3qcw0kwtqNgcVuFCE59rnRovC0P57grQqamMUfmz4p4iiqqyJ+x+UvYMomct4rvX+2IffHB48NOfcKZWQnVxRS5U1s0ZihD8de8eqVsvmsmajEo3eo+RyTUagLuT0F1ri+yjINI+Rkh6YghMvaW3uiiEpyKdP6xn60eLfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256597; c=relaxed/simple;
	bh=lg/UiRY72XCAB17blRbtxaQT2BGie8hd1wOZaiQ7//o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jalsmt7KTruHI1w5SozvBbVkcpnccuEc/r/Lh0SnIuRN+x1aUybYiSPJ1rXN0TjTSJ1astvIbmg0sFhzVr594h2x+dfmdw2BRl0jBiXTYz2PoSxQzdhaKf2b3N3qMe3AU91odbchuuqEkzFioch6GhtC6eRpnTWOV0eby9RqxTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e169tBQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e169tBQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2B61F000E9;
	Wed, 20 May 2026 05:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779256595;
	bh=ZBERNZG61n82/2V3mw4S2slT/zqHMfd5gHXrJJsH3yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e169tBQ3CDkZ3Q6bnrbn5Ck+Xqgq5tBtxlbxwPKW9K3bgDYzaurufv9OvjI+nW2+s
	 wA9CkkYDKss7dbclg9UDg+dXygxOh00dxHEUpuwXHcc6oWShucwc+lKP8+AOaE0OAE
	 4yJIUC9HuEeyd5GpSoujasqIedkQklSbhHgg+N2tCEhwvpazK9CVIDRrPjy7NWqsbg
	 26TlJR5YbfN9WQ0Ik08NjQyKHxLRpzDsOq1kxt6b5F9ONdbz7BO7KobdmTxuTL3OfJ
	 cRiGLmHQzOuTW78wgbjQ+OBDYHpxwzwT2xONpRUZrsed88ACAZ+9FszcoWFswYu1Z5
	 D1+HB0EK5Q9aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Initial support for
 CoM260-IFX board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520-02-k3-com260-ifx-v1-2-3e17055dd488@kernel.org>
References: <20260520-02-k3-com260-ifx-v1-2-3e17055dd488@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 05:56:34 +0000
Message-Id: <20260520055635.5F2B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The PMIC node is incorrectly named `p1@41` instead of using a gener=
ic name.
- [Low] The pinctrl node for `gmac1` defines an unused label `gmac1_base_pi=
ns:` and uses an inconsistent subnode name compared to `gmac0`.
--

commit be83cb21ec8e4b52ccd315661d69460e85196cef
Author: Yixun Lan <dlan@kernel.org>

riscv: dts: spacemit: k3: Initial support for CoM260-IFX board

This commit introduces initial device tree support for the K3 CoM260-IFX
board, which combines a 260-pin compute module with a carrier board. It
enables basic features including Serial UART, ethernet, and the onboard PMI=
C.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boo=
t/dts/spacemit/k3-com260.dtsi
> new file mode 100644
> index 0000000000000..1801a44d43559
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
[ ... ]
> +&i2c8 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c8_cfg>;
> +	status =3D "okay";
> +
> +	p1@41 {

[Severity: Low]
This isn't a bug, but according to the Devicetree specification, node names
should be generic and reflect the function of the device rather than the ch=
ip
name. Could this be named pmic@41 instead of p1@41?

> +		compatible =3D "spacemit,p1";
> +		reg =3D <0x41>;
> +		interrupts =3D <64 IRQ_TYPE_LEVEL_HIGH>;
[ ... ]
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k3-pinctrl.dtsi
> index 23899d3f308a0..04efe64b8a3a2 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
[ ... ]
> @@ -45,6 +45,39 @@ gmac0-phy-0-pins {
>  		};
>  	};
> =20
> +	gmac1_rgmii_0_cfg: gmac1-rgmii-0-cfg {
> +		gmac1_base_pins: gmac1-0-pins {

[Severity: Low]
This isn't a bug, but the gmac1_base_pins label appears to be unused.

Also, is there a reason this subnode is named gmac1-0-pins instead of
following the gmac0-rgmii-0-pins naming convention seen elsewhere?

> +			pinmux =3D <K3_PADCONF(21, 1)>,	/* gmac1_rxdv  */
> +				 <K3_PADCONF(22, 1)>,	/* gmac1 rx d0 */
> +				 <K3_PADCONF(23, 1)>,	/* gmac1 rx d1 */
> +				 <K3_PADCONF(24, 1)>,	/* gmac1 rx_clk */
> +				 <K3_PADCONF(25, 1)>,	/* gmac1 rx d2 */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-02-k3-com2=
60-ifx-v1-0-3e17055dd488@kernel.org?part=3D2
