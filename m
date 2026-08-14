Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89F120D4E9
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691254; cv=none; b=O3OahXBDnPXeKdp52rZ5Wn8xumxaQgRkcA+IF8FKSP42o/hqsn70rOD1HB8hjBkRN3hTxUVF5IW27xpvraRBhC768FqwD8ppLl//kLPKQd9afZ7aLTYzKVz2PQFdQs1XYaqfXnwViVTXnmte+Na7fxNK4Q3imnpRvUGmLQMRv7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691254; c=relaxed/simple;
	bh=1CvtTvkVB544oP426TDn3pSliB8bQMxrYTA3tgaxkhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ge9PVLsZjPF6wmCiYJrA4UJdfxv8KZtL3jGkEApKWNpN8f6iUUSC1/QFIZsQFsmPcEni3ygsXME7rXpA4KC6Vm+Evk71p2/5ugJWUIBSN1J4R4t3R2Y5PycTb8knLqNmesYGjpDzw5ArJEjadH/RYulMmRrxKzZNpFZwdbHU+qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwEiiZCt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwEiiZCt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630741F000E9;
	Fri, 14 Aug 2026 07:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786691253;
	bh=OeZ2LFW0/C9pLyWOg6SLsbGrzKt+V49tNfC0sARAgVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HwEiiZCt9pkNhSJszXiScfLW678wbpOsZYlne6yj9NSUne+crj8VrMho6sMR0NmF5
	 +0cH0d/pm6F5oOZCboRbSHitSPkjhDgJ1zdU8tt3RCYxQqM7yx67wRV6vmprkX6OFD
	 tXvQ5kQs3J7qizJ6xCQkb4xaqHUei9R1Jm7wQ5mZyGnQVEZoGVuXXMKvOYtSwH8+mq
	 rngvF4KBqJFeGQUmOFBqwTXLW/TcCalIkz8FkoFEo/P+v6J23jNQy0vABvXI+EvaHq
	 2sub7TZdYqWEAqgRXFU1oARXt9DFpwhJi/p4z56aidPq1UDI0QL1J7Ls5bE50DqKeI
	 FbkOfytXQ/opQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] riscv: dts: eswin: add clock generator for
 EIC7700 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260814070007.1662455-3-pinkesh.vaghela@einfochips.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-3-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:07:27 +0000
Message-Id: <20260814070728.630741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added 'fixed-clock' node uses the deprecated node name 'o=
scillator'. According to the fixed-clock DT bindings, the node name should =
match the pattern '^clock-([0-9]+|[a-z0-9-]+)$' (e.g., 'clock-24m'). The na=
me 'oscillator' is marked as deprecated in the schema and will trigger a dt=
bs_check warning.
--

--- Patch [2]: [PATCH v4 2/7] riscv: dts: eswin: add clock generator for EI=
C7700 SoC ---
commit 2b4ebcd54553e592642ebabb9a2f8063cbd1f050
Author: Pritesh Patel <pritesh.patel@einfochips.com>

riscv: dts: eswin: add clock generator for EIC7700 SoC

This commit adds the clock generator node for the EIC7700 SoC. It also conf=
igures
a 24MHz crystal oscillator to provide the input clock for HiFive Premier P5=
50 boards.

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi

[ ... ]

> @@ -203,6 +204,11 @@ pmu {
>  				<0x00000000 0x0000000f 0xfffffffc 0x000000ff 0x00000078>;
>  	};
> =20
> +	osc: oscillator {
> +		compatible =3D "fixed-clock";

[Severity: Low]
This isn't a bug, but does the node name "oscillator" trigger a dtbs_check
warning during validation?=20

According to the fixed-clock DT bindings, the node name "oscillator" is=20
marked as deprecated. The schema expects a pattern matching=20
"^clock-([0-9]+|[a-z0-9-]+)$", for example, "clock-24m".

> +		#clock-cells =3D <0>;
> +	};
> +
>  	soc {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814070007.1662=
455-1-pinkesh.vaghela@einfochips.com?part=3D2
