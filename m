Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F9B3749F4
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883695; cv=none; b=sWWeMWtoG+sHfms+3iOYaXkAuDdl4L3z2j53u4v5s/gf1S92pBnFndNIPDvYAnWNs0VeJGc497HrHbNXSFHVEm1O6xvWXNjiqRoUmZyB/UBGQn3avLFbGb/ww6tcDiuq0paEPPcX3Sc0PjtunxZfpcKsRz9n9adjZFrPVemfTBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883695; c=relaxed/simple;
	bh=H7a+3Qnb7aPt0Y2sIt6vK3LVzkR9fArbeHLklJzAzLs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rUv4V2dXRJ3zaM8PVr623Dfdc/VcYYAzFSDuXMJZxP9lGtEYAGCHOZtxclv93H8vDBpMQldDka7OIRVQqdsk6+vUH9L7oRRTlaF8mo/Ex1JUV8h+GDvwWK+Jfs+c0ePX5qf6WFH4FCV9JUX8/kyspD5wIyDv9H3f5ed2J/ILYuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XR1r35v9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XR1r35v9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EF21F000E9;
	Fri, 24 Jul 2026 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883693;
	bh=Z3+MyhEnY92gf/923pkJh45FTeqmmj89d4rkSzvoXw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XR1r35v9+Sv6YRpyDhWc4hlJqWFz5MOMFYzIuRahJK+9s3gYFvDfqGfQrVcYi4m92
	 rPIrF+tX55o3zSo7WeHQdPAPZmRpD1eeumaRlXpNC/Oq0uB3iKdU+cEBSguBQvAL/f
	 8M+9/6KPhB4NvaZTMej69m33wcjJsJejtnTxNwHDO01jJdbN8QAIHRycoUwNLwzeEU
	 WMp8cjtXT48R8SPG8Znlobe24has6yyCV80pVB3nmezxAuM2HA+EcLupuOjhUXY68B
	 S/ycJ07g+aAb4u/oBPLe8SC3HX20Cyhn6BjFW7sRJ0NW3oa8yI5p67/8n9LoUR6dQb
	 M8IRqin+m8wyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/16] device property: Add
 fwnode_graph_get_port_by_id()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724084328.3943997-2-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
 <20260724084328.3943997-2-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 09:01:32 +0000
Message-Id: <20260724090133.33EF21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] fwnode_graph_get_port_by_id() silently fails to find port nodes th=
at do not contain any endpoints, breaking parity with of_graph_get_port_by_=
id() and limiting its intended use case.
--

--- Patch [1]: [PATCH v7 01/16] device property: Add fwnode_graph_get_port_=
by_id() ---
commit d1b7173e906ae494c3f7042d2841d794c9508816
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_port_by_id()

This commit introduces a helper to retrieve a port firmware node by its ID.
It is intended to support USB power sequencing by allowing drivers to get
references to port nodes that might describe power topology.

> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index e08eadd66f4f9..0bd45f8b01c14 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c

[ ... ]

> +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *=
fwnode,
> +						  u32 id,
> +						  unsigned long flags)
> +{
> +	struct fwnode_handle *ep;
> +
> +	ep =3D fwnode_graph_get_endpoint_by_id(fwnode, id, 0,
> +					     flags | FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return NULL;

[Severity: High]
Will this silently fail to find valid port nodes if they don't contain any
endpoints?

The underlying graph iteration (e.g. of_graph_get_next_endpoint())
intentionally skips port nodes that do not contain any endpoint subnodes.
If a device has a port subnode used solely for power topology (like a
vbus-supply property) without any endpoints, fwnode_graph_get_endpoint_by_i=
d()
would return NULL here.

Does this limit the intended use case for USB power sequencing, where ports
might only contain power properties but no endpoints, and break parity with
of_graph_get_port_by_id()?

> +
> +	return fwnode_get_next_parent(ep);
> +}
> +EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724084328.3943=
997-1-wenst@chromium.org?part=3D1
