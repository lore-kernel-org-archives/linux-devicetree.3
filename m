Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541D4390205
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748690; cv=none; b=nFPMp0OS9lPspc56EAGOTwK/M7307cqVp+ogxkqztwGtKhL9EUdEhpbJQv+Zv33Aqo/Yi/1GY/M76IQ08PBw6T4aY3QBzsEKJD+GYC5aezVRNHuKE4krRhnQYI9JAhsj+Z/MOqrwFXzA9dipeFZDuOkwhRzJPOh+uP5V9r52ipU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748690; c=relaxed/simple;
	bh=w0oyrGQ8DPR4YFpVBoePLo0Kl5qJMS2LqyPs4NVNxKc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pdZzOcSu8nDqoeyJbbHl8CZlbeQp0edgbowhHjzKPNJ3iXpew6Gu1IUlELEFSL8Br/XvH8/KbL1vuehIp/2rl35PaHLhFEwjrZVOsE0fAQcg8wLnmr2KW3gs6Bf/VVn/tuiCyIgdaRqjuBfEn1XMzQhPTapYPcQl7VM3COn/xFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBYwPDZy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBYwPDZy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C0C1F000E9;
	Mon,  3 Aug 2026 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785748688;
	bh=BYSXwRhM7yAE+zoOhKQuI4jlX86oFrfRz8eKRWP2kSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WBYwPDZyVtSfeeM4KTxeRD0vZVc3Dcp3cMEBYRF/MBOdG5jsxjWH792Ssbna1mc73
	 5VYUIecJPbK2YwlBCkxfR9TDG9CYlu1KBWNfssNqlN9o24rpAvXnp2H0XwAQuibHnQ
	 IGi/3sPONCB4UJ3MeKhf0kKymz7g7v6gDPe4vJVn7yjOIrR2mv6H9B53gIUT+bSVkR
	 kxUrrMEdR9fng56+5G988xReAMGw2dKPKcedGvqpKcAqWi29iCIbpizsZwUJtme5Ie
	 MFF5LZBGq/+pguiDaQJQdfuqgV0F7KuB84DyRgsp0d8b3xyw4LG+G4609gX6xVkO/q
	 rk2zu7LiygFVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/11] dtc: dt-check-style: Handle root node in
 overlays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-3-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-3-6c9776928cea@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 09:18:07 +0000
Message-Id: <20260803091808.99C0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch fails to address the issue claimed in the commit messa=
ge, introduces dead logic for overlay root nodes, and causes a regression f=
or standard unspaced root nodes.
--

--- Patch [3]: [PATCH v3 03/11] dtc: dt-check-style: Handle root node in ov=
erlays ---
commit 099936d5537a0ed41e9b6886979ab1b9de2421d1
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Handle root node in overlays

This patch aims to handle root nodes in overlays correctly by detecting
them and storing an is_root attribute in DtsLine, intending to fix false
positives for property order.

> This fixes false positives for property order for root nodes in overlays.

[Severity: Medium]
Does this patch actually update check_property_order()?=20

The diff modifies check_child_name_order() instead, leaving the
check_property_order() function completely unchanged.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 96deffc0d8a7c..d9f76d6d9179e 100755
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
> +            if code =3D=3D '&{/} {' or re.search(r'^/\s+\{$', code):
> +                is_root =3D True
> +            dl =3D DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str=
, code, is_root=3Dis_root)

[Severity: Medium]
Will this regex handle standard unspaced root nodes like "/{"?

The regex pattern ^/\s+\{$ strictly requires whitespace. Valid unspaced
root nodes or labelled root nodes might bypass this logic and incorrectly
evaluate to is_root =3D False.

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
Is the c.is_root check reachable for overlay root nodes?

Overlay root nodes like "&{/} {" typically have c.node_name as None. Since
the check for c.node_name is None happens just before c.is_root, the loop
will already continue and the c.is_root check becomes dead code for them.

Also, since standard root nodes ("/") were previously skipped by the removed
c.node_name in (None, '/') check, and unspaced root nodes bypass the is_root
regex above, will they now be incorrectly subjected to the child-name
sorting logic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-n-dts-styl=
e-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com?part=3D3
