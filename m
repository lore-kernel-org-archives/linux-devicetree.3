Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB53F4657E0
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737865; cv=none; b=ZMmCaxykTzuCoooEJNVC9la5oWTkF5zfBxLKuOgZ3weT0eyCbl7LNOMRWfquzqECW+NWqGKvyFMuS4gC813yi7tSiES6IF0pyN1MaE+zrzEnPEQbVj4Q6rijB2lb2vi7afaTMTG0Mze20HWShS1IXvXVDCkGXhYqPX6TOZaUOMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737865; c=relaxed/simple;
	bh=vyayj5jdG7haISPl+dXm3gs7I7+yVrZApxUmGPmvfww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=osLeoducBm/4kB+fq+RlcE4xjmHioH3sEpU8ChKih7NK0HmhSQYo9LeqCsc8kByqTeC5+ivvZF/6TrrTMAoWmLx3Kp9oVOsQcWpzh/Ccabo2ztvmWsgRMtePuE7KmPVwqKRztUtCP19lntHq+0fz9pXol2iCi6Fz++PvzxgN8ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LavaqUcl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LavaqUcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6601F0089A;
	Fri, 18 Sep 2026 13:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789737863;
	bh=0eoovA4JmhI/3i80nhoXDRRemF73ZfVf3Q3IdnITa8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LavaqUclk96jwSa5DSlGF2awLW+X+wHHMnm1rIVuOHuG98FiXbtfckigKu7zVJ+DH
	 xZyuEwbktv4Yh4QigPavKJFgf4dQ/Hk38Ug9NzxSZuBeYNXvMOUnM1c6N+uZAhXjEZ
	 t3Tl75fBWG36uzLFJk0gKx6AA2XVZ8aqJvgFPc0hLBX2BDuoDBBBbCjqys/JG0CsGa
	 1J/LJ6iHd6gT+nhrqEiovXVLvoZhElWYn6d6R2dJIYRNV6IauOusUtwFaqYgn+nbXg
	 yqpboCP9c6KX+KsjEUvgvTbIIxYx9S63QGSophYeoWpy6cu4yzo+Wlu6QnQ/+hJctE
	 4vIoomoVoKSXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/14] arm64: dts: apple: t8122: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260918-avd-v1-5-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-5-49977931f455@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:24:22 +0000
Message-Id: <20260918132423.1B6601F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: nodes not sorted by unit address in t8122
--

commit 3ed71c2496b1fa65386405608d5312e25564fcf0
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t8122: add avd nodes

This commit adds the AVD and AVD DART nodes to the Apple t8122 device tree.

> diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/a=
pple/t8122.dtsi
> index 1ee61c5b3409f..992a7216b2edd 100644
> --- a/arch/arm64/boot/dts/apple/t8122.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8122.dtsi
> @@ -256,6 +256,30 @@ i2c4: i2c@2a1020000 {
>  			status =3D "disabled";
>  		};
> =20
> +		avd: avd@289080000 {

[Severity: Low]
This isn't a functional bug, but should the avd and avd_dart nodes be place=
d in
ascending unit address order according to DT maintainer guidelines?

Currently, the avd node (unit address 0x289080000) is placed after the i2c4
node (unit address 0x2a1020000), which goes against the convention of sorti=
ng
nodes by unit address.

> +			compatible =3D "apple,t8122-avd";
> +			reg =3D <0x2 0x89080000 0x0 0x12000>,

[ ... ]

> +			power-domains =3D <&ps_avd_sys>;
> +			resets =3D <&ps_avd_sys>;
> +			iommus =3D <&avd_dart 0>;
> +		};
> +
> +		avd_dart: iommu@289010000 {

[Severity: Low]
This isn't a functional bug, but this avd_dart node (unit address 0x2890100=
00)
should also likely be placed before the avd node (unit address 0x289080000)=
 to
maintain ascending unit address ordering.

> +			compatible =3D "apple,t8122-dart", "apple,t8110-dart";
> +			reg =3D <0x2 0x89010000 0x0 0x4000>;
> +			#iommu-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-avd-v1-0-4=
9977931f455@icloud.com?part=3D5
