Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBF7387346
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063892; cv=none; b=KcoKOs1/wJni3GjplMTtDWO+5HY+82rpQiI4f2fdeWXT7ULVEMB/J7pNuh5BQImx404Reear+Aj//tWCZaSNMZrkcKk2l/BRo5eF3bJdrNi/J7G1MH0MkL95VG433GgPerpUihsOoQq1O91PMGgdhePbZSgJONRpmiWPsFUPuyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063892; c=relaxed/simple;
	bh=LksFWWjyQyqCGMrNNZAo7e/8nVs623w3XBjuvKMm6BM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=shb1OjKX72YwDHk9rz+pkcFB+BHjgkSnF6YtsEs2++UaftLeUxuRNh3pC4ukuKp0wmZRrDTUPRmwq4SUKlevWoRrLlJwg4iulhE+5v/amNk5UC6T5rcEM3IyKcNOhxWiNxGV1lRxyzL6yZaF7kUhKUHfNQI2smm01TmoX802KPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYJeeVee; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYJeeVee"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6541F000E9;
	Tue, 18 Aug 2026 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787063891;
	bh=+O/ZT/h2fBcu90LG3qM+x5V6RIJPofSSOdRXjiNh6XA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IYJeeVeed4stRdOtvUi+TzIjQoTpYlUbVGxN+ofzPUz+dhHolgmPWEXYvqYt8VbOU
	 Eh8qymEksUZMYMhbwVj7IcUXwSqwGtjn4fO3OGVq5Bl8MSzBR3osvdiGMXnrwoHDO+
	 iNqpY+uB7XjjIMN+fWFie8GBfM7juHSqu8VubWFVARy9GBRB9l980L8a/hES0B7hEg
	 pWhNpgXPPkvO8pBvuUzCtIFm2Plyj2l2J8KunuYII4q0xa9SpuuQ5UofJwCTr5Jmg/
	 mNargmdMzizfavUNp3N447cdMPc04txGyowUJwNgPClTx/7PDfAtO8S8nu8nl0Pha/
	 3ztACcD68eSCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g047: Add USB2.0 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tommaso Merciai" <tommaso.merciai.xr@bp.renesas.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <d72dcffe5427f03d1de8b8e50069a5fa0e4b7edc.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
 <d72dcffe5427f03d1de8b8e50069a5fa0e4b7edc.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 14:38:10 +0000
Message-Id: <20260818143810.BF6541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree nodes are not sorted by unit-address.
--

--- Patch [2]: [PATCH 2/3] arm64: dts: renesas: r9a09g047: Add USB2.0 suppo=
rt ---
commit d34912c9041670ddb50206c7be9fec96e890adfb
Author: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

arm64: dts: renesas: r9a09g047: Add USB2.0 support

This commit adds support for the USB2.0 channels on the Renesas RZ/G3E
SoC, including EHCI, OHCI, PHY, and reset control nodes.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g047.dtsi
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1773,6 +1773,130 @@ usb3_phy: usb-phy@15870000 {
>  			status =3D "disabled";
>  		};
> =20
> +		ohci0: usb@15800000 {
> +			compatible =3D "generic-ohci";

[ ... ]

> +		ohci1: usb@15810000 {
> +			compatible =3D "generic-ohci";

[ ... ]

> +		ehci0: usb@15800100 {

[Severity: Low]
This isn't a bug, but should these newly added device tree nodes be sorted =
by
their unit-address?

The new nodes (starting with usb@15800000) are appended after the existing
usb-phy@15870000 node, which breaks the ascending unit-address order.

Additionally, within the new block itself, the nodes appear to be grouped by
peripheral type rather than being sorted numerically by their unit-address,
resulting in usb@15810000 being placed before usb@15800100.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787062965.gi=
t.tommaso.merciai.xr@bp.renesas.com?part=3D2
