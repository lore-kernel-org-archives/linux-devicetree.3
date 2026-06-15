Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DBC3FAE01
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526692; cv=none; b=liQfNK3k37lJp/3JUWCQFVBBDhoLru5iTuQ3SLIiEPoYH73HVRk9Z2p/aD31Tnuyh5+E4GJDNh+OxUsXSSp3XuloMucFg2ElliSKz2zXFlgnwveNfGmbmks3QfeRuVPSoAgkYgHsgS1XffsGhLmD244ZheyHDYqnQOWIod12rUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526692; c=relaxed/simple;
	bh=aqDiwNZs5eJuMGYR8ONak1WQAoLzATMSXO2ACKHOdvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nIsZvIaZ5PYCOJwCwdsClTHhPzWtNkxKVKiwDsG8dHJIWAYuL++lyjKJ4mRECPjlwzfAXbUsnz9v2BMBIkPJLOkIDP437kbmV7iQ4LPOxB22hSRnko9beII4Lc4eUeJn9ArNmmYvmkbSmzUo5XPqHuPBwD6r5mgKf3Gio2Gt724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byKvjkmP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byKvjkmP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A624D1F0155D;
	Mon, 15 Jun 2026 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781526682;
	bh=DRFh8wif5rA92O2lk5+qsMfVsokHPS4Fy+fFxxl3irw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=byKvjkmP1QujP5xtmqRJOKONWYu500YfLXd7EbipgpG4kyxrm69NCGYRI6B8/7mAW
	 fmBZ6s2d+Lhw6HUcHYbY0UEz6rwHwBzrfs9nlEVXLa7TODkXs/F8dOWBv5MBupXbW/
	 gXCh1dx+ID+AZmtJW9U0voMZI9w37rDQ09v/ArFTE/VHpICUD3XeeQ7/M4MFZ5pQlZ
	 8x32k8hY7363LC0Q0g6/AN1ecXKG9KmxOCST1ccHq9FSJ8/XPqRy3T6yLRT98XXuDI
	 Hy6vD7farUVYB+ewxLSQWLZ5nLAWszU1vAK9R0kz0vNWPdRhH/mHAHJ+ofnDPyRsir
	 AV5efJNyTfkFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] riscv: dts: eswin: add hsp power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615122016.1110206-6-pinkesh.vaghela@einfochips.com>
References: <20260615122016.1110206-6-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 12:31:22 +0000
Message-Id: <20260615123122.A624D1F0155D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The HSP CFG clock will never be enabled, causing a hardware hang d=
uring register access, because `simple-pm-bus` requires children to use `pm=
_runtime` but `syscon` bypasses it.
- [Medium] The node is labeled and described as a 'power domain' but is mod=
eled as a simple bus without the ability to act as a power domain provider.
--

commit 0dad730760e600f73d118515b1907e14ac735dad
Author: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

riscv: dts: eswin: add hsp power domain

This commit adds an HSP power domain node to manage the HSP CFG clock,
which is required to access the HSP CSR registers. The CSR is defined
as a syscon child node within a simple-pm-bus.

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -252,6 +252,19 @@ plic: interrupt-controller@c000000 {
>  			#interrupt-cells =3D <1>;
>  		};
> =20
> +		hsp_power_domain: bus@50400000 {
> +			compatible =3D "simple-pm-bus";

[Severity: Medium]
The commit message and node label describe this as a power domain, but the
node uses simple-pm-bus and lacks a #power-domain-cells property. Can
other devices actually reference this as a power domain?

simple-pm-bus acts as a transparent bus for managing clocks or resets for
its direct children, rather than a genpd provider. If this is meant to act
as a power domain that other IP blocks depend on via power-domains =3D <...=
>,
does it need a dedicated driver and the #power-domain-cells property?

If it is strictly meant to manage the syscon clock, should the wrapper be
removed entirely?

> +			ranges =3D <0x0 0x50400000 0x0 0x50400000 0x0 0xa0000>;
> +			clocks =3D <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;

[Severity: High]
Since the child node uses the generic syscon compatible, will this clock
ever be enabled?

The syscon framework in drivers/mfd/syscon.c does not register a platform
driver, does not probe a device, and does not invoke pm_runtime_get_sync().
Because the child device is never probed or runtime-resumed, the parent
simple-pm-bus will remain suspended.

Would this cause a system hang when accessing the syscon registers since
the clock would remain disabled?

Additionally, of_syscon_register() natively expects the clocks property to
be directly in the syscon node. Should the clocks property be moved to the
hsp_sp_csr node and the simple-pm-bus wrapper removed?

> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +
> +			hsp_sp_csr: hsp-sp-top-csr@50440000 {
> +				compatible =3D "eswin,eic7700-syscfg", "syscon";
> +				reg =3D <0x0 0x50440000 0x0 0x2000>;
> +			};
> +		};
> +
>  		uart0: serial@50900000 {
>  			compatible =3D "snps,dw-apb-uart";
>  			reg =3D <0x0 0x50900000 0x0 0x10000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615122016.1110=
206-1-pinkesh.vaghela@einfochips.com?part=3D5
