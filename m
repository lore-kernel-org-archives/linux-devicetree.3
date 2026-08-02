Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F96393DD3
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785661321; cv=none; b=k8d44VtZI3sKs+jtRU/ayXLAKEPow11kM9eTIwDEew7Iy9DJsSX7sQL7HTn3jPejN6R0gaMxSY0Fo8lCSxyKwACwVKbeSX0+cdye7/lKZQ4O3Fn/b+q4mRciAaGzJOuob+KEzgntbVEPtSjymSEHARGm4NsfqZJaoJQMsSrS064=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785661321; c=relaxed/simple;
	bh=LFX01ZtAqSm6YCDxL41Ks2gYGXlisObYpBuINTd8a7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VHbCK3eeNCm5NfvUsxoUfFYo17V7Ea4uxyJ5TEiGKPiSzQ+muoH4KqEmxNZwRCp1KOzW3Vf6eHt/N9Va+hiafE4V1XGBFCv8qZEEcc5xNz4SMIRoYe+UbZdvKkQzKqWkmV/otc0WrDqne/GUVZ7VpeVxFksbi83nMxqrsZar7jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwLQkd/j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwLQkd/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577821F00AC4;
	Sun,  2 Aug 2026 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785661318;
	bh=TeNtbvUik9ttgb2OKuMvgl1z8wEzncYH22FkoJpH6s4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HwLQkd/j2vCazuFEiplDAiVlEx1cmXmP2vudC7yYZqoM3Ab/qbUf6d/U7C7iIGUuX
	 +fR0KElG+c404gMRhxxcngSzczWCc1TGYurlHOSjPBx9Rvwm+FVrHMju9UMHlIfX1I
	 2fb6y+YTAc6Rij55VackjwnVyFNfv4URiOYCkEdTcJ3WynBigJUDwPEIFdYchBraHB
	 5kNDdyVe3qgpwv8pEcigp1vp+2TrRU1TTsAmIN0+Zo9fuxPDL/GrKMpvwY/Uvss/gN
	 lYnJo69gN8hQ8o6BdpqYpbZa7lnOQMNuEUWbTYcPyWCVzbrr3Sct1PPT0OR9N9gmlK
	 ajcNRXHmD9Lcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] dtc: dt-check-style: Handle root node in
 overlays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-3-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-3-6c5dbd1ccfe4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 09:01:57 +0000
Message-Id: <20260802090158.577821F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch has a meaningful code and commit message mismatch and =
introduces flawed parsing logic. It claims to fix property order checks for=
 root nodes in overlays, but only modifies child name ordering logic. Furth=
ermore, the new string-matching logic for `is_root` is brittle (causing val=
id root nodes with labels or extra spaces to bypass exclusion logic) and co=
mpletely redundant for its intended target `&{/} {`.
--

--- Patch [3]: [PATCH v2 03/11] dtc: dt-check-style: Handle root node in ov=
erlays ---
commit caf9c0103adaa0c528c36d5ac2f2a91738b7dbea
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Handle root node in overlays

Detection of overriding/extending a root node is updated to check for
expected syntax before creating DtsLine and store it as an 'is_root'
attribute to fix false positives for root nodes in overlays.

> This fixes false positives for property order for root nodes in overlays.

[Severity: Medium]
The commit message mentions fixing "property order", but the code modifies
check_child_name_order(). Is this a typo in the commit message, or was
check_property_order() intended to be modified instead?

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 96deffc0d8a7c..1937c6feb57ec 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
[ ... ]
> @@ -228,7 +229,10 @@ def classify_lines(text):
>              continue
> =20
>          if code.endswith('{'):
> -            dl =3D DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str=
, code)
> +            is_root =3D False
> +            if code =3D=3D '&{/} {' or code =3D=3D '/ {':
> +                is_root =3D True

[Severity: Medium]
Can this strict string comparison fail for valid root nodes?

For example, if a root node has a label like "label: / {" or contains extra
spaces like "/  {", is_root would evaluate to False. Since
"c.node_name in (None, '/')" is removed later in the patch, would these
valid nodes bypass the exclusion logic and be improperly evaluated for
child name ordering?

> +            dl =3D DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str=
, code, is_root=3Dis_root)
>              parse_node_header(dl)
>              out.append(dl)
>              depth +=3D 1
[ ... ]
> @@ -550,7 +554,9 @@ def check_child_name_order(ctx):
>          for c in children:
>              if c.node_addr is not None:
>                  continue
> -            if c.node_name in (None, '/'):
> +            if c.node_name is None:
> +                continue
> +            if c.is_root:
>                  continue

[Severity: Medium]
Is the c.is_root check redundant for "&{/} {" nodes?

Because "&{/} {" fails to match the regular expression in parse_node_header=
(),
its node_name evaluates to None. This means it would already be skipped by
the preceding "if c.node_name is None: continue" check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-n-dts-styl=
e-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com?part=3D3
