Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C214138E13F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446269; cv=none; b=BJqcrznKuq7rkzEjpV1zVU3sBb4deg4V4OKpRiVPSAaA+0MCBcrnr6ZHB3SMzmjyNQ0vO9Ty0liZ874mPZ6RRrWzcQFRkc6uuzJWF643JVaUgFzNyLX6TfGVY6FS6Y93h/OUNo6G9HhDVdZTg2VSQrBr+YGkSTU5M4F8AiA/G1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446269; c=relaxed/simple;
	bh=Vq9i9HJdegVeP24RNEnfL9MR912xCTqphc80g2IGfRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VgAgzFxw7XVvQoW0NnlOnlMRNQ/zYV104DP3iMlEX6JM9x5HxWh0acSsX2letNSLe+7R677yWYUp5D8RQuZ4uktAFh0N7NHA3iEYJ4jnzHr84zZia70vvVFOprVNBoXcjOPgrVtXR0oewafVKGDW7kT+7R0BB8VnlQZZNk7pEiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1L+oLnp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1L+oLnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92031F000E9;
	Fri, 22 May 2026 10:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779446264;
	bh=YQi7MouMgkBqzkmRvi3vGMNt072U99/ef29MGhPxcwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M1L+oLnpwa3/ReEGZ8Bohoq7DXSROYGpRdOhk795LRDrfrq7A2f1IzMV+bj1a1F2C
	 0aH5ebAl0txArNIKyToSvSNBD4BxbP6IKOHQnmmxE0Rxtbzj5Nvf5BYPtzRJ7C22e0
	 AJHKy233eo2bAvdtzK0zadSpbYp1WpsrjyMYWgOvtxvacbL842jqX+B7zJlnCvxd0i
	 qxF599jIqe7EHPMEB40DOqY9cyykqr7aHvS96LtrXuThpK5keEVhMfLzpu5JSjnKHp
	 DLsFt7fVixXtg3VKkMI7f/pwTr9BPTHzTaguenAQues+273rE16yKVbei21N1Sdr4l
	 Lhn2VDV21YPnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522-bpi-cm6-v1-3-707ef1917a30@pigmoral.tech>
References: <20260522-bpi-cm6-v1-3-707ef1917a30@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 10:37:43 +0000
Message-Id: <20260522103743.D92031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `vpcie3v3-supply` property is incorrectly applied to both the P=
CIe host controller nodes (`&pcie1`, `&pcie2`) and their root port child no=
des (`&pcie1_port`, `&pcie2_port`).
--

commit 0620787d4f86f8d706f7dc3a6b25263906add1bd
Author: Junhui Liu <junhui.liu@pigmoral.tech>

riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board

This commit adds initial device tree support for the Banana Pi BPI-CM6 IO
board. The board features the SpacemiT K1 SoC, and this patch configures
interfaces such as UART, eMMC, SD card, I2C, PCIe, USB, and dual Ethernet.

Link: https://docs.banana-pi.org/en/BPI-CM6/BananaPi_BPI-CM6

> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts b/arch/r=
iscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
> new file mode 100644
> index 0000000000000..b2767f44e8d62
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts

[ ... ]

> +&pcie1_port {
> +	phys =3D <&pcie1_phy>;
> +	vpcie3v3-supply =3D <&pcie_vcc_3v3>;
> +};
> +
> +&pcie1 {
> +	vpcie3v3-supply =3D <&pcie_vcc_3v3>;

[Severity: Low]
Does this cause a dt_binding_check validation failure for the host
controller node?

According to the spacemit,k1-pcie-host.yaml binding schema, the
vpcie3v3-supply property is exclusively defined and required within the
patternProperties for the root port child node, rather than for the
top-level host controller itself.

Should this property be removed from the &pcie1 node to avoid an
unevaluated property warning?

> +	status =3D "okay";
> +};

[ ... ]

> +&pcie2_port {
> +	phys =3D <&pcie2_phy>;
> +	vpcie3v3-supply =3D <&pcie_vcc_3v3>;
> +};
> +
> +&pcie2 {
> +	vpcie3v3-supply =3D <&pcie_vcc_3v3>;

[Severity: Low]
Similar to the &pcie1 node above, does the vpcie3v3-supply property belong
in the host controller node &pcie2, or should it only be present in the
&pcie2_port child node?

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-bpi-cm6-v1=
-0-707ef1917a30@pigmoral.tech?part=3D3
