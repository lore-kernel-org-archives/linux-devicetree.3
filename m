Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE2330648A
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778649415; cv=none; b=i9U6cLwPLCKreZ4wJ0cMY/vaRRHKjlUYPlHpaWrW0v39r5opW4uUw7cRw7z2JQJ8nb5oufh9I7J3vFgK5xphQ6p5jrJ4Mcc0qzfHXD3xs+scCY+TH+1kWaGVhx1/IRILvKXk813EJpMzkiuAu6QKW6KiJDO07S3Ga2dwawaCe5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778649415; c=relaxed/simple;
	bh=+wMkV5m0aY0ZkjoNrBp2cS7dSdKAo6P/X/U3YNK9YkA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Czh8GJJImgHZyDpikk3zfAVl4pjJmoqwgofWVgXuGH4K/A4ScTTxITJeCUCvcZW/90OWlVCretTUogdbbnaQwzeiuxD2ZGWcIHurkG12ArGdJlUhEFW2WFh18pKyB56+pLjksAIBtAW3YVrgDWxSZ+oo+zB8+/XMIsP+3c8alVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gL1XS6w3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gL1XS6w3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA04C2BCB7;
	Wed, 13 May 2026 05:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778649414;
	bh=+wMkV5m0aY0ZkjoNrBp2cS7dSdKAo6P/X/U3YNK9YkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gL1XS6w3/o70O//dQ98FfLG3gQe9e3FgJc4GsIHGm4+/pM3aXWHKAcOPxDjrCjt5/
	 PywxwuPz9uZ0uMffkeIqILfwPwNOEmQei+ry6o1nq1TeX6rnA2oQ+PtyadFsh9Hjs8
	 AoNWTW1WjxBdpjSCK0C7kscrVzIH5tHswuy8ofi1v0BTjNVd8/sPuJnPtNDgJa7DeQ
	 xjk83A36b/aneRJZbdpPRqPTox+bBNtnXCA1lWeo7AUz0qVYD0M8uxZ31ONBZW0Esp
	 mAUV0NgBNWMxMWevoS/KM0CQvwf/rmeTrDyDSkgfUUx+MKVouzwPHQTLNYeOBK/7cC
	 hov44q9MjquNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] soc: qcom: ice: Add SCMI support for sa8255p
 based targets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linlin Zhang" <linlin.zhang@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512033750.3393050-4-linlin.zhang@oss.qualcomm.com>
References: <20260512033750.3393050-4-linlin.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 05:16:54 +0000
Message-Id: <20260513051654.AAA04C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Type confusion in `qcom_ice_create` causes system crash for le=
gacy consumers.
- [Critical] Premature hardware access on `fw_managed` devices before SCMI =
PM domain is resumed.
- [Low] Discarded `const` qualifier on `device_get_match_data()` return val=
ue.
--

commit f67a1074aa6c150b2ffc9f1fb18d4a18e025ed13
Author: Linlin Zhang <linlin.zhang@oss.qualcomm.com>

soc: qcom: ice: Add SCMI support for sa8255p based targets

This commit adds SCMI power and performance protocol support for managing
ICE clocks on the Qualcomm SA8255p SoC. It introduces a firmware-managed
flag via match data to skip explicit clock enablement, relying on runtime
PM framework APIs instead.

> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 6f9d679b530cc..cf185a6e19731 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
[ ... ]
> @@ -570,20 +575,23 @@ static struct qcom_ice *qcom_ice_create(struct devi=
ce *dev,
>  	engine->dev =3D dev;
>  	engine->base =3D base;
> =20
> -	/*
> -	 * Legacy DT binding uses different clk names for each consumer,
> -	 * so lets try those first. If none of those are a match, it means
> -	 * the we only have one clock and it is part of the dedicated DT node.
> -	 * Also, enable the clock before we check what HW version the driver
> -	 * supports.
> -	 */
> -	engine->core_clk =3D devm_clk_get_optional_enabled(dev, "ice_core_clk");
> -	if (!engine->core_clk)
> -		engine->core_clk =3D devm_clk_get_optional_enabled(dev, "ice");
> -	if (!engine->core_clk)
> -		engine->core_clk =3D devm_clk_get_enabled(dev, NULL);
> -	if (IS_ERR(engine->core_clk))
> -		return ERR_CAST(engine->core_clk);
> +	engine_cfg =3D device_get_match_data(dev);
> +	if (!engine_cfg || !engine_cfg->fw_managed) {

When qcom_ice_create() is called via the legacy fallback path
(of_qcom_ice_get()), the dev parameter points to the consumer device (e.g.,
the SDHCI or UFS host controller), not the dedicated ICE device.

Will calling device_get_match_data(dev) here retrieve the match data of the
consumer driver rather than struct engine_desc?

If the consumer's match data structure happens to have a non-zero byte where
fw_managed is expected, this could falsely evaluate to true, skipping clock
initialization and leading to a crash.

> +		/*
> +		 * Legacy DT binding uses different clk names for each consumer,
> +		 * so lets try those first. If none of those are a match, it means
> +		 * the we only have one clock and it is part of the dedicated DT node.
> +		 * Also, enable the clock before we check what HW version the driver
> +		 * supports.
> +		 */
> +		engine->core_clk =3D devm_clk_get_optional_enabled(dev, "ice_core_clk"=
);
> +		if (!engine->core_clk)
> +			engine->core_clk =3D devm_clk_get_optional_enabled(dev, "ice");
> +		if (!engine->core_clk)
> +			engine->core_clk =3D devm_clk_get_enabled(dev, NULL);
> +		if (IS_ERR(engine->core_clk))
> +			return ERR_CAST(engine->core_clk);
> +	}
> =20
>  	if (!qcom_ice_check_supported(engine))
>  		return ERR_PTR(-EOPNOTSUPP);

For firmware-managed devices, the driver skips explicitly enabling the
ICE core clock. However, qcom_ice_check_supported() immediately reads the
QCOM_ICE_REG_VERSION hardware register.

Could this access cause a bus fault on firmware-managed devices?

The runtime PM framework is responsible for the SCMI power and performance
domain, but devm_pm_runtime_enable() is called in probe() after
qcom_ice_create() returns. Reading hardware registers before the PM
domain is active might violate power management ordering.

[ ... ]
> @@ -756,13 +764,17 @@ static void qcom_ice_remove(struct platform_device =
*pdev)
> =20
>  static int ice_runtime_resume(struct device *dev)
>  {
> -	struct qcom_ice *ice =3D dev_get_drvdata(dev);
> +	struct engine_desc *engine_cfg =3D device_get_match_data(dev);

This isn't a bug, but device_get_match_data() returns a const void pointer.

Assigning it to a non-const struct engine_desc pointer discards the const
qualifier and triggers a compiler warning. Could this be declared as
const struct engine_desc *engine_cfg instead, similar to how it is handled
in ice_runtime_suspend()?

>  	int err =3D 0;
> =20
> -	err =3D clk_prepare_enable(ice->core_clk);
> -	if (err) {
> -		dev_err(dev, "failed to enable core clock (%d)\n",
> -			err);
> +	if (!engine_cfg || !engine_cfg->fw_managed) {
> +		struct qcom_ice *ice =3D dev_get_drvdata(dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512033750.3393=
050-1-linlin.zhang@oss.qualcomm.com?part=3D3
