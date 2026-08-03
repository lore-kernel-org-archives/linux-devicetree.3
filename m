Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7142820A9
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762659; cv=none; b=RxQlBh1dcomBFraisYygn12fhv4fPs1oUYVIZVgtBDxJePX89vHXpA59T9Vfpn2IrZ+tWOV5F4MhBcu7f5M87PXS51GYKvYGtHw1kAaA4nXffnsjvf2Qf+/OMWClUQMwDc1ATU/ibGZ4BVfBtnLSX4tFr3k56Xt+RQccRrmCTj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762659; c=relaxed/simple;
	bh=c53MOl6d95U90T4J4lVgCX+zUwFh/76GZxWSc6ZXM/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sP6amPWnflB91uS/5mfpaH4poskh+d8JUCk2sP0S8Xw9okwnfspOb3javAVHiSQsFJNdqfdwsZQcEBweJ0SpXtvrjU2p3KSTqEsyaZgJ5rc2zb8ssdgqwT4/cfAqURhzjyVx67XhA9FEiEk7V76m7ckeFttPUD6NoAeSAjq/3Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrzWH9Sa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrzWH9Sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D331F00A3A;
	Mon,  3 Aug 2026 13:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762655;
	bh=0SFcPfjM7Sz2V2FENc/OwISg52Fzaom780WtIuymEMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrzWH9SayH1WyM/EbWvoXIiGW4QpMMu3TO9HbxBVyhF8aUUqhlHqSpbpaTNGrrzGU
	 2n9Mdix4/NikMyBiSXx/5tf+zv1sEgTfPzSpQ8it0mjoRBKyfI3Tuvs48ryRBcbxC+
	 BA/TX3P8kB7RBzneJ8laTKJ2agGwrFqPDqE3yhE56ivXnFZYRet6kXG2lRrRiIpoLb
	 ivRns5Kqa2H6Phg1Vv7cotghKMhriw76yBG2iMZoxQLXwm0vcWnziKgYrjNToftXcT
	 Y1jGzc9pDVHLY3jdxAPgf+lij7tGVcXu3s9HXYtichlOSfueebMT2uRfbugnpZpnXz
	 L94+0gu6zw6FA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: spmi: apple,spmi: Add t603x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-t603x-spmi-v3-1-c17b506d91a1@chaosmail.tech>
References: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
 <20260803-t603x-spmi-v3-1-c17b506d91a1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 13:10:54 +0000
Message-Id: <20260803131055.00D331F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] New provider capabilities (`interrupt-controller` and `#interrup=
t-cells`) are added without proper requirements or dependencies, and the ex=
ample is not updated, violating subsystem guidelines.
--

--- Patch [1]: [PATCH v3 1/6] dt-bindings: spmi: apple,spmi: Add t603x ---
commit 93ff9762b75f8c79f11e2bf64785642aca6a9d56
Author: Sasha Finkelstein <k@chaosmail.tech>

dt-bindings: spmi: apple,spmi: Add t603x

Add t603x compatibles, interrupt support, and support for SPMI
controllers that are not always-on. The interrupt-controller property
is kept optional since it is only needed on a subset of the controllers.

> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c317..fceed47b2cd17 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml

[ ... ]

> @@ -34,6 +37,18 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  interrupts:
> +    maxItems: 1
> +    description: Optional, operates in polled mode if not present
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2

[Severity: Medium]
Are these new provider capabilities properly enforced?

The guidelines state that when hardware gains new provider capabilities, the
binding must add the corresponding standard properties to the required list.

Since "interrupt-controller" is optional here, incomplete device tree nodes
could silently pass schema validation if they declare "interrupt-controller"
but omit "#interrupt-cells".

Should there be a dependencies block added to ensure "#interrupt-cells" is
present whenever the "interrupt-controller" property is used?

For example:
dependencies:
  interrupt-controller: [ "#interrupt-cells" ]

Also, should the examples section be updated to demonstrate these newly add=
ed
provider capabilities?

> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-t603x-spmi=
-v3-0-c17b506d91a1@chaosmail.tech?part=3D1
