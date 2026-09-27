Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A683C09E2
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509775; cv=none; b=tvPmL9rQfQugAwA7QkvJbtlOzRsqWbJkjqGG2NbQoPdXnDJPicnovD4WSniY4RboIjAH9lePmjl80kbkf1Sbhs9T+q8sYC7sWDy9EZA8TkOqfM7PGIlt7m6IE0MrrVXJYtKlW/Jv/PWSEdHWsHajN9aEpHjTchCTbeqXkZX4B68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509775; c=relaxed/simple;
	bh=I1tivL+EE0prjCBbUmf2Wh13P5Yg5ornWzimQ9IgwUs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bSk8MeKOzjBxcaMTTXTL9UBKj6RPRVqsZKiJaXXbHFhtU7sOqmS0ObTDrRNEqhhlAEi8gjAfeZMb08NqrdNi1bX9KrxA0swCY1ktcEP6PZTYXzFvfO2sb1cMo2ucRZi4ok+vpIpIGg3BluCLehWKvjR3f3t5KvcHTzIAQXB9ld0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrUf0dyw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrUf0dyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD2B1F000FF;
	Sun, 27 Sep 2026 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790509774;
	bh=EIJjbJ02RcvFEP+RyO/t23wuQt3bWg3BCab8WgavJTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TrUf0dywRu4YQhPb6MRlfYTE+dHGng2yD1Xc+zQR0S1+h91RoBNEIfx5DHSKOnLYU
	 vscVQPXUDklXvr23jgujGrFWdeDSCrp/8I9p3s68lkw5+V13nFZT+BQf0C6DEAqADn
	 YKAoDpwfR15JVGtJTG0ivzIBkSAbS0uh6zTlaqn5xpXBPGZbBBtdFUmj/vy66Uvx2J
	 RnOmeQPjFja9d6C7SZJBrGM5OMtrLE0X6y8bGPTjR6iq5fD7GPt+USmwaRhOpYjtNH
	 TgwDj35yMpO9Q23XFAJ8e/yNL2fKzl4D1J7q3WX3RQD8Is5tzhVa5PsildVPaEAOaO
	 osheuCsrVK5Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] riscv: dts: spacemit: enable USB2.0 controllers
 on BananaPi F3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260927-b4-spacemit-k1-usb2-v3-6-ce7095896039@linux.spacemit.com>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
 <20260927-b4-spacemit-k1-usb2-v3-6-ce7095896039@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 11:49:33 +0000
Message-Id: <20260927114933.ABD2B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] usb: missing usb-role-switch property for standard sysfs ABI
- [Low] dts: board file nodes not sorted alphabetically
--

commit 44aeea968dbe19365572cdf8df737d1b44de83c9
Author: Junzhong Pan <panjunzhong@linux.spacemit.com>

riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3

This commit enables the usb2_0 and usb2_1 nodes on the BananaPi F3 board.
It intends to allow role switching via sysfs for the Type-C port and=20
support cellular modules on the Mini PCIe slot.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv=
/boot/dts/spacemit/k1-bananapi-f3.dts
> index 58035d886bf67..ce36250e2debd 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts

[ ... ]

> @@ -383,10 +383,26 @@ &uart0 {
>  	status =3D "okay";
>  };
> =20
> +&usbphy0 {
> +	status =3D "okay";
> +};
> +
> +&usbphy1 {
> +	status =3D "okay";
> +};
> +
>  &usbphy2 {
>  	status =3D "okay";
>  };
> =20
> +&usb2_0 {

[Severity: Low]
Are the device tree board file nodes sorted alphabetically here?

Device tree board files mandate that node references be sorted alphabetical=
ly
by label to prevent merge conflicts. Based on ASCII sorting, 2 (0x32) comes
before p (0x70), so &usb2_0 and &usb2_1 should precede the &usbphy* nodes.

[Severity: Low]
Does this node omit the usb-role-switch property required to expose the
standard sysfs ABI?

The commit message notes that the user can switch the role in sysfs.
However, by omitting the usb-role-switch property, the driver defaults
to exposing its legacy, non-standard driver-specific sysfs attribute
(/sys/devices/platform/.../role) rather than registering with the
standard USB role switch framework (/sys/class/usb_role/).

Would it be better to include the usb-role-switch property so that
modern userspace tools can use the expected standard UAPI?

> +	status =3D "okay";
> +};
> +
> +&usb2_1 {
> +	status =3D "okay";
> +};
> +
>  &usb_dwc3 {
>  	dr_mode =3D "host";
>  	#address-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-b4-spacemi=
t-k1-usb2-v3-0-ce7095896039@linux.spacemit.com?part=3D6
