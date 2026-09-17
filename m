Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A2453D9FD
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 16:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663267; cv=none; b=qLkp2Ok4X93/QTEQrcxrKQQJEPWHFEsJvqt7zTHPSgu8cgiCrqh8xHdjHENIBSj1SabCPi/8Snqn+bruwzk4NKopL7094QCLKJb1v9Y6WWiQaAfhXsHW7weI8Gq0mdeErJpnztjiAOZ33fQaiZZSzm2SyYCFJxlqGyKIyvws2Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663267; c=relaxed/simple;
	bh=dkxIfvSOpXei6rLHe/512kj1Pgx7kjeyjIJczmiajug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DdhILBWNnm2H/cwi6dkxHHccrTo2S0xyV1vPszbyoP2n4AdUSVICvCmEy1er19Tw6I5GYgmrEcU8W7XFK+5jO6pM3/DwH0kju++9NZWhLGm+7V9CQby9fHZLy3lZoDlxYRxbnkbOzb2M+FITAmh0s97BiSd2r81EvVpzQr36Cjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjXClibt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjXClibt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3EA1F00893;
	Thu, 17 Sep 2026 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789663266;
	bh=xv3REVQsijSXmT85oNFSHU/h4k9lCwacLK1WUX48fN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bjXClibtYrDwAKUWW07dMoFc4m3SsXEy6b3c9IJOnjeKAbCAftEuAp2ckk7kP+2xP
	 hKKSNoywu3+jYOKBUHJZkLw09QIdg6g0kIfbFYdFvKtnliNVaW6bDya/N7kEd9NQ02
	 KgJQ/P/7+1zB1qJt33qStKxuj3on6wnCFdGYiGY6XAcTFDm3+MWHDk3C6v5gzJsqrK
	 T5owxPbMF3cI2SkA49PaS18VBzVxfFjkNh4JCy8X204wv7VfvTK8FWE0DJN9PGVz1n
	 QBMFi+6Ico6xUubkz2t6VQDVnFLAm+A/jIbViTLphmc+9J1way79u/SMiT6zw4Pa+N
	 UIfqQ+tOagaIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add SpacemiT K3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-k3-aclint-v3-3-cf4fd4050e14@pigmoral.tech>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-3-cf4fd4050e14@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 16:41:05 +0000
Message-Id: <20260917164105.DB3EA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing SpacemiT K3 in text description of supported v=
ariants
--

commit e153d8cef506aa80d048bbfcecc93b53a351d62b
Author: Junhui Liu <junhui.liu@pigmoral.tech>

dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3

This commit adds support for the SpacemiT K3 ACLINT SSWI. It updates the
compatible strings list to include spacemit,k3-aclint-sswi.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead=
,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-contro=
ller/thead,c900-aclint-sswi.yaml
> index d02c6886283af..0b34ed5b4639d 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-a=
clint-sswi.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-a=
clint-sswi.yaml
> @@ -24,12 +24,13 @@ description:

[Severity: Low]
Does the text description of supported variants need to be updated to match
the new compatible string?

Looking at the full description block in
Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-ss=
wi.yaml:

  Following variants of the SSWI ACLINT supported, using dedicated
  compatible string
  - THEAD C900
  - MIPS P8700

Should the SpacemiT K3 variant be added to this list so the documentation
stays in sync with the new schema properties?

>  properties:
>    compatible:
>      oneOf:
> +      - enum:
> +          - mips,p8700-aclint-sswi
> +          - spacemit,k3-aclint-sswi

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-k3-aclint-=
v3-0-cf4fd4050e14@pigmoral.tech?part=3D3
