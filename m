Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4773101A7
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 20:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272958; cv=none; b=mtMqq7cVanz51oVDEF0f6IN1ZNq1CcsRSGDiDL01Y4KZNGxof9FHNKFkDCiKXLK1FqLel339JP+aUZCKaxNKmPYlKXaJUJc1FO558GpI37w6XjHH5LZ9wUnvm64pa/RkD7sdyPyZNAG7k3Qp6xgQ2Zp2iFKTXSJe93EQYCFGVSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272958; c=relaxed/simple;
	bh=9Wt//LPMg7PGpk27xz9oWC+u1W58+gc60m5+aaUD910=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ITGtWN548gCO2sJNgrK+i2H1r6pnsjL5U423qnZgnI1Z5iONVdvMQUq19ysx0iXlKULeC8RRdmrvh7pMUSjtcE4XnUPYE0twH5UQSm+TT+EFQSZVd/LZ2NVQS/KIQCAxyqauFESkvaTK1e+Ry8pFjk1EUSTwQllq0D9nlSjZXFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2gCCTsm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2gCCTsm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF26C2BCB0;
	Fri,  8 May 2026 20:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778272958;
	bh=9Wt//LPMg7PGpk27xz9oWC+u1W58+gc60m5+aaUD910=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=U2gCCTsm18x2ipFQZCZKZCfMl6XuCPDG8P5TcJ4xsT0lK4ZC02RUNbkDOypoeCkC5
	 +5lsAWS1vfdGDhnHh0+BnZdyt6mMqvU8fMWueG+H9jInZosFCgdcISTJ/0phJjFYf0
	 D0sSQQiAoh0sx0uvKGgbUdupvFpxSltPYQ4OZrCNEOrtjB8IZVd8tPfXcl9wteFoaJ
	 QR1aNiOByCCENbayJZtVaCw9JwvYxvlwXOemKqSMAHLa8Ows//lmKtiD6SD3Epwd+L
	 EN/ys1LJelsbIPUMRcgLtBgAnZKc1otIOG/i2Jh/zDNqnpBfBha1mp7AcF8f8jYbGp
	 sfFnHVz5IxT2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: agilex5: add support for debug daughter
 card
Reply-To: sashiko@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <a42751b4c7eb9b4d58f2ef1db3591ff68385a562.1778237639.git.adrian.ho.yin.ng@altera.com>
References: <a42751b4c7eb9b4d58f2ef1db3591ff68385a562.1778237639.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 20:42:37 +0000
Message-Id: <20260508204237.ADF26C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Abuse of the 'rohm,dh2228fv' compatible string to force the 'spidev=
' driver to bind.
- [Low] Including a '.dts' file directly instead of using a '.dtsi' include=
 file.
--

commit 3916af69e58bdb9bf4d736172238dd0b03e9465b
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

arm64: dts: agilex5: add support for debug daughter card

This commit adds a new device tree for the Agilex 5 SoCDK when fitted with
the debug daughter card. It disables several peripherals such as gpio0 and
gmac2 while enabling gmac0 and spi0 for debugging purposes.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts b/=
arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
> new file mode 100644
> index 0000000000000..3981a9e876b0a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier:     GPL-2.0
> +/*
> + * Copyright (C) 2026, Altera Corporation
> + */
> +#include "socfpga_agilex5_socdk.dts"

This isn't a bug, but does this include a final board .dts file instead of a
shared .dtsi include?

Standard Device Tree conventions typically involve refactoring shared
configurations into a common .dtsi file, as .dts files are meant to be the
final top-level compilation unit for a board.

[ ... ]

> +&spi0 {
> +	status =3D "okay";
> +	spidev@0 {
> +		compatible =3D "rohm,dh2228fv";

Is there actually a Rohm DH2228FV hardware device present on this debug
daughter card?

The commit message indicates this exposes the SPI interface for debugging.
Does this code use the 'rohm,dh2228fv' compatible string solely to force the
Linux spidev driver to bind?

The Device Tree is meant for describing hardware, and using fake hardware
compatible strings to instantiate userspace interfaces bypasses the kernel
warnings against using a bare 'spidev' compatible string.

> +		reg =3D <0>;
> +		spi-max-frequency =3D <10000000>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778237639.gi=
t.adrian.ho.yin.ng@altera.com?part=3D2
