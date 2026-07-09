Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA68434040C
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783579907; cv=none; b=u0Klq8ms6V2ASPrAg3aiKd4OBINCq4N0ibf6hfk8uVEOd0OnvRpihmwSsltKZjSukVfPJ1pCVq0psG+PdD26uzwtnlgQeAuWDfG4ftC0/o4KEp9aiSMp4Yvg0sBBt1tYABAnCzuZHcHSzBmx3IFKAHB4333HDNg83eZl38ix7Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783579907; c=relaxed/simple;
	bh=cCfcyo8DMez1At2eh29rbrWFoZP20pC8QgEbvO/JpJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pNeieYzVvQPhFMi02mdtTLTLg7IHTf4qbuZ1CEadmZsrZm5fkoZTbOgUUdPuwe3R2q03E7wR5E7UxcAGu6Dkw7l7vSQqfSJNwot4rC3L4uCZU/0fZHggCmj5+RpR39bAqIkA4AlE71z+ygAff4+L6IW+UERFLD2tNzynswcWfec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUQOWc9p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUQOWc9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB071F000E9;
	Thu,  9 Jul 2026 06:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783579905;
	bh=LNVt8YTxltb1B1r72Z1892Yki1h+g80BO93Q9GACIgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kUQOWc9pS9w2rE8jcScJVrAIPPyaVxwjfUqFoGOBJ6hwe5OvOdaE5sU+V3W7fdBEj
	 de+cFteoe4frcJldwRlMYzXAkJXZs0YsIxmYyP5+5WCpdBwOjmBG6kKpo3StiyHP9d
	 QOXy1kGLrv4mmF5IpYtGF1Gz3UbMIszxgAJ30B4SPpG2/szE53301jNT8XuY17LAHJ
	 NhOCay0hTyAPGmyuig0PJ/F4u+pPIY+PNjagjUcE4nJYaqcQ9VF85Zk8RPloXPITvz
	 C0sEyCwvHNsvckxVXmPiWNXMcX5J/xE/+7xF5pBcJXskuY18M1ho2L93Hq6GPakGSF
	 sXb/qQeHvCQMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: i3c: Add AMD I3C master controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: devicetree@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260709064233.1451482-2-shubhamsanjay.patil@amd.com>
References: <20260709064233.1451482-1-shubhamsanjay.patil@amd.com>
 <20260709064233.1451482-2-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 06:51:44 +0000
Message-Id: <20260709065145.6DB071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `interrupts` property is missing from the `required` list in=
 the binding schema.
--

--- Patch [1]: [PATCH v10 1/2] dt-bindings: i3c: Add AMD I3C master control=
ler support ---
commit dfcd0f962dd67901f67582456a8fe5271491789d
Author: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

dt-bindings: i3c: Add AMD I3C master controller support

This commit adds device tree binding documentation for the AMD I3C master
controller version 1.0.

> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml =
b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> new file mode 100644
> index 0000000000000..2caa245a86568
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: xlnx,axi-i3c-1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks

[Severity: Medium]
Should the interrupts property be included in this required list?

Since I3C master controllers fundamentally rely on interrupts for handling
asynchronous bus events like In-Band Interrupts (IBIs) and Dynamic Address
Assignment (DAA), a missing requirement allows incomplete device tree nodes
to pass YAML schema validation. Will this lead to driver probe or runtime
failures when the software attempts to acquire the missing IRQ?

> +
> +allOf:
> +  - $ref: i3c.yaml#

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709064233.1451=
482-1-shubhamsanjay.patil@amd.com?part=3D1
