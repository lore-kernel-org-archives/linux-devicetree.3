Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A86442B21
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252177; cv=none; b=Fmtarhm2MShCY/ojO61x1tmjcQuodJcj/PyTwx5L0TS4ffSbyu5nXpu64XJOakRwKRFP3m5GXnNE6gktTwXFcvfVJfElmFgNBGb2Snct22FIReXdP81Sj1CQLQDB/WIrNxfD8nbzyVF16SIvAC2fRGODTlRH6kXCYAeKe/AsB/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252177; c=relaxed/simple;
	bh=G10iwlVBWBpNF3+q6AtE1Hmnnl6am8jQYkgG07XXKYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UPjqLCPhtXhT+N/Ch8sTkUzenMkr8DpDQldzzOdyzDHiG0JEGg70w1h3UUs5jRrPxbig7UzKg2JukAmq2pqOisSk/lB8CxOzxTlwecerDlHD0jxRrSMb0WjeWMZd1hjmjKdrpQmsrtwAf/EXzqsjzDWxzZkYQ4FKBStDne1XI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyoHdmOg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyoHdmOg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3751F000FF;
	Thu, 24 Sep 2026 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252175;
	bh=hJMWGBTahF6tYTgqEhjsCVZiMDCmk5yb0xI9b7TJGjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PyoHdmOgIuJxAG0vylDUvBCNJwcVyjsCfM0+3DT5L+76uRbE67Ex+xaODm3PtD1FK
	 xUA9i0zz90Kx9C84o5l99+EeDNF3ufMZJreQW826PAR6jS1AGjcsDk2Ogf7w6Xynu9
	 xD3H5HnxPdp+xgG3MRon42givu6u915pVmVB3Vv9NKeqkoEkSZ6R34Rdzn135MeXgH
	 AF0Z0NAylt4uR4kW6mXWe73/cFnVTCy6Md/l8MwG6XurqOMluGAmxxlY134TIG4Xnq
	 5O/nmDCL5pW3/Vjls54SyiasghyYfD9pXxOxOIBdO9CgJKIif8c97wDkklHR7rY9XG
	 btJsyr7xYXSFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/9] dt-bindings: media: snps,dw-hdmi-rx: add a port
 for a bridge in front
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924-hdmirx-media-v2-3-c12f641d8b0f@pengutronix.de>
References: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
 <20260924-hdmirx-media-v2-3-c12f641d8b0f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 12:16:14 +0000
Message-Id: <20260924121615.3B3751F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: snps,dw-hdmi-rx: oneOf prevents valid port+gpio top=
ologies
--

commit 5a7ff8edccb5f40d2e32f33eaa88727a0083785a
Author: Sascha Hauer <s.hauer@pengutronix.de>

dt-bindings: media: snps,dw-hdmi-rx: add a port for a bridge in front

This commit describes the OF graph port for connecting an HDMI bridge in
front of the receiver. It enforces a mutually exclusive constraint where a=
=20
board must provide exactly one of hpd-gpios or port.

> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml=
 b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> index b7f6c87d0e06a..896f8ffbb5bf9 100644
> --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
[ ... ]
> @@ -88,7 +100,12 @@ required:
>    - power-domains
>    - resets
>    - pinctrl-0
> -  - hpd-gpios
> +
> +oneOf:
> +  - required:
> +      - hpd-gpios
> +  - required:
> +      - port

[Severity: Medium]
Does this strict XOR constraint break validation for boards that need to de=
fine
both properties?

A board might route high-speed video through an upstream bridge (which requ=
ires
the port) while still wiring the HDMI +5V detect line directly to an SoC GP=
IO
(which requires hpd-gpios). Similarly, standard DT architecture for direct =
HDMI
connections encourages explicit hdmi-connector nodes linked via the port, w=
hich
would also necessitate retaining hpd-gpios on the controller for 5V sensing.

Although the driver implementation might gracefully handle both properties =
being
present simultaneously, this schema constraint forbids valid hardware topol=
ogies
from passing dt_binding_check. Would it be more appropriate to use anyOf he=
re
to allow one or both properties?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-hdmirx-med=
ia-v2-0-c12f641d8b0f@pengutronix.de?part=3D3
