Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EF540DFA0
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594296; cv=none; b=mb0B6b9dgnf7FrbX9K8YJl4OfF2vdeEXAK+h1Eo7hphEeuGHc5XLXK6r/NRvl4I3AUdZZ95VHOpMLK3n5RBpY6LmPZD9jAlX1xb4WVUQYDGbGRtdZc0vZOx3q262tpJR4T8+BOI1q9HlMrB/dcsp7hxDsEwt4dFVBrUquM2Yt2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594296; c=relaxed/simple;
	bh=6pscFZmhP8Wm65MRUgiucUJnG/7JzD/DAuO/yQihiyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R3eavej27nqYPdtO/1e0pYRpPKIPwBivqmN5QD6d8xXBc59w7QP/M9vx+oawtugApPv2522PBZZcYJ3lqUzdiPiMgbRHx+7dds6LjLuF3zwTra9g21fdlaF5Ud2J5a5h4wjDS60D/gV6DqFp3XAtLehOAHYObkXCvL1liSyYTMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IC+rvB6p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IC+rvB6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140E81F00A3A;
	Thu,  9 Jul 2026 10:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783594291;
	bh=6AV/Bv9CWVyZqKThlG/GXC41B3XIuc7Yvx0wx4dEtok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IC+rvB6pfNQknxBlYcsASU3fzinOarBApXf9KLccSSyIzR8JdUZkYZKnx/drcdh08
	 qrIubAFnIMuk14AeNERlDryW+YhDUSUXmqE7BD+1DjwXkju1WUrfmVhw9Z3FI2xVAC
	 6VclaFwGVOkgGDvbN3AKIwaGjv/+ySg9MvfG2ilEIU+iea5Xa9w2QkPypIUELyNBwO
	 Etni97gCjAyHFFVxNJ1MIZvi2LvAK5z5RnnaKhMDPm/vOJbykrlmsRg91IW/j7R6Kp
	 Dyf+Ya9yHOyOFnYMLmS2YNzYZM2jTbrk2fQP+PmkaLPR6GiqjWZhyIigD+2ZLRdg/5
	 3F7I5UYV5kaew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/11] drm/mediatek: mtk_dp: Add support for eDP1.5
 IPs and MT8196 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260709103431.46616-11-angelogioacchino.delregno@collabora.com>
References: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
 <20260709103431.46616-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 10:51:30 +0000
Message-Id: <20260709105131.140E81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] PHY bias power is incorrectly forced ON instead of OFF during the =
bridge atomic disable sequence.
- [High] Zero-width reset pulse and failure to clear PHY reset state for th=
e eDP 1.5 IP.
- [Medium] Uninitialized calibration data is unconditionally flushed to PHY=
 registers when MT8196 uses the legacy PHY configuration.

Pre-existing issues:
- [High] Double free / use-after-free of the PHY platform device on probe e=
rror path.
- [High] Use-after-free in debounce timer teardown due to failure to disabl=
e threaded IRQ.
--

--- Patch [10]: [PATCH v3 10/11] drm/mediatek: mtk_dp: Add support for eDP1=
.5 IPs and MT8196 SoC ---
commit f310ca07bbff89c8e8b27b5c8d3a9c8cfc72e839
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: drm/mediatek: mtk_dp: Add support for eDP1.5 IPs and MT8196 SoC

This commit adds support for MediaTek's Embedded DisplayPort (eDP) v1.5 IP,=
=20
found in the MT8196 SoC. It introduces conditional register writes based on=
=20
platform data booleans to handle SDP encoders, PSR support, and power state=
=20
forcing differences between IP revisions. It also partially prepares for DP=
=20
1.4 IP support on the same SoC.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index fb216811c80c7..868d918a0b161 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
[ ... ]
> @@ -1210,24 +1315,87 @@ static void mtk_dp_initialize_aux_settings(struct=
 mtk_dp *mtk_dp)
[ ... ]
> +static void mtk_dp_encoder_reset(struct mtk_dp *mtk_dp)
> +{
>  	/* dp tx encoder reset all sw */
>  	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
>  			   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0,
>  			   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0);
> =20
> +	if (mtk_dp->data->hwip_v1p4) {
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
> +				   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0);
> +		mtk_dp_update_bits(mtk_dp, REG_3FF8_DP_ENC_P0_3,
> +				   ENC_PHY_STATE_RESET_ALL_MASK,
> +				   ENC_PHY_STATE_RESET_ALL_MASK);
> +	}
> +
>  	/* Wait for sw reset to complete */
>  	usleep_range(1000, 5000);
> -	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
> -			   0, DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0);
> +
> +	if (!mtk_dp->data->hwip_v1p4)
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
> +				   0, DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0);
> +}

[Severity: High]
For the eDP 1.5 IP (hwip_v1p4), does asserting
DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0 to 1 and immediately deasserting it to=
 0
create a zero-width pulse that the hardware might ignore?

Furthermore, ENC_PHY_STATE_RESET_ALL_MASK is asserted but never explicitly
cleared after the delay. Will this leave the PHY permanently in reset unless
the register is self-clearing?

[ ... ]
> @@ -1359,8 +1550,10 @@ static int mtk_dp_phy_configure(struct mtk_dp *mtk=
_dp,
>  		}
>  	};
> =20
> -	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
> -			   DP_PWR_STATE_MASK);
> +	/* Set power state requests only if power states are not forced */
> +	if (!mtk_dp->data->force_pwr_states)
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
> +				   DP_PWR_STATE_MASK);
> =20
>  	ret =3D phy_configure(mtk_dp->phy, &phy_opts);
>  	if (ret)
> @@ -1373,6 +1566,11 @@ static int mtk_dp_phy_configure(struct mtk_dp *mtk=
_dp,
>  	if (mtk_dp->phy_dev)
>  		mtk_dp_set_calibration_data(mtk_dp);

[Severity: Medium]
If MT8196 is used with a device tree lacking the separate phys node, it will
fall back to the legacy architecture and create mtk_dp->phy_dev.

Since mt8196_edp_data does not provide an efuse_fmt,
mtk_dp_get_calibration_data() is skipped, leaving the cal_data array zeroed.

Later in mtk_dp_phy_configure(), the code unconditionally calls
mtk_dp_set_calibration_data() if mtk_dp->phy_dev exists.

Will this flush uninitialized or zeroed cal_data directly into the PHY
registers and misconfigure the hardware?

[ ... ]
> @@ -2580,6 +2795,9 @@ static void mtk_dp_bridge_atomic_disable(struct drm=
_bridge *bridge,
>  	/* SDP path reset sw*/
>  	mtk_dp_sdp_path_reset(mtk_dp);
> =20
> +	if (mtk_dp->data->force_pwr_states)
> +		mtk_dp_encoder_force_bias_power_on(mtk_dp);
> +

[Severity: High]
Is it intentional to force the PHY bias power ON during the bridge disable
sequence?

The disable path usually turns hardware off to save power (as done in
mtk_dp_power_disable() which calls mtk_dp_encoder_force_bias_power_off()).

Does this cause a power leak or keep the PHY in an incorrect state during
teardown?

>  	/* Ensure the sink is muted */
>  	msleep(20);
>  }
> @@ -2860,7 +3078,8 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_d=
p)
>  				     "Failed to add phy unregister devm action");
> =20
>  	/* PHY calibration data is in mtk_dp only for legacy devicetree */
> -	mtk_dp_get_calibration_data(mtk_dp);
> +	if (mtk_dp->data->efuse_fmt)
> +		mtk_dp_get_calibration_data(mtk_dp);
> =20
>  	mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
>  	if (IS_ERR(mtk_dp->phy)) {
>  		platform_device_unregister(mtk_dp->phy_dev);
>  		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy), "Failed to get phy\n");
>  	}

[Severity: High]
This is a pre-existing issue, but if devm_phy_get() fails here, the explicit
error handling path calls platform_device_unregister(mtk_dp->phy_dev) before
returning.

Since mtk_dp_unregister_pdevs was registered as a devm action just prior to
this, returning an error will trigger the devres core to unwind the stack a=
nd
call platform_device_unregister() a second time on the same device pointer.

Can this cause a double-free or use-after-free crash?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but there is a pre-existing issu=
e in
mtk_dp_remove() regarding the debounce timer teardown.

The HPD interrupt is registered during probe using devm_request_threaded_ir=
q(),
meaning its lifetime spans until after mtk_dp_remove() returns.

Inside mtk_dp_remove(), the code calls timer_delete_sync(&mtk_dp->debounce_=
timer)
but does not disable the IRQ:

static void mtk_dp_remove(struct platform_device *pdev)
{
    ...
    if (mtk_dp->data->bridge_type !=3D DRM_MODE_CONNECTOR_eDP)
        timer_delete_sync(&mtk_dp->debounce_timer);
    ...
}

Because the IRQ is still active, an incoming hardware interrupt can immedia=
tely
fire the mtk_dp_hpd_event_thread() handler, which can re-arm the timer using
mod_timer(). Once the mtk_dp object is subsequently freed by devres, the ti=
mer
expires and accesses freed memory.

Could this lead to a use-after-free on driver unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709103431.4661=
6-1-angelogioacchino.delregno@collabora.com?part=3D10
