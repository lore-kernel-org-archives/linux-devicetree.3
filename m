Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336034;
	b=Hu5tx1eIWkF9PaXu7TnD+E0KQCrLWgcdW902aTviJ4cidUwzQ8uNdVUSW3AUAuL8WP9R
	 7FvvtR3mp/7IIgXSvZKByOSNdrdhZdO5piN5Yx5JO5+rZBgypbnqHpqL+9eVRgoqEUZ3L
	 jSeq3LYvQJBexSjORXmXCYA5jZyXPPxCRgjONjp9QvzkRxVs8v/E5/AXHwHBORIp/uot7
	 KroNsVN0dE6uVdObqNRWHH3ui/siJrhsZVW2zbxPi7rUiQqUFCXjkcfpsuAy+1ITFbDb9
	 GhV8gCSiibNEJe7NyOggts2pmmQGKoceXsiUHfKKH4Nt3m4Ldgq/3CEJTxvbSrjiJRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336034;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LJNM41RxqI19uXIcyZt9enjAQH5mAD7ptgkxJjGh1Q0=;
	b=y+CnclK9O8LaAHljnihXzY85W275vKCN2xpq1ye21BZ5/z3EMOIXkVBOBFKJiC9fs11A
	 qjbSmJtT29bZPCa9W6cyALoBma3xEvGWgHgoprVJsSs9lsgA8hPX3I5VG4QNvFbXC1Eyg
	 pipVxsp27uc7v/oPGD/xaagIkbwuCmltGnP47+bqk/WA6liSriCRJzgrUJM+VtWjTEcOz
	 qR9guS5PiKpg1/KnDgSa51qS++49bH09HJcrY58auXXXpVzaulHjzxMM7raNhC8iVCeCU
	 G+Jmptf1RGlLXgzgN5p7VMuBg6iSQW+EmntmrDuNwj++eaBO9uoamhUeum5mSrjfGlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PDp8MH3V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4375B606A320
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PDp8MH3V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5481F00A02;
	Fri, 30 Oct 2026 04:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336034;
	bh=LJNM41RxqI19uXIcyZt9enjAQH5mAD7ptgkxJjGh1Q0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PDp8MH3VD4juXJgFOueXyhFNvYNLWTUJS10RM8faBANMQiponfrFPce33gvLAcrT0
	 hblVnW9SiCZv+UdmSwHAVdNGFcLIWfM/CrvZvE6vP5Bx4aGLgV+eJky3qXYKBx1s11
	 xFqED94neJeQJusF1Qm++OD+fclxVgxewyCfXaZCl4+mnQX7wVM6V70nmL1whrC1Ms
	 +912HDXFpKp5fHKede7IH2MEKC/msGVGD/ijZUyZtLPK0Ple/ru6qYFAAUDWaCD3/h
	 dLRBo91COjE33dSGnGqHp/+1PkoXa6AHONfwX9GS053FLau2iRj2V/VsSzAPg/Ufx8
	 8SGbNs4lvXryg==
Message-ID: <sashiko-outbox-190367@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 07/10] net: airoha: Support multiple
 net_devices for a single FE GDM port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260507-airoha-eth-multi-serdes-v4-7-af613b61ae02@kernel.org>
References: <20260507-airoha-eth-multi-serdes-v4-7-af613b61ae02@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:53:53 +0000
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
- [High] Use-After-Free during device teardown due to premature of_node_put=
()
--

commit ea0ff36310b26df32f46dcfd6f57d75099f7d6e7
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Support multiple net_devices for a single FE GDM port

This commit introduces support for multiple net_devices connected to the sa=
me
Frame Engine (FE) GDM port via an external hardware arbiter.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 786bc677af3cc..0253919714e0c 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -3188,14 +3257,23 @@ static int airoha_probe(struct platform_device *p=
dev)
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
>  		struct airoha_gdm_port *port =3D eth->ports[i];
> -		struct airoha_gdm_dev *dev;
> +		int j;
> =20
>  		if (!port)
>  			continue;
> =20
> -		dev =3D port->dev;
> -		if (dev && dev->dev->reg_state =3D=3D NETREG_REGISTERED)
> -			unregister_netdev(dev->dev);
> +		for (j =3D 0; j < ARRAY_SIZE(port->devs); j++) {
> +			struct airoha_gdm_dev *dev =3D port->devs[j];
> +			struct net_device *netdev;
> +
> +			if (!dev)
> +				continue;
> +
> +			netdev =3D dev->dev;
> +			of_node_put(netdev->dev.of_node);
> +			if (netdev->reg_state =3D=3D NETREG_REGISTERED)
> +				unregister_netdev(netdev);

Could calling of_node_put() before unregister_netdev() cause a
use-after-free?

When unregister_netdev() is called, it invokes device_del(), which triggers
a KOBJ_REMOVE uevent. The device core then calls of_device_uevent(), which
reads properties from the device's of_node pointer.

If of_node_put() drops the last reference to the node, the memory backing it
might be freed before the uevent is generated. Should of_node_put() be
moved after unregister_netdev() to avoid this?

> +		}
>  		airoha_metadata_dst_free(port);
>  	}
>  	airoha_hw_cleanup(eth);

[ ... ]

> @@ -3216,14 +3294,22 @@ static void airoha_remove(struct platform_device =
*pdev)
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
>  		struct airoha_gdm_port *port =3D eth->ports[i];
> -		struct airoha_gdm_dev *dev;
> +		int j;
> =20
>  		if (!port)
>  			continue;
> =20
> -		dev =3D port->dev;
> -		if (dev)
> -			unregister_netdev(dev->dev);
> +		for (j =3D 0; j < ARRAY_SIZE(port->devs); j++) {
> +			struct airoha_gdm_dev *dev =3D port->devs[j];
> +			struct net_device *netdev;
> +
> +			if (!dev)
> +				continue;
> +
> +			netdev =3D dev->dev;
> +			of_node_put(netdev->dev.of_node);
> +			unregister_netdev(netdev);

Does this run into the same use-after-free issue where the of_node might be
accessed by uevent generation after the reference is dropped?

> +		}
>  		airoha_metadata_dst_free(port);
>  	}
>  	airoha_hw_cleanup(eth);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507-airoha-eth=
-multi-serdes-v4-0-af613b61ae02@kernel.org?part=3D7
