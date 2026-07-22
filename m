Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A5F47011D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719519; cv=none; b=R6CcY9l+5Poiv3cuMr8uin7mpiHXU4Or3GD4d7oRtPuvp+1KNpaf52EqwvRe8jsyLd6MfZvNos1rRU1XSp5IaURj615dJJFpKiwzj5w6af3xkWXwR87P1xU+vgUs/ugUdq0yilllGOFWMe3pnJy95RaVXDXnOLtJc0sSJzNGgRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719519; c=relaxed/simple;
	bh=J4xJSlgwnLJN1D70I+ZJ7/vdM3ekocvgAeE1RMTRu7s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Iq0SxsTaFtdcXN411lRzdqiGTMFPmKA7uorPUfi60gMeYPbGnYtcDgyH0SXqr19949hq9FclwqfIo8/g4kZUHYVawehmd6sgz2sxq1TWbZUa/jD7CDNbwJu9PKGCwSP9eMsxt1l+5Fqz7He9KH7JolYcJxcLxc9ooeQdAJN7v2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkUT0DlI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkUT0DlI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546351F000E9;
	Wed, 22 Jul 2026 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784719516;
	bh=Oio6Yf6Q2cFPaiil7KLuTXrBep1sWwr3+ZhrSacqG4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XkUT0DlIgGLw67RnQEWqqQPYHYPJRv5OgLJhDjMzAJnrpKVshRlJ3Bm9EETeZokmn
	 AhYFbtAp8UCM/fWCW3S//XLVqSrR00fLIC/sVa0hus/ZxOKlJIQWMNcCkkp/pd6iKJ
	 u59AjfZeSLhTDcqX6qA27Y3ZA+1vD1xuTIrfQPTjX1cd2iL2+LxQAd4bNFhL0Luvpr
	 CqiN0BRZrWxowVa8PgmJTnQHdAW5UqIq/kZjTzCZ2YKfWuOVqvILOa4dHJcAvXFfly
	 0PR2DElN4e3E8SX6b6vOERWbheaRc9xyC1a5JHasoErR7B7sK94M4QtOQK1buTJ+dl
	 tMPa9nPdwm36Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260722-upstream-it6625-it6626-v6-1-6117d4d96574@ite.com.tw>
References: <20260722-upstream-it6625-it6626-v6-0-6117d4d96574@ite.com.tw>
 <20260722-upstream-it6625-it6626-v6-1-6117d4d96574@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 11:25:15 +0000
Message-Id: <20260722112516.546351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree binding intentionally omits the HDMI input port,=
 violating the fundamental rule that Device Tree describes the physical har=
dware independent of driver implementation.
--

--- Patch [1]: [PATCH v6 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDM=
I bridge binding ---
commit e9e6db2f5d5e1b4ac21c4df62354e0ec71117d3a
Author: Hermes Wu <Hermes.wu@ite.com.tw>

dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge binding

This commit documents the devicetree binding for the ITE IT6625/IT6626 HDMI
to MIPI CSI-2 bridge. It exposes two selectable CSI-2 output graph ports,
port@0 and port@1.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml =
b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> new file mode 100644
> index 0000000000000..fed732e4428ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
[ ... ]
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 output port MIPI0

[Severity: Medium]
The commit message mentions dropping the HDMI input graph port because the
driver does not use it. Does omitting this input port conflict with the
principle that devicetree schemas should describe the physical hardware
independent of driver implementation?

Because the physical hardware acts as an HDMI bridge, device tree authors
would need a documented port index under properties.ports to accurately link
an upstream HDMI source to the bridge.

Without an explicitly defined input port, will this prevent boards from
accurately describing their video graph topology, potentially leading to
inconsistent or missing routing connections across different devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-upstream-i=
t6625-it6626-v6-0-6117d4d96574@ite.com.tw?part=3D1
