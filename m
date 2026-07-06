Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C153AB286
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353941; cv=none; b=ozJbyonco9Tiiek4VRFzZ8WHpxTNR9M/uXG44/f0HbY0m6oCFrmXa8Oonxf79uXIXBvAdZdEdnf1IyCRntpK+JmrT9vlUIjPvPIVJAMWxtnw6ujB+rLoARgDmWN4cXwBvRp/Ot4x8PpNBWhEhGs2s7xSH2iEb4EPmzNyK7MJddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353941; c=relaxed/simple;
	bh=zTWAR+Cdhqhlmu97CRG/Pk8g0ERzpYqvgtXxCmUwsHg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X+qJJknDM9usYTGjl2cUfjMf1jEn9+18s/hgiTBrP+2N5eLqNT5U3bYFkV8ZkjK4jVT9epsfwz9l5sgwWzWJvuBkaVVZd+Y2oNPSqLYXIU/AhmG68cvAoiJ+pxC7t3Vv/6sPKCMJxcaJhiHZLQd5xc42J5k6QEapAYPaVGLrvj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPxy9Gy1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPxy9Gy1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032001F000E9;
	Mon,  6 Jul 2026 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353940;
	bh=3xwWhENRMos9Ji2xwlF+9ZwPlDmwdndufmW/L+/skOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TPxy9Gy11XoL2NhOr8FEdFQqzkrdoZPxTpfvepEbDM4+xvj5SeM/VTUJsQC7jY26u
	 2tU9uLVdwcZ6Eu03VIEZ9cPw1LFPQZcYqP5CIgbQsZfwXUyPsg2Vy+N3zHoG7BjvHp
	 UOIZMhOvANVD0epZUoeS0wiZWme1UTXotpc09aPd+GoQjquiq9ZlrIHZDyhtCtczwL
	 +vwk/aveOXO+OgcDDR/Uasjbk83RroIi6TzOYgGnPIZbcbJTa0AxR/1WIwwyiJzTzK
	 1YmHDCwCSrG//zyOEmq3Tdlm/kSypuBhqGBJxpJwD+qobFjuK0oBaqz5gczZWkdoqZ
	 5LfgayuuMlQBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] dtc: dt-check-style: Do not sort top-level nodes
 in DTS by unit address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706-dts-style-checker-v3-5-03ffacff9226@oss.qualcomm.com>
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
 <20260706-dts-style-checker-v3-5-03ffacff9226@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 16:05:39 +0000
Message-Id: <20260706160540.032001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The checker script inadvertently disables unit address sorting v=
alidation for all immediate children of top-level reference nodes.
- [Medium] Top-level nodes with unit addresses are completely excluded from=
 both address-based and name-based sorting checks.
--

commit 52ef4b5728a3b53330c7623fdea74a0e2eddd12d
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Do not sort top-level nodes in DTS by unit address

This commit modifies the dt-check-style script to stop enforcing unit
address sorting for top-level nodes in DTS files. It notes that top-level
nodes with unit addresses are typically sorted by node name instead.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index d9080297bd4db..3c1aa9e28347e 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -515,12 +515,18 @@ def _natural_sort_key(s):
> =20
>  def check_child_address_order(ctx):
>      """Addressed siblings (foo@N) must appear in ascending address
> -    order within their parent node body."""
> +    order within their parent node body.
> +    Exception: Top-level in DTS follows name order, regardless of unit a=
ddress
> +    in memory@N and soc@N nodes
> +    """
>      for children in _walk_bodies(ctx.lines):
>          addressed =3D []
>          for c in children:
>              if c.node_addr is None:
>                  continue
> +            if (ctx.file_type =3D=3D 'dts') and (c.depth < 2):
> +                # Top-level does not use unit address sorting usually
> +                continue

[Severity: Medium]
Does this unintentionally disable address-order validation for the vast
majority of peripheral nodes added in board files?

When using top-level reference nodes (e.g., &i2c0 { sensor@50 { ... }; };)
in a .dts or .dtso file, the lexical depth of &i2c0 is 0. This makes the
depth of sensor@50 equal to 1. Since c.depth < 2 is true here, won't this
skip the unit address validation for all immediate children of top-level
references?

[Severity: Medium]
The commit message states that the DTS usually chooses sorting by node
name for the top-level part. However, does this change leave top-level
nodes with unit addresses completely unvalidated?

Looking at check_child_name_order() elsewhere in this script, it explicitly
skips all nodes with a unit address:

scripts/dtc/dt-check-style:check_child_name_order() {
    for children in _walk_bodies(ctx.lines):
        for c in children:
            if c.node_addr is not None:
                continue
...
}

Since check_child_name_order() bypasses nodes with unit addresses, and
this new logic skips them in check_child_address_order(), will nodes like
memory@0 and soc@0 bypass both sorting checks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-dts-style-=
checker-v3-0-03ffacff9226@oss.qualcomm.com?part=3D5
