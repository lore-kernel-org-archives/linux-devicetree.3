Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6359A202C48
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781499487; cv=none; b=lmbM8JnVcW9+v0F+3EEE1vMVgx/yV4E5dWjwoXWIcfPdLFnscQYIBdcSfFFjjB6MC2T8EAxzDNQJ3ZoqUGmUm2ml4n6TLne312EGRgvy3kv8Tni/+L/wF31eONgQK/Kb4ETZGecvYgeBpnk7OcizqFg9NAdiWGwCXR538VS7Lqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781499487; c=relaxed/simple;
	bh=FCqRBWGGZdtcrrWW0qj8WOc7Jh8aZWQdBsIBnHG9yiA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SBr/e+rpf9GR1iNRjKPspKpfMDsFG9wcjAeM3PH32ohPGXEmKdo+QExXhb1hx79Dp/Z1UjtlibjhW3RGMjZVO9vxnoajgmFEAfgnM/FqTMti3XlU3R75hE8tqTlcZFz5LYdyJ5ZjpVNH90XLmcA6391Lfc60E6ZONlG/0Su/THg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kriusm5g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kriusm5g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F581F000E9;
	Mon, 15 Jun 2026 04:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781499486;
	bh=Nj8WMQbpBnomUFGDorwqVnnKzotP4CrPaEhTOnSeMbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kriusm5gQWbBvELmpXiU0cy1pWCtKatKX75wvKkoSdVxWkYND++2QbZGhq+YWFUZ2
	 +Kth4FThosqDQeAQJ9S9kwMLfZE/mm8z8C5c/jgNDmJCLqxBTQbBoKqsI9LtV/kYkO
	 MVndHVza880MVRpMyhzP+7LevCPK2tk6JbHNYkJIw73VtweUzEvN+365JYICZPXEOq
	 nE3Z6ECwWI2IgEvj+QHjzjT3J3NUIw+qtJ2nNZHYRJu0xgkjsjumqhy+zw20IBY8SO
	 67EBxo7WSNs5hz7SshboiV4ChvZqAlQKYnnRABUkF93Ab44uzXJNjvg6eDu5oioYXv
	 GX7tRfco2DRcw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next 1/7] xfrm: allow packet offload drivers to
 own transmit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260614040032.1567994-2-hurryman2212@gmail.com>
References: <20260614040032.1567994-2-hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 04:58:05 +0000
Message-Id: <20260615045805.67F581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Bypassing `xfrm_dev_offload_ok()` allows packets to be transmi=
tted without applying mandatory outer IPsec transformations for nested SAs.
- [High] Unchecked dereference of `x->xso.dev` races with asynchronous devi=
ce unregistration, leading to a deterministic kernel panic.
--

commit c38a10fca161e28cf54507d8d670ee75e47687df
Author: Jihong Min <hurryman2212@gmail.com>

xfrm: allow packet offload drivers to own transmit

Packet offload drivers can currently program state and validate whether an
skb can be offloaded, but they cannot take ownership of a packet that needs
driver-specific transmit preparation before the regular XFRM output path
continues. This commit adds an optional xdo_dev_packet_xmit callback for
drivers to consume the skb and return the final transmit status.

[ ... ]

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
Can this dereference of x->xso.dev crash if the device is concurrently
unregistered?

When a device is unregistered, xfrm_dev_state_flush() calls
xfrm_dev_state_free(), which clears x->xso.dev to null before updating
x->xso.type.

If xfrm_output() sees x->xso.type =3D=3D XFRM_DEV_OFFLOAD_PACKET but reads
x->xso.dev after it was cleared, won't this result in a null pointer
dereference for in-flight packets?

> +		/* Callback validates, consumes skb and returns final TX status. */
> +		if (ops && ops->xdo_dev_packet_xmit)
> +			return ops->xdo_dev_packet_xmit(skb, x);

[Severity: Critical]
Does this early return bypass outer IPsec transformations for nested
associations?

By returning early here, the code skips the call to xfrm_dev_offload_ok(),
which performs validation including checking !xdst->child->xfrm. This check
normally ensures there are no nested IPsec transformations pending.

If a packet has nested IPsec associations, such as transport over tunnel,
would the hardware driver transmit the packet out of the physical port
applying only the innermost transformation, leaving the outer transformatio=
ns
completely bypassed?

> +#endif
> +
>  		if (!xfrm_dev_offload_ok(skb, x)) {
>  			XFRM_INC_STATS(net, LINUX_MIB_XFRMOUTERROR);
>  			kfree_skb(skb);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614040032.1567=
994-1-hurryman2212@gmail.com?part=3D1
