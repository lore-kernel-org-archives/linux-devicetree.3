Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D32820D4F0
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 03:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319934; cv=none; b=qvsiI04uKeC+8VIeL2z4vTqVkVUAsF6h+pwligVZ3B1APxJcfFz3p2HeD/kNIow9z0m5I/Mjs6SgbAo/Zk6aX4fJKxqRsFE3q2P9eRoLw4f5fwEVHPDlPH5GxjPpfDvXi0VbEtABJr8L5ndYObARFPIJ6mzEAsyOe0k5g9yJ924=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319934; c=relaxed/simple;
	bh=HzaGhoUJqWmO992jE3szRwHVqEQQZE6cdysM0+Zi4QE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c7h7o+++MT8FFKDiEcC92EHJb7pISBJChKtYDOEfmjLu680GYKcLpekBon9KYhb9qPTH0tkvUblzDAHpbB1/jU/+jn49fkBMEhq07dy1L2MsQfaNlHa4QPzKXK3/6NAi8BX28badQ3/Uz6HiOCjKHXgeaCgjRAXht/CqBUDL8XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTwqGXxy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTwqGXxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6EA1F000E9;
	Wed,  2 Sep 2026 03:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788319932;
	bh=auS/g3DXuzMvxumUHoHI3AcvLKzS4Mi6CyO60EpltJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jTwqGXxyo7Fm2+wDYtulYKOwphhy1GsK+PKVWbsYgM3ivM/VDGJTRkW7QnSJrjl1c
	 XM8OKNrG9j/hTRGnX2s7O2+ZGVzgxzNML2wcAeOzHIEUgVF5TZTOIH3i9U2yn8akSX
	 jWDe3mO7D46WQ8JCoSJ3QfAgRyqVLtr0nawiwHToCI95ezuhrjhM6l9IUi45Lg5VQo
	 kmLLJqk8NCwxwrELCa35NE9gTNBJFFHBFMSEtpb3x+vIrOCR4kM7PNTTiChNPSDyY0
	 0sFz+8S5fr3TkBwp+zXBK3HHaexxZ9sfnNH0GeWuVy+dGiKGYLOm/LOUISLj3iUUbH
	 fP6wjuhMhotJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] phy: cix: Add CIX Sky1 USB3 PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260902032134.1182634-4-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
 <20260902032134.1182634-4-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 03:32:11 +0000
Message-Id: <20260902033211.ED6EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware resets asserted after exposing the PHY provider, risking =
a race condition with consumers.
- [Medium] Teardown asymmetry and inverted unroll order for hardware clocks=
 and resets.
- [Medium] Unsafe string comparison using `fwnode_get_name()` without NULL =
check.
--

commit dd0ea5bd301cf4c2946f4bb80843b35c7ad1ab64
Author: Hongliang Yang <hongliang.yang@cixtech.com>

phy: cix: Add CIX Sky1 USB3 PHY driver

This commit adds a PHY driver for the USB3 PHY on CIX Sky1 SoCs, handling
initialization, reset, and clock management for the multi-port USB3 PHY.

> diff --git a/drivers/phy/cix/phy-cix-usb3.c b/drivers/phy/cix/phy-cix-usb=
3.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usb3.c
[ ... ]
> +static int sky1_u3phy_exit(struct cix_u3phy *u3phy)
> +{
> +	u3phy->init_count--;
> +	if (u3phy->init && u3phy->init_count =3D=3D 0) {
> +		reset_control_assert(u3phy->reset);
> +		reset_control_assert(u3phy->preset);
> +		clk_disable_unprepare(u3phy->apb_clk);
> +		clk_disable_unprepare(u3phy->ref_clk);

[Severity: Medium]
Does this disable the clocks in the correct order? The initialization path
enables apb_clk before ref_clk. To ensure a proper LIFO teardown sequence,
should ref_clk be disabled before apb_clk here?

[ ... ]
> +static int sky1_u3phy_init(struct cix_u3phy *u3phy)
> +{
[ ... ]
> +disable_ref_clk:
> +	clk_disable_unprepare(u3phy->ref_clk);
> +disable_apb_clk:
> +	clk_disable_unprepare(u3phy->apb_clk);
> +assert_reset_preset:
> +	reset_control_assert(u3phy->preset);
> +	reset_control_assert(u3phy->reset);

[Severity: Medium]
Will this error unroll sequence leave the hardware in an unrecoverable stat=
e?

This path disables the clocks before asserting the hardware resets. This
contradicts the normal teardown sequence in sky1_u3phy_exit(), which asserts
the resets before disabling the clocks.

[ ... ]
> +static int cix_u3phy_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	device_for_each_child_node_scoped(dev, child_fn) {
> +		child_np =3D to_of_node(child_fn);
> +		if (!strncmp(fwnode_get_name(child_fn), "usb-port", 8) ||
> +		    !strncmp(fwnode_get_name(child_fn), "USB", 3))

[Severity: Medium]
Can this trigger a NULL pointer dereference? fwnode_get_name() can return
NULL for certain software nodes.

Additionally, does using strncmp() with a fixed length incorrectly match
arbitrary suffixes like "usb-port-foo" while failing to properly handle
unit addresses like "usb-port@0"? Could fwnode_name_eq() be used here
instead?

[ ... ]
> +	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
> +	if (IS_ERR(phy_provider)) {
> +		ret =3D PTR_ERR(phy_provider);
> +		dev_err(dev, "failed to register phy provider\n");
> +		return ret;
> +	}
> +	reset_control_assert(u3phy->reset);
> +	reset_control_assert(u3phy->preset);

[Severity: High]
Does asserting these resets after exposing the PHY provider create a race
condition with consumers?

Once devm_of_phy_provider_register() completes, a consumer driver could
concurrently probe and call phy_init(). If the consumer initializes the
PHY and deasserts the resets, this probe thread will then continue and
unconditionally assert the resets without holding u3phy->mutex. This would
destroy the initialized state while the consumer is actively using the PHY.

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831082309.3854=
507-1-hongliang.yang@cixtech.com?part=3D3
