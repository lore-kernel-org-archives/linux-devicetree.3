Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7333B39FCDB
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 23:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779231617; cv=none; b=D5FTxPBGkG9t8UH7d0DnVNJgR8mO4hz7zNB6YFgiH63DBO43KU/ZYOFpciShhikzTaBtrUtaxb6NPnq1fhoI+HhMXLVthAGBeKXC2oaBaHs1IGpiN39+1NwC/6DjLvIqz4My58cIJqFs34p2gLNQqyaMZyt5vEOTDAEGUJB8o64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779231617; c=relaxed/simple;
	bh=Ic2MPoUy5m+FioBJrynEk7JdNd7QQPQS2i50U846zy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u7q/fbp0d9TtSJRaBP9r6EjZ2KdPmZsh3YXRU3d3i0GfE+IV9eeT9LoZJVnWdluS3vLVHnVK7kO0AQ6iOnt+EAKQ3W6DRX/eT9kHipKQ9QqS6iyh1stpGRLJGkxBdokv/knGNHTXsxwPilGa1YH+PEZ4x1nXQw0lbmiNDcJ1yN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpSgrxOo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpSgrxOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0931F000E9;
	Tue, 19 May 2026 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779231616;
	bh=YmM3XwyHazND+BCInvEDa/1tOfkJMuOOBR4STfoOEXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LpSgrxOo8bDvTdX3u47q9/+lHhqFVm/BzI/xHHxC0N5kRnuMMRP/u1Ioc4Hgh9ZAI
	 hhlSFyFdTSIjwq60FaDrzYPvx5flqD0v9FMRXKeM3FuogmCgauy2XpDSOIRVAA4KAs
	 VT8iukyc4Gdc/xzBBU3BXP94vkhQMlAOXZejyhVsEo8ww0LYO6TbFIAxdKC/EyXuas
	 YBtzfIaDvfv8662MWW+11TTfKyvf4nxoJWVX8IVlhNX9zIgScoqAjVH98ZNMOhBc5+
	 eFUYYYfx18cocC+JilHFynebB56n93yxLcmH2NJwPy2HoYbst1GQRuH53r2NBLPCJo
	 3dik7n1V+b5PQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] thermal/drivers: airoha: Generalize probe
 function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519222433.29684-3-ansuelsmth@gmail.com>
References: <20260519222433.29684-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 23:00:15 +0000
Message-Id: <20260519230015.9F0931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing NULL check for the return value of `device_get_match_data(=
)`.

Pre-existing issues:
- [High] Interrupt is requested before the thermal zone is registered, caus=
ing race conditions and Use-After-Free bugs.
- [High] Copy-paste error in low temperature trip point configuration ignor=
es the 'low' threshold.
--

commit a38ed836df3f9fc5933d52a5c494cc5a3efc0f91
Author: Christian Marangi <ansuelsmth@gmail.com>

thermal/drivers: airoha: Generalize probe function

In preparation for support of Airoha AN7583, this commit generalizes the pr=
obe
function to address differences between the two SoCs. It implements a match=
_data
struct to define specific probe, post_probe, thermal ops, and pllrg protect
values.

> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_th=
ermal.c
> index 01ed49a4887e1..864a01fd8fd80 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c
[ ... ]
> @@ -253,7 +265,7 @@ static int airoha_thermal_get_temp(struct thermal_zon=
e_device *tz, int *temp)
>  	return 0;
>  }
> =20
> -static int airoha_thermal_set_trips(struct thermal_zone_device *tz, int =
low,
> +static int en7581_thermal_set_trips(struct thermal_zone_device *tz, int =
low,
>  				    int high)
>  {

[Severity: High]
This is a pre-existing issue, but is there a copy-paste error in the trip
configuration logic below this point?

Looking at en7581_thermal_set_trips(), the low temperature limit appears to
incorrectly use the high threshold parameter:

	if (low !=3D -INT_MAX) {
		/* Validate low and clamp it to a supported value */
		low =3D clamp_t(int, high, RAW_TO_TEMP(priv, 0),
			      RAW_TO_TEMP(priv, FIELD_MAX(EN7581_DOUT_TADC_MASK)));

		/* We offset the low temp of 1=C2=B0C to trigger correct event */
		regmap_write(priv->map, EN7581_TEMPOFFSETL,
			     TEMP_TO_RAW(priv, high) >> 4);

Will this misconfigure the hardware by applying the high threshold to the
low threshold register, potentially triggering a continuous interrupt storm
for the LOFSINTSTS0 event at normal temperatures?

[ ... ]
> @@ -454,18 +462,55 @@ static int airoha_thermal_probe(struct platform_dev=
ice *pdev)
>  		return irq;
> =20
>  	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> -					airoha_thermal_irq, IRQF_ONESHOT,
> +					en7581_thermal_irq, IRQF_ONESHOT,
>  					pdev->name, priv);
>  	if (ret) {

[Severity: High]
This is a pre-existing issue, but does this request the IRQ too early?

The interrupt is requested via devm_request_threaded_irq() before priv->tz =
is
initialized by devm_thermal_of_zone_register() later in probe.

If an interrupt is already pending from the bootloader, won't the handler r=
un
immediately and dereference a NULL priv->tz?

Also, on driver unbind, devres tears down in reverse order. The thermal zone
will be unregistered and freed, but the IRQ remains active since there's no
remove function to mask it at the hardware level. Could this lead to a
use-after-free if an interrupt triggers during this window?

[ ... ]
> +static int airoha_thermal_probe(struct platform_device *pdev)
> +{
> +	const struct airoha_thermal_soc_data *soc_data;
> +	struct airoha_thermal_priv *priv;
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	soc_data =3D device_get_match_data(dev);
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->pllrg_protect =3D soc_data->pllrg_protect;

[Severity: High]
Can soc_data be NULL here?

If the driver is bound to a device without matching OF data (such as a
manually instantiated platform device matching by name), device_get_match_d=
ata()
will return NULL.

Could this result in a NULL pointer dereference when accessing
soc_data->pllrg_protect?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519222433.2968=
4-1-ansuelsmth@gmail.com?part=3D2
