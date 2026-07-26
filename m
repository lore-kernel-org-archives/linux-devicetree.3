Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3B2308F0A
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785081424; cv=none; b=EO+FIMhEcuaKWFDf+5MvmMY0EosXGsEoKWUGVDX+Ag0XeFtIR9pumj8qx1vbaPqtdXLXFZQvJRKe/JKVSAWlIdrtVNw4Vzuyiktljpl8AAwOiGGDmbsUBKPa5qBWNnositQe7QC2M/fm7TobwbFgLHsxdjQJ/7fNU2o5KZo8PyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785081424; c=relaxed/simple;
	bh=2RHhcvgGnomFV1BBbgn5mU98Aew1ZPUhKAIGJrAbzg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I3ifMP4Dw71qw4JMKVzBBYhshArDnPCQIiT3CZOWJo3cQWt0dO7OpPAAFteZDQm6UDrsm1vmLL1qG5LoYfZmtjWOlMtu6vpkU9w5ztf2AKwB8L+7uW0MyklpL/CVLkrn/qJFlbxwed2IlM4y3jTfye/1zL09NjiHrnH8af1/Y/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUaLstcV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUaLstcV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA55C1F000E9;
	Sun, 26 Jul 2026 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785081423;
	bh=lT22Q0gS2mkuJik8FMarS67j9phgk3KTVUc/9xHFRbI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LUaLstcVnyih4NkLgu5fgeCu3UMl0ePn5cr0yVo1tgYA/mtmwCjXF1ZWoc4+OjVk+
	 S7Bsfkliw3/I/jiHu5GPGZTA2q0ra5IjGNxVdEz/FT3KQRlsW6h79VrflisgqxeiKN
	 b34BjEofaQqXRoTrydDSaGrC/cwSn3JD4163LZaycqFIff6HYTaGZuaw0oeaomNAZz
	 Pqp3MUZ5ubiqY2PM4/3PMr7/9Vt6HVSWgO8RxJ1PvkfXeoqiMEGBWmQGfLjcGzwt+m
	 79luRAVSTmJxdA/9fVZsfwG7ut4zVwKS8N4G8uBTnpcP3HwlHi9znoR3MzzWzVO99Q
	 s3uSZPJhR9egw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-4-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-4-b05b8f897670@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 15:57:01 +0000
Message-Id: <20260726155702.DA55C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Tree hierarchy tracking in `_walk_bodies()` is broken, incorrect=
ly assigning closed sibling nodes as parents to subsequent siblings.
- [Medium] `_property_bucket_root()` collapses standard and vendor properti=
es into a single bucket, breaking canonical property ordering at the root n=
ode.
- [Medium] Top-level addressed nodes are exempted from address sorting but =
are never subjected to the node name sorting claimed in the commit message.
--

--- Patch [4]: [PATCH 4/9] dtc: dt-check-style: Handle sorting of top-level=
 nodes and properties ---
commit d752014f34dc3d4a2a9f9617748ec741da0cb1c5
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Handle sorting of top-level nodes and properties

This commit updates the DTS styling rules for top-level nodes and propertie=
s.
It skips unit-address sorting for root nodes since they mix unit and non-un=
it
addresses. It also adds a special case for the 'model' property to sort bef=
ore
'compatible' at the root node.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 1937c6feb57ec..db4451e30dfbc 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style

[ ... ]

> @@ -496,15 +497,21 @@ def _walk_bodies(lines):
>      in the input. Skips ref-nodes (&label) since those don't have an
>      intrinsic ordering."""
>      body_stack =3D [[]]
> +    node_stack =3D [[]]
> +    parent_dl =3D None
>      for dl in lines:
>          if dl.linetype =3D=3D LineType.NODE_OPEN:
> +            dl.parent =3D parent_dl
> +            node_stack.append(dl)
>              body_stack[-1].append(dl)
>              body_stack.append([])
> +            parent_dl =3D dl
>              continue
>          if dl.linetype =3D=3D LineType.NODE_CLOSE:
>              if len(body_stack) <=3D 1:
>                  # Unbalanced; ignore to avoid crashing on malformed input
>                  continue
> +            parent_dl =3D node_stack.pop()

[Severity: Medium]
Does this pop the node that just closed instead of the actual parent?

When node_stack.pop() is called here, it returns the node that just closed
because that was the last one appended. Does this cause subsequent siblings
to incorrectly inherit their preceding closed sibling as their parent inste=
ad
of the actual parent, corrupting the tree state for checks?

[ ... ]

> @@ -525,12 +532,18 @@ def _natural_sort_key(s):
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
> +            if c.parent and c.parent.is_root:
> +                # Top-level does not use unit address sorting usually
> +                continue

[Severity: Medium]
The commit message mentions that the top-level part usually chooses sorting
by node name, not the unit address. However, looking at
check_child_name_order() elsewhere in the file, it unconditionally skips
nodes with a unit address:

    if c.node_addr is not None:
        continue

By skipping addressed nodes here in check_child_address_order() and not
updating check_child_name_order() to handle them, are top-level addressed
nodes now completely excluded from any ordering enforcement?

[ ... ]

> @@ -597,6 +610,22 @@ def _property_bucket(name):
>      return (5 if ',' in stripped else 4, None)
> =20
> =20
> +def _property_bucket_root(name):
> +    """Return the canonical bucket index for a property:
> +       0 model (for root nodes only)
> +       1 compatible
> +    Plus a sub-key inside the bucket for fixed slots (device_type, compa=
tible,
> +    reg, reg-names, ranges, status). 'standard' and 'vendor' return None=
 for
> +    the sub-key, signalling that the within-bucket key is computed by
> +    the pairing rules."""
> +    stripped =3D name.lstrip('#')
> +    if name =3D=3D 'model':
> +        return (0, 0)
> +    if name =3D=3D 'compatible':
> +        return (1, 0)
> +    return (2, None)

[Severity: Medium]
Does returning (2, None) here for all unhandled properties override the
standard bucketing rules for the root node?

The original _property_bucket() sorts properties into buckets (like 4 for
standard and 5 for vendor). Because this hardcodes (2, None) for everything
else, standard and vendor properties at the root node might now be grouped
together and sorted alphabetically against each other, overriding the stand=
ard
before vendor rule.

Is this the intended behavior?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-n-dts-styl=
e-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com?part=3D4
