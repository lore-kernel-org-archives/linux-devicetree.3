Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED2D30FF30
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781643; cv=none; b=gyWIWozM87P9MsZwHf+MYGxLh8XQoubJho1MGNZ+ffZG2tyX7IT+GLMg0k52FuTfkvKjchOObjyk0sveGh5Ya/5TsMXR50f0szQzc9b29ZIt00Q5rcO66Pe7AEjgBWUsG6260QRYeRzNQGugkASzBFjLxXOIsVrz6lbbCCxKzjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781643; c=relaxed/simple;
	bh=OLwbuzjQTHwm5L4TBGEdOdpVchbnJmhZ3A0pf+Jvz7s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fHYambA7Tw/3JG0hlJLQFrgLG+OseM3/G+/MsHiG2rQS9AmJvkyrDIS1RwMywF8Idc2/dmn+OP4vIqcpZxKSfIrFIODPtFfDunQnSUURPXFKqYhpFVgicS5XOBc5vkvheT7uZ8txg4jbALNp0Psqa1SE1CVXQeEcYmwSM4mcTPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0vrXOcW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0vrXOcW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284A11F00A3A;
	Mon,  3 Aug 2026 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785781641;
	bh=cagmjcCnugkZqel+yCa4eKiX2O2nCPdhL7kDhUmszqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D0vrXOcWiHlCUOKsutcHnX1dhfaAWF/Fa+m4BWB76M+CAQ77lEyZFua+DnsYW70+e
	 j1CxW+WpbMQZ66L72VW08RW4ZRNlL50jxmdwIS2tgNwNUYRrKKR9Fp0JNy/v6Vqoql
	 ekcF8wk4qWB8Jm3O7qxu/8vega4Mz91A/mJ/xedi6Rdes74vSrgC+/F38taDLISQtL
	 2jsqkrLUNw9kStheO69K22g67UMErPKoQeH9xHwkYf1RzXOtBIMbHP/JfWyZWq2sev
	 95GnxhGqi1bowVl+NflCOhNvhLX+RL9qGtVjcKFQkRxsZ+jjjGGWikJ+CIck+iqYBa
	 27sR2eBjU21aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 02/22] drm/bridge: synopsys: dw-dp: Fix incorrect
 resource lifetimes in bind callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-2-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
 <20260803-synopsys-dw-dp-improvements-v9-2-2e6e46135312@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 18:27:20 +0000
Message-Id: <20260803182721.284A11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `cancel_work_sync(&dp->hpd_work)` causes a use-after-free =
of `dp` on driver removal.
- [High] Lockless TOCTOU check of `dp->bridge.dev` in `dw_dp_hpd_work` caus=
es Use-After-Free or NULL pointer dereference on unbind.
- [High] Unhandled interrupt sources in `dw_dp_irq()` can lead to an interr=
upt storm.
- [High] Sleeping functions are called from an atomic context path (`atomic=
_disable`).
--

--- Patch [2]: [PATCH v9 02/22] drm/bridge: synopsys: dw-dp: Fix incorrect =
resource lifetimes in bind callback ---
commit 639a2b7137e1fc5209a35b30731a14a632ba6684
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: drm/bridge: synopsys: dw-dp: Fix incorrect resource lifetimes in b=
ind callback
   =20
Currently the Synopsys DesignWare DP controller driver's bind function
requests lots of resources using device managed functions. These are
free'd on driver removal instead of at unbind time. Fix this discrepancy
by introducing a new probe helper function and moving over the whole
bind function. This results in a fully functional DRM bridge once probe
succeeded.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 112a499113095..06997208945ed 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1895,6 +1895,9 @@ static void dw_dp_hpd_work(struct work_struct *work)
>  	long_hpd =3D dp->hotplug.long_hpd;
>  	mutex_unlock(&dp->irq_lock);
> =20
> +	if (!dp->bridge.dev)
> +		return;
> +

[Severity: High]
This is a pre-existing issue, but does this lockless check create a race
condition?

If drm_bridge_detach() executes concurrently and clears bridge->dev, can
this work function still proceed and pass a NULL or freed drm_device pointer
to drm_helper_hpd_irq_event()?

>  	dev_dbg(dp->dev, "[drm] Get hpd irq - %s\n", long_hpd ? "long" : "short=
");
> =20
>  	if (!long_hpd) {

[ ... ]

> @@ -2005,9 +2027,8 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct=
 drm_encoder *encoder,
> =20
>  	dp->dev =3D dev;
>  	dp->pixel_mode =3D plat_data->pixel_mode;
> -
>  	dp->plat_data.max_link_rate =3D plat_data->max_link_rate;
> -	bridge =3D &dp->bridge;
> +
>  	mutex_init(&dp->irq_lock);
>  	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);

[Severity: High]
This is a pre-existing issue, but does this workqueue lack a cleanup step?

Since dp->hpd_work is initialized here but doesn't have a corresponding
devm action to cancel it on teardown, could a pending work item execute
after the dp structure is freed during driver unbind, resulting in a
use-after-free?

[ ... ]

[Severity: High]
This is a pre-existing issue, but can unhandled interrupt sources cause an
interrupt storm?

Looking at dw_dp_irq():

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_irq() {
    ...
    if (value & HPD_EVENT)
        dw_dp_handle_hpd_event(dp);

    if (value & AUX_REPLY_EVENT) {
        regmap_write(dp->regmap, DW_DP_GENERAL_INTERRUPT, AUX_REPLY_EVENT);
        complete(&dp->complete);
    }

    return IRQ_HANDLED;
}

If an interrupt source other than HPD_EVENT or AUX_REPLY_EVENT fires (such
as HDCP_EVENT), the handler returns IRQ_HANDLED without clearing the event
in DW_DP_GENERAL_INTERRUPT. Will this keep the IRQ line asserted and
continuously re-enter the handler?

[Severity: High]
This is a pre-existing issue, but are sleeping functions being called from
atomic context?

The DRM documentation indicates that atomic disable callbacks run in atomic
context during non-blocking commits.

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_bridge_atomic_disable() {
    ...
    dw_dp_reset(dp);
}

And dw_dp_reset() unconditionally calls sleeping functions:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_reset() {
    ...
    disable_irq(dp->irq);
    ...
    usleep_range(10, 20);
    ...
    regmap_read_poll_timeout(...);
}

Could this lead to kernel warnings or system instability when non-blocking
atomic commits occur?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-synopsys-d=
w-dp-improvements-v9-0-2e6e46135312@collabora.com?part=3D2
