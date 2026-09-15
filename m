Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981353BCD2F
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504257; cv=none; b=eUr6sLDwZSDGI81AFSK+1SNY9iV4sScmrPoTpEu/vTp3pwZ7zmdijgGXvY+FkVH9yKkqgmaH+0mw81YaJpmKhtWuRcyUY1dLkCTGTpGI6qeFdLZYgl3qgr6pTK0dldJRwpjl7XI5gJRpmJhtmQhVrhrUg3EMJyiB0slX+S14PxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504257; c=relaxed/simple;
	bh=bkaZsaEh48sUwozxnJ+btZmLZ6F+4HIniPAJyE34R7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cgNmcjh66peQZjf84WV2OkWdXmyR/F66Vb3JFTVjJQQhaFn6kZrh+65ac+W7SYPOj8FZVneGQyYNAFYgB7UO15itaaYeGS6BcTgrfOsPx7/zNQDbDyPZh6Aow4AqZIpAadB2Lbh9SigX3Mb12FhgUxygPgQkHJ6qeHoHs4Qlmgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hK1YLwGh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hK1YLwGh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1A01F000FF;
	Tue, 15 Sep 2026 20:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789504256;
	bh=eMME0FeOeOoXwk8evlrcgX98WU8gi+STFmt1ThcUI/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hK1YLwGhmonBL3sPDR+s977xwezlm8UqIpGyeKW/jNj5HqeBo+t83eifxx71ffrna
	 MbF1NDukl5rezgZpH1HV/OlVW8RCO5thDC7EGu5mR8/ksnFlzHsaFrjCGTSepPeiNS
	 KLiOEMEzX9vt7ZqE5ktKJ728zhOLev9A+VjVMZEK+38UeQr0cuflpetzSxKGR+vime
	 QCyg5gI1OnDvhHZSb1lhhl9JvrkyXP+LdTl/ftPY527AAicPqsatAzc+An6FRztHJC
	 Z/GiGrvP2StluT4tB8/W2Uxm5bOLRuza/N0qgOfFI43cXz/i8blnLKcjDYpIjcAz0E
	 oKNqhRGPjABJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] media: i2c: vc-mipi: add Vision Components MIPI
 Module Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Leitner" <richard.leitner@linux.dev>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260915-vc-mipi-ctrl-v1-3-8a42b693d889@linux.dev>
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-3-8a42b693d889@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 20:30:55 +0000
Message-Id: <20260915203055.EB1A01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] clk: UAF window in OF clock provider during device removal
- [Medium] of: memory leak of device_node due to double-increment and missi=
ng cleanup
- [Medium] clk: memory leak of clk_hw on probe error path
- [Low] pm: unconditional assignment of PM callbacks violates dev_pm_ops gu=
idelines
--

commit d0204937d4a594ae9bcc6ff943f4549e7368e364
Author: Richard Leitner <richard.leitner@linux.dev>

    media: i2c: vc-mipi: add Vision Components MIPI Module Controller

This commit adds a driver for the camera module controller found in the Vis=
ion
Components MIPI modules. It manages power sequencing, provides a fixed clock
output, and acts as an I2C tunnel to the camera sensor.

> diff --git a/drivers/media/i2c/vc-mipi.c b/drivers/media/i2c/vc-mipi.c
> new file mode 100644
> index 0000000000000..1ca7f94c17d3c
> --- /dev/null
> +++ b/drivers/media/i2c/vc-mipi.c
> @@ -0,0 +1,541 @@
[ ... ]
> +static int vc_mipi_clk_init(struct vc_mipi_ctrl *ctrl)
> +{
[ ... ]
> +	ctrl->clk_hw =3D clk_hw_register_fixed_rate(ctrl->dev, name, NULL, 0,
> +						  freq);
> +	if (IS_ERR(ctrl->clk_hw))
> +		return PTR_ERR(ctrl->clk_hw);
> +
> +	ret =3D devm_of_clk_add_hw_provider(ctrl->dev, of_clk_hw_simple_get,
> +					  ctrl->clk_hw);

[Severity: High]
Does this create a use-after-free window during device removal?

The clock hardware is registered manually with clk_hw_register_fixed_rate(),
while the OF provider is registered here with devm_of_clk_add_hw_provider().

Later in vc_mipi_i2c_remove(), vc_mipi_clk_cleanup() synchronously
unregisters and frees ctrl->clk_hw. Because the OF provider is devm-managed,
it remains active until devres cleanup, which happens after remove() return=
s.

Could concurrent OF clock lookups return a dangling pointer to freed memory
during this window?

> +	if (ret < 0) {
> +		clk_hw_unregister_fixed_rate(ctrl->clk_hw);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static struct device_node *vc_mipi_i2c_find_tunnel_bus(struct device *de=
v)
> +{
> +	struct device_node *child;
> +
> +	for_each_child_of_node(dev->of_node, child) {
> +		u32 addr_cells, size_cells;
> +
> +		if (of_property_read_u32(child, "#address-cells", &addr_cells))
> +			continue;
> +		if (of_property_read_u32(child, "#size-cells", &size_cells))
> +			continue;
> +		if (addr_cells !=3D 1 || size_cells !=3D 0)
> +			continue;
> +
> +		return of_node_get(child);

[Severity: Medium]
Does returning of_node_get(child) here cause a memory leak of the device_no=
de?

The for_each_child_of_node macro automatically acquires a reference to the
matched child node. Exiting the loop early with of_node_get(child) incorrec=
tly
adds a second reference, leaking the iterator's implicit reference.

> +	}
> +
> +	return NULL;
> +}
> +
> +static int vc_mipi_i2c_tunnel_add(struct i2c_client *i2c)
> +{
> +	struct vc_mipi_ctrl *ctrl =3D i2c_get_clientdata(i2c);
> +	struct i2c_adapter *i2c_adapter =3D &ctrl->i2c_tunnel;
> +	struct device_node *bus_node;
> +
> +	bus_node =3D vc_mipi_i2c_find_tunnel_bus(ctrl->dev);
> +	if (!bus_node)
> +		return -EINVAL;
> +
> +	strscpy(i2c_adapter->name, "vc-mipi-i2c", sizeof(i2c_adapter->name));
> +	i2c_adapter->owner       =3D THIS_MODULE;
> +	i2c_adapter->algo        =3D &vc_mipi_i2c_tunnel_algorithm;
> +	i2c_adapter->quirks      =3D &vc_mipi_i2c_tunnel_quirks;
> +	i2c_adapter->dev.parent  =3D ctrl->dev;
> +	i2c_adapter->dev.of_node =3D bus_node;

[Severity: Medium]
Is there a missing of_node_put() for this reference?

The explicitly acquired reference is assigned to i2c_adapter->dev.of_node
here, but it appears to never be released via of_node_put() in
vc_mipi_i2c_tunnel_del() nor on the i2c_add_adapter() failure path.
Will this cause a permanent memory leak?

> +
> +	i2c_set_adapdata(i2c_adapter, i2c);
> +	return i2c_add_adapter(&ctrl->i2c_tunnel);
> +}
[ ... ]
> +static int vc_mipi_i2c_probe(struct i2c_client *i2c)
> +{
[ ... ]
> +	ret =3D vc_mipi_clk_init(ctrl);
> +	if (ret < 0) {
> +		dev_err(ctrl->dev, "Failed to register clock\n");
> +		goto err_power;
> +	}
> +
> +	/* Enable runtime PM and turn off the device. */
> +	pm_runtime_set_active(ctrl->dev);
> +	pm_runtime_get_noresume(ctrl->dev);
> +	pm_runtime_enable(ctrl->dev);
> +	pm_runtime_set_autosuspend_delay(ctrl->dev, 1000);
> +	pm_runtime_use_autosuspend(ctrl->dev);
> +	pm_runtime_mark_last_busy(ctrl->dev);
> +	pm_runtime_put_autosuspend(ctrl->dev);
> +
> +	/* As a last step create the proxied downstream I2C adapter */
> +	ret =3D vc_mipi_i2c_tunnel_add(i2c);
> +	if (ret < 0) {
> +		dev_err(ctrl->dev, "Failed to register i2c tunnel adapter: %d\n", ret);
> +		goto err_power;
> +	}
> +
> +	return 0;
> +
> +err_power:
> +	vc_mipi_power_off(ctrl->dev);
> +	return ret;

[Severity: Medium]
Does this error path leak the clk_hw memory?

If vc_mipi_i2c_tunnel_add() fails during probe, the code jumps to err_power.
The error handler only powers off the device but fails to call
vc_mipi_clk_cleanup(). This permanently leaks the clk_fixed_rate memory and
leaves it registered in the clock subsystem.

> +}
[ ... ]
> +static struct i2c_driver vc_mipi_driver =3D {
> +	.driver =3D {
> +		.name =3D "vc-mipi",
> +		.of_match_table =3D vc_mipi_dt_ids,
> +		.pm =3D &vc_mipi_pm_ops,

[Severity: Low]
Should this use the pm_ptr() macro?

Subsystem guidelines require using the pm_ptr() wrapper macro for dev_pm_ops
assignments. Failing to use pm_ptr() causes the pointer to remain even when
CONFIG_PM is disabled, leaving a dead struct reference and generating
unnecessary object code.

> +	},
> +	.probe =3D vc_mipi_i2c_probe,
> +	.remove =3D vc_mipi_i2c_remove,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-vc-mipi-ct=
rl-v1-0-8a42b693d889@linux.dev?part=3D3
