Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9015429006
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107697; cv=none; b=SyUqwKHnhJj+PV1srs02Rcz2ZWInvloPV8L6dqD3BJ9jtLiEqoDWgxZr/T+6Kd4MeQIn5+aPftwfH3gCQItvyMNvvEpBASVezNThbD9Pk8LZm9ZjZaNxfUPFYmb71wUr3LLJu5EMtRBQqBS2CKeZ0lsT+Rw+6PvDG0vhUQTSvm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107697; c=relaxed/simple;
	bh=NeLDy1LoEcFcvuKG8lCJ0hL1LcfH7UnH2GRQgAXONvc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s+DIMplobgffrEj7PZLek2t5oKkaYjSCOGU0T7rll2QWhdcHwi/TEfpUI+pRJKhZhmuvuL/V9eB9ZD2EoE2bIxtLbFm4WOlVpHqBOSrJMPiey/UvCPIL7s8L4f7717HC0zzLuUILd6gigC73I+/QibJx+5J4lxct4L9pvwIUPXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+8Npi80; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+8Npi80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C6C1F00A3A;
	Wed, 15 Jul 2026 09:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784107694;
	bh=smN/Lqni7jaNLO7IFxtEISuG+LWdR4uMYQ7uEPXp3H0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U+8Npi80uArm31INJmgMIDK/OIA5ObNt56D7g2TgcGzXTd8XjY4F2FQQiSSzZeZV5
	 SL3jBH52BVqCh6Jo36jm4/7VI/ur2xRebZXcbiZimeRPwpbs4bNIUHP+r3aJvD1WTX
	 wJE9reyDqOi3UHZFYoq20JHtk8zIZVXxunkqqkcxgpA6PdrQCqHOlL+R/O1H4eaFx8
	 mz7sRTIWsRbRssPC35y2SzNeDgWmERPOcSz9IX7GmMzwu/ddCAcnHxjxCjz3aWNRKJ
	 1EVvdmYRJmmoz0g9lSCEQlnLZo38/loqsimXsQ7RJ/PFEZRHiW6c6lEg/1GJLYple1
	 vfrz/cwuuT72Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715085348.3457359-11-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-11-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:28:13 +0000
Message-Id: <20260715092814.21C6C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Concurrent sysfs `disable` read or write can dereference an `ERR_P=
TR` if `usb_hub_port_pwrseq_get()` fails.
- [High] usb_hub_set_port_power() accesses the dynamically allocated hub->p=
orts array, which can be freed concurrently by hub_disconnect().
--

--- Patch [10]: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key con=
nectors with power sequencing API ---
commit e0346a1be7fb5d1254f3498bb6d857dd5db5a9d7
Author: Chen-Yu Tsai <wenst@chromium.org>
Subject: usb: hub: Power on connected M.2 E-key connectors with power seque=
ncing API

This patch integrates the power sequencing API with USB ports to support M.2
E-key connectors. It manages power sequencing during port creation, removal,
and power state changes.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 10f15b40fcc55..298fb68c6afc7 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c

[ ... ]

> @@ -887,15 +898,22 @@ int usb_hub_set_port_power(struct usb_device *hdev,=
 struct usb_hub *hub,
>  			   int port1, bool set)
>  {
> +	struct usb_port *pwrseq_port =3D hub->ports[port1 - 1];

[Severity: High]
Can this code trigger a use-after-free on the hub->ports array?

The sysfs disable_store callback uses sysfs_break_active_protection()
to avoid deadlocks, meaning it prevents device_unregister() from waiting
for the callback to finish.

If hub_probe() fails and triggers hub_disconnect() concurrently,
hub_disconnect() will call device_unregister() which returns immediately.
Then hub_disconnect() unconditionally frees the hub->ports array:

hub_disconnect() {
    ...
    kfree(hub->ports);
}

Meanwhile, disable_store() can continue and call usb_hub_set_port_power(),
which now accesses the freed hub->ports array. Prior to this change,
usb_hub_set_port_power() only accessed inline fields of the refcounted
hub struct.

Is there a way to safely access the port here without racing against the ar=
ray
being freed?

> +	int ret;
> =20
> +	ret =3D usb_hub_set_port_pwrseq(pwrseq_port, set);
> +	if (ret)
> +		return ret;

[ ... ]

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index 19913ad3598b3..430fc90232502 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c

[ ... ]

> @@ -831,6 +879,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, =
int port1)
>  		goto err_put_kn;
>  	}
> =20
> +	port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> +	if (IS_ERR(port_dev->pwrseq)) {
> +		retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port_dev->pwrseq),
> +				       "failed to get power sequencing descriptor\n");
> +		goto err_put_kn;
> +	}

[Severity: High]
Could this temporarily expose an ERR_PTR to concurrent sysfs operations?

The port device is registered earlier in this function via device_register(=
),
exposing its sysfs attributes (like disable) before usb_hub_port_pwrseq_get=
()
is called.

If acquiring the power sequencer fails and returns an ERR_PTR,
port_dev->pwrseq will hold this ERR_PTR. Because sysfs unregistration waits
for active callbacks on the error path, a concurrent read or write to the
disable attribute could access port_dev->pwrseq while it holds an error val=
ue.

This ERR_PTR would then be passed to usb_port_is_power_on() or
usb_hub_set_port_pwrseq(), which call the power sequencer APIs:

static int usb_hub_set_port_pwrseq(struct usb_port *port, bool on)
{
    if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
        return 0;
       =20
    if (on)
        return pwrseq_power_on(port->pwrseq);
    return pwrseq_power_off(port->pwrseq);
}

Since the pwrseq_power_* APIs do not check for ERR_PTR, would this cause
a panic when dereferencing the pointer?

> +
>  	retval =3D component_add(&port_dev->dev, &connector_ops);
>  	if (retval) {
>  		dev_warn(&port_dev->dev, "failed to add component\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.3457=
359-1-wenst@chromium.org?part=3D10
