Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB4931F9B8
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779330865; cv=none; b=dlWhqsysjbRmny/cOXoLR5r+ShHd0m08zYET8XpNNQOD6fNX6YrUZXhbtgNfDVSQq3L8UTWBf3nvk5oAk2J4kLmBZaWzJQpjvLxltjbTO5qDwOCFMTUqf1tTOd7+y681z/ahbvTC1lKKmV2V2PuZ9ANfiZZ9C6JwXplAJqIOJk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779330865; c=relaxed/simple;
	bh=z5gxcIhRp72LQP/SZDiLChYjW88hgxcuRdAWNflQm6w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qQ9nlxaMkRcRQtWBJOfPh0P59gXhzgnBZP5n88gRv7e+qzcS34B7NOxzH6tY6tuWXxq5icw92ZJadhGTDe66USAxrM1fDhNf+7cC9iRp1JbcMdq2H8arV85Wq5vttSlrw+bepABRDcqB/PFJQEkbYzCiy+YnnCyFSzTPd003USU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfBbA9fo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfBbA9fo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8031F000E9;
	Thu, 21 May 2026 02:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779330863;
	bh=2nLteigCSmtJyu5GpEZ64he2yZXeyBoQxJmJtpkFo3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OfBbA9foz37nhRcwzkxOBiPhMcxZ4Eese9HDp3/ktEqQs+1vQgaMNQe1CHiOgv+g8
	 mchVY5IAXsTU9F7Uifyx24Un/3od7Manb+C4FTvbr6VB09ZWqqEymYuvbuBuRmPH+2
	 NGnj6myIL3WFS+z3kX20arnVVPliIkbOlZIwwjhgZWnXGmPNhuXP00yUehPxEkoGHv
	 +ih70OcjbMoPLTx9mL3eLQagOxJjQthswS8cBN/JKPTgaTBZZm0aekta8P2965RfGN
	 PnjrLVb69azDtRTaqAMf8svmPReB44XsJZbGu4EMnd5ey9Nao6KiE1Yzb64pYP2RvU
	 qQiptkIR1F1ZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay
 for AM625-BeaglePlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swamil Jain" <s-jain1@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521020630.816220-1-s-jain1@ti.com>
References: <20260521020630.816220-1-s-jain1@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 02:34:23 +0000
Message-Id: <20260521023423.6B8031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing pin multiplexing configuration for the OLDI interface, cau=
sing display signals to not reach the physical pads.
- [Low] Incorrect indentation (spaces instead of tabs) for `pinctrl-0` assi=
gnment in the `touchscreen@5d` node.
--

commit e2feb337dbf24067c54227c036db263d92a14b0a
Author: Aradhya Bhatia <a-bhatia1@ti.com>

arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay

This commit adds a device tree overlay for the Lincoln Technology Solutions
LCD185-101CT panel on the AM625-BeaglePlay platform. The panel is a dual-li=
nk
LVDS display supporting WUXGA resolution with a Goodix i2c touch controller.

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd18=
5-panel.dtso b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd18=
5-panel.dtso
> new file mode 100644
> index 0000000000000..e7cadd48d4391
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel=
.dtso
[ ... ]
> +&oldi0 {
> +	status =3D "okay";
> +	ti,companion-oldi =3D <&oldi1>;
> +};
> +
> +&oldi1 {
> +	status =3D "okay";
> +	ti,secondary-oldi;
> +	ti,companion-oldi =3D <&oldi0>;
> +};

[Severity: High]
The overlay enables the dual-link OLDI interface but does not define or ass=
ign
any pinctrl properties for the OLDI data and clock pins.

Since the base k3-am625-beagleplay.dts does not configure these pins, won't
they remain in their default reset state?

Relying on the bootloader for kernel device tree pin multiplexing can lead
to the display signals failing to reach the physical pads if the bootloader
does not configure them.

[ ... ]
> +	touchscreen@5d {
> +		compatible =3D "goodix,gt928";
> +		reg =3D <0x5d>;
> +		pinctrl-names =3D "default";
> +	        pinctrl-0 =3D <&touchscreen_pins_default>;

[Severity: Low]
This isn't a bug, but this line uses spaces for indentation instead of tabs.

> +		interrupt-parent =3D <&main_gpio0>;
> +		interrupts =3D <39 IRQ_TYPE_EDGE_FALLING>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521020630.8162=
20-1-s-jain1@ti.com?part=3D1
