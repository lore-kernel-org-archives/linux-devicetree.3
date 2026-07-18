Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCBC22F74A
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 03:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784345049; cv=none; b=uqVmCLhCrhG3SHwz5Omhp/cmVsnr1Ti8Lowzbg0Qure+ztsqxniUxwaEHi78bMKw5eB0UYjeBNBRkuqvVXjwuXlb5sredhEMYM7LCxkw3Xfv5/vMvXdSSBU+7RomXF0QlmGQkovlIYlLGsg+BfeujLDIaQHZ5IMQInRaXJ41ubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784345049; c=relaxed/simple;
	bh=vtmDhsXxpi0qB7MtCo/pvFxsoXJqMJFDaBPe6gqUHu8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ScUBsbH4AKwITb8AdY0GiEnx1Q3UGtjnei5Udep4GfCeo1rdAW71Nnyy2ewktgKDMTaLYW9lYQlSEkfdCa+O67fdjZEPVjUif7/ylvYW/b8vzeM5x+ps1VxL5bPGxk5u4qGSwyRiVMj/uPizrgZYtU65np3qcQbQ7TtJHRotEAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xf625NNl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xf625NNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E2B1F000E9;
	Sat, 18 Jul 2026 03:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784345048;
	bh=QWDpKk/hHyhDckxWfZbQsXEEtAAbLv7oRw2rKvFpN0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xf625NNl/59kDNKKlv94EopljDSO0Z3/WUz1evqTT3xfztOi4zpPVIvQ+c2/3S6J5
	 3RMuSBnfpFog5hKUfUj3rXgYU7AmHAVgkeGmL7zTjZmsTqd9qZIMUnHIAxqI2v7F4M
	 LLZPHxpBH3mjFlzk84IBtCD2k0hWC7gPjDnVxfR+kfnKcNw4dEH/1WlGH8k12pI0IP
	 bgBdEpUEjz4V00g9ekLMpZfo0xlAPuguWr76xNQC1xgfyqNntiXU+Q7svcyNy8a0Qz
	 twnQy4pZw238XMvmwf1USErdyVt/HIKJRhtkwnumB+sJRXT+Rx8KgBx2QsIVrF/hwF
	 Wgma5bspW/5BQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 8/8] arm64: dts: rockchip: rk3576-rock-4d: enable
 NPU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260718031146.3368811-9-gahing@gahingwoo.com>
References: <20260718031146.3368811-1-gahing@gahingwoo.com>
 <20260718031146.3368811-9-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 03:24:07 +0000
Message-Id: <20260718032408.01E2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] An SoC-level power domain dependency is improperly implemented as =
a board-level override in `rk3576-rock-4d.dts`.
- [Medium] The device tree assigns two power domains to `rknn_core_0`, whic=
h violates the DT binding schema's `maxItems: 1` constraint.
- [Medium] The NPU regulator is forced permanently on via `regulator-always=
-on`, circumventing proper power management, and the `npu-supply` property =
is functionally dead code.
--

--- Patch [8]: [RFC PATCH v2 8/8] arm64: dts: rockchip: rk3576-rock-4d: ena=
ble NPU ---
commit 1ea2a06c9849a71ed6c8698699f42f0e551d0d72
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: rk3576-rock-4d: enable NPU
   =20
Enable rknn_core_0 and rknn_mmu_0 on the Radxa ROCK 4D and supply the
NPU rail (vdd_npu_s0) via npu-supply.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64=
/boot/dts/rockchip/rk3576-rock-4d.dts
> index 272af1012ab03..09d2fc98bb4c1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> @@ -442,6 +442,7 @@ regulator-state-mem {
>  			};
> =20
>  			vdd_npu_s0: dcdc-reg2 {
> +				regulator-always-on;

[Severity: Medium]
Does this unconditionally force the regulator on, completely defeating runt=
ime
power management and causing a permanent power leak when the NPU is idle?

>  				regulator-boot-on;
>  				regulator-enable-ramp-delay =3D <400>;
>  				regulator-min-microvolt =3D <550000>;

[ ... ]

> +
> +&rknn_core_0 {
> +	npu-supply =3D <&vdd_npu_s0>;

[Severity: Medium]
The commit message mentions supplying the NPU rail via npu-supply, but is t=
his
property functionally dead code here?

The rocket driver does not appear to make any regulator API calls, and there
is no OPP table present to trigger generic devfreq parsing.

> +	/*
> +	 * Power BOTH NPU domains (NPU0 + NPU1) like the vendor's single NPU no=
de,
> +	 * even though rocket computes only on core 0: the CBUF->CMAC read path=
 is
> +	 * only fully powered with NPU1 up. rocket attaches the multi-PD list.
> +	 */
> +	power-domains =3D <&power RK3576_PD_NPU0>, <&power RK3576_PD_NPU1>;

[Severity: Medium]
Will this assignment of two power domains fail dtbs_check validation?

Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
explicitly enforces maxItems: 1 for power-domains.

[Severity: High]
Should this power domain dependency be placed in the SoC's .dtsi file inste=
ad
of a board-specific override?

Since the CBUF->CMAC read path hardware dependency is a property of the RK3=
576
silicon rather than board wiring, keeping it in the board DTS means any oth=
er
RK3576 board enabling rknn_core_0 via the base rk3576.dtsi might silently l=
ack
this dependency, leading to hardware hangs or corrupted reads.

> +	status =3D "okay";
> +};
> +
> +&rknn_mmu_0 {
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718031146.3368=
811-1-gahing@gahingwoo.com?part=3D8
