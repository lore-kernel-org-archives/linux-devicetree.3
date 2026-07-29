Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95133B95F6
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 23:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785367240; cv=none; b=B8LaXhzQhqLxVmVkQIJ19UHDPw1LekLCqvDsm5SEDJ/W8UlVTnxyT7pXquVbtexMhlqq2eX9vAqRuF8IIj6iA0ZdhMXEoEYgVBn9A+zjLuE78SHc9jfkvC5VSpuz1zMnni2iCWbcSdzDcFkt7I9TFeWRW3xfU+d9wgKdcSCfSfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785367240; c=relaxed/simple;
	bh=rTMJYEJ4IBUGzDe/T4RuV3yr7y0pxBtaxYaPwQG0Z8I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QMf82YpRxkgibfz2A4WWxYLDniSwyLP1mD/pJeSgk5ez4lNODYN4TgsTvCtc33KerujFMLjLndQmVLNFp7mzuTs/JuAQhuN8zjIG7y7vzWn2bCH9jEunWrgaWBfA1Lbya325Ie7QJySp0YX/0uYM2ygZTTVWuBfcCcLrTan+3vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4B7izET; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4B7izET"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576A71F000E9;
	Wed, 29 Jul 2026 23:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785367238;
	bh=Igladl2fAs5Nm9f92w6XmusCaLxcLJF2FxZwDl+zRkE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T4B7izETfVZBOqxw38T8HzNV4fct9SODqCJm7WH0KvTigmxJxfR33TlMgU5npaEEw
	 vmB4CgHza/zFVAJLUlGqA2oigVfrXv9CXnLp9LNe1SzOhnNclt8XkVeS1OetzNuMX+
	 328fTr99vJEFi4CcJzEs0Lyvip4fAILZMpGIXShOz/0snaenCsdsFebTtkG6NrKHeJ
	 dIsqrAAyT2W9j4UXythTl2NyQTDXNbkBz1wdSwU/cHK3MIzLyQlc88rjwqG4TKaHB6
	 c1JYcg2/Yq/Lzhh6CV94V3jR2aJ25400blFa0k0ohEIMBjFhpKXnLbq4BVOjlIAQCV
	 bpubFS/MQKG1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] powerpc: wii: Add the fixed OTP layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729225010.838760-1-linkmauve@linkmauve.fr>
References: <20260729225010.838760-1-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 23:20:37 +0000
Message-Id: <20260729232038.576A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The `device-private-key@28` NVMEM cell has a length of 30 bytes,=
 which is unaligned to the provider's 4-byte `word_size`, causing an uncond=
itional `dev_err` to be logged during boot.

Pre-existing issues:
- [High] Concurrent reads to the Nintendo OTP NVMEM device cause data corru=
ption due to missing locking in `nintendo_otp_reg_read`.
--

--- Patch [1]: [PATCH v2] powerpc: wii: Add the fixed OTP layout ---
commit 790200474049a449f0c4b09d4900a200ca3ca581
Author: Link Mauve <linkmauve@linkmauve.fr>

powerpc: wii: Add the fixed OTP layout

This commit adds a fixed nvmem-layout to the hollywood-otp device tree
node for the Nintendo Wii. It defines the locations and sizes of various
keys and IDs within the 128-byte OTP memory, exposing them as NVMEM cells.

Link: https://lore.kernel.org/lkml/20260726181921.16269-1-linkmauve@linkmau=
ve.fr/T/

> diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
> index 473d9feb9cdb8..d3a94d94e9e19 100644
> --- a/arch/powerpc/boot/dts/wii.dts
> +++ b/arch/powerpc/boot/dts/wii.dts
> @@ -233,6 +233,48 @@ control@d800100 {
>  		otp@d8001ec {
>  			compatible =3D "nintendo,hollywood-otp";
>  			reg =3D <0x0d8001ec 0x8>;
> +
> +			nvmem-layout {
> +				compatible =3D "fixed-layout";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;

[ ... ]

> +				/*
> +				 * device-private-key@28 and nand-hmac-key@44
> +				 * overlap on two bytes, that=E2=80=99s expected.
> +				 */
> +				device-private-key@28 {
> +					reg =3D <0x28 0x1e>;
> +				};

[Severity: Medium]
Does this 30-byte length trigger a spurious error log on boot?

The nintendo-otp driver specifies a word_size of 4. When the NVMEM core
parses this cell via nvmem_add_cells_from_dt(), it sets the raw length
to 30. Later, nvmem_cell_info_to_nvmem_cell_entry_nodup() checks if the
raw length is aligned to the word size.

Since 30 is not a multiple of 4, will the NVMEM core unconditionally log
a dev_err before rounding it up?

Would adding the bits property (e.g., bits =3D <0 240>) allow the NVMEM core
to gracefully pre-align the raw read length without emitting the spurious
error?

[ ... ]

> +				unknown@78 {
> +					reg =3D <0x78 0x8>;
> +				};
> +			};

[Severity: High]
This is a pre-existing issue, but does concurrent reading of these newly
exposed OTP cells cause data corruption?

Looking at the driver in drivers/nvmem/nintendo-otp.c:

nintendo_otp_reg_read() {
    ...
    iowrite32be(OTP_READ | bank | addr, priv->regs + HW_OTPCMD);
    *val++ =3D ioread32be(priv->regs + HW_OTPDATA);
    ...
}

Because this uses a stateful two-step I/O sequence (writing the target
address to HW_OTPCMD, then reading the data from HW_OTPDATA) without any
synchronization primitives, what happens if multiple drivers or userspace
processes read from these cells concurrently?

Will the executions interleave, causing one thread to read the data request=
ed
by another thread?

>  		};
> =20
>  		disk@d806000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729225010.8387=
60-1-linkmauve@linkmauve.fr?part=3D1
