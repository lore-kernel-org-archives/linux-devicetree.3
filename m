Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89824396579
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875602; cv=none; b=nMyEzt3xWhD40bukQqF8KiYVxA/Y+uYoudUoVBhE1lofkEwLp3h4MmW6E2cJxyhC9O6ljaeOu6TEWsV5jAqH8ANeMVWQX6iWKXr+NY9TJEU/5tFp31qxhLEU26INPjJDLex7m7XtrsufP9+E0XZ+jkQPAB/EIul1FRAmQEePtkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875602; c=relaxed/simple;
	bh=Uiw1nO3BFLQQG49Tc9AkYJeRohiIdhKUnAQmqodpj/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sqmye63CTB1F8JY2ujC4c/fVCmNGbK/nRUY9wduPJ/4TY6s6UDw+g4IvOcU1vI02PUxpZKXBlCOCMTt1CGhPdEC4KbG1PpzfNR2BWy0mEgMFfyjsPuEjp8sOVhHyKK2h/Y8yb7vYjlKWXvLuavGDyRNzS42Cpm/I+tyPgc+FOew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETsqc3DH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETsqc3DH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CF41F000E9;
	Wed, 27 May 2026 09:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779875601;
	bh=pqtZeJIezbRstSqn0pUJcBhafvhAcGIC/JatkkHZu+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ETsqc3DHIcNu0wE475Acwdk0NyGjDj1R+ixyIMVrluSL/VC3qrlCXMMX/nQ59LkYe
	 uuFRYXUpsdB16teEFTDCxVmrAGeHfXXdJyahkf1/HMiZb4dYWf6KO2DhahccY/4P0j
	 zO3AEJlZQA20OGQFlPcMN+HAHBEFN/x0A4FFNVhU3nadqPVxFNMAboDpX6E3Hlo2LL
	 ZbmnFt2NseQM5t7qbv9NN1DXELaWsiYMww/TRlrdmGR4dNej6jg7jgk7i5S7PHlEZf
	 0SwJ2dEGVmtEQm2oxmB+uNM1T7UXyFwKbUsjuK6AWyjYBe4ypAVObHHQW80EsfOvzV
	 yKdLLqOOPUscg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527-pinctrl-level-shifter-v1-1-1965461d0a7c@oss.qualcomm.com>
References: <20260527-pinctrl-level-shifter-v1-1-1965461d0a7c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 09:53:20 +0000
Message-Id: <20260527095321.03CF41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Casting `put_device` to `void (*)(void *)` for `devm_add_action_or=
_reset` will trigger a Control-Flow Integrity (CFI) kernel panic.
- [High] Lack of device links allows non-child consumer devices to access t=
he hardware after unbind or while suspended, leading to UAF or physical sta=
te machine violations.

Pre-existing issues:
- [High] If `wait_for_completion_timeout` times out, a dangling stack point=
er is left for the hardware completion interrupt to access, causing stack c=
orruption.
--

commit 033be046152076a7be483616e27b4cc044eaf8da
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

soc: qcom: rpmh: Allow non-child devices to issue write commands

This patch extends the RPMH driver to support write commands from any
device that has a pointer to the RPMH controller device by looking up
the controller via the qcom,rpmh device tree phandle.

> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index ca37da3dc2b14..9c7844434e9a1 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c

[ ... ]

> @@ -271,6 +294,114 @@ int rpmh_write(const struct device *dev, enum rpmh_=
state state,
>  }
>  EXPORT_SYMBOL_GPL(rpmh_write);
> =20
> +/**
> + * rpmh_get_ctrlr_dev: Get RPMH controller device from device tree
> + *
> + * @dev: Device with "qcom,rpmh" phandle property
> + *
> + * Returns: Pointer to RPMH controller device, with a devm action regist=
ered
> + * on @dev to release the reference when @dev is unbound.
> + */
> +struct device *rpmh_get_ctrlr_dev(struct device *dev)
> +{
> +	struct device_node *rpmh_np;
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	rpmh_np =3D of_parse_phandle(dev->of_node, "qcom,rpmh", 0);
> +	if (!rpmh_np)
> +		return ERR_PTR(-ENODEV);
> +
> +	pdev =3D of_find_device_by_node(rpmh_np);
> +	of_node_put(rpmh_np);
> +
> +	if (!pdev)
> +		return ERR_PTR(-EPROBE_DEFER);
> +

[Severity: High]
Since qcom,rpmh is a custom property, fw_devlink does not automatically
establish a device link. Without a device link created here (e.g., via
device_link_add()), is there any guarantee on PM or probe ordering?

Without a device link, a consumer could access the RPMH hardware while it is
runtime-suspended or after the RPMH driver has been unbound. If the RPMH
driver unbinds, its devres-managed struct rsc_drv is freed. The consumer's
devm action only pins the struct device, so calling dev_get_drvdata() later
could return a dangling pointer, leading to a Use-After-Free.

> +	ret =3D devm_add_action_or_reset(dev, (void (*)(void *))put_device,
> +				       &pdev->dev);

[Severity: High]
Will casting put_device to (void (*)(void *)) trigger a Control-Flow
Integrity (CFI) kernel panic?

The put_device function is defined as void put_device(struct device *dev).
Under KCFI, the mismatch between the expected function signature and the
actual signature of put_device will fail the hash check, resulting in a
kernel panic when the consumer device unbinds or its probe fails.

Could a wrapper function matching the void (*)(void *) signature be used
instead?

> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return &pdev->dev;
> +}
> +EXPORT_SYMBOL_GPL(rpmh_get_ctrlr_dev);

[ ... ]

> +/**
> + * rpmh_write_ctrlr: Write RPMH commands and block until response,
> + * with the controller device pointer
> + *
> + * @ctrlr_dev: The RPMH controller device
> + * @state: Active/sleep set
> + * @cmd: The payload data
> + * @n: The number of elements in @cmd
> + *
> + * May sleep. Do not call from atomic contexts.
> + */
> +int rpmh_write_ctrlr(const struct device *ctrlr_dev, enum rpmh_state sta=
te,
> +		     const struct tcs_cmd *cmd, u32 n)
> +{
> +	DECLARE_COMPLETION_ONSTACK(compl);
> +	/* dev is unused in the synchronous non-batch path; pass NULL */
> +	DEFINE_RPMH_MSG_ONSTACK(NULL, state, &compl, rpm_msg);
> +	struct rpmh_ctrlr *ctrlr;
> +	int ret;
> +
> +	ctrlr =3D get_rpmh_ctrlr_from_dev(ctrlr_dev);
> +	if (IS_ERR(ctrlr))
> +		return PTR_ERR(ctrlr);
> +
> +	ret =3D __fill_rpmh_msg(&rpm_msg, state, cmd, n);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D __rpmh_write_direct(ctrlr, state, &rpm_msg);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
> +	WARN_ON(!ret);
> +	return (ret > 0) ? 0 : -ETIMEDOUT;

[Severity: High]
This isn't a bug introduced by this patch, but it appears to be a
pre-existing issue copied from rpmh_write(). If
wait_for_completion_timeout() expires, doesn't it leave a dangling stack
pointer for the hardware completion interrupt to access?

The rpm_msg and its completion are allocated on the stack. If the timeout
expires, the function returns and its stack frame is released, but the
hardware request is not canceled.

When the hardware eventually completes the transaction, the asynchronous
interrupt handler calls rpmh_tx_done(), which dereferences the now-invalid
rpm_msg pointer and attempts to call complete(), corrupting stack memory.

> +}
> +EXPORT_SYMBOL_GPL(rpmh_write_ctrlr);
> +
>  static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req=
 *req)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-pinctrl-le=
vel-shifter-v1-0-1965461d0a7c@oss.qualcomm.com?part=3D1
