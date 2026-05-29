Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AC0332EC1
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780019148; cv=none; b=fCs71FdSIjaoYINehVu2dQ1I7B3w6/3/5NOk6nSTKslQbRYaJRoADDbq7DCOVXAtBgEz/QYic4x4vbh/3dnCDEK5fGgAOaVDlWnkvmw9z5LqLX7uNFC+FCeHkrCpvZnAQVSq4gbqHLn4NnrSk6v6MmtWV4/wTWdIm7WR54pZOvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780019148; c=relaxed/simple;
	bh=EBViwOimw0MOj+6v+sPn/LfM6IepEikZZaQyOonowwQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=isQ+LTfQF/8IxSPrLQHgPi7PsFo4xlLxyVgMfDbT2vprSqw55AQaDKhnoCuRnD7hPeSlKDOvJoCR5CiwwpMFzxdf8y9cnEi2/4sCoSCZcjFzPTzG3FgCAELGjE80ZOE+M87fB0LtIV16m9Wr72dZ72neGsN9lSqJmeYXutrDtr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqTng5Gh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqTng5Gh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7161F000E9;
	Fri, 29 May 2026 01:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780019146;
	bh=efve9e+mQ3Rbl2qiwr8ukg6X+uRKzXmdiikZu2a9m6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oqTng5GhOew3kkJ+7MZa2LV5QGb5H1lNs8+EIf52T466vChoBSW5alOQyLwdLNNtb
	 ETtZCoyHlgflB3MlG3l5HpHNS99EsYLUCb2uHI36bY/E6G7tbUGwdEep0BZv1J8mJw
	 40Tno7I4C2IAlutCeu2lHlRDOLtdqhCscpIoUd9sJXVTBqJXkg3t102Zw2jTZ0fKXH
	 XlzOue+bNpX8JHvDOf27KAJaOwTPpuUxnPbvEHzMgzPw2sb2e7sm5PigXHNqJ6Sm+t
	 R+nNtTUjQ3CiKU9qDlo5OOW1m22I0ejmkoG1GbgJqs5yDndwBL0GYxB4nJtm7sHPUa
	 JtQ/VcJos/H7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to
 issue write commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
References: <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 01:45:46 +0000
Message-Id: <20260529014546.AF7161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Returning `-ENODEV` instead of `-EPROBE_DEFER` when the RPMH contr=
oller hasn't fully probed causes premature and permanent probe failures for=
 consumers.
- [High] Missing validation of the device tree phandle target can lead to t=
ype confusion and memory corruption.

Pre-existing issues:
- [Critical] Stack variables accessed asynchronously after stack frame is d=
estroyed on timeout, leading to Use-After-Free.
--

commit 4f9cc5ff213e0a26acf5f3c77494a0af70926c9e
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

soc: qcom: rpmh: Allow non-child devices to issue write commands

This patch extends the RPMH driver to allow any device with a pointer to
the RPMH controller device to issue write commands. It introduces
rpmh_get_ctrlr_dev() to look up the controller via a device tree phandle,
and new APIs to accept the controller device pointer directly.

> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index ca37da3dc2b14..9dbc42b775d9f 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
[ ... ]
> @@ -76,6 +77,21 @@ static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct =
device *dev)
>  	return &drv->client;
>  }
> =20
> +static struct rpmh_ctrlr *get_rpmh_ctrlr_from_dev(const struct device *c=
trl_dev)
> +{
> +	struct rsc_drv *drv;
> +
> +	if (!ctrl_dev)
> +		return ERR_PTR(-EINVAL);
> +
> +	drv =3D dev_get_drvdata(ctrl_dev);
> +
> +	if (!drv)
> +		return ERR_PTR(-ENODEV);

[Severity: High]
If the RPMH controller device is found by of_find_device_by_node() but hasn=
't
fully probed yet, dev_get_drvdata() will return NULL. Does returning -ENODEV
here cause a premature and permanent probe failure for consumers instead of
allowing them to gracefully defer by returning -EPROBE_DEFER?

> +
> +	return &drv->client;
> +}
[ ... ]
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
> +	struct device_link *link;
> +	int ret;
> +
> +	rpmh_np =3D of_parse_phandle(dev->of_node, "qcom,rpmh", 0);
> +	if (!rpmh_np)
> +		return ERR_PTR(-ENODEV);
> +
> +	pdev =3D of_find_device_by_node(rpmh_np);

[Severity: High]
If a device tree maliciously or accidentally points the "qcom,rpmh" phandle
to a non-RPMH device, is it possible for drvdata to point to a different
driver's structure when get_rpmh_ctrlr_from_dev() evaluates it?

Would this cause type confusion and memory corruption when the consumer
subsequently casts it to struct rsc_drv? Should there be a validation
check to ensure the resolved device is actually an RPMH controller?

> +	of_node_put(rpmh_np);
> +
> +	if (!pdev)
> +		return ERR_PTR(-EPROBE_DEFER);
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
> +}

[Severity: Critical]
This is a pre-existing issue, but can this lead to a stack use-after-free
if the timeout expires?

If wait_for_completion_timeout() times out, the function returns -ETIMEDOUT
and the local stack frame is destroyed. However, rpm_msg and compl are
allocated on the stack and the hardware transaction isn't explicitly
canceled.

When the hardware eventually completes the request, the interrupt handler
would call rpmh_tx_done() which accesses the stale rpm_msg->completion
pointer and calls complete(), writing to unmapped or reused stack memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-pinctrl-le=
vel-shifter-v2-0-3a6a025392bf@oss.qualcomm.com?part=3D1
