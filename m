Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F8A2609DC
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157414; cv=none; b=f3PryTLd48yB4v5SAI/uNIhM4KIjPdq3JEVsuNFI8+gsW302uL9wPNhfP7FP4PIbOrUU171P9eqXQ2JQESl3mkBng/oWiBd+lrwRFwMl3ZPcq14fjHXXod29e4gmrBJXLO3bRp4qiLCELO0HBxRIykPWhtZyq4+Yde1i4Pm3Y50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157414; c=relaxed/simple;
	bh=jSJYTK7k8MlxR6xBeqW3W5ffXizSrgszPYbEXtNlUYo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XkkFh3J3djJB3zvYBk2D+vajCo75cnOVn8zuNgWxXO7oEdqbEay2L/9quPu7D91EXLfYCQJDUVODiyzvKzeUbE6NU6mnjaDIAnNPxExQarCKUhea9BcAv6izz6vQ63pCgJ/W/1cru48vtKI9/KMm90TY56w0I0Q0O072aSV1eCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl0ZIXcy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl0ZIXcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35742C2BCB7;
	Tue, 19 May 2026 02:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779157414;
	bh=jSJYTK7k8MlxR6xBeqW3W5ffXizSrgszPYbEXtNlUYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Sl0ZIXcy/bFtUEaFOZKjsTZgLh5UNYYgw6/b3JBPuRWv6KVNGIbBc+aQ3+M0xXwUV
	 +PJiyO3RsBa7IHqwznnFowrBpl2gW7+dn8533QcOVqBmnf7lmcGWYKwU1s6pBcBsO3
	 G7m6ME9ptIiTWpYdOtuWI8qAjspAsUdglxlHvuZf+CViI0zR5Nqo7aV0xLSyDpqPUf
	 +h7V9T06m+9jhvySUAFG9Lha62+tmW4CbkLlG/Ts9jUgKrXowIHB8NO4AuvJUyqYZI
	 7Z/SRD/55wATKxmsyX0R8lZDt6qcCWhkT0YuA7AbxkhCIzl5mXjkrX9Bdu0tHVkz1x
	 sFnPxNl1vQYEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 1/5] dt-bindings: ethernet: eswin: add optional
 TXD and RXD delay register offsets
Reply-To: sashiko-reviews@lists.linux.dev
To: lizhi2@eswincomputing.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518022023.427-1-lizhi2@eswincomputing.com>
References: <20260518022023.427-1-lizhi2@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 02:23:33 +0000
Message-Id: <20260519022334.35742C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `minItems: 4` constraint makes the newly added optional =
cells mandatory, breaking schema backward compatibility.
--

commit 2992483df88af2823c275fc86187f7e38acbee5c
Author: Zhi Li <lizhi2@eswincomputing.com>

dt-bindings: ethernet: eswin: add optional TXD and RXD delay register offse=
ts

This commit documents two optional cells in the eswin,hsp-sp-csr property
for the TXD and RXD delay control register offsets.

> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml=
 b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml

[ ... ]

> @@ -82,6 +91,8 @@ properties:
>            - description: Offset of AXI clock controller Low-Power request
>                           register
>            - description: Offset of register controlling TX/RX clock delay
> +          - description: Optional offset of register controlling TXD del=
ay
> +          - description: Optional offset of register controlling RXD del=
ay

Will this make the two new offsets strictly required instead of optional?

In dt-schema, when an items list defines a tuple, minItems implicitly
defaults to the total number of items in that list. By increasing the list
from 4 to 6 items without adding a minItems: 4 constraint to the inner items
list, won't validation now strictly require exactly 6 items?

Could this cause dt_binding_check to fail for existing device trees that
correctly specify only the original 4 elements?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518021919.404-=
1-lizhi2@eswincomputing.com?part=3D1
