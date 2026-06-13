Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932539B49E
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781342965; cv=none; b=qxy9Vvle0APmVWbyI6p5XMI4tXwV0uOxtGGgxiposgoV7LSzVUnP1cXVETlfFS1eMBf6JwoZNdsLXsTSeNhB9dVXgR2UjIs+ornHbRYge1D6JgBQrNp5iV6wKLk5GbD7CGfUVlcAaYcb6Cte90kEM9sR4hYd61MnUKdIqO3rgi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781342965; c=relaxed/simple;
	bh=Ku2aInABn6mFLH/Epv2W8F8lcDNBCPXJNbcJr6sxHTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VZz8BKXn29CnFlcP1nO6Sj1KCXXvEhECAfbbMB7DEXhpz5XhYPpas1yx23znd1ep/uwc0midDvQLuLFfitBnCiZRYZyB7yRvKWA9UX5k/NuGGnPH4YTOyMHC889vQi7FrTm1knhKmKLZhe3eoOtrE56rXq9bv6ewkhy3bBylCYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnEFd2WZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnEFd2WZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE951F000E9;
	Sat, 13 Jun 2026 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781342964;
	bh=BFvRAKie2ii1NLqzmN755ImXP3cogrQTrJdsxgkxcYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BnEFd2WZ8KO+eItnQiMR/0PytJlrcwxZLIHbNdcJefQwGcyg9Hnww+VmZX9GzJiLD
	 hvHi+sMeJPtYNvCYLUFXzzuYTTLKtEv7mZCb/S4O6H0GJ1I6diGMz9IkneIhjVUUsP
	 av23A9oeMjTIoi+vwrAreQAJnjLXZStkU2eEzsSIZQ6wMbcpr26WmA0Kp92fCLaxME
	 bXvno5nTfO2fvVPzGtGQLlHn6GYRN7HiDG44QcJxGK+nSD4TG8Phd/mYmvNiMZ/TuW
	 T6ibEyGKJ5k2q7q+HAMXZ/RjxQ3kJlv8yZZr4m7zU5bMdxAXT8dPiF5tcIWaR3P4IJ
	 dvMztKxSH0ZZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 3/3] arm64: dts: renesas: r8a779g0: Add gPTP
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260612092851.2141782-4-niklas.soderlund+renesas@ragnatech.se>
References: <20260612092851.2141782-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 09:29:23 +0000
Message-Id: <20260613092923.EBE951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Adding the standalone `gptp` node without updating the `tsn0` node=
 creates overlapping `reg` memory regions in the device tree, which will ca=
use `-EBUSY` probe failures.
- [Low] The `gptp: ptp@e6449000` node is placed out of order with respect t=
o its unit address.
--

commit b1efd0e5ff9459d7a25c1c76a2bb7ef3ccffd5d2
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

arm64: dts: renesas: r8a779g0: Add gPTP node

This commit adds the gPTP module node to the r8a779g0 device tree, sharing
it between the RAVB and RTSN Ethernet devices on the SoC.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 82a7278836e57..4f2844995c44d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
[ ... ]
> @@ -603,6 +603,15 @@ tsn0: ethernet@e6460000 {
>  			status =3D "disabled";
>  		};
> =20
> +		gptp: ptp@e6449000 {

[Severity: Low]
This isn't a bug, but should the gptp node be placed before the tsn0 node?

Device tree nodes within a simple-bus are conventionally sorted in ascending
order by their unit address. Placing ptp@e6449000 after ethernet@e6460000
violates this ascending unit address order.

> +			compatible =3D "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> +			reg =3D <0 0xe6449000 0 0x500>;

[Severity: High]
Will this cause a resource request conflict with the tsn0 node?

The tsn0 node currently defines the same memory region:

tsn0: ethernet@e6460000 {
    compatible =3D "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn=
";
    reg =3D <0 0xe6460000 0 0x7000>,
          <0 0xe6449000 0 0x500>;
    reg-names =3D "tsnes", "gptp";

When both nodes are enabled, their respective drivers will attempt to reque=
st
exclusive access to the 0xe6449000 region. This will result in an -EBUSY
probe failure for whichever driver initializes second.

Does the tsn0 node need to be updated to remove this overlapping region now
that a standalone gptp node is being added?

> +			clocks =3D <&cpg CPG_MOD 2723>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 2723>;
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612092851.2141=
782-1-niklas.soderlund+renesas@ragnatech.se?part=3D3
