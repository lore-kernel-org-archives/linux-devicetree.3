Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6768C3033FD
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781556103; cv=none; b=hypiOaMzV9UEP2tEctWaG8Y4ZVEXxmDTK5jHkEP/lddGr3h7UCNguDzEpT7D70GTIHOypCHBTELNuO7cHFNrfNsM3a4Kv/YkhzWHOlCZBSKhZm2Yfh6lMKd+nS5YmkWP1Q93k2V2oz3qcF97K/gwvdIIHoHL/CBUODTC37EI2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781556103; c=relaxed/simple;
	bh=OYaruu9lTqJ1Obf9WoZM7VGJJkaPtzHTn0rEN6BnysY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M6NRSwZzcIeEZq6xULhwHPvRkdcOjX1ps0ip6LbMtMyELFNkMz4coDSP55/+2qoK64P0UR/GFA5Sky9RhOHaheEkBy4KEPW2NVx6Lm2Js1DJROZnsjyjxnORTsNwPDPeqY+u0gz4qRN1IglCp4O8vrcqBPsYM8DXdNNy4dIuzQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3yd/Gfs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3yd/Gfs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADD81F000E9;
	Mon, 15 Jun 2026 20:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781556102;
	bh=RqOFdiynP+SxAl+Vkv6nCoGn4OTi1yqyciO05oLCpVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q3yd/Gfsnm/SamWdU/Gfpz4ZyWYbwcR8DzRz9E4dueJcHvMB9/dp1BvyyLG5ufEXf
	 VNBpKMG9vLa897fDwmsmqwBH6lOtEGduK+RXRLRyEVCzmjwuftpP/+RQEFkYD+RfrK
	 EDLQp9VJ3y9EouGtYzwTwQraHKE50DC6eUt01qH4d8ZyOaLbC84JowiZkj2Ffu5WsK
	 Q54P2O1vSfQinC8NAoiEiiARilEoX2mYW/2oXAWrljzYk5hxshh7vD5aTEf1FdTK87
	 lNnDEKh3U60uJoYkrCjF9NiM1yHmjCttl7+6tePCu+qUV/gX9BWIGOa9cwzhfcLJr+
	 /BrKG4I6WikFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1-orangepi-rv2: Add cpu
 scaling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Legoll" <vincent.legoll@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-k1-cpufreq-orangepi-rv2-v2-1-237f006e580b@gmail.com>
References: <20260615-k1-cpufreq-orangepi-rv2-v2-1-237f006e580b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 20:41:41 +0000
Message-Id: <20260615204141.8ADD81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `buck1` CPU supply regulator has a dangerously high maximum vo=
ltage constraint of 3.45V, risking permanent CPU damage under DVFS.
- [Low] The patch includes `k1-opp.dtsi`, which does not exist in the sourc=
e tree, leading to a fatal device tree build error.
--

commit 6c23623ea2ead11420af84821e27659f9fd1622e
Author: Vincent Legoll <vincent.legoll@gmail.com>

riscv: dts: spacemit: k1-orangepi-rv2: Add cpu scaling

This commit enables CPU DVFS on the OrangePi RV2 by including an OPP
device tree file and binding the CPU supply to a regulator.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 7c49bce427f30..2c2542e02d6a8 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -7,6 +7,7 @@
>  /dts-v1/;
> =20
>  #include "k1.dtsi"
> +#include "k1-opp.dtsi"

[Severity: Low]
Does the k1-opp.dtsi file exist in the source tree? Including a missing file
will cause the device tree compiler to fail with a no such file or directory
error, immediately breaking the build.

>  #include "k1-pinctrl.dtsi"
> =20
>  / {

[ ... ]

> @@ -80,6 +81,38 @@ &combo_phy {
>  	status =3D "okay";
>  };
> =20
> +&cpu_0 {
> +	cpu-supply =3D <&buck1_0v9>;
> +};

[ ... ]

> @@ -162,7 +195,7 @@ pmic@41 {
>  		dldoin2-supply =3D <&buck5>;
> =20
>  		regulators {
> -			buck1 {
> +			buck1_0v9: buck1 {
>  				regulator-min-microvolt =3D <500000>;
>  				regulator-max-microvolt =3D <3450000>;

[Severity: High]
Is this maximum voltage constraint safe for the CPU under DVFS? The
regulator allows up to 3.45V, and by actively binding it to the CPU as
cpu-supply in this patch, cpufreq or the regulator framework could request
voltages much higher than the typical ~0.9V core voltage. Could this risk
permanent overvoltage damage to the CPU if an invalid OPP table or userspace
override occurs?

>  				regulator-ramp-delay =3D <5000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-k1-cpufreq=
-orangepi-rv2-v2-1-237f006e580b@gmail.com?part=3D1
