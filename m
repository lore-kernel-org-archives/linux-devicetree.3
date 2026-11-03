Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698922;
	b=Du7doOVTTepcTy6kAVgqGjEpUWY7ZPlAXcA76w+4/bPZw2+LE9SY+lDgsFLylhJdoLgD
	 S1DFPWygRUwIKX0gOmQZoiP1a+t+viW5AUsL8JzIjtnxgdy66jUiSYPCddluS/x5LYe5J
	 jVHFVHLLXw6666bJLrrFTK5CEqA/CdE7hovGF346d3U4hewrpSWrOe5nykZO41OsmJ417
	 fQkziONigryt4CVBrZX98olYaKlJ7nDZ7AJKfh16aXcnEBZF/Cg0npWk79cEMIw2D4DTh
	 LqzV8KZhcKjjnLrs75DHYFRQVYNIn7GBen288ccxZZKN1dQvHkMIuT2Lyje8ei5bH/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698922;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ICUROXcoViLoeFUqglXzq1+yr2nRaukEJjcoViPdsOU=;
	b=E6ZW5QzyBWgdVRLbOdmFKsrnSASt5Zlc7prAh4PjEDOUL5Uahhq7ZHPOaWz0rVeuy+iV
	 41B/ZsSPqRWkfYVbayPBb+bENkRHBu1tifVo+7ZRT/ptnhly/84SNkJOARSSDKYZ+0Bqz
	 GYRP7LQ7tQhYq3bju2kxY0Kn/wCmkwqevntINw1JPBSjL4iTjmPnEwSvxVWmxLUH23LvT
	 bCx7yrA9J6o5far5ZTo8ZdWBQEUh4PC7I7xibmiX8LuxYcXpAsKp8MubE/QoIiM5wmtBS
	 Lfb7VNrZBj6xRb4CP9LIKKdr+8/SL/YVQ0LOK1GmApm1vUhdDttCBpQ1R7LCZYE2f1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cwLd+rSP;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C698606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C698606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cwLd+rSP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A48A3C4FEE1;
	Tue,  3 Nov 2026 09:43:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D9016046C;
	Tue,  3 Nov 2026 09:41:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5309103290E8;
	Tue,  3 Nov 2026 10:41:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793698917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ICUROXcoViLoeFUqglXzq1+yr2nRaukEJjcoViPdsOU=;
	b=cwLd+rSPtJ2QO3mALDUg1PP5FtvS9GayMPBQOhCtdQ1AORNQskqETFY1AcuFHjqsyneixT
	VnuANAf/cowmNfVV32udXdAVT5//WuWQRgkjrdIWLc2M+kZ29iYTSVtThZJ1z2z5MNh5MN
	C/QCWKY4FFKR6UCDwCfzYe9RdbC+22jIxl8a8J4/1LxDmiHwcx7x+IeNbLLGm6pxefVEtc
	X/yWaHYt1+oUVYtpiOmL1Uf8fppXgSMRnI+UoMHoYeYGCTFa8/g6WqXkOewwfb4H7XMmwd
	U+ldcYBv2mGP8FM8RfjNJdw1hu5zKzSBOmAXVVh4HbyOQk8N1csN1XA2p8KaaQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: interrupt-controller: add Mobileye
 EyeQ5 PCIe MSI controller
In-Reply-To: <sashiko-outbox-193804@kernel.org>
References: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
 <20261102-eyeq5_msi-v2-1-4aa3d3608064@bootlin.com>
 <sashiko-outbox-193804@kernel.org>
Date: Tue, 03 Nov 2026 10:41:56 +0100
Message-ID: <8733ti2qvv.fsf@BLaptop.bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Krzysztof,

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: interrupt-controller: eyeq5-msi: drop bogus #inte=
rrupt-cells
> - [Low] dt-bindings: interrupt-controller: eyeq5-msi: drop software label=
 property

You do not need to review this version. The remarks above from Sashiko
are correct. I will send a new revision soon. I hope that it will be the
correct one.

Gregory

> --
>
> commit 9aaa3be0c94345e12c3b93b0a3ada8acf3fb0a25
> Author: Gregory CLEMENT <gregory.clement@bootlin.com>
>
> dt-bindings: interrupt-controller: add Mobileye EyeQ5 PCIe MSI controller
>
> This commit adds the devicetree binding schema for the Mobileye EyeQ5
> PCIe MSI controller.
>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mobi=
leye,eyeq5-msi.yaml b/Documentation/devicetree/bindings/interrupt-controlle=
r/mobileye,eyeq5-msi.yaml
>> new file mode 100644
>> index 0000000000000..b86698e4f82c7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/mobileye,ey=
eq5-msi.yaml
>> @@ -0,0 +1,90 @@
>
> [ ... ]
>
>> +properties:
>> +  compatible:
>> +    const: mobileye,eyeq5-msi
>> +
>> +  reg:
>> +    items:
>> +      - description: GCSR block of the PCIe port
>> +      - description: MSI vector control block
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  '#interrupt-cells':
>> +    const: 1
>
> [Severity: Medium]
> Should interrupt-controller and '#interrupt-cells' be dropped from
> properties and required in mobileye,eyeq5-msi.yaml?
>
> According to the description, this hardware block only snoops message
> signaled interrupt write transactions from a peripheral port and signals
> its parent interrupt controller when a vector is pending. Consumers
> reference this node exclusively via msi-parent with '#msi-cells' set to 0,
> and it has no wired interrupt inputs.
>
> Consistently, the driver in drivers/irqchip/irq-eyeq5-msi.c only registers
> a parent domain via msi_create_parent_irq_domain() using
> eyeq_msi_domain_ops (.alloc, .free, and .select =3D
> msi_lib_irq_domain_select) and implements no .translate or .xlate callback
> for wired interrupt specifiers.
>
> Requiring interrupt-controller and '#interrupt-cells' set to 1 exposes an
> undocumented 1-cell interrupt specifier for a controller that cannot serve
> as an interrupt-parent, whereas chaining to a parent interrupt is an
> operating system driver detail (compare with altr,msi-controller.yaml,
> fsl,ls-msi.yaml, and fsl,mu-msi.yaml).
>
>> +
>> +  msi-controller: true
>> +
>> +  '#msi-cells':
>> +    const: 0
>> +
>> +  label:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: Name of the MSI domain. If omitted, the node name is u=
sed.
>
> [Severity: Low]
> Is the label property appropriate for mobileye,eyeq5-msi.yaml?
>
> In devicetree bindings, label is intended for human-identifiable physical
> labels on a board or enclosure (such as external ports, leds, or buttons),
> whereas an irqdomain name and driver fallback behavior are kernel software
> concepts. In drivers/irqchip/irq-eyeq5-msi.c, this property is only used
> to print a boot message in pr_info(), and no other binding under
> Documentation/devicetree/bindings/interrupt-controller/ defines label.
>
> Additionally, if label were ever kept, its string type is already defined
> by core dtschema common properties, making the explicit $ref to
> /schemas/types.yaml#/definitions/string redundant.
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-eyeq5_ms=
i-v2-0-4aa3d3608064@bootlin.com?part=3D1

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
