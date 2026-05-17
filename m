Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A14C314A98
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 05:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997496; cv=none; b=uCfQie1RcCfXVAbz5pn+5MND2/Ol8xdb8tKmSi5JvTkWpxhlJ9WwfBnxM60fpGj9T7gWhRK480FUbMbwN4XbQ6YUdJssg+1IK7xnJM9KG7TDiPMOKFXP30tnMlDkKXq1z6RDqvbotd1+fmyg9GLmF3uhlpe3LERttbt1rnhwvXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997496; c=relaxed/simple;
	bh=eVDIf8kWLfkN5tByiqmh9nB1Pro87tdRZ6oSMEYIChU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lJJ4xN+HHOReMkDv3yklYWwuskwdZMCHZlWaBvPrjxmT24Gi003vQSUPsftV7mYADfV/gEF5qEVKbxYVUZm2lSVCm+WTEfMreVbd84CscXDbludHK/Xz5i5Co2rDRYTczNoEJ+Bjbs8BYyiS5qHqr+RLyhzEL7/g1CAx1d2J6rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nw9jDAkE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nw9jDAkE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B7CC2BCB0;
	Sun, 17 May 2026 05:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778997496;
	bh=eVDIf8kWLfkN5tByiqmh9nB1Pro87tdRZ6oSMEYIChU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nw9jDAkE1fY2GtL9LW/UgVNWBM4r8AgRh1Mu7Uvsx0WekPoo+F5l2jf184fbNRC+S
	 BfP3LTq+E3UxFxIRoQvNNUAiGverPGBMQbOlZyA2sgSgOjm3u2uqgQAoFAutdcz7MU
	 IyIb3pnlUGybzfl8jH8PoxE7lEzupVBi/lwio0b7gO7VY2vTpayBsp66mWFq3xR4qf
	 vJFlJAh1SAdHKh00VTcby358kgLGJgXfvL5hWywfhXa9B/HkNveFE6JoFR+AA1a9mM
	 TnTpWE4tEMYz29ZdJ5+Rdc3tS17VV100b35HYMa6LIzzZl7z4nv80ABt/r6ahdZiiP
	 23HFYMcWJJgwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 10/10] net: airoha: Support multiple LAN/WAN
 interfaces for hw MAC address configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260516-airoha-eth-multi-serdes-v7-10-99e0093303e2@kernel.org>
References: <20260516-airoha-eth-multi-serdes-v7-10-99e0093303e2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 05:58:15 +0000
Message-Id: <20260517055815.89B7CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Device probe fails when multiple LAN/WAN interfaces are assigned r=
andomly generated MAC addresses.
--

commit 7861c44e7e1da4203e80f67d02418deac7e491b4
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Support multiple LAN/WAN interfaces for hw MAC address configu=
ration

This commit extends the hardware MAC address configuration logic in the air=
oha
driver to support multiple LAN or WAN interfaces by deriving minimum and
maximum values for the lower MAC bytes, while expecting the upper MAC bytes=
 to
be shared.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -71,20 +71,69 @@ static void airoha_qdma_irq_disable(struct airoha_irq=
_bank *irq_bank,
>  	airoha_qdma_set_irqmask(irq_bank, index, mask, 0);
>  }
> =20
> -static void airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *add=
r)
> +static int airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *addr)
>  {
> +	u8 ref_addr[ETH_ALEN] __aligned(2);
>  	struct airoha_eth *eth =3D dev->eth;

[ ... ]

> +			netdev =3D iter_dev->dev;
> +			if (netdev->reg_state !=3D NETREG_REGISTERED)
> +				continue;
> +
> +			ether_addr_copy(ref_addr, netdev->dev_addr);
> +			val =3D (netdev->dev_addr[3] << 16) |
> +			      (netdev->dev_addr[4] << 8) | netdev->dev_addr[5];
> +			if (val < lmin)
> +				lmin =3D val;
> +			if (val > lmax)
> +				lmax =3D val;
> +		}
> +	}
> +
> +	if (!is_zero_ether_addr(ref_addr) && memcmp(ref_addr, addr, 3)) {

If the device tree lacks a MAC address for an interface and the driver assi=
gns
a random one via eth_hw_addr_random(), will this comparison fail during dev=
ice
probe?

Since eth_hw_addr_random() generates independent random bytes for each
interface, the upper 3 bytes will likely mismatch. This returns -EINVAL and
propagates up to register_netdev(), which causes the driver probe to abort.

Prior to this patch, the hardware MAC register was overwritten with the new=
est
interface's MAC, but the probe continued successfully. Can this be adjusted=
 to
handle randomly generated MAC addresses without aborting the probe?

> +		/* According to the HW design, hw mac address MS bits
> +		 * must be the same for each net_device with the same
> +		 * LAN/WAN configuration.
> +		 */
> +		netdev_err(dev->dev, "wrong mac addr for shared GDM port\n");
> +		return -EINVAL;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-airoha-eth=
-multi-serdes-v7-0-99e0093303e2@kernel.org?part=3D10
