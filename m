Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D833DD526
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 17:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840248; cv=none; b=h9JG8j6K2Y/p7B4zbLAKyOWuh6/4XVyF6GN7QO4ht1hjWuMpn6iEMc36E43AvWXsnMpOPPzZsM39NecctkOHp0WpMsi2djR2jW7+Wcnfl/psdFipd7BmIAk89ckarKbXrc68ERWo/XzPLB5GoFBmS7CzteRPgqhGx9tOUJ8t5Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840248; c=relaxed/simple;
	bh=BYwbFdsddC5DAJnReI/CPqa5F7Am3iQ8AhihgXrU0EM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l2/F7TBuw9MEyrv2NiRjCdJpyAsROPoOAdon+a8LdwXvVfKETIgEkqVLJtvm6kBJYM3nCLy8HtBfM8IxAq4yqfuXk8Y2OfyEzPWhPpkuBG34DoS+PvdsIoqv8WpV39VLlCBOTKof/hG3IG4cs3FN0djl5aOmEKrAnPt6KdxGzMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bs+VAdej; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bs+VAdej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B07D1F00A3D;
	Tue, 30 Jun 2026 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782840246;
	bh=1zKsh11d4Ln++1ljKtOIWp9rX/DjIDqat8gijAMjhd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bs+VAdejCo+NQ/IpC3QOTRj4pZZlugqkWqAn59eSzkYrmtvBrnc5rbFJYq1O9Qmwt
	 RQFNgRYIM9KeHS7t9haF7GRca/gwWjQrikjkJ/lDg+SeQFo1oxZDWisYTmAuT/Pjvp
	 EVtwq6Wz5u5g+5VPAXp4MF2AZBUZGXYLrsEfmwyU9GujVEUKE9C5KIYiIkkQ3BocSX
	 CeQxDcl5PzE6wny06kw1T6HXLESTtY3pNkEqcrragoDB2PRJg8OtMzMYj4vzdK6AtU
	 pC6Vl+mF+WF60LL6dKS31N04DVsyDi+wOhCwPYcWKdWTcHP9sJ3nNm/N6LKIWyYBoH
	 lcIup0kD+LkfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 14/15] dt-bindings: net: add onsemi's S2500
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629-s2500-mac-phy-support-v6-14-18ce79500371@onsemi.com>
References: <20260629-s2500-mac-phy-support-v6-0-18ce79500371@onsemi.com>
 <20260629-s2500-mac-phy-support-v6-14-18ce79500371@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 17:24:05 +0000
Message-Id: <20260630172406.0B07D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree binding example intentionally encodes a software=
 framework bug workaround instead of accurately describing the hardware int=
errupt trigger type.
--

commit 4f05643415ec5654a4ffe32ab4202c0990bc3930
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

dt-bindings: net: add onsemi's S2500

This commit adds a YAML device tree binding for the onsemi S2500 IEEE
802.3cg compliant Ethernet transceiver. It explicitly uses a falling edge
interrupt trigger in the binding example to work around a current bug in
the OA TC6 framework code, rather than specifying the true hardware value.

> diff --git a/Documentation/devicetree/bindings/net/onnn,s2500.yaml b/Docu=
mentation/devicetree/bindings/net/onnn,s2500.yaml
> new file mode 100644
> index 0000000000000..11edf10508d9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/onnn,s2500.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    spi {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      ethernet@0 {
> +        compatible =3D "onnn,s2500";
> +        reg =3D <0>;
> +        pinctrl-names =3D "default";
> +        pinctrl-0 =3D <&eth0_pins>;
> +        interrupt-parent =3D <&gpio>;
> +        interrupts =3D <25 IRQ_TYPE_EDGE_FALLING>;

[Severity: Medium]
Is it appropriate to encode a software bug workaround into a device tree
binding example?

The commit message notes that the OPEN Alliance 10BASE-T1x specification
dictates an active-low level interrupt, but IRQ_TYPE_EDGE_FALLING is used
here to accommodate an existing bug in the Linux OA TC6 framework.=20

Because device tree bindings act as a stable, OS-agnostic description of
physical hardware, will publishing this example encourage board developers
to copy a faulty configuration into production device trees?

Could this lead to ABI compatibility breaks and missed interrupts once the
underlying Linux framework bug is fixed, as the device trees would then
be providing an invalid hardware description to the operating system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-s2500-mac-=
phy-support-v6-0-18ce79500371@onsemi.com?part=3D14
