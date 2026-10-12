Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082D542901F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 19:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832039; cv=none; b=oZ8kUViEuvHeRH/O3DgvjNBbCgNxtQGi3Eio/iKKvgJY1ibhM6C1PRq10IwdL6ZxIQfm3O6xc8g4DdsFlm4ijJLh1LT5JsKcgyQyX4amRi5bUD6Vwe2iT2wkugltQmu76zUrZoiBlRoJAEzgSMOe2/2GDNwvmSb3NOPJCHk4BjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832039; c=relaxed/simple;
	bh=O98A5cTxwYmwGv7+jfYAGpjIoEjLV15jpOLh53l7FbI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aQJ8SeMN0gRHyBUiYPN3BBWWskT8UqAbvVD/t+W0J0/QE+3QKppILAGJPLHw2KUrNB8cmuVGNrdiqseN0nXGbC0uz9eIawiTomZ65x2ZOIpabN49+jDZm0WFgHSheRLsAhawrqE2QUTVRu/pmBRe7mBKuDMvDZcvuYAxaUh85zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtR4Pvj8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtR4Pvj8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8781F0089B;
	Mon, 12 Oct 2026 19:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791832037;
	bh=pM9Q7UdUAYCVdFzONB5CgvuYgUHJfD0Yh3/m72WCERg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HtR4Pvj8CmiZ1EmwQYosbkTqrDWb8figdfU8j+gBLb06ugvW7BuY+mGoS8jKkDE3+
	 sJqf6azKVXm37kXX0VoReunsy9z98Br81xrYZTGAPS7qJYli6eWiOuCwtM9Jy2mQ+b
	 mOVllPytDZmuIHLP3q8GUjWJgXYSRk6Cl1i5d8HCeeKkp6dwr+TtveAPqeBHuRShta
	 PeooKbx2RLWXkdfoOgqPUebGHctR0HwPjxDVv2O0+Z3tna/mstd3Vci/rVCa7urRrf
	 +r9kH3mJDwoHmF0Aiw7F5Uf2XMhzjAGGX0ZyNWadeAw+hlluE1ZhB48Iq9h0Ngr0q5
	 6JNyEgtweOaSA==
Message-ID: <sashiko-outbox-168565@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: introduce
 toshiba,tc9564-msigen.yaml
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261012190245.3988619-2-elder@riscstar.com>
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-2-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 19:07:17 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing mandatory clock and reset properties in req=
uired list
- [Low] dt-bindings: non-existent header includes cause dt_binding_check fa=
ilure
- [Low] dt-bindings: maintainer email addresses mismatch between MAINTAINER=
S and schema
--

commit 8cfa6ac36f149ea1d1b37b717117b76943010968
Author: Alex Elder <elder@riscstar.com>

dt-bindings: interrupt-controller: introduce toshiba,tc9564-msigen.yaml

Define the binding for the MSIGEN interrupt controller present in the
Toshiba TC9564 SoC.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/toshi=
ba,tc9564-msigen.yaml b/Documentation/devicetree/bindings/interrupt-control=
ler/toshiba,tc9564-msigen.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc95=
64-msigen.yaml
[ ... ]
> +title: Toshiba TC9564 MSIGEN Interrupt Controller
> +
> +maintainers:
> +  - Daniel Thompson <daniel@riscstar.com>
> +  - Alex Elder <elder@riscstar.com>

[Severity: Low]
This isn't a bug, but is this email domain mismatch intentional? The
email addresses listed here in the schema use @riscstar.com, but the
MAINTAINERS file entry added in this same patch uses @kernel.org.

This might cause automated tooling to route patch series to incorrect or
duplicate addresses.

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'

[Severity: Medium]
Should clocks and resets be included in this required list? The binding
documentation specifies that each MSIGEN uses a gated clock and reset line.

If they are omitted here, device trees with incomplete hardware configurati=
ons
will silently pass schema validation, potentially leading to driver failures
when attempting to ungate clocks or deassert resets on uninitialized hardwa=
re.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/toshiba,tc9564.h>
> +    #include <dt-bindings/reset/toshiba,tc9564.h>

[Severity: Low]
Does this cause make dt_binding_check to fail? It looks like these header
files are not included in this patch series.

Including headers in the YAML example that do not exist in the source tree
will usually cause the C preprocessor to fail during schema validation
compilation.

[ ... ]
> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
[ ... ]
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
> =20
> +TOSHIBA TC9564 MSIGEN DRIVER
> +M:	Alex Elder <elder@kernel.org>
> +M:	Daniel Thompson <danielt@kernel.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564=
-msigen.yaml
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012190245.3988=
619-1-elder@riscstar.com?part=3D1
