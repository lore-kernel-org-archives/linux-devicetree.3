Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EE9456E10
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546010; cv=none; b=Ixq32GQYGjuEox9z71ByUaRtkoTi9wWYj39ek/pHWScWVfCoYSzJvJSfb3b5DBE+wIKoERXfDAT03pEBpliREVPVoncUnCBLvNPDzGwBQ1kZi726WGzmlnPbJTiT4cL80PGn3dIS8MC7ikG4u+xAvPknhLge3CnLBTUIKxPEVhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546010; c=relaxed/simple;
	bh=ruWmswr0VDlUEWUFgNtku6pTffPKfT1E2bn+Q/sm7XA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BBZoZuYVxQibb23io4R5cRGEBvF41AJVm3bCAdeoOeraM3FEfgwJvyo9vr2eagJGbC4+RFuQ69UN63mdtZvFUGWT/RZ9Xfj810LI8FscMJBQJakIHEj+UuamBW6NDAT7CT3YgHc7yLVWCyh9oYLXWbDnHbNzlYsaxsFD8IsubSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpF+zBHz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpF+zBHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF621F000FF;
	Wed, 16 Sep 2026 08:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789545993;
	bh=m8rkbMQLMPFzDsAtLdzjz3JFT11s1s9gEt1nDdTXFbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mpF+zBHz1ILnbyodx+l2aO7FT/+xIJc/vzeHGCtmX0/exn3beA3XY0YYrf6m34hTx
	 yQk5T3uoZ3uCZ+W1KEcKwgX83cQHZK8QfFZXn+6bHPY9ov+J0S7+0m0lP1omEzDU6w
	 ORoKF6qHgh6fnL/ak3xrNF0qCO1Shu+tqY7x8bJga8xKH2RKn+SIKaDLsXiFQ51Ii3
	 VJg/+t76pu6myjTA5GrcKmbIWPpqPkDAhRby9Mc7kFXKOkcsFqFSEBoMqvT90Of01A
	 gX0xiyEe6PGcLG9IUML02xbRCVZcxmoawLIXlluK+t7jxVpaAwDbUsHD02pPX3ile7
	 mVqjgwzVMoYXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/15] device property: Add
 fwnode_graph_get_port_by_id()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260916075745.3549953-2-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
 <20260916075745.3549953-2-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:06:33 +0000
Message-Id: <20260916080633.9BF621F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] device property: missing const on fwnode in fwnode_graph_get_port_b=
y_id()
--

commit 926d6f7fd488c33560eef4ae4903250ddf63b081
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_port_by_id()

This commit introduces a helper function to retrieve a port firmware node
matching a given ID. It is designed to support upcoming USB power sequencing
integration where a USB hub port is tied to its corresponding firmware node.

> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index cceaa3240ca48..576488c151810 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c

[ ... ]

> @@ -1353,6 +1353,37 @@ int fwnode_graph_parse_endpoint(const struct fwnod=
e_handle *fwnode,
>  }
>  EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
> =20
> +/**
> + * fwnode_graph_get_port_by_id - get the port matching a given id
> + * @fwnode: parent fwnode_handle containing the graph
> + * @id: id of the port
> + * @flags: fwnode lookup flags
> + *
> + * The caller is responsible for calling fwnode_handle_put() on the retu=
rned
> + * fwnode pointer.
> + *
> + * Does not return ports that belong to disabled devices or endpoints th=
at
> + * are unconnected, unless FWNODE_GRAPH_DEVICE_DISABLED is passed in @fl=
ags.
> + *
> + * Does not return ports that have no endpoints.
> + *
> + * Return: A 'port' firmware node pointer with refcount incremented.
> + */
> +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *=
fwnode,
> +						  u32 id,
> +						  unsigned long flags)

[Severity: Low]
Could the fwnode parameter be marked const here?

The fwnode pointer is only passed to fwnode_graph_get_endpoint_by_id(), whi=
ch
already accepts a const struct fwnode_handle pointer. Marking it const here
would improve consistency with the rest of the fwnode graph API and prevent
callers with a const pointer from having to cast it away.

> +{
> +	struct fwnode_handle *ep;
> +
> +	ep =3D fwnode_graph_get_endpoint_by_id(fwnode, id, 0,
> +					     flags | FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return NULL;
> +
> +	return fwnode_get_next_parent(ep);
> +}
> +EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);

[ ... ]

> diff --git a/include/linux/property.h b/include/linux/property.h
> index 907c790a3f013..3dbbd01a52d09 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h

[ ... ]

> @@ -507,6 +507,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *f=
wnode);
> =20
>  void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
> =20
> +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *=
fwnode, u32 id,
> +						  unsigned long flags);

[Severity: Low]
Would it make sense to update this prototype to accept a const struct=20
fwnode_handle if the implementation is adjusted as suggested above?

>  struct fwnode_handle *fwnode_graph_get_next_endpoint(
>  	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
>  struct fwnode_handle *

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916075745.3549=
953-1-wenst@chromium.org?part=3D1
