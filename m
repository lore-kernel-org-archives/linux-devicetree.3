Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B557737F8D7
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537239; cv=none; b=DiKdTILLqctWhfr95SSWfp05g+0tKBdJ9CyncdjeJp8hY9aHCVmdT0QtvYuYPs5+0Bzh3jTjxdt7KSm22iR2yPSVdLQbiO6UxBZuhMT8TpPp01fs2ks8nYq7vVjqo5c7WFgtx0fFoWbmp04CRjAaoXNeMlsK1p6aEpro2sNZg+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537239; c=relaxed/simple;
	bh=rLbgwukDp4YTr09e+KLJZoKB/92I4IsJoF9360vvj3g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O+JFFivCBrXj6Q6+swCnHMZOKf+O+AwyhpklF8vwWS1Al+Fw7B0/iwtNHXxn5TozJpfZZVh0B+TP8xizgbUYB465EHXY5TQ+XrHU69LF3NFU6xdSF2b0h49ZCU2fCvYpQrPvBLCSognN/iE27bo/wgfeF2l2xI4876cSCS7iuo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQu/u6So; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQu/u6So"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D2EC2BCFA;
	Mon, 11 May 2026 22:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778537239;
	bh=rLbgwukDp4YTr09e+KLJZoKB/92I4IsJoF9360vvj3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GQu/u6SoAE+Ucn9qORrEQrM++4Mn6E1JaZ4KGZffvyBR5o6lhb1+QkE+c0g7rsDKX
	 cN6fDDfFw//Nf1SCUQLKedN97QsbUaQYqPa+URBcgwwHUKQC9MOLo2DXBsY/t+ZlDf
	 9vKBqstuJLcXUOp0OQqCZI9qRSCLq5kdgCK9kripqf9Bqff0Ou0/aB8ZGqY9xe/GOp
	 /dQakEXkGMe6cCzR+axcTcTx+iO2Og0NV9MfDXvt7iYa3T8iHNrWUCBBbHbCO4aYUK
	 CrhaJ6tR2LiGdLDAb/QkH1fR85cXBlOGty6JWiYZVF97iaFTDXEiwixdmNOk75Gp51
	 +lbg9wcTXGbwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
Reply-To: sashiko@lists.linux.dev
To: "Alexander Sverdlin" <alexander.sverdlin@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
References: <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:07:18 +0000
Message-Id: <20260511220719.52D2EC2BCFA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Board-level regulator constraints are dangerously overly permissiv=
e, reflecting PMIC hardware limits instead of the board's electrical design.
- [Medium] Mismatch between the commit message and device tree configuratio=
n regarding the PMIC model.
- [Medium] Missing DT bindings for new compatible strings and vendor prefix.
- [Low] Typo in the new device tree include filename.
--

commit 995a0c0548d7cc620abeca1987efff325083911e
Author: Alexander Sverdlin <alexander.sverdlin@gmail.com>

arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

This commit adds initial support for the Baijie Helper A133 board and its
core SBC. It enables UART, PMU, eMMC, USB, and Ethernet peripherals.

> Baijie Helper A133 board is a development board around Baijie A133 Core
> SBC. Features:
>=20
> - 1/2/4GiB LPDDR4 DRAM
> - 8/16/32GiB eMMC
> - AXP707 PMIC

The commit message mentions an AXP707 PMIC, but the device tree configures
an x-powers,axp803 PMIC. Is AXP707 a typo in the message, or does the
hardware actually use an AXP707?

Also, are the new compatible strings baijie,helper-a133 and
baijie,helper-a133-core, along with the baijie vendor prefix, included in a
separate dt-bindings patch? I don't see them documented here, which might
cause schema validation failures.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi b/=
arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> new file mode 100644
> index 0000000000000..65b094f30bf5b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi

This isn't a bug, but there is a typo in the filename. The vendor prefix is
baijie but the file is named baije.

[ ... ]

> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1600000>;
> +	regulator-max-microvolt =3D <3400000>;
> +	regulator-name =3D "vcc-3v3";
> +};

Does this overly permissive voltage range match the physical board design?

Since this rail is named vcc-3v3 and shared by multiple 3.3V IO banks,
allowing the voltage to drop to 1.6V could undervolt other components if a
driver dynamically requests a lower voltage.=20

Could the constraints be tightened to match the safe operating limits of
the board layout, rather than the PMIC hardware capabilities?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510201644.4143=
710-1-alexander.sverdlin@gmail.com?part=3D3
