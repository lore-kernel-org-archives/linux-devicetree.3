Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B21E41D108
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917285; cv=none; b=W9DVO3dEu84YrtWDAr2ni/vG+Y5uUPuSMPshd87n8JRT235X4SfqeCvyRNKjfHB/2vL4Zkge4THkhKf7kotR0CbOw0hCdG48+OFOD5DXOue6GW3nSITPGiG2LVouRGR6k0IRrlAQIkPNL8afi6/yixm72CBDdPBtDcXJ0sKTenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917285; c=relaxed/simple;
	bh=3Y45BW5RyEmy+hj5qRgzX+vzmgO7p0H9piAQ5ZWHVkI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R5+Em3ScU7vbHKOrs8JLfo47xuUEKIWK/eGwIcsDC6gW2zjwlfmoRhNvQXVptbCFcaRbv49N60ZuQhyF7c1QIW044zWFgdLPKFIOpv6/GeVwYkXISByDSVmL+fuy8emZcHW8lQJZiZifdwROEGOOnmHzAbc+YH7uc/yOM8KIbyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuPiuZG9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuPiuZG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B758C1F000E9;
	Fri, 24 Jul 2026 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784917284;
	bh=LXgAI2htp1mFlmxQZ3kjsfjll7ugDUtAnE/rkv9LOJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HuPiuZG9Bk+2BC1hGz23BOMgLJhGFktUByfqwHazFQoRPIHSc8UzDIHMkYuUfUXq3
	 O0zeNV+HgY8dwfs1apyY7N3EmKWxcj+RbjyJ4AXE+RCQyzhwk7V3+vT6EBK9G8ixNI
	 GTDw7CUet5ViQeSy0eiK1j30YOG+8Ux+hggzVVduh2X5cSPId9GutXZyEKgm9lnnAd
	 0e2BMLVzHAS3QsIAke9jyqetEyfnXY0iELEwFJ0SUksuq/KsKYLFCCrQI2T+Pj7mfR
	 L5nDiArgt6mYgTJ8mF+6CD9Wi5yx0iBCamiEZg+6cAyRkBewxAhoHNdO3fsx1XYSV4
	 A5ALDOK/RgYXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/16] drm/bridge: synopsys: dw-dp: Add missing
 reinit_completion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-4-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
 <20260724-synopsys-dw-dp-improvements-v6-4-041d99a19c4e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:21:23 +0000
Message-Id: <20260724182123.B758C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch attempts to fix spurious completions from timed-out AUX =
transfers by adding `reinit_completion()`, but the fix is insufficient due =
to a TOCTOU race with the driver's threaded IRQ handler.
- [High] The driver fails to support DP AUX short reads, incorrectly reject=
ing them with -EBUSY instead of returning the number of bytes successfully =
transferred, which breaks I2C-over-AUX.
- [High] Missing hardware reset on AUX transfer timeout leaves the controll=
er in an undefined/busy state.
- [High] The DP AUX channel and I2C adapter are registered and exposed befo=
re the hardware is initialized and interrupts are enabled, causing early ac=
cess to fail with timeouts.
- [High] DP AUX transfers can execute with the PHY powered off, leading to =
hardware timeouts or crashes.
--

--- Patch [4]: [PATCH v6 04/16] drm/bridge: synopsys: dw-dp: Add missing re=
init_completion ---
commit fc6159d600f530845f6f08962e449b720526ee08
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
drm/bridge: synopsys: dw-dp: Add missing reinit_completion

This patch adds a reinit_completion call before sending an AUX command
to prevent subsequent transfers from immediately triggering if an earlier
one timed out and the interrupt fired later.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index b28040d69fabf..2f0ee7ab7febd 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1465,6 +1465,8 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux=
 *aux,
>  	if (WARN_ON(msg->size > 16))
>  		return -E2BIG;
> =20
> +	reinit_completion(&dp->complete);
> +

[Severity: High]
This isn't a bug introduced by this patch, but the attempt to fix the
spurious completions seems incomplete due to a race condition. Because
reinit_completion is called locklessly here, could the threaded IRQ handler
execute concurrently?

If dw_dp_irq is processing a delayed interrupt from a previous timeout:

dw_dp_irq() {
    ...
    complete(&dp->complete);
}

Doesn't this mean it could call complete immediately after this
reinit_completion, instantly satisfying the new wait and causing the driver
to read garbage hardware status?

>  	switch (msg->request & ~DP_AUX_I2C_MOT) {
>  	case DP_AUX_NATIVE_WRITE:
>  	case DP_AUX_I2C_WRITE:

[Severity: High]
This is a pre-existing issue, but does this driver fail to support DP AUX
short reads?

Later in dw_dp_aux_transfer:

    if (count !=3D msg->size)
        return -EBUSY;

If the hardware returns fewer bytes than requested, returning -EBUSY causes
the DRM core helper drm_dp_i2c_do_msg to endlessly retry the exact same
full-length transfer without advancing its buffer. Could this break
communication with I2C devices on the DP bus?

[Severity: High]
This is a pre-existing issue, but is a hardware reset missing when an AUX
transfer times out?

In the error path of dw_dp_aux_transfer:

    if (!status) {
        dev_err(dp->dev, "timeout waiting for AUX reply\n");
        return -ETIMEDOUT;
    }

If wait_for_completion_timeout expires, returning -ETIMEDOUT without
resetting the underlying AUX controller or clearing the pending state might
leave the hardware state machine permanently stuck. Will subsequent transfe=
rs
fail because the hardware is still busy?

[Severity: High]
This isn't a bug introduced by this patch, but is the AUX channel registered
before interrupts are enabled?

Looking at dw_dp_bind, the channel is registered early:

    ret =3D drm_dp_aux_register(&dp->aux);

But interrupts are enabled much later in the same function:

    enable_irq(dp->irq);

If a userspace tool like ddcutil or an I2C auto-prober attempts a transacti=
on
in this window, won't dw_dp_aux_transfer fail because the hardware cannot
yet generate interrupts?

[Severity: High]
This is a pre-existing issue, but can DP AUX transfers execute with the PHY
powered off?

Direct accesses from userspace via the character device call directly into:

static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
                                  struct drm_dp_aux_msg *msg)

Internal callers wrap this to ensure the PHY is powered on:

dw_dp_bridge_edid_read() {
    ...
    ret =3D phy_power_on(dp->phy);
    if (ret)
        return NULL;

    edid =3D drm_edid_read_ddc(connector, &dp->aux.ddc);

    phy_power_off(dp->phy);
    ...
}

Since dw_dp_aux_transfer itself doesn't check or manage the PHY power state,
could a direct userspace access while the display is suspended cause MMIO
timeouts or system crashes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synopsys-d=
w-dp-improvements-v6-0-041d99a19c4e@collabora.com?part=3D4
