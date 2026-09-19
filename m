Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767DC49620
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789847406; cv=none; b=o3vO+Qnd6UDLV7BILGG0fTfJxz36UpWNZwjXUKin3YChmBJvSNM956TiWqBI50jQ5x5LbSRbV9BOZLNQpt8VffQpkUViO2dqTyOZfN93TWUGman11cmfqBQc98x/Znb6XuOk5vwEVlrXRJx5ZU2HMr85SE/AAtOctK04HsmJyis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789847406; c=relaxed/simple;
	bh=S0RVJe21JrBgi+j8g0R/9N6nj+G2J3vnOZqgLSDhPlY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tSRukURFQgCZXz319woELDkXdPbs/ArHWczEAKXQ8zadYNvuYqT58EO2gBjZ+v9tYuIvcJJ1y9F02+Nekl8sutzQMVVpcgNITc2NfHJDHwXguOIX8x6x+LOXTgmFDWccJ0gTBD3B3hmitrir156qy0ZQCaXU4WtHq9wWSLpaQuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiBiRiXL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KiBiRiXL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99D11F000FF;
	Sat, 19 Sep 2026 19:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789847405;
	bh=+oKbpI4uIGXo2xhLnvTm9iN7KH87Uqtpt+D60dSsz4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KiBiRiXL/xdwaZM20BnJed35GEUnL7QzDuBezmXVspOtF7IoOrSJJW/Mpr5Vmu7Xt
	 kZs6fsmw4hXwOfgiD5vt2kKjuMhkat8To0sLwAYDaT9rYstq2sG5K6hbfVKZdLE60A
	 64HLiZBJd+ZTPvEjHSU2sp8j/AUjLHuSuYe3bYQulYVQASpg3ECE5z/3ULoVg3SR2v
	 6W3hAzhKFLwDqx9zl8DiUuUbHaQwFAbQTcApPjY+/Tw3PTdhXCEx/HLm7+jQzm1OEg
	 nprLuEOHUjC/+WVqXV6rFxHlJisTPV+e5PYQTaDXOH9DgMTLFrGSbbXefeK7ln64t+
	 EibILvRfCV+DQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolo Giuliani" <nicolo.giuliani6@studio.unibo.it>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 19:50:04 +0000
Message-Id: <20260919195004.D99D11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt: intentional omission of physical reset-gpios to workaround d=
river bug
--

commit 3bbda9294c3060f49dfc25ff724a945a54bd4560
Author: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

arm64: dts: marvell: Add Sophos XGS 107w NPU board

This commit adds a device tree for the network processing unit (NPU) of the
Sophos XGS 87/107 desktop firewalls. It describes the Marvell Armada CN9130
SoC, along with the UART, eMMC, SPI NOR flash, SFP cage, and a Marvell
88E6193X switch.

> diff --git a/arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dts b/arch=
/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dts
> new file mode 100644
> index 0000000000000..d98d8da10e637
> --- /dev/null
> +++ b/arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dts

[ ... ]

> +&cp0_mdio {
> +	status =3D "okay";
> +
> +	switch@2 {
> +		compatible =3D "marvell,mv88e6190";
> +		reg =3D <2>;
> +		/*
> +		 * The reset line of the switch is CP GPIO2 pin 17. It is not
> +		 * described as reset-gpios: the 88E6193X needs about two
> +		 * seconds after a reset before it can be used, much longer
> +		 * than the driver waits, and the probe would time out. The
> +		 * boot loader resets the switch before starting the kernel.
> +		 */

[Severity: Medium]
Is it appropriate to deliberately omit the physically present reset-gpios
property to work around a Linux driver timeout limitation?

Device Tree is intended to be an OS-independent description of the hardware
topology. By intentionally omitting this connection in switch@2, the kernel
is unable to reset the switch natively (for instance, during a driver reload
or system reboot).

Would it be better to accurately describe the hardware by including the
reset-gpios property here, and instead fix the timeout in the mv88e6xxx
driver or use standard delay properties like reset-deassert-us to handle
the two-second requirement?

> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-send-dt-v1=
-0-365615a74ef3@studio.unibo.it?part=3D3
