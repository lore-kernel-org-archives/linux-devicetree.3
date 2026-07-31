Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9827C3CF204
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519326; cv=none; b=pPCFbc478RjzdVncFZ5/HBBXGQK6pedA0SmbhRm6CHi+Snxv4D3EXPgJnWK4sAxCV6aLj15pCebbNZW8lMijwO8pYVY7JXh3pEvE0XjA1/EVmFel8LqPYn7eHAtqRxVry8WjGbuaDaFoRl2ZuJSWML3J6sHpl5F4xyrNWdYvha0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519326; c=relaxed/simple;
	bh=wZkU51DdMXfhq8VsFeHiKJtoJXPu4xj3gT7ake8uX0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tAyRc+UveycZl3ryCKdiES7w5rrNHOlo/kCitUacbA7rQY5SPmZASghaW0hOHqbYwxKlDAJgwEPUf1mUt9vXZ4HBPRmtnBaluynJicPw2F1XsDOdKYOWswlPoHsIrsPU02cvTv6Mf07v+qUvZ6YUNGZp4qWaaS6JO5xHaryidmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShrNpN72; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShrNpN72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368EE1F00ADE;
	Fri, 31 Jul 2026 17:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785519325;
	bh=KiIaGOPOF3r2glCxUiNw3aA7EHKRPLfluP6dDKSe0hI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ShrNpN726LbD2xery5N8KGaYFA+K1y3DSKLqin3s6M3cw6xTxle3YfdHAP9UreJMG
	 Nzq697Os9TBUmttWEY0mSpTrVI0Hz4CkGNyunYLdd7Q6riCGhD6zB6Hk0ZN4AjRWDc
	 BL0rGdzSJYb18foiIXHBwAcevX6tnqVXWD1dP4N6XjkjdaJ1q5owM4kVE54TUnKTzU
	 lpc4nFpVcNuugUHyvjXkwAfwlX5evi7S4RxHPh7DAlQDGp+kqGTfq0JTEUFOJukOkX
	 sSO51D83tRQaPJ5g3se7mi/B0kr16SQ01jZEBiE0D231MtDgxQzW27R6fTb+NogMTf
	 eusQPnDWL4OlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 15/21] drm/rockchip: dw_dp: Add runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-15-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
 <20260731-synopsys-dw-dp-improvements-v8-15-ac1e6a75782f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 17:35:24 +0000
Message-Id: <20260731173525.368EE1F00ADE@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Asynchronous runtime PM put operations during device removal and e=
rror paths are cancelled by pm_runtime_disable(), leaving the device perman=
ently powered on.
- [High] The device will remain powered on during system suspend because it=
 uses runtime PM autosuspend without providing system sleep PM operations.
--

--- Patch [15]: [PATCH v8 15/21] drm/rockchip: dw_dp: Add runtime PM suppor=
t ---
commit 7c3ff2ff43dcc0fce64eaf4461fe2a1101bcb4ad
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/rockchip: dw_dp: Add runtime PM support

Add support for runtime PM to the Rockchip RK3576/3588 Synopsys
DesignWare DisplayPort driver.

> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> index d516b3910b516..dde3881efad84 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
[ ... ]
> @@ -231,16 +232,21 @@ static int dw_dp_rockchip_probe(struct platform_dev=
ice *pdev)
>  	if (IS_ERR(dp->vo_grf))
>  		return PTR_ERR(dp->vo_grf);
> =20
> +	plat_data->autosuspend_delay =3D 500;

[Severity: High]
Does setting autosuspend_delay here expose a resource leak in the core
driver's removal/error paths?

When autosuspend_delay > 0, the core dw-dp driver opts into the shared PM
runtime framework. During device unbind (dw_dp_unbind()) and devm IRQ
cleanup (dw_dp_irq_free()), the core driver releases its PM references
asynchronously using pm_runtime_put_autosuspend().

Immediately afterward, the removal process triggers the devres cleanup for
devm_pm_runtime_enable(), which calls pm_runtime_disable(). As documented
in the PM subsystem guidelines, pm_runtime_disable() invokes
__pm_runtime_barrier(), which flushes and cancels any pending asynchronous
suspend requests. This leaves the DP controller's clocks (apb_clk and
aux_clk) enabled indefinitely.

Should the core driver use synchronous puts (like pm_runtime_put_sync())
before pm_runtime_disable() is called?

>  	plat_data->max_link_rate =3D plat_data_const->max_link_rate;
>  	plat_data->pixel_mode =3D plat_data_const->pixel_mode;
>  	plat_data->hpd_sw_sel =3D dw_dp_rockchip_hpd_sw_sel;
[ ... ]
> @@ -249,6 +255,24 @@ static void dw_dp_rockchip_remove(struct platform_de=
vice *pdev)
>  	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
>  }
> =20
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
Will the device remain powered on during system suspend?

This dev_pm_ops struct defines runtime PM callbacks but omits system sleep
callbacks (like SYSTEM_SLEEP_PM_OPS with pm_runtime_force_suspend).

When the system suspends, the DRM core disables the display, which drops
the runtime PM reference and schedules the 500ms autosuspend timer via
pm_runtime_put_autosuspend().

If the PM core suspends the system before the 500ms timer expires, the
device is left in the RPM_ACTIVE state. Without system sleep callbacks to
force suspension, the DP controller's clocks could remain enabled while
the rest of the system sleeps.

> +
>  static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data =3D {
>  	.num_ctrls =3D 2,
>  	.ctrl_ids =3D {0xfde50000, 0xfde60000},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-synopsys-d=
w-dp-improvements-v8-0-ac1e6a75782f@collabora.com?part=3D15
