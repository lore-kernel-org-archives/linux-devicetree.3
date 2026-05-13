Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9651991D4
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778646107; cv=none; b=oWZg0EUuZEChxBulueACLUZMvfDWZeKtLjkHw/xLqvpWWqldXMGf68Z5JspqiaJM84fbU1vevYUmwzJsTKBvVWx5vNCgYCv3io1OWi4nq22mUfajbgOdn/0UveDluHgi6mXWxi7Vc0DAo2xoWUYORsdXiIq3SMOXNJd08ohuLjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778646107; c=relaxed/simple;
	bh=ZUp5hcdmAujcxM4Mdw4SLtHydUSZSCaTcjNdjRzpw74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tMvOmc/SjDjkXoxu5m1msPPePg7mn9sPs3lCtqoeZOk4zGtzmlgdqx5RGy6HyPdD/z1+tXK6sKDNMxdkTzk+Z7UseQ+GpZP8y/lB/ysosLidthd5mQzitzPUVou21dft3lLP7rQ8GJJER19yucDDJGM+QukXcTAlYqNO2BIOyyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2j4OY09; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2j4OY09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA07DC2BCB7;
	Wed, 13 May 2026 04:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778646107;
	bh=ZUp5hcdmAujcxM4Mdw4SLtHydUSZSCaTcjNdjRzpw74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=N2j4OY09EsmDKqHh/yK5SfSD8A0LLkd+0dhTDJiQDwKREgmOJABZXdXggdvxpxdDr
	 5+e6V0HKRCiGUMX7y+8nljhDrL7Tzuw2d+eYcbvY+XrPdYqmqqbppFXk/Gp3RI2UQp
	 4DGTBwFB0KnDXZzWSKEOZzUe/z79hA5yifMJc/wgoVrdLT9xSb6jBRzcnHSq1yFGjx
	 n8MMpqN0H/GQdJsfGifgoIZ85O/5fJUkd9p8DXxgrYBLy71Rs04d/mLB8R97klxQs4
	 5/vrvXqj1NtcrXnadjGCVaO04kssKbE7t0A9n71GM0WrMfJprntSRcEplcpKQWvFkA
	 4gJ4gW+FW/t2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linlin Zhang" <linlin.zhang@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com>
References: <20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 04:21:46 +0000
Message-Id: <20260513042146.EA07DC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Runtime PM transitions in legacy bindings target the consumer =
device instead of the ICE driver, causing recursive PM calls and deadlocks.
- [High] The ICE core clock remains permanently enabled, negating the power=
 savings of runtime PM.
- [High] Probe function unconditionally holds a PM runtime usage count, cau=
sing underflows on removal or premature suspends during active consumer use.
- [High] Missing PM runtime usage count decrement on error path in `qcom_ic=
e_resume()`.
- [Low] Unconditional assignment of PM operations produces dead code and co=
mpiler warnings when PM is disabled.
--

commit 06d65ce92438c9c71440b4209d19b0ada46013d3
Author: Linlin Zhang <linlin.zhang@oss.qualcomm.com>

soc: qcom: ice: Enable PM runtime for ICE driver

The QCOM ICE driver manages the ICE core clock through direct calls to
clk_prepare_enable() and clk_disable_unprepare(), which limits integration
with platforms that rely on firmware-managed resources or platform-specific
power management mechanisms.

> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cadd..6f9d679b530cc 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c

[ ... ]

> @@ -310,8 +311,8 @@ int qcom_ice_resume(struct qcom_ice *ice)
>  	struct device *dev =3D ice->dev;
>  	int err;
> =20
> -	err =3D clk_prepare_enable(ice->core_clk);
> -	if (err) {
> +	err =3D pm_runtime_resume_and_get(dev);
> +	if (err < 0) {
>  		dev_err(dev, "failed to enable core clock (%d)\n",
>  			err);
>  		return err;

For legacy devicetree bindings, the ICE instance is instantiated using the
consumer device, so dev points directly to the UFS device.

If qcom_ice_resume() is invoked from within the UFS controller's own
runtime_resume callback, does this cause a deadlock?

rpm_resume() would detect that the device is already in the RPM_RESUMING
state, and the thread would block waiting for itself to finish.

Also, if qcom_ice_wait_bist_status(ice) fails later in this function:

drivers/soc/qcom/ice.c:qcom_ice_resume() {
    ...
	qcom_ice_hwkm_init(ice);
	return qcom_ice_wait_bist_status(ice);
}

Does this leak the PM usage count, since pm_runtime_put() is not called
on the error path?

> @@ -323,7 +324,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
> =20
>  int qcom_ice_suspend(struct qcom_ice *ice)
>  {
> -	clk_disable_unprepare(ice->core_clk);
> +	pm_runtime_put_sync(ice->dev);

Does this cause a PM usage count underflow for legacy bindings?

Since ice->dev is the consumer device, calling this during the UFS
controller's runtime_suspend callback might drop the usage count below 0
because the consumer's usage count is already 0.

[ ... ]

> @@ -716,24 +717,69 @@ EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
> =20
>  static int qcom_ice_probe(struct platform_device *pdev)
>  {
> +	struct device *dev =3D &pdev->dev;

[ ... ]

> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {
> +		dev_warn(dev, "Runtime PM fails to resume, ret: %d\n", ret);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
> =20
> +static void qcom_ice_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_put_sync(&pdev->dev);
> +}

Does this create a race condition with the consumer device?

The probe function holds a PM runtime usage count, and the driver seems to
expect the consumer's suspend routine to drop this initial reference.

If the UFS driver suspends, the ICE count drops to 0. If the ICE driver is
subsequently unbound, qcom_ice_remove() will call pm_runtime_put_sync(),
dropping the usage count to -1.

Conversely, if ICE is unbound while UFS is resumed (count is 1),
qcom_ice_remove() drops the count to 0, suspending the ICE hardware while
the active UFS consumer is still relying on it for crypto operations.

[ ... ]

> +static int ice_runtime_suspend(struct device *dev)
> +{
> +	struct qcom_ice *ice =3D dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(ice->core_clk);
> +	return 0;
> +}

Does the ICE core clock remain permanently enabled anyway?

If the core clock is acquired in qcom_ice_create() using
devm_clk_get_enabled() or devm_clk_get_optional_enabled(), it holds a
permanent enable reference on the clock.

When ice_runtime_suspend() calls clk_disable_unprepare(), it would only
decrement the clock's enable count from 2 back to 1, leaving the physical
hardware clock continuously running.

[ ... ]

>  static struct platform_driver qcom_ice_driver =3D {
>  	.probe	=3D qcom_ice_probe,
> +	.remove =3D qcom_ice_remove,
>  	.driver =3D {
>  		.name =3D "qcom-ice",
> +		.pm =3D &ice_pm_ops,

This isn't a bug, but should this use pm_ptr(&ice_pm_ops)?

When CONFIG_PM is disabled, SET_RUNTIME_PM_OPS expands to nothing,
which leaves the static functions ice_runtime_suspend and
ice_runtime_resume unreferenced and may cause unused-function warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512033750.3393=
050-1-linlin.zhang@oss.qualcomm.com?part=3D2
