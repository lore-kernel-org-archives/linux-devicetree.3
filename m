Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DF61A6812
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778554031; cv=none; b=FAS79y0oGRfX1983l7qtcveRkrj7X1WrLXhwogSyi4zArqO+D+NR4U9h1QROMf6I7qjgiFKZY61MvlWcSeYDMaV5SRP1Hh/UaNK9Gxh4zSA8Uv7Ey7kGTZ3MBrCAlZ7j+H4EQw6nU8eMQ3ya7azDdIy5AykeiPCQWfzRtVVKizQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778554031; c=relaxed/simple;
	bh=fRX8hkJoeugmRF/MlQqczlsmBTgHkFBpXT0+YpDGYZ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rh3/75YTpyJOfmtpA/8B5kbjZAc5nwY3Wl/AzPiUNB7W6nestYo6gUbqcfCtCMAWCetQfFg6ka+EYUBHS0tmontROsHIRR3aseiUXWXXvzAYpF2UM0zKvIKwrhBLLHMzdXw0GaTUQEnFyEeoxkx13B6V79sYgsoQ2LhThISX87k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rY2TAu+u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rY2TAu+u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A20C2BCB0;
	Tue, 12 May 2026 02:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778554030;
	bh=fRX8hkJoeugmRF/MlQqczlsmBTgHkFBpXT0+YpDGYZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rY2TAu+ueV/dvYElLcekTm4fdUCZrP7P4wScBzQOChoobLlTF+C8rqFMCg9xjd/9M
	 BYjYnC5+01l/H7n54fmSOIcwEwTD4gJxZxkL31oSusKLjBGdd/NksNbeayBBN8GyU8
	 TBvzTiNC1/afruie8NBh2geO7eIWo+QCWzo1ark5YqqgpmNuuZxNL/GozVynqvI5Tf
	 ySrl/t8nUij/StqT6kZ13KrEyn0r6t93W3zz2XkYf5JswqFlxEv1M6riU3E5KznLkw
	 3aWmPg7Z5fmQoFHNfKD/k3IqBJkTi7aAmZK65G9Thq/EfOTH7TC2cJcT+wZH2oZkyW
	 W1WcbzLncsuTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/8] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
Reply-To: sashiko@lists.linux.dev
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-5-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-5-ae48c0b2b2cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:47:09 +0000
Message-Id: <20260512024710.63A20C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] DT Node Sorting Violation in k1.dtsi
- [Low] Hardware Semantic Mismatch / Undocumented Hardware Quirk
--

commit b041436345c6321304b2ed59c04953c7c67e6e5f
Author: Iker Pedrosa <ikerpedrosam@gmail.com>

riscv: dts: spacemit: k1: add SD card controller and pinctrl support

This commit adds the SD card controller infrastructure for the SpacemiT
K1 SoC. It includes the sdhci0 controller definition along with the
corresponding mmc1 pinctrl configurations for standard and UHS modes.

> Add sdhci0 controller definition with clocks, resets and interrupts
> Add mmc1_cfg pinctrl for 3.3V standard SD operation

Does this hardware route the SDH0 controller logic to the MMC1 physical
pads?

Since the patch defines the sdhci0 controller (using base address
0xd4280000, CLK_SDH0, and RESET_SDH0) but adds pinctrl configurations
referencing mmc1_* pins, it appears there might be a cross-routing
hardware quirk.

Could this counter-intuitive hardware behavior be explicitly documented
in the commit message or through inline comments to prevent future
maintainability confusion?

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
> index 24becab4c9594..6ded5c06b7975 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
[ ... ]
> @@ -1226,6 +1226,19 @@ emmc: mmc@d4281000 {
>  				interrupts =3D <101>;
>  				status =3D "disabled";
>  			};
> +
> +			sdhci0: mmc@d4280000 {

This isn't a bug, but should the sdhci0 node be placed before the
emmc node?=20

Device tree conventions dictate that nodes should be ordered by their
unit-address in ascending order, so mmc@d4280000 would typically come
before mmc@d4281000 in the storage-bus node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-orangepi-s=
d-card-uhs-v9-0-ae48c0b2b2cf@gmail.com?part=3D5
