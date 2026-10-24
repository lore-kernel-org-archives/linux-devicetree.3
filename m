Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792800424;
	b=tgYyntXsINomqa72dXFLCm7wr/NkHikqIUfFu7KYXjqBIWr54ZbMpWVV2nMmOBoTZ9Uq
	 XrVlPh58ubVbmG4GWuKrMHA31Ys36QsoZR8b5KfdBJIPdsj+AuV2s9ZKLFIfaYRa2Acu1
	 CVq+t86x9X27t9ssIFfdQAnp4Hy09PpSvP8BdmuGGt4v0F3cXr3KFu795QA9H5HS7Tro8
	 70Q0peq4nW9UofJCMayJHR1i8PxQPhy97hLRoizh/HNLMap1pTlNUiDYXMKlO7jQO+UJe
	 t88gxRuGHEaDDSr/4SypD5UG4ETO2sjehFjg31tcrVKOhDWYpEdIxulP6XTWYrOMcrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800424;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8QSFtUWKqh2jcPqpJ5sJ88P6wbY2k9u47znbRX46k78=;
	b=qA7VyH7ifiMGrGeG2ycAKzXrVD3gat87c7AYjumS1TLESv07rtw7Z9vwRwkBTUCFvpYw
	 qQBxFBkSoJKflznobBotk6uyKzy+nmT5bUA8NdpjkSTbrwWSCeOujHYM402dtq0orAM9W
	 sOEmEh3TifNGsAp2vYa9vsdaE+ImMOPCxnPLqOUkcXaI5AVxyj7xhOgJ2TSshZGClj9Ag
	 HRigCJtZf3lICzwck7kscQHe0EcUAvhMwh6UWjTiTCh5UrgF1GHN4wjRzG726OjZGU0xx
	 gjzTv2Fdc9onTPO+Ac8ElN1yAfzlh0mvhCIrPh65Y2nFJ2/A0iNDxXzjqUSqb4Y2b8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qgoyu8Zs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E34606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 00:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qgoyu8Zs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE9D1F01825;
	Sat, 24 Oct 2026 00:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792800423;
	bh=8QSFtUWKqh2jcPqpJ5sJ88P6wbY2k9u47znbRX46k78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qgoyu8ZsM0ObIf1+VFwdOBCJzLWLNhcsyb6FlB9yqzw4wtbjecn2is6Me7KDaXi37
	 mzieCf+7QKQFY/mtaUAeqJnm33+lOqd24r98yKWivqtAu8/Yc+XDQYFVfDU60YhgTf
	 BVgwOPTraEZQK2LRLLUmZoLdrtfDzoPB0w5IVEBSU8+7MEYTpUmUk+xTp7T1mdd2e+
	 qPIBIRasMvJNX+gMnBwR2GUQLbvCc/7DU3x4p4lWMx+wLHm5NK/QCMQb2e7GNK3tb/
	 YhKXS8kt4u947xVCbXogUH+lfLQ20XrUTIB/rs4UsfroTO9XRA/+0OYESl7FNlliAE
	 d/QigcqdWIOUw==
Message-ID: <sashiko-outbox-183450@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba
 mailbox bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Douglas Anderson" <dianders@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
References: <20261023235408.3063350-1-dianders@chromium.org>
 <20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 00:07:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: mailbox: google,lga-mailbox-array: wrong $schema and e=
xample indent
--

commit 8e0bbd08122b063bf8c9d67ff1997606b186bf0b
Author: Douglas Anderson <dianders@chromium.org>

dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings

This commit introduces the devicetree binding schema for the Google MailBox
Array IP block present in Laguna SoCs.

> diff --git a/Documentation/devicetree/bindings/mailbox/google,lga-mailbox=
-array.yaml b/Documentation/devicetree/bindings/mailbox/google,lga-mailbox-=
array.yaml
> new file mode 100644
> index 0000000000000..f265993fe71d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.=
yaml
> @@ -0,0 +1,226 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 Google LLC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/google,lga-mailbox-array.yaml#
> +$schema: http://devicetree.org/meta-schemas/base.yaml#

[Severity: Low]
Should $schema in
Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml use
http://devicetree.org/meta-schemas/core.yaml# instead of
http://devicetree.org/meta-schemas/base.yaml#?

In dtschema (see commit 962e62128feb60), meta-schemas/base.yaml# is intended
for common consumer and provider property definitions rather than hardware
device bindings. Using base.yaml# causes dt-doc-validate during make
dt_binding_check to skip the standard device-binding meta-schema checks
included by core.yaml#.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;

[Severity: Low]
Could the devicetree block under examples in
Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml use
4-space indentation instead of 2-space indentation?

Running scripts/dtc/dt-check-style --mode=3Dstrict on this file as required=
 by
Documentation/devicetree/bindings/submitting-patches.rst currently fails
because the example nodes and properties are indented by 2 spaces per level
instead of 4 spaces.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023235408.3063=
350-1-dianders@chromium.org?part=3D3
