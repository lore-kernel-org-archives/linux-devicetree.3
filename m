Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DF5314D34
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165222; cv=none; b=OBLqHClMLgWCiTz1+J7gYwUvAo9zf3hQyPtMQO9G0Fki125OYQwbNNN2rryVBCmXTodaH+QweBjz4ZKJYMEhJangLGgTJrElqoHq8eVklHqUBVQz3Ovx/T//KS/cANQDE+31c7nb0+F9DX7a+7oQDD6r3AKdpRpRcoxSsZSalR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165222; c=relaxed/simple;
	bh=RcI6wRhj02P7TjJ32TSx/hpFXqBHCnD4QV0M6wjl/Lg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RRCOEqGjSf9fMlAra2GC5buavf4TPhV75JW6GY/aS4fWcNdHYH8iPCnvMHB9nZKv8DFkDgL754gj7s6Tms+VQDvdhQWQws1UMqdIZUw/tMbmlHe0V32ew929qu3Koa1DEvOCNz6IDWxyo58/oKYbMvBA7hcgzpsRcoAmwzLtb9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B00cIkIX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B00cIkIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBE21F000E9;
	Mon, 31 Aug 2026 08:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165219;
	bh=m4pOkBCmKudy6mOP+T/3a7PCG1EVTyrJizKZ0FrPTBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B00cIkIXITodMK4f9k8ZodBWB476rC+lGuESSvGcqtgeDIAjhDf5FzeMHRQoKemHk
	 963mYIK8I00xxTViUqOc6tJjv+7KJ0TzBawhEFOaZkY1YIjzbu7gpTEVRo+joRFBYV
	 p1HUvfvcZLy1yV11OPbOkie/8ZLeScYjngGqH7Zf0K1SFeE3R9yaQxaX1rTmwqzDnP
	 Jh2Ol5Rbb9SJe56Oe29Rwzx5gfgUqoTrtd6nKJcJ+CSdF0ukGAeKk26GQ3TE+bnt8X
	 jsEUp/LSHuKF81CRVGQUoZY866Pqq3sXMxaxKjgGVEGxRSu+0avTgzoKpfRh6fO5WU
	 IaI76oVEci81Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/4] phy: cix: Add CIX Sky1 USB3 PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260831082309.3854507-3-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
 <20260831082309.3854507-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:33:38 +0000
Message-Id: <20260831083339.3DBE21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Uninitialized pointer dereference and double-free of OF node refer=
ence on probe error path.
- [High] The probe function fails to propagate error codes and always retur=
ns 0 (success) on failure paths.
- [High] Missing cleanup for dynamically allocated `phy_lookup` entries cau=
ses a memory leak and Use-After-Free.
- [High] Hardware resets are unconditionally asserted without locking after=
 the PHY provider is registered, creating a race condition with consumer in=
itialization.
- [Medium] The error path in `sky1_u3phy_init` mistakenly deasserts the har=
dware resets instead of asserting them.
- [Medium] Missing `MODULE_DEVICE_TABLE(of, ...)` macro prevents automatic =
module loading.
--

commit 2c8f0e43d1973dd21cdeec9d0d419e0f7d1939aa
Author: Hongliang Yang <hongliang.yang@cixtech.com>

    phy: cix: Add CIX Sky1 USB3 PHY driver
   =20
This patch adds a new PHY driver for the USB3 PHY found on CIX Sky1 SoCs.
The driver handles initialization, reset, and clock management for the
multi-port USB3 PHY.

> diff --git a/drivers/phy/cix/phy-cix-usb3.c b/drivers/phy/cix/phy-cix-usb=
3.c
> new file mode 100644
> index 0000000000000..3b6e2669b09d8
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usb3.c
[ ... ]
> +static int sky1_u3phy_init(struct cix_u3phy *u3phy)
> +{
[ ... ]
> +disable_ref_clk:
> +	clk_disable_unprepare(u3phy->ref_clk);
> +disable_apb_clk:
> +	clk_disable_unprepare(u3phy->apb_clk);
> +assert_reset_preset:
> +	reset_control_deassert(u3phy->preset);
> +	reset_control_deassert(u3phy->reset);

[Severity: Medium]
Does this error path correctly assert the reset lines?=20

The code calls reset_control_deassert() instead of reset_control_assert(),
which leaves the PHY in a deasserted reset state while its clocks are
disabled. This might violate the intended quiescent hardware state and
could potentially lead to hardware lockups or excessive power consumption.

> +	u3phy->init =3D false;
> +	return ret;
> +}
[ ... ]
> +static int cix_u3phy_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	device_for_each_child_node(dev, child_fn) {
> +		child_np =3D to_of_node(child_fn);
> +		if (!strncmp(fwnode_get_name(child_fn), "usb-port", 8) ||
> +		    !strncmp(fwnode_get_name(child_fn), "USB", 3))
> +			phy =3D devm_phy_create(dev, child_np, &cix_u3phy_ops);
> +		else
> +			continue;
> +		if (IS_ERR(phy)) {
> +			dev_err(dev, "failed to create phy: %s\n",
> +				fwnode_get_name(child_fn));
> +			goto put_child;

[Severity: High]
Does this error path intentionally return 0 instead of propagating the
error code?

The variable 'ret' is initialized to 0 and is not updated with the error
from devm_phy_create() before jumping to the cleanup label. This causes
the kernel framework to consider the driver successfully probed despite
the initialization failure.

> +		}
> +		phy_set_drvdata(phy, u3phy);
> +		phy_create_lookup(phy, fwnode_get_name(child_fn), dev_name(dev));

[Severity: High]
Is there a corresponding cleanup mechanism for this dynamically allocated
phy_lookup entry?=20

The driver creates lookup entries using phy_create_lookup() but does not
seem to provide a .remove callback or devres action to call
phy_remove_lookup(). When the driver is unbound, devres frees the struct
phy, leaving dangling pointers in the global lookup list which could cause
a use-after-free for subsequent lookups by consumers.

> +	}
> +	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
> +	if (IS_ERR(phy_provider)) {
> +		dev_err(dev, "failed to register phy provider\n");
> +		goto put_child;

[Severity: High]
Similar to the devm_phy_create() error path, does this drop the error code
from devm_of_phy_provider_register()?

Additionally, does jumping to put_child here cause a double-free or a
dereference of an uninitialized pointer?=20

If the device_for_each_child_node loop executed zero times, child_np is
completely uninitialized. If the loop executed at least once and completed
normally, child_np holds a pointer to the last child whose reference was
already released by the iterator's final condition check.

> +	}
> +	reset_control_assert(u3phy->reset);
> +	reset_control_assert(u3phy->preset);

[Severity: High]
Is it safe to unconditionally assert these hardware resets here without
locking after the PHY provider is registered?=20

A deferred consumer could immediately acquire the exposed PHY and call
phy_init(), which initializes the PHY and deasserts resets while holding a
mutex. Concurrently, this probe function unconditionally executes
reset_control_assert() without holding the mutex, which might forcefully
reset the active PHY hardware.

> +	return 0;
> +
> +put_child:
> +	of_node_put(child_np);
> +	return ret;
> +}
> +
> +static const struct of_device_id cix_u3phy_dt_match[] =3D {
> +	{
> +		.compatible =3D "cix,sky1-usb3-phy",
> +		.data =3D &sky1_u3phy_cfg
> +	},
> +	{ /* sentinel */ }
> +};

[Severity: Medium]
Is the MODULE_DEVICE_TABLE(of, ...) macro missing here?=20

Without it, the driver module cannot be automatically loaded by udev or kmod
based on the Device Tree compatible string.

> +
> +static struct platform_driver cix_usb3_phy_driver =3D {
> +	.probe		=3D cix_u3phy_probe,
> +	.driver		=3D {
> +		.name	=3D "cix-usb3-phy",
> +		.of_match_table =3D cix_u3phy_dt_match,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831082309.3854=
507-1-hongliang.yang@cixtech.com?part=3D2
