Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D02352004
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376302; cv=none; b=FXai/InGDzAwxuk0dooaQWUjW5JREV+Pl6LqZV4UusC7gHTpjQFgTUjlnjfgG/BqzZ0Sn4U9hYIEbTnTx/5THWXoX64ff6ksnFM4Irbp//K44Q5tf0GbJ5DyKDWl+6g+3FvDyYjWM/SA5AUUVCLfvIEj7ISGjnEQznIiI1+RoWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376302; c=relaxed/simple;
	bh=0njaWBwdIxdj02Y5NlmqrJUKm4BNGRY6a2jqUD502pQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nu8MjKiNbCZSSNYdUZbGc5OdIeWLQ7PB6RHcIt8QiXIa+Hm8HoewigslEhWcjY9fQ25ZWFSVCHkFAvf7qqFE9ANoF8emUtt+ewQ+cJa/UoytsW7HjRNZbnrwEXtex6+99+xedMpwbElogSmnEOniLfa0ShjINfrKK5JE9RPfIRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwcnkulG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwcnkulG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C661F000E9;
	Mon, 10 Aug 2026 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376300;
	bh=3EgS1LTLjItrZIj56JLN3GHaOUr/e/KbJkQWsRlNG7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YwcnkulGctYLoWiH4D3Z7OA9t3tUYKPRiAVDToyAeiG70LJhvn3anrRsgb6NcsVxD
	 AklwZSsU4KODI1cM5MzivK4QNT2jK/KtuC0vk0Al4phzD8oW4z8t7jlPiYuame5TYq
	 fTPDWuyiBJfOhJQx58rf6xox0kHOKaBdYicYM0XTK2EvRAzf5mmRPjT4o3ALhPyTFS
	 1S95CWKemIGllBsfUaw+FRWYIQeVdxrbe3P6gjNHuKZ/MKSMTDGvbL2ZDOoZonA4OH
	 QFUG3rR2qIT7BJfq8P033bhjWuaVeZdKe8zo74ENVEA+9G3p3cCoHQse0OHOs+4/MA
	 ei9EKN4rDuM+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810152223.3946743-4-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-4-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:38:19 +0000
Message-Id: <20260810153820.A2C661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

New issues:
- [High] Missing `IS_ERR` check for `gtrace_find_by_fwnode()` return value.
- [High] The CPU device node is used in a format string after its reference=
 count has been decremented.
- [High] Dropping fwnode references before unregistering the component caus=
es a use-after-free in the core subsystem.
- [Medium] Device node references `rep_node` and `rdev_node` are leaked on =
the success path in `rvtrace_of_parse_outconns()`.
- [Medium] Leak of destination fwnode reference when component lookup fails=
 in `rvtrace_of_parse_outconns()`.
- [Medium] Output connection fwnode references are leaked if `rvtrace_platf=
orm_probe()` fails after parsing connections.
- [Medium] The driver lacks a `MODULE_DEVICE_TABLE` declaration for its OF =
match table, preventing automatic module loading.
- [Medium] Unprotected read-modify-write operations on hardware control reg=
isters.

Pre-existing issues:
- [High] `gtrace_find_by_fwnode()` returns a component pointer without acqu=
iring a reference.
--

--- Patch [3]: [PATCH v5 03/14] gtrace: Add RISC-V platform driver for the =
gtrace framework ---
commit d15655615f1b10f39198151874d1d481ed52c740
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

Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>

> diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtrac=
ing/gtrace/rvtrace-platform.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
> @@ -0,0 +1,286 @@
[ ... ]
> +static int rvtrace_hw_enable(struct gtrace_platform_data *pdata)
> +{
> +	u32 val;
> +
> +	val =3D gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |=3D BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> +	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);

[Severity: Medium]
Are these read-modify-write operations safe from concurrent access?

Looking at rvtrace_hw_enable() and rvtrace_hw_disable(), the sequences=20
gtrace_read32() followed by gtrace_write32() execute locklessly.=20

If the tracing framework or userspace allows concurrent control, could this=
=20
corrupt the RVTRACE_COMPONENT_CTRL_OFFSET register state?

> +	return gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
> +			       pdata->control_poll_timeout_usecs);
> +}
> +
> +static int rvtrace_hw_disable(struct gtrace_platform_data *pdata)
> +{
> +	u32 val;
> +
> +	val =3D gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val &=3D ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> +	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	return gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
> +			       pdata->control_poll_timeout_usecs);
> +}
[ ... ]
> +static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
> +{
[ ... ]
> +		conn->dest_comp =3D gtrace_find_by_fwnode(conn->dest_fwnode);
> +		if (!conn->dest_comp) {

[Severity: High]
Does this check properly handle error pointers?

gtrace_find_by_fwnode() returns an ERR_PTR on failure. Since the check is
only for NULL, will an error pointer bypass this condition and be
assigned to conn->dest_comp as a valid pointer, potentially causing a
kernel panic later when dereferenced?

[Severity: High]
This isn't a bug introduced by this patch, but does gtrace_find_by_fwnode()
return a component pointer without acquiring a reference to it?

If we look at gtrace_match_fwnode() in the core subsystem:

drivers/hwtracing/gtrace/gtrace-core.c:gtrace_match_fwnode() {
	if (device_match_fwnode(&comp->dev, d->fwnode)) {
		d->match =3D comp;
		return 1;
	}
}

The component pointer is returned without incrementing its reference count.

Could this lead to a use-after-free if the matched component is
concurrently unregistered before we use it here?

[Severity: Medium]
Does this error path leak the dest_fwnode reference?

We acquired a reference to conn->dest_fwnode earlier with
fwnode_handle_get(). If gtrace_find_by_fwnode() fails and we break out
of the loop here, conn is not yet assigned to pdata->outconns.

The cleanup block at the end only frees references that were already
assigned to the pdata->outconns array.

Will this unassigned conn's fwnode reference be permanently leaked?

> +			ret =3D -EPROBE_DEFER;
> +			of_node_put(ep_node);
> +			of_node_put(rep_node);
> +			of_node_put(rdev_node);
> +			break;
> +		}
> +
> +		pdata->outconns[i] =3D conn;
> +		i++;
> +	}

[Severity: Medium]
Are the device node references for rep_node and rdev_node leaked on the
success path?

of_graph_get_remote_endpoint() and of_graph_get_port_parent() return
device nodes with incremented reference counts.=20

When the loop continues to the next iteration after a successful parse,=20
it doesn't appear that of_node_put() is called for these nodes.

[ ... ]
> +static int rvtrace_platform_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	node =3D of_parse_phandle(dev_of_node(dev), "cpus", 0);
> +	if (node) {
> +		ret =3D of_cpu_node_to_id(node);
> +		of_node_put(node);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "failed to get CPU id for %pOF\n", nod=
e);

[Severity: High]
Does this error path trigger a use-after-free on the device node?

of_node_put(node) is called to drop the reference to the CPU device node.
Immediately afterward on the error path, the same node pointer is passed
to dev_err_probe() using the %pOF format specifier.

Could the format parsing dereference the freed node memory?

> +		pdata->bound_cpu =3D ret;
> +	}
> +
> +	/* Default control poll timeout */
> +	pdata->control_poll_timeout_usecs =3D 10;
> +
> +	ret =3D rvtrace_of_parse_outconns(pdata);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to parse output connections\n");
> +
> +	ret =3D rvtrace_of_parse_inconns(pdata);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to parse input connections\n");

[Severity: Medium]
Will the fwnode references acquired in rvtrace_of_parse_outconns() be
leaked if initialization fails here?

If rvtrace_of_parse_inconns() or any subsequent initialization step fails,
rvtrace_platform_probe() returns directly.=20

Since there is no cleanup path to iterate through pdata->outconns and call=
=20
fwnode_handle_put(), will all the acquired fwnode references be permanently=
=20
leaked?

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
> +}

[Severity: High]
Could dropping the fwnode references before unregistering the component
cause a use-after-free in the core subsystem?

Here, the driver drops the references to the destination fwnodes before
calling gtrace_unregister_component(). The core unregistration function
iterates over the connections and accesses the fwnodes via
device_match_fwnode().

Since the references were already dropped, could the memory have been freed,
causing a use-after-free during cleanup?

> +static const struct of_device_id rvtrace_platform_match[] =3D {
> +	{ .compatible =3D "riscv,trace-component" },
> +	{}
> +};

[Severity: Medium]
Is a MODULE_DEVICE_TABLE declaration missing for this OF match table?

Platform drivers configured as modules typically expose their device ID
tables using MODULE_DEVICE_TABLE(of, rvtrace_platform_match).=20

Without it, modaliases won't be exported, which prevents udev from=20
automatically loading the driver when matching hardware is present.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D3
