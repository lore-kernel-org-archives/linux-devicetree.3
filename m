Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A252609C5
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 03:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515351; cv=none; b=mlczgnIem7HGuVPcvtgwzvSZcHBw3sHCEGygHxfHgUrRoFN8NWfInZA4OZg0hDrhRxCRqtbzdlElQdBHo19gzNd/BZPv0KqQDNjQOlZAe61XwwDqmamSErc9PNcBu4hhpqQXwdYqIsweBPKoJiXtFp8GrW99A/1TSB0phs03oJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515351; c=relaxed/simple;
	bh=7GYtc2TbYZF2i4fITGX1xW2jvhSpsjGEJvn10krbPAA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AgVZC5N+LV2C4xVC5wCEnCYEcoIka5PH+D/9iTeeYAMTHzn0xx0gZl2uiYeOY4kLK9h/oTd2dyykNPrMaNdUzVhLu5nws9RxyBFjUQhg4ri+EkzbmErpW+w4/RWBEmvwu8pAF3paN5ZsRIRm+TFyLZPp4pByi7R/npPtZJ3mP94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPluAx/u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPluAx/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A443B1F000FF;
	Fri,  9 Oct 2026 03:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791515349;
	bh=zG6s8UIljRM1gSEYRfraKTjHWgTRI7RWDsEkWZvPLh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HPluAx/uLcPg1chWH4pw97/5hLuPmRXf2g8hxyTilJFQKhpc8nDIgwl/0omvFj9QB
	 x2jDhnBmEXNpBAyHIHf8lnX2F8iUEsbCsJjyqf+TWSqkeuJT4I78Eeu+hZER9ojWsg
	 w9V2VbdRLWA2VZk3KIkMgiyKrXN2/uQ2sIZmsO4uN8dCwHJ2KwCYKKRrV4B5Ar433m
	 ufKO1bqx2q7IW98MYTy9CWGbZrXFHQzOK/vin8k+ydUwb9CBPvceDbH5rXA1B/ZV0y
	 9l2EmtzCS+fiQEpiCcbxGpR+CbmQhfzvd3ajryHfaV3fYt8+84KjlFqsjYWlcZJdbh
	 vQgsFRa0mVQMg==
Message-ID: <sashiko-outbox-164751@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/8] thermal/drivers/loongson2: Use bitfields and
 per-SoC thermal ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <1375bd12403bffc496261953772a45833f9b5a3e.1791512067.git.zhoubinbin@loongson.cn>
References: <cover.1791512067.git.zhoubinbin@loongson.cn>
 <1375bd12403bffc496261953772a45833f9b5a3e.1791512067.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:09:09 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] thermal: loongson2: API misuse of FIELD_PREP triggers potential BUI=
LD_BUG_ON
--

commit 9fa005fd4a6e6873cf9a1897453c930665ef1a63
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Use bitfields and per-SoC thermal ops
   =20
This commit replaces open-coded masks and shifts with GENMASK() and FIELD_*=
=20
helpers. It also separates the temperature read and thermal zone ops into=20
SoC-specific variants to prepare for further expansion.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index 94259d88da8a0..02f7545eaac1b 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c

[ ... ]

> @@ -121,17 +135,18 @@ static void ls2k2000_thermal_set_trips_regs(struct =
loongson2_thermal_data *data,
>  					    int temp, bool low, bool enable)
>  {
>  	unsigned int sel =3D data->chip_data->thermal_sensor_sel;
>  	int hi_reg, ctrl_reg, val, gate;
> =20
> -	gate =3D (temp + 311) * 0x4000 / 820;
> +	gate =3D (temp + LS2K2000_TEMP_OFFSET) * LS2K2000_TEMP_DIV / LS2K2000_T=
EMP_MUL;
> =20
>  	/* Low byte of the gate value goes to the control register */
>  	ctrl_reg =3D low ? LOONGSON2_THSENS_CTRL_LOW_REG : LOONGSON2_THSENS_CTR=
L_HI_REG;
> -	val =3D gate & 0xff;
> -	val |=3D enable ? 0x100 : 0;
> -	val |=3D sel << 10;
> +	val =3D FIELD_PREP(LOONGSON2_THSENS_CTRL_GATE_MASK, gate) |
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
Could this FIELD_PREP() macro usage break the build? It appears to pass a
16-bit value (gate) into an 8-bit mask (LOONGSON2_THSENS_CTRL_GATE_MASK
which is defined as GENMASK(7, 0)).

The FIELD_PREP() macro strictly expects the value to fit inside the mask
boundary. For ls2k2000, the calculated gate value is a 16-bit integer (for
example, at 0 degrees Celsius, it calculates to 6213).

If the compiler performs speculative devirtualization or constant propagati=
on
(such as during LTO across loongson2_thermal_probe() calling
loongson2_thermal_set_trip_temp(data, 0, 0, false)), __builtin_constant_p(g=
ate)
would evaluate to true. This can trigger the BUILD_BUG_ON_MSG("value too la=
rge
for the field") in bitfield.h and fail compilation.

> +	      FIELD_PREP(LOONGSON2_THSENS_CTRL_INTEN, enable) |
> +	      FIELD_PREP(LOONGSON2_THSENS_CTRL_SEL_MASK, sel);
>  	writew(val, data->ctrl_reg + ctrl_reg + sel * 2);
> =20
>  	/* High byte of the gate value goes to the low byte of the HI_GATE regi=
ster */
>  	hi_reg =3D low ? LS2K2000_THSENS_HI_GATE_LOW_REG : LS2K2000_THSENS_HI_G=
ATE_HI_REG;
> -	val =3D (gate >> 8) & 0xff;
> +	val =3D FIELD_GET(GENMASK(15, 8), gate);
>  	writeb(val, data->ctrl_reg + hi_reg + sel);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791512067.gi=
t.zhoubinbin@loongson.cn?part=3D5
