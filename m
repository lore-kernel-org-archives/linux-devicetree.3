Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C63F2F7F17
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783279136; cv=none; b=h8yuD2EXwzd2RinL8veDiq7Lj352QZwBdr/qovOU2RG3PIhYTmcid7ff/fcacPGhqwaUBog2Ol4+VJukz6M6HKcfyOsMzuonZgvLO2BM9Ugmy75VjUJuW+LA3LpMrPbEWPZez4yqFSqWC70zz3FPrM99Zkt3g50O4XuO1sITZK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783279136; c=relaxed/simple;
	bh=Zzl/QnhpAsm+3uom9BdhXytwRfHbTLczobV2FjZqt8U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iKh/uwFqddQGNhPDACyPTV3zR3eiALZiudqgHnm34LcjtZyqEuZSHuEEOVW7Hdqd66NL21fKI+X4MKgYnOLQGsWMStgSFhhR/1wXN7Tb8rsNvJWWrPyoEme1eX4BIY4GswXO2qM1PrGlxSmm7nJr24cerDkK7UMfNnPvHQ7RY1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiU6EM5H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiU6EM5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36921F000E9;
	Sun,  5 Jul 2026 19:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783279135;
	bh=QMdDJZZv/We+1XTHyOM3Kgok2RzB7mrG0RREhYvDWW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LiU6EM5HOY6gZW1p5+mdvGA9P8JnNGQ8Miie0PYOkY+o2EFoc3YmnY0tETQYCZkjn
	 Zc9Iqtj6JtQj0MUcBUEqmnnCkNPMjaHx4jTf8Pnc4yaK5k8SascazjHrFO0GRLTVQy
	 CEclM+UMgTIQaaEi3JQvmp3gqg9DIhTcLeRbLctjsbljvb+25AEkAgzUDIyB1FHTsf
	 uUvEV0ddgHFgNbQml7jbRbqN9nU1sg8Fulxi8K6aqw/+6MJsXuvs9jd8GA2wRf0VTi
	 Ymxpmd2zR+yq/8aOzWenxRZaqBtQhcmMiI5caPlWWB2oBsGOBFSqjwnGocSxoI3vJ5
	 gRi24j3F4aMeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 08/13] HACK: use cb1 address in lpac dtb node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-8-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-8-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 19:18:54 +0000
Message-Id: <20260705191854.A36921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between node unit-address and 'reg' property in the 'lp=
ac' node, and incorrect topological sorting.
--

commit 3a9d2680f6799fd4ea05a09430cb0898981bea9a
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

HACK: use cb1 address in lpac dtb node

This commit relocates the lpac device tree node within the sm8650 device
tree and modifies its unit-address.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 44e5f9d4b335f..66ea9155e2289 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi

[ ... ]

> @@ -4254,6 +4247,13 @@ opp-834000000 {
>  			};
>  		};
> =20
> +		lpac: lpac@3dc1000 {
> +			compatible =3D "qcom,lpac";
> +			reg =3D <0x0 0x03d00000 0x0 0x61000>;

[Severity: Medium]
Does this code miss updating the reg property to match the new unit-address?
The unit-address is set to @3dc1000, but the first address specified in the
reg property is still 0x03d00000.=20

According to the Devicetree Specification, a node's unit-address must exact=
ly
match the first address in its reg property. Leaving it as 0x03d00000 means
the device continues to map to the old address space (which overlaps with t=
he
gpu node) and fails to actually use the cb1 address. It will also trigger a
unit_address_vs_reg warning from the Device Tree Compiler.

> +
> +			iommus =3D <&adreno_smmu 1 0x0>;
> +		};
> +
>  		gmu: gmu@3d6a000 {
>  			compatible =3D "qcom,adreno-gmu-750.1", "qcom,adreno-gmu";

Should the lpac node be placed after this gmu node? Device tree nodes are
typically sorted by unit-address, and 3dc1000 comes after 3d6a000, making
this current placement topologically incorrect.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-descriptiv=
e-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com?part=3D8
