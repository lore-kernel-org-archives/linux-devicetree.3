Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5523FF1
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048871; cv=none; b=uJjcjIeWsnt4Vs9+HwCqO2MXUdKf5w9/rg+NwyI/eEBc7DekA1KUXismhgY9rxF+zZBBmmIQID3S3z9T5dbzy1UV+7Vnw8xK2KuMY9sL9Kz245Bi9GkyZss7MSz0NIcsYDazwC/yjSVQ105CWbcyMEYSJFjcCXWz6XAbVSkD0eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048871; c=relaxed/simple;
	bh=P5uukX47faXQJWLE5HdB4i7LfM5IFKJ5AQgwFn6uCtc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DFzzZ/fdE3cr6EgCDe/i/rEeCq+ikr3/3eUBGBb6gPhfyCFs9Q75Mghq/nYAt02agnWlefn5hg9BEdaTia6gK+j8EOhS4bbdbO2B9hMjSw4a/u4YB4tmYc+CotJcGPFN81ZfFY/PGyG9X9G/vuyZCaC5aZ50OBEd2GFIjQRqrxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkPV/ofx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkPV/ofx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84571F00893;
	Fri, 29 May 2026 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780048869;
	bh=bw7tYWjBOyXT6mGiOhvtF8kUP4jZXCP8kwzKVdSc5Jk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LkPV/ofxAHNZI7glRwpdtelo6W+GcoZtnAmaR9K/KrKhpirXScagrc8KdYNUTZnap
	 8PrE6dn9u7/5vCC0vzRzEKY2Qmg1+Vac/mq6sxh2oEjNiq0XN/qVyHAfkaBXL20fzz
	 jtevYGOh43dFHVSs29NfOH/b77+r0D6zKcD4xGRXEZoHZX+OAXSdRtKKik1Wz+eY79
	 ahHiBXhp6ovidI8a2jwwiMXpMQvGxJrhDjnBEj9Tsje9lgNAxKPzCyKqIGzbE802yn
	 tPvvwuvNC7r/80gB36iNoOpjSOlYw5Ozcb1o6RxePIjibZOFdgIv+HIorUbC9llzjU
	 OPuTZII+ZMXRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/15] drm/tidss: oldi: Convert OLDI to an aux driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-beagley-ai-display-v3-12-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-12-7fefdc5d1adf@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 10:01:09 +0000
Message-Id: <20260529100109.A84571F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Hardware is left powered on due to cancellation of asynchronous su=
spend during device removal.
- [High] The auxiliary driver can be unbound via sysfs, freeing the DRM bri=
dge while it is still attached.
- [High] `device_link_add()` fails unconditionally because the consumer dev=
ice is not yet registered.
- [High] Ignoring `pm_runtime_get_sync()` failure leads to unsafe hardware =
access on unpowered registers.
- [Medium] Device tree node reference leak when `auxiliary_device_init()` f=
ails.
- [Medium] Missing `pm_runtime_mark_last_busy()` before `pm_runtime_put_aut=
osuspend()` causes immediate suspend.

Pre-existing issues:
- [High] Out-of-bounds write to `tidss->oldis` array due to missing bounds =
check.
--

commit 73c9b05b12dc4ef6e124725962ba5094aea8a043
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Fri May 29 08:45:42 2026 +0000

drm/tidss: oldi: Convert OLDI to an aux driver

This patch converts the OLDI components from child devices parsed directly=
=20
by tidss into auxiliary devices with their own auxiliary driver. This=20
allows the driver framework to automatically manage the power domains=20
associated with the OLDI nodes.

> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/t=
idss_oldi.c
> index e925ddaa4fd6a..188f31b57c6a2 100644
> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c

[ ... ]

> @@ -251,6 +259,8 @@ static void tidss_oldi_atomic_pre_enable(struct drm_b=
ridge *bridge,
>  	if (oldi->link_type =3D=3D OLDI_MODE_SECONDARY_CLONE_SINGLE_LINK)
>  		return;
> =20
> +	WARN_ON(pm_runtime_get_sync(oldi->dev) < 0);
> +

[Severity: High]
If pm_runtime_get_sync() fails and returns a negative error code, does this=
=20
code continue without returning?

Proceeding to access hardware registers via tidss_oldi_config() on an=20
unclocked or unpowered domain can cause bus timeouts or synchronous=20
external aborts.

>  	connector =3D drm_atomic_get_new_connector_for_encoder(state,
>  							     bridge->encoder);
>  	if (WARN_ON(!connector))

[ ... ]

> @@ -296,6 +306,8 @@ static void tidss_oldi_atomic_post_disable(struct drm=
_bridge *bridge,
> =20
>  	/* Clear OLDI Config */
>  	tidss_disable_oldi(oldi->tidss, oldi->parent_vp);
> +
> +	pm_runtime_put_autosuspend(oldi->dev);
>  }

[Severity: Medium]
Is pm_runtime_mark_last_busy() missing before the call to=20
pm_runtime_put_autosuspend()?

Without updating the device's last busy timestamp, the PM core's autosuspen=
d=20
timer might see the time elapsed as greater than the 500ms delay and suspen=
d=20
the device immediately, bypassing the autosuspend window.

> =20
>  #define MAX_INPUT_SEL_FORMATS	1

[ ... ]

> +static void tidss_oldi_remove(struct auxiliary_device *auxdev)
> +{
> +	struct tidss_oldi *oldi =3D auxiliary_get_drvdata(auxdev);
> +	struct tidss_device *tidss =3D oldi->tidss;
> +	struct device *dev =3D &auxdev->dev;
> =20
> -	tidss->num_oldis =3D 0;
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);

[Severity: High]
Does this leave the hardware powered on during unbind?

During driver unbind, tidss_remove() shuts down the display by calling=20
drm_atomic_helper_shutdown(), which invokes tidss_oldi_atomic_post_disable(=
)=20
and schedules an asynchronous suspend via pm_runtime_put_autosuspend().=20

Immediately afterward, tidss_remove() triggers tidss_oldi_remove(), which=20
calls pm_runtime_disable() here. The PM subsystem cancels pending=20
asynchronous suspend work when pm_runtime_disable() is called, leaving the=
=20
device indefinitely in the active state.

Would it be safer to flush the suspend work or use pm_runtime_put_sync()=20
during shutdown?

> +
> +	if (oldi->link_type !=3D OLDI_MODE_SECONDARY_DUAL_LINK) {
> +		drm_bridge_remove(&oldi->bridge);
> +
> +		tidss->is_ext_vp_clk[oldi->parent_vp] =3D false;
> +	}
> +
> +	clk_put(oldi->serial);
> +}
> +
> +static const struct auxiliary_device_id tidss_oldi_aux_id_table[] =3D {
> +	{ .name =3D "tidss.oldi" },
> +	{}
> +};
> +
> +static struct auxiliary_driver oldi_aux_driver =3D {
> +	.name =3D "oldi",
> +	.probe =3D tidss_oldi_probe,
> +	.remove =3D tidss_oldi_remove,
> +	.id_table =3D tidss_oldi_aux_id_table,
> +};

[Severity: High]
Can userspace independently unbind the auxiliary driver via sysfs and cause=
=20
a use-after-free?

Unlike the main tidss driver, this auxiliary driver does not set=20
suppress_bind_attrs =3D true on its driver struct. Unbinding the device thr=
ough=20
sysfs would trigger devres cleanup, freeing the struct tidss_oldi and the=20
embedded drm_bridge.

Because the main tidss DRM device remains active, the KMS pipeline would=20
retain pointers to the freed bridge, leading to memory corruption on the=20
next atomic commit or teardown.

> +
> +static void tidss_oldi_aux_device_release(struct device *dev)
> +{

[ ... ]

> +	/*
> +	 * Create a device-link between the primary and the secondary, so that
> +	 * the secondary will be powered on when the primary is used.
> +	 */
> +	if (companion_auxdev) {
> +		link =3D device_link_add(&auxdev->dev, &companion_auxdev->dev,
> +				       DL_FLAG_PM_RUNTIME |
> +					       DL_FLAG_AUTOREMOVE_CONSUMER |
> +					       DL_FLAG_AUTOREMOVE_SUPPLIER);

[Severity: High]
Does this device_link_add() call unconditionally fail because the consumer=
=20
device is not yet registered?

The device link core requires the consumer device to be registered with=20
sysfs when the DL_FLAG_AUTOREMOVE_CONSUMER flag is used. At this point,=20
auxdev has only been initialized via auxiliary_device_init(), and=20
auxiliary_device_add() is not called until later in this function.

This would cause device_link_add() to return NULL, breaking dual-link OLDI=
=20
setups.

> +		if (!link) {
> +			dev_err(tidss->dev,
> +				"device_link_add failed between primary and secondary OLDI\n");
> +			ret =3D -EINVAL;
> +			goto err_uninit_auxdev;
>  		}
> +	}
> =20
> -		oldi->parent_vp =3D parent_vp;
> -		oldi->oldi_instance =3D oldi_instance;
> -		oldi->companion_instance =3D companion_instance;
> -		oldi->link_type =3D link_type;
> -		oldi->dev =3D tidss->dev;
> -		oldi->next_bridge =3D bridge;
> +	ret =3D auxiliary_device_add(auxdev);
> +	if (ret) {
> +		dev_err(tidss->dev, "OLDI auxiliary_device_add failed: %d\n",
> +			ret);
> +		goto err_link_del;
> +	}
> =20
> -		/*
> -		 * Only the primary OLDI needs to reference the io-ctrl system
> -		 * registers, and the serial clock.
> -		 * We don't require a check for secondary OLDI in dual-link mode
> -		 * because the driver will not create a drm_bridge instance.
> -		 * But the driver will need to create a drm_bridge instance,
> -		 * for secondary OLDI in clone mode (once it is supported).
> -		 */
> -		if (link_type !=3D OLDI_MODE_SECONDARY_CLONE_SINGLE_LINK) {
> -			oldi->io_ctrl =3D syscon_regmap_lookup_by_phandle(child,
> -									"ti,oldi-io-ctrl");
> -			if (IS_ERR(oldi->io_ctrl)) {
> -				ret =3D dev_err_probe(oldi->dev, PTR_ERR(oldi->io_ctrl),
> -						    "OLDI%u: syscon_regmap_lookup_by_phandle failed.\n",
> -						    oldi_instance);
> -				goto err_put_node;
> -			}
> +	tidss->oldis[tidss->num_oldis++] =3D auxdev;

[Severity: High]
This is a pre-existing issue, but can this cause an out-of-bounds write to=
=20
the tidss->oldis array?

The oldis array in struct tidss_device has a fixed size of=20
TIDSS_MAX_OLDI_TXES (2). The devices are appended here without a bounds=20
check. If a malformed device tree provides more than two OLDI transmitter=20
nodes, this could overwrite adjacent members like irq and irq_lock.

> =20
> -		/* Register the bridge. */
> -		oldi->bridge.of_node =3D child;
> -		oldi->bridge.driver_private =3D oldi;
> +	return auxdev;
> =20
> -		tidss->oldis[tidss->num_oldis++] =3D oldi;
> -		tidss->is_ext_vp_clk[oldi->parent_vp] =3D true;
> -		oldi->tidss =3D tidss;
> +err_link_del:
> +	if (link)
> +		device_link_del(link);
> +err_uninit_auxdev:
> +	auxiliary_device_uninit(auxdev);
> +	/* return here, as the rest are done in auxdev's release */
> +	return ERR_PTR(ret);
> =20
> -		drm_bridge_add(&oldi->bridge);
> +err_free_auxdev:
> +	kfree(auxdev);
> +err_free_pdata:
> +	kfree(oldi_pdata);
> +err_free_ida:
> +	ida_free(&tidss_oldi_ida, oldi_aux_id);
> =20
> -	of_node_put(child);
> -	of_node_put(oldi_parent);
> +	return ERR_PTR(ret);
> +}

[Severity: Medium]
Does this error path leak the OF node reference?

Earlier in this function, an OF node reference is explicitly acquired and=20
assigned to auxdev->dev.of_node:

    .of_node =3D of_node_get(oldi_tx),

If auxiliary_device_init(auxdev) fails, the err_free_auxdev path frees the=
=20
auxdev structure but does not call of_node_put(), permanently leaking the=20
reference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-beagley-ai=
-display-v3-0-7fefdc5d1adf@ideasonboard.com?part=3D12
