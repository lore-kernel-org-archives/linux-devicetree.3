Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08094439909
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832990; cv=none; b=W6uS0S7x7tIpXElBfz3siFKw1Ebn0sn2rntXL4wwf9ej9SQ83kvLIyaafF0f8cNkrT4zU1/+ZaNJABkZqsoymak5+hGXqdllRGdBSJqkf8T/dGjqId7Htv7cGDq4KUKuU2Bx+UHbc1dROZDb8zfYKD6VV4l4NPGLqgSPJlcfq+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832990; c=relaxed/simple;
	bh=OIMEkS7etsBf1RlVc3/TX5M6OXSDHPB68nw5aYM3d8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ss2iDW7tllGUI0txaPHvsrm9G6tftQLzTA4P7SP6Z42+hBGqqOwnE3P5HSAMEv/gY6ANao8cEzoEyvJy1dAmSa9SaUk27k+4GLx8o1+lPnOMuGswz6usNWGwdYEEOV7T+IE/ytybtTqRfw5a6lBGclhJYalg7GieVbr6/ZvKt5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avBCxICv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avBCxICv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECE81F008A0;
	Thu,  1 Oct 2026 05:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790832988;
	bh=hhIDVOl5uNGmlVjYOPma57OI1TOz3klHjfgv172BEIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=avBCxICvmuMlA8bv4tT8BTrz4+IkdCbJWveG99tl9D2eLd2X8cuJNc7zS5okopFMx
	 CAhJ/9Fhmmi4RrvkIQxLXiBoHpTU9xvHdUYVKCiJ6tXQYWNrl54rLl09vuytoE4VpQ
	 HvAkqvIgpm5RTUCCHvILMwBK4Fw77XO02jSPYjJyKmoyJDMLqQzgCnBKdrdzUpPj4M
	 +KYCrwjrGH+cABDmbrte95aPUK9qG+IkxevWlqnEyHEqVfaJZQDs2nsDFrJy4xDyWg
	 XLPgYByAJB3SWaG4D8aige1Iok6Re3wSNVKTdtk6bhp8zm+a2U3eW0ZLKnxZPaZeP3
	 pVmtt3IAgk4+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 05:36:28 +0000
Message-Id: <20261001053628.9ECE81F008A0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] of: use-after-free of device node in rvtrace_platform_probe()
- [High] core: use-after-free hazard in rvtrace_platform_remove() during un=
registration
- [Medium] of: memory leak of rep_node and rdev_node in gtrace_of_parse_out=
conns()
- [Medium] of: fwnode handle leak on -EPROBE_DEFER error path in gtrace_of_=
parse_outconns()
- [Medium] of: fwnode handle references leaked on rvtrace_platform_probe() =
error paths
- [Medium] module: missing MODULE_DEVICE_TABLE prevents automatic driver lo=
ading
--

commit 70aceab46d8019c787fc4aee6cb3f8a0b2772885
Author: Anup Patel <anup.patel@oss.qualcomm.com>

gtrace: Add RISC-V platform driver for the gtrace framework

The RISC-V trace components defined by the RISC-V Trace Control Interface
Specification are memory mapped devices which are organized in a
graph-like topology and described in the device tree.

Add the RISC-V platform driver for the gtrace framework. The driver
parses the RISC-V component topology from the device tree, discovers the
type and version of each component from its IMPL register, provides the
RISC-V register level control ops and registers each component with the
gtrace core.

> diff --git a/drivers/hwtracing/gtrace/gtrace-of.c b/drivers/hwtracing/gtr=
ace/gtrace-of.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/gtrace-of.c
[ ... ]
> +		conn->dest_port =3D rep.port;
> +		conn->dest_fwnode =3D of_fwnode_handle(rdev_node);
> +		fwnode_handle_get(conn->dest_fwnode);
> +		conn->dest_comp =3D gtrace_find_by_fwnode(conn->dest_fwnode);
> +		if (!conn->dest_comp) {
> +			ret =3D -EPROBE_DEFER;
> +			of_node_put(ep_node);
> +			of_node_put(rep_node);
> +			of_node_put(rdev_node);
> +			break;

[Severity: Medium]
Does this error path leak the conn->dest_fwnode reference?

The fwnode reference count was incremented by fwnode_handle_get(), but the
newly allocated conn has not yet been placed into the pdata->outconns array.
Consequently, the error cleanup loop at the done label skips this connectio=
n.

> +		}
> +
> +		pdata->outconns[i] =3D conn;
> +		i++;

[Severity: Medium]
Does the success path of this endpoint parsing loop leak the device node
references?

The of_graph_get_remote_endpoint() and of_graph_get_port_parent() calls
acquire references to device nodes. On the success path, these references
are never released with of_node_put() before advancing to the next iteratio=
n.

> +	}
> +
> +done:
> +	if (ret) {
> +		for (i =3D 0; i < pdata->nr_outconns && pdata->outconns; i++) {
> +			conn =3D pdata->outconns[i];
> +			if (conn && conn->dest_fwnode)
> +				fwnode_handle_put(conn->dest_fwnode);
> +		}
> +	}
> +	of_node_put(parent);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gtrace_of_parse_outconns);
[ ... ]
> diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtrac=
ing/gtrace/rvtrace-platform.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
[ ... ]
> +	pdata->bound_cpu =3D -1;
> +	node =3D of_parse_phandle(dev_of_node(dev), "cpus", 0);
> +	if (node) {
> +		ret =3D of_cpu_node_to_id(node);
> +		of_node_put(node);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "failed to get CPU id for %pOF\n", nod=
e);

[Severity: High]
Does this code trigger a use-after-free on the device node?

The node reference is explicitly released via of_node_put() before it is
passed to dev_err_probe(), where the %pOF specifier will dereference the
now-freed node pointer to extract its name.

> +		pdata->bound_cpu =3D ret;
> +	}
> +
> +	/* Default control poll timeout */
> +	pdata->control_poll_timeout_usecs =3D 10;
> +
> +	ret =3D gtrace_of_parse_outconns(pdata);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to parse output connections\n");
> +
> +	ret =3D gtrace_of_parse_inconns(pdata);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to parse input connections\n");
> +
> +	/* Reset the component before it is registered with the gtrace core. */
> +	ret =3D rvtrace_hw_reset(pdata);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to reset component\n");

[Severity: Medium]
Do these error paths leak the fwnode references stored in the outconns arra=
y?

The earlier call to gtrace_of_parse_outconns() allocates and acquires fwnode
references, storing them in pdata->outconns. If a subsequent call fails, the
probe function immediately returns an error. Because devm does not
automatically release fwnode references, and the custom teardown logic in
rvtrace_platform_remove() is bypassed on probe failure, these references
appear to be lost.

> +
> +	impl =3D gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
[ ... ]
> +static void rvtrace_platform_remove(struct platform_device *pdev)
> +{
> +	struct gtrace_component *comp =3D platform_get_drvdata(pdev);
> +	struct gtrace_platform_data *pdata =3D comp->pdata;
> +	struct gtrace_connection *conn;
> +	int i;
> +
> +	for (i =3D 0; i < pdata->nr_outconns; i++) {
> +		conn =3D pdata->outconns[i];
> +		if (conn && conn->dest_fwnode)
> +			fwnode_handle_put(conn->dest_fwnode);
> +	}
> +
> +	gtrace_unregister_component(comp);

[Severity: High]
Does this sequence introduce a use-after-free hazard during unregistration?

The fwnode references are prematurely dropped before unregistering the
component. However, gtrace_unregister_component() relies on these pointers
internally during its teardown process, matching the fwnode device elements.
If the prior fwnode_handle_put() was the final reference, the memory is
freed, and the subsequent match access is a use-after-free.

> +}
> +
> +static const struct of_device_id rvtrace_platform_match[] =3D {
> +	{ .compatible =3D "riscv,trace-component", .data =3D (void *)GTRACE_FOR=
MAT_ETRACE },
> +	{}
> +};

[Severity: Medium]
Is MODULE_DEVICE_TABLE(of, rvtrace_platform_match) missing here?

Without it, the driver fails to export the necessary modaliases to userspac=
e,
preventing the driver from loading automatically when its hardware matches
are present in modular builds.

> +
> +static struct platform_driver rvtrace_platform_driver =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001052243.3042=
627-1-mayuresh.chitale@oss.qualcomm.com?part=3D3
