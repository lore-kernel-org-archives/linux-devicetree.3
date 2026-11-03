Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691719;
	b=0q+YJmgUd6ZiCZJXtOTF2fEaLanrKQnpS41uAbdj/BKgxkAZBlev5TiM6CzYr7xWDGkU
	 3cPRruguFm2LON6nBwGLeoUW1kGtcyBHoSwKYn69TmwuYEQ3shPILFDabiT7dkjTKs7W4
	 oGih9CKj3ZNmR3uz1nQOrNZNc/UCBJuJa/EL1xGZVZ1olTFQybHSJNNMCs1/FW5nr4ZLz
	 ZehVJ+zj7lEjv/4gV+eFasI3dQ0iNRXDbgkzcJQ2nyx9rvsvIhWnE65npePVft/b8OxYy
	 ua10El+F5i1EB3U0JOlXyg1ryEI1E/Dcwf3MdFfK6XXQwGzEcmu0lfHSBcDP4p7dpfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691719;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qu71si1n+5xy0oCOIAQK4V70nFGirag4lkoshtvY/6k=;
	b=EtLu5osjzRQgVa1Is+JOx+u007uSCcoNyVECehp8mtNUfY5Q3u5bEDNn3t228wNeKok5
	 cLrsaXdGug+wINC+Vlqzs7ZqKvT9NqfHilCXcq01McpIssC8j+7d9sqlTixhgtsri6hXL
	 AjIl73I0Pf51GV5XgEROcExgpuXLPYovbpknpHYeaY0KCEox0gKdPxzCcDGh11B5qPLnA
	 vaK4geCvIpKc3xM44TAde5LIrnn7HPPEuK3vLVsmYsEPjbDHlooB696GFzNa/Yh21iKmH
	 xSlnzOOjL7WRKNRs1zD9D+w/AhKQE/QJpg0lITYGXJjQKZZ0wqo8jF0UfJfZfmYF/XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKKq9bhF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E84606D807
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKKq9bhF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CBD21F00919;
	Tue,  3 Nov 2026 07:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691718;
	bh=qu71si1n+5xy0oCOIAQK4V70nFGirag4lkoshtvY/6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HKKq9bhFNIN4er+xQve1LSwwC5pGQoAqQET233LCOo5vQYFzLHF3fLNi4EZY298WI
	 0r4/crsMSFsRaTZkoGdiYy6cdEcOG/jIyibGFvFyrSq80EH7mskyRYdEuPY04KcDPv
	 ZDN5ybJgoOG0k5FbU5pfbG6murA7gtDd5/ChXZ/e3opV1mPNAIiouTy4wUQT9fRWXF
	 aQ9MJpPYE+rF1c1T600ewnCJytWg9NQ42jAm0m+u1kdv15/J542Q2svkVjdwnPS+kU
	 aFBPaJSM4BGmvcdgaTsiFhf3MxWGZ3U4ZoEkeRH2WrlfqkS0YTDZYah0mFMnAqMChQ
	 LpmUmZ8rPaS5g==
Message-ID: <sashiko-outbox-194727@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/7] thermal/drivers/loongson2: Fix Loongson-2K2000
 trip point programming
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <be63b7587997d75507ac2a28f2276ad45ace4196.1793690276.git.zhoubinbin@loongson.cn>
References: <cover.1793690276.git.zhoubinbin@loongson.cn>
 <be63b7587997d75507ac2a28f2276ad45ace4196.1793690276.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 07:41:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] thermal: loongson2: torn gate write order in loongson2_2k2000_se=
t_trips_regs()
- [Low] thermal: loongson2: 16-bit gate in 8-bit FIELD_PREP() in set_trips_=
regs()
--

commit 8811a8d93840088ed85385aa42b6210e17fd97b7
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Fix Loongson-2K2000 trip point programming

This commit introduces a per-SoC set_trips_regs callback in
drivers/thermal/loongson2_thermal.c and implements trip point programming f=
or
the Loongson-2K2000 using its 16-bit gate formula and split control/HI_GATE
registers.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index 9256cd3663e60..8be0c6a29efec 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c

[ ... ]

> @@ -46,52 +68,77 @@ struct loongson2_thermal_data {

[ ... ]

> +static void loongson2_2k2000_set_trips_regs(struct loongson2_thermal_dat=
a *data,
> +					    int temp, bool low, bool enable)
> +{
> +	unsigned int sel =3D data->chip_data->thermal_sensor_sel;
> +	int hi_reg, ctrl_reg, val, gate;
> +
> +	gate =3D (temp + LS2K2000_TEMP_OFFSET) * LS2K2000_TEMP_DIV / LS2K2000_T=
EMP_MUL;
> +
> +	/* Low byte of the gate value goes to the control register */
> +	ctrl_reg =3D low ? LOONGSON2_THSENS_CTRL_LOW_REG : LOONGSON2_THSENS_CTR=
L_HI_REG;
> +	val =3D FIELD_PREP(LOONGSON2_THSENS_CTRL_GATE_MASK, gate) |
> +	      FIELD_PREP(LOONGSON2_THSENS_CTRL_INTEN, enable) |
> +	      FIELD_PREP(LOONGSON2_THSENS_CTRL_SEL_MASK, sel);

[Severity: Low]
As reported by Sashiko on v7 [1], in loongson2_2k2000_set_trips_regs(), can
passing the unmasked 16-bit gate value into
FIELD_PREP(LOONGSON2_THSENS_CTRL_GATE_MASK, gate) trigger a compile-time
BUILD_BUG_ON_MSG failure?

Across the clamped temperature range [-40, 125] C, gate is in the range
[5413, 8709] (0x1525 to 0x2205), so bits 15:8 are always non-zero and never
fit within LOONGSON2_THSENS_CTRL_GATE_MASK (GENMASK(7, 0)).

When loongson2_thermal_probe() calls loongson2_thermal_set(data, 0, 0, fals=
e)
with a constant temperature of 0, interprocedural constant propagation or L=
TO
can resolve loongson2_2k2000_set_trips_regs() with gate =3D 0x1844 at compi=
le
time, tripping the field overflow check in __BF_FIELD_CHECK_MASK().

Should the low byte be extracted first (for example via
FIELD_GET(GENMASK(7, 0), gate) or lower_8_bits(gate)), matching how the high
byte is extracted with FIELD_GET(GENMASK(15, 8), gate) below?

> +	writew(val, data->ctrl_reg + ctrl_reg + sel * 2);
> +
> +	/* High byte of the gate value goes to the low byte of the HI_GATE regi=
ster */
> +	hi_reg =3D low ? LS2K2000_THSENS_HI_GATE_LOW_REG : LS2K2000_THSENS_HI_G=
ATE_HI_REG;
> +	val =3D FIELD_GET(GENMASK(15, 8), gate);
> +	writeb(val, data->ctrl_reg + hi_reg + sel);
> +}

[Severity: Medium]
In loongson2_2k2000_set_trips_regs(), could writing the control register
before the HI_GATE register expose a torn 16-bit threshold while the
interrupt is enabled and latch a spurious thermal interrupt?

During loongson2_thermal_probe(), loongson2_thermal_set() first initializes
both thresholds to 0 C (gate =3D 0x1844) with enable =3D false:

loongson2_thermal_probe()
  loongson2_thermal_set(data, 0, 0, false)
    loongson2_2k2000_set_trips_regs()

which leaves 0x18 in LS2K2000_THSENS_HI_GATE_HI_REG and
LS2K2000_THSENS_HI_GATE_LOW_REG.

When devm_thermal_of_zone_register() then programs the initial trip window
via loongson2_thermal_set_trips() -> loongson2_thermal_set() with
enable =3D true (for example, the 40 C trip point where gate =3D 0x1b65),
writew() writes the new low byte (0x65) together with
LOONGSON2_THSENS_CTRL_INTEN =3D 1 while LS2K2000_THSENS_HI_GATE_HI_REG still
holds 0x18. Until writeb() updates HI_GATE_HI_REG to 0x1b, the hardware
comparator is active with a composite threshold of 0x1865 (around 1.6 C),
which is already exceeded at normal operating temperatures. A similar
intermediate {old_hi, new_lo} window occurs during runtime trip updates
whenever the threshold crosses a 256-count boundary with INTEN enabled.

Would it be safer to disable INTEN (or write HI_GATE before enabling INTEN =
in
the control register) so the hardware comparator never evaluates a half-upd=
ated
16-bit gate?

[1] https://lore.kernel.org/r/1375bd12403bffc496261953772a45833f9b5a3e.1791=
512067.git.zhoubinbin@loongson.cn

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793690276.gi=
t.zhoubinbin@loongson.cn?part=3D3
