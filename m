Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7B445D5E7
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099501; cv=none; b=oSfr7M98wIhWGBSAV3CN/fWF13UB2qyC8LQFhCp8KmJc5u8Li7Ct0tPhGXgpqLg02C/h1+5O491BMaxCw9re6NSLBKoVtK4QZ43IT1auN1g4B4aUtdR0fQxcs8hKPBAFzHqHkYCJbHzAC2GK3Lnhhq1zK5cp/At7oJAZGUA72JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099501; c=relaxed/simple;
	bh=8o7nq1tF3zXUjyCWw+pOPmKGL+OhqLV/Jm+DNH2TZXk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oQQt1ZJtlUoEMiA1092kGS412UOtuGBi/enmk84XOBLGpODvyo9cRNHeS6riFCgZgEu2KEaWlUkawW5VGwrHvTTqApABt6lk1XZyWldHTZibxNZnCfFSIuR3x21bdPVITeDe6Itxi5dOyokLaltEKufdUxzX6rf29H396vv7zz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIlU8ihr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIlU8ihr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3471F00898;
	Tue, 22 Sep 2026 17:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790099499;
	bh=0sCpUgXGYCC5JLlYQG5Eg/tk+qv14Rfsf66NQV5rVHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jIlU8ihr9oKiwoe8hxxcJftDYIX/mEYyTzNBxdD1tTnsOUBA+OeVtQR40woELnaC/
	 1sZawvplSqMm568w2ZLFSlUBuJZvYbed2l2gewyoT8BqEiPd66rImUqpGF9q+UHHC/
	 C9PlLV7OTGA4zthLlxusiXpgdyZ1+zGFQTNij9oQ3GfLVT90Whp1Qla/DcCTS0Js3x
	 PPXvrbLS3ZaDQ0Rgjru60tN+vHKZ5NrgF+x/FfxPL+26sjnbiGbE4nL1sSFvb1xUT6
	 Swx5uyq082GSLQYcBsBt9kssivtldP0EEv9JL8eWeFMILygz3UWxykXx7rGt0luqiQ
	 YM3xOKzppc2aA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 03/10] net: ethernet: ravb: Simplify gPTP
 start and stop
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260921175037.4084310-4-niklas.soderlund+renesas@ragnatech.se>
References: <20260921175037.4084310-1-niklas.soderlund+renesas@ragnatech.se>
 <20260921175037.4084310-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 17:51:39 +0000
Message-Id: <20260922175139.9B3471F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ravb: PTP clock resource leak and Use-After-Free on DMA stop timeo=
ut
- [Medium] ravb: PTP timestamping broken after TX timeout recovery
--

commit bd55489575ec22549ad9bb8e730d4b498b5d08a1
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Simplify gPTP start and stop

This patch reorganizes the initialization and teardown of the gPTP clock
for different device generations. It moves ravb_ptp_init() into
ravb_dmac_init() and ravb_ptp_stop() into ravb_stop_dma() for Gen2 devices.

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index a89f6fe7866fe..42d208e6b8ecd 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[ ... ]
> @@ -1115,6 +1123,10 @@ static int ravb_stop_dma(struct net_device *ndev)
>  			netdev_err(ndev, "failed to stop AXI BUS\n");
>  	}
> =20
> +	/* Stop PTP Clock driver */
> +	if (info->gptp)
> +		ravb_ptp_stop(ndev);
> +

[Severity: High]
If ravb_stop_dma() returns early due to a hardware timeout:

ravb_stop_dma() {
	...
	error =3D ravb_wait(ndev, TCCR, info->tccr_mask, 0);
	if (error)
		return error;
	...
}

This relocated ravb_ptp_stop() call is skipped. Since ravb_close() ignores
failures from ravb_stop_dma() and proceeds to free the device structures,
will this leave the PTP clock device leaked and tied to soon-to-be-freed
memory, potentially causing a use-after-free when the module is removed?

>  	/* Stop AVB-DMAC process */
>  	return ravb_set_opmode(ndev, CCC_OPC_CONFIG);
>  }
[ ... ]
> @@ -2056,10 +2058,6 @@ static void ravb_tx_timeout_work(struct work_struc=
t *work)
>  	ravb_emac_init(ndev);
> =20
>  out:
> -	/* Initialise PTP Clock driver */
> -	if (info->gptp)
> -		ravb_ptp_init(ndev, priv->pdev);
> -
>  	netif_tx_start_all_queues(ndev);
> =20
>  out_unlock:

[Severity: Medium]
When ravb_stop_dma() fails late (for example, if ravb_set_opmode() returns
an error at the end of the function), the PTP clock will have already been
stopped by the new code in ravb_stop_dma() above.

If this happens during ravb_tx_timeout_work(), the code jumps to the 'out'
label to safely resume queues, skipping ravb_dmac_init(). Since
ravb_ptp_init() is now folded inside ravb_dmac_init(), doesn't this leave
the PTP clock permanently disabled and break timestamping until the
interface is manually restarted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921175037.4084=
310-1-niklas.soderlund+renesas@ragnatech.se?part=3D3
