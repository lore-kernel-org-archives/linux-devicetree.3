Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7CE2E8897
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781499488; cv=none; b=tg4h4rfh34qH1w+GxVHDohoDy+NEJ7oQWm2xX+TI4xtUvPzk0Lwb0vj6/0TnnDrVKMXp979t+09Czd4Qp1R8z4m31xVYNErfs0YpFzDz5DJsqgZzPKkFEqxoaqlN7X4BE0V/P72EsAeuPkAIpIl07qPJ8YxzdO6zyMw5qIl3qDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781499488; c=relaxed/simple;
	bh=RqZrBng44QO1HTOGY9i/iWEPQAth3JTRAs+CfjZ+RBE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ifwynoELxhQytRANGDwDiLu32MxxdeBAp9nih4Yluxm5BkcNKZS3MvifgPyvSWf5Y2YNGi7BgkpXT495VsDRoBg0nhNrcFL3JaciHu0sqrtrKq3QTd3b8J5deTTDEDYhfpsiunrw/uG06Wy8lDQINXTvP4Lf6zLxzcpCcIBtPTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLz96fqi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLz96fqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D911F00A3E;
	Mon, 15 Jun 2026 04:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781499487;
	bh=NdHCxWqApL5myy1CcWFI1JM9OAFsIN20PZto3UvUxeU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KLz96fqi1RYbGbWiuX4Pr7sOLAbBhQyK5czAPn1E+1A+48v5rJi3uCR0J8LioWhx5
	 LUE/pIE9veAnYDNUNs2NWOOGRDB6EyOQ1YAcrBhwzPosGnz7phnto/ijrE2+SAZ678
	 SBYFqAMIx2bw/uo3elB5fIkBxGQI8NIAD7ES3nqVZ+iT10NRo4yTWYOD7l1KmOHw6Y
	 daFYqXvfmZWCd41/wOtyNQbrI33egrcAVEpQTBq+tdcv6XXG8TqqrXGfLVjl4UYN4e
	 Uq2XxxV7cLAlVDpXOS4cwkzf/55TqR9bFznWOZEDj2ILaWjhuJBC98ywhlUXtxwNi0
	 auyixHsq1LpXQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next 3/7] arm64: dts: airoha: add EN7581 SOE
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260614040032.1567994-4-hurryman2212@gmail.com>
References: <20260614040032.1567994-4-hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 04:58:06 +0000
Message-Id: <20260615045807.17D911F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Dereferencing `x->xso.dev` without a NULL check in `xfrm_output` c=
an lead to a kernel panic.
--

commit c38a10fca161e28cf54507d8d670ee75e47687df
Author: Jihong Min <hurryman2212@gmail.com>

xfrm: allow packet offload drivers to own transmit

This commit adds an optional xdo_dev_packet_xmit() callback for packet
offload drivers. It allows devices to perform driver-specific transmit
preparation instead of continuing through the regular XFRM output path.
Drivers implementing this callback will consume the skb and return the
final transmit status.

> diff --git a/net/xfrm/xfrm_output.c b/net/xfrm/xfrm_output.c
> index cc35c2fcbbe09..9f11559b02210 100644
> --- a/net/xfrm/xfrm_output.c
> +++ b/net/xfrm/xfrm_output.c
> @@ -770,6 +770,17 @@ int xfrm_output(struct sock *sk, struct sk_buff *skb)
>  	}
> =20
>  	if (x->xso.type =3D=3D XFRM_DEV_OFFLOAD_PACKET) {
> +#ifdef CONFIG_XFRM_OFFLOAD
> +		const struct xfrmdev_ops *ops;
> +#endif
> +
> +#ifdef CONFIG_XFRM_OFFLOAD
> +		ops =3D x->xso.dev->xfrmdev_ops;

[Severity: High]
Is it possible for x->xso.dev to be NULL here?

During device unregistration, xfrm_dev_state_free() clears xso->dev to NULL
(via WRITE_ONCE) before updating xso->type to XFRM_DEV_OFFLOAD_UNSPECIFIED.
Because xfrm_output() processes packets concurrently without locking, could
a data race occur where the transmit path observes xso.type as
XFRM_DEV_OFFLOAD_PACKET but then reads xso.dev as NULL?

If this happens, wouldn't evaluating ops =3D x->xso.dev->xfrmdev_ops cause a
NULL pointer dereference regression?

The adjacent xfrm_dev_offload_ok() function seems to anticipate this
concurrent modification by explicitly checking for a NULL dev. Should a
similar NULL check be added here?

> +		/* Callback validates, consumes skb and returns final TX status. */
> +		if (ops && ops->xdo_dev_packet_xmit)
> +			return ops->xdo_dev_packet_xmit(skb, x);
> +#endif
> +
>  		if (!xfrm_dev_offload_ok(skb, x)) {
>  			XFRM_INC_STATS(net, LINUX_MIB_XFRMOUTERROR);
>  			kfree_skb(skb);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614040032.1567=
994-1-hurryman2212@gmail.com?part=3D3
