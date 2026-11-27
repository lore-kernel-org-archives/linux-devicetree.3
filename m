Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793449;
	b=ACto4EoGljF7+eFLHK0zMG1I5KWFYCH8xVEJ+dCQ+IDlwroBfsVy06jZeertFiPhcrDv
	 QncYdVDpC36FAV3IAs17TYgatOvEHpfvG/ETs4CU22omLAtrWmrYMJ2OeG/hP4r3KdCWy
	 19b860d6nkTEP9sAEKiqeMSeJoYqnAFbUKfYk+WOqxWxsdg2w50/m2JaEa40bq+KUlgye
	 QSsxkzOo5ktEcgf0McmuAefwNNU/Y4N25YreZaHJjFgL4ii3AiAP3zRtx5hMl6jl6Q529
	 Zb73+2egBOm59zPIBUT5mCPO+kQ5DBkAlY+G2iQ2FvVGFv8jah222oAHzZ2LwqjveZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793449;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zJKd/dzgKMCj5OlG5TXOqkMbK1m0Uish+/FTAqIzH3s=;
	b=PKncFCgpt+chYMyaeJ9FFjJpcEICsscDN5Xdh/Pmlk2E+JUDl61V84sn2YlVQjs9foUS
	 mfl1f4rImm55OKXIXlbBmwRbeLaTLOiYljvj97Xw2XPmJxTTogZZ7eP1BKW34eG38rBrl
	 h0QA38l3ycDwrqxcaTQUxCF5b4VvVmWF6AE9r4YtpOCpWOncaRQF1y53OtNszEa7L7EIp
	 IOVKmiE1XTrE8WyBdMLSXdKHQoP7FsPRadqATVjDCfD+VmirQ3IgN14fbKlqu1Onc1XmX
	 3C44dPvChtlykm21UUdbhKxHiV7JFXlE4hpZ5KIf0d5mph2nR2iXWCiub4aZ+ZGIn5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3c+0o7G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DB5606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3c+0o7G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3991F00893;
	Fri, 27 Nov 2026 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793448;
	bh=zJKd/dzgKMCj5OlG5TXOqkMbK1m0Uish+/FTAqIzH3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R3c+0o7GRxYEuy4bCok+qakUKtl9z/TjXtAKNesVCK017ed1lgm1PLg+vydIj9zwK
	 LjBErhTZvogEn0cdf6+/lTNff+Lxt47OX4DogNYzrEBBLMsCJykkOF4dHMVbEudCId
	 MeeT62WqzCl3TnJJO+Irzb/+jUuWJXjK2/R6+QrweHZfzLs48VgK8OMLCKkQAs920T
	 dzDHPSny2b9Hem50gi4SRonlVp8U3Y8ljHTDKvD/rfwJFinlntHR0KXYP3p5QIdWaY
	 UfWrQZKGQJ1dKh8SyGx8VEMnEg+pt6rJ2dJE+hWt+NmLW33fRkkcrg1P2ZvLl/Xxli
	 TPt6xyOrqag/Q==
Message-ID: <sashiko-outbox-237739@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v28 04/10] firmware: arm: psci: Add support for PSCI
 auxiliary devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-4-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
 <20261127-arm-psci-system_reset2-vendor-reboots-v28-4-da05a33b08d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 15:30:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] firmware: arm: psci: premature fw_devlink pickup in
  arm_psci_probe()
--

commit aa59945bb4d8456dbf61f8f8873df33afdc23249
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

firmware: arm: psci: Add support for PSCI auxiliary devices

This commit introduces a PSCI platform driver that binds to
"arm,psci-1.0" and registers child devices on the auxiliary bus,
converting cpuidle-psci-domain from a platform driver into an auxiliary
driver.

> diff --git a/drivers/firmware/arm/psci/psci-devices.c b/drivers/firmware/=
arm/psci/psci-devices.c
> new file mode 100644
> index 0000000000000..d23befc490ed5
> --- /dev/null
> +++ b/drivers/firmware/arm/psci/psci-devices.c
> @@ -0,0 +1,116 @@

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
Can returning 0 here when psci_cpuidle_domain_probe() defers cause
fw_devlink to permanently mark the child power-domain DT nodes as
FWNODE_FLAG_NOT_DEVICE?

When a PSCI child power domain references an external parent power domain
that has not probed yet (such as cluster_pd referencing &mpm on
qcom/sm6375), dt_idle_pd_init_topology() returns -EPROBE_DEFER and
psci_pd_remove() deletes the child genpd devices, leaving their
fwnode->dev pointers NULL while auxdev is placed on the deferred probe
list.

Because device_add(&auxdev->dev) still returns 0, arm_psci_probe()
succeeds on the parent arm,psci-1.0 platform device.  driver_bound() then
runs device_links_driver_bound(&pdev->dev) ->
fw_devlink_pickup_dangling_consumers(&pdev->dev):

drivers/base/core.c:__fw_devlink_pickup_dangling_consumers() {
	...
	if (fwnode->dev && fwnode->dev->bus)
		return;

	fwnode_set_flag(fwnode, FWNODE_FLAG_NOT_DEVICE);
	__fwnode_links_move_consumers(fwnode, new_sup);
	...
}

Previously, psci_cpuidle_domain_driver bound directly to the platform
device, so -EPROBE_DEFER prevented driver_bound(&pdev->dev) from running
until the topology was initialized.  With this regression, the child
power-domain fwnodes are permanently flagged FWNODE_FLAG_NOT_DEVICE and
their consumer fwnode_links are moved to the already-bound parent pdev,
unblocking consumers before the PM domains exist and leaving the child
genpd devices without consumer device links to hold off sync_state once
psci_cpuidle_domain_probe() later retries.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-arm-psci-s=
ystem_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com?part=3D4
