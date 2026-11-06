Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979318;
	b=hw88RaTNEcQnRglTnLZ2GoOlGcxBZaHxZiDDHbhWiW73OD7lLCBTAo2KeJbM5i/3YODQ
	 E/aaWDYzLh9Kl6XjEz0BCo5YOgpbzSIzxcLhr/zcNMvOSntprfG2tZl3aW2xhIRKsxsp2
	 tJ7B5EAOAyv8BFltwfWizV24oaDweUWStMue6UYBY3VquuoFVfV87b8cwFDyLc71m0t+l
	 elq1CUlC0EJ5qHvlvlXLcTuMNJRKXRXHO/WRSNXc3c5C76aTtwazD1NNDsMyVDtIAtzl4
	 /y12X51sM4mXfWWHAlLEZi5yGHE9Qw5GnC0ocwTnskt/BoHhz3pRTl2Y7OIMopLqvVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979318;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7kSE4MOI9Fld5eXbHThDBlwP7pJdSsCWudgi6MoSBCU=;
	b=VAXKfwZ8joar9bVZVIxzM1QsMyGiLgd5Oi8rKVRx2YwNpU9mWELaDCzlw0+yBy40LkK/
	 EHR3+ABnz3fqmx6GRVbNLUgvswrsXaLpaOxqKCuStWAECN6Vser5I5qBTH5MwLNX5hGdR
	 QKroPXhD3vS3aDaHyX3TecO441vL1UDt1Jif3eMRywNfLj5ojPoWPVgITRNgjdwVw5Z+G
	 7+wEQNyFPhotalfrWBSxOH7UqtHkfKrRU0cL3gDpNikcgWISKQULh2unNy+yF30IIwHiw
	 mZoL6fRBG0hM8Tup91E2qZh/ed0tu8yurrkrziLR3mTwJRdTH8Eg8TmSVm9V2I6eC6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDHuQJjv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55AF606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDHuQJjv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ABD61F0089F;
	Fri,  6 Nov 2026 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793979317;
	bh=7kSE4MOI9Fld5eXbHThDBlwP7pJdSsCWudgi6MoSBCU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eDHuQJjvXDN++F4raGVvkAQpR3EHXV+K4gIZ9SV8SzDLgMt4AJHfgTRpXDFAk60Pl
	 26Gtd5UMZlBr8dmSS3lXU0mODIq/rL/fWuAwM2c6YDd7Jxvty2Q11Pd6VpPDV5ClPD
	 Oiy1rFytI9GsMkNC1VQSDFriebFQuJarIDuj2lwJHiTlx2AeDiY8Ph43EMhX+ZpT3d
	 UlUSJ+Bnb6F+cH5AYV64sLWhwhbqY+Sz61GF3aaMx1/XuswsAi3VG92Pvo2swQQK6r
	 MWsvz959xpimb4Qb+LiDySlHKfOC9LfWITtFDnRJc8JReJ40g/Tk8wHyv7uf6TuoKk
	 YTNNRo3/hIA0Q==
Message-ID: <sashiko-outbox-201701@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 15/19] soc: starfive: Add jh7110-hdmi-subsystem
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-jh7110-clean-send-v7-15-68f7ea9913db@samsung.com>
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
 <CGME20261106135918eucas1p1a3d7684adcefdc624b9748469d07e88c@eucas1p1.samsung.com>
 <20261106-jh7110-clean-send-v7-15-68f7ea9913db@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 15:35:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] soc: starfive: wrong regmap stride and val_bits in
  jh7110-hdmi-subsystem
--

commit 7b3e8ed6b5c2397fee05f3afbf224c172c611228
Author: Michal Wilczynski <m.wilczynski@samsung.com>

soc: starfive: Add jh7110-hdmi-subsystem driver

This commit adds a platform driver for the StarFive JH7110 HDMI subsystem
that initializes a shared MMIO regmap and populates the child HDMI PHY and
controller devices.

> diff --git a/drivers/soc/starfive/jh7110-hdmi-subsystem.c b/drivers/soc/s=
tarfive/jh7110-hdmi-subsystem.c
> new file mode 100644
> index 0000000000000..b01dc66450f51
> --- /dev/null
> +++ b/drivers/soc/starfive/jh7110-hdmi-subsystem.c
> @@ -0,0 +1,72 @@
[ ... ]
> +static const struct regmap_config starfive_hdmi_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 8,
> +	.max_register =3D 0x3fff,
> +};

[Severity: Medium]
Should starfive_hdmi_regmap_config set .val_bits =3D 32, .reg_stride =3D 4,=
 and
.max_register =3D 0x3ffc to match the 4-byte register layout expected by the
child drivers?

Both the HDMI controller and PHY drivers address this shared regmap at
4-byte-strided offsets (offset * 4 and reg * 4), and the controller's own
inno_hdmi_regmap_config uses 32-bit values with a 4-byte stride:

drivers/gpu/drm/bridge/inno-hdmi.c:
	static const struct regmap_config inno_hdmi_regmap_config =3D {
		.reg_bits =3D 32,
		.val_bits =3D 32,
		.reg_stride =3D 4,
	};

	static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
	{
		u32 val;

		if (regmap_read(hdmi->regmap, offset * 4, &val))
			return 0;

		return val;
	}

With .val_bits =3D 8 and .reg_stride left at its default of 1, regmap_mmio
uses readb()/writeb() instead of 32-bit MMIO accessors, does not check
4-byte register alignment, and steps through 0x0000..0x3fff byte-by-byte in
regmap debugfs, issuing unaligned byte reads to the upper three bytes of
every 32-bit register word.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-jh7110-cle=
an-send-v7-0-68f7ea9913db@samsung.com?part=3D15
