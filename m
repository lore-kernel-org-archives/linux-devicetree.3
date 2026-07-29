Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0B51DA23
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338112; cv=none; b=bRkmP+rRXyLSh9cmWKPvfSkfdW5cGmlOrjPfXIL2NTSIX7i3/CdyXsrLoF5AijCzouwPMZ+m59evRKZfRJrPBE8GwRxnGBqHcNvrF/HMY6hHmEfr5Q+WFjExb7033ANK09dBpGrUm5jIx1xrAPbbo/foF9I2aptZ+lGB7lkG6nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338112; c=relaxed/simple;
	bh=uDOmihb1l4ddIRair6K8HIqREi8Xe9Y2Cn+Lbe5ic5E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PMbekRzHOJkY5w874hDu7FAMfMpwSvCQHh8lDXk1uYcjuyPTXcD7/zrYH0Gx7mFzpIKpcWLp9WbvLd4c8RzzzIdMCyvxkwVP8V51HFCOK4wocKNVJiJUwIcm0SFAYuSI6y8tHiEHnB8d94JXRrEMlJWiGHMrLafQ1BkJSgozlqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHfiJIna; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHfiJIna"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5AF1F000E9;
	Wed, 29 Jul 2026 15:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785338110;
	bh=kY5l72w/U4ugzgPk9b2lZDPvnXQylxSVYeNgEf3jZ/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AHfiJInaow/boUu7J+/Q6SDZ/dVKZFuPeM6LxQX9MJltAk65fLK8fJM1niCShEi3i
	 67gwXG+ddw8sZpadOuYcrbl5jTamVU87a82ErlOIWjIXk5M9YFKyjg2k+dTnokbBs3
	 ntr7oipwqh9SyzbfDTKkF1t62GCbALbQkraZ66KvYBNvVfdKUuOT9x1H+i11mk5r14
	 QIJjP5Yjn4MSJYBYUGgFs3/4BKTvtICcAPST6znLhi9FPjx4bVqmvJBJUo7XEKgl/5
	 /57Il+LPJ9Fd25kFOvFa/9JPe8JSvKEI4y9cMqoO7k1rMM0WC8ez1gECH9MonRj35t
	 FMtjuqYW21KCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] riscv: dts: spacemit: k1-orangepi-r2s: fix maximum
 CPU core voltage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729150722.1598630-6-aurelien@aurel32.net>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
 <20260729150722.1598630-6-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 15:15:10 +0000
Message-Id: <20260729151510.9F5AF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The CPU core voltage limit in the Banana Pi CM6 devicetree remains=
 at a dangerously high 3.45V, risking permanent hardware damage.
--

--- Patch [5]: [PATCH 5/6] riscv: dts: spacemit: k1-orangepi-r2s: fix maxim=
um CPU core voltage ---
commit e89342d2210b8ee4353584159b6747437181135a
Author: Aurelien Jarno <aurelien@aurel32.net>
Subject: riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage

This commit lowers the maximum output voltage of the buck1 and buck2
regulators on the OrangePi R2S board from 3.45V to 1.050V. This prevents
potential permanent CPU damage from misconfigurations or privileged userspa=
ce
requests.

Link: https://sashiko.dev/#/message/20260728211020.1248676-2-aurelien%40aur=
el32.net

> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-r2s.dts
> index 24591f7c3d236..2d1ba34cb00e2 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
[ ... ]
>  			buck2 {
>  				regulator-min-microvolt =3D <500000>;
> -				regulator-max-microvolt =3D <3450000>;
> +				regulator-max-microvolt =3D <1050000>;
>  				regulator-ramp-delay =3D <5000>;
>  				regulator-always-on;
>  			};

[Severity: High]
This is a pre-existing issue, but I noticed the Banana Pi CM6 devicetree
appears to retain the same 3.45V maximum voltage limit for its CPU core=20
regulators.

Should arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi also be updated
to prevent similar hardware damage risks?

arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi:
			buck1 {
				regulator-min-microvolt =3D <500000>;
				regulator-max-microvolt =3D <3450000>;
				regulator-ramp-delay =3D <5000>;
				regulator-always-on;
			};

			buck2 {
				regulator-min-microvolt =3D <500000>;
				regulator-max-microvolt =3D <3450000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729150722.1598=
630-1-aurelien@aurel32.net?part=3D5
