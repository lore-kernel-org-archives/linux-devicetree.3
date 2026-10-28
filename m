Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180275;
	b=IhRM7ref5U2bRBY6/reT2iYcXVeyD1qpz61BrMUclGqMHsQDQacynHwh308CA6PpCdte
	 khy/vCaCjSdX2lzDLHZb0cZtq/IJXm4LtGVXxUqXSxbs8AOdrdrDmSjUNd9h3g+p2Sj0J
	 NRraLBV+tKjIuSJjhL0PwCFdshsapVS9SjS1X69xtWjn7z8+RmNgh8E4Th62k+n3/OQHQ
	 2aZt6xEHS8MZ8MBRmZAVx4ep4LMyFD0ItHpjZe0ikt09wEW1pKHFPwbiEmu6piOU9uucU
	 AjoAZOXmDnKbo4uRrTUTLp6/UBXPgV6ZwRTLcdEjll0Td4fD63q/NcOY8ZuypHae98w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180275;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Sk1v7emottKiHY639PTpkQHWxfWEDahvOjKibc1TVo0=;
	b=0thlV7FBx4agEh+Z0y3I/YlLdvnaWBxztP8z3xbSIv+zcqdeYRowMiKTq3Voc141Y9+v
	 aj3x4oreesNOGLBG/RVbaRsgs4MGZ6Ma7xOW0KC7TDgkt8kH5slX27YiLari4YHfHrdgV
	 m6ToJI9Z1wmqavO8heTPAU5E87Ni9ck9aeCf3iJn+LAFmkfvpgbv4WFElkoBgsyJ/dSQD
	 OMs9r+S6n8mVTFPYp2HvW49KoBFnTcULL+apfHihgMPP0fQP7H1EXNejTvKXNkX/Z5zDM
	 IouqHnWnuaw04ct7tPiEPKVoSu+beoaAJLRD0HfRhl3suJghUyT2C7RxHEtVKqRt7sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y6c+q2M5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0889C606A326
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y6c+q2M5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CF91F031E2;
	Wed, 28 Oct 2026 09:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180274;
	bh=Sk1v7emottKiHY639PTpkQHWxfWEDahvOjKibc1TVo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y6c+q2M5W6xayuVMycfKjDHwfssPuoyFmPxF/5NJQcO/aNC2bRJLbbUtSPgujjESZ
	 cR10Qv/FcQ2y5LpH1HqJ9oRLDAYRfZaoSN2oKMgNcTCKItqgKsjW2udF6GLj7MaSNI
	 mUalab/J3uMRiJV+atF+tBCEFSWB3/yj9HQS8q/Z5vTlhECocLjKwvF0+UL4Snf/GP
	 9Z1AzQmEV/XjiuJbjbYEfsMsSMx7Y687Qr1+F98XwWsv3ZBor7XiNy+lWjLdIadCvi
	 G8kM4PfiktLdXuZoP+SjLUX0dWpq15sUq+A4K/1J6xyeGiJtw+wumppj08dPQuRUzg
	 1epPHbji2VFRw==
Message-ID: <sashiko-outbox-187685@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/9] media: camss: csiphy: add CSIPHY 2.4.0 lane
 settings for SM8750
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261028093003.722745-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261028093003.722745-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 09:37:54 +0000
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
- [Medium] media: camss: csiphy: SKEW_CAL value mismatch in lane_regs_sm8750
--

commit d9b4ac81070d2e3ae2fc4404b18f6fc6946dfb72
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

media: camss: csiphy: add CSIPHY 2.4.0 lane settings for SM8750

This commit adds the CSIPHY 2.4.0 two-phase lane register table
lane_regs_sm8750[] for SM8750, marks CAMSS_8750 as a generation-2 PHY in
csiphy_is_gen2(), and configures the lane table and 0x138 common status
offset in csiphy_init().

>     media: camss: csiphy: add CSIPHY 2.4.0 lane settings for SM8750
>    =20
>     SM8750 uses the CSIPHY 2.4.0 CSI PHY.  The block keeps the register l=
ayout
>     already handled by csiphy_ops_3ph_1_0 (four data lanes at a 0x400 str=
ide,
>     clock lane at 0xc00, common block at +0x1000), so the generation-2 la=
ne
>     programming sequence applies unchanged, but the per-lane values diffe=
r from
>     the 2.3.0 block used on SM8550/SM8650:
>    =20
>       - the lane register 0x0000 default is 0x8c instead of 0x8e,
>       - every lane gains the four SKEW_CAL registers
>         (0x0094/0x005c/0x0060/0x0064),
>       - the common status block sits at 0x138 instead of 0xb0.
>    =20
>     Add lane_regs_sm8750[] with those values, report CAMSS_8750 as a
>     generation-2 PHY, and select the new table together with the 0x138
>     common status offset in csiphy_init().
>    =20
>     The register map is the one the CSIPHY 2.4.0 vendor driver uses for i=
ts
>     two-phase variant (csiphy_2ph_v2_4_0_reg, 103 entries): address, mask=
 and
>     parameter type are identical for all 103 entries, and the data byte is
>     identical for 99.  The four remaining entries are the SKEW_CAL data b=
ytes
>     of the four lanes (0x005c and its per-lane copies), which are 0x00 he=
re,
>     i.e. the vendor value.  This SoC wires the PHY in two-phase mode; the
>     three-phase variant of the same PHY (csiphy_3ph_v2_4_0_reg, 72 entrie=
s)
>     uses a different address layout, so its table cannot be reused.  The
>     0x138 common status offset is where the vendor parameter block of this
>     generation points its status register window (0x1000 + 0x138).
>    =20
>     These settings are the ones the CSIPHY runs with on a Lenovo TB322FC
>     (SM8750), where both the rear s5kjns and the front gc08a8 sensor stre=
am
>     at full resolution and 30 fps.  Enabling the SKEW_CAL data byte of the
>     four lanes (0x005c =3D 0x54) instead of leaving it at the vendor valu=
e was
>     also measured on that device: 90 frames with each setting, no error
>     reported, 30.26 fps and 53.81 vs 53.78 frame time deviation, i.e. no
>     measurable difference, so the vendor value is kept.
>    =20
>     Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
>=20
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..9cf22ff17baef 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -804,6 +804,123 @@ csiphy_lane_regs lane_regs_sm8650[] =3D {
>  	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>  };
> =20
> +/* GEN2 2.4.0 2PH 4 lane DPHY mode */
> +static const struct
> +csiphy_lane_regs lane_regs_sm8750[] =3D {
> +	/* LN 0 */

[ ... ]

> +	{0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x005C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0060, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +
> +	/* LN 2 */

[ ... ]

> +	{0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x045C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0460, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +
> +	/* LN 4 */

[ ... ]

> +	{0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x085C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0860, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +
> +	/* LN 6 */

[ ... ]

> +	{0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C5C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C60, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},

[Severity: Medium]
Should the reg_data values for 0x005C, 0x045C, 0x085C, and 0x0C5C in
lane_regs_sm8750[] in drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-=
0.c
be 0x00 instead of 0x54 in this commit?

The commit message states that the SKEW_CAL data bytes of the four lanes
(0x005c and its per-lane copies) are 0x00 to match the vendor value, and th=
at
the vendor value is kept after testing 0x54. However, lane_regs_sm8750[] se=
ts
reg_data to 0x54 for all four entries here, and a later commit in the serie=
s,
68a5dddeaab25 ("media: camss: csid: add the 980 generation"), changes these
four entries in lane_regs_sm8750[] from 0x54 to 0x00.

Also, when csiphy_init() selects lane_regs_sm8750[] for CAMSS_8750 and stre=
am
startup runs csiphy_lanes_enable() -> csiphy_gen2_config_lanes(), entries
marked with CSIPHY_SKEW_CAL are currently skipped without writing to hardwa=
re:

drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:csiphy_gen2_config=
_lanes() {
	for (i =3D 0; i < array_size; i++, r++) {
		switch (r->csiphy_param_type) {
		...
		case CSIPHY_SKEW_CAL:
			/* TODO: support application of skew from dt flag */
			continue;
		...
		}
		writel_relaxed(val, csiphy->base + r->reg_addr);
}

Because CSIPHY_SKEW_CAL entries hit continue before writel_relaxed(), chang=
ing
0x005c between 0x00 and 0x54 in lane_regs_sm8750[] is currently a no-op at
runtime, and leaving 0x54 in the table would program the non-vendor value o=
nce
CSIPHY_SKEW_CAL handling is implemented.

Additionally, the commit message mentions "four data lanes at a 0x400 strid=
e,
clock lane at 0xc00", whereas in lane_regs_sm8750[] the four data lanes (LN=
 0,
LN 2, LN 4, LN 6) are at 0x0000, 0x0400, 0x0800, and 0x0c00, and the clock
lane (LN CLK) is at 0x0e00. Should the commit message and table values in t=
his
patch be updated to match?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028093003.7227=
45-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
