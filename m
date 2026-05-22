Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4EF30674A
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779417130; cv=none; b=DyEggvuyxWOR9vYMMV+MAzKuDF+xvUmE9Ch0hu6jcvddQ3jdZ93OAHhbOYl8Plkxmvc6VjdQzMAUiMHnSYPHVNDUKvOe5o4jRhVpGqivRhRZStkxZiitFY3RzrJyGorRqBJdlCxfaoVSBHkwYWA35Es96hnY6HdAfjZm4AQfMsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779417130; c=relaxed/simple;
	bh=kY5ae+oCn7wA48Xv09F3vk69t1L7r2z7/yFNfHkmnGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ln4ucp8kNtOKNj+GaJMa7bNV3n738C+psmbydGhdl1xY7mMQI6Yz1ut79mj4P13REIrQhYnS5aWkAYYbCWmrShoX2ED+CA5mtKjMMCOTmUTXreNRKDF/KOtbBfiLaLIAdAwnOAHWYNeuBrTs32Id4Blww1tOnaodVyezF6ZyyIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmc6JZlZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmc6JZlZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DCA1F000E9;
	Fri, 22 May 2026 02:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779417128;
	bh=NMPJlrwQy61FQ0m4JDz7nsx21k3oZ2XJbA1d8XJVSfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fmc6JZlZhFJWLd5OL/OR/XGFpjnrona5Th3/zBvHJs5hPapZCwuzhz5Lhml7LRUWD
	 pa42rVp25wO5YU/4NR/zNbmiT0dqTI/S5PK78VQhEPSh/cVwGwac1R5+AOtmPDb6Ei
	 Ir6kwqdz/aQ8Sb6x6nFN3Z5Vvtzx1/2ciegvS5o0dCGEsBgmWWbfcznPYPtb83V+N1
	 K4gvLQ6XEht/IqG2mS4mkiRhS4PuljmQmBjNP/OkyKn4XxjI9JEBYglpHg+wRGzibO
	 p28VaExq458O8WZ+6jP7jbjzJgoCSB/6pnsqdX/rtAIWB7SVa+S4gy9Rxt2Mb1dwNM
	 UT9h8y9aP57Bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: syyang@lontium.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260522015735.2833-3-syyang@lontium.com>
References: <20260522015735.2833-3-syyang@lontium.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 02:32:07 +0000
Message-Id: <20260522023208.31DCA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing drm_panel_bridge_remove() in lt7911exc_dsi_host_detach() c=
auses bridge list corruption and Use-After-Free.
- [Medium] The fast `ocm_lock` is held during a 420ms hardware reset sequen=
ce, causing severe latency stalls for concurrent DRM and DSI operations.
--

commit 7a7cfdfb50c450205bc811aedab79e9db1683754
Author: Sunyun Yang <syyang@lontium.com>

drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge

Add support for the Lontium LT7911EXC bridge chip, which converts
eDP input to MIPI DSI output using an internal firmware-controlled
pipeline.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm=
/bridge/lontium-lt7911exc.c
> new file mode 100644
> index 0000000000000..1aec60f02f913
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
[ ... ]
> +static void lt7911exc_firmware_upgrade_work(struct work_struct *work)
> +{
> +	struct lt7911exc *lt7911exc =3D container_of(work, struct lt7911exc, wo=
rk);
> +	struct device *dev =3D lt7911exc->dev;
[ ... ]
> +	mutex_lock(&lt7911exc->upgrade_lock);
> +
> +	mutex_lock(&lt7911exc->ocm_lock);
> +	lt7911exc_reset(lt7911exc);

[Severity: Medium]
Since lt7911exc_reset() sleeps for 420ms (due to msleep calls), does holding
the fast ocm_lock here unnecessarily stall concurrent DRM and DSI operation=
s?

It looks like the upgrade_lock already serializes firmware upgrades. Can the
ocm_lock be acquired after the reset sequence?

> +	lt7911exc_hw_mcu_halt(lt7911exc);
> +	mutex_unlock(&lt7911exc->ocm_lock);
> +
> +	ret =3D lt7911exc_block_erase(lt7911exc);
[ ... ]
> +	ret =3D lt7911exc_write_crc(lt7911exc, crc32, FW_SIZE - 4);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to write firmware crc\n");
> +		goto out_unlock;
> +	}
> +
> +	mutex_lock(&lt7911exc->ocm_lock);
> +	lt7911exc_reset(lt7911exc);

[Severity: Medium]
Similarly, does holding the ocm_lock during this second reset sequence cause
severe latency stalls for other display operations?

> +	mutex_unlock(&lt7911exc->ocm_lock);
> +
> +	ret =3D lt7911exc_upgrade_result(lt7911exc, crc32);
[ ... ]
> +static int lt7911exc_dsi_host_detach(struct mipi_dsi_host *host, struct =
mipi_dsi_device *dev)
> +{
> +	struct lt7911exc *lt7911exc =3D dsi_host_to_lt7911exc(host);
> +
> +	if (!lt7911exc->output.dev)
> +		return 0;
> +
> +	lt7911exc->output.dev =3D NULL;

[Severity: High]
Should drm_panel_bridge_remove() be called here?

When the panel is unbound, its device is destroyed and the devres cleanup
frees the bridge memory. If the bridge isn't properly removed here, the fre=
ed
bridge remains linked in the global DRM bridge_list, potentially causing a
use-after-free on subsequent list traversals.

> +
> +	return 0;
> +}
[ ... ]
> +static void lt7911exc_remove(struct i2c_client *client)
> +{
> +	struct lt7911exc *lt7911exc =3D i2c_get_clientdata(client);
[ ... ]
> +	mipi_dsi_host_unregister(&lt7911exc->dsi_host);
> +	drm_bridge_remove(&lt7911exc->bridge);
> +
> +	if (lt7911exc->output.panel && lt7911exc->output.bridge)
> +		drm_panel_bridge_remove(lt7911exc->output.bridge);

[Severity: High]
Can this dereference a freed pointer?

Since mipi_dsi_host_unregister() triggers panel detachment, and
lt7911exc_dsi_host_detach() doesn't remove the panel bridge, the bridge mem=
ory
could be freed during the detachment. Calling drm_panel_bridge_remove() here
would then lead to a use-after-free.

> +
> +	gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522015735.2833=
-1-syyang@lontium.com?part=3D2
