Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4489442A144
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371297; cv=none; b=KDIsIhslO5JcHFbH9WmMjIg9l63gh4pgHFkiJsAuD3XznQxm/HDPRp1o0fvdoZ+nnIV+RADYx7A9GEMHgGhFXIaZY1ABaAOv7JNDdakpvJuDXkrgpGTdBHkkx8IBRBtOGTOTNXO0ug9WRf8YhWGmf0PMAdnjramRYPrfi5zRhR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371297; c=relaxed/simple;
	bh=qzguqpugWmPbHImTnNkd8bj+vMSnd6uJQlGw6rMDH80=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GzZjMhPgi9KgUf3QB9dHSppSB8sujPcXn3rxWfujtLNFITPFl4Bytyl4wa9K70br29b+ycAuyB4HaMSxcJScxVafSSFVSl8fHYc6ZH4JRB+YBr1Ea7g5oojWBEEKCEkkb3YuHQEK3rGLUGVPJZUOhouF2BFgRfP6robrUYLxESQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRU78JXk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRU78JXk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524CE1F0089C;
	Wed,  7 Oct 2026 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371271;
	bh=GIpYlxdL5V7UMOjta0iBaQShw1dmh/lAzog8ArnGm5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PRU78JXkwTd47D2rfcG+DEDQc6I3SqAGM/o7rWY1nCYFhhbxHfKvgeWpi2xLDJHWp
	 Ohmh3DE/84R7IoOW1c6+KGKOSFed5G5MLMRCmxTz1OhJo/X4VQWF6srDRyKqI45CmL
	 +dQzY2/tgZ5CsXa06MinkK01hTAvvGideakWCcSeBS+BetRoWKE+MtUmdD9KIXLSRn
	 TSAMRr5jsncgh9b/cSdWp4JQxG4QqgpYAZ0XxcAstATxXAvLS5oRseX5GFaCL3BTM/
	 hASs4eyBe8oVImTkpWTWzmdim9gslM9vjRX0e3c6bSFUM1wiLHbgcbp9Q2i8mhZG/R
	 X1JSG5g5nhifg==
Message-ID: <sashiko-outbox-162909@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/6] net: xilinx: axienet: Introduce
 axienet_config for MAC-specific ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261006110550.1990213-2-suraj.gupta2@amd.com>
References: <20261006110550.1990213-1-suraj.gupta2@amd.com>
 <20261006110550.1990213-2-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 11:07:50 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: axienet: jumbo capability flag is ignored in MTU configurat=
ion
--

commit 865179930c894853c80ee8475041f18d377414d1
Author: Suraj Gupta <suraj.gupta2@amd.com>

    net: xilinx: axienet: Introduce axienet_config for MAC-specific ops
   =20
    Introduce an axienet_config structure to abstract MAC-type-specific
    operations, preparing the driver for supporting additional MAC types
    beyond the existing 1G Ethernet.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index ae8ed4495ea0e..5af48d5cbed3b 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
[ ... ]
> @@ -711,19 +744,23 @@ static void axienet_dma_stop(struct axienet_local *=
lp)
>   */
>  static int axienet_device_reset(struct net_device *ndev)
>  {
> -	u32 axienet_status;
>  	struct axienet_local *lp =3D netdev_priv(ndev);
>  	int ret;
> =20
> +	if (lp->axienet_config->gt_reset)
> +		lp->axienet_config->gt_reset(lp);
> +
>  	lp->max_frm_size =3D XAE_MAX_VLAN_FRAME_SIZE;
> -	lp->options |=3D XAE_OPTION_VLAN;
> +
> +	if (lp->axienet_config->vlan)
> +		lp->options |=3D XAE_OPTION_VLAN;
>  	lp->options &=3D (~XAE_OPTION_JUMBO);
> =20
>  	if (ndev->mtu > XAE_MTU && ndev->mtu <=3D XAE_JUMBO_MTU) {
>  		lp->max_frm_size =3D ndev->mtu + VLAN_ETH_HLEN +
>  					XAE_TRL_SIZE;
> =20
> -		if (lp->max_frm_size <=3D lp->rxmem)
> +		if (lp->max_frm_size <=3D lp->rxmem && lp->axienet_config->jumbo)
>  			lp->options |=3D XAE_OPTION_JUMBO;
>  	}

[Severity: Medium]
Does this code silently drop large frames if a MAC configuration declares
jumbo =3D false?

Since axienet_probe() unconditionally sets ndev->max_mtu =3D XAE_JUMBO_MTU =
and
axienet_change_mtu() only validates lp->rxmem:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_change_mtu() {
    ...
	if ((new_mtu + VLAN_ETH_HLEN +
		XAE_TRL_SIZE) > lp->rxmem)
		return -EINVAL;

	WRITE_ONCE(ndev->mtu, new_mtu);
    ...
}

The network stack and DMA engine will allow MTUs up to 9000 bytes. However,
when the interface is brought up, axienet_device_reset() will now check
lp->axienet_config->jumbo and refuse to set XAE_OPTION_JUMBO on the hardwar=
e.=20

If an administrator runs `ip link set ethX mtu 9000` on an interface that
does not support jumbo frames, shouldn't axienet_probe() or
axienet_change_mtu() reject the configuration instead of allowing the stack
to send jumbo frames that the hardware will drop?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006110550.1990=
213-1-suraj.gupta2@amd.com?part=3D1
