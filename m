Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED113F23DB
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417499; cv=none; b=DcPV9KRUGxkW1SMGzwowvwnxwnfeaA4VM0CG5Q64JOaH9P+2D7fgqrSqgQSx0cp2/4d8JxZYYAdvgi+QiNlWrHwvZgDoqV2Dv+9QYQA/sYLZztziA0luHG2uJhJrYGy1/IquVWA7e7X4pdYC1rEcoyy0AsC4FlsiuWol9fUCLEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417499; c=relaxed/simple;
	bh=V22/oYD6tjp1Mz6jpBfu6fcWmls9WYZNo22RoPecN8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lfMYrTZvbTDVwWddqui4gjklW/DNooW5NZCBt+UgJxxcYPC7xCa4Dsh047WrlG1y7YyrrqZIgFKWMya+wvWnHg8BvzozkXHgIYVwSOChp6/t06Cre1TBDnBLH/gd2zDoHE3LcRI5m3Bqn67tP8L0L5Ww/Xzh10d6hSAm8/rLwaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMkl4a31; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMkl4a31"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E500D1F000E9;
	Thu,  3 Sep 2026 06:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417494;
	bh=Qm9nhcL1MmIbPlZqcmKfH5kj0lKMQg5FV2EYkIO9WoQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lMkl4a31HcU7FtAxj/3mXWy0Zrk98TaVzh/fVRbUvPcFdo61jDgswNICGSlGe1oAe
	 KAWxK0j/1YRHJOMKOD97j6ZQeMTG2odaS6RBwJYze8ALeAYXfDfeuTWLlAoRCpkMsB
	 rmabzVYvaMRk8qAkxQ+/WAayKzy4aBPuY+cpTU3YzfLaWiDfa96EMB32Q6U79mZauw
	 pEiM8cFgkYAMq1MN3T1uq8NECsdksrfQT7RUQ5zLQN+VrfvBrJpC+bpct0kzr46Mzi
	 J+BubTRf1NKzEwaCwf89J5nYbV1sjtdDQFTg8yM6IYWkF1ta/gmcT1OSe+d5Ho/OAS
	 65YHIp0H4zOag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903062108.2712296-7-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-7-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 06:38:13 +0000
Message-Id: <20260903063813.E500D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Downstream devices discovered via ENTDAA are incorrectly instantia=
ted on the parent bus, bypassing the hub's port routing logic.
- [High] Intentional Use-After-Free in `i3c_hub_detach_i3c_dev` when asynch=
ronous IBI is still active.
--

commit 31f3feaa7d1564a667461b06aa36ed62fb353a0a
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: Add support for the I3C interface in the I3C hub
   =20
This commit adds virtual I3C bus support for the hub and provides an interf=
ace
to enable or disable downstream ports.

> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 0000000000000..5390287680844
> --- /dev/null
> +++ b/drivers/i3c/hub.c

[ ... ]

> +static void i3c_hub_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_hub_dev_data *data =3D i3c_dev_get_master_data(dev);
> +	struct i3c_master_controller *parent;
> +
> +	if (!data)
> +		return;
> +
> +	parent =3D i3c_dev_get_master(&data->parent_desc);
> +
> +	/*
> +	 * parent_desc.ibi should already be cleared by i3c_hub_free_ibi()
> +	 * before we get here. If it is still set, the kfree(data) below frees
> +	 * a descriptor the parent controller can still reach via un-flushed
> +	 * asynchronous IBI work (use-after-free, not just a leak).
> +	 */
> +	WARN_ON_ONCE(data->parent_desc.ibi);
> +
> +	if (parent) {
> +		i3c_bus_maintenance_lock(&parent->bus);
> +		i3c_master_detach_i3c_dev_controller_locked(&data->parent_desc);
> +		i3c_bus_maintenance_unlock(&parent->bus);
> +	}
> +
> +	i3c_dev_set_master_data(dev, NULL);
> +	mutex_destroy(&data->parent_desc.ibi_lock);
> +	kfree(data);

[Severity: High]
Does this code introduce a use-after-free if the asynchronous IBI task is
still active?

When a downstream device is unbound while an IBI is active, the I3C core ca=
lls
i3c_hub_detach_i3c_dev() without first freeing the IBI. This occurs because
i3c_master_detach_free_devs() executes during i3c_master_bus_cleanup() with=
out
clearing IBIs.=20

While the warning correctly detects this state, calling kfree(data)
unconditionally frees the memory while the parent controller's un-flushed I=
BI
workqueue (i3c_master_handle_ibi) might still execute and dereference the
freed data->parent_desc.

Would it be safer to leak the allocation by returning early rather than fre=
eing
actively referenced memory to avoid memory corruption?

> +}

[ ... ]

> +static int i3c_hub_do_daa(struct i3c_hub *hub,
> +			  struct i3c_master_controller *controller)
> +{
> +	struct i3c_master_controller *parent;
> +	int ret;

[ ... ]

> +	/*
> +	 * Downstream devices reachable through hub target-port routes share the
> +	 * parent controller's I3C address space. The hub gates access to a
> +	 * target-port network, but it does not create an independent dynamic
> +	 * address domain per virtual bus.
> +	 *
> +	 * Run DAA on the parent controller so dynamic addresses remain unique
> +	 * across all downstream devices, even when they are behind different
> +	 * target ports.
> +	 *
> +	 * The current hub model shares the parent controller's dynamic-address
> +	 * domain and does not support independent per-port DAA domains, so a
> +	 * DAA result does not go stale behind a port toggle. Addresses reserved
> +	 * from the Device Tree are held for the lifetime of the parent bus and
> +	 * are never released on a port toggle, so enabling or disabling a port
> +	 * only gates reachability and never causes an address to be handed out
> +	 * twice.
> +	 */
> +	ret =3D i3c_master_do_daa(parent);

[Severity: High]
Can delegating DAA entirely to the parent controller here cause downstream
devices to bypass the hub port routing logic?

If a downstream device lacks an assigned-address or static address in DT, it
is skipped by i3c_master_early_i3c_dev_add() and left to be discovered
dynamically. When i3c_master_do_daa() executes on the parent, the parent
controller performs ENTDAA, discovers the downstream device, and instantiat=
es
the i3c_device on parent->bus.devs rather than the virtual controller's bus.

This would cause target drivers to bind to the device on the parent bus. Th=
eir
transfer requests would be routed directly to the parent controller, comple=
tely
bypassing i3c_hub_master_priv_xfers() and leaving the hub port closed, which
would cause wire transfers to fail.

> +	i3c_hub_disable_port(controller);
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903062108.2712=
296-1-lakshay.piplani@nxp.com?part=3D6
