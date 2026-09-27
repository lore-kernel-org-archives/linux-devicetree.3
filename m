Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CAD20D4FC
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 21:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790545054; cv=none; b=UGwFHyPMd+4hP2k9jNOqxJ+bbYWp6jGJeWBpuhtNuSGejh8Y4fZ6zWxCiAwJBf5PgyMna9qMMOh1TSCms7lYxrEqlmFv9NhBsjzJ1F54CVNvcI2NtAjbJMycZhFTXdxueyzlNMaGGu8iIHqHIkSGBGGw33Kbks0/w+tNKwtv5dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790545054; c=relaxed/simple;
	bh=P4otT7JtH2a/5ZJIQYz9SQUndAX/sDBIuExUN5vq+DE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L9eBPb1WcadwN8bunG8KMB8kgXAsxkJjwYMG1/WsKypuDgWD/ehKYvFWr6aiGbjTcSftkWm9PjPYrcwaTstZzH2C3Phv0XSWrH3g8HBKLNY8TEvJc07+riwLI3CfrHmx/RquZp4uSqei6h1fuZuu0ei6LjmI11sAQM39fo+XKA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdM7g6ha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdM7g6ha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AE41F000FF;
	Sun, 27 Sep 2026 21:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790545053;
	bh=gqPJPPkPDhZZ3JN20oU7c7m/mtwbv9wt5OIxoPWzVZQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HdM7g6ha9KyCijIWgWeJzblKj2pR8qsmD+0vI25ihXImVG+P7mYGR/gWSlasjMyqS
	 P/ZMucsa89pSoYbLPprYchEYTv/2oDgaDlF5qEEfOtoYokDnavep1RGOowUd5ex5AC
	 vvpETthlicZT/slkGweqN2rneNvbWJOlzVMbSr6qPWc6n7JEdRvKt/iavaMP+B7lPq
	 rkrGiaKa6JPaisG0mhsdvYHA5hLrbyZHEdz/Q465I6Q/mANn/eXt8kykKAgvB7lujG
	 nPPJbCjnX2SAegzRePiswgDiQOUcYBVna+qUKl0PzEjH1vrKbJ4AJovztA6Nk9t+gi
	 VRanaQx1HetGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: convert nsp-gpio binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260927212748.123558-1-rosenp@gmail.com>
References: <20260927212748.123558-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 21:37:32 +0000
Message-Id: <20260927213733.24AE41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: pinctrl: brcm,nsp-gpio validation bypass for primitiv=
e properties
--

commit a919d3facb51d5d2222a14b7538f8617f24e8169
Author: Rosen Penev <rosenp@gmail.com>

dt-bindings: pinctrl: convert nsp-gpio binding

Convert the brcm,nsp-gpio.txt legacy text binding to a YAML schema.
Keep existing required and optional properties, including generic pinconf
child nodes, and configure node matching.

> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml=
 b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
> new file mode 100644
> index 0000000000000..e5144da1bf57e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
[ ... ]
> +  '-hog(-[0-9]+)?$':
> +    type: object
> +    required:
> +      - gpio-hog
> +
> +additionalProperties:
> +  anyOf:
> +    - $ref: '#/$defs/nsp-gpio-pinconf'
> +    - not:
> +        type: object

[Severity: High]
Does this anyOf block with "not: type: object" inadvertently allow any
misspelled or undocumented primitive property (such as typos like
gpui-controller) to bypass dt-binding validation?

If a device tree introduces an unknown top-level primitive property
(like a boolean, integer, or array), it will fall through to
additionalProperties. Since its value is a primitive rather than an
object, it will successfully match the "not: type: object" condition.

Can we instead enforce additionalProperties: false or
unevaluatedProperties: false at the top level and explicitly match valid
child nodes using patternProperties to prevent validation bypass?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927212748.1235=
58-1-rosenp@gmail.com?part=3D1
