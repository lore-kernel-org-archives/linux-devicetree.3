Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4032379EE7
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512061; cv=none; b=CCPtnzJoqvqbPiNrAZxSmV3BURywoEbUAOHQ0HfvSZFhnKBHSXm3r7K/q5E7v5UXbU9Dd5oNXguwXD9K9v0fNauEIp/D2VisCcNZzzCJ9rvfX+rlKcFsv9MobLLjPCG/FXq7EQ+Vk+Kxy6uywwyRimPk6dcOTAfJOefRLd+jidA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512061; c=relaxed/simple;
	bh=5SCSd7x+We0gPmCh5vPGr8MtPmRv3VsNX2TxPnogA9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fAuhF7JnW0pP6Y9biHioqbo5lkuHH9FN64vdbHUHM5itmIvzB6cJTAdd4nIf8t33dFXgJV0tPBkZQjfMycBPjJjf0pVU5qPgOjzO+hoiI22cHcXRL0L/HQzBqXESaTNmnJ7yia5HvP6grwMG/e+uMBnclJTD3DIaDTfqAmOVgUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhEjTEHH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhEjTEHH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7DD1F00A3D;
	Fri,  4 Sep 2026 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788512059;
	bh=E7nlKHiK0mtjaNr0x2+hV5zuCX8IXTtYH4wACTkltmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GhEjTEHHLZw61yfcmlmEk8Zn6pB2AOPxnLpOMVIP5pfr3377pCWPFLN2eso8ZEoZz
	 ijPyHdLn4oVV5P8wXfG/6COuQafPMAbt+yslCrpL+JeX9jLsLfrpv6NxkwfTeUuBLU
	 8nCCMInOcUcAeTdT9ccbuAsB2iKH073eSmKzzcPIpHV+MeslyR2MI9z78SCOuWoY8b
	 GBPgkXtKmcXh4UEsPjMOpEl3VvgrggDR9gtGoUMimbdhd1FVxFs7hDWggkj4iO8/re
	 GuTFVKsqexVkOIOSppqHfybPQfuB8IZVZlcPmyiznpIqLuJKk4wrYKCAnlEuw5EshD
	 7e5S3sIL97cNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 01/16] device property: Add
 fwnode_graph_get_port_by_id()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904084158.1341550-2-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-2-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 08:54:18 +0000
Message-Id: <20260904085419.2F7DD1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `fwnode_graph_get_port_by_id()` API takes a non-con=
st `struct fwnode_handle *fwnode` parameter, which is inconsistent with sim=
ilar API functions.
--

commit 5894c0b778c62e34e52132ac30ee27b4741eb588
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_port_by_id()

This commit adds the fwnode_graph_get_port_by_id() helper to obtain a
reference to a specific port firmware node by ID. This helper is intended f=
or
cases such as USB power sequencing integration where a USB hub port is tied=
 to
its corresponding port firmware node.

> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index b136c339ddae7..68108805482de 100644
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
Does this function signature intentionally drop the const qualifier for the
fwnode parameter?=20

This is inconsistent with similar API functions like
fwnode_graph_get_endpoint_by_id() which take a const struct fwnode_handle *.
Callers holding a const struct fwnode_handle * cannot use this helper witho=
ut
an explicit cast that discards the const qualifier, which reduces API
ergonomics.

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
> +
>  const void *device_get_match_data(const struct device *dev)
>  {
>  	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);

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
Should this declaration also use const struct fwnode_handle * for the fwnode
parameter to match the suggested change above and maintain consistency with
other fwnode_graph_* functions?

>  struct fwnode_handle *fwnode_graph_get_next_endpoint(
>  	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
>  struct fwnode_handle *

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904084158.1341=
550-1-wenst@chromium.org?part=3D1
