Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECD8469841
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116197; cv=none; b=oqFcdr1RPudNRHo/Gphr0WVVDp7uP/gaezchZ/SJliqodUpAUJlnWK9lX3t4BpKS4fbcBtvLE6YU7pQBDlI17+RbJqdU9E+KO9gnSxmvVkElclL9rW3YDHPZn6Dmq/Mpr7n+csfA/Mf47lvd3QIe0jbEGnQSJWtfy+Pm+u7b9qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116197; c=relaxed/simple;
	bh=di0ORcN5ljOK+Tni++HIwWJ4rNnULdmQ/2o6z6AFZMI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=thCDNBXXClEYlFQwjKhiYUR+i3+Ttu9NLX/33lh8l7ou4B0fKvTPgpILrKr/c3h6gppFwh9b4s4ufLBOrRHU9IETUFDW9ILFm0LxSAd+mJKWObAEo7pchVtmT4/5gMnvLlnn9rsRn41MxEKllEYhoDxn+Rzgt6VzOkP20yMqmNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTRb6las; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTRb6las"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CEB1F000FF;
	Fri, 11 Sep 2026 08:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116192;
	bh=kReTE1HysbsU8Xzf3F16n+Iph+S1FG0IlH7+WmtnzAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nTRb6lasL3rKDQab1MCqG7BJgopwkcqfha7DRCtqdXTDwRapAHdTDsLmG/7EP7Rnf
	 cjud4JM08oPwQ2r6/8Z/B4ctcX+ntwHu2oItQe+P3n77idGLRd1MAGXp5c1wrYlQym
	 YJSvEO3dzwrC4qMK/lPultzfmewBdu5F/4jGvKV5H2eKGVs1/CuL+tiFmiZ9X/Kxmu
	 J8lJgdXt1KslGVmIxrdc8HsndKTTJVp5kSPVjNF8pkHSOmWTlayjC07keFKzds2IRW
	 7ok5zrke4wRgrz3OyFYzkdRG+NljZg0zB8dXZX9+bXl0OYnFZoPNjxWh0fe8untqXL
	 i5XgiR8Pbe9iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] soundwire: qcom: add multi-master support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <0097b59e2b96d692b9fb542e207ee43f9dd44a7f.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
 <0097b59e2b96d692b9fb542e207ee43f9dd44a7f.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 08:43:12 +0000
Message-Id: <20260911084312.93CEB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The primary controller unconditionally enables hardware interrupts=
 on the dependent controller, whose IRQ handler will crash when accessing u=
ninitialized bus structures.
- [High] The dependent controller skips PM runtime initialization, permanen=
tly leaving its interface clock enabled and defeating the device link power=
 management.
- [High] If the primary controller's probe fails, the dependent controller =
is left with a dangling pointer to freed memory and inappropriately enabled=
 hardware interrupts.
- [High] Primary controller permanently fails to probe with -EINVAL if it p=
robes before the dependent controller has bound.
- [High] Lockless access to the peer device's driver state and drvdata duri=
ng multi-master setup causes a Use-After-Free if the peer device is concurr=
ently unbound.
- [High] Tearing down `peer_ctrl` linkage before calling `sdw_bus_master_de=
lete()` causes data races and potential NULL pointer dereferences for ongoi=
ng bus operations.
- [High] The primary controller writes to the peer's hardware registers dur=
ing probe without ensuring the peer device is runtime resumed.
--

commit 6d727a8db765ee8b093a2252b9a03525a3473f6a
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

soundwire: qcom: add multi-master support

v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical bus with
more than two DATA lanes. This patch supports this pairing using a device
link to enforce unbind ordering and power management.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 35ffffd541bd1..a5f39868161af 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
[ ... ]
> @@ -1562,6 +1608,68 @@ static int swrm_reg_show(struct seq_file *s_file, =
void *data)
>  DEFINE_SHOW_ATTRIBUTE(swrm_reg);
>  #endif
> =20
> +static int qcom_swrm_multi_master_setup(struct qcom_swrm_ctrl *ctrl)
> +{
> +	struct of_phandle_args args;
> +	struct qcom_swrm_ctrl *peer;
> +	struct platform_device *pdev;
> +	u32 offset;
> +	int ret;
> +
> +	ret =3D of_parse_phandle_with_fixed_args(ctrl->dev->of_node,
> +					       "qcom,multi-master-peer",
> +					       1, 0, &args);
> +	if (ret)
> +		return -EINVAL;
> +
> +	pdev =3D of_find_device_by_node(args.np);
> +	of_node_put(args.np);
> +	if (!pdev)
> +		return -EPROBE_DEFER;
> +
> +	if (pdev->dev.driver !=3D ctrl->dev->driver) {
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	peer =3D platform_get_drvdata(pdev);
> +	if (!peer || !peer->is_dependent) {
> +		ret =3D -EPROBE_DEFER;
> +		goto out;
> +	}

[Severity: High]
If the dependent controller is present in the device tree but has not yet
bound to its driver, pdev->dev.driver will be NULL. Does this strict equali=
ty
check cause the primary controller to permanently fail with -EINVAL instead=
 of
returning -EPROBE_DEFER to wait for the dependent controller?

[Severity: High]
Additionally, does accessing pdev->dev.driver and platform_get_drvdata(pdev)
without holding device_lock(&pdev->dev) allow for a use-after-free? If the
peer device is concurrently unbound via sysfs, devres could free the
underlying memory while it is being accessed here.

[ ... ]
> @@ -1689,6 +1810,16 @@ static int qcom_swrm_probe(struct platform_device =
*pdev)
>  		ctrl->bus.controller_id =3D val;
>  	}
> =20
> +	if (of_property_match_string(dev->of_node, "qcom,multi-master-mode", "d=
ependent") >=3D 0) {
> +		ctrl->is_dependent =3D true;
> +		dev_dbg(dev,
> +			"Qualcomm SoundWire multi-master dependent v%x.%x.%x registered (%u l=
anes)\n",
> +			(ctrl->version >> 24) & 0xff,
> +			(ctrl->version >> 16) & 0xff,
> +			ctrl->version & 0xffff, ctrl->num_lanes);
> +		return 0;
> +	}
> +

[Severity: High]
This early return bypasses all PM runtime setup for the dependent controlle=
r,
such as pm_runtime_enable(). Because its PM runtime is disabled, the PM core
considers it permanently suspended. Does this mean its swrm_runtime_suspend
callback is never invoked, permanently leaving ctrl->hclk enabled and
defeating the device link power management?

[Severity: High]
This early return also bypasses the initialization of the bus structures li=
ke
ctrl->bus.bus_lock and ctrl->bus.slaves. Later, the primary controller calls
qcom_swrm_init() on the dependent controller, which unconditionally enables
hardware interrupts by writing to SWRM_REG_INTERRUPT_CPU_EN. If the depende=
nt
hardware raises an interrupt, could its IRQ handler crash when attempting to
lock the uninitialized mutex or traverse the uninitialized slave list?

>  	ret =3D sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
>  	if (ret) {
>  		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
> @@ -1696,7 +1827,11 @@ static int qcom_swrm_probe(struct platform_device =
*pdev)
>  		goto err_clk;
>  	}
> =20
> +	if (ctrl->is_primary && ctrl->peer_ctrl)
> +		qcom_swrm_init(ctrl->peer_ctrl);
> +

[Severity: High]
This initiates register writes on the peer hardware without first calling
pm_runtime_get_sync() on the primary device. Since the primary controller is
not yet runtime-resumed during this phase of probe, the device link won't
have powered on the dependent controller either. Can this cause an unclocked
access exception or lost writes if the peer hardware is powered off?

[Severity: High]
If probe fails shortly after this (e.g., during qcom_swrm_register_dais()),
the error path unwinds the primary controller's structures. However, it
appears the dependent controller is left with a dangling pointer to freed
memory in peer->peer_ctrl and inappropriately enabled hardware interrupts.
Should the error path clean up the dependent controller's state?

>  	qcom_swrm_init(ctrl);
> +
>  	wait_for_completion_timeout(&ctrl->enumeration,
>  				    msecs_to_jiffies(TIMEOUT_MS));
>  	ret =3D qcom_swrm_register_dais(ctrl);
> @@ -1733,7 +1868,13 @@ static void qcom_swrm_remove(struct platform_devic=
e *pdev)
>  {
>  	struct qcom_swrm_ctrl *ctrl =3D dev_get_drvdata(&pdev->dev);
> =20
> -	sdw_bus_master_delete(&ctrl->bus);
> +	if (ctrl->is_primary && ctrl->peer_ctrl) {
> +		ctrl->peer_ctrl->peer_ctrl =3D NULL;
> +		ctrl->peer_ctrl =3D NULL;
> +	}
> +
> +	if (!ctrl->is_dependent)
> +		sdw_bus_master_delete(&ctrl->bus);
>  	clk_disable_unprepare(ctrl->hclk);
>  }

[Severity: High]
Clearing these cross-references before calling sdw_bus_master_delete() seems
to expose ongoing bus operations to data races and NULL pointer dereference=
s.
For example, concurrent streams calling qcom_swrm_pre_bank_switch() check
ctrl->peer_ctrl and then dereference it. Should the bus be stopped before
clearing the linkage?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789114385.gi=
t.srinivas.kandagatla@oss.qualcomm.com?part=3D2
