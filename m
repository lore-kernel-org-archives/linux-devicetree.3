Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEB4427F8D
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784286; cv=none; b=Pw31sXkldECcY75HMqalzJo4FsTi2o7/9XrpStH1W+yWq2vpsMnthORJBMOm7UBE78EH/U1ZZhM9WoA03Gpn/A0kQQ5a4f9EiRbw/js2v0HcfbtrxfRzwBXZe+5JmZKPU+dSeEk4F1r9Xyp/H8rpBlCLC004dBQ7AnlKgmQxevo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784286; c=relaxed/simple;
	bh=pbyVuL0jyIOpRjobRLpTrVDGSBb2tXH8rM+mBeDjXq0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UQtAML4lKB/COFFdcvez/U1XFNTI8nkumkae3MlTydVdBNv18Rvhhny+osriXO7cWozjiqO2dQMgFlVDFxgZysfFXsEEVW7bZicvjxTPyw91FsCP8/6H8aTq//GxX90dPmXtShsqPJ3kjFxKv1xmQC/PoYIVh5arNybSUUZoCyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V42jbEtP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V42jbEtP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6881F000E9;
	Mon,  3 Aug 2026 19:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785784285;
	bh=CEkB3xaDs0YfnDvaLlwCGFAPS42mAHu8+bIMDJw6FWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V42jbEtPHEasv/YwWqUtEjJVvPNxlVam/kdBKspeE4qeAcR1hhRX6R/z6TW+68hNJ
	 gjc4o9QjhAsBcyWnXaruuJgm8M+9+TOceRJYmxqpxK59nbjt1FJvp+uyMbKPNvB/T0
	 1SrQF7JjkU6I5eh1gaoHpgLQ1dNPFQ081ZLd30rku2pOSTi11KG11vzpgnW346rpdM
	 8FIrRlJQa0InjOCbz9LwL1rFnTuR/+vwoWleIaOoSMPVdOzI9uEPeMeeKKdbzcajaL
	 7DOMIKODr1tOXahWrZNuL63DMYpqTtqAbWaQqRud05iZIsj8yzj5621ZZ24nh1zy+f
	 e88NnxMfWCwvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 22/22] drm/bridge: synopsys: dw-dp: Add audio support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-22-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
 <20260803-synopsys-dw-dp-improvements-v9-22-2e6e46135312@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:11:24 +0000
Message-Id: <20260803191124.DB6881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The result of regmap_read() is used without checking its return =
value, potentially leading to the use of uninitialized stack memory.
--

--- Patch [22]: [PATCH v9 22/22] drm/bridge: synopsys: dw-dp: Add audio sup=
port ---
commit f36ed9436eafc188ce4405c443eb47147a26dbd1
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
drm/bridge: synopsys: dw-dp: Add audio support

This commit implements audio support for the Synopsys DesignWare DisplayPort
controller.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -1690,6 +1721,254 @@ static int dw_dp_link_enable(struct dw_dp *dp)

[ ... ]

> +static int dw_dp_audio_prepare(struct drm_bridge *bridge,
> +			       struct drm_connector *connector,
> +			       struct hdmi_codec_daifmt *daifmt,
> +			       struct hdmi_codec_params *params)
> +{
> +	struct dw_dp *dp =3D bridge_to_dp(bridge);
> +	u8 supported_audio_interfaces;
> +	enum dw_dp_audio_interface audio_interface;
> +	u32 cfg1;
> +	int ret;

[ ... ]

> +	switch (daifmt->fmt) {
> +	case HDMI_SPDIF:
> +		audio_interface =3D DW_DP_AUDIO_SPDIF;
> +		break;
> +	case HDMI_I2S:
> +		/*
> +		 * It is recommended to use SPDIF instead of I2S, since I2S mode requi=
res
> +		 * manually inserting PCUV control bits from userspace and this is done
> +		 * automatically in hardware for SPDIF mode.
> +		 */
> +		audio_interface =3D DW_DP_AUDIO_I2S;
> +		break;
> +	default:
> +		dev_err(dp->dev, "invalid DAI format %d\n", daifmt->fmt);
> +		return -EINVAL;
> +	}
> +
> +	regmap_read(dp->regmap, DW_DP_CONFIG_REG1, &cfg1);
> +	supported_audio_interfaces =3D FIELD_GET(AUDIO_SELECT, cfg1);

[Severity: Medium]
Is it possible for regmap_read() to fail here? If the read operation fails,
cfg1 would remain uninitialized, causing FIELD_GET() to operate on
uninitialized stack memory.=20

Should the return value of regmap_read() be checked before accessing cfg1?

> +
> +	if (supported_audio_interfaces !=3D DW_DP_AUDIO_I2S_AND_SPDIF &&
> +	    supported_audio_interfaces !=3D audio_interface) {
> +		dev_err(dp->dev, "unsupported DAI %d\n", daifmt->fmt);
> +		return -EINVAL;
> +	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-synopsys-d=
w-dp-improvements-v9-0-2e6e46135312@collabora.com?part=3D22
