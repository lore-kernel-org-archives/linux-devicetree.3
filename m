Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59EC41735C
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592040; cv=none; b=GNHGmk43udEYVPR1Zp8J/2q9aC5a9kr/bh0/Jz+k7SdwU/Rn3mtoK7v9PQOMnVMTRAdHKnmU4v638Wd8xYVUZOlMAjxOeXBDHOdAk9Yhy8N8LVuHZcbteiPr4yIdzEHAQ2q56xeGtXLgJ1Y0iF+vrVypkanksNAC1RFMB5xKb/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592040; c=relaxed/simple;
	bh=KgPxKT2QgABqnp56QZOE5wEeGWjmjRIOzFM3BicWxzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lzOfn7f+3qvU9FQDyODCNooJdd2UpfuGSfyLuXZlZ9Gyvl6GOXI+zOTxX/rF2l2uN8XoWgWV71Kl98Lq/U0HsmAg2NjcQ58q5bBsur9fpjoWjIAXUxXIAZ/4VCGYnFJaGTN1TjcB83r4faQ9T4kAYCbFWpArvvHLu3T4YBk6pHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzLOL7gl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzLOL7gl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FA11F000E9;
	Thu,  9 Jul 2026 10:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783592038;
	bh=Lwrr/PxoJl9rMWN56FUgBQFUcxg4zCXPgu5bCoxgWC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lzLOL7glz8OOnkMfmpiGGt2M/q0vRLbWUf07TKya7cfEgxeAkldYZMY2VKBkyNHxw
	 +yWjWEg/J7YX6Xo8soRYT0ruQG02Q2vaK/fQfbr4U/SfbZfUJ1cctqomS+7G9sjt/I
	 GhGPsREYfWCWZ1oMOSIAGWUOZWFaBo7PTfMzJe2SKCRteHD+4qLI89VnaJUBk1ibPy
	 oJxbhQarJDBp7Hsu/zGscXbYTawZOIqRnz0V6qg8e3VnTHDlz5B3jCN246RsiL9VU+
	 zfEbwa9FciGFY2kC0G4RYbecVpl/yxeGdz525tSPuAfDwfO3jReOXp3CdrsJ4rHD6Y
	 PHR1jzweOQqRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/14] device property: Add
 fwnode_graph_get_port_by_id()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709095726.704448-2-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-2-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 10:13:57 +0000
Message-Id: <20260709101358.15FA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] fwnode_graph_get_port_by_id() unexpectedly skips unconnected or di=
sabled ports.
- [Low] Missing `const` qualifier on the `fwnode` parameter in the new fwno=
de graph API.
--

--- Patch [1]: [PATCH v4 01/14] device property: Add fwnode_graph_get_port_=
by_id() ---
commit 4c6b92ebbe0a97ba47216632078d3f24afd73cf4
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_port_by_id()

This commit introduces a helper function, fwnode_graph_get_port_by_id(),
to retrieve a port firmware node matching a given ID. It is intended to=20
be used for cases like USB power sequencing where a reference to the port=20
firmware node is needed.

> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index e08eadd66f4f9..c5e7e00f1b0cd 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
[ ... ]
> @@ -1346,6 +1346,28 @@ int fwnode_graph_parse_endpoint(const struct fwnod=
e_handle *fwnode,
>  }
>  EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
> =20
> +/**
> + * fwnode_graph_get_port_by_id - get the port matching a given id
> + * @fwnode: parent fwnode_handle containing the graph
> + * @id: id of the port
> + *
> + * The caller is responsible for calling fwnode_handle_put() on the retu=
rned
> + * fwnode pointer.
> + *
> + * Return: A 'port' firmware node pointer with refcount incremented.
> + */
> +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *=
fwnode, u32 id)

[Severity: Low]
Should the fwnode parameter have a const qualifier?

fwnode_graph_get_endpoint_by_id() takes a const struct fwnode_handle *, so
there appears to be no technical reason for this function to require a muta=
ble
pointer. Keeping it non-const forces callers holding a const pointer to cast
away constness to use this helper.

> +{
> +	struct fwnode_handle *ep;
> +
> +	ep =3D fwnode_graph_get_endpoint_by_id(fwnode, id, 0, FWNODE_GRAPH_ENDP=
OINT_NEXT);

[Severity: High]
Does this unexpectedly skip unconnected or disabled ports?

Because the FWNODE_GRAPH_DEVICE_DISABLED flag is omitted here,
fwnode_graph_get_endpoint_by_id() will implicitly filter out all endpoints
where fwnode_graph_remote_available() is false. If a local port only contai=
ns
unconnected endpoints or its remote device is disabled, this will incorrect=
ly
return NULL.

Will callers (like the upcoming USB power sequencing) fail to find local po=
rt
firmware nodes if the port happens to be unconnected?

> +	if (!ep)
> +		return NULL;
> +
> +	return fwnode_get_next_parent(ep);
> +}

> diff --git a/include/linux/property.h b/include/linux/property.h
> index 14c304db46648..e04901c0bd8f7 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
[ ... ]
> @@ -505,6 +505,7 @@ int fwnode_get_phy_mode(const struct fwnode_handle *f=
wnode);
> =20
>  void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
> =20
> +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *=
fwnode, u32 id);

[Severity: Low]
Can we also update the exported header prototype to match, propagating the
const qualifier to API consumers?

>  struct fwnode_handle *fwnode_graph_get_next_endpoint(

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709095726.7044=
48-1-wenst@chromium.org?part=3D1
