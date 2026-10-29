Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268002;
	b=iQKJvk493//DWTQfMKXxF9EWA1oqpmIQb9dwc3uv7CAZiNHvoYfCkpXI2l8g8a/kG3Jf
	 hJYs1Zn7Fq1bs7cRyoiwelVjisorwATIbVytNPe2mxbQQUK8r0fyZ3W5h2SCdipX/SJbX
	 QxRCn3UP21iUXnBbm1ydxtt6EkQ3rGxzAwqBT66E4WHhzA6vBl/KGUs2WjfBN5oqn0C/r
	 1gpWT/seMvHuafT8ir4it2WRYBG8520EImV48njVIuXhMhKUxzgXmLPbP0Dq58OIwcE/j
	 jj/CoZGea5vCC+QhCkJi3NhPY0W7nAbmNLl0vVpYHmwTjSN/RVI9JgsXaDbybgbFA8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268002;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nyQJahuUa1lXZQWj5EyIOkO9TARa4E9raLzKVVIpJQM=;
	b=GkFVNm4DpwX06oQdlrWfY/8Zmw4Y1g3AzaZDwr0uznKJ0iqvfv99D/xx4P1Uh2LIFlNu
	 IsX/Fmlt8eCpkRfiEZVmxpHK4GWSCiXfV5MAtY/f+zmD5wgw3MMNBaqf9myyZKIXj4gXQ
	 rGPh8ErsMKStaisH8TEcWU1cUxIS1V4QdmoQF4JsYlhcaAC+ok8HkBmkJSK6ipUAqLHrY
	 Z3wmDIA+wnI8skcBLjI7XQv8XsUZcDr+WxT+cGPaY6P4rATW2SXG/rrnr6TTyso70kYv0
	 5o+16KgbeEGoaNbH///sG5nNdSQEqrwOCUXvOn6Mf5WFjbl0gWBvOROJzfQFvLkOceg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d5L4IuPJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1067B60A2607
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d5L4IuPJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CFD1F01825;
	Thu, 29 Oct 2026 10:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793268001;
	bh=nyQJahuUa1lXZQWj5EyIOkO9TARa4E9raLzKVVIpJQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d5L4IuPJfFe6mcEqzpDGCESX6VMXpy1RRuw+HZmMaleffWwvU6uv5rH5w5b6R5CCY
	 8sOohgmXZMNNQ8Cz/OR9Y1fUNnR4ZjWzCt7BEa8iE0YqOF7xAQzp+WVJevq6p2lepc
	 Hy171gxpmCyoQ0YhubKYYiU8D8mH2ygh0WHD3jpgZwHQTj3EMpswoJil7m1wZie6+F
	 MSVh02WjOtPn3wGHGMdGxWTuEMw96OhIGofTALJIEQJi/CxGnfJtj+V9RNVcD3ZkKv
	 TPQy+mFio0Z1kF+0aL1GKz5H9Lnz4dl2/coPHuvCEha7SqvRTfn+EXHHv6ml376Y4n
	 7X1kdY0ABdHSQ==
Message-ID: <sashiko-outbox-189081@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v27 04/10] firmware: psci: Add support for PSCI
 auxiliary devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-4-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-4-fa4b3ff1359b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 10:00:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] firmware: psci: premature fw_devlink consumer pickup in arm_psci=
_probe()
--

commit 693a73228dca9776538a9dc808fb4cd1f0b1d4d0
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

firmware: psci: Add support for PSCI auxiliary devices

This commit introduces a PSCI platform driver that binds to the "arm,psci-1=
.0"
device node and creates child devices on the auxiliary bus. It also converts
cpuidle-psci-domain from a platform driver into an auxiliary driver that bi=
nds
to the child device created by the PSCI provider.

> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci=
/psci-devices.c
> new file mode 100644
> index 0000000000000..d23befc490ed5
> --- /dev/null
> +++ b/drivers/firmware/psci/psci-devices.c

[ ... ]

> +static int arm_psci_probe(struct platform_device *pdev)
> +{
> +	const struct arm_psci_device_info *info;
> +	int auxdev_count =3D 0;
> +	int i, ret;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(arm_psci_devices); i++) {
> +		info =3D &arm_psci_devices[i];
> +		ret =3D arm_psci_auxiliary_device_create(&pdev->dev, info);
> +		if (ret)
> +			dev_warn(&pdev->dev, "failed to create %s aux device: %d\n",
> +				 info->name, ret);
> +		else
> +			auxdev_count++;
> +	}
> +
> +	return auxdev_count ? 0 : -ENODEV;
> +}

[Severity: Medium]
Can returning 0 from arm_psci_probe() when psci_cpuidle_domain_probe() defe=
rs
(or probes asynchronously) cause fw_devlink to prematurely mark the child
power-domain device tree nodes as FWNODE_FLAG_NOT_DEVICE?

Previously, psci_cpuidle_domain_driver was the platform_driver for the
"arm,psci-1.0" platform device (where psci_fwnode->dev =3D=3D &pdev->dev). =
When
psci_cpuidle_domain_probe() returned -EPROBE_DEFER, really_probe() did not
call device_links_driver_bound(&pdev->dev).

On platforms where a PSCI child power domain references an external parent
power domain (for example arch/arm64/boot/dts/qcom/agatti.dtsi and
arch/arm64/boot/dts/qcom/sm6375.dtsi, where cluster_pd has
power-domains =3D <&mpm> pointing to "qcom,mpm"), arm_psci_probe() and
psci_cpuidle_domain_probe() run during of_platform_default_populate_init() =
at
arch_initcall_sync, while qcom_mpm_driver (drivers/irqchip/irq-qcom-mpm.c) =
is
registered at device_initcall (or as a module).

When arm_psci_probe() -> arm_psci_auxiliary_device_create() ->
__auxiliary_device_add() -> device_add() runs, psci_cpuidle_domain_probe()
calls dt_idle_pd_init_topology() -> of_genpd_add_subdomain(), which returns
-EPROBE_DEFER because the mpm genpd provider is not registered yet.
psci_cpuidle_domain_probe() then unwinds:

drivers/cpuidle/cpuidle-psci-domain.c:psci_cpuidle_domain_probe() {
	...
	/* Link genpd masters/subdomains to model the CPU topology. */
	ret =3D dt_idle_pd_init_topology(np);
	if (ret)
		goto remove_pd;
	...
remove_pd:
	dt_idle_pd_remove_topology(np);
	psci_pd_remove();
exit:
	pr_err("failed to create CPU PM domains ret=3D%d\n", ret);
	return ret;
}

Here psci_pd_remove() -> of_genpd_del_provider() -> device_del(&gpd->dev)
resets child_fwnode->dev to NULL for all child power-domain nodes under the
PSCI node.

Because bus_probe_device(&auxdev->dev) does not propagate probe deferral to
device_add(&auxdev->dev), arm_psci_auxiliary_device_create() and
arm_psci_probe() still return 0. really_probe(&pdev->dev) then calls
driver_bound(&pdev->dev) -> device_links_driver_bound(&pdev->dev):

drivers/base/core.c:device_links_driver_bound() {
	...
	if (dev->fwnode && dev->fwnode->dev =3D=3D dev) {
		fwnode_links_purge_suppliers(dev->fwnode);
		fw_devlink_pickup_dangling_consumers(dev);
	}
	...
}

Because child_fwnode->dev is NULL on the child power-domain nodes (which al=
so
happens if psci-cpuidle-domain probes asynchronously),
__fw_devlink_pickup_dangling_consumers() sets FWNODE_FLAG_NOT_DEVICE on each
child power-domain fwnode and moves their consumer fwnode_links to the pare=
nt
PSCI platform device (&pdev->dev).

When the supplier device (mpm_pdev) is later added,
__fw_devlink_link_to_consumers(&mpm_pdev->dev) sees
get_dev_from_fwnode(cluster_pd_fwnode) =3D=3D NULL, falls back to
fwnode_get_next_parent_dev(cluster_pd_fwnode) (&pdev->dev), and attempts to
create a DL_FLAG_SYNC_STATE_ONLY device link to &pdev->dev. Because
pdev->dev.links.status is already DL_DEV_DRIVER_BOUND, device_link_add() fa=
ils
and logs "Failed to create device link", leaving mpm_pdev without a
SYNC_STATE_ONLY link.

Furthermore, because FWNODE_FLAG_NOT_DEVICE is never cleared, even after
psci_cpuidle_domain_probe() succeeds on deferred probe retry and registers
genpd->dev via of_genpd_add_provider_simple(), fw_devlink_create_devlink()
keeps redirecting consumers of the child power-domain nodes to &pdev->dev:

drivers/base/core.c:fw_devlink_create_devlink() {
	...
	if (fwnode_test_flag(sup_handle, FWNODE_FLAG_NOT_DEVICE))
		sup_dev =3D fwnode_get_next_parent_dev(sup_handle);
	else
		sup_dev =3D get_dev_from_fwnode(sup_handle);
	...
}

Doesn't this leave the child genpd->dev devices without consumer device lin=
ks
to hold off genpd_provider_sync_state()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-arm-psci-s=
ystem_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com?part=3D4
