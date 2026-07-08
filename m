Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A5420868
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469987; cv=none; b=DDlj6IKccItPYLyPqr3h+5FIm/GuCIzkG+qkOxkq4MUvM1+pt0BhO+rnuuaTAD2Oe9KnLQFxW1Z4O7ihF53dwRWJzcYK1NKNniX9egB7bHFySail3Doaz2TOSXXXyie7Fj3zqNVXg5ppAAColtzdkhRlQmXTXLExFZAgX9kuJQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469987; c=relaxed/simple;
	bh=sL3dEYsT8uMSAC6DIs0GlWsieP7GbbdhYt0gJz/Neps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K9TV5shk/ZmckNba8b/9sjt2SSi127QIzhejazYdLFM67wXfMKqY4ykn1VC2OWYSsuuqVLLhFg/LM/G1UQoJbEgbBaRiB6TFeJ2nnD/eW6tfDcLQTyMKQJ0gKfE9Dh4ZjfCnm/lCPYUsncVXWz03KlPnNEOHkZl6J1uKHWgCv1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwGYw1En; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwGYw1En"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157E41F000E9;
	Wed,  8 Jul 2026 00:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783469986;
	bh=1+gUsLrAmWhUjLxQuDXcsTRrzwvSX5ocGikbRtKFGhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FwGYw1EnRXQOZr3Pz3kK1vhnzfckLpbq7m5ZNbUv4v6xfIZOgaPLG3oJQPwfU+xi1
	 sRImNPnRR9Crq+CSmFmBLXwXIzegOX3wC0dJhEOeyu3E6dZ56nc02ac5cc5ATTms4u
	 ZzaewnwQN4ClSn5gASXZQiK7JADu8ahpP7s2sujEvfmFXzeiy02gdZ9+vw3MthRw6V
	 7koMTIWiAr1Y3yC/di+Z8QjH5hL/7sJbYr3UZbVci6KSgwxBUJ+VkFZU5EpSG1eKRc
	 CneA0UabGbHDaKDKBtQi8aroPHWkwelivUw0wZnjZ7ld4qCysewbE9ooWTcA1nllqu
	 DNHQ0zV4LcnxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/6] media: qcom: camss: Add support for PHY API
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-5-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-5-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 00:19:45 +0000
Message-Id: <20260708001946.157E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing `phy_exit()` cleanup on multiple probe error paths, leakin=
g PHY initialization state.
- [High] Missing PHY node availability check in `camss_parse_ports()` cause=
s a WARN_ON crash during link setup if a PHY is disabled in DT.
- [Medium] The commit unconditionally selects a non-existent Kconfig symbol=
 `PHY_QCOM_MIPI_CSI2`, causing unmet dependencies and build failures.
- [Medium] Ignored return value from `phy_mipi_dphy_get_default_config_for_=
hsclk()` may lead to invalid PHY configuration.
--

--- Patch [5]: [PATCH v12 5/6] media: qcom: camss: Add support for PHY API =
devices ---
commit 6ca141cbb4ec0862b23ea5f00a1fb741065d4818
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Add support for PHY API devices
   =20
Add the ability to use a PHY pointer which interacts with the standard PHY
API.

In the first instance the code will try to use the new PHY interface. If no
PHYs are present in the DT then the legacy method will be attempted.

> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index 4eda48cb1adf0..1edc5e5a1829e 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_SG
>  	select V4L2_FWNODE
> +	select PHY_QCOM_MIPI_CSI2

[Severity: Medium]
Is PHY_QCOM_MIPI_CSI2 a valid configuration symbol in the kernel tree?

Selecting a non-existent symbol can lead to unmet dependency warnings or
build failures since the intended driver won't be enabled.

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..b740edd0c67e6 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
[ ... ]
> @@ -306,11 +308,89 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
[ ... ]
> +	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_c=
fg);
> +
> +	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +
> +	ret =3D phy_configure(csiphy->phy, &dphy_opts);

[Severity: Medium]
Should the return value of phy_mipi_dphy_get_default_config_for_hsclk() be
checked here?

If link_freq is zero or calculation fails, it returns a negative error code
and leaves dphy_opts unpopulated. Passing an uninitialized struct to
phy_configure() might cause invalid configurations or division-by-zero erro=
rs.

[ ... ]
> @@ -709,6 +789,60 @@ int msm_csiphy_subdev_init(struct camss *camss,
[ ... ]
> +	ret =3D phy_init(csiphy->phy);
> +	if (ret)
> +		dev_err(dev, "phy %s init fail %d\n", csiphy->name, ret);
> +
> +put_np:
> +	of_node_put(args.np);
> +
> +	return ret;
> +}

[Severity: High]
Since phy_init() is called here without a devres wrapper, could this leak t=
he
PHY initialization state if probe fails later?

For example, if camss_init_subdevices() fails after this point, the error
path jumps to err_genpd_cleanup and bypasses the camss_unregister_entities()
call needed to invoke phy_exit().

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index e814a96953b1b..146fea438486f 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4794,14 +4794,51 @@ static int camss_parse_endpoint_node(struct devic=
e *dev,
>  static int camss_parse_ports(struct camss *camss)
>  {
>  	struct device *dev =3D camss->dev;
> +	const struct camss_resources *res =3D camss->res;
>  	struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
>  	int ret;
> =20
>  	fwnode_graph_for_each_endpoint(fwnode, ep) {
>  		struct camss_async_subdev *csd;
> +		struct fwnode_handle *remote;
> +
> +		if (!fwnode_device_is_available(ep))
> +			continue;
> +
> +		if (res->legacy_phy) {
> +			csd =3D v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
> +							      typeof(*csd));
> +		} else {
> +			struct fwnode_handle *phy_out, *phy_node, *phy_in, *sensor_ep;
> +
> +			phy_out =3D fwnode_graph_get_remote_endpoint(ep);
> +			if (!phy_out)
> +				continue;
> +
> +			phy_node =3D fwnode_graph_get_port_parent(phy_out);
> +			fwnode_handle_put(phy_out);
> +			if (!phy_node)
> +				continue;
> +
> +			phy_in =3D fwnode_graph_get_endpoint_by_id(phy_node, 0, 0, 0);

[Severity: High]
Is it possible to encounter a crash during link setup if a PHY is disabled
in the device tree?

This code retrieves phy_node but does not check if it is available using
fwnode_device_is_available() before adding the remote sensor endpoint to
the notifier.

Later, msm_csiphy_subdev_init() correctly skips the disabled PHY, leaving
the csiphy entity uninitialized with 0 pads. When the sensor binds,
camss_subdev_notifier_complete() attempts to link the sensor to this
empty entity, which triggers a WARN_ON crash inside media_create_pad_link()
due to sink_pad >=3D sink->num_pads.

[ ... ]
> @@ -5132,8 +5186,10 @@ static int camss_register_entities(struct camss *c=
amss)
> =20
>  	i =3D camss->res->csiphy_num;
>  err_reg_csiphy:
> -	for (i--; i >=3D 0; i--)
> -		msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +	for (i--; i >=3D 0; i--) {
> +		if (camss->csiphy[i].phy)
> +			msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +	}
> =20
>  	return ret;
>  }

[Severity: High]
If msm_csiphy_register_entity() fails at index i, does this rollback loop
miss cleaning up the PHY at index i?

The loop decrements i before the check, so it only cleans up indices
strictly less than the failing index, permanently leaking the initialized
PHY for the failing index itself.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org?part=3D5
