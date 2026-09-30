Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE04344AB65
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753119; cv=none; b=riS0N5JX3qxtU0eP8KPTfha3DkbiyBCrhVFzCrdvQxEQR/H+3IRQF1IEW/zMJuuuDaB4zvlq2C8DdtsH7n+UFhX5xF+hvUZRTPZXLq2MO+4IkEKMnX7/qybY4wzhlQ2DFtEc6R6ttOBiwqnhqLnkEQGL6+UGBL7cfp5PzsgQgJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753119; c=relaxed/simple;
	bh=eoo7Uil1aiO+na1DnFzmwcMQlpk1UhcCTG68EVX69EY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bFJkISz85TSjJqcNS4IXM8GsYyfCH/TRqmdnxqoQririrrbq8pd7JOW1AEpVqLnNIJerCCzf7LZckBc4ePv/3lYmNMZBFPCd4kR3ECESWSh4TOpHiBCv6R45Vn3R7ODN8mW3qEBfhqSkABlWfgqhW9lAW30LF77hoCl9TKh+wCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhChLs/o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhChLs/o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308E61F000FF;
	Wed, 30 Sep 2026 07:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790753117;
	bh=cJDnMtLIfVoK8vRkhL4ukVQxTCdaTUJSL9bCAduq2/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VhChLs/o2HmyGhpU1nPGpatIewBiGQKeAOtD35a1wtQhHqJsnnRWQ7u657uPPOW7U
	 SecZnRIe/01h72JLLuh5NU0J6AOWT2WndbAWNuwKdHusb3UyRm5kR98AvVUQO4NHx4
	 NdhQofYEfYscwGu+mneKdE0rlwbEHJbdToDl+mAs7BgtXckG3oNLYdQlVZjPBNuR3B
	 VcxQYf64Zm358T0K/7Vv+E+rZWlvniy2ed/mYcKXEGhuFmWjn+uQ3pADJvLlV2lNLs
	 AGuFWkUP4EpKC0mU9TC27btO9dEaoKea0LQ7EWdFIbv4SOgbTZyBtgzuxLKE9AXKGY
	 AvIKTXmGG5MBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/6] drm/tegra: Add support for 8-bit CPU interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930070535.47130-5-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
 <20260930070535.47130-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:25:16 +0000
Message-Id: <20260930072517.308E61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] drm: Use-after-free of GPIO descriptors during bridge atomic_d=
isable
- [High] drm: Double free of panel bridge resource via manual release
- [High] gpio: devm resource leak on transient GPIO allocation failures
- [Medium] drm: display controller platform device reference leak in attach
- [Medium] gpio: devm_gpiod_put(NULL) on absent optional GPIOs triggers WAR=
N_ON
- [Medium] drm: Duplicate drm_panel_enable()/disable() causes bridge orches=
tration warnings
- [Medium] drm: Missing drm_panel_put() causes panel reference leak
--

commit 7416e1ec1121b26f661bbd6bfc2ff22ea8f657f1
Author: Svyatoslav Ryhel <clamor95@gmail.com>

drm/tegra: Add support for 8-bit CPU interface

The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
that closely resembles the MIPI DBI Type B protocol and is referred to as
'8-bit CPU'. Each display controller provides two such interfaces, which
can be used to send MIPI DCS commands to initialize and control the panel
while image data is transmitted via 16/18/24-line RGB.

> diff --git a/drivers/gpu/drm/tegra/cpu-bridge.c b/drivers/gpu/drm/tegra/c=
pu-bridge.c
> new file mode 100644
> index 0000000000000..63ca87a0be909
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/cpu-bridge.c
[ ... ]
> +static int tegra_cpu_bridge_prepare_gpios(struct tegra_cpu_bridge_priv *=
priv)
> +{
> +	struct device *dev =3D priv->dev;
> +
> +	if (priv->prepared)
> +		return 0;
> +
> +	/*
> +	 * Control and data GPIOs are shared between SPI and DPI. The bridge
> +	 * driver must get and put the required GPIOs each time DCS commands
> +	 * are transmitted.
> +	 */
> +
> +	priv->data_gpios =3D devm_gpiod_get_array_optional(dev, "data", GPIOD_O=
UT_LOW);
> +	if (IS_ERR(priv->data_gpios)) {
> +		dev_err(dev, "Failed to get data gpios %ld\n", PTR_ERR(priv->data_gpio=
s));
> +		return PTR_ERR(priv->data_gpios);
> +	}
> +
> +	if (priv->data_gpios && priv->data_gpios->ndescs > CPU_BRIDGE_DATA_PINS=
_MAX) {
> +		dev_err(dev, "Too many data gpios\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->cs_gpio =3D devm_gpiod_get_optional(dev, "cs", GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->cs_gpio)) {
> +		dev_err(dev, "Failed to get CS GPIO: %ld\n", PTR_ERR(priv->cs_gpio));
> +		return PTR_ERR(priv->cs_gpio);

[Severity: High]
If one of these subsequent allocations fails, does it leak the memory=20
allocated for the earlier devm_gpiod_get_array_optional()?

Since this function is called inside a repeatable lifecycle function=20
(the atomic enable/disable paths), a transient failure could repeatedly=20
allocate devres memory without freeing it. This could permanently bind the=
=20
GPIO to the device and prevent successful recovery on subsequent modesets.

[ ... ]
> +static void tegra_cpu_bridge_atomic_enable(struct drm_bridge *bridge,
> +					   struct drm_atomic_commit *state)
> +{
[ ... ]
> +	ret =3D tegra_cpu_bridge_prepare_gpios(priv);
> +	if (ret)
> +		return;
> +
> +	if (priv->output.panel)
> +		drm_panel_enable(priv->output.panel);

[Severity: Medium]
Does the DRM core already handle this? The panel is part of the bridge chain
via devm_drm_panel_bridge_add_typed(), meaning the atomic helpers should=20
automatically call drm_panel_enable() and drm_panel_disable().

Manually calling it here could duplicate the work and trigger a "Skipping
enable of already enabled panel" warning in the kernel logs.

> +
> +	gpiod_set_value(priv->cs_gpio, 0);
> +
> +	devm_gpiod_put(priv->dev, priv->dc_gpio);
> +	devm_gpiod_put(priv->dev, priv->rw_gpio);
> +	devm_gpiod_put(priv->dev, priv->cs_gpio);

[Severity: Medium]
What happens if the optional GPIOs are absent and return NULL during=20
allocation?

devm_gpiod_get_optional() returns NULL without adding a devres cleanup=20
action. Unconditionally calling devm_gpiod_put() on a NULL pointer could=20
cause the devres subsystem to search for a NULL action and trigger a WARN_ON
stack trace in devm_release_action().

> +
> +	devm_gpiod_put_array(priv->dev, priv->data_gpios);

[Severity: Critical]
Could freeing the GPIO array here lead to a use-after-free during the disab=
le
sequence?

During a modeset disable, the panel's disable callback is invoked first.
This sends MIPI DCS commands via tegra_cpu_bridge_dbi_command(), which=20
calls tegra_cpu_bridge_write().

tegra_cpu_bridge_write() accesses priv->data_gpios:

	gpiod_set_array_value(priv->data_gpios->ndescs, priv->data_gpios->desc,
			      priv->data_gpios->info, value_bitmap);

But since tegra_cpu_bridge_atomic_disable() hasn't run yet to re-allocate
the GPIOs, this would execute using the dangling priv->data_gpios pointer
that was freed here during the previous enable.

[ ... ]
> +static int tegra_cpu_bridge_attach(struct drm_bridge *bridge,
> +				   struct drm_encoder *encoder,
> +				   enum drm_bridge_attach_flags flags)
> +{
[ ... ]
> +	dc_pdev =3D of_find_device_by_node(dc_node);
> +	of_node_put(dc_node);
> +	if (!dc_pdev)
> +		return -ENODEV;
> +
> +	priv->dc =3D platform_get_drvdata(dc_pdev);
> +	if (!priv->dc)
> +		return -ENODEV;

[Severity: Medium]
Does this code leak the reference count to the platform device?

of_find_device_by_node() increments the kobject reference count for the=20
device. Is it necessary to call put_device() on the returned device after=20
getting the driver data so it isn't permanently pinned?

[ ... ]
> +static int tegra_cpu_bridge_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D drm_of_find_panel_or_bridge(np, 1, 0, &panel, &bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		bridge =3D devm_drm_panel_bridge_add_typed(dev, panel,
> +							 DRM_MODE_CONNECTOR_DPI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);

[Severity: Medium]
If we return an error here, do we leak the panel reference?

drm_of_find_panel_or_bridge() acquires a reference to the panel object,=20
but there doesn't seem to be a matching drm_panel_put() on this error path=
=20
or during normal module teardown in tegra_cpu_bridge_remove().

[ ... ]
> +static void tegra_cpu_bridge_remove(struct platform_device *pdev)
> +{
> +	struct tegra_cpu_bridge_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	drm_bridge_remove(&priv->bridge);
> +	if (priv->output.panel)
> +		drm_panel_bridge_remove(priv->output.bridge);

[Severity: High]
Does this explicitly free a resource that is already managed by devres?

The bridge was allocated using devm_drm_panel_bridge_add_typed(), which
schedules automatic cleanup. Manually calling drm_panel_bridge_remove()
here will decrement the bridge reference count, likely causing a double-free
when the devres subsystem executes its own teardown action on module remova=
l.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930070535.4713=
0-1-clamor95@gmail.com?part=3D4
