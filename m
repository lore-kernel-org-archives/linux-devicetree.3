Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BEB480321
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932474; cv=none; b=D5APWPr2hsLy7LCVqDq2P1rvgUuIUKo5gciKSWJEBvC0kJkTmBTSQfVzi4YEjLh4OeKg1G6fEQMLeWv5pabMo6CMDrvf0mFpfEBF+DVPPggR4lXPItOXTT0D50+QSrjvL8AVOFq70FAgoJWbUePZcy0xdvhLTv7JFlL7VZhX2Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932474; c=relaxed/simple;
	bh=mQGEE5uoW5muh2aeWyrIJCtNORRMtrVhHqhZPU4ZbQ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QwFV1UKyg97DgBRK8rHXex3o9veMmJ9jl1JhIc/awkSFyEuhb5dL+pb9ngXmkHXQEe3lqv0a4Y7stBr5wR2i+CdFJog7+o+UZOn79FoYguIEwUd32Vd/iE1F52nOloSTC3c4Wpfhu6ogHhfO2Psx316MZqoGGdaWN2Sxq+ffZW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8n8wKw4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8n8wKw4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF8C1F00899;
	Fri,  2 Oct 2026 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932472;
	bh=OSBoHocnBC7myWVejLPUwgE7NV/ossFNA54QDtemtQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l8n8wKw4597q1TjsaQ7qmyaHEywChrZy5/v5KTHHZrisnptTt7UHdJ6Zvz9eoY2+a
	 C0Z/a5FSXyNqjjEl8XDsrLkFEi74q0KaSDtowot6T8gdo/5RARH/S0AcT+YTjISjlE
	 VLtVv1Y22Lg9jEisjCI+FeohdOxCW39LUIH1aRT9K87xI/EYlaJ6PqMKkcZBFoBEkI
	 +6QiBFibS2abRkcQLzOJGycujEvH0mECfISOpNtCuzrYyxwEv3JMxwRfvG0A60uY2t
	 sPm05KeFpd3iNuU8E9OzDck/BK3ADewC7cvx6CQGnATqXoGMx4eolu4jVJYNL142v7
	 dEdfKDW5bNt1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: keystone: ti,sci: Correct reg and
 mboxes constraints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:32 +0000
Message-Id: <20261002091432.8FF8C1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing minItems allows incomplete mboxes array
--

commit 344119f20b7b40eacf80223cff1d1579d7303039
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: arm: keystone: ti,sci: Correct reg and mboxes constraints

This commit replaces minItems constraints with maxItems constraints for the
reg and mboxes properties. It intends to enforce an upper bound on these
lists while assuming the lower bound remains intact.

>     minItems does not impose any limit on actual maximum number of items =
in
>     a list, thus it needs maxItems.  maxItems on the other hand does imply
>     minItems.  Add missing upper bound on 'reg' and 'mboxes'.

[Severity: Medium]
Is the statement that maxItems implies minItems accurate for values greater
than 1?

In JSON Schema and dt-schema, omitting minItems on an array defaults to
minItems: 1, regardless of the maxItems value.

> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b=
/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> index 25a2b42105e54..052e23966a8f1 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
[ ... ]
> @@ -59,7 +59,7 @@ properties:
>        - const: tx
> =20
>    mboxes:
> -    minItems: 2
> +    maxItems: 2

[Severity: Medium]
Does removing minItems: 2 here incorrectly allow partial configurations?

A device tree providing only a single mailbox will pass schema validation
since the default minItems is 1, even though exactly two mailboxes (rx and
tx) are required by the hardware and the mbox-names constraint.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002063011.3897=
2-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
