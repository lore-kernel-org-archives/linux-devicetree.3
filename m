Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15CE2DEA64
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 07:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783151251; cv=none; b=k7ettVMwODhVxm7wcpEePmHKUNLz7NJAc+8QrihmHHu69pDY177Hk7B6/orBV1V9aP5sb/ZNqdZgalfn6HYpk+izYhoWD2i1tguJXSNExh0wZXGLkcxBHbF7C5AXkShC2WTBmAvCn5KtCYR5H4BvUDhvA65hhLgmc+0l7M7mmCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783151251; c=relaxed/simple;
	bh=0OATkkDWp9veuMDYpSUmeH+tWw1ome6OjiD0dqc70dk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yw7XTtx+A9FrQmRGf9AxGERiCthLBkmy8tKlWfHnh+POY4e/eWhT/LfBHdBAHhpphn+aCBjoqQ2K/nkmCdjxxcz2+gbTSrp18BgdO3AX9gciz1kDb3SviYJHMmMTmti1m8kDRwJ4rX7ooAVJIzWC/dvP9T74NHKVSbT7a49Gffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=derLkDQc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="derLkDQc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29E81F000E9;
	Sat,  4 Jul 2026 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783151245;
	bh=2ZlEqYHlxV635tgf86j0RXWU9JLveQzZciEPDdxrRgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=derLkDQcX3up4lcF0amOaw2dRwnFFwSM+51AOCTEiTlnVr3uh9FLi+wNkjZQp1Zi+
	 L/nkfEGp6F8HlUxlZ3GvQS1tyjg9WHyvnK47eqOwSqn8FgqCEKzSMhoaOxx+uBE24H
	 O/K+oO0CSAtM1TStLhEeelEye2VcbX3pSTEHoDDd6AAXJtgC8SJTEtI6kFKh+yZveF
	 kJ7ZK0i1szl7s+5XyjzWZjjJqUYe2Y38XkbrCnvIz4/FZEOwUuFc0NBn5hynNzRjDD
	 lJE1NZtBKi3vtLCfM/TteGtkWJxvE2rRW6WzBObGNLuBrAVbZJE9ZOpZQs8hkbVbz8
	 ym0/toJAzjoQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: phy: motorola,cpcap-usb: replace se1
 interrupt with chrg_det
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260704073843.1750458-4-ivo.g.dimitrov.75@gmail.com>
References: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
 <20260704073843.1750458-4-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 07:47:24 +0000
Message-Id: <20260704074724.D29E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] Device Tree ABI breakage: replacing 'se1' interrupt with 'chrg=
_det' breaks probe on older DTBs.
- [Medium] Global SysRq state is permanently disabled on error paths.

Pre-existing issues:
- [High] Race condition in driver removal allows the threaded IRQ handler t=
o schedule work on freed memory (Use-After-Free).
--

commit d7b2a51c3f82ebdb2f326313f13ddf2d3edde1a7
Author: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

dt-bindings: phy: motorola,cpcap-usb: replace se1 interrupt with chrg_det

The CPCAP USB PHY driver uses the CPCAP charger detection interrupt for DCP
detection rather than the SE1 interrupt. This commit updates the binding and
example DTS to use the corresponding "chrg_det" interrupt name.

> diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy=
.yaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> index dd345cbd0a0b4..d54cf7fbf11a7 100644
> --- a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> @@ -27,7 +27,7 @@ properties:
>        - description: vbusvld interrupt
>        - description: sessvld interrupt
>        - description: sessend interrupt
> -      - description: se1 interrupt
> +      - description: charger detection interrupt
>        - description: dm interrupt
>        - description: dp interrupt
> =20
> @@ -40,7 +40,7 @@ properties:
>        - const: vbusvld
>        - const: sessvld
>        - const: sessend
> -      - const: se1
> +      - const: chrg_det

[Severity: Critical]
Does replacing 'se1' with 'chrg_det' break probe for older device trees?

Since cpcap_usb_init_irq() in drivers/phy/motorola/phy-cpcap-usb.c fails the
probe if an expected interrupt is not found, updating the binding to require
'chrg_det' instead of 'se1' means booting a new kernel with an older DTB
(which only provides 'se1') could fail to probe the USB PHY.

>        - const: dm
>        - const: dp
> =20

[ ... ]

While reviewing this, I noticed a few other regressions in
drivers/phy/motorola/phy-cpcap-usb.c:

[Severity: Medium]
Can this error path in cpcap_usb_set_idle_mode() leave the global SysRq sta=
te
permanently disabled?

drivers/phy/motorola/phy-cpcap-usb.c:cpcap_usb_set_idle_mode() {
    ...
    sysrq =3D sysrq_mask();
    if (sysrq & 1)
        sysrq_toggle_support(sysrq & ~1);
    ...
out_err:
    dev_err(ddata->dev, "%s failed with %i\n", __func__, error);

    return error;
}

If an error occurs (e.g., during pinctrl_select_state), the function jumps =
to
out_err and returns without calling sysrq_toggle_support(sysrq) to restore =
it.


[Severity: High]
This is a pre-existing issue, but could there be a race condition during
driver removal that allows the threaded IRQ handler to schedule work on fre=
ed
memory?

During driver removal, cpcap_usb_phy_remove() cancels the work without
disabling the IRQ first:

drivers/phy/motorola/phy-cpcap-usb.c:cpcap_usb_phy_remove() {
    ...
    atomic_set(&ddata->active, 0);
    ...
    cancel_delayed_work_sync(&ddata->detect_work);
    regulator_disable(ddata->vusb);
}

Concurrently, if an IRQ fires and cpcap_phy_irq_thread() checks 'active' but
is preempted before scheduling the work:

drivers/phy/motorola/phy-cpcap-usb.c:cpcap_phy_irq_thread() {
    ...
    if (!atomic_read(&ddata->active))
        return IRQ_NONE;

    schedule_delayed_work(&ddata->detect_work, msecs_to_jiffies(1));
    ...
}

Could the IRQ thread resume after cancel_delayed_work_sync() has completed,
scheduling the delayed work on a freed 'ddata' object?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704073843.1750=
458-1-ivo.g.dimitrov.75@gmail.com?part=3D3
