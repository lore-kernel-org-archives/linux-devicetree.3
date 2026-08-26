Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1289F3ACA60
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743572; cv=none; b=SV+ydpWTz60P4m0sdKDy0hF6MWSga7s9fzjc5O2n0Yt7VzXv93v8d+AZEgaX7S0GPgo5wH+b3QuGylp2xhYO83KZs4rgsoxCe6mD5Hhn1QgWrQOxboFBDxHdgd+OWAX3X8dCv0fQ/nCtUqSyoX0h/IUgEwxY/CFYu7h0SokGsqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743572; c=relaxed/simple;
	bh=olFGAD9hvPvYc303ebR1kRVcLVO4tWttUfqy/GR4rpY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uX+PJTwRBvSUbku6+O7A1C7BSIJutTH/sjZS7aZRz4ZpAL9WF4xqhkXtpzwmNQ6tNB0NSBdkhJGZJeRR6iXxQ0IMWkrr7dGOc2UGXz7KnOnhaaYA4FxwqZHD6O9YXT3ExCkFLTU8hl//xZ87M+rSLYwkrclfWILQAQy8gS5Hujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVJMqZ/O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVJMqZ/O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9B11F000E9;
	Wed, 26 Aug 2026 11:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787743569;
	bh=0O386E4dvcJKw34tx3NBejH6itchwSNDK3GEDIYzXsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jVJMqZ/OV/opr/nCoNOaZc6siKalE4VVKe5PsLWR1DMHEH2ILDmn7Hzq3rRJLcmCj
	 eroLFk7HawVZPIjJ0x6vmxkhBCUpRfb2mf0J69ShGMj5dayhjaA1HoNK/nEQLv7Zqu
	 C4rGVtnAZpIiqOawqFoC+wRCN+A7u6VRmAKvJXbtQYhYPgbU25PZwgddimjwAyLTqX
	 vWfmLJiBssq3HvSg/WYURU0ULw7+FKxA0YUOGUJR0qTNbuvDOIrciYxcLLa5PiAmUr
	 zOOCulIWnFC0O7QDG5LxEYF7ZfBL3aT4FAQnnj/PYvoykFCi47Anh3SiV2iwdMlUol
	 69h8wBPibvaNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/10] dtc: dt-check-style: Handle sorting of
 top-level nodes and properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-1-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v6-1-f270b1e81f8e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 11:26:08 +0000
Message-Id: <20260826112609.3F9B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] _walk_bodies() fails to handle multiple node closures on a singl=
e line, corrupting the newly introduced node_stack and parent_dl state.
- [Low] Docstring for newly added _property_bucket_root() incorrectly claim=
s 'device_type' is handled as a fixed slot.
--

commit dea26c9e2060b5f6b3d2cee7709c46d776cd4022
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Handle sorting of top-level nodes and properties
   =20
Top-level DTS (but not example in the bindings) has only two nodes with
unit-addresses: memory@ and soc@.  There are two special cases here, in
terms of coding style.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 96deffc0d8a7c..5a9985baa0517 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
[ ... ]
> @@ -491,16 +496,24 @@ def _walk_bodies(lines):
>      """Yield lists of immediate-child NODE_OPEN lines for each node body
>      in the input. Skips ref-nodes (&label) since those don't have an
>      intrinsic ordering."""
> +    # Array of stacked nodes (parent/child)
>      body_stack =3D [[]]
> +    # Current stack of nodes, purely to track parent relationship for ea=
ch node
> +    node_stack =3D []
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
> +            parent_dl =3D node_stack.pop().parent
>              yield body_stack.pop()
>              continue

[Severity: Medium]
Does _walk_bodies() correctly handle multiple node closures on a single lin=
e?

If a line contains multiple closures (such as }; };), it appears this block=
 pops
node_stack exactly once per NODE_CLOSE line, regardless of dl.closures. This
under-pops the stack and permanently corrupts parent_dl. The newly introduc=
ed
c.parent.is_root evaluation will then be incorrect for subsequent nodes,
leading to false style warnings.

>      while body_stack:
[ ... ]
> @@ -591,6 +614,30 @@ def _property_bucket(name):
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

[Severity: Low]
Is this docstring accurate regarding device_type?

The comment incorrectly lists device_type as a fixed slot for root nodes,
which contradicts the actual code in the function below since it does not c=
heck
for or handle device_type.

> +    if name =3D=3D 'model':
> +        return (0, 0)
> +    if name =3D=3D 'compatible':
> +        return (1, 0)
> +    if name =3D=3D 'reg':
> +        return (2, 0)
> +    if name =3D=3D 'reg-names':
> +        return (2, 1)
> +    if name =3D=3D 'ranges':
> +        return (3, 0)
> +    if name =3D=3D 'status':
> +        return (6, 0)
> +    return (5 if ',' in stripped else 4, None)
> +
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-n-dts-styl=
e-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com?part=3D1
