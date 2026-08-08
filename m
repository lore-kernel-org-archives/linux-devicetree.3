Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920AB3B2FD1
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186012; cv=none; b=otdJqsua3eRouLa/tw2ZDpZZ/GRHQsbSQfJHvpAFhGA1SA+mDt1ZWIcXGSqqsMDcmzcKTjQ+YqRjBvKn58pK3llfk3ksdX01l0OX+nM5ovIFHYqT8iOQJ5Ob7pz8yW1e00P7x37+eSOFq/LHLgFTaKHKKB7XJgfQ6SrFcIlp/zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186012; c=relaxed/simple;
	bh=Joo3z5pkYB2cT/Acjx9zZQce99XT+o3J9H9Nl79+I/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=II0G0inD9fgSkMQ62AjlWbCbGsQSKcstRbmVQpYcgSpQIiqbH4obdfJ0eHXhHmOjmAmoUfCeL9Nki4pnydl2fCty6tl8ZY6HVJ3OFeh3WFN8tCc6AiTmnZstQJZv+mHb9r5ZiXMOdgmvTjMU2qnU1MabQ0zTf4e6NL9rrbUTc3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1V7CGPY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1V7CGPY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389DF1F00A3D;
	Sat,  8 Aug 2026 10:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186011;
	bh=KuAJybXo1t2wJxhZFppbYeqhiuBSoTt8KsBas+8uXlY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b1V7CGPYpoSfMNR89fs/gXZIFBb+xR8BS4MLlp7CMuYIlntNbtWH6wP+fgv9kM5Uj
	 rO5478O2PInSdkH/aEcdfUP7MH1JLuJRFQGpgK338FX+SumGL1neiCx5nd8PU49AZu
	 3uZvTIacbFJ4iQUitEyqooZcJEvuTMKIrDUuquI2Pq452/2l9j/RrovVqS9fRJia7Z
	 4WwXULXGFyd5gy7GIgzPPqkFhL8BcMtG6HEneV/omem387dmAmhV5uC0skBwocIkct
	 I/LsYRy83mqTq2PV4Ityp70AXpeqMM7+Rv8KnwjND302kacGadlz454HQhepvnnbUa
	 C3/vOUANt8vCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/20] net: dsa: xilinx: register per-MAC MDIO buses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807104431.157230-13-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-13-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:50 +0000
Message-Id: <20260808104651.389DF1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Memory leak due to using `devm_mdiobus_alloc()` inside the DSA `=
setup()` callback.
--

--- Patch [12]: [PATCH 12/20] net: dsa: xilinx: register per-MAC MDIO buses=
 ---
commit c6fca5c014413b7a2cd4b20eaa39b52cdbb9cc43
Author: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>

net: dsa: xilinx: register per-MAC MDIO buses

This commit registers each MAC's MDIO bus as a child of the switch node
and adds a new struct xlnx_tsn_mac to group per-MAC state. The MDIO clock
divisor is derived from the IP-wide s_axi clock.

> diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.c b/drivers/net/dsa/xilinx=
/xilinx_tsn.c
> index 020b1622670c8..542b74514ed3a 100644
> --- a/drivers/net/dsa/xilinx/xilinx_tsn.c
> +++ b/drivers/net/dsa/xilinx/xilinx_tsn.c

[ ... ]

> +static int xlnx_tsn_mdio_register_one(struct xlnx_tsn *sw, int port,
> +				      const char *child_name,
> +				      unsigned long host_hz)
> +{
> +	struct xlnx_tsn_mac *m =3D &sw->mac[port];
> +	struct device_node *mdio_np;
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	mdio_np =3D of_get_child_by_name(sw->dev->of_node, child_name);
> +	if (!mdio_np)
> +		return 0;
> +
> +	bus =3D devm_mdiobus_alloc(sw->dev);

[Severity: Medium]
Does this leak memory if the DSA tree is unbound and rebound?

This allocation is eventually called from the xlnx_tsn_setup() callback.
The setup() and teardown() callbacks in the DSA framework can be invoked
multiple times during a switch device's lifetime, such as when the master
netdevice is administratively unbound and rebound, or when the DSA tree is
reconfigured.

By using devm_mdiobus_alloc(), the memory lifetime is tied to the physical
switch device (sw->dev) rather than the DSA tree binding, meaning the
allocated memory will accumulate across teardown/setup cycles.

> +	if (!bus) {
> +		of_node_put(mdio_np);
> +		return -ENOMEM;
> +	}

[ ... ]

> +static void xlnx_tsn_mdio_unregister_all(struct xlnx_tsn *sw)
> +{
> +	int port;
> +
> +	for (port =3D XLNX_TSN_PORT_MAC1; port <=3D XLNX_TSN_PORT_MAC2; port++)=
 {
> +		struct xlnx_tsn_mac *m =3D &sw->mac[port];
> +
> +		if (m->mii_bus) {
> +			mdiobus_unregister(m->mii_bus);
> +			m->mii_bus =3D NULL;
> +		}

[Severity: Medium]
Does this teardown path leave the MDIO bus memory allocated?

Because the bus was allocated with devm_mdiobus_alloc(), unregistering it
here during the DSA teardown path won't actually free the memory.

Should this use mdiobus_alloc() instead so it can be explicitly freed with
mdiobus_free() during teardown, or should the MDIO bus allocation be moved
to the initial driver probe() instead of the DSA setup() phase?

> +
> +		/* clear the enable bit even when no bus was registered (failed probe)=
 */
> +		mac_iow(m, TSN_MDIO_MC_OFFSET, 0);
> +	}
> +}

[ ... ]

> @@ -160,7 +351,7 @@ static int xlnx_tsn_setup(struct dsa_switch *ds)
>  			return ret;
>  	}
> =20
> -	return 0;
> +	return xlnx_tsn_mdio_register_all(sw);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D12
