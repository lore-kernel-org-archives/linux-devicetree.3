Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B761D351C34
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275351; cv=none; b=s4cf2q+5IXWr57jByg4A5Aao1PP12PcowMVDMyJxjNM8/hGX03amD2eArCpJz6UDfQqNuL4qXiMhMbhID3Su1WHWCKdCrO+667bcDIGkZZ3rVV2rrV4b5vp1bzBuaS04eYM0X8rSQxRYmtVWdD8EdmWx8gCAlg5LQxs4CM4FDmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275351; c=relaxed/simple;
	bh=u0LhgKIvMJ6aE7oAi7vG+GUOX3tZUlNROWfZMmuUUq8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ImiGo+/lPbp/wlpHvPpzsdaoTUiBApX1lmNtvlSzmaQt2xNiz6fM1O2pY15NNFf/zPJFmskN2nC+kBVjgpa9NPOoAKxBc0vJYUYgqa11rUdSz7XVhHtyKXWGnUdu4H39asLAC78Wzuy5GZ3OEm8NdVVeUEkHqFAhDosLbD8B9e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lplP1FXw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lplP1FXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57951F000E9;
	Tue,  1 Sep 2026 15:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788275349;
	bh=tpBeeIhMYyVFChzCzM7eXtVA4yrpXJs9X3WQNA0TQw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lplP1FXwQlZ1X77n9xqGP4OBikuCAZLG5/Rt4gLBfebIUh9/r4ITBwJwZGkBm0HMS
	 iXeoxcp/JMkjJZvfQRDHWR/JzFNqxxXkn7bhVuPPELzc7kKoiAiAJXNpLHnmDyfFRQ
	 Im9mcShDXM/L5F1HzFqc2bwKmT1aFO0wq7vEUJIusa6dloaYk90CVukreCtfWKDKAY
	 yRlpHvMsD6ZnCjh9YlUVkvq28XY073Uj0bh5EkEfrIqbQWzOnJhZwm6DlHJWTveQYo
	 KQxAzyHI19oRGxCGxaRbIKp94qLW9Q17zNABzk6T51u7hoTN0jK55MLe5iRv2Pk9Ue
	 4ejAV96RHTtGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 3/6] net: xilinx: axienet: Add 10G/25G (XXV)
 ethernet support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831150816.1020883-4-suraj.gupta2@amd.com>
References: <20260831150816.1020883-1-suraj.gupta2@amd.com>
 <20260831150816.1020883-4-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:09:08 +0000
Message-Id: <20260901150908.D57951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing mac_link_up callback for XXV MAC causes runtime-switchable=
 speeds and flow control to never be programmed.
- [High] Legacy DMA descriptors and SKBs are leaked if mac_init() fails in =
axienet_device_reset().
- [High] Failure of axienet_xxv_mac_init() is ignored in the DMA error hand=
ler, proceeding with uninitialized hardware state.
--

commit 0e020a3d14a024a203937c2f29cbb4fde9c6c31b
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Add 10G/25G (XXV) ethernet support

This commit adds support for the Xilinx XXV Ethernet IP, introducing a new
axienet_10g25g_config structure and associated callbacks. It also propagates
axienet_device_reset() failures in axienet_open().

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index a4963da53b306..222c82a1de914 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
[ ... ]
> @@ -2818,6 +2819,9 @@ static void axienet_dma_err_handler(struct work_str=
uct *work)
> =20
>  	axienet_dma_start(lp);
> =20
> +	/* This error handler runs only for the legacy embedded-DMA (1G) path,
> +	 * whose mac_init() cannot fail, so its return value is not checked.
> +	 */
>  	lp->axienet_config->mac_init(ndev);

[Severity: High]
If the XXV MAC falls back to legacy DMA due to a missing device tree proper=
ty,
couldn't this error handler run for the XXV MAC as well?

If axienet_xxv_mac_init() fails here (e.g., from a timeout), does the driver
proceed to configure hardware options and re-enable packet reception on an
uninitialized or failed MAC?

[ ... ]
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c b/drivers/n=
et/ethernet/xilinx/xilinx_axienet_xxv.c
> new file mode 100644
> index 0000000000000..46b48a773c15a
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
[ ... ]
> +static int axienet_xxv_mac_init(struct net_device *ndev)
> +{
> +	struct axienet_local *lp =3D netdev_priv(ndev);
> +	int ret;
> +
> +	ret =3D axienet_xxv_poll_link_ready(ndev);
> +	if (ret)
> +		return ret;

[Severity: High]
If this function returns an error, are the legacy DMA descriptors leaked?

Looking at axienet_device_reset(), which calls this function when using
legacy DMA:

axienet_device_reset()
    ...
    if (!lp->use_dmaengine) {
        ret =3D axienet_dma_bd_init(ndev);
        if (ret)
            return ret;
    }
    ...
    ret =3D lp->axienet_config->mac_init(ndev);
    if (ret)
        return ret;

When mac_init() fails, it returns early without calling
axienet_dma_bd_release(ndev). Can this cause a memory leak of the TX/RX
rings and their associated SKBs?

[ ... ]
> +const struct axienet_config axienet_10g25g_config =3D {
> +	.sw_padding =3D true,
> +	.internal_pcs =3D true,
> +	.regs_n =3D XXV_REGS_N,
> +	.clk_init =3D axienet_10g25g_clk_init,
> +	.setoptions =3D axienet_xxv_setoptions,
> +	.probe_init =3D axienet_xxv_probe_init,
> +	.gt_reset =3D axienet_xxv_gt_reset,
> +	.mac_init =3D axienet_xxv_mac_init,
> +	.get_regs =3D axienet_xxv_get_regs,
> +	.phylink_set_caps =3D axienet_xxv_phylink_set_capabilities,
> +	.pcs_ops =3D &axienet_xxv_pcs_ops,
> +};

[Severity: High]
Since axienet_xxv_phylink_set_capabilities() advertises runtime-switchable
speeds (10G and 25G), shouldn't there be a mac_link_up callback here to
program the negotiated speed and pause settings to the hardware?

Without a mac_link_up callback, when phylink resolves to a non-default speed
or enables pause frames, will the hardware remain unconfigured, potentially
causing the datapath to silently fail?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831150816.1020=
883-1-suraj.gupta2@amd.com?part=3D3
