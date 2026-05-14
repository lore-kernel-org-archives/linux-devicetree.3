Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE6B3C1419
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 21:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778794949; cv=none; b=gpD/Q5264XmIDkD/6CqNj8i9Khr8lGSiNveamJBditEXT1SORfNC1sptGWNPIT6v3wltoRwOAPTuL0IUCUNf2KY7Jy6ujxJc4/PprZww+wTiDMYswC3udC+rz2PyV/VxJnUt7ZF0QCdXZjxUatjp68CpxNLuBP+6U2EH+IJ28jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778794949; c=relaxed/simple;
	bh=d6AklNgFdujuKRrprH6cgPzYkNa7V5IA7RkrdauDs+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HfEoxL/270IsGAnu3uqpbtL8ZiVR2DtitUKf7CpgLf69jzD8U339HCXJgD4dDLaVpYJMqy7Q82664NBG2sYBtcz6oN1TLhRt1yiZil/NKVtC/Sr6YStIghjqDRzK9s0ojTZmSGqWcHHikGXQSFdGEuJQHvBQDaj/hDBeWqqzjrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slPrTBAR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slPrTBAR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A08DC2BCB3;
	Thu, 14 May 2026 21:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778794948;
	bh=d6AklNgFdujuKRrprH6cgPzYkNa7V5IA7RkrdauDs+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=slPrTBARwPYg3kn7f5iV47plXtX9CmI3wXSNFjJlSJbB9PA5dalFmxJ9ghPUDR1Yw
	 SRialBpAJ5ghKDGceAO2VmHIi9PivigzL1f7GKHxx1HVoUzW7nwfZDVEwoOB9URG8p
	 Mec0JBeEemyVa0dou3KuujZsRXuyYHFL3WPb1nhrvYVrZFOfMFwtSNOIVGFV88+T1v
	 hubb6QJ63dGmbwGcNwXy0FsQ6IW5cSjX/BT4TfaQSAtVxVLRqOqmsQmXtBlmFkkLnz
	 Dm2zWi7O+2Z/aMInsrGL2opmyN/d+Ktme/9HAvJmNbc29BYtb0Lcj5q9OHd22TWjMp
	 4i/F5Gfaf1YMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrizio Castro" <fabrizio.castro.jz@renesas.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
References: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 21:42:28 +0000
Message-Id: <20260514214228.9A08DC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Adding pin configuration properties causes the MMC driver probe to=
 fail because the pinctrl-rzt2h driver lacks pinconf support.
- [Medium] Card Detect (CD) pins are incorrectly grouped with CMD pins, ina=
ppropriately applying high-speed settings like 'input-schmitt-disable' to a=
 mechanical switch input.
--

commit 90a6446de76af95b915ef59d0035481394029848
Author: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins

This commit configures the eMMC and SDHI interface pins for the Renesas
RZ/T2H and RZ/N2H EVK. It adds drive strength, slew rate, and Schmitt
trigger settings for various bus modes.

> diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch=
/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> index 510399febf295..2b43852257974 100644
> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -274,12 +274,63 @@ data-pins {
>  				 <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0_DATA5 */
>  				 <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0_DATA6 */
>  				 <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0_DATA7 */
> +			drive-strength-microamp =3D <5000>;

Does adding these pin configuration properties cause the MMC driver probe to
fail?

It appears the pinctrl-rzt2h driver lacks pinconf support, as its
desc->confops is NULL.

When the MMC driver probes and attempts to select the default pin state,
pinctrl_commit_state() will call pinconf_apply_setting(). Because ops is NU=
LL,
pinconf_apply_setting() logs "missing confops" and returns -EINVAL.

This structurally aborts the state transition, which would cause the eMMC
and SDHI interfaces to become completely unusable.

[ ... ]

> @@ -298,12 +349,49 @@ data-pins {
>  				 <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
>  				 <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
>  				 <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0_DATA3 */
> +			drive-strength-microamp =3D <5000>;
> +			slew-rate =3D <1>;
> +			input-schmitt-disable;
> +		};
> +
> +		clk-pins {
> +			pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* SD0_CLK */
> +			drive-strength-microamp =3D <9000>;
> +			slew-rate =3D <1>;
>  		};
> =20
>  		ctrl-pins {
> -			pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
> -				 <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
> +			pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
>  				 <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0_CD */
> +			drive-strength-microamp =3D <5000>;
> +			slew-rate =3D <1>;
> +			input-schmitt-disable;
> +		};
> +	};

Is it safe to apply input-schmitt-disable to the Card Detect (SD0_CD) pin?

The Card Detect pin connects to a mechanical slot switch, which typically
experiences contact bounce during card insertion and removal. Schmitt trigg=
ers
are required to provide hysteresis and debounce such signals.

Disabling the Schmitt trigger on the CD pin removes this essential protecti=
on,
making the system susceptible to noise and false card detection interrupts.

Furthermore, configuring output properties like drive strength and slew rate
on a pure input pin seems semantically incorrect.

Should the CD pin be isolated into its own cd-pins subnode without these
high-speed properties, analogous to how SD0_RST# was correctly separated in
the eMMC configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514210220.7616=
-1-fabrizio.castro.jz@renesas.com?part=3D1
