Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1FF38DC71
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791059346; cv=none; b=LFa+72dgJidYInWpokvdFNlyO7ZDxSnUFldA5YZbty1d3+MxzWh9/BPw0YgWMJnX9Jrp9AIc4+N9xNcXRrtR77M/u0y5YdYTJmqDIyBSDzDvnttwVbB4saW2qppEP8vl2i7RKqRNcOb6QtmxvihJaVR5WCffUcDPuNdg42l5PC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791059346; c=relaxed/simple;
	bh=jg/Ak7f9tzzjSw+/I/EAUpxxPeAsxzO8zBj8Enrv4Ic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h+d50GKqAWjWvSkVqw7VoS1Ab3u01s9xdznAg29wF772UqkUpKSrNAFjNhgt1Y4kCqD+l5LR0YKG1+MUk8mgvWt2bb67ZbGR81CW3PJM0DNeF+T7QegVs4ERO32IzevpAVABNShweO74/PHYPjWVL+LPhXs9fRwxIPmhWWskxD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FP7tgQ+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP7tgQ+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5670E1F0089B;
	Sat,  3 Oct 2026 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791059344;
	bh=A8hWN+Zd2xOTXQIn2LDXtFGYgFDp8a0bllMiLP0Ft6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FP7tgQ+c/gM4cXPdkM6fBk/3d4eqZfjILEJL2s6Rp3ZSJRFF31p/2mCGRZsCNR61c
	 EFCr6FShgbML0JF91e1nJdjsXqQPADlsQfxoF5NhRQFtbE/amxpX8So1d3sYsqVrhN
	 dUJBmTc6t+GuX6zxEyUnay54JB3IBG1vAWLtyQtW1AzV+/YqkC9HSjFdvZnqKt7i/B
	 ANhQDVh3sO8HwBIJnlrftHdDwPgrSPeqiFnwCKpjR4OhWYs4p7VveLoTncFPFUs7K0
	 DY8XmsbKNIRvsSAHiD9a4WE62CQ6Mlo0YhlWRQxXlx/ddFB12JIs+7QorjATwOeWmM
	 O3rwhTw2mGR3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] bus: add Altera timeout bridge driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261003-feature-timeout-ip-v1-2-8837c311d571@bruker.com>
References: <20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com>
 <20261003-feature-timeout-ip-v1-2-8837c311d571@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 20:29:03 +0000
Message-Id: <20261003202904.5670E1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] bus: UAF of irq_node during teardown or early interrupt
- [High] bus: CFI violation in devres teardown due to mismatched function p=
ointer cast
- [High] bus: driver incorrectly claims simple-bus devices, breaking power =
management
- [Medium] bus: bypassed hardware initialization when bound via driver_over=
ride
- [Medium] bus: leaked child devices due to missing depopulation on driver =
remove
- [Medium] bus: incorrectly adds physical base address to timeout address
- [Medium] bus: un-rate-limited error logging in ISR causes kernel log floo=
ding
--

commit c74336cb2c00c16659c7f03c8c51687597e67ab5
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: bus: add Altera timeout bridge driver

Add support for the Altera timeout bridge IP. The bridge connects an Avalon
bus to the HPS and monitors accesses for timeouts. When a timeout occurs
the interrupt communicates the event via sysfs.

> diff --git a/drivers/bus/altera-timeout-bridge.c b/drivers/bus/altera-tim=
eout-bridge.c
> new file mode 100644
> index 0000000000000..bb44ff4a75910
> --- /dev/null
> +++ b/drivers/bus/altera-timeout-bridge.c
> @@ -0,0 +1,219 @@

[ ... ]

> +static irqreturn_t altera_timeout_bridge_isr(int irq, void *data)
> +{
> +	struct altera_timeout_bridge_data *driver_data =3D data;
> +	u32 timed_out_address;
> +	resource_size_t effective_base_address;
> +	resource_size_t effective_timed_out_address;
> +
> +	atomic_inc(&driver_data->irq_count);
> +
> +	// Read and print the timed-out address (encoded in the lower nibble
> +	// 0x8..0xF according to AXI Timeout Bridge IP (CSR Interrupt Status In=
formation)
> +	timed_out_address =3D bridge_reg_read(
> +		driver_data,
> +		ALTERA_TIMEOUT_BRIDGE_REG_TIMED_OUT_ADDRESS);
> +	effective_base_address =3D driver_data->bridge_register_resource->start;
> +	effective_timed_out_address =3D effective_base_address + timed_out_addr=
ess;

[Severity: Medium]
Does this calculation corrupt the actual timed-out AXI address by erroneous=
ly
adding the driver's own register base?

> +	pr_err("%s: timeout at address 0x%llx\n",
> +		__func__, (unsigned long long)effective_timed_out_address);

[Severity: Medium]
Will this synchronous pr_err() statement flood the kernel log if the hardwa=
re
triggers continuous faults?

> +
> +	// Reset IRQ status in the bridge
> +	bridge_reg_write(
> +		driver_data,
> +		ALTERA_TIMEOUT_BRIDGE_REG_IRQ_STATUS_RESET,
> +		0x1);
> +	// notify the user space
> +	sysfs_notify_dirent(driver_data->irq_node);

[Severity: High]
Can this sysfs_notify_dirent() dereference an uninitialized or freed
irq_node?

During probe, devm_request_irq() is called before driver_data->irq_node is
initialized, leaving a window where early interrupts see a NULL pointer.
Additionally, because the devres action to free irq_node is registered after
the interrupt request, devres executes in LIFO order and frees irq_node
before the interrupt is disabled during teardown.

> +
> +	return IRQ_HANDLED;
> +}
> +static int altera_timeout_bridge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	const struct of_device_id *match;
> +	const struct of_dev_auxdata *lookup =3D dev_get_platdata(dev);
> +	struct device_node *np =3D dev->of_node;
> +	struct altera_timeout_bridge_data *driver_data;
> +	int ret =3D 0;
> +	int irq =3D -1;
> +
> +	/*
> +	 * Allow user to use driver_override to bind this driver to a
> +	 * transparent bus device which has a different compatible string
> +	 * that's not listed in simple_pm_bus_of_match. We don't want to do any
> +	 * of the simple-pm-bus tasks for these devices, so return early.
> +	 */
> +	if (device_has_driver_override(&pdev->dev))
> +		return 0;

[Severity: Medium]
Does this check incorrectly bypass the entire hardware initialization logic
if a driver override is used?

If a user explicitly binds the driver to a device via the driver_override
sysfs attribute, the probe function immediately returns 0, skipping all
memory allocations, register mappings, and interrupt requests.

> +
> +	match =3D of_match_device(dev->driver->of_match_table, dev);
> +
> +	/* Use a fall back logic like in simple-pm-bus */
> +	if (match && match->data) {
> +		if (of_property_match_string(np, "compatible", match->compatible) =3D=
=3D 0)
> +			return 0;

[Severity: High]
Does this cause the driver to incorrectly claim generic system buses and br=
eak
power management?

The driver's OF match table includes the generic "simple-bus" compatible
string. Returning 0 here prevents the correct simple-pm-bus driver from
binding to these buses, which is responsible for enabling their power domai=
ns
and clocks, breaking all child devices on the bus.

> +		else
> +			return -ENODEV;
> +	}

[ ... ]

> +	ret =3D devm_request_irq(dev, irq,
> +			       altera_timeout_bridge_isr,
> +			       0,
> +			       dev_name(dev),
> +			       driver_data);
> +	if (ret) {
> +		dev_err(dev,
> +			"%s: devm_request_irq failed for IRQ %d: %d\n",
> +			__func__, irq, ret);
> +		return ret;
> +	}
> +
> +	ret =3D devm_device_add_group(dev, &altera_timeout_bridge_sysfs_group);
> +	if (ret)
> +		return ret;
> +
> +	driver_data->irq_node =3D sysfs_get_dirent(dev->kobj.sd, "timeout_irq");
> +	if (!driver_data->irq_node)
> +		return -ENOENT;
> +
> +	ret =3D devm_add_action_or_reset(dev, (void (*)(void *))sysfs_put, driv=
er_data->irq_node);

[Severity: High]
Does this mismatched function pointer cast cause a Control-Flow Integrity
(CFI) violation during devres teardown?

The driver registers sysfs_put() with devm_add_action_or_reset() by casting
it to (void (*)(void *)). The actual signature of sysfs_put() expects a
struct kernfs_node *, not void *. When devres executes this action on module
unload or probe failure, KCFI detects the signature mismatch and panics.

> +	if (ret)
> +		return ret;
> +
> +	if (np)
> +		of_platform_populate(np, NULL, lookup, &pdev->dev);
> +
> +	return 0;
> +}

[Severity: Medium]
Are these child devices leaked when the driver is unbound?

During probe, of_platform_populate() creates child platform devices. Howeve=
r,
the platform driver lacks a .remove callback and does not use
devm_of_platform_populate(). The child devices are never destroyed when the
driver is unbound.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003-feature-ti=
meout-ip-v1-0-8837c311d571@bruker.com?part=3D2
