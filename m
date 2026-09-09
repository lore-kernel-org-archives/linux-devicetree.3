Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59AA41F5DF
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947640; cv=none; b=k1dYwNyHEm30cS7G4MjR4HnluDFiA2eVFQm3qfCjNwrsUnq8gw6CNmHP8yjZEFGxArSKqmMXCOf1AuNk92Qzvb3dUAUiVjvxnsSrdHVRzi6EeCwvNlwZ0YDNV2DrjtyaeNQvUicUoevq5TwqLxijaXjrCRql/aRzxpCvnTyesUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947640; c=relaxed/simple;
	bh=DXjW1YX3iTxquyAsk/vdm6Qf1H7S5foqSvvoAxcldmg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F3OC3ppy/hkYoJ5LxLlyy7MkKat5TGdBMOxrFLNuEsBR4wnfm5kXbYvR+2dqfEY95gFoi/Q1QWBI/HogIunGerR0U/xpRr12aNbJb5s9wSZw9vUNCgPCIwHmyKjH8pL+S8Sdb85Vmo1PY2hnapUXzlb3MyNC3xL4PDDZeVtohzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eF8SWP6d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eF8SWP6d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EBC1F00A3D;
	Wed,  9 Sep 2026 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788947638;
	bh=5wJYXq7fkAaFZgHF3wAcWehQZsU/57LlFlLgZs5I1FQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eF8SWP6dCLWaXYeQNIvHYYzdAvZcyg+lFOgCQ7xHwgST9cAKuioh5YlwL6v5tdy6V
	 L7uSSYOR++KDUJV2zusZAmxH8q9U1mbSOHHfwjh0tL3d6dBlkooPKeB/NDo3L9pd5n
	 CNIeuTc8qXW1xGTUsic8Tm6t0qBPC+AY1/DdAmi2Eh3G9SYJs41qtBEoPyHXTImNa4
	 ETgoWoXlWuz9mZrP3op3atEnUSR0ymz4P3+FcLrqEgVJDIyM9gkHHoALsEcNotstjb
	 s3wVaoskDez2fJvbFkDzQCccxAP2tpQHNwHrF2DjyTtBofVrQsPcYe8zc+w8ZAWJFQ
	 Xx8bw32lhZQKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI
 DSI to HDMI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: mohit.dsor@oss.qualcomm.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260909-lt9611c-v7-v13-2-aec234483725@oss.qualcomm.com>
References: <20260909-lt9611c-v7-v13-0-aec234483725@oss.qualcomm.com>
 <20260909-lt9611c-v7-v13-2-aec234483725@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:53:57 +0000
Message-Id: <20260909095358.41EBC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Hardware reset causes regmap's page selector cache to become desyn=
chronized, leading to register accesses on the wrong page.
- [Medium] Memory leak of device tree node references on probe error paths.
--

commit 8472ac6fb646e6b178a64a965210c4a862f133a2
Author: Sunyun Yang <syyang@lontium.com>

drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

This commit introduces a new DRM bridge driver for the Lontium=20
LT9611C(EX/UXD) DSI to HDMI chip. It handles chip initialization, EDID=20
reading, firmware upgrading, and audio infoframe setup.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/b=
ridge/lontium-lt9611c.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
[ ... ]
> +static int lt9611c_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D lt9611c_parse_dt(dev, lt9611c, &dsi0_node, &dsi1_node);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to parse device tree\n");
> +
> +	lt9611c->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(lt9611c->reset_gpio)) {
> +		ret =3D PTR_ERR(lt9611c->reset_gpio);
> +		return ret;
> +	}

[Severity: Medium]
Does this error path leak the device tree node references? The call to
lt9611c_parse_dt() acquires remote endpoint nodes for dsi0_node and
dsi1_node, but returning directly here skips dropping those references with
of_node_put(). Should this jump to an error cleanup label instead?

> +
> +	ret =3D lt9611c_regulator_init(lt9611c);
> +	if (ret < 0)
> +		return ret;

[Severity: Medium]
Similarly, could this return statement leak the same device tree node
references from lt9611c_parse_dt() if regulator initialization fails?

[ ... ]
> +static int lt9611c_firmware_upgrade(struct lt9611c *lt9611c)
> +{
[ ... ]
> +	ret =3D lt9611c_write_crc(lt9611c, fw_crc, FW_SIZE - 1);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to write firmware crc\n");
> +		goto out_unlock;
> +	}
> +
> +	lt9611c_reset(lt9611c);
> +	ret =3D lt9611c_upgrade_result(lt9611c, fw_crc);

[Severity: High]
Can this cause regmap's page selector cache to become desynchronized?

The lt9611c_firmware_upgrade() function writes to page 0xe0 earlier, then
lt9611c_reset() toggles the reset GPIO. This reverts the chip's internal
page register to its default (0x00), but the regmap core's internal state
caches the window as still being at 0xe0.

When lt9611c_upgrade_result() immediately attempts to read from 0xe021,
will regmap skip writing the page selector and accidentally read from
page 0x00 instead, causing the upgrade verification to fail?

[ ... ]
> +static int lt9611c_bridge_resume(struct device *dev)
> +{
> +	struct lt9611c *lt9611c =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(lt9611c->supplies), lt9611c->s=
upplies);
> +	if (ret) {
> +		dev_err(lt9611c->dev, "regulator bulk enable failed.\n");
> +		return ret;
> +	}
> +	lt9611c_reset(lt9611c);
> +	enable_irq(lt9611c->client->irq);
> +
> +	return ret;
> +}

[Severity: High]
Does this reset during resume also desynchronize the regmap cache for any
subsequent display setup or HPD detect reads?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-lt9611c-v7=
-v13-0-aec234483725@oss.qualcomm.com?part=3D2
