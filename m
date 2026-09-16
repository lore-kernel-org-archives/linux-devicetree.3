Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942C1446BE8
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546484; cv=none; b=qvqsYeK6tMJ5dWdkf5IXaxEJcOcExy0OKkgX8NjMo74KI/YhVuWUMSLnAqwHLwAbQM2XfCpSzZVM6ub0vgFGGMidjP2w2BXRbTxG5FRov/VWmj0qOOi6WwvDdglGJYTkyPZK2I4WahGTaBe11Y46JndIFPTE3RaSQE7lNKBi7kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546484; c=relaxed/simple;
	bh=P1akWZinLpyk6RdPnirnaLa9ARItnOyx/IiIj49huAM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T2RGS5fanA96P8+6Z17ZItsR4AO5NZoRQY1eD4VkHlD/jyjBfwgiLNOmbDt21D+WnJFP0aIfaG4dNpIMXrlSD3Beq49CoC8Q+qarwrbdtMgvJS29Q5hmak9AcfcEykY0aAvTwy/NX90CVjek6vYIDFK8L0RcFyLRhN2hpYq4G4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHy1/y7r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHy1/y7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613E21F000FF;
	Wed, 16 Sep 2026 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789546469;
	bh=7ADB53KB05W7z/fEi1znq4S7Vh4jMAXf2dSI0QuKPoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FHy1/y7rkBi9zr6f8LjEJwYbxoE3T2mOBISHUs/PQxufl9ygkkRE4hXM8fq3OSZ0Y
	 HtRaZO8xj5kjN2xHf2na4iGpiL6bKmBHMyIvWlceeEgxrc02/XJmUV3CwGjNevzJQL
	 VxRmzKM4hkJQStdcdSsP2kOSXxCfKp6l9DEzKg0FzZ6QW1cgrMxahTMJS45Tw0Q4eL
	 nWu9IQLZt0SoQ7L9SPu1Eb31JKw0AqX6K3ja4AeIu63mrkP1VDi10VU9sLfpzkvGDf
	 QO78TOoRp0kYZPgnJaCHIUfBVZXwucqjg049sSV3rQtgWBVIzy5Wu0NlEmULFJJncd
	 FE11lRswCTPCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 02/15] device property: Add
 fwnode_graph_get_next_port_endpoint()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916075745.3549953-3-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
 <20260916075745.3549953-3-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:14:28 +0000
Message-Id: <20260916081429.613E21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] property: hardcoded endpoint name breaks ACPI graph resolution
--

commit 700ad916c7891ffdfc3636d38b9674d27e6c2c87
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_next_port_endpoint()

This commit introduces fwnode_graph_get_next_port_endpoint() to find endpoi=
nt
nodes under a given port firmware node. It iterates through the children of
the port node and returns the first one matching the name "endpoint" to
support checking graph connections.

> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 576488c151810..cf874b8cbe3de 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c

[ ... ]

> +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct f=
wnode_handle *port,
> +							  struct fwnode_handle *prev)
> +{
> +	do {
> +		prev =3D fwnode_get_next_child_node(port, prev);
> +		if (fwnode_name_eq(prev, "endpoint"))
> +			break;

[Severity: High]
Does this strict string matching break ACPI graph resolution?

When an ACPI platform uses graph bindings, endpoints are typically named
EPXY (e.g., EP00) rather than "endpoint". They are identified by the
endpoint property instead, as supported in is_acpi_graph_node() and ACPI
DSD documentation.

Because fwnode_graph_get_next_port_endpoint() strictly checks the node name
string with fwnode_name_eq(), it will skip these valid ACPI nodes.

Could this result in silently missing graph connections on ACPI platforms
and functionality loss during device probe?

> +	} while (prev);
> +
> +	return prev;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916075745.3549=
953-1-wenst@chromium.org?part=3D2
