Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFC163B9
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 16:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785081660; cv=none; b=HhoJFdSBpWa9lGa3aB5VMBGQrM2RlXIrOHSFqjmW4lqzgxiPHJcBj8mMF+b37uEnsf+oOX9nGFZLeQX36/I3C8Vc3gD5fLYZfsO+4AmAg8txDahCpSD7by9crqq7CPZ9CFoiXwR9Qe3pzNlgfvhfokBoIVbmPAjKV9Ic7f5uZqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785081660; c=relaxed/simple;
	bh=jg+poG/50hyHrWHQn2BaymzIcLeaCOcsQFkFAMsUA7A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NVvKn1gBoMa9eMJ2FWrtw2erJR3kZN4iRWs111p/hsJ8EdZMeTv7VDmGztGM4bZTslPuRxR4E2psHZjKa5OJ+pg1r+ktwjWh85OJUzszZahjSylOp1Pvc88xO8R6A/kWhTiq5nMPDf+5CJNjNTbrN+S05GNrT0gQLsOIJtRUycQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+cNs737; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+cNs737"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229B71F000E9;
	Sun, 26 Jul 2026 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785081658;
	bh=9acSfg5IcRoKFWyx/SPEqufRcNIlbCe7TVjQCH7L9hU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d+cNs737Ge/uK8JTAAMdw99sEPXngu7SKROXf25JED0iGQp1wFt/jEXOdCXg40zRX
	 D7v57RScb6MswQjgCXgrhcyDYqD3iyL0KGkVVW4xCPmb6pzTHElmUcNbR4qkcKRCHY
	 ENQuh+s2K+DmbLt+PMbIyOsw0ZE/eYXHClQGKc6gOSMo/hLFs6YODfwrPslpDNDC7s
	 FtjbGuV2toLqd0Pm6Qko1XsgvczXy+q0Ve6MsGWtWsQxN8KepL0nh61eBbJnXEDhAf
	 ebGg0YHi7mPW54sQBPQijglHmwZ8hOtHbyxLC9PULksoBY2LfJhX5RwJWGWSVIO6RP
	 MDp9nos8vA0cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/9] dtc: dt-check-style: Handle root node in overlays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-3-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-3-b05b8f897670@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 16:00:57 +0000
Message-Id: <20260726160058.229B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The patch introduces a regression for valid root nodes (e.g., la=
beled or with extra spacing) and fails to change behavior for overlay root =
nodes, rendering the intended fix ineffective and actively harmful.
- [Medium] The patch claims to fix "property order" false positives but exc=
lusively modifies "child name order" logic, leaving property order checking=
 unchanged.
--

--- Patch [3]: [PATCH 3/9] dtc: dt-check-style: Handle root node in overlay=
s ---
commit 3ffd10d90b05e9e479a121a83377b237c94b4b24
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Handle root node in overlays

This patch modifies the device tree style checker to detect root nodes in
overlays by matching specific node open strings. It stores this state in an
is_root attribute and uses it when checking child name order.

> This fixes false positives for property order for root nodes in overlays.

[Severity: Medium]
The commit message states this patch fixes "property order" false
positives, but the code exclusively modifies the child name order logic in
check_child_name_order(). Is check_property_order() supposed to use the new
is_root flag as well?

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
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

[Severity: Medium]
Will this exact string match handle valid alternative spacings or labels?
For example, if the code contains a label like "label: / {" or extra
whitespace like "/  {", it seems this would fail to set is_root to True.

> +                is_root =3D True
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

[Severity: Medium]
Since this replaces the previous check for c.node_name in (None, '/'), could
it cause valid root nodes that were missed by the exact string match in
classify_lines() to incorrectly bypass this skip logic and trigger false
positives?

>                  continue
>              if c.ref_name is not None:
>                  continue

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-n-dts-styl=
e-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com?part=3D3
