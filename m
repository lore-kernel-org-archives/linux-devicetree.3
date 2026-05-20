Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F257F3A3E74
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267578; cv=none; b=Gu/5eDRt+lsUJCawTITDAdMWU84yGQb5h1UZgMnOjnPuIaRQElLei8DshWSLHJnWtMa6eYMqopBX/OFl7hVOZd+njTDA350+csAX928fknfJ8NFvHcIk9uVLDk/vkZPLtVGHxgjbfm8+XN+9WhJ7Xs4xiZ+dPwVGdG/U9r2ihIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267578; c=relaxed/simple;
	bh=XxfBcCgX8ANUjLz6RbBA9rHyYpdNyry359ccbsJ2hpU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DxafimstXZbgURrWbrLtzsACWH5X4tvNo5wMYVsOumjNzYn6dI4vdrX4ckvAGMDUIctOS/fq1aHOu1m3iGu1sp7gIrUyVa3beuDsVDWKkFj4CefrGwt60gQ/UrbJ92XvkrkpGty77YvkwSJfw7bl07Vsl7RwVAeM6fg7F1L3dRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3gbwJ+C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3gbwJ+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C009F1F00893;
	Wed, 20 May 2026 08:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779267573;
	bh=lN+Gl8AcYxA36IokVmiov3/3l8Tgedi3oR63xb7iN7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j3gbwJ+C2QByDn89f3DQSaYxrJJarb/F52w8hzQPSzjKqoU2ZWWFQXGUGJ134tPls
	 4feh15jiH6RPpZ0GYJHrb8LqYdKSxOZAgOflx9YDmfBxOvxEGkFsFh4DyCEwmbzoqz
	 aFQ/z1ENqnYKoGrsRwPHmr0vGYoGxdH6jRdzWX5UGV7889bJj86Jmqe2nrWtUPy3Nj
	 zRv8E3Ogs95Lkjch0w80t3ksvAZU2fXpmDT0hFfWHCtbljixxFBZVaxKcZ6tqV9Hsb
	 9JiXMJ0e6PQtUl029WhJUaqHXKNFt39Fr2eIzY9cie3Qln1pxGCo42ZcqyUirXBQai
	 xaZG6RrrqheEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 09/10] net: airoha: Introduce WAN device
 flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519-airoha-eth-multi-serdes-v8-9-6bd70e329df6@kernel.org>
References: <20260519-airoha-eth-multi-serdes-v8-9-6bd70e329df6@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 08:59:33 +0000
Message-Id: <20260520085933.C009F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware CPU port mapping overwrite when multiple devices share a =
GDM port.
- [High] Strict probe-order dependency leads to hardware misconfiguration a=
nd multiple WAN devices.
- [Medium] Global hardware MAC filter overwrite for multiple LAN devices.
--

commit 8a565b44990bb31355dea04fc03116c38aa783db
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Introduce WAN device flag

This commit introduces a WAN flag to specify if a given device is used to
transmit or receive WAN or LAN traffic. It updates the initialization path
to select the proper QDMA and MAC address registers based on this role.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 15ad5a7edd439..328f94fef2e28 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> +static void airoha_dev_set_qdma(struct airoha_gdm_dev *dev)
>  {
>  	struct airoha_eth *eth =3D dev->eth;
>  	int i;
> =20
>  	/* QDMA0 is used for lan ports while QDMA1 is used for WAN ports */
>  	dev->qdma =3D &eth->qdma[!airoha_is_lan_gdm_dev(dev)];
>  	dev->dev->irq =3D dev->qdma->irq_banks[0].irq;
> +
> +	for (i =3D 0; i < eth->soc->num_ppe; i++)
> +		airoha_ppe_set_cpu_port(dev, i, airoha_get_fe_port(dev));
> +}

If multiple devices share a physical GDM port, and the first initialized
device assumes the WAN role, it will set the hardware per-physical-port
register to route inbound traffic to the WAN QDMA.

If a second device then initializes on the same physical port, it will
default to the LAN role.

Could this second initialization silently overwrite the previous hardware
mapping since the physical port is shared, effectively routing all traffic
to the LAN QDMA and starving the WAN device?

[ ... ]
> +static int airoha_dev_init(struct net_device *netdev)
> +{
> +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	struct airoha_gdm_port *port =3D dev->port;
> =20
>  	switch (port->id) {
>  	case AIROHA_GDM3_IDX:
> +	case AIROHA_GDM4_IDX: {
> +		struct airoha_eth *eth =3D dev->eth;
> =20
> +		/* GDM2 supports a single net_device */
> +		if (eth->ports[1] && eth->ports[1]->devs[0])
> +			break;

Is there a strict probe-order dependency for these interfaces?

If GDM3 or GDM4 is probed before GDM2, eth->ports[1]->devs[0] will be NULL.
This leads GDM3/GDM4 to assume GDM2 is inactive, take the WAN role, and for=
ce
GDM2 into loopback mode.

Later, when GDM2 initializes:

> +	case AIROHA_GDM2_IDX:
> +		/* GDM2 is always used as wan */
> +		dev->flags |=3D AIROHA_PRIV_F_WAN;
>  		break;

It unconditionally assigns itself the WAN role.

Does this probe ordering create multiple WAN devices and leave GDM2's
hardware silently misconfigured since its routing capabilities were disabled
by GDM3's loopback configuration?

>  	default:
>  		break;
>  	}
> =20
> +	airoha_dev_set_qdma(dev);
> +	airoha_set_macaddr(dev, netdev->dev_addr);

When setting the MAC address, airoha_set_macaddr() does the following:

static void airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *addr)
{
	...
	reg =3D airoha_is_lan_gdm_dev(dev) ? REG_FE_LAN_MAC_H : REG_FE_WAN_MAC_H;
	...
	airoha_fe_wr(eth, reg, val);
}

Since REG_FE_LAN_MAC_H is a global forwarding engine register rather than
per-port, will initializing subsequent LAN devices overwrite the hardware
MAC filter configured by the first LAN device?

Might this cause the hardware to drop packets for LAN interfaces that do not
match the single overwritten MAC address?

(Note: This was observed to be fixed later in the series by commit "net:
airoha: Support multiple LAN/WAN interfaces for hw MAC address configuratio=
n",
but is mentioned here as it appears to introduce a regression in this commi=
t.)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-airoha-eth=
-multi-serdes-v8-0-6bd70e329df6@kernel.org?part=3D9
