Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9161E45BD57
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844173; cv=none; b=QlaWmPSZjk44KIWbVnUyNqv+Zn25xxIP5zXdikSh2HJ5c98JpJXicoFlDjVsWFhvUutlZBPObvhh2y7pgUWsoO2B2RnoMrf/YU79abvlVKt0UI07IyNOmQfAyF8/rxGI3MloviKL7FDxVIWpdxk+Ow1aXme1P3thAehhw1X2cKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844173; c=relaxed/simple;
	bh=n6vPndmDX81xjEhOctO+/4d40aylt23r+5ajLWjHvjM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oFQpUSXiSIezOtq3lSalcLTeSZU2zk3wBfVpXTt688y13GloSeqAet2UzXeh0JHjZ/dJig70z9fnCmtpgOkXXfBsf+sjDzc0fHhCHm/EimoiEEkl3YUmH3FmDJoWl7i9EbihRu1ObW+Prgo6MlUu1RvjnyK23loPymZV6yaETFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBo0Ss/X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBo0Ss/X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E684CC2BCB0;
	Fri, 15 May 2026 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778844173;
	bh=n6vPndmDX81xjEhOctO+/4d40aylt23r+5ajLWjHvjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WBo0Ss/XmvtavW47WP4VGnic8gNk8banDFM+JPa/ee5RZuveQjIgyrQd+VBZCuyrI
	 lP0uSkJAPtRRStU6nxACAZcdi3394Cn1nXl9JlnYa/zHLgi8GWVI4OWF4I4U4zcfs8
	 La756hyaj5XVNAPJHcd1cSzFs7fxrHG4vzXOzAPlfpUtOROgcV6EvfovVjZkD9eAdu
	 AE+sOC5Ycz+hNAuQWF/MghtbLxsxEAuOwAdtk8XUoZ1l/TnmqDuzeFJ9bFVPE/uDKj
	 lJhHBrh4VDSC6+CsR+9BUAsEuLV/kwC3zSwsISPWMblZJi7ftiL3Lp99H/2XUwhX/l
	 C1eCVCUQfWYEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 phy-next 2/2] phy: ti: add PHY driver for TI
 DS125DF111 Dual-Channel Retimer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20260515110145.1925579-3-ioana.ciornei@nxp.com>
References: <20260515110145.1925579-3-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:22:52 +0000
Message-Id: <20260515112252.E684CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing delay or polling after setting a self-clearing hardware re=
set bit.
--

commit 59a5ca7411308a81c146d660b8c04e0be8fe8fbb
Author: Ioana Ciornei <ioana.ciornei@nxp.com>

phy: ti: add PHY driver for TI DS125DF111 Dual-Channel Retimer

This commit adds a generic PHY driver for the TI DS125DF111 Multi-Protocol
Dual-Channel Retimer. It supports 10G and 1G link speeds, modeling each of
the two channels as a separate PHY device.

> diff --git a/drivers/phy/ti/phy-ds125df111.c b/drivers/phy/ti/phy-ds125df=
111.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/phy/ti/phy-ds125df111.c

[ ... ]

> +static int ds125df111_configure(struct phy *phy,
> +				const struct ds125df111_config *cfg)
> +{

[ ... ]

> +	/* Reset Channel Registers */
> +	err =3D i2c_smbus_read_byte_data(i2c, DS125DF111_CH_CTRL);
> +	if (err < 0) {
> +		dev_err(dev, "Error resetting channel configuration\n");
> +		goto out;
> +	}
> +	val =3D (u8)err;
> +	val |=3D DS125DF111_CH_CTRL_RESET;
> +	err =3D i2c_smbus_write_byte_data(i2c, DS125DF111_CH_CTRL, val);
> +	if (err < 0) {
> +		dev_err(dev, "Error resetting channel configuration\n");
> +		goto out;
> +	}
> +
> +	/* Program the VCO group frequencies */
> +	for (i =3D 0; i < DS125DF111_NUM_VCO_GROUP_REG; i++) {
> +		err =3D i2c_smbus_write_byte_data(i2c,
> +						DS125DF111_VCO_GROUP_BASE + i,
> +						cfg->vco_group[i]);

Is a delay or polling loop needed after triggering the channel reset?

The DS125DF111_CH_CTRL_RESET bit is defined as self-clearing, but the code=
=20
immediately proceeds to program the VCO group frequencies without checking =
if
the reset has finished.

Since hardware resets usually take a non-zero amount of time, writing to the
registers right away could result in the device NACKing the transactions or
silently dropping the new configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515110145.1925=
579-1-ioana.ciornei@nxp.com?part=3D2
