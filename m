Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA62A430CF8
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782114; cv=none; b=m11IZefTNXA4Cmc05wYnJft1kfTKQj4gPHRww+H4DhoKDghGEl+Jim0ohcJIkz54ptb4A30ybDDxmXWQib7Dxnotr5BHJgZCNxFxbVw3TeXob3S/RfkqdqrVQFw0nKoEXWop+CWvjE3GVC4vKNY3GUhsGN7yTKz4TGjbLcrNMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782114; c=relaxed/simple;
	bh=xf+IehzVdK05mCSmgKVPYfnic/W6DU5sQs7x3Vio4aQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ox4saW1STFAHsR1GIMo+SlHeitBOFSQbNjcApkKqnVGPmqTloTFFpDZBLevXfBueu4ldkGLY3UcwhbVUYtcZmp4z7C5qvTM5xgcOvLzluQevyAEOoqb083q5F5EZpwFTH8iwEnDQ4SZryn72s4Zpr4BuHPveGFkFxBLnP7iGYOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4/qUqS3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4/qUqS3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434FC1F000E9;
	Mon,  3 Aug 2026 18:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785782112;
	bh=a3MzKCBcE7ZduU2vYcI6tawoxtt8UYos5Cf1Iv9xqmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U4/qUqS3edvkl4wuID5JF5cdvbFluCVL4UNMbnKCHCqu/WaC0H0inqZUGpsOvpXcs
	 nUmqXiHaUgE1n7fFllWUhuovYQK7lwKQoAX4/he0YwNTPhQf8uE8Mh2tLinUUnTtVw
	 xiFfP5VFgwseN/ZhLA2w/QBl2LKSBmTkeSe88TY8O0AP56TZ+TuCt/xxr+Ra39TnYV
	 Ul52dXyl++svxwHnSGnf4eYMKzk6mAexJXtr9KtZJFgdhrxOpWhHAZe4vULnlpaY5a
	 MXAmzifKxWV09rBMrHgZ4RR1VOhVemqHoVkCiltgAfR56vT0SgHbwx4HEa0iBguQkd
	 Q77jZbaRDYjuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/22] drm/bridge: synopsys: dw-dp: Register DP AUX
 on bridge attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-1-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
 <20260803-synopsys-dw-dp-improvements-v9-1-2e6e46135312@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 18:35:11 +0000
Message-Id: <20260803183512.434FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Moving `drm_dp_aux_unregister()` to the bridge `detach` callback d=
efers it to the DRM device lifecycle, causing a Use-After-Free when the phy=
sical device is unbound.

Pre-existing issues:
- [High] Missing `reinit_completion()` before starting an AUX transfer can =
cause subsequent transfers to falsely complete after a timeout.
- [High] Using `devm_*` allocations in the component bind callback causes r=
esource leaks and prevents successful rebinding.
- [High] The driver schedules `hpd_work` but never cancels it during unbind=
 or device removal, leading to a Use-After-Free.
--

--- Patch [1]: [PATCH v9 01/22] drm/bridge: synopsys: dw-dp: Register DP AU=
X on bridge attach ---
commit cf33bafacfb642286c8ee7eb20855f566f32f630
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: drm/bridge: synopsys: dw-dp: Register DP AUX on bridge attach

This commit moves the registration and unregistration of the DP AUX device
from the bind/unbind phases to the bridge attach/detach phases. This ensures
that the AUX device is only accessed when the DRM device is ready.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1813,7 +1813,36 @@ static struct drm_bridge_state *dw_dp_bridge_atomi=
c_duplicate_state(struct drm_b
>  	return &state->base;
>  }
> =20
> +static int dw_dp_bridge_attach(struct drm_bridge *bridge,
> +			       struct drm_encoder *encoder,
> +			       enum drm_bridge_attach_flags flags)
> +{
> +	struct dw_dp *dp =3D bridge_to_dp(bridge);
> +	struct device *dev =3D dp->dev;
> +	int ret;
> +
> +	dp->aux.dev =3D dev;
> +	dp->aux.drm_dev =3D encoder->dev;
> +	dp->aux.name =3D dev_name(dev);
> +	dp->aux.transfer =3D dw_dp_aux_transfer;

[Severity: High]
This is a pre-existing issue, but does dw_dp_aux_transfer() incorrectly
handle completions?

Looking at dw_dp_aux_transfer(), the code waits for a completion without
clearing any previously pending completion state:

    status =3D wait_for_completion_timeout(&dp->complete, timeout);

If a previous hardware timeout occurred (returning 0), and the hardware lat=
er
finishes the transfer, the interrupt handler will call complete(&dp->comple=
te).

Because reinit_completion() is not called before the next transfer, the
subsequent wait_for_completion_timeout() could instantly consume the leftov=
er
completion and return true without waiting, reading stale or invalid status
from the hardware.

> +
> +	ret =3D drm_dp_aux_register(&dp->aux);
> +	if (ret)
> +		dev_err(dev, "Aux register failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void dw_dp_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct dw_dp *dp =3D bridge_to_dp(bridge);
> +
> +	drm_dp_aux_unregister(&dp->aux);
> +}

[Severity: High]
Could deferring drm_dp_aux_unregister() to the DRM device lifecycle lead to=
 a
use-after-free when the physical device is unbound?

If a userspace process keeps the DRM device FD open, the DRM device remains
active even after the DW-DP physical device is unbound via sysfs. This trig=
gers
devres to run for the unbound physical device, freeing dp->regmap and disab=
ling
clocks.

Because drm_dp_aux_unregister() was moved to dw_dp_bridge_detach(), the AUX
device remains registered. If a userspace process initiates an I2C/AUX tran=
sfer
on the still-registered device node, it will call dw_dp_aux_transfer() which
dereferences the freed dp->regmap.

[ ... ]
> @@ -2065,37 +2084,33 @@ struct dw_dp *dw_dp_bind(struct device *dev, stru=
ct drm_encoder *encoder,
[ ... ]
>  	ret =3D devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
>  					IRQF_ONESHOT, dev_name(dev), dp);

[Severity: High]
This is a pre-existing issue, but does using devm_request_threaded_irq() in=
 the
component bind callback cause resource leaks and prevent successful rebindi=
ng?

Component bind callbacks run when the master DRM device is bound. If the DRM
master is unbound, dw_dp_unbind() is called, but devres does not run because
the component platform device itself wasn't removed.

When the DRM master is bound again, dw_dp_bind() will run and attempt to
request the same exclusive IRQ, which may fail with -EBUSY and leak the pri=
or
allocations, preventing the display pipeline from functioning.

>  	if (ret) {
>  		dev_err_probe(dev, ret, "failed to request irq\n");
> -		goto unregister_aux;
> +		return ERR_PTR(ret);
>  	}
> =20
>  	return dp;
> -
> -unregister_aux:
> -	drm_dp_aux_unregister(&dp->aux);
> -	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(dw_dp_bind);
> =20
>  void dw_dp_unbind(struct dw_dp *dp)
>  {
> -	drm_dp_aux_unregister(&dp->aux);
> +	/* nothing to do */
>  }

[Severity: High]
This is a pre-existing issue, but does dw_dp_unbind() need to call
cancel_work_sync(&dp->hpd_work) before the component is unbound?

The interrupt handler schedules dp->hpd_work. If an HPD interrupt fires rig=
ht
before the IRQ is disabled by devres or during component unbind, the work is
queued.

When devres frees dp->regmap, and dw_dp_hpd_work() eventually executes, it
calls dw_dp_hpd_detect() which accesses the freed dp->regmap, resulting in a
use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-synopsys-d=
w-dp-improvements-v9-0-2e6e46135312@collabora.com?part=3D1
