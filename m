Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50344380FC9
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338370; cv=none; b=brYOV+eVXpLsLfxXLR7bD8F5N8cbIKFWUD5vZsS+wn+Jpf7AX3o9JSkL9Z9cAJrWNVWVspMRaqkZqTjUTbkg/Q59ztK4eZQKwG6yCpTqFG+Il758rZ76/GDc0O2TKcRlQpp7TOzgHzkShwEoom6Qn/fCl9f5BMfwyWcAMXsXWEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338370; c=relaxed/simple;
	bh=s+Uu7pcuePc/lUSQBkwpjZUls/P1lMkXcr6BzXoq/Xo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=niQvZo8YHqfnAypHUlCnx4v6p9XaramlG47fjDSeuBMa47rZp3DYGcIGTtynyOpE7/2WHGKWEReZwnAWgIPwJP4jcm60zNiYbOSfDGhn/sVWMmNf/+oA04IeAObV4broPOJAhO0GE2GbgMm3UjThaTyYb2++o0INsJS201e9mWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAEqHqKx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAEqHqKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2251F000E9;
	Wed, 29 Jul 2026 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785338368;
	bh=CaDaWNZgtXqesjiI4LOpnnKABCIm79LfZCgukUF7UQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EAEqHqKxksJkUMUH2lHOZZ4+4/j/Qqo4+TzABlSnZZ4C2nUgfX+4E08fZLW7I4WE4
	 yyEE2hOqaD/nxprl6thpOh48K9FVPfXWGRZNefbeOO+zVXjFRuuxkNmJdP2U7ipn5g
	 +oyQ2T55qskuiT1jc4Jppo6c7ZMA9d4EyMsQCmVOomhYgBDBLuxwb9+jq4XIqb2xCI
	 71DwRsdQelJXX8yyPyA5JjUKZP2rxN1d8XzE9vdKhr+XgsAMNj67cQv/o4HMh+WvJq
	 rzF48At4i3oc6P14zd2ZbNaSzZukTKoUlKkHxeVlo61LYGiBKMfkBFDpYXeYDy/qwH
	 iVt/6WbKIWSoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] riscv: dts: spacemit: k1-bananapi-f3: fix maximum
 CPU core voltage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729150722.1598630-2-aurelien@aurel32.net>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
 <20260729150722.1598630-2-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 15:19:28 +0000
Message-Id: <20260729151928.7F2251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Incomplete fix leaves other K1 boards vulnerable to permanent =
CPU damage due to dangerous regulator limits.
- [High] buck2 is orphaned from the CPU scaling topology, risking undervolt=
age crashes or hardware damage.
--

--- Patch [1]: [PATCH 1/6] riscv: dts: spacemit: k1-bananapi-f3: fix maximu=
m CPU core voltage ---
commit 7fc7f69c1396ecd57da9622a68f4d3d15ff81423
Author: Aurelien Jarno <aurelien@aurel32.net>
Date:   Wed Jul 29 15:02:18 2026 +0000

riscv: dts: spacemit: k1-bananapi-f3: fix maximum CPU core voltage

This patch lowers the maximum CPU core voltage on the Banana Pi BPI-F3 from
3.45V to 1.050V. This prevents potential permanent CPU damage that could
occur if a bug or privileged user requests a voltage above the safe limit.

Link: https://sashiko.dev/#/message/20260728211020.1248676-2-aurelien%40aur=
el32.net

> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv=
/boot/dts/spacemit/k1-bananapi-f3.dts
> index e2961b7e0a3eb..58035d886bf67 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -237,14 +237,14 @@ pmic@41 {
>  		regulators {
>  			buck1_0v9: buck1 {
>  				regulator-min-microvolt =3D <500000>;
> -				regulator-max-microvolt =3D <3450000>;
> +				regulator-max-microvolt =3D <1050000>;

[Severity: Critical]
This is a pre-existing issue, but since this patch correctly identifies that
setting regulator-max-microvolt to 3.45V for the K1 CPU core regulators
can cause permanent physical damage, should this fix also be applied to
the other boards using the same K1 SoC?

Looking at the other device trees like k1-milkv-jupiter.dts and
k1-orangepi-rv2.dts, they still permit 3.45V on the buck1 and buck2 rails:

arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts:
    buck1 {
        regulator-max-microvolt =3D <3450000>;

arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts:
    buck1 {
        regulator-max-microvolt =3D <3450000>;

Could this incomplete fix leave these other boards vulnerable to the same
hardware damage from an OPP misconfiguration or privileged userspace reques=
t?

>  				regulator-ramp-delay =3D <5000>;
>  				regulator-always-on;
>  			};
> =20
>  			buck2 {
>  				regulator-min-microvolt =3D <500000>;
> -				regulator-max-microvolt =3D <3450000>;
> +				regulator-max-microvolt =3D <1050000>;

[Severity: High]
This is a pre-existing issue, but since this commit confirms both buck1 and
buck2 supply the CPU core voltage, does the current CPU scaling topology
properly manage buck2?

In k1-bananapi-f3.dts, all eight CPUs currently point to buck1:

    cpu_4: cpu@4 {
        ...
        cpu-supply =3D <&buck1_0v9>;

If buck2 powers cluster 1, will scaling cluster 1 erroneously scale buck1
instead, leaving buck2 at a low boot voltage and causing cluster 1 to crash?

Alternatively, if buck1 and buck2 are physically tied together to share the
load, would leaving buck2 unmanaged while scaling buck1 cause severe
cross-conduction current between the regulators?

>  				regulator-ramp-delay =3D <5000>;
>  				regulator-always-on;
>  			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729150722.1598=
630-1-aurelien@aurel32.net?part=3D1
