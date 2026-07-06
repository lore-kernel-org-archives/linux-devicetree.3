Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091F3D3002
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 22:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783378554; cv=none; b=n6eEw4xtJbG1gVOBZqPfCtzbPxYs3AZYoKH8q1ov4u9uqKQ1A7Uyvik72tfnV29PhghvZrVCZSq4uTMsbyWv0N6wbXs9D8QS9SLkvd9D/SfaPNCB8Oxi8q7ZfL+sPnYg1OKYtS9RDAMDZCvahBhTN0DhDd0kVbMPPWSixBWwOJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783378554; c=relaxed/simple;
	bh=POH8BmqTh7lsC0/i6GgGlgT4WmjmTAzFYVJPABnQrvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BsbSP1Vpxkru4PWw+/J3tADHUicjDt3B5L4M/TGOpytcCRulBzVrqzjlxw3SmpJMYSXLyZ9BPz4gyXddFhW0Dwunt2ykOqBGRtUdUM2rVR91JdRt8vYTY6i1SDMZaETXwz1UfFnAGx13QQ6kv6XdaWuOPuPq2h/JRUUgVgHytiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMWlAZKR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMWlAZKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381F61F000E9;
	Mon,  6 Jul 2026 22:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783378552;
	bh=AvEMgDrFkapxQmPYCMvW3Y96aORv04XL37BPEM0JT2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZMWlAZKRBhqllqhtnC3TxDwPMedtEenDerOjGj4USbe0kySsabMmFe6XU57d9WfaN
	 NKnyx1m8CpSpONt4DHt055qJhXBCRukc55p0KYjWxVH9JHX47uWN9qKiJBKbWz8x6/
	 MulOhuiVHpatJEoXPH1jimHARKWvpPJqtaFY1qKxW0eDO+OsTgBUMnNnBBtSLqQdXv
	 5BbXXvYWKS8zQbe794s2F5SmSx64lLSG1j4tvCBXFOJOOsNwDdQvdkbRpn7brvs9/Q
	 R2Rjx+8aH3K+nNJ7R/cj05RbUA2EyCcHYhgIb/BKb9shk3/PetAOC/WUE4cU9EpbSG
	 YJLQxQicfjK8w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 1/2] phy: rockchip: inno-usb2: keep
 peripheral-only OTG port active
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Zdziarstek" <andreas.zdziarstek@gmail.com>
Cc: olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260706223627.113814-2-andreas.zdziarstek@gmail.com>
References: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
 <20260706223627.113814-2-andreas.zdziarstek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 22:55:51 +0000
Message-Id: <20260706225552.381F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Medium] The patch introduces a permanent power state leak for peripheral=
-only ports by skipping autonomous PHY power-offs but failing to skip auton=
omous power-ons.

Pre-existing issues:
- [Critical] The charger detection logic accesses uninitialized `chg_det` r=
egisters on SoCs like RK3036, inadvertently corrupting GRF register offset =
0x0.
- [High] Delayed works (`otg_sm_work`, `chg_work`, `sm_work`) are not prope=
rly canceled on driver unbind, and mutual re-arming prevents clean teardown=
, leading to use-after-free.
- [High] The `cable` variable in `rockchip_usb2phy_otg_sm_work` is declared=
 as `static`, which causes state corruption if multiple OTG ports exist.
- [High] Unprotected concurrent modifications to OTG and charger state vari=
ables (`rport->state`, `rphy->chg_state`, `rphy->chg_type`).
- [Medium] Concurrent lockless access to `rport->suspended` and hardware cl=
ock/register state between workqueues and the PHY core leads to a data race=
 and clock leaks.
--

--- Patch [1]: [RFC PATCH v1 1/2] phy: rockchip: inno-usb2: keep peripheral=
-only OTG port active ---
commit dc6ab852562662efe7db14ed699e4f8c82b9f053
Author: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>

phy: rockchip: inno-usb2: keep peripheral-only OTG port active

This commit updates the OTG state machine to skip autonomous power-offs
when the port is peripheral-only. This prevents the state machine from
suspending the port and killing the USB gadget when booting without an
attached cable.

> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/=
rockchip/phy-rockchip-inno-usb2.c
> index 7d8a533f24aea..9b138b7aaeb89 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -670,6 +670,23 @@ static const struct phy_ops rockchip_usb2phy_ops =3D=
 {
[ ... ]
> +static void rockchip_usb2phy_sm_power_off(struct rockchip_usb2phy_port *=
rport)
> +{
> +	if (rport->mode =3D=3D USB_DR_MODE_PERIPHERAL)
> +		return;
> +
> +	rockchip_usb2phy_power_off(rport->phy);
> +}

[Severity: Medium]
The patch updates this function to skip powering off the PHY when the mode =
is
USB_DR_MODE_PERIPHERAL during a cable detach. However, further down in
rockchip_usb2phy_otg_sm_work(), the state machine still autonomously powers
ON the PHY when a cable is attached.

Does this asymmetrical behavior leave the PHY powered on indefinitely after
the first cable insertion, preventing system suspend?

> +
>  static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
>  {
>  	struct rockchip_usb2phy_port *rport =3D
> @@ -693,7 +710,7 @@ static void rockchip_usb2phy_otg_sm_work(struct work_=
struct *work)
>  	case OTG_STATE_UNDEFINED:
>  		rport->state =3D OTG_STATE_B_IDLE;

[Severity: High]
This is a pre-existing issue, but is it safe to locklessly modify shared st=
ate
variables like rport->state here?

This state machine can run in the delayed workqueue, and is concurrently
invoked synchronously by the threaded IRQ handler
rockchip_usb2phy_bvalid_irq() as well as the rockchip_chg_detect_work()
workqueue.

Could this lack of mutual exclusion allow interleaved state transitions on
multiple CPUs and corrupt the state machine?

>  		if (!vbus_attach)
> -			rockchip_usb2phy_power_off(rport->phy);
> +			rockchip_usb2phy_sm_power_off(rport);
>  		fallthrough;
>  	case OTG_STATE_B_IDLE:
>  		if (extcon_get_state(rphy->edev, EXTCON_USB_HOST) > 0) {
> @@ -719,7 +736,7 @@ static void rockchip_usb2phy_otg_sm_work(struct work_=
struct *work)
>  					break;
>  				case POWER_SUPPLY_TYPE_USB_DCP:
>  					dev_dbg(&rport->phy->dev, "dcp cable is connected\n");
> -					rockchip_usb2phy_power_off(rport->phy);
> +					rockchip_usb2phy_sm_power_off(rport);
>  					notify_charger =3D true;
>  					sch_work =3D true;
>  					cable =3D EXTCON_CHG_USB_DCP;

[Severity: High]
This is a pre-existing issue, but does the static declaration of this cable
variable cause state corruption if multiple OTG ports exist?

SoCs like RK3399 define multiple USB2 PHY instances with OTG ports. If VBUS
events overlap or alternate between ports, could the shared cable variable =
be
overwritten by the latest event, causing disconnected ports to report the
charger type of a different port to extcon?

> @@ -765,7 +782,7 @@ static void rockchip_usb2phy_otg_sm_work(struct work_=
struct *work)
[ ... ]
>  		if (extcon_get_state(rphy->edev, EXTCON_USB_HOST) =3D=3D 0) {
>  			dev_dbg(&rport->phy->dev, "usb otg host disconnect\n");
>  			rport->state =3D OTG_STATE_B_IDLE;
> -			rockchip_usb2phy_power_off(rport->phy);
> +			rockchip_usb2phy_sm_power_off(rport);
>  		}
>  		break;
>  	default:

[Severity: Medium]
This isn't a bug introduced by this patch, but does invoking the internal
power management functions directly from the workqueue bypass the generic P=
HY
framework mutex?

The generic PHY subsystem calls phy_power_on() (protected by phy->mutex),
which invokes rockchip_usb2phy_power_on(). Concurrently, the driver's
workqueues invoke rockchip_usb2phy_power_on() directly without acquiring
any locks.

Since rockchip_usb2phy_power_on() performs a check-then-act on
rport->suspended:

rockchip_usb2phy_power_on() {
    if (!rport->suspended)
        return 0;
    ret =3D clk_prepare_enable(rphy->clk480m);
    ...
}

Could both threads evaluate rport->suspended as true simultaneously, causing
double clock enables but only a single disable later?

[Severity: High]
This is a pre-existing issue, but how are these delayed works safely torn
down?

The works otg_sm_work and chg_work re-arm each other. In
rockchip_usb2phy_exit(), they are cancelled sequentially:

rockchip_usb2phy_exit() {
    cancel_delayed_work_sync(&rport->otg_sm_work);
    cancel_delayed_work_sync(&rport->chg_work);
    ...
}

If chg_work executes while otg_sm_work is being cancelled, can it re-arm
otg_sm_work after the cancellation finishes?

Additionally, since these works are initialized on devm-managed memory but
there is no driver .remove callback to cancel them, could pending works
execute on devm-freed memory upon driver unbind?

> @@ -838,7 +855,7 @@ static void rockchip_chg_detect_work(struct work_stru=
ct *work)
>  	switch (rphy->chg_state) {
>  	case USB_CHG_STATE_UNDEFINED:
>  		if (!rport->suspended && !vbus_attach)
> -			rockchip_usb2phy_power_off(rport->phy);
> +			rockchip_usb2phy_sm_power_off(rport);
>  		/* put the controller in non-driving mode */
>  		if (!vbus_attach)
>  			property_enable(rphy->grf, &rphy->phy_cfg->chg_det.opmode, false);

[Severity: Critical]
This is a pre-existing issue, but does this logic safely handle SoCs where
chg_det is not defined?

For SoCs like RK3036, the rk3036_phy_cfgs does not define chg_det. However,
rockchip_usb2phy_otg_port_init() unconditionally initializes charger detect=
ion.
When a cable is attached, rockchip_chg_detect_work() invokes
property_enable() on the zeroed chg_det fields:

property_enable() {
    ...
    return regmap_write(base, reg->offset, val);
}

Because it lacks validation, would this silently write to reg->offset 0x0
with a write mask, corrupting the General Register Files (GRF) at offset 0x=
0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706223627.1138=
14-1-andreas.zdziarstek@gmail.com?part=3D1
