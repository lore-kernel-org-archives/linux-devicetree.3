Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F396B440643
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543319; cv=none; b=b6wtLKc2ylNn4I3WGlDmGHEj2HeZMcslkAYFBvIlGH/hYWogL0d3hVecaz53bgE24y7IqAl53xDOW3jxzHqNTGASoGZ7+l9ukKP0yBoeKW+bRUQuIMrabQA2NeKKDau6gXuqh8YKsHfYc/7lgeJlkYFDWEziu+bGEVSuZD8iDa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543319; c=relaxed/simple;
	bh=qKDZpjzJBfAMMleDECDXmrFAiXKIhYAG6zeXIgLZqB8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YXXIJ0c/ATV2wMJSfWe0dKOainZC+pEKxGb6oCIlXNMMLs1ffyrhwfDHHM4LUY1U1NX+hKwrOO5rr2ilalk+ln7iYVtokRZmuVDfRpff1j+Ab8y/e37JO6lXBNykE8ORr9EYw2AKsSLoWmG8ir6lP2OqSVy66NmrLmtVmzUGbC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ch8BSRJ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ch8BSRJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D741F00893;
	Wed, 16 Sep 2026 07:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789543288;
	bh=PZO+C+d6FTo05ZYUZnR1OYIaXW743DjTwjtKF9v44dI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ch8BSRJ9G16DbZLwOEBOUpsYrpaTB6pp7muVXpfN6IGTf5pKc7TMoEoSTWri/72Pu
	 0AXGhS/1poNjcxRZCyQfZOnxIMiCtP+5moMj6FkQBUFHyd0ggCYR6dUeqRa3fQeuAR
	 qhH2HmaqK2llpmeld3jVgz9guYM5VlFVJVyuMMRMOUtUIhI5Lvv1uZq6s7cFbCEmmq
	 H/xKVLPE6JEAahGl8sQNuB55khSPafKc2+6/lfaEHPY7dBMn4FHVT7U34pL4XADcN3
	 fpzIvdDPN2qgvCOZ6KZxP/vMopWjb8zWqM5RlGxtdAvOaeBzo6avXJowwgDGGrFKNi
	 G5yQIaKjUf1SQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260916070728.1088801-7-lakshay.piplani@nxp.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
 <20260916070728.1088801-7-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 07:21:27 +0000
Message-Id: <20260916072127.A5D741F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] i3c: hub: dynamically discovered devices attach to wrong bus bypas=
sing port
- [Medium] i3c: hub: cascaded hubs fail to propagate address reservations t=
o root bus
--

commit 9fb8ad75cf771fba9c1b6bdfec7ca6cd1cb60041
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: Add support for the I3C interface in the I3C hub

This patch adds virtual I3C bus support for hubs by creating virtual
master controllers for downstream ports and forwarding bus operations
through the hub device. It also provides an interface used by hub
drivers to enable or disable downstream ports during bus transactions.

> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 0000000000000..5390287680844
> --- /dev/null
> +++ b/drivers/i3c/hub.c
> @@ -0,0 +1,832 @@
[ ... ]
> +static int i3c_hub_do_daa(struct i3c_hub *hub,
> +			  struct i3c_master_controller *controller)
> +{
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
When i3c_hub_do_daa() forwards DAA to the parent controller here, won't
the parent discover the downstream device and add it to its own
parent->bus.devs.i3c list instead of the virtual bus?

If a downstream device without a static address connects behind the hub
port, and the physical parent controller owns the device record, subsequent
I/O will use the parent's i3c_xfers() implementation. Does this permanently
bypass the virtual hub controller, meaning the i3c_hub_enable_port() routing
logic is never triggered for these devices and transfers will fail?

> +	i3c_hub_disable_port(controller);
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}
[ ... ]
> +int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controller *=
hubc,
> +					     struct device_node *node)
> +{
[ ... ]
> +		i3c_bus_maintenance_lock(&parent->bus);
> +		status =3D i3c_bus_get_addr_slot_status(&parent->bus,
> +						      assigned_addr);
> +		if (status =3D=3D I3C_ADDR_SLOT_FREE)
> +			i3c_bus_set_addr_slot_status(&parent->bus,
> +						     assigned_addr,
> +						     I3C_ADDR_SLOT_I3C_DEV);

[Severity: Medium]
In a cascaded hub topology, won't this only update the addrslots bitmap
of the immediate parent->bus (which is the upstream hub's virtual bus)?

Since DAA is recursively forwarded to the root physical controller, that
root controller assigns dynamic addresses based on its own addrslots bitmap.
Does this mean the nested address reservations fail to reach the root bus,
potentially leading to dynamic address collisions if the root controller
assigns these reserved addresses to newly discovered devices?

> +		i3c_bus_maintenance_unlock(&parent->bus);
> +	}
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916070728.1088=
801-1-lakshay.piplani@nxp.com?part=3D6
