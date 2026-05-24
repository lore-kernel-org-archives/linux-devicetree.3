Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7679641C71
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779621797; cv=none; b=k8aVYg6wxwJE7NhxGYTBysahx1IEtZIsgGbcHJd9AORE2G1tcMmfYlexKoMTw3lB77oAoiht4JmKxUrBDaR3Ok9yTZwLaTFQIMWb1AqwJJOfDIMwuBimfiZyMpvVUHXMT2eTnJXURtqnMfiYAvlrcfPVimwnVJ7EdnnGwXGP7J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779621797; c=relaxed/simple;
	bh=1ANa2SDrTg6AAvgWXRK6H+hh7NY5j/3mjejTiJU3T7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kTUybGFVdOziEiaShlP01D5z086idzLtfS2l3HWNvVPBdXXzE7tRW0rP8vB9kXDuNtl/Ev6xFPyP/noyblSAa7T+qwHP26ld6OfRZ9A2z7tfIO84+lWd3JQtEzs3Feg8ykyUzX1sBSJrYZnAkFzCHYmn0sL//E8k4UdT7SHSj7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSXGr7p0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSXGr7p0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB381F000E9;
	Sun, 24 May 2026 11:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779621796;
	bh=3HhraD2oiPXpTEd+8azNzjPfG6Qc6ovkUJsOz/n9pCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OSXGr7p0jep8/2C6eqgSvXbVep6yH808pkDQCViRmkKYntO9ez4fO/4/4UPEDXv2s
	 6bk3cccEps7yB/NYVuL5BZKIsWdTpmdVwNOqOoXDgB2OJtPIoUpuAX6cJS6/p3xRLb
	 8QtJNTD3HFowQiOL+whRcqa8ThSaC+Rc3e3fNyVcnAJSuiR0Bxd1E/G6ieNmcprBtJ
	 3L366phthUCBpEbWcFMmmLIZpfrfRLwHft1ci06zSWbLYQn9fjZfaeKRgRVj0vZHIj
	 e8XbtkF2AhwmhbIcg+Y52kp6vXNVbHpP+f9eGqlkYELcIAQKxSJHkcqTcioJQPEkdT
	 r7S4bl1yhFE0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: vt8500: via,vt8500-pmc: Convert to DT
 Schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260524110047.37590-1-challauday369@gmail.com>
References: <20260524110047.37590-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 11:23:15 +0000
Message-Id: <20260524112316.1AB381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Redefining the standard 'clocks' property as an object violates =
the core DT meta-schema and bypasses child node validation.
--

commit 1dba768055c24a5e16b0109bd342a32c68535b08
Author: Udaya Kiran Challa <challauday369@gmail.com>

dt-bindings: arm: vt8500: via,vt8500-pmc: Convert to DT Schema

This commit converts the VIA/Wondermedia VT8500 Power Management controller
binding from the legacy text format to the new DT schema format.

> diff --git a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.=
yaml b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml
> new file mode 100644
> index 0000000000000..ac603fd4efec9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: via,vt8500-pmc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    type: object
> +    additionalProperties: true

[Severity: Medium]
Does redefining the standard clocks property as an object conflict with the
core DT meta-schema?

The clocks property is globally defined by the core dtschema as an array of
phandles. Defining it here as an object creates a type conflict, which will
cause validation to fail since the schema will require it to be both an
array and an object. Furthermore, using additionalProperties: true disables
schema validation for nested properties and child nodes.

If the intention is to document a legacy child node named clocks, should it
be defined using patternProperties (like "^clocks$") to avoid conflicting
with the standard property definition?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524110047.3759=
0-1-challauday369@gmail.com?part=3D1
