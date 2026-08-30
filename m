Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D2D2F84F
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788122347; cv=none; b=tFTdmmnHmc9CHWKyPSD0LrCQBtkNE6U+7ocmd6o7TRsVKGHB4U0yL5L15gKIfz4OwqXjQAgPyCP4jQcxOL6U3qInDLGk+lJo8SAOIhfS1kv6JnMmcZfTbcgFGGNcNgYUFzmAqYcB6A7ZnFms3eko01GSYSFTEz3Lgf8K4o9+9Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788122347; c=relaxed/simple;
	bh=/Fht4u2YFHCTw552ZFUqu8Hq9VsKdVGtB4aYQJp9jSk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S8rqu4ZLS0MxloiwSCd6QZBicV8hodb9otqacwNivfVNEq5zZ+B4vHY9gsaL6sNA7SecU/2478RmF/pZpe7I8q/+CYz/o7k+zR+YYyH9AgRBsnSVkfT03YeXi25lkClo8y442DNb9vgJ+uXamiF14im+MeWJu3oBckRMiQxGavc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAFfQBx0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAFfQBx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA2F1F000E9;
	Sun, 30 Aug 2026 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788122346;
	bh=1wxFZhTy+HB71pt8fXPeTy+F1nFV/pdzHbT4h7DNURQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KAFfQBx0tz6ULBhUVMJzOrQYrzVvYxkJ4EpoocvKGl2bycORFHpvEEIV3o1jKo+FI
	 h6V1FEWSYH1UcvRT9YGJEGaikYBFiehQ4UzgTqk5YtFvvp36W9bbi6B4a0vmBVOYpt
	 qpYyIo3HR8dujMUxg+coebsDZ2BZqd/ai0DvqKINw0Wv5LP94T6U4RnFiJaBUKFOV4
	 yTriAnIHCMZVJlG4/BBWeJ6bI6k0cPnDf9zOtLLwZO4VmmELUHrDFnDYSOrT5K9Wmp
	 0MepDKDbrxvWpbMvRlkigVlBSFV0UVw5BrSv0q+0VaU9jWthxy59S0cS3n5sv0xJAY
	 FN8rkMfiSD75A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/19] arm64: dts: apple: t8112: Add USB4 ACIO and NHI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-18-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-18-44bc9348683c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 20:39:05 +0000
Message-Id: <20260830203906.4CA2F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree references an undefined label `cio_reset`, resultin=
g in a fatal `dtc` compilation error.
--

commit b642ea767536f5c5b53c872de870f2221d25f380
Author: Sven Peter <sven@kernel.org>

arm64: dts: apple: t8112: Add USB4 ACIO and NHI

This commit adds the ACIO host router, NHI, DART and mailbox nodes for both
Type-C ports on t8112 and connects the host routers to the Type-C connector=
s.

> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/a=
pple/t8112.dtsi
> index ec248ca052cb2..735ca3b8b7164 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
[ ... ]
> +		usb4_0_acio: cio@381ac0000 {
> +			compatible =3D "apple,t8112-usb4-acio", "apple,t8103-usb4-acio";
> +			reg =3D <0x3 0x81ac0000 0x0 0xc000>,
> +				<0x3 0x81080000 0x0 0x20000>;
> +			reg-names =3D "rc", "sram";
> +
> +			mboxes =3D <&usb4_0_mbox>;
> +			resets =3D <&cio_reset 0>;

[Severity: Low]
Does this device tree compile successfully? It appears that the cio_reset
label is undefined, which will cause a fatal dtc compilation error when
building the device tree binaries for the Apple arm64 platforms containing
the usb4_0_acio node.

> +
> +			power-domains =3D <&ps_atc0_cio>,
[ ... ]
> +		usb4_1_acio: cio@501ac0000 {
> +			compatible =3D "apple,t8112-usb4-acio", "apple,t8103-usb4-acio";
> +			reg =3D <0x5 0x01ac0000 0x0 0xc000>,
> +				<0x5 0x01080000 0x0 0x20000>;
> +			reg-names =3D "rc", "sram";
> +
> +			mboxes =3D <&usb4_1_mbox>;
> +			resets =3D <&cio_reset 1>;

[Severity: Low]
This reference in the usb4_1_acio node also points to the undefined
cio_reset label.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830-b4-apple-s=
oc-tbt-v1-0-44bc9348683c@kernel.org?part=3D18
