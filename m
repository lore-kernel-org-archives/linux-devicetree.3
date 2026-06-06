Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7485A18DB2A
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780751783; cv=none; b=c0YQGaYNA2Qg7KGsWjBygKJ6IdK7UMSQy1O6VK7/iKIfW5Xm3s3vR6Rh0VBKO8H2ocYIBgAmwm5rB7V22BmzvbIq4KSLWMX04kcCnCN/YngNLikESW55OPFGdAn+PE+IV5VFrYgWWwHveYcByE3S1YNoK4l173UnPvIuxvji22w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780751783; c=relaxed/simple;
	bh=BaKvMQQMuqLmguKL1/M+tNWRZieukLJVP25UavkKnFE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=spAZFvSzO9jfZl+XV/7kI4tyYyFg6khwEtUMOUXvMvlpxPMzHsDnvdsuT2i9GF1R86x21+DTdKX0bsvLcVQl6kB9HaAx3Kr82tKyKA8OXTTKIB6c6CFEOmEXSJFBcX04yoeAgKYngWzNGdWWU7ltfkpQrglzVjcAuqkftPILOlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S66G0ZuZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S66G0ZuZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC381F00893;
	Sat,  6 Jun 2026 13:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780751782;
	bh=inz9S7Utmyc2Hqen0pdRdznODa124w7PJMMCEc4XXkI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S66G0ZuZeBhTFJyXoAfwFt4BlvXztnupeeKz248L3vd0B+kNmXh3zX6SkGD8BkH4W
	 nf600QtEEhNs2Cn1OihYGs8Jh4dQ1AXJfGRKypXU0E7Owg01rzYJG6UopSh/ttnqyZ
	 2GdxN1dgrQV3hiYAaCjGhyMuTmGTQIkI2g16meWkmyTUrGjvvQMcS7sx+6hUS6w9lf
	 8eG2jmhhK9jW8K/O7DSxNAlCLj/fIab+D2OvvEffY919n5XoWcR26L032VKr0msH0v
	 3285f/qp0EKLranRZlUXegT/L9aFZCcX1veCqi9nh22+lDZ/m9txrxVXowo0O/4dq/
	 7t7xp4lnJqGhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] interconnect: qcom: add MSM8x60 NoC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260606-submit-interconnect-msm8660-v4-2-6e1e5c5efa26@herrie.org>
References: <20260606-submit-interconnect-msm8660-v4-2-6e1e5c5efa26@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 13:16:21 +0000
Message-Id: <20260606131621.BFC381F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Use-After-Free of cross-fabric interconnect nodes on probe failure.
- [High] Unintentional active-clock voting during sleep state prevents powe=
r collapse.
- [High] Swallowing `clk_bulk_prepare_enable` failures leads to unrecoverab=
le bus hangs.
--

commit 96cdb073dc4d0f48f3ea0aaf0d60b6577a01c2b5
Author: Herman van Hazendonk <github.com@herrie.org>

interconnect: qcom: add MSM8x60 NoC driver

Add a Qualcomm interconnect driver for the MSM8x60 family modelling the
four NoC fabrics (APPSS, System, MMSS, Daytona) that connect masters
and slaves on these Scorpion-class SoCs. The driver implements the
interconnect-provider API to manage bandwidth between specific masters
and slaves via the RPM arbitration tables.

> diff --git a/drivers/interconnect/qcom/msm8660.c b/drivers/interconnect/q=
com/msm8660.c
> new file mode 100644
> index 0000000000000..13105e7bcb50c
> --- /dev/null
> +++ b/drivers/interconnect/qcom/msm8660.c
> @@ -0,0 +1,1716 @@
[ ... ]
> +static int msm8660_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
[ ... ]
> +	if (qp->rate !=3D rate) {
> +		for (i =3D 0; i < qp->num_clks; i++) {
> +			ret =3D clk_set_rate(qp->bus_clks[i].clk, rate);

[Severity: High]
Does this unintentionally override the zero-bandwidth sleep vote?

The driver iterates over all clocks in the bus_clks array and applies the
active bandwidth rate (with a minimum floor of 384 MHz) to every clock
using clk_set_rate(). The clock arrays (e.g., msm8660_afab_clocks) contain
both context-agnostic clocks (like bus and ebi1) and active-only clocks
(bus_a, ebi1_a).

In the Qualcomm clock framework, calling clk_set_rate() on a context-agnost=
ic
clock applies the rate to both the active AND sleep states in the RPM.
By forcing 384 MHz on the non-_a clocks, the fabric and memory buses
are kept highly clocked even during CPU deep sleep (power collapse),
resulting in significant power regression.

> +			if (ret) {
> +				dev_err(provider->dev,
> +					"%s clk_set_rate(%llu) error: %d\n",
> +					qp->bus_clks[i].id, rate, ret);
[ ... ]
> +static int msm8660_icc_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	if (qp->num_clks) {
> +		ret =3D clk_bulk_prepare_enable(qp->num_clks, qp->bus_clks);
> +		if (ret) {
> +			dev_warn(dev, "Failed to enable bus clocks: %d\n", ret);
> +			qp->num_clks =3D 0;
> +		} else {

[Severity: High]
Is it safe to swallow this error and proceed with probing?

Because devm_clk_bulk_get_optional() already safely handles clocks
missing from the Device Tree, a failure from clk_bulk_prepare_enable()
represents a genuine hardware or driver fault (e.g., a PLL failing to lock).

If the error is not propagated and the interconnect provider is registered
despite the clocks being disabled, consumers will assume the fabric is acti=
ve.
Any subsequent MMIO access over the unclocked fabric will result in a
synchronous external abort, causing an unrecoverable system crash.

> +			/*
> +			 * Register the cleanup right after a successful
[ ... ]
> +	for (i =3D 0; i < num_nodes; i++) {
> +		if (!qnodes[i])
> +			continue;
> +
> +		if (!qnodes[i]->node)
> +			qnodes[i]->node =3D icc_node_create_dyn();
> +		node =3D qnodes[i]->node;
> +		if (IS_ERR(node)) {
> +			ret =3D PTR_ERR(node);
> +			goto err_remove_nodes;
> +		}
> +
> +		ret =3D icc_node_set_name(node, provider, qnodes[i]->name);
> +		if (ret) {
> +			icc_node_destroy(node->id);
> +			qnodes[i]->node =3D NULL;
> +			goto err_remove_nodes;
> +		}
> +
> +		node->data =3D qnodes[i];
> +		icc_node_add(node, provider);
> +		data->nodes[i] =3D node;
> +	}
[ ... ]
> +err_remove_nodes:
> +	icc_nodes_remove(provider);

[Severity: High]
Can this cause a use-after-free on probe failure?

The interconnect framework's icc_link_nodes() automatically forward-allocat=
es
a target node if it doesn't exist yet. When an earlier fabric (e.g., APPSS)
probes, it creates links to nodes belonging to later fabrics (e.g., MMSS),
allocating them in memory.

When the target fabric later probes, its Pass 1 loop adopts these
pre-allocated nodes and adds them to its own provider. If the target fabric
subsequently fails to probe (e.g., due to an ENOMEM in Pass 2 or
icc_provider_register() failure), the error path calls
icc_nodes_remove(provider).

This destroys and frees all nodes belonging to the provider, including the
ones the earlier fabric already successfully linked to. The earlier, active
fabric is left with a dangling pointer in its links array. If path-finding
traverses this link, it will result in a use-after-free.

> +	msm8660_clear_node_cache(qnodes, num_nodes);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-submit-int=
erconnect-msm8660-v4-0-6e1e5c5efa26@herrie.org?part=3D2
