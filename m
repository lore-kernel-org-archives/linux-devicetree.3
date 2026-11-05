Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881011;
	b=pRCJmAtsuV31tKdrVjJN7kUUtU5BKW8parYfz9jfX/Vibv2i081TDAO/uKLOsReZDkRC
	 y1DQ+2NA38juJoewMt28kF4oiZI8d1yyqTaSsKDoyrwSzTA67q16/Pz+zO0DXDdB2zshi
	 a5nCZsvR2AA12jrqzE4sQ9hl/DAM/JSdkTIEomjjf70s4tnG//RBZOO2K6MzYcae7aNSE
	 z9oOzPr87tSby/y6mHi2ugmuaEB2dWghVF9aCn+i5neibzYEEuXTwYvIDSNWItG/T5VW2
	 fAx2l9IC8ZigdARW7j1LEPwDdp99mJY+peJGWT8eRj/67GGutcaiMXw7H7YaCsmCCcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881011;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JTSjfoMA+kGpbLg+09oTKfrhtL9KMZD6MOmCmLMheBU=;
	b=pgoQYMJHYLcKpzFnsY+Gw722RxmBm2Ipl9HrCZx6696A+7BH3bikaZ2lTqBlsnx5ML2C
	 29Tuk6Z93x0n4Bh4pca2Xw650/SrrUY6o9RckAwMyQQIJz+7TSqZXkrjVafJ75XDh1OsY
	 u67KxjnekfR9egKg7gD9P3/IWAkVJtWlQIfD5QD04Pcq80lMdRoMSzqUWnItT4lb84SOQ
	 /beGDFpWyLGvkIg+csrT2EXDCPJ+LZ4AyCf4KDfNWCKS02h0kCtCaFhXJbXfoPPxZWTBB
	 XbkSLnUsEd1VziGSgCcwX84nSDfc/pHSnXt45Sz/zs7YwHobc15TplV3ys8fDraikvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZnuKeIh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE5D606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZnuKeIh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CBE1F000C1;
	Thu,  5 Nov 2026 12:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881010;
	bh=JTSjfoMA+kGpbLg+09oTKfrhtL9KMZD6MOmCmLMheBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OZnuKeIhZqd1cum3u9WPQKY8JIL3VjYL4RUQxLkzwnFay5yTUOWWQhFOpRhnZOZUM
	 MY2toU06BHHhG0mtkM2LAwu3u6BLl0lmvR0TIrB1uP3m72joxr11grAzdULyZP6Jop
	 yutME5eq3/ryvl85OaOnvD7ud8UX1YyVS85a8GdPpoQzp1879PpMZDhJsinkcdMIuY
	 v8GfH0zRUeDTqDYnK2RnBs06KrIi/QBhjf8HaMIzFBz36PlNCNgwt1PFTZ36+Rwj64
	 +8QKMTCKS1npKGd2oojr5iRHoMVA3BZHtx4RczbJ0GVf8ewKwirkWejCrgFCy4hx/4
	 bVdYmLGiOc9oA==
Message-ID: <sashiko-outbox-199006@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/8] nvmem: stm32: add TAMP nvmem driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-upstream_nvram_reworked-v5-3-ddf7dbf1b298@foss.st.com>
References: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
 <20261105-upstream_nvram_reworked-v5-3-ddf7dbf1b298@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 12:16:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] nvmem: stm32: broken empty zone handling in stm32_tamp_nvram_bkp=
reg_get_zone()
--

commit cc344e612aad158ca9ed69f02f411f367bdfd26a
Author: Simeon Marijon <simeon.marijon@foss.st.com>

nvmem: stm32: add TAMP nvmem driver

This commit adds an nvmem provider driver for the STMicroelectronics STM32
TAMP backup registers on STM32MP1 and STM32MP25 SoCs, checking hardware
protection zones and compartment isolation rights before accessing the
backup registers.

> diff --git a/drivers/nvmem/stm32-tamp-nvram.c b/drivers/nvmem/stm32-tamp-=
nvram.c
> new file mode 100644
> index 0000000000000..81096a5d02829
> --- /dev/null
> +++ b/drivers/nvmem/stm32-tamp-nvram.c
> @@ -0,0 +1,680 @@

[ ... ]

> +static int stm32_tamp_nvram_bkpreg_get_zone(struct stm32_tamp_nvram_priv=
 *priv, int reg)
> +{
> +	int *idx_bkpreg_zones_end =3D priv->idx_bkpreg_zones_end;
> +	int nb_zones =3D priv->data->nb_zones;
> +	int protection_zone_idx;
> +
> +	if (reg < 0)
> +		return -1; /* negative reg is the boundary of an empty zone */
> +
> +	for (protection_zone_idx =3D 0; protection_zone_idx < nb_zones; protect=
ion_zone_idx++) {
> +		if (reg <=3D idx_bkpreg_zones_end[protection_zone_idx])
> +			break;
> +	}
> +
> +	if (protection_zone_idx >=3D nb_zones)
> +		return -1; /* the reg is not a part of any zone */
> +
> +	return protection_zone_idx;
> +}

[ ... ]

> +static int *stm32_tamp_nvram_get_backup_zones(struct stm32_tamp_nvram_pr=
iv *priv)
> +{
> +	struct device *dev =3D priv->dev;
> +	struct regmap *tamp_regmap =3D priv->config_regmap;
> +	u32 offset_field;
> +	int nb_zones =3D priv->data->nb_zones;
> +	int zone_idx;
> +	int *idx_bkpreg_zones_end;
> +
> +	idx_bkpreg_zones_end =3D devm_kcalloc(dev,
> +					    nb_zones,
> +					    sizeof(*idx_bkpreg_zones_end),
> +					    GFP_KERNEL);
> +	if (!idx_bkpreg_zones_end) {
> +		dev_err(dev, "Can't allocate registers zones\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/* Get the n-1 frontiers of zone within the tamp configuration register=
s */
> +	for (zone_idx =3D 0; zone_idx < nb_zones - 1; zone_idx++) {
> +		const struct reg_field reg_field =3D priv->data->config_reg_fields[zon=
e_idx];
> +		struct regmap_field *field;
> +		int ret;
> +
> +		field =3D devm_regmap_field_alloc(dev, tamp_regmap, reg_field);
> +		if (IS_ERR(field)) {
> +			dev_err(dev, "Can't allocate registers zones\n");
> +			devm_kfree(dev, idx_bkpreg_zones_end);
> +			return ERR_CAST(field);
> +		}
> +
> +		ret =3D regmap_field_read(field, &offset_field);
> +		devm_regmap_field_free(dev, field);
> +		if (ret) {
> +			dev_err(dev, "Can't read field for registers zones\n");
> +			devm_kfree(dev, idx_bkpreg_zones_end);
> +			return ERR_PTR(ret);
> +		}
> +
> +		idx_bkpreg_zones_end[zone_idx] =3D offset_field - 1;
> +	}
> +
> +	/* The last zone end is defined by the number of registers in TAMP */
> +	idx_bkpreg_zones_end[zone_idx] =3D priv->data->nb_regs - 1;
> +
> +	return idx_bkpreg_zones_end;
> +}

[ ... ]

> +	if (priv->data->nb_zones =3D=3D NB_ZONES_STM32MP2) {
> +		priv->bkpreg_access =3D stm32_tamp_get_access_rights_mp2x(priv);
> +
> +		if (IS_ERR(priv->bkpreg_access))
> +			return PTR_ERR(priv->bkpreg_access);
> +
> +		dev_dbg(dev, "\n"
> +			"Zone 1-RIF1 %3d - %3d %c%c\n"
> +			"Zone 1-RIF2 %3d - %3d %c%c\n"
> +			"Zone 2-RIF1 %3d - %3d %c%c\n"
> +			"Zone 2-RIF2 %3d - %3d %c%c\n"
> +			"Zone 3-RIF1 %3d - %3d %c%c\n"
> +			"Zone 3-RIF0 %3d - %3d %c%c\n"
> +			"Zone 3-RIF2 %3d - %3d %c%c\n",
> +			0,
> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
> +						true) ? 'R' : '-',

[Severity: Medium]
Can stm32_tamp_nvram_get_backup_zones() and
stm32_tamp_nvram_bkpreg_get_zone() misclassify backup registers or misreport
zone boundaries when one or more TAMP protection zones or RIF subzones are
empty?

In STM32MP1 and STM32MP25 TAMP hardware, the zone boundary fields in
TAMP_SECCFGR and TAMP_BKPRIFRx (BKPWRIF1, BKPRWSEC, BKPWRIF2, BKPWSEC,
BKPW3RIF1, BKPW3RIF0) define cumulative register offsets from TAMP_BKP0R.

A zone k > 0 is empty when its offset equals the preceding zone's offset (so
zones_end[k] =3D=3D zones_end[k - 1] >=3D 0), or when a subzone offset fiel=
d is
left at 0 (so zones_end[k] =3D=3D -1 while zones_end[k - 1] >=3D 0). In add=
ition,
on STM32MP25, BKPWRIF1 only subdivides Zone 1 (bounded by BKPRWSEC) and
BKPWRIF2 only subdivides Zone 2 (bounded by BKPWSEC); if BKPWRIF1 >=3D
BKPRWSEC or BKPWRIF2 >=3D BKPWSEC, Zone 1-RIF2 or Zone 2-RIF2 is disabled a=
nd
Zone 1 or Zone 2 remains capped at BKPRWSEC or BKPWSEC.

In stm32_tamp_nvram_get_backup_zones(), idx_bkpreg_zones_end[zone_idx] is s=
et
to offset_field - 1 without clamping BKPWRIF1 to BKPRWSEC or BKPWRIF2 to
BKPWSEC and without normalizing empty zones.

If BKPWRIF1 > BKPRWSEC or BKPWRIF2 > BKPWSEC,
stm32_tamp_nvram_bkpreg_get_zone() checks
idx_bkpreg_zones_end[BKPREG_PROTECTION_ZONE_1_RIF1] or
idx_bkpreg_zones_end[BKPREG_PROTECTION_ZONE_2_RIF1] before the parent zone
end (BKPRWSEC - 1 or BKPWSEC - 1), which would place registers beyond
BKPRWSEC or BKPWSEC into Zone 1-RIF1 or Zone 2-RIF1 and apply the wrong
access rights during stm32_tamp_nvram_read() and stm32_tamp_nvram_write().

Furthermore, stm32_tamp_nvram_bkpreg_get_zone() assumes an empty zone always
has a negative end index (reg < 0). When zone k > 0 is empty because
zones_end[k] =3D=3D zones_end[k - 1] >=3D 0, calling
stm32_tamp_nvram_rights(priv, zones_end[k], ...) in stm32_tamp_nvram_probe()
matches zone k - 1 (the first zone with idx_bkpreg_zones_end >=3D reg) rath=
er
than treating zone k as empty. Conversely, if a subzone k > 0 has
offset_field =3D=3D 0 (zones_end[k] =3D=3D -1) after a non-empty zone k - 1,
stm32_tamp_nvram_probe() logs the start of zone k + 1 as zones_end[k] + 1
(0) instead of zones_end[k - 1] + 1.

Should stm32_tamp_nvram_get_backup_zones() clamp the RIF1 subzone offsets to
their parent zone boundaries, and should empty zones be tracked explicitly
rather than relying on zones_end[k] < 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-upstream_n=
vram_reworked-v5-0-ddf7dbf1b298@foss.st.com?part=3D3
