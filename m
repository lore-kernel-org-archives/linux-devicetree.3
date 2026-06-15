Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D323E9287
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526428; cv=none; b=T6aYueqrXX1WVAjDI92R886Ksu6AAvnG/sMYFFE+v2DQRdHFuXSwU9Yw43EB2Dv6xBrUfYPfrJ01cwBqC8qLFI/I8X+kfx5AgAeG/eZAsu5nXqfio23KE2oq+q5/nB6PMZ7QDl4sh10nDXwqRXpOnCYeobVntKiqWtdz3OvBaUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526428; c=relaxed/simple;
	bh=P6tVVchh9XtYylneWVkvRp4D4uaPM1VRe5zFwoWuVsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LFKAAKiV4SBgZbMCt4zacKW+3iLf2NmtkDRmgEqCPiOs9E7aRHbx6Y8D0DNNjVUrc4m+gQjXs1vd+sABna/+Bpr42A+p+EhMBFAXppwJj9IfgmJGSWSVlKgkoR8//Kd9eAAvv/NJCnvdccPZa2UvhxIunZWnfoVW1bTIJUadKLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6Xbcyit; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6Xbcyit"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20F71F000E9;
	Mon, 15 Jun 2026 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781526426;
	bh=DCyXKhgW5JA8QcMQh4JjLR6UuqyXsKqEhwIAPBlI9Cw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G6XbcyityeQkvUxqFeTBe1R1aY7sgfIahGQHjqvMpeJm2ZYD1aX9eKTBZILJJGbrS
	 a3HBCK+WYTfq1S2bnEMdzXjOWHDhMcYFvJD7g4SRPEHzx6ANiqF/lOZoIFDOujSpbV
	 y0UA/fDXectiR+Dot7po07D3/WEpyLZLtZzBTI4P3DUnRAsUZQAhjkxvTIAeEcnJV7
	 pXtpouDLp0gWo0OxluMEg3jxT3jSB8rZsNoSH3LObT8VqUyrLjBewIsymjjKqiN17A
	 SwVfSjDqhsdmFYA66hzGz1jSaGDonWovLycE8E7W+v5MrA8BHCd67dE24YW75Mvg2/
	 oQFFTINbFU2ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] riscv: dts: eswin: add clock generator for EIC7700
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615122016.1110206-3-pinkesh.vaghela@einfochips.com>
References: <20260615122016.1110206-3-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 12:27:06 +0000
Message-Id: <20260615122706.A20F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The fixed-clock node name 'oscillator' triggers a deprecated fallba=
ck in the fixed-clock schema.
--

commit cde88bbabc7fa6624be08081caf3200c1a962c33
Author: Pritesh Patel <pritesh.patel@einfochips.com>

riscv: dts: eswin: add clock generator for EIC7700 SoC

This commit adds a clock generator node for the EIC7700 SoC. It also adds a
fixed-clock node representing the 24MHz crystal oscillator on HiFive Premier
P550 boards.

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index 430a210f01e66..a7ebb11159580 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi

[ ... ]

> @@ -203,6 +204,11 @@ pmu {
>  				<0x00000000 0x0000000f 0xfffffffc 0x000000ff 0x00000078>;
>  	};
> =20
> +	xtal: oscillator {

[Severity: Low]
Does this node name trigger a deprecation warning during dtbs_check?

The fixed-clock device tree binding schema dictates that the preferred node
name should match the pattern ^clock-([0-9]+|[a-z0-9-]+)$. Naming the node
oscillator falls into the deprecated fallback branch.=20

Should this be named something like clock-xtal or clock-24m instead to avoid
warnings?

> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
>  	};
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615122016.1110=
206-1-pinkesh.vaghela@einfochips.com?part=3D2
