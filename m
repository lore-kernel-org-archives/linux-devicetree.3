Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D13115B8
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 04:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790571279; cv=none; b=UtqccBrh71+6o5j8NwN39EXJHs0PfHYgTpbvwXLJmDweAz/C6OtqL81o6SsQRDmy+vFWACHHqX9ufF/MWAe6EXxMVdPXPm4uRNc1Fv7pd22N0fGIDVEWMYB2GXeN8FLiZP9j0xrnpSOImkcnTIzIFCEEHAhnfnBN+hvPBHXXfy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790571279; c=relaxed/simple;
	bh=MMYoxRfqMAZf3kpAyrgUz6KUmnsogWA3GoXZVLakrFE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WXk2RWpOrNM1yQV7pCnEs1MHcndCO/yW5igLtEMJL+kUwS+wcaP7Xup38+TXCPDe59fbrfyytgXWJf9S64nyd7RfvM2wKmgsCfILxgB7Wn893GrbRZUfBedTmLjvuD7uwR7BebZ3XmNGzQI/PA42aC8oRQw9Pa9O2/9XAS8PeJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAKrwjrT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAKrwjrT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0083D1F000FF;
	Mon, 28 Sep 2026 04:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790571278;
	bh=cvbj6YVMcLoSmZ4CyI8gNeUFqF9DssX1a3Amd/sjv6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fAKrwjrTyixlSNlD1Pq7NPiSV9Xrr0MAQfuCcKlCXkOodACaNIVUgeGqCiuGsF0rT
	 nzR1ApPWQzR8TqpP/MAXOxdr3BUMHoR0AAxb7f1lBqNwCqxqmTMxwnv/3DvnWc5sCx
	 WPjTWXa4pTmRZOzgbXlPy2xR26RMe0/i5NLhM0PIY00hEfxSPyzlX5L2fCGlh3K1TZ
	 +xT/GJHRE1wLpUzpVRkBI98sIKy0Hr5tAOrBp/P9T7fI6S2kqSMPScoT37RwuM1/MY
	 dBsBsHJtU+1iSNU/9+YnFiOvdbdn1vTcFieEDgvAeRYMJrR8p/z8iyb9kz9G18YbdM
	 O02p7MSYEejUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/7] thermal/drivers/loongson2: Fix Loongson-2K2000
 trip point programming
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <da9af5d5cf5f3635556729ae0b853f4502173bd8.1790561983.git.zhoubinbin@loongson.cn>
References: <cover.1790561983.git.zhoubinbin@loongson.cn>
 <da9af5d5cf5f3635556729ae0b853f4502173bd8.1790561983.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 04:54:37 +0000
Message-Id: <20260928045438.0083D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] thermal: torn write in loongson2_2k2000_set_trips_regs() can tri=
gger spurious interrupts
--

commit 89df6fff6e860d7cc010f8ec79a9f1531d8e5cca
Author: Binbin Zhou <zhoubinbin@loongson.cn>

    thermal/drivers/loongson2: Fix Loongson-2K2000 trip point programming
   =20
    Loongson-2K2000 uses a different trip point layout than Loongson-2K1000:
    the low 8 bits of the gate value are written to the control register,
    while the high 8 bits are written to separate HI_GATE_HI/LOW registers.
    The gate value is calculated as (temp + 311) * 0x4000 / 820.
   =20
    Introduce a per-SoC set_trips_regs() callback. Keep the existing
    Loongson-2K1000 logic and add the Loongson-2K2000 implementation.
    Move the common clamping into loongson2_thermal_set_trips() and pass
    Celsius values to the callback.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index bcabca3601572..45fe6100134ee 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c

[ ... ]

> @@ -81,6 +99,26 @@ static int loongson2_2k1000_get_temp(struct thermal_zo=
ne_device *tz, int *temp)
>  	return 0;
>  }
> =20
> +static void loongson2_2k2000_set_trips_regs(struct loongson2_thermal_dat=
a *data,
> +					    int temp, bool low, bool enable)
> +{
> +	int hi_reg, ctrl_reg;
> +	int val =3D 0, gate;
> +
> +	ctrl_reg =3D low ? LOONGSON2_THSENS_CTRL_LOW_REG : LOONGSON2_THSENS_CTR=
L_HI_REG;
> +	gate =3D (temp + 311) * 0x4000 / 820;
> +
> +	val =3D gate & 0xff;
> +	val |=3D enable ? 0x100 : 0;
> +	writel(val, data->ctrl_reg + ctrl_reg);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Will this writel() cause the hardware to evaluate a torn threshold?

By writing the low 8 bits and immediately enabling the hardware comparator =
here,
before the upper 8 bits are written to hi_reg below, there is a time window
where the active hardware uses a torn threshold (new low bits, old high bit=
s).

If this torn value is momentarily crossed by the current live temperature, =
could
it fire a spurious hardware interrupt?

> +
> +	hi_reg =3D low ? LS2K2000_THSENS_HI_GATE_LOW_REG : LS2K2000_THSENS_HI_G=
ATE_HI_REG;
> +
> +	val =3D readl(data->ctrl_reg + hi_reg);
> +	val =3D (val & ~0xff) | ((gate >> 8) & 0xff);
> +	writel(val, data->ctrl_reg + hi_reg);
> +}
> +
>  static int loongson2_2k2000_get_temp(struct thermal_zone_device *tz, int=
 *temp)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790561983.gi=
t.zhoubinbin@loongson.cn?part=3D3
