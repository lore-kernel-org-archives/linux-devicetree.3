Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991019;
	b=zw7n6q6Sjl1ji6va/VJABu9Bz5dCu4ub84yPdXwDW9htp5HieN+xwvnsOTmmqwdRPoIc
	 7oZfQihT6cYP37+T4S6A17IDkv8XLp2LyEHA7m/d6uWTFrATc5RJE+ytUajUoCnJxMvOM
	 UzGxcMwQs+eBcf6uiEtEbjiJKLuSbO2kESI2FN7tk94HHhlELM3wmIxkN1VHgTBmzeFUL
	 AatJ7u5T7uJUNyjDgJpF8pxAxZPdDMSv5r/381s8NbSmFB8VCG8cRxwPttDcdua/u8y6Z
	 AEQxHQiAp+Adh0z1FRsbAk/F51KWxkaIbELBsZ3Fv36K7Z1oSHPe3mbQyBRlwT27kHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991019;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XPLSi+DAAMgALOwx2pnSW/jNLcIadlw5dYi0ZDekG30=;
	b=HdfnR43eK2l6JnT1+q1Mjjz+Sr5kRKEVuiaowPQe7oHv5/PiIHZ8jY/ZZ7dnZqwr+E+9
	 mwiVWzAO5kBGTe3ZekMrdjVefHL6Cd0GMvUZ5puSzoxCggQGDjX1dEPeIf+tYxbkJnR9m
	 0SJBrh0yV5i8ux3dPId1epkztHiWcFDO0l8b60OIyeT8VNiFPdaHqG31DOT3DJl7CXAtm
	 5aFVCrvUeU/SbAtxh9eMkYi5goJMz8EIyuB/IHmv907wQ1Hd0nI2NgjJIWHpiXinwVoYB
	 dVkMxb9CMpJd7tcEMKsq9t7BT8hCuXnFBNCvBUhD/6AeoJ3rxaJCQHLN2hbzfC/2Mog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DCiTxJNN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B03606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 18:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DCiTxJNN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910491F0089F;
	Fri,  6 Nov 2026 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991019;
	bh=XPLSi+DAAMgALOwx2pnSW/jNLcIadlw5dYi0ZDekG30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DCiTxJNNWj8yScNmbKr2ZDp7CXOs0Ex5/GNRV3dpTrUPjUl5IhZ3iXrYFTsa6SnI+
	 +t3H+w7scH9KYfWFSHyP4G1EuWZicT+Y0/Zu8Fe4Rb0ofcWR2vNa5LBvFm9rtpXdPj
	 g/7KCrcv4HDDqOmLevkV9LKZ5Ltupl0LmVzZacWqWqtbq8ijzW/84qjkUR7+w303St
	 C4RrWaqHjUK4gFPcmkLcSRDCHxQmkRs6OQdsxD0xDuxf7xj/ScKpsF21/uGKhhdZpx
	 rnZcGnXQlJ3K+40ZzBUrYyW1+UArSmCtbZHY3WSSc/zrt/h+2/Ckm8UPyatNcpULU/
	 by+88G53+BnUg==
Message-ID: <sashiko-outbox-202106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] phy: qcom-mipi-csi2: Add SM8150 CSI2 DPHY
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gigena" <mail@andrewgigena.dev>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-6-0103e8a0bbcd@andrewgigena.dev>
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-6-0103e8a0bbcd@andrewgigena.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 18:50:18 +0000
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
- [Medium] phy: qcom-mipi-csi2: wrong SM8150 lane polarity offsets in
  lanes_enable()
--

commit 8f49680e61ed7e381ce9eb5db34d5783dd1ae930
Author: Andrew Gigena <mail@andrewgigena.dev>

phy: qcom-mipi-csi2: Add SM8150 CSI2 DPHY support

This commit adds SM8150 platform configuration and lane initialization tabl=
es
to the Qualcomm MIPI CSI2 DPHY driver, along with support for a fixed timer
clock rate and single power domain attachment.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 966d79c98f9b2..b8b6589cee35d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c

[ ... ]

> @@ -352,6 +419,36 @@ static const struct mipi_csi2phy_hw_ops phy_qcom_mip=
i_csi2_ops_3ph_1_0 =3D {
>  	.lanes_disable =3D phy_qcom_mipi_csi2_lanes_disable,
>  };
> =20
> +static const char * const sm8150_clks[] =3D {
> +	"core",
> +	"timer"
> +};
> +
> +static const char * const sm8150_supplies[] =3D {
> +	"vdda-phy",
> +	"vdda-pll"
> +};
> +
> +static struct mipi_csi2_genpd sm8150_genpds[] =3D {
> +	{ .name =3D "top", .scaled =3D false },
> +};
> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sm8150 =3D {
> +	.ops =3D &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +	.reg_info =3D {
> +		.init_seq =3D lane_regs_sm8150,
> +		.lane_array_size =3D ARRAY_SIZE(lane_regs_sm8150),
> +		.common_regs_offset =3D 0x800,
> +	},

[Severity: Medium]
Does phy_qcom_mipi_csi2_lanes_enable() write lane polarity inversion to the
wrong register offsets on SM8150?

In lane_regs_sm8150[], the physical lane register blocks use a 0x100-byte
stride (data lanes at 0x0000, 0x0200, 0x0400, 0x0600 and the clock lane at
0x0700) with common registers starting at 0x0800.  However,
phy_qcom_mipi_csi2_lanes_enable() programs CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(=
),
which hardcodes X1E80100's 0x200-byte per-lane stride:

drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:
    #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
    ...
    phy_qcom_mipi_csi2_lanes_enable() {
        ...
	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
	for (i =3D 0; i < cfg->num_data_lanes; i++) {
		if (lane_cfg->data[i].pol) {
			u8 pos =3D lane_cfg->data[i].pos;

			writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos * 2));
		}
	}

	if (lane_cfg->clk.pol)
		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cfg->=
clk.pos));

When a board configures non-zero lane-polarities on SM8150, data lanes 1..3
and the clock lane write to 0x0424, 0x0824, 0x0c24, and 0x0e24 instead of
0x0224, 0x0424, 0x0624, and 0x0724, leaving those lanes uninverted and
overwriting CSI_COMMON_CTRL9 at 0x0824 when data lane 2 is inverted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-sm8150-v7.=
4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev?part=3D6
