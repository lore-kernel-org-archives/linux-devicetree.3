Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0676449B2D
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344600; cv=none; b=nnBfaumW17C8VjVZUOUqe2M9Ri2fMhFI3nAxBxcsp92FKXVDa5gGOEfBP3cPGkxpLsL4qhYqPHcowf097mrAADZqRGBH8j7v0Bi7GoHDVmkmHH1MJ0COjwo2ygIdnQ/zfYVtCQsP2Bk6D+mCPSz29DDtwFiiMinWJI8VApPSIWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344600; c=relaxed/simple;
	bh=05lALmGGCKyvzmmiKzJq8bFUxqlDBARW1NfuDxt6U9I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PTOaq4voY/MJKtZ+t2dDfc42UY/QghNh/q0fEUNdwoGlcjfcGNHQB5iAIwnuoli378bBEesRrnf42mcZ63Qi+KKOcEQf1PkhkTPMBEucPS0NZ5DuCTYG9rKm+v/QfCK/YhALxICE74F05BApc+XBHPNPkrMdnehS7JHMXyWRMAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwh5hNZ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwh5hNZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8911F000E9;
	Wed,  2 Sep 2026 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344590;
	bh=Dgl2WY3zF6QhAVFTTWObC7Ry286Zrke4s3GjXYipvkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hwh5hNZ/EV7tqROKGJT2rktIGenJuQI8CPc0GPnLPwzmnMwabbdrNSJyK1nCWG1Dl
	 HYj4AKRcD+cyE4mDSsSczzo0USv0meh0mxtw2WRvVWoRTlFs+fMGUbF7spqQz44ezU
	 jb16Z1JGuxIlpqQUHTS9chsGxHXBmCqIB8atdX0oDx0cKOT+7aoMBraw9wLn6dhqQW
	 da+aJDde710ORSKz8d8qpLII3jB4MA47uM+ky8Ks/VzsdZHT/nF+5g87UCmTR6CS4l
	 MNBiKTsmqt9/wCjZ2+WZkXAl0Q+PxxlHdA/yKFsGn6kgd8J9vzxN3efiCG+Sx5NjAc
	 XvzeJLOu19A/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] ARM: tegra: Clean up AHUB on Tegra124
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-1-028f3c5e72f6@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
 <20260902-tegra-ahub-dt-cleanup-v1-1-028f3c5e72f6@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 10:23:09 +0000
Message-Id: <20260902102310.3A8911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The child bus address in the 'ranges' property of the ahub node is=
 missing a trailing zero, breaking address translation for all I2S/AHUB chi=
ld nodes.
--

commit 801981d1969d9fdac375d63ff0a71f218d782d11
Author: Thierry Reding <treding@nvidia.com>

ARM: tegra: Clean up AHUB on Tegra124

This commit updates the #address-cells and #size-cells properties to <1>=20
for the AHUB on Tegra124, since 64-bit addressing is unnecessary for this=20
hardware. It also adjusts the ranges property to encompass the entire AHUB=
=20
range according to the TRM.

> diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts/n=
vidia/tegra124.dtsi
> index ce4efa1de509b..7a71dba42dc0c 100644
> --- a/arch/arm/boot/dts/nvidia/tegra124.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra124.dtsi
> @@ -1114,13 +1114,13 @@ ahub@70300000 {
[ ... ]
> -		ranges;
> -		#address-cells =3D <2>;
> -		#size-cells =3D <2>;
> +		ranges =3D <0x7030000 0x0 0x70300000 0x10000>;

[Severity: High]
Does this child bus address miss a trailing zero? The ranges property here=
=20
specifies a child base address of 0x7030000, but it looks like it should=20
be 0x70300000 to match the ahub node address and the subsequent child=20
device addresses.

If the child base address is set to 0x7030000, wouldn't the translation map=
=20
fail to cover child nodes starting at 0x70301000 (such as tegra_i2s0)? This=
=20
appears to cause all I2S and other audio devices under the AHUB to fail to=
=20
probe unconditionally on boot, since the OF core cannot translate their=20
memory addresses properly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-tegra-ahub=
-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com?part=3D1
