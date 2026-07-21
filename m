Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7C74657F5
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629882; cv=none; b=YJKd2+DZliYiBefE8NyLs1NQkdgR+jzL3iFPonQIlT7uCahYjpRljIBSpykyaaAf42ZwMt630q48H8jrzlpD1PurQ9FGzzValrwMw8WPTgfGKNs8T0V1iUf7gcI2ZYkJ0in6VcMi95sWqgJLN3gxxY/81vhJocPwyhe6y6PJ/vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629882; c=relaxed/simple;
	bh=tg3nBOShncXKkeLckJjUP4he0Qga4ERoR01MJVLMq34=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ixk57qVDD2fsTLa+nNR5AVo2J2sS9T4Xa6qcO81GQffOGBU9v1CmXgz2r7/h+deegRAAqbPsUK2fOO5BJKIC4kCGsegQpJgoOsjHzaE31P3Hebpy0Cu6vFh/li2vdWdV6C3vpeKQ/msoGM3aiQNGNwBUPjEpFtzy6omRUMdzXsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSN0Fd+A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSN0Fd+A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40251F000E9;
	Tue, 21 Jul 2026 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629881;
	bh=nsS/U2Z4gIKp8ufEiXWI0Xd/jG8uk2xZu4gCabyRasw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BSN0Fd+A/lFIzT3UOfe8ueqaAyO1wYaNiLDdZLd8Nf1V7WxokGreOKz5Eg4AkJ3iA
	 VEptoXNWZylCqemvaJxiJJkU6CEAN4sMhNk1Dd1ZvH/vxuMxWX1HMp8XQUgj63Kcmi
	 OGgHQ54ujushaegu+cYN1NFkblgku8ZfBNCsmPVzxiDlWW2nf0OZJoo7lFTfWNEplx
	 2nrZKLd98RKcxglGb503gsB97wintxjaM2bZzSFUdJdOv9x6EYL+DS6cnH4oU3/AqG
	 wFYh5cYOXiohmUs/e81xCmT/vGlQMfJPzZQbn30bLozcLvUVZ4cxpIxbG5sCFUcJAq
	 dBm96UvMBFhkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/10] ARM: tegra: tf701t: Add MC and EMC timing
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721101059.451699-4-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:31:20 +0000
Message-Id: <20260721103120.E40251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The `emc-timings-0` node added to `clock@60006000` violates the =
`nvidia,tegra114-car` DT binding (which enforces `additionalProperties: fal=
se` and explicitly rejects `emc-timings`). Furthermore, `clk-tegra114.c` la=
cks the specialized `tegra_clk_emc` driver and does not parse these timings=
, rendering the EMC DFS functionality incomplete and the device tree additi=
on dead code.

Pre-existing issues:
- [Critical] `tegra114_emc_probe()` triggers an out-of-bounds heap write vi=
a type confusion. It unconditionally calls `tegra124_clk_set_emc_callbacks(=
)`, which looks up the `"emc"` clock and uses `container_of()` to cast its =
`clk_hw` pointer to a `struct tegra_clk_emc`. However, on Tegra114, the `"e=
mc"` clock is initialized by `tegra_periph_clk_init()` as a `struct tegra_c=
lk_periph_gate`, which is much smaller. Writing the callback pointers into =
this structure overwrites adjacent SLAB memory.
--

--- Patch [3]: [PATCH v2 03/10] ARM: tegra: tf701t: Add MC and EMC timing n=
odes ---
commit 2497fc2e2b1505b1ff38584be3fcc67d52de87c4
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: tf701t: Add MC and EMC timing nodes

Configure Memory Controllers of ASUS TF701T.

> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index 55e9256e80f33..00eeedf3ef7a5 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -101,6 +101,89 @@ panel_secondary: panel@0 {
>  		};
>  	};
> =20
> +	clock@60006000 {
> +		emc-timings-0 {
> +			nvidia,ram-code =3D <0>;

[Severity: Medium]
Does the nvidia,tegra114-car DT binding support emc-timings? The schema
enforces additionalProperties: false and explicitly rejects emc-timings.

Furthermore, since clk-tegra114.c lacks the specialized tegra_clk_emc driver
and does not parse these timings, does this addition become dead code?

[ ... ]
> @@ -1610,6 +1693,636 @@ i2c-thermtrip {
>  		};
>  	};
> =20
> +	memory-controller@70019000 {
> +		emc-timings-0 {
> +			/* Mozart Rev B Hynix DDR3 792MHz */
> +			nvidia,ram-code =3D <0>;

[Severity: Critical]
This is a pre-existing issue, but does adding these memory controller nodes
cause the tegra114-emc driver to probe, which unconditionally triggers an
out-of-bounds heap write?

In tegra114_emc_probe(), it unconditionally calls
tegra124_clk_set_emc_callbacks(), which looks up the "emc" clock and uses
container_of() to cast its clk_hw pointer to a struct tegra_clk_emc:

drivers/clk/tegra/clk-tegra124-emc.c:tegra124_clk_set_emc_callbacks() {
    ...
    tegra =3D container_of(hw, struct tegra_clk_emc, hw);

    tegra->prepare_timing_change =3D prep_cb;
    tegra->complete_timing_change =3D complete_cb;
    ...
}

However, on Tegra114, the "emc" clock is initialized by
tegra_periph_clk_init() as a much smaller struct tegra_clk_periph_gate.
Would writing these callback pointers overwrite adjacent SLAB memory?

> +
> +			timing-12750000 {
> +				clock-frequency =3D <12750000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721101059.4516=
99-1-clamor95@gmail.com?part=3D3
