Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8BA47B439
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259161; cv=none; b=qnSw69pCmUiKRqASGi1mE2F89XE1Aq855KlMkh4QTlanaudw4Klbi6Hel5/ZSXZQ6vrlQQQ6GfbO6/x71hRsIhN8M4g6wav8oClf9dgC27Dce1kSf9qGVMRSYXi3qik9dYVRPE6WPKd9iyKP6z60NcslbDgidZSf7QmC3rBkf6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259161; c=relaxed/simple;
	bh=7zdn1fQPtGLSF7YpvC4maGZDzK2TLLvxnEZA9axlyyM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fj0uoDSF+fHXML8cVgWaAbfChpy3C528PvDfAbQ7RbvE98m6EprqHEdbdoGueq4SDHjQSqkcCXrxicSi+mhErOGfv4+sA4QxhorEYGF3IYFYSzMCVz6W4cXokzzDN7utnjz8Ju8lHty6dyBbu4oxLVdDpE9RDZNgQNXdAZi/DIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBT2PFuJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBT2PFuJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B651F000E9;
	Tue,  1 Sep 2026 10:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788259159;
	bh=Fxp6Zw8jgFKlajQKxH0Xo4X3GH47HnBPAj2cIguhcUk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cBT2PFuJOuHEi2KXOwXeyujXN/yEvCPMpfPWqm0JfVk/G4JNC/DB3HMe/t78t1gvL
	 Gsp+jQvNZ6KmXW+A9XBtOGsedrVBP+NlfJNZoYSMgQULANcmnbMSol7dKxIIU6N+bB
	 NUY7wsscRs3NH0is39TeO3ClST9lVEXm+gSW94PJqZvc16nphQ/irN5wNftdbJck9p
	 TffYHth+Q+kymJ9J6ntENHwkAlPsNxZ8azzjFQBKm7DwfHxw38PJpTpoMCqObVB1XK
	 y0UE76UnM81hJbZ3bn4UbDHQfzEAW4iNAfmrEBuBsfkmGvYpBNTKfjtmdCYKkR4x8N
	 U0W4GZhozrd/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/6] dt-bindings: spmi: apple,spmi: Add t603x and
 t8122
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
 <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 10:39:18 +0000
Message-Id: <20260901103918.C2B651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing required `power-domains` property for not-always-on SPMI=
 controllers.
- [Low] Missing example coverage for new interrupt controller capabilities.
--

commit 57c88d4c6dd7d628065665fa42a855aa5ac54ce4
Author: Sasha Finkelstein <k@chaosmail.tech>

dt-bindings: spmi: apple,spmi: Add t603x and t8122

This commit adds the t603x and t8122 compatibles for apple,spmi. It introdu=
ces
interrupt support and support for SPMI controllers that are not always-on.

> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c317..4e73083ecec33 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
[ ... ]
> @@ -34,10 +37,36 @@ properties:
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
> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - apple,t8122-spmi
> +          - apple,t6030-spmi
> +          - apple,t6031-spmi
> +then:
> +  required:
> +    - interrupt-controller
> +    - "#interrupt-cells"
> +    - interrupts

[Severity: Medium]
Looking at this if-then block in Documentation/devicetree/bindings/spmi/app=
le,spmi.yaml,
does it also need to mandate power-domains?

The commit message mentions adding support for SPMI controllers that are
not always-on (corresponding to the newly introduced t6030, t6031, and t812=
2).
For not-always-on hardware to be accessible without triggering a synchronous
external abort (kernel crash) on register read/write, the driver core must
power it on prior to the driver's probe.

This mechanism relies on the power-domains property being present in the
device tree node. Although power-domains is added to the properties list,
omitting it from this required list allows incomplete device trees to silen=
tly
pass schema validation.

> +
>  unevaluatedProperties: false
> =20
>  examples:

[Severity: Low]
Looking at the examples section in Documentation/devicetree/bindings/spmi/a=
pple,spmi.yaml,
does it provide coverage for the new interrupt controller capabilities?

The patch adds interrupt controller capabilities to the new hardware varian=
ts
(t6030, t6031, t8122) and makes interrupt-controller and #interrupt-cells
conditionally required. However, the existing examples section only uses the
apple,t6000-spmi compatible, which does not trigger the new if-then block
condition:

    spmi@920a1300 {
        compatible =3D "apple,t6000-spmi", "apple,spmi";

Because of this, the newly added conditionally required properties and their
constraints are completely bypassed and remain untested by schema validation
tools.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-t603x-spmi=
-v9-0-09e702e3b153@chaosmail.tech?part=3D1
