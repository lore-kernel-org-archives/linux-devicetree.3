Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795249951;
	b=KDjEgtsfyMsPhJhk6ztObyahWMgBcsaNUGDG3qQiBCwiyExvGz6Gm6xYqP5jojF6+Z4C
	 naG+qXQnwaHMOl05sdamF+zkOyuZJ9Tl8pr1qHQJmbUzrs5qWHdBuN/asfwEektofvzHa
	 bVFL40QDSyTBdvQwmGLXlRRsfSFKpE04JRpZ2AXM0E/6jLqhZkEPvl4dFZf0NoozjSwLb
	 /f6LiDEMi3WiDjQ87XILVi5awtSUE/YUEs++nwHm6xXCQZNnwM/pYbBCzSyEWWerZzwKv
	 KNvNN/vU2B0ORs106DzQ+A8aEGy+w2IPF/j2HXfv422nnJV0UW7SzKZxv9dRgCV0JkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249951;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OGOsbXqwhms5NofAzCIF0mjaK5k8Xmmr6u3Azs0YnOM=;
	b=YK0Ec8LKvUAxtDKPpTalT3GpLLexHjc7cAEdU1ObFzsc8zeqWHOvYMVLOy0/2RLMcHG0
	 rH2JWxwuKsyRONHuyi9nJo+q6AWvowFwQunr9eLDdCGEEipXuWWItqehDag4zsDtfL9+g
	 CACEyXMmh3tStC45nkSdCvnZnj+D15AtcHHY3yA3+olfpx8KOA0AbcpVbNNIfdThTJhBt
	 qqJZF8b+fn1v+M541IzQhURC68WXv5Uvr/Sf9lCdEU4vtSwhBAz70kwjJPPJnNdfpRDLq
	 kfH+6B1jpsajnYUFvFEMZkIGkTG09L+aF5wXl1MFbQ0y9AN/ZJPkE5H0cdPscH7sAVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VA2iI/57";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D73606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VA2iI/57
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422851F000C0;
	Sat, 21 Nov 2026 08:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795249951;
	bh=OGOsbXqwhms5NofAzCIF0mjaK5k8Xmmr6u3Azs0YnOM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VA2iI/57ZFdRT/xa5i8sMn0eDb00gyNDc0IH8Sh7i0UDsfDSLJ9RKhpoMY8gn3DhP
	 8ga1z63Ps0KUg9PpMbofGYmr0KmwC7VV1UykaCANvoo1EKcDU7yjTbVKrgENq7f+Yd
	 5Jsb9S9yMA1bC+Xe6SImmu0BF4vl49zuPFH2n1WOhNXur/6y6SPgELV3f8o8Glq4ZP
	 elKLiKYZ7xo9xyy7ifB4Lde0TV/pfjEEtRkE4oeLhESAvkZWuaiYA+iSpWx0heExT+
	 l6ZokgY1SoMoPmNVa4Ig+cScKLwuLTLugc2krsZbuOf2kZ/Db6FdKmgX2w+eEN/nVN
	 ukPfmQHnMSIUA==
Message-ID: <sashiko-outbox-226829@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: exynos: Add support for Samsung Galaxy A20e
Reply-To: sashiko-reviews@lists.linux.dev
To: "Henri Ommer" <henri@ommer.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121082404.24864-3-henri@ommer.net>
References: <20261121082404.24864-1-henri@ommer.net>
 <20261121082404.24864-3-henri@ommer.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 08:32:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] arm64: dts: exynos: off-by-one size 0x3fffffff in
  memory@80000000 node
- [Medium] arm64: dts: exynos: debug and distro flags hardcoded in
  chosen bootargs
- [Low] arm64: dts: exynos: unused downstream fast-slew-rate pinctrl in
  mmc_0
--

commit 3c64e215bef4d1c0f5a772e11d2129cb4345d352
Author: Henri Ommer <henri@ommer.net>

arm64: exynos: Add support for Samsung Galaxy A20e

This commit adds initial device tree support for the Samsung Galaxy A20e
(SM-A202F) based on the Exynos 7885 SoC, covering memory, simple-framebuffe=
r,
GPIO keys, and internal eMMC.

> diff --git a/arch/arm64/boot/dts/exynos/exynos7885-a20e.dts b/arch/arm64/=
boot/dts/exynos/exynos7885-a20e.dts
> new file mode 100644
> index 0000000000000..61f6e5c5341cc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos7885-a20e.dts
> @@ -0,0 +1,132 @@

[ ... ]

> +	chosen {
> +		ranges;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <1>;
> +		bootargs =3D "console=3Dtty0 clk_ignore_unused pd_ignore_unused regula=
tor_ignore_unused pmos.nosplash";

[Severity: Medium]
Should clk_ignore_unused, pd_ignore_unused, regulator_ignore_unused, and
pmos.nosplash be dropped from chosen/bootargs?

Hardcoding the *_ignore_unused debug flags globally disables the late
initcalls that gate unused clocks, power domains, and regulators across
the system, and pmos.nosplash is a distribution-specific userspace option
rather than a hardware description.

[ ... ]

> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x80000000 0x3bc00000>,
> +		      <0x0 0xc0000000 0x40000000>,
> +		      <0x8 0x80000000 0x3fffffff>;
> +	};

[Severity: Medium]
Should the size of the third memory bank be 0x40000000 instead of
0x3fffffff?

With #size-cells =3D <1>, the third cell is a byte size rather than an end
offset.  early_init_dt_add_memory_arch() masks the size with PAGE_MASK
before calling memblock_add(), so 0x3fffffff rounds down and loses the
final page of RAM.

[ ... ]

> +&mmc_0 {

[ ... ]

> +	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus=
8>;
> +	pinctrl-1 =3D <&sd0_clk_fast_slew_rate_1x>;
> +	pinctrl-2 =3D <&sd0_clk_fast_slew_rate_2x>;
> +	pinctrl-3 =3D <&sd0_clk_fast_slew_rate_3x>;
> +	pinctrl-4 =3D <&sd0_clk_fast_slew_rate_4x>;
> +	pinctrl-names =3D "default",
> +			"fast-slew-rate-1x",
> +			"fast-slew-rate-2x",
> +			"fast-slew-rate-3x",
> +			"fast-slew-rate-4x";

[Severity: Low]
Are the fast-slew-rate-1x..4x pinctrl states used by the mainline driver?

Neither Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
nor dw_mmc-exynos looks up fast-slew-rate-* pinctrl states, so pinctrl-1
through pinctrl-4 are never selected.  Other Exynos 7885 boards define
only the "default" pinctrl state and place the desired clock drive-strength
pin node directly in pinctrl-0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121082404.2486=
4-1-henri@ommer.net?part=3D2
