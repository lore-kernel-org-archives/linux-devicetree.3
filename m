Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CEA2DC32E
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315849; cv=none; b=l+1PzZXW9nzR/RQOY4ux7zbfMCBfBQbqnQY+eIdoEiMIUgLIv7yzuERLXkOF9GgfhAyFWq5Yx4teI0E8HXrvoWYuVnMnigLZgr8IGqyIxNbdcro4r9MMGP0SF4fseJCfTj72BzF0VPJQjxr0G0/0TOlHTl8D25/NK8Bvc9i+OBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315849; c=relaxed/simple;
	bh=sxDeXC20Yl/EEWdR5LO+ivhoPMrjoXz+OMwBDMvikD4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ce8oqkdqH5NkkteSkHe+kFtDZjGcJs52KXEegnh7uf+0Gdp63R3frNMgc3iHDjhJ7Qk9/Ku8z67FxeJjrCz8l/gnddcRgz2sd0LAgqRFu9lA/SZWpT2VgPxK3MmXTa5SaotrYs5zON4/WxH0/lhvV+RZhxEUy4RcsogD2WmD5Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJJXs4x8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJJXs4x8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE361F00A3A;
	Fri, 21 Aug 2026 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787315844;
	bh=MjlT01MjfnXCNLdU34NJ2N+qKkKpw6+X+U1Vahswvrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mJJXs4x8qUFiekEAmPgTUrqbaHH6pQo1uKDlcVYLQp4QfbOwhk+sOn3ouzqraNH5e
	 +6Kq9DLXuAra7S7gl+yfLyvPnyKPxhrKNsYcjvVa7+GcbQHCtno/PdriisBt+3aU49
	 HGk/iKORGK/bV9WkxrFroWgSz6LlmrKOswLB9PvfP0q4Kjgbn1z9UbLALXGoCbnKjy
	 vR7bKKeOO5kUT1G08CNZZCmhhoLe3sXPg0aw4P1x0XuP/1HSzS180N+t1gg/UMcFL/
	 k2hMS83uKZ1Z+NUVnV/znPIJEFUJg3zCcCZKoZCU128Kxli6O8EoUxxEGR+jIotSQ4
	 1zDNaDBFcbXXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] arm64: dts: qcom: Add Motorola One
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260821-next-patches-v4-3-7ab02c0d4eb9@gmail.com>
References: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
 <20260821-next-patches-v4-3-7ab02c0d4eb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:37:24 +0000
Message-Id: <20260821123724.ADE361F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `dai@22` and `dai@127` node names use decimal unit-addresses in=
stead of hexadecimal, causing a mismatch with their `reg` properties.
--

--- Patch [3]: [PATCH v4 3/7] arm64: dts: qcom: Add Motorola One ---
commit bc96bd20e17e79acc946f76b450ae2f6d79d33a8
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add Motorola One

Add a devicetree for the Motorola One smartphone, which is based
on the Jacala/MSM8953 SoC. Supported functionality includes I2C
peripherals, keys, regulators, remoteprocs, and USB.

> diff --git a/arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts b/arch/ar=
m64/boot/dts/qcom/msm8953-motorola-deen.dts
> new file mode 100644
> index 0000000000000..4bc407e23580b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts
[ ... ]
> +&q6afedai {
> +	dai@22 {
> +		reg =3D <QUATERNARY_MI2S_RX>;
> +		qcom,sd-lines =3D <0>;
> +	};
> +
> +	dai@127 {
> +		reg =3D <QUINARY_MI2S_RX>;
> +		qcom,sd-lines =3D <1>;
> +	};
> +};

[Severity: Low]
Should these node names use hexadecimal unit-addresses (dai@16 and dai@7f)
to match the evaluated values of their reg properties?

The macros QUATERNARY_MI2S_RX and QUINARY_MI2S_RX evaluate to 22 (0x16) and
127 (0x7F) respectively. The Device Tree specification requires the
unit-address in a node name to match the first address specified in its reg
property formatted in hexadecimal. Using decimal values here will likely ca=
use
the dtc compiler to emit simple_bus_reg warnings during the build.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-next-patch=
es-v4-0-7ab02c0d4eb9@gmail.com?part=3D3
