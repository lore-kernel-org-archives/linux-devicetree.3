Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFF439A81E
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 09:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962295; cv=none; b=tD8X6MbfR1+xdz93PZWRHMQxrdfQrSl2vfCE5pgAPfD8R8+l2G2ORtR6j7XW4hjLj9ZO3vVpb/t+D8YIXbVJeLUPSbho/Rh3lTifonlv85IRuvYbK7bRIDChy2MlUg4jmcy805QbcD+q6SloauuSV/FI+aJKGhn1sPL5fTNz4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962295; c=relaxed/simple;
	bh=qXq0pp2PGGQ0SzReuRieWR9ODhUaHEYwoxhyblJad58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rA9rD6hSwjlDZ6r9Ypgzw6QTnrU1swiF9IBflJysRXJ3Fos1W04sbil9dcTO+azv42mUPuR2k3j1i7ZUvj4kF6PAYBufADHItEplFAa6rvSzoahIlF6/HL9wmDsjEx3vkNdlgF+kwMXbuqkvRmw5Q1WPy/panoo3/vxLg799bsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oD28J5Bn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oD28J5Bn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8B01F000E9;
	Thu, 28 May 2026 09:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779962294;
	bh=W4/LXQzdkPk6yBqu25C5pOL7uEazBRhGnfLaKdrRrxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oD28J5BneDFv33ghfc6zxtofUxOmOLh0IdIOv33I3UArPWudJmFUUlfYggP0Hwv5X
	 GDyfZDsWOjNMOd8g8LV34aBI/fwWvhyLdvqxUrqICv75QKkmVO6MIa1F2SbGnuzEOl
	 PDHwu+0nfhcrEteQvBlTFNtU9g9N7MRQHs6hP4cJuK0rbcZEy3cpL80W9Ic5kMY2iu
	 EMjAqVhmVEesZPTGXNkHnOCjIicqIPgqIqeKLASqnoWPsMaQxHDgiNLD9L03KADQiB
	 Dx8xZ9Y/tH7hmimojGtBAkLN6/8tCq96bxTWyoJjubuYRxvTJlvkldF+NrhlMTja/i
	 9zsnY8LQe22Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add
 ramoops region
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWFydGlubyBEZWxsJ0FtYnJvZ2lv?= <tillo@tillo.ch>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528093038.1945245-1-tillo@tillo.ch>
References: <20260528093038.1945245-1-tillo@tillo.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 09:58:13 +0000
Message-Id: <20260528095814.2C8B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `ramoops` reserved-memory node is missing the `no-map` propert=
y, leading to initialization failure and preventing the driver from loading.
- [Low] The commit message mathematically miscalculates the memory layout a=
nd fundamentally misrepresents how `ramoops` allocates space for ECC parity.
--

commit b448b96b8ca8171732f9a19b1cb33fbb0c73f34d
Author: Martino Dell'Ambrogio <tillo@tillo.ch>

arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region

This patch reserves a 64 KiB memory region for pstore/ramoops on the
BPI-R3 board. The carve-out is intended to store kernel log data to
persist across warm resets.

> The carve-out is divided into 8 KiB kmsg records, a 32 KiB rolling consol=
e,
> 8 KiB ftrace, and 8 KiB pmsg, leaving the remainder for the per-record
> Reed-Solomon ECC parity (ecc-size=3D16) which significantly improves dump
> readability when the panic path truncates writes mid-record.

[Severity: Low]
Is this description of the ECC parity location accurate?

With 32 KiB for the console, 8 KiB for ftrace, 8 KiB for pmsg, and two 8 KiB
kmsg records, the allocations sum to exactly 64 KiB, leaving 0 bytes of
remainder.

It appears the ramoops driver implements ECC by carving the ecc-size
directly out of the payload capacity of each individual zoned region, rather
than placing it in a separate remainder pool.

Could the commit message be updated to clarify how the ECC parity is actual=
ly
allocated within the zones?

> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/a=
rch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index 19f538d160ab5..31ee189dedc73 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts

[ ... ]

> +&{/reserved-memory} {
> +	ramoops@42ff0000 {
> +		compatible =3D "ramoops";
> +		reg =3D <0 0x42ff0000 0 0x10000>;
> +		record-size =3D <0x2000>;
> +		console-size =3D <0x8000>;
> +		ftrace-size =3D <0x2000>;
> +		pmsg-size =3D <0x2000>;
> +		ecc-size =3D <16>;
> +	};
> +};

[Severity: High]
Does this reserved memory node need the no-map property to function correct=
ly?

Since this region sits within the system DRAM starting at 0x40000000,
without no-map the OS will incorporate it into the kernel's linear mapping
as Normal Cacheable memory.

When the pstore/ramoops driver attempts to map this region using ioremap_wc=
(),
will ioremap_prot() on ARM64 detect the attempt to remap active RAM with
different memory attributes and trigger an aliasing violation warning,
returning NULL and preventing the driver from loading?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528093038.1945=
245-1-tillo@tillo.ch?part=3D1
