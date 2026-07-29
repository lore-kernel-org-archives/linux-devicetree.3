Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A643C09F5
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785355998; cv=none; b=cAS8dU8AuXlewIFi4Ic3ve1eMB2wb3NzXR8hKkPrXEkXf0HM9VAwVuKAGWENASJaHtBa0rhEVDTNipDAP3JXJl/7eeDZHkoMF1QAeNxtT1IPVOb9trJJuVTf/baMAohhoJsa2rIP6N5mJReSqiKW5vN2rUB+yrEPKuUenKulxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785355998; c=relaxed/simple;
	bh=DP+3SVuGonKK2VKSANjRjQ8NkDdY0v2dPQiLlYc0wcM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fXfXRmMYzYrwhsESsgmrVWaHzW65O7nAoNVJlCU1/Crjspa/kLmIHFJEqN/FjK1o2ByfIY3vkg+BWaUGQW4b4KHxCAw6/oZBtQ5Rw7l/jMeyGQj26JDXkCH7dT8+6FuJTpDiaedMTx2xtlCj46Fn8p0P54HZmSNI/gFEdQ2Ook4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msUlsXu7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msUlsXu7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3208B1F000E9;
	Wed, 29 Jul 2026 20:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785355997;
	bh=+gx1E8lOb+FW2W+IJog7MzZo608HTEmMMi+flhFXB64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=msUlsXu7PH1vmHao9kIyqXSSFhUGRoGwV3bft0HidFZwrOXkIckkemem1yHkbFC3Q
	 CMfRrjHRho3Fl7aM2WOHbaRQV3M3eot9FCeDtnUeIDesQcP3wdl0b++qxBx7NCRKRQ
	 1aJchEzQrES7w43qd7+cu6inK3ZtXHKYgQbo87fQzkJRt5lCKjw3oXFg78qRXKIG49
	 vfVum5GOQUdf8tlgutmZ9uN2iNgeaTWlHAslqu00rW3SYERMXWH+X5z7SJD8yggEYF
	 +mVLrd7QUxMS3ebQ/pDbWTwR2tKK9Kic8jm4f5wMCEFtQJNN1sMO9sBCDuZCXdnqe6
	 GAQDDtN+e4P9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: ti: k3-am64-sk: Disable MMC1 internal
 pulls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729195958.671147-8-jm@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
 <20260729195958.671147-8-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 20:13:16 +0000
Message-Id: <20260729201317.3208B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unintended removal of pulldown and incorrect receiver state for =
`MMC1_CLK`.
--

--- Patch [7]: [PATCH 7/8] arm64: dts: ti: k3-am64-sk: Disable MMC1 interna=
l pulls ---
commit 3a83d1bd44a1ef684b5bd29a93a2127e82509201
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: k3-am64-sk: Disable MMC1 internal pulls

This commit drops internal pullups on MMC data and CMD pins to prevent viol=
ating
minimum pull resistance specifications, as external pullups are already pre=
sent
on the board. It also removes the CD pullup to reduce power consumption.

> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts=
/ti/k3-am642-sk.dts
> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> @@ -198,13 +198,13 @@ &main_pmx0 {
>  	main_mmc1_pins_default: main-mmc1-default-pins {
>  		bootph-all;
>  		pinctrl-single,pins =3D <
> -			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
> -			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
> -			AM64X_IOPAD(0x028c, PIN_INPUT_PULLDOWN, 0) /* (L20) MMC1_CLK */
> +			AM64X_IOPAD(0x0298, PIN_INPUT, 0) /* (D19) MMC1_SDCD */
> +			AM64X_IOPAD(0x0294, PIN_INPUT, 0) /* (J19) MMC1_CMD */
> +			AM64X_IOPAD(0x028c, PIN_INPUT, 0) /* (L20) MMC1_CLK */

[Severity: Medium]
The commit message mentions removing internal pullups because of external
pullups on the board, but MMC1_CLK in main_mmc1_pins_default was configured
with PIN_INPUT_PULLDOWN. Does this blanket change unintentionally leave the=
 clock
pin floating when the MMC controller tri-states the clock line (for example,
during idle or suspend)?

Additionally, keeping this as PIN_INPUT leaves the receiver enabled. If the
clock line floats without a pulldown, could the floating voltage cause the =
input
receiver to rapidly toggle and increase power consumption? Should this pin =
be
configured as OUTPUT-only instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729195958.6711=
47-1-jm@ti.com?part=3D7
