Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED33BE156
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780599506; cv=none; b=l/4EYy/I7ukMEs1lAO+AAZBxRqzQ9xt7jeR+h2Cb1q5ouZIQhmtb7hAHi/1xLpk/uM2ZyPwcI0bPMAH8IMmA9lsAD59XXYFRYt4Uw/NODL+BmH0WZMRNcEMzsE0CHmXJIc/+zi8rVdvR/+i2E6MIt3bfWvumb6DlMbvi00RVlKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780599506; c=relaxed/simple;
	bh=F+FrjGlse3ILsoXGxIikLmDGkeUiLQmhnmNQFRGcEzk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ac0nWCNguJE+6o9w/szt4rfhf1hZ4Gok+fDrT/JYWEHviVPK/URR2Xc95UHLfZyB/Qov9Sa8NGtA4Ftlq/QAeLBx6GrTkJn/9UKHC7b9+caWLp1V288FQeZELWqI+Eu2rZoaV0SD3phsGz7TTPNjE+Lz+r5/W4Zij7yd1lb3gc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpByPksF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpByPksF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BD01F00893;
	Thu,  4 Jun 2026 18:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780599505;
	bh=YTClmgOKJlsPuCmMhX7RHDYtNlHl6wMFXGO/e3kLr2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QpByPksFNX5cx/O+E+YmwErmEzrVRp7nI/U+lThTLYaW/cR/xINizcWtyE6jgArom
	 MOHMYQEx0J8zBFRD5aZ/lr1DnhKijYPFZqZlncy1NMBW9UpuN9NsPh/oY7nlwWfjQl
	 OHcRYtkcTi3aIgD0bKxcMpUNy6/d6ophS1hlyH9COWYxYS1o0fSNKUBU2iTU6W7P1J
	 Z6zQDYrW1brGCwmy8DSAck/3HMB1kWyTcyun8WjBMoh2cWRjts2Dy1v4rmxXPyKCd5
	 gFJ1sejOtakiLDBVMm0rps1Q8leg3U1bI5ytyiCzdpti7XJ5YZR9pRbdTIIgSVmami
	 PhmjRBraGjndA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add MSM8x60 NoC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604184400.801543-3-github.com@herrie.org>
References: <20260604184400.801543-3-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 18:58:24 +0000
Message-Id: <20260604185824.79BD01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] State persistence in static structures causing use-after-free =
and permanent probe failures on retry/rebind.
- [High] Manual removal of a managed device link causing reference count do=
uble-drop.
- [High] Ignored return value from icc_link_nodes() memory allocation.
- [Low] Dead code due to incorrect fallback checking of devm_clk_bulk_get_o=
ptional() return value.
--

commit 409fc3daaab0214cd873901a825998159cc133c8
Author: Herman van Hazendonk <github.com@herrie.org>
Subject: interconnect: qcom: add MSM8x60 NoC driver

This commit adds a Qualcomm interconnect driver for the MSM8x60 family
modeling the four NoC fabrics (APPSS, System, MMSS, Daytona). The driver
manages bandwidth via RPM arbitration and fabric clocks, and registers
the provider at core_initcall.

> diff --git a/drivers/interconnect/qcom/msm8660.c b/drivers/interconnect/q=
com/msm8660.c
> index 0000000000000..6e55ff8e5b0e4
> --- /dev/null
> +++ b/drivers/interconnect/qcom/msm8660.c
[ ... ]
> @@ -1321,79 +1321,80 @@ static struct qcom_rpm *msm8660_get_rpm(struct de=
vice *dev)
[ ... ]
> +	link =3D device_link_add(dev, &rpm_pdev->dev,
> +			       DL_FLAG_AUTOREMOVE_CONSUMER);
> +	put_device(&rpm_pdev->dev);
> +	if (!link)
> +		return dev_err_ptr_probe(dev, -EPROBE_DEFER,
> +					 "failed to add device link to RPM\n");
> +
> +	/*
> +	 * Safe to read drvdata now: the device link pins the supplier so
> +	 * it cannot be unbound until our consumer (this interconnect
> +	 * provider) is unbound first.
> +	 */
> +	rpm =3D dev_get_drvdata(&rpm_pdev->dev);
> +	if (!rpm) {
> +		device_link_remove(dev, &rpm_pdev->dev);
> +		return dev_err_ptr_probe(dev, -EPROBE_DEFER,

[Severity: High]
Since this device link is created with DL_FLAG_AUTOREMOVE_CONSUMER, the dri=
ver
core will automatically manage its lifecycle and clean it up when probe fai=
ls.

Does manually calling device_link_remove() here before deferring the probe
cause a double-put and potentially a use-after-free regression when the dri=
ver
core subsequently attempts its own cleanup?

> +					 "RPM not ready\n");
> +	}
> +
> +	return rpm;
> +}
> +
> +static int msm8660_icc_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	/*
> +	 * MSM8660 fabric clocks are managed by RPM firmware and may not be
> +	 * available in mainline Linux yet. Once the clock provider exists,
> +	 * we want to honour it; until then we run without per-fabric clock
> +	 * scaling. Only swallow -ENOENT (the clock provider exists but has
> +	 * no matching entry); propagate every other error including
> +	 * -EPROBE_DEFER (the provider exists but has not finished probing).
> +	 */
> +	ret =3D devm_clk_bulk_get_optional(dev, qp->num_clks, qp->bus_clks);
> +	if (ret =3D=3D -ENOENT) {
> +		dev_warn(dev, "bus clocks not registered, continuing without clock sca=
ling\n");

[Severity: Low]
Since devm_clk_bulk_get_optional() evaluates missing optional clocks as
non-fatal and intentionally returns 0 (success) instead of -ENOENT, is
this ret =3D=3D -ENOENT check dead code?

> +		qp->num_clks =3D 0;
> +	} else if (ret) {
> +		return ret;
> +	}
[ ... ]
> +	for (i =3D 0; i < num_nodes; i++) {
> +		size_t j;
> +
> +		if (!qnodes[i])
> +			continue;
> +
> +		if (!qnodes[i]->node)
> +			qnodes[i]->node =3D icc_node_create_dyn();
> +		node =3D qnodes[i]->node;

[Severity: Critical]
The interconnect nodes are dynamically allocated via icc_node_create_dyn()
and assigned to the ->node field of the statically allocated, global
msm8660_icc_node structs.

If the driver fails to probe later and the error path calls
icc_nodes_remove(), the dynamically allocated memory is freed but the static
pointers are not reset to NULL.

On a subsequent probe retry or rebind, if (!qnodes[i]->node) will evaluate =
to
false. Will this cause the driver to pass dangling pointers (or an ERR_PTR =
if
the allocation originally failed) to the interconnect framework, leading to=
 a
use-after-free regression?

> +		if (IS_ERR(node)) {
> +			ret =3D PTR_ERR(node);
> +			goto err_remove_nodes;
> +		}
> +
> +		ret =3D icc_node_set_name(node, provider, qnodes[i]->name);
> +		if (ret) {
> +			icc_node_destroy(node->id);
> +			goto err_remove_nodes;
> +		}
> +
> +		node->data =3D qnodes[i];
> +		icc_node_add(node, provider);
> +
> +		for (j =3D 0; j < qnodes[i]->num_links; j++)
> +			icc_link_nodes(node, &qnodes[i]->link_nodes[j]->node);

[Severity: High]
Can icc_link_nodes() fail with -ENOMEM under memory pressure?

If the return value is ignored, could a failed allocation result in a silen=
tly
disconnected topology graph that causes routing failures at runtime?

> +
> +		data->nodes[i] =3D node;
> +	}
> +
> +	ret =3D icc_provider_register(provider);
> +	if (ret)
> +		goto err_remove_nodes;
> +
> +	platform_set_drvdata(pdev, qp);
> +
> +	dev_info(dev, "MSM8660 interconnect provider registered\n");
> +
> +	return 0;
> +
> +err_remove_nodes:
> +	icc_nodes_remove(provider);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604184400.8015=
43-1-github.com@herrie.org?part=3D2
