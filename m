Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D659468C0A
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934149; cv=none; b=paP+3eXdCtbiAsXplSsP9kw0AmtBTlhTEkvGwcgdBYgYr97SVBu0ZdZzkBXZ+0BpxwFr9kiSArdazwPFEHv0ci2fCLAGa6PenMUFzY4ZnUihzVvHXWkqyQ04A4skedjzDuw+uZKcyotvQUu45BAgR2MeirrU/vLj2WvdORE+Jtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934149; c=relaxed/simple;
	bh=ucRmJ54eJTCRt2TQSVsaP5A39sH0msggNb6C6c+8t2Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mCcKkFIS2l62dsGGVojUo286eaI2gFx54yLjbXGS6tsRTrnx2gYeB6T6+rV/pgnHqcXA60yJw/pwduyLaYb8mQUPtn3PW1w05LpqfSiXNibBQjjWRaX+dtbvGoborsMYTV/dL1ElfYGFRZKgTNJvmObqBbQud1Ck/f63/S6xR2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6Ah3ujS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6Ah3ujS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3D71F000E9;
	Wed,  5 Aug 2026 12:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934146;
	bh=242A45KI95FTP0I9t9fww4aH4fEHfV0cB7mCDAPuMSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V6Ah3ujSquQAyY/W79eGpmmoZ9ZR4UR5BFaxiJhGF4VMeJolHZrrXZn6h547aD/5u
	 kztEknnsCl2KvtwGZnlnrzYYFk3naxAdqUAGRtNKmbtmDEjrXlfaDrGv4o93q9gcBL
	 CnNBJIZZvXTy3vOU8qZ6Y0WKr/Fa4J0k2cV/eh4sqNnOFrl9gQhTq4FS4JsaL3CmLT
	 Ruaon5EMK6g4tRyV/k8/cA9CZzGBwdjmkqRPjGuxjRJTnMi5MFxg0bXyAnpWHKjfhH
	 ykIWXWFLlN/MvOa2LoURfV3M/uq9OLtdDtNoOhMJOkSEGHe6TD6T9PxuijsuV9dx+D
	 sEZYAYj1N4Krw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: dp83867: add binding for
 output-impedance
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804-v7-2-topic-dp83867-v1-1-1ca79eb54eef@pengutronix.de>
References: <20260804-v7-2-topic-dp83867-v1-0-1ca79eb54eef@pengutronix.de>
 <20260804-v7-2-topic-dp83867-v1-1-1ca79eb54eef@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:49:05 +0000
Message-Id: <20260805124905.9F3D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing schema constraints for numeric property bounds.
- [Low] Devicetree property naming convention violation (-ohms).
--

--- Patch [1]: [PATCH 1/2] dt-bindings: dp83867: add binding for output-imp=
edance ---
commit 9c13d3ae2983ce2a58c2c0ce9fcf6fedc072b384
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

dt-bindings: dp83867: add binding for output-impedance

This commit adds a new devicetree property, ti,output-impedance, to configu=
re=20
the MAC interface output impedance to a fixed value. It also specifies=20
precedence rules when used alongside existing impedance configuration prope=
rties.

> diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Docu=
mentation/devicetree/bindings/net/ti,dp83867.yaml
> --- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> @@ -41,6 +41,12 @@ properties:
>      items:
>        - const: io_impedance_ctrl
> =20
> +  ti,output-impedance:

[Severity: Low]
This isn't a bug, but should this property name include a standard unit suf=
fix?

According to dtschema conventions for physical units, resistance properties=
=20
typically use a suffix like -ohms or -micro-ohms (e.g., ti,output-impedance=
-ohms).

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      MAC Interface Impedance control to set the programmable output imp=
edance
> +      to a value between minimum (35 ohms) and maximum (70 ohms).

[Severity: Low]
Should this property definition include minimum: 35 and maximum: 70 constra=
ints?

The documentation mentions the allowed range, but without explicit JSON sch=
ema=20
constraints, dt_binding_check will silently allow out-of-bounds values in=20
device trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-v7-2-topic=
-dp83867-v1-0-1ca79eb54eef@pengutronix.de?part=3D1
