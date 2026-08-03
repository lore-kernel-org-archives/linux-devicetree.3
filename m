Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627FA431E70
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783515; cv=none; b=haH3E+g99GzmOixeE1YbbhCZ64hXGy+I9WACqNOdgwRuh/nmZdFzdQloB4gSna2lNX+G2BlH/8PgQdiWo2rerWUBXXUNl/YylapOPGGEBw6vSiIT7fdpWsutTFG8yQRyKoU/m+u7bW4n1mOpnh0Fgg7syN/wRo7Zl6Lsuqt7YF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783515; c=relaxed/simple;
	bh=+uuviEjVRr7uMMbiiuj3lV/dkTQIy75PoJa09qTi6UM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tjHVMejfa8Xt1T0UrKIA31oLM1EREHWC0IA11o+OIQT3oI1MaKGqU3G2MTGbJG9eWrHKihB1r1PbYBFbmyVNUBtmTx2l92ix3uH14CC5IbMj6vRIl5yRujch9T0dMiR205Ih8bbc9lKeZ6rIiTyJsGPHL2zOP+xPG00RFHDu/v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owTWbuLr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owTWbuLr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325D51F000E9;
	Mon,  3 Aug 2026 18:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785783514;
	bh=j1N4qn9g8nsDeneRsL9Xr5+3GdfXGODAMYwV4x/pKC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=owTWbuLrhTNSK4xvSz9awLyVf7jZberzMsQn14CtMkTRRpZ6Jn54J+IooqgMivu5Y
	 dQm05sMi7jKksWl22M/RKjTgPh2AvYhEnhNjHyM74Vg4JWLo3hmQH69nNOekD913RO
	 jTKyVyxQk1zK/4000/F7lTzXIsvhVu7WlP598fIlHrJxiHhKjnJN2rqX6tHyEDpMfA
	 nRcwdugGFAOtf/L7TyDd7Dkg4J8WCcp46lHAlnu739wCANqMUCrjArGxr412KI7VCj
	 FMHLjuvongis+xmKrGMwEoV5vvlXUqWtVn1ODZTOT/HG6yVKKcn0BQHdi7S0ceB0RZ
	 TzD9n0qQoIPeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 16/22] drm/rockchip: dw_dp: Add runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-16-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
 <20260803-synopsys-dw-dp-improvements-v9-16-2e6e46135312@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 18:58:32 +0000
Message-Id: <20260803185833.325D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Asynchronous autosuspend on driver removal is cancelled by devre=
s-managed pm_runtime_disable(), leaving the hardware powered on and clocks =
enabled.

Pre-existing issues:
- [High] Missing system sleep PM operations prevents hardware reinitializat=
ion on system resume and leaks power during sleep for non-USB-C displays.
--

--- Patch [16]: [PATCH v9 16/22] drm/rockchip: dw_dp: Add runtime PM suppor=
t ---
commit 92f08187a6106df5f97a5c7538b516c59d21ea4a
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/rockchip: dw_dp: Add runtime PM support
   =20
Add support for runtime PM to the Rockchip RK3576/3588 Synopsys
DesignWare DisplayPort driver.

> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c

[ ... ]

> @@ -249,6 +255,24 @@ static void dw_dp_rockchip_remove(struct platform_de=
vice *pdev)
>  	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
>  }

[Severity: Medium]
Will this leave the hardware powered on and clocks enabled after driver unl=
oad?

When component_del() is called, the unbind path eventually calls dw_dp_unbi=
nd()
which asynchronously drops the PM reference using pm_runtime_put_autosuspen=
d().

After dw_dp_rockchip_remove() returns, the devres cleanup sequence runs and
calls pm_runtime_disable() (registered via devm_pm_runtime_enable() during
probe). Because pm_runtime_disable() unconditionally cancels pending
autosuspend timers and async works, does this cancel the suspend operation
before it can execute and leave the device permanently in the RPM_ACTIVE st=
ate?

Would it be safer to ensure a synchronous suspend happens during the remove
path to prevent this leak?

> +
> +static int dw_dp_rockchip_runtime_suspend(struct device *dev)
> +{
> +	struct rockchip_dw_dp *dp =3D dev_get_drvdata(dev);
> +
> +	return dw_dp_runtime_suspend(dp->base);
> +}
> +
> +static int dw_dp_rockchip_runtime_resume(struct device *dev)
> +{
> +	struct rockchip_dw_dp *dp =3D dev_get_drvdata(dev);
> +
> +	return dw_dp_runtime_resume(dp->base);
> +}
> +
> +static const struct dev_pm_ops dw_dp_pm_ops =3D {
> +	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_r=
esume, NULL)
> +};

[Severity: High]
This isn't a bug introduced by this patch, but could the lack of system sle=
ep
callbacks in dw_dp_pm_ops prevent hardware reinitialization on system resum=
e?

For non-USB-C displays, the driver holds a runtime PM reference indefinitely
to maintain active hotplug detection. During system suspend (S3), the DRM c=
ore
disables the display pipeline which drops one reference, but the usage count
remains at 1, so the device is not runtime suspended.

Since dw_dp_pm_ops lacks system sleep callbacks (like pm_runtime_force_susp=
end
and pm_runtime_force_resume), does the PM core fail to synchronously suspend
the device?

If the system forcefully cuts power during S3, the hardware state is lost.
Upon system resume, the runtime PM framework still considers the device
RPM_ACTIVE, so a subsequent pm_runtime_get_sync() during pipeline enable
might not trigger dw_dp_runtime_resume(). Does this leave the hardware
uninitialized and result in a blank display?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-synopsys-d=
w-dp-improvements-v9-0-2e6e46135312@collabora.com?part=3D16
