Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427026;
	b=rXqFv4DJRX4RmTWwaBCBI9/wZXRU5vu7z6ywhxda1kmYaDDdD3I9+dsG5uiTWCmRxEqb
	 QJoq1NJvpZuxo5+r9wKCzQ9B5Ap9YZrIFjh8e4AW+6NntIjyyJ4mnBruR5icQYwmOmn43
	 axehL3StB13y14DPjTRIiTTOZVOle1XcMSDyVBNAfm955LTckC7GdllI2cZpIHd9gz5V7
	 4ygmN+lx+wAWysqK1bg768/KBWsgsGzZonNeLDE+W3EXomLbm9RSoRUm/BCBRakox2o4q
	 ObrbD+6KEwpmN0KIOv572ZDrA2TnNcQO2idBJrrFWJAkt1Zj4tWuqCVndcuzFjn4kyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427026;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+G4x2UEOatmQ3FSa5Yj6RPZlfVbbZfe16TxvB2p5PF0=;
	b=weAjQt9xU2H5md5owOCbIa5qViPnWWF6wj7gI3VSCSNxh2/EOtHFtVv73Y3/iYAU8/4u
	 wTQh67aJ8VqoI/CHKZyTYy5P68y58bOnDBsf3fp2mS4TkPIxj+g7N7zAVeltgRcM7Gfdn
	 5RHwa4w704EdVCFJhwluXvQmnARzj5KtJpGdRuRoxYNzF80H6MghowFkva7sSDu1HEiYQ
	 /BcIHrQaYd8YpbpXmFfjZO2uYQ3vAeLnkq2uFTRWOjw6+BTvT4xLA93NuT0vzXRfd9LNP
	 FDiS7vFY/rHO7fUi2Yr+aI9ptYyIjuwtMkcXa1CmeIpm7IL5RWUJutjXWx+mA/vs6CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WCXZZPfi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D815E606A31B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WCXZZPfi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A4C1F000C4;
	Mon, 19 Oct 2026 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792427025;
	bh=+G4x2UEOatmQ3FSa5Yj6RPZlfVbbZfe16TxvB2p5PF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WCXZZPfiTho92X2vrFLJ0mO4iQlLAjeAb33USqxD7/mTvzAz9RVZJyLzdlEJZRr5d
	 Mzr9AxC+PfhvsxqemDyXHjMe1j/aQQO4yC8GS9NDpNRjYvATBeWVO4kQuqJx4ToVOF
	 RcodDYCUH+npEcGdkvGUAP93c40fX1BoOQy1u1vWZNHOEowvOMKqjfHzonpkqRj+DB
	 8kUBRyDyv3q+qxqdhaWBkJUJC/cO+fLAps8hqKaqTZyZ7AKxYQeqzTQ2SuVfDvpFD7
	 C3AoY/2IrJK7O/+f5hs6g7KfsS15et9fq7wV6g1sZTUqBlBJ4BYMRDwf6JZfFFzt+V
	 mneHZejP69eVQ==
Message-ID: <sashiko-outbox-177877@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 16/16] media: sony-starvis2: Add support for IMX585
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261019-media-starvis2-v5-16-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
 <20261019-media-starvis2-v5-16-eef935347ce9@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 16:23:45 +0000
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
- [Medium] media: sony-starvis2: starvis2_write_common() writes 0x4e3c on I=
MX585
- [Medium] media: sony-starvis2: starvis2_identify_model() reads 0x4d18 on =
IMX585
--

commit 760bcd8df1ec1dd08aab2a18c904b0c265aacbd2
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: sony-starvis2: Add support for IMX585

This commit adds register sequences, variant definitions, and device tree
match entries to support the Sony IMX585 8MPix Starvis 2 sensor.

> diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-s=
tarvis2.c
> index b9ade0887b6bc..e89aa1a7d5eb8 100644
> --- a/drivers/media/i2c/sony-starvis2.c
> +++ b/drivers/media/i2c/sony-starvis2.c
> @@ -1090,6 +1092,286 @@ static const struct starvis2_variant imx832_varia=
nt_def =3D {
>  	.shr_min =3D 4,
>  };
> =20
> +static const struct cci_reg_sequence imx585_common_regs[] =3D {

[ ... ]

> +	{ CCI_REG8(0x4d12), 0x1f },
> +	{ CCI_REG8(0x4d13), 0x1e },
> +	{ CCI_REG8(0x4d26), 0x33 },
> +	{ CCI_REG8(0x4e0e), 0x59 },
> +	{ CCI_REG8(0x4e14), 0x55 },
> +	{ CCI_REG8(0x4e16), 0x59 },
> +	{ CCI_REG8(0x4e1e), 0x3b },
> +	{ CCI_REG8(0x4e20), 0x47 },
> +	{ CCI_REG8(0x4e22), 0x54 },
> +	{ CCI_REG8(0x4e26), 0x81 },
> +	{ CCI_REG8(0x4e2c), 0x7d },
> +	{ CCI_REG8(0x4e2e), 0x81 },
> +	{ CCI_REG8(0x4e36), 0x63 },
> +	{ CCI_REG8(0x4e38), 0x6f },
> +	{ CCI_REG8(0x4e3a), 0x7c },

[ ... ]

> +	{ CCI_REG8(0x5222), 0x91 },
> +	{ CCI_REG8(0x5224), 0x87 },
> +	{ CCI_REG8(0x5226), 0x82 },
> +	{ CCI_REG8(0x5b3c), 0x07 },
> +
> +	{ STARVIS2_REG_WDMODE, 0x00 },
> +	{ STARVIS2_REG_MDBIT, 0x01 },
> +	{ STARVIS2_REG_XXS_DRV, 0x00 },
> +};

[Severity: Medium]
On IMX678, register 0x4e3c (STARVIS2_REG_INTERFACE_SEL) selects the 2-lane =
or
4-lane CSI-2 interface (0x07). On IMX585, the register banks above 0x34xx
extend through 0x4dxx..0x52xx and the identification and interface selector
blocks are shifted by +0x0d00, so imx585_common_regs programs the interface
select register at 0x5b3c (0x4e3c + 0x0d00) while 0x4e0e..0x4e3a are intern=
al
timing registers.

However, when starvis2_power_on() or starvis2_enable_streams() calls
starvis2_write_common(), it still unconditionally writes to
STARVIS2_REG_INTERFACE_SEL (0x4e3c) after writing common_regs:

drivers/media/i2c/sony-starvis2.c:starvis2_write_common() {
	...
	cci_multi_reg_write(starvis2->cci, starvis2->variant->common_regs,
			    starvis2->variant->num_common_regs, &ret);
	...
	cci_write(starvis2->cci, STARVIS2_REG_INTERFACE_SEL,
		  STARVIS2_INTERFACE_2L_4L, &ret);
	...
}

Will this unintentionally overwrite register 0x4e3c in IMX585's internal
0x4exx timing bank whenever the sensor is powered on or streaming is enable=
d?

[ ... ]

> +static const struct starvis2_variant imx585_variant_def =3D {
> +	.name =3D "imx585",
> +	.id_reg =3D CCI_REG16_LE(0x5a1d),
> +	.id_mask =3D 0x3ff,
> +	.id_value =3D 0x259,

[Severity: Medium]
On IMX678, IMX662, IMX675, and IMX832, the sensor OTP identification regist=
ers
reside in the 0x4dxx range (with id_reg at 0x4d12 or 0x4d1c, and
STARVIS2_REG_MONOCHROME at 0x4d18).

On IMX585, 0x4dxx is a normal control register bank (imx585_common_regs wri=
tes
0x4d12, 0x4d13, and 0x4d26), and the identification block is shifted to 0x5=
axx
(with id_reg at 0x5a1d).

During starvis2_probe() -> starvis2_identify_model(), the driver reads the
variant's id_reg, but then unconditionally reads the hardcoded
STARVIS2_REG_MONOCHROME (0x4d18) for all variants:

drivers/media/i2c/sony-starvis2.c:starvis2_identify_model() {
	...
	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
	...
	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
	...
	detected =3D val & STARVIS2_TYPE;
}

Does reading 0x4d18 on IMX585 cause broken color/monochrome autodetection w=
hen
probing with the "sony,imx585" compatible, as well as false sensor-type
mismatch errors in dmesg when probing with "sony,imx585-aamj" or
"sony,imx585-aaqj"?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-media-star=
vis2-v5-0-eef935347ce9@raspberrypi.com?part=3D16
