Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB34E4749EF
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114835; cv=none; b=MAnIMa7e3TSQPzXa9ODSAgVqpnc7q2N7rvFv55HikHj3aYJ7jqELVyW83ZQfhSpusx/wGgUomcEu3Dz4+D93zDvLYuEb01mEThAo9/0/Ryx5AaHHfqZ9X8vAySaQpjHQI5evzJSV6EWHtTq8MdHjwpjwkBPlM3uiZRDgIYGegVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114835; c=relaxed/simple;
	bh=7GPZDorauvCEUsZUr5jb3V5yM/l0H7v726T+5TGc8LE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JfelaQn4oyyHGu2fOPakfO0etbDBylU7kDNCdThbJcHaM31T2lFuEh3MM5dzSSqClefvQtXcbIHr9dsuNKXkTDQ97mCvj2r/gQRnyzAXnPU2fjGJWxFnIBePcoJGzwsxNoL2ZdiInRNmYpBFBE92OXOSp/LtljY4qYaHBDAYR1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgzseRrY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgzseRrY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEF61F000E9;
	Fri,  7 Aug 2026 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786114834;
	bh=SkiziUxlx9HPZklliAPOgZcb3FX5h6IDjMZticUmh9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BgzseRrYS+N0pK8pfXZJ5wHjTUQzBLG8kZgX5oVEvz0JSqYwxf6RjX4w5w92ruSgl
	 UYfmYzffIVr805/2UoijdTb8XPsU07XrB3ohLK8oDfaTZO//+RnfRrBTCWauLrfo3i
	 T+GsM5E7f+oNEauQKPPqOPVMnWOkBefHCSMWrI9qIJ2aDp1bTy/8iOi0LZtwS87cl/
	 b8pVMN6ty7nUna8OtuopH2u4kGheolvczTIMcGAsF1r7Ec82asEAyqMbjpmSpu4hCe
	 6ZGF2qn051Z/lDa51MwDjaFPzO0xCY8d6D2l2lFTlI60J7ZTKxdx/F0m/EPO7WvfsX
	 tpxL5nmaUMhiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: net: wiznet,w5100: convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QXJ0aHVyIENyw6lwaW4gTGVibG9uZA==?= <arthur@marmottus.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-wiznet-link-gpio-v3-1-532d4a143805@marmottus.net>
References: <20260806-wiznet-link-gpio-v3-0-532d4a143805@marmottus.net>
 <20260806-wiznet-link-gpio-v3-1-532d4a143805@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 15:00:33 +0000
Message-Id: <20260807150034.4EEF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Preexisting module removal race condition: `unregister_netdev()` i=
s called after `destroy_workqueue()`, leading to potential use-after-free.
- [High] Preexisting probe race condition: `register_netdev()` is called to=
o early, exposing the device to userspace before hardware and structures ar=
e initialized.
--

--- Patch [1]: [PATCH net-next v3 1/3] dt-bindings: net: wiznet,w5100: conv=
ert to DT schema ---
commit 6b1d871923a8b7c229c0db289868ab706e3e28d1
Author: Arthur Cr=C3=A9pin Leblond <arthur@marmottus.net>

dt-bindings: net: wiznet,w5100: convert to DT schema
   =20
Convert the Wiznet w5x00 SPI Ethernet controller binding from
plain text to DT schema.

> diff --git a/Documentation/devicetree/bindings/net/wiznet,w5100.yaml b/Do=
cumentation/devicetree/bindings/net/wiznet,w5100.yaml
> new file mode 100644
> index 0000000000000..641c9ddbde9e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wiznet,w5100.yaml

[ ... ]

While reviewing this dt-bindings change, I noticed a couple of pre-existing
issues in the related driver code (drivers/net/ethernet/wiznet/w5100.c)
that might be worth addressing.

drivers/net/ethernet/wiznet/w5100.c:w5100_probe() {
    ...
	err =3D register_netdev(ndev);
	if (err < 0)
		goto err_register;

	priv->xfer_wq =3D alloc_workqueue("%s", WQ_MEM_RECLAIM | WQ_PERCPU, 0,
					netdev_name(ndev));
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to call
register_netdev() before fully initializing the device?

If userspace automation brings the interface up immediately after
registration, it could trigger a packet transmission. This would call
w5100_start_tx(), which attempts to queue work to priv->xfer_wq.

Since the workqueue and other hardware structures are initialized after
registration, could this result in a NULL pointer dereference?


drivers/net/ethernet/wiznet/w5100.c:w5100_remove() {
    ...
	flush_work(&priv->setrx_work);
	flush_work(&priv->restart_work);
	destroy_workqueue(priv->xfer_wq);

	unregister_netdev(ndev);
    ...
}

[Severity: High]
This is a pre-existing issue, but does destroying the workqueue before
calling unregister_netdev() create a race condition during module removal?

The unregister_netdev() function is responsible for safely stopping the
transmission queue and tearing down device visibility. If the workqueue is
destroyed first, there is a window where the network stack can concurrently
call ndo_start_xmit (w5100_start_tx()).

Can this lead to a use-after-free when w5100_start_tx() attempts to queue
work to the destroyed workqueue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-wiznet-lin=
k-gpio-v3-0-532d4a143805@marmottus.net?part=3D1
