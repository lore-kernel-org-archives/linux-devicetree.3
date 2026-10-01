Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24513DDB15
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848954; cv=none; b=I1ATUJBEcrZDnqBZ6t/q0t4+ECx3dGNI8XoiGsGdAPepvmsBLGeKh0G7YO93NTHJeQM0x4t6dOIW4YBjUZ9pRnd9O3vsEZgn2W6HxfoTxiciowIJMDKiSTRhvvKXXGMZu7cHsnlCO8PLBh6JbVFWwIeH2sDrO0IPxHkozHBgiYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848954; c=relaxed/simple;
	bh=J8iAnd4mRd+xSZwgt4PcnG2OGSMAVlA+Wd+znfSd5Ns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kio4VGp3PWhrnooqwOtH1Lr7o42upi3sPpY9A3cfacmdiTVCzGp++XKqpOjI/Wc+e1vM8x75DQTiH2VE057NbdLdsWHRhzzkCwa4ubKjB/8gL86boiE0pZlRFO23s8g2Qit7DVx8fksVg5NIkWxpXEj6bDwj2HhG+GeGd314d9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGkStYVI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGkStYVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDB11F000FF;
	Thu,  1 Oct 2026 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790848953;
	bh=joIjb1p9yEQKft8Zdr3VQFNOUWs1d2xgW8UIo1CDkUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WGkStYVI5C6/nno3Hf1wTw3BterClLDO/DPrxp96wC1OLZOPCbwVTNp99s3gD2TKN
	 Pfg5U9HqjbynR6sxZ/FlK/enqHI6onWI/0H6dzn/+/3DdSsfWJG03Blv5gUGFiqwPQ
	 YFTC4lnPiiV5jr0XxoSoVXX6+KqwHVIC2BEx1z4KtEgkwvmX59kVc2KrAvkhOypglH
	 vCy1+JnoL2Uq6a5UOe6sGGCQC5up+xYyKhISJLs8Ef/5uKes5OhsQtZ2G3XqIfHKEi
	 g2CBxzBT+xpdEZqPavCeLVgGv4LqK3tyMGsXJ+VNGpfOcMdzOrvpSH0CqXn/byFMco
	 bDSG5Q0gkfHQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] soundwire: qcom: add multi-master support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 10:02:32 +0000
Message-Id: <20261001100233.1EDB11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] soundwire: qcom: use-after-free in qcom_swrm_multi_master_setup du=
e to lockless drvdata access
- [High] soundwire: qcom: out-of-bounds MMIO access due to unchecked port_n=
um underflow
- [High] soundwire: qcom: clock double-disable and unclocked access risk in=
 remove path
- [Medium] soundwire: qcom: interface clock leaked for dependent multi-mast=
er device
--

commit c7571d3da0c003125e279a9926c2184e7157d267
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
soundwire: qcom: add multi-master support

This commit adds support for v3.1.0+ Qualcomm SoundWire IPs that are paired
to expose one logical bus with more than two DATA lanes. It introduces a
multi-master mode where one primary IP owns SWR_CLK and handles commands,
while the dependent IP provides data lanes only. A device link enforces
unbind ordering between the two controllers.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 35ffffd541bd1..767147a6635dc 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
[ ... ]
> @@ -1040,9 +1051,41 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bu=
s *bus)
[ ... ]
> +static struct qcom_swrm_ctrl *
> +qcom_swrm_port_target(struct qcom_swrm_ctrl *ctrl, u8 port_num, u32 *reg)
> +{
> +	u8 lane =3D ctrl->pconfig[port_num].lane_control;
> +
> +	if (ctrl->peer_ctrl && lane >=3D ctrl->peer_first_lane &&
> +	    lane < ctrl->peer_first_lane + ctrl->num_peer_lanes) {
> +		*reg -=3D ctrl->peer_dpn_offset;

[Severity: High]
Is there a risk of an integer underflow here resulting in an out-of-bounds
MMIO access?

If the device tree maps a logical port (port_num) where the computed regist=
er
address is smaller than the offset parameter passed via
qcom,multi-master-peer, *reg would underflow.

This wrapped address would then be used in reg_write, writing directly to
out-of-bounds MMIO. Does this subtraction require bounds checking?

> +		return ctrl->peer_ctrl;
> +	}
> +	return ctrl;
> +}
[ ... ]
> @@ -1562,6 +1610,73 @@ static int swrm_reg_show(struct seq_file *s_file, =
void *data)
[ ... ]
> +static int qcom_swrm_multi_master_setup(struct qcom_swrm_ctrl *ctrl)
> +{
> +	struct of_phandle_args args;
> +	struct qcom_swrm_ctrl *peer;
> +	struct platform_device *pdev;
> +	u32 offset;
> +	int ret;
[ ... ]
> +	pdev =3D of_find_device_by_node(args.np);
> +	of_node_put(args.np);
> +	if (!pdev)
> +		return -EPROBE_DEFER;
[ ... ]
> +	peer =3D platform_get_drvdata(pdev);
> +	if (!peer || !peer->is_dependent) {

[Severity: High]
Can evaluating peer->is_dependent here lead to a use-after-free?

platform_get_drvdata(pdev) is called without holding device_lock(&pdev->dev=
).
If a concurrent sysfs unbind occurs on the peer device, devres could free t=
he
qcom_swrm_ctrl structure right before dev_set_drvdata(dev, NULL) is called
in the driver core teardown.

This creates a window where peer points to freed memory when evaluating
peer->is_dependent.

> +		ret =3D -EPROBE_DEFER;
> +		goto out;
> +	}
[ ... ]
> @@ -1689,6 +1817,16 @@ static int qcom_swrm_probe(struct platform_device =
*pdev)
[ ... ]
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

[Severity: Medium]
Does this early return permanently strand the interface clock in a powered-=
on
state?

Because probe returns 0 early for dependent devices, it bypasses
pm_runtime_enable(). Since probe already called
clk_prepare_enable(ctrl->hclk), the clock is never disabled as
swrm_runtime_suspend will never be invoked for the dependent device.

If the clock is shared with the primary device, the dependent's reference
keeps the physical clock constantly on.

> +	}
> +
>  	ret =3D sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
[ ... ]
> @@ -1733,7 +1886,21 @@ static void qcom_swrm_remove(struct platform_devic=
e *pdev)
>  {
>  	struct qcom_swrm_ctrl *ctrl =3D dev_get_drvdata(&pdev->dev);
> =20
> -	sdw_bus_master_delete(&ctrl->bus);
> +	/* delete bus before dropping peer_ctrl; in-flight ops deref it */
> +	if (!ctrl->is_dependent)
> +		sdw_bus_master_delete(&ctrl->bus);
> +
> +	if (ctrl->is_primary && ctrl->peer_ctrl) {
> +		struct qcom_swrm_ctrl *peer =3D ctrl->peer_ctrl;
> +
> +		peer->reg_write(peer,
> +				peer->reg_layout[SWRM_REG_INTERRUPT_CPU_EN], 0);

[Severity: High]
Does this risk unclocked hardware access or unbalanced clock disables?

qcom_swrm_remove executes these teardown writes and the subsequent
clk_disable_unprepare without first calling pm_runtime_get_sync(ctrl->dev).
Since the driver core may call remove while the device is runtime suspended
(where swrm_runtime_suspend has already disabled hclk), writing to peer
registers during this suspended state may cause interconnect stalls.

Furthermore, clk_disable_unprepare(ctrl->hclk) gets called twice, causing a
clock underflow warning from the clock framework.

> +		/* disable peer SWRM; releases shared SWR_CLK */
> +		peer->reg_write(peer, SWRM_COMP_CFG_ADDR, 0);
> +		peer->peer_ctrl =3D NULL;
> +		ctrl->peer_ctrl =3D NULL;
> +	}
> +
>  	clk_disable_unprepare(ctrl->hclk);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001093806.6348=
62-1-srinivas.kandagatla@oss.qualcomm.com?part=3D2
