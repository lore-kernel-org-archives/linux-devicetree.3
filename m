Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF15B329E44
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273601; cv=none; b=Cq3rlYhtvnXLDGQsywIl2kx9Ug5v2MTJv2KRp7yEpni89aDe4ux7/t2F09eJKN5ir3v6hwc8fzBj1fHH9DT89M62XrRyLPmM9TgqOMJmmFzI43tQqhqdie9J9O9X57NXyWFOMD+vSJmcqIaj0N0wCv+gJEWQeC6cI70bK7v8XJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273601; c=relaxed/simple;
	bh=VWR2NaPOLPD8HjyRfpilyeBVEBKWGpqUMcJ+BQNHtNQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i9SHWgkWz+fAos4Ck55/ur3DGtNj7tiZ9iESlDDEBK0dCKYz/UKrMSJy0AL6CqIvCNBuDNT85jEuYkTRQIx/DFmaVIlobwTpI9kH7sjwQWcBqLkOGIYleEO3TBHeH/P0hVkLU3wyCfZseFMz7+tD+/waLYRF3vURCtYJFc82VkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsftOtVY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsftOtVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4174F1F000E9;
	Tue, 28 Jul 2026 21:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785273599;
	bh=2gh6drt6uVByt/WUD2T7IevRSnybwnXjKrhL3fVh02o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TsftOtVYdXLACD00zFpb/mGFQmpBhBuN7yH1Gqu80dMAeFomzL9zbB1Of3Qqfwdu3
	 x2c9gD+EpvI6eONKUWaTD22gaHqjz+/eWsk9o2HHx+FHu3z3wB2RuQJLlcRw9XOgte
	 EhRAaiZwJvIUaXkYYg3b/VAVQtTKN6NWdsf0pwZh1SxZW0qPd2mIeBaN5PaXLTaPTL
	 dO/UgtOMjbTwporrs7eR26/6F7iCcd+U5jt8IbLIt9SvHcSq1/OQB5rfS9NPzBeiEk
	 ek/m3JYgF727fzLSbd93qBWfH35OQk1Y/ecWgoxE03iyiRbolzcgCLcD0KqSruTNRl
	 WfimNOtIK6ukA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728211020.1248676-2-aurelien@aurel32.net>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260728211020.1248676-2-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 21:19:58 +0000
Message-Id: <20260728211959.4174F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but wiring it up to =
cpufreq makes it a serious hardware safety risk: the CPU supply regulator (=
`buck1_0v9`) has an overly permissive maximum voltage constraint of 3.45V, =
which could physically damage the CPU.
--

--- Patch [1]: [PATCH 1/3] riscv: dts: spacemit: Add cpu scaling for Milk-V=
 Jupiter ---
commit 4e25fb96470d1ad37415e03a27de699ef1f0da26
Author: Aurelien Jarno <aurelien@aurel32.net>

riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter

This commit enables CPU DVFS on the Milk-V Jupiter board by including the O=
PP
tables and wiring the CPU nodes to the CPU regulator supply.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/ris=
cv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index b61f5995ec771..3c16d0c20050e 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
[ ... ]
> @@ -107,6 +108,38 @@ &combo_phy {
>  	status =3D "okay";
>  };
> =20
> +&cpu_0 {
> +	cpu-supply =3D <&buck1_0v9>;
> +};
[ ... ]
> @@ -209,7 +242,7 @@ pmic@41 {
>  		dldoin2-supply =3D <&buck5>;
> =20
>  		regulators {
> -			buck1 {
> +			buck1_0v9: buck1 {
>  				regulator-min-microvolt =3D <500000>;
>  				regulator-max-microvolt =3D <3450000>;

[Severity: High]
This is a pre-existing issue, but by wiring up the CPU supply for cpufreq i=
n=20
this patch, does it introduce a severe hardware safety risk?

The buck1_0v9 regulator retains a very permissive maximum voltage constrain=
t=20
of 3.45V. Because the safe physical limit for the CPU is 1.05V (as defined =
in=20
k1-opp.dtsi), could this permanently damage the hardware if a kernel bug, o=
pp=20
misconfiguration, or privileged userspace requests a higher voltage up to t=
he=20
board-defined maximum?

Should the board-level constraint be clamped to the safe physical limits of=
=20
the CPU (e.g., 1050000 microvolts) to prevent the regulator from supplying =
a=20
destructive voltage?

>  				regulator-ramp-delay =3D <5000>;
>  				regulator-always-on;
>  			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728211020.1248=
676-1-aurelien@aurel32.net?part=3D1
