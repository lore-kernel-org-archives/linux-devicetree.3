Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E903340E8C1
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771033; cv=none; b=XIitISXRNT4XDSAUs7REgezgqSxdWIGWw5K51WS7dyIIRcBlFtzIHZcllQAd57HdXnPlE9SlrDp7hHEOWrKLq+SyUTuv0WcqL+IIaSObQNIHqPlxaK2gL8Pudr7O0VTb3mDo/uGWgguIb3fiYSpcg+ELgHrTNyjHzDv1EnBsw+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771033; c=relaxed/simple;
	bh=cdHTsjxvF+RpCrduWi3Wm+JkA3TNC8Is4ztYrOPJx3M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NxDNO/VyAjSbSXfLqZWzNlB2iP7tx6CGZsbixZ5jTE4hnJ7MuVrhoXtuQEhKFR47/bLUFWx20wMlWslUMge1YiIt/Vi1/GaodVt15OsHn43VaqTHEdvcbAUluLqZgQToTe9rq4FZJVJCI02LZieEGLFwpBAKOwHHXIQrSwIibE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKeafGOb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKeafGOb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110551F00A3A;
	Mon,  7 Sep 2026 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771028;
	bh=Wtm9q+HtDVXNX4K/75DD/pn5uKvmkS2TkHCrNX0wYnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hKeafGObBq7pWHAMTmuEUvbygETixRBqEPhLQMF1S8Lsqj/VLj4JoDbSdhs2GRYnW
	 sw2Uw5YBnQnrAVcB4ET7IKTlVhpCdH8tepxR+PaPSBs1Mv7OzkTVFOrihtZ4gA/LHc
	 wuLhp9r1yuCnMcrdNgJ+a5cjB6Su0+ruvAUEhhyIPtCNqKkB/lJHLHCtSEaQttRBXL
	 WCxnOG2kIu/+UEyLjwkb3I1n+XkL3/KzYSRrPf/gycZn55FdTkfG59cJ9yEnjETXG+
	 GpWgSPOAv0WG3FGEtGBueyJZyO6Xj2EAoZxRnI9mbODqxnZsIZbFmW73inTitigBah
	 qqwkmF5oo7IQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/11] ASoC: SDCA: export PM helpers keyed on
 sdca_class_drv
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907083727.733705-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:50:27 +0000
Message-Id: <20260907085028.110551F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Exporting `sdca_class_pm_ops` unconditionally with `RUNTIME_PM_OPS`=
 causes dead code retention when CONFIG_PM is disabled.

Pre-existing issues:
- [High] Data race and invalid hardware access between `boot_work` and syst=
em suspend.
--

commit 0f2e2cef51e8b87316164c383139022824389918
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: export PM helpers keyed on sdca_class_drv

The class PM callbacks pull sdca_class_drv out of drvdata, so the
built-in class_sdw_driver owns the drvdata slot. That works for the
generic case but blocks codec drivers that want to embed sdca_class_drv
in their own private struct. Split the four callbacks into exported
helpers that take a struct sdca_class_drv * directly.

> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
> index d7444f442c71c..88a29116a334e 100644
> --- a/sound/soc/sdca/sdca_class.c
> +++ b/sound/soc/sdca/sdca_class.c
[ ... ]
> -static int class_suspend(struct device *dev)
> +/**
> + * sdca_class_system_suspend - SDCA class system suspend helper
> + * @drv: caller-owned sdca_class_drv.
> + *
> + * Codec drivers compose this into their own dev_pm_ops.  Disables the
> + * SoundWire interrupt and forces runtime suspend of the underlying
> + * class regmap.
> + */
> +int sdca_class_system_suspend(struct sdca_class_drv *drv)
>  {
> -	struct sdca_class_drv *drv =3D dev_get_drvdata(dev);
>  	int ret;
> =20
>  	disable_irq(drv->sdw->irq);
> =20
> -	ret =3D pm_runtime_force_suspend(dev);
> +	ret =3D pm_runtime_force_suspend(drv->dev);
>  	if (ret) {
> -		dev_err(dev, "failed to force suspend: %d\n", ret);
> +		dev_err(drv->dev, "failed to force suspend: %d\n", ret);
>  		return ret;
>  	}
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL_NS_GPL(sdca_class_system_suspend, "SND_SOC_SDCA_CLASS");

[Severity: High]
This is a pre-existing issue, but does sdca_class_system_suspend() fail to
serialize against boot_work?

Because boot_work is queued on system_long_wq (an unbounded, non-freezable
workqueue), it can race with system suspend. If the system initiates suspend
while boot_work is waiting in sdw_slave_wait_for_init(),
sdca_class_system_suspend() will force the device into a suspended state by
disabling interrupts and setting regcache_cache_only(true).

Since sdca_class_system_suspend() does not flush or cancel the pending
initialization work, boot_work will eventually resume, blindly set
regcache_cache_only(false), and attempt hardware access on a physically
suspended bus, which could lead to bus timeouts or crashes.

[ ... ]
> +static int class_pm_runtime_resume(struct device *dev)
> +{
> +	return sdca_class_runtime_resume(dev_get_drvdata(dev));
> +}
> =20
> -static const struct dev_pm_ops class_pm_ops =3D {
> -	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
> -	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
> +const struct dev_pm_ops sdca_class_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(class_pm_system_suspend, class_pm_system_resume)
> +	RUNTIME_PM_OPS(class_pm_runtime_suspend, class_pm_runtime_resume, NULL)
>  };
> +EXPORT_SYMBOL_NS_GPL(sdca_class_pm_ops, "SND_SOC_SDCA_CLASS");

[Severity: Low]
Does exporting sdca_class_pm_ops unconditionally with RUNTIME_PM_OPS cause
dead code retention when CONFIG_PM is disabled?

When CONFIG_PM is disabled, runtime PM callbacks are never used and should =
be
eliminated by the compiler. Because sdca_class_pm_ops is globally exported =
in
this patch and populated using the unconditional RUNTIME_PM_OPS macro inste=
ad
of conditionally-compiled macros, the compiler will retain the structure and
its referenced static functions (class_pm_runtime_suspend and
class_pm_runtime_resume) as dead code in the final binary.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907083727.7337=
05-1-srinivas.kandagatla@oss.qualcomm.com?part=3D2
