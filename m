Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D482F84F
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788122399; cv=none; b=V+eajmMpzEKbhw7cJF3VgJViGAEnfuoV3cXIC3XgJ2xfUkJaNws/+8xHi4JxDBfuJqRuIH6+U9B/+AqevnDMje/Ckyc3C1iewlqp5OH+0870X/usclt9zw5mY9lyNAWO5GFy6VWEgAFHiqT9PoU6SoQizgXBKkvCyotIp13d5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788122399; c=relaxed/simple;
	bh=EuVTg/40txMn+HkWA0tqe8Ub1BPI/4LvdWyklNbH1No=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CSsgVt7uj71sAZi+5XXS1uOzny2KLTo1i76JWhua3fKmiawFgSnhdQDAvH6Ku00rgc7dnK5MZZN9OhtM5G5TNw7Dcp7kPHIo4B806LBTFDkPG5WzcGigGNgVSRqbHzIWSouwWcG0wYsW/6WG8uw8/XkByMAeh8eSJLCs+xZjZMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjIw3lY2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjIw3lY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB1C1F000E9;
	Sun, 30 Aug 2026 20:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788122398;
	bh=a0QN/oDoVI8EuH+Gfxqawk1RgbYbDXKVOwftCRtdiUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TjIw3lY2X0WFIJxTGzUa2J6MTe4WFAJ6wOXIjUQ14dJyCWy+ie071itpMYD72kX8n
	 KuFsoyrfsu2SDK36DaPs/WpeyMDOJ6Gw04UmjTU0RWeMtEIfPNV8vj2zgXUd/xL0GP
	 f+XPYXYUFuuHjVHy7gnHF2pSAHGwv92dteG2evVFFyy0Png6KpVdsSxk0r2zEivEBX
	 0D9KyebM8fUJjeeyQkOxUlj7j7d8onlnDzZeoxcf9O6FvF718eMy7Q8r6sm/opl5wl
	 cKK8W9q6ilzyzRsyM9xYmP9CsKMlANDY9EyJNZ2uMYUBfTQNEsF1fldOeAi+z7ZuYN
	 4w+QSAWyYXYAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/19] thunderbolt: Add Apple Silicon support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-16-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-16-44bc9348683c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 20:39:57 +0000
Message-Id: <20260830203957.CDB1C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Use-After-Free of `acio` when the `apple-cio` driver is unbound vi=
a sysfs while a Type-C switch reference is still held.
- [High] Missing `reset_control_assert` in `apple_cio_stop` and error paths=
, leading to unbalanced hardware reset state.
--

commit 6a1dc8288abd453dc286fa2a4ef8d8b16dc3f168
Author: Sven Peter <sven@kernel.org>

thunderbolt: Add Apple Silicon support

This commit adds a platform driver for the ACIO host router complex and
Native Host Interface (NHI) found on Apple Silicon SoCs. It brings up the
coprocessor in response to Type-C notifications and handles child devices.

> diff --git a/drivers/thunderbolt/apple.c b/drivers/thunderbolt/apple.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/thunderbolt/apple.c
[ ... ]
> +static void apple_cio_stop(struct apple_cio *acio)
> +{
> +	int ret, i;
[ ... ]
> +	/* Finally, remove the links to the PD domains to power everything off =
*/
> +	for (i =3D 0; i < acio->pd_list->num_pds; i++) {
> +		if (acio->pd_list->pd_links[i])
> +			device_link_del(acio->pd_list->pd_links[i]);
> +		acio->pd_list->pd_links[i] =3D NULL;
> +	}
> +
> +	acio->current_cable_info =3D 0;
> +}

[Severity: High]
Does this sequence need to assert the reset control before cutting power?

When a cable is disconnected, apple_cio_stop() cuts the ACIO power domains
but does not call reset_control_assert() on acio->reset. Because the hardwa=
re
reset remains in the deasserted state in the reset controller, could the ne=
xt
cable insertion fail to generate the required transition (assert -> deasser=
t)
when power is reapplied in apple_cio_start()?

[ ... ]
> +static int apple_cio_start(struct apple_cio *acio)
> +{
[ ... ]
> +	/*
> +	 * After the power domains are on we need to signal and wait for the AC=
IO block
> +	 * to actually start before we can bring up the co-processor.
> +	 */
> +	ret =3D reset_control_deassert(acio->reset);
> +	if (ret) {
> +		dev_err(acio->dev, "ACIO block failed to start: %d\n", ret);
> +		goto remove_links;
> +	}
[ ... ]
> +remove_links:
> +	/* Cut power to reset the entire block  */
> +	for (i =3D 0; i < acio->pd_list->num_pds; i++) {
> +		if (acio->pd_list->pd_links[i])
> +			device_link_del(acio->pd_list->pd_links[i]);
> +		acio->pd_list->pd_links[i] =3D NULL;
> +	}
> +	return ret;
> +}

[Severity: High]
Similar to apple_cio_stop(), the remove_links error path drops the power
domains, but it looks like the reset might remain deasserted if this path
is reached after reset_control_deassert() succeeds.

Would it be safer to ensure reset_control_assert() is called on the error
paths before dropping power?

[ ... ]
> +static int apple_cio_tbt_switch_set(struct typec_thunderbolt_switch_dev =
*sw,
> +				    const struct typec_thunderbolt_switch_data *data)
> +{
> +	struct apple_cio *acio =3D typec_thunderbolt_switch_get_drvdata(sw);
> +
> +	guard(mutex)(&acio->lock);
[ ... ]
> +static void apple_cio_remove(struct platform_device *pdev)
> +{
> +	struct apple_cio *acio =3D platform_get_drvdata(pdev);
> +
> +	typec_thunderbolt_switch_unregister(acio->tbt_switch);
> +
> +	guard(mutex)(&acio->lock);
> +	if (acio->current_cable_info)
> +		apple_cio_stop(acio);
> +}

[Severity: High]
Can this lead to a use-after-free of the acio structure if the driver is
unbound while a Type-C switch reference is still held?

If the thunderbolt-apple-acio driver is unbound via sysfs,=20
apple_cio_remove() will unregister the switch, but devres will immediately
free the acio structure.

If the Type-C port driver (tipd) still retains a reference to the switch
device, and a cable hotplug occurs, could the port driver invoke
apple_cio_tbt_switch_set() and dereference the freed acio pointer to
acquire its mutex?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830-b4-apple-s=
oc-tbt-v1-0-44bc9348683c@kernel.org?part=3D16
