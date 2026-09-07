Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A63AD51C
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771106; cv=none; b=OTk1kDdUsl/LdcyIQIn3jbuLwnd9ASi1u6ER8rwpTOqpxXmMFaYIPRgEoRS5BylG76slXEW7QB+fvLs7CD20m/kgOxITzixh88TJFmkjMrsfTqrUOsZzS/uhO1d1Oq69c0EoUfNZW6FzrfxIwbItHCnxYwjMzKQZwDaphqqeT7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771106; c=relaxed/simple;
	bh=zdIKMR0pzvgR2hPuSQc4Onv5LlxaOdBtuLlrLzv7btM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rHZsrhQJtqae3unluCzG61R/RBu67KCt9sSIna18+c0cS9F6QmtcY5U4UPWocbcdkSDdwiGrBSaETFwPhDY0pBSwFNdyx5IJ+SwlkZ8HNvcsSLb0WMoVJwdpH54pe9VvaQsDhlw/Ukog95iZGY9jBpwSQSk/BUCxT0iKh8pRkuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0Bpp7+E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0Bpp7+E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F49D1F00A3A;
	Mon,  7 Sep 2026 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771104;
	bh=6GIJVoxKNNPpyAjjpYzGyqWLmc9nEdZDEOEO5olLE40=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I0Bpp7+EPpmtvZivKbqjnEBtNlvjE5GLq0VxKoXyWsnfevmCwZSmh4KjNTnTOvkUi
	 uD797L5iWsybUMZuU2tH65ScBmyLHZdrnZVLjhR1qjV0kmMqKYdESZz09oc4Ei+FER
	 cNqHqBRwPKAFr83vvv4z3jx++mvBCO9JVutnGB5cf5+2Njt4pxJ+5EWAWHJ/pBz+Ca
	 /4j0H2qkzelnQSKJWXbvSZ42JU7V2bmmxMDLCHgUarjhqPv9cW0PdqgjspyQmoNK+v
	 1q8syMB7W7JXUEFtxkERHLbJv/IPIsXzL8bhwLtO0THuKjS989fwDhk/4dFiJT9zZd
	 RLNs337biJQCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] ASoC: SDCA: expose class SoundWire
 probe/remove/read_prop as library
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907083727.733705-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:51:43 +0000
Message-Id: <20260907085144.0F49D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] sdca_class_probe() queues an async work item but does not tie it=
s cancellation to devres, creating a potential use-after-free hazard for ca=
ller drivers on probe failure.

Pre-existing issues:
- [High] The PM runtime usage counter is permanently leaked if devm_pm_runt=
ime_enable() fails during probe.
- [High] The PM runtime usage counter is permanently leaked if the deferred=
 boot work is cancelled before execution.
- [High] The return value of sdw_slave_read_prop() is ignored, masking pote=
ntial memory allocation failures and leaving properties uninitialized.
- [High] If the runtime force suspend fails during a system suspend transit=
ion, the device's interrupt is left permanently disabled.
--

commit 1cb538c9d508b4520bb99ff1157d3ff8f38843e9
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: expose class SoundWire probe/remove/read_prop as library

Split the internal class_sdw_probe/class_sdw_remove/class_read_prop
functions into caller-friendly library helpers. The class_sdw_probe and
class_sdw_remove callbacks of the built-in class_sdw_driver are now thin
wrappers that defer to the exported helpers.

> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
> index 88a29116a334e..b952fa6eb802f 100644
> --- a/sound/soc/sdca/sdca_class.c
> +++ b/sound/soc/sdca/sdca_class.c
[ ... ]
> @@ -24,7 +24,15 @@
> =20
>  #define CLASS_SDW_ATTACH_TIMEOUT_MS	5000
> =20
> -static int class_read_prop(struct sdw_slave *sdw)
> +/**
> + * sdca_class_read_prop - fill SDCA-common SoundWire slave properties
> + * @sdw: SoundWire slave
> + *
> + * Exported so codec-specific SoundWire drivers can invoke the SDCA
> + * common property setup from their own sdw_slave_ops.read_prop, and
> + * then apply codec-specific overrides inline.
> + */
> +int sdca_class_read_prop(struct sdw_slave *sdw)
>  {
>  	struct sdw_slave_prop *prop =3D &sdw->prop;
> =20
> @@ -36,9 +44,10 @@ static int class_read_prop(struct sdw_slave *sdw)
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL_NS_GPL(sdca_class_read_prop, "SND_SOC_SDCA_CLASS");

[Severity: High]
This is a pre-existing issue, but is it safe to ignore the return value of
sdw_slave_read_prop() here?

If sdw_slave_read_prop() returns -ENOMEM upon memory exhaustion, ignoring it
might cause the SoundWire core to unknowingly operate on uninitialized
properties (e.g., null pointers for src_dpn_prop), leading to null pointer
dereferences during enumeration.

[ ... ]
> @@ -185,14 +205,47 @@ static int class_sdw_probe(struct sdw_slave *sdw, c=
onst struct sdw_device_id *id
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL_NS_GPL(sdca_class_probe, "SND_SOC_SDCA_CLASS");

[Severity: Medium]
Does sdca_class_probe() create a use-after-free hazard for caller drivers on
probe failure?

If a caller allocates sdca_class_drv via devm, calls sdca_class_probe(), and
encounters an error before its own probe finishes, the async boot_work is l=
eft
queued:

    queue_work(system_long_wq, &drv->boot_work);
    return 0;

If the caller unwinds its devres allocations without manually cancelling the
work, the background class_boot_work() could dereference the freed drv poin=
ter.
Should a devm action be added to guarantee the cancellation of boot_work?

[Severity: High]
This is a pre-existing issue, but does sdca_class_probe() leak the PM runti=
me
usage counter if devm_pm_runtime_enable() fails?

In sdca_class_probe(), pm_runtime_get_noresume(dev) increments the usage
counter. If devm_pm_runtime_enable(dev) fails immediately after, the functi=
on
returns directly without calling pm_runtime_put_noidle() to decrement the
usage counter:

    pm_runtime_get_noresume(dev);

    ret =3D devm_pm_runtime_enable(dev);
    if (ret)
        return ret;

Could this permanently prevent the device from entering runtime suspend?

> =20
> -static void class_sdw_remove(struct sdw_slave *sdw)
> +static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_devic=
e_id *id)
> +{
[ ... ]
+
+/**
+ * sdca_class_remove - SDCA class SoundWire slave remove helper
+ * @drv: caller-owned sdca_class_drv (the one handed to sdca_class_probe()=
).
+ *
+ * Cancels the deferred boot work so devres can safely free @drv and the
+ * embedding codec priv without racing class_boot_work.  Codec-specific
+ * SoundWire drivers that call sdca_class_probe() must call this from
+ * their .remove with the same drv pointer they passed to probe.
+ */
+void sdca_class_remove(struct sdca_class_drv *drv)
+{
>  	cancel_work_sync(&drv->boot_work);
>  }
> +EXPORT_SYMBOL_NS_GPL(sdca_class_remove, "SND_SOC_SDCA_CLASS");

[Severity: High]
This is a pre-existing issue, but does this leak the PM runtime usage count=
er
if the deferred boot work is cancelled before execution?

sdca_class_probe() increments the PM usage count via pm_runtime_get_noresum=
e().
The decrement exclusively occurs inside the deferred class_boot_work(). If =
the
device is removed and cancel_work_sync() successfully prevents the work from
running, the return value of cancel_work_sync() is ignored and the decrement
never occurs.

> +
> +static void class_sdw_remove(struct sdw_slave *sdw)
> +{
> +	struct sdca_class_drv *drv =3D dev_get_drvdata(&sdw->dev);
> +
> +	sdca_class_remove(drv);
> +}
> =20
>  /**
>   * sdca_class_system_suspend - SDCA class system suspend helper

[Severity: High]
This is a pre-existing issue, but does sdca_class_system_suspend() leave the
device's interrupt permanently disabled if runtime force suspend fails?

In sdca_class_system_suspend():

    disable_irq(drv->sdw->irq);

    ret =3D pm_runtime_force_suspend(drv->dev);
    if (ret) {
        dev_err(drv->dev, "failed to force suspend: %d\n", ret);
        return ret;
    }

If pm_runtime_force_suspend() fails, the error is returned immediately and =
the
system suspend transition is aborted. However, enable_irq(drv->sdw->irq) is=
 not
called in this error path, which might render the device unresponsive to
interrupts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907083727.7337=
05-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3
