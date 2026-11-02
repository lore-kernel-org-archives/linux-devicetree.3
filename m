Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630324;
	b=4/GXquPOI/1nCujjydKoCSw7LChzp8oIh/1ptk48BaoB+tzZkItBLJlOeS6PzIaN+Tqu
	 WzUvkcvDceeaUJltJ2vZi1S/9wiyUe5EC9gAG28S/1B+B/68xYCRUvkLt/4Sv49kpPXpi
	 /vgHgMYOyagawX+vEWL0lzou/yh94jgiMkqU1vXmxtoy/uwVluLlWJW0kZGS7tqq4uKxc
	 JxCsrcvTTtuxxqVWiJOp/ValDOrYMhfnj4tViTNtFiLOM5PKH8leSl+vgt7nqbbduvD8q
	 ThozFzTyGGEMh5KsEtaHLJ7xFFc6Bmgaaz6xqbZgqYFGU17A5eg1r5joZjiX0RcsvYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630324;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Cdn1KQJz6DEwlZGUJ4zBoptouNZdZ09F2O3AoVYie3g=;
	b=L/y8R1UMEkgdJF0vWIB3yQkL+713dq7BeKYyjUmxQFFlOtCih/GRQE3oTj2vUMZ7lun0
	 8yNgyuLsxeCGxggzpHVZNBeAUbUojCKh9m6WFFDmIyGgHx3B+I+v21XQH3X4BvqGuq/wd
	 ZUrBW5UHWkigXbFya/nqUQ6Ue6vV7hS+srTIuNdX6Ao9ZRAGnQzrtiux2S+A1kZkTUnZK
	 cBv/+rd6RqRs0K39GIpOGiN7CtwtHKxGUPkA8gWeaRrQMLhymWqbracp1V8qtY7xX7hOF
	 1zCYo37iW11oDzSeFDoMjRIJgTqsSzVb5/qxM0sr5XpvdnsIcCM0zwHkWZ+FSOSiFmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KX39Z/ql";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7CC606A32D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KX39Z/ql
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6181F00A16;
	Mon,  2 Nov 2026 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630323;
	bh=Cdn1KQJz6DEwlZGUJ4zBoptouNZdZ09F2O3AoVYie3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KX39Z/qlYRcUzMEN/S4f8j8P4y90LnpOD4gOEAw8DotHLIafOi29novQXXHEdl5OK
	 3mtiiAtLGbRbunHWyPyjyNDd39jWcx/fHwf4HBzfEhzhPNh7K6XZPTDBviaUwk10KR
	 m3XIrUkd16ZEGZvp8QllCXbRUAEKWI3EfjuiRvvouhybQDUVLAu/ftdHFVMh7VcD2N
	 n30h6BvA/8nw+27FbtRLNVg6w/U0H8aCxq0zM7LxXNSrBgjQGbsbJQIqo7YAi5R3zu
	 Gd/YIId+t+M/wdZoUdyByFsdRMBUH/Sab1ELd2NOaSSXiUqSnY5dqGtyVnqECqgbtA
	 qGgy6jJwRfcHQ==
Message-ID: <sashiko-outbox-193591@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?THVrYXMgTcOkcmRpYW4=?= <lukas.maerdian@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 14:38:43 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: mahua-t14s enables GPU/GMU without mahua.dtsi ov=
errides
--

commit 9b4a7ddbb7e3ff673d119429fdec3506da117877
Author: Lukas M=C3=A4rdian <lukas.maerdian@oss.qualcomm.com>

arm64: dts: qcom: mahua-t14s: Enable GPU and GMU

This commit removes the board-level disabled status overrides for the GPU a=
nd
GMU nodes in the Lenovo ThinkPad T14s Gen 7 (LCD) device tree so that they
inherit the default enabled status from the SoC device tree.

> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd=
.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> index 26d6d8285e040..fb913da7343fd 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> @@ -634,15 +634,6 @@ vreg_l4h_e0_1p2: ldo4 {
>  	};
>  };
> =20
> -/* GPU/GMU not fully functional yet on this platform. */
> -&gmu {
> -	status =3D "disabled";
> -};
> -
> -&gpu {
> -	status =3D "disabled";
> -};

[Severity: High]
Does enabling &gpu and &gmu in
arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts cause the
ThinkPad T14s Gen 7 to probe the GPU with the wrong hardware configuration
when the prerequisite arch/arm64/boot/dts/qcom/mahua.dtsi overrides are not
yet applied?

The commit message notes that mahua.dtsi overrides the compatibles with
"qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the note below the
tearline mentions a dependency on "arm64: dts: qcom: mahua: Support GPU and
GMU" (https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.=
qualcomm.com/).

In the current tree, drivers/gpu/drm/msm/adreno/a8xx_catalog.c already has
the a8xx_gpus[] entry for 0x44060000, but arch/arm64/boot/dts/qcom/mahua.dt=
si
only includes glymur.dtsi without overriding &gpu or &gmu:

arch/arm64/boot/dts/qcom/mahua.dtsi:
    #include "glymur.dtsi"

Without those overrides in mahua.dtsi, removing status =3D "disabled" here
exposes the unchanged nodes from arch/arm64/boot/dts/qcom/glymur.dtsi:

arch/arm64/boot/dts/qcom/glymur.dtsi:
    gpu: gpu@3d00000 {
            compatible =3D "qcom,adreno-44070001", "qcom,adreno";
    ...
    gmu: gmu@3d6c000 {
            compatible =3D "qcom,adreno-gmu-x285.1", "qcom,adreno-gmu";

When the drm/msm driver probes gpu@3d00000 via adreno_bind() -> find_chipid=
(),
it matches the 0x44070001 (Adreno X2-90) entry in a8xx_gpus[] rather than t=
he
0x44060000 (Adreno X2-85) entry in drivers/gpu/drm/msm/adreno/a8xx_catalog.=
c:

drivers/gpu/drm/msm/adreno/a8xx_catalog.c:
    .chip_ids =3D ADRENO_CHIP_IDS(0x44070001),
    .family =3D ADRENO_8XX_GEN2,
    .fw =3D {
            [ADRENO_FW_SQE] =3D "gen80100_sqe.fw",
            [ADRENO_FW_GMU] =3D "gen80100_gmu.bin",
    },
    .gmem =3D 21 * SZ_1M,
    ...
    .a6xx =3D &(const struct a6xx_info) {
            ...
            .max_slices =3D 4,
            .gmu_chipid =3D 0x8010100,

Instead of Mahua's 15.75 MiB GMEM, max_slices =3D 3, gmu_chipid =3D 0x80a00=
00,
and gen80100_aqe.fw, the driver will configure 21 MiB GMEM, 4 slices, and
write 0x8010100 to REG_A8XX_GMU_GENERAL_10 in a6xx_gmu_fw_start(), while al=
so
leaving the undocumented "qcom,adreno-gmu-x285.1" compatible enabled on
gmu@3d6c000.

Should the mahua.dtsi GPU and GMU overrides be applied before enabling &gpu
and &gmu on this board?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102142812.1353=
199-1-lukas.maerdian@oss.qualcomm.com?part=3D1
