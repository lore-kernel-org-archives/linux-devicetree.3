Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F39C1D5CE0
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351413; cv=none; b=h5oehaiQpPrzg6aVtot5TKIeY5xZVrJxCIElRxE+oGFJxoRRQje8qFziv5eK2lmtJXtJFGrfmmL2nyDNFWNEzwJAUmRGttYCEJsBa/k5Sy6WaizS3lhRpbP/8BhptFkjDgqwaHnht9y291sa3arCx42lBohEtLX97pFwqq9pUyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351413; c=relaxed/simple;
	bh=kaWOhlH187V/S6Ic3R/eq3mKDMehQnv2OBf4aJkjggM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LizHfV5uB4NYV4sZQvvSEmDc6Z5rakFqxY9mRcQ1bEK2MxjQELBPfgELPzyaZHDjKwyYQlMKVQOT0vRWPgsYlAgf8zLr2VS59WRSEqrp5vkxx1lPvaFw1WTgt/dQXeY/HlT22oYaHo6VfNsrmgm5JkLlFB43FOsKmNdpgUdiI8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezJms1eG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezJms1eG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22181F000E9;
	Thu, 21 May 2026 08:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779351412;
	bh=QM/tvA1aNdh2WHpt3uR6q+eCYBk2dzAwsGkjzUF7GQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ezJms1eGPQsWSm+wzxGtUgfZcfYk51WOFxx25xMwEEeRt9pCgUMn2gsdBROK3V5Ts
	 W2GcG7COBIp4fG/TDJBcwpZc2mnXUdk/Pv60Va2oZBLN73HXmMXhoNtMHg4oFrPTl5
	 TmL19SHU+yhqCmhbXbrsQ3Vk1UpljZw4xzYT8ZcPSmN9CR2gtx9aemeagkcEWfFO2U
	 5emastyazFPg4WSiVyRrGvMd/MQ2MHLXwEdM4iAbrgbPNJS0AI8iTtIjBJz/uaZzzA
	 illioW810AnDxsfN9/UJCUDZWvQPowxM/XhMpA/S8Q1rd7vFP00esH+DVI/dgYwIDR
	 t5yBHc50fo6Cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: usb: cdns3: Add cdns,cdnsp
 compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521-no_drd_config_v9-v9-1-2512cef10104@cadence.com>
References: <20260521-no_drd_config_v9-v9-1-2512cef10104@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 08:16:51 +0000
Message-Id: <20260521081651.D22181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The schema does not enforce the presence of the `dr_mode` proper=
ty when `cdns,cdnsp` is matched, despite the commit message explicitly requ=
iring it.
- [Medium] Array bounds (`minItems` and `maxItems`) for `reg`, `reg-names`,=
 and `interrupt-names` are not explicitly constrained inside the conditiona=
ls.
- [Medium] Use of the empty schema `{}` as a wildcard for compatible string=
s breaks dt-schema validation and explicit documentation rules.
--

commit 1f787c873a0b8a21200340bba7dffd95f1916193
Author: Pawel Laszczak <pawell@cadence.com>

dt-bindings: usb: cdns3: Add cdns,cdnsp compatible string

Introduce a new generic fallback compatible string cdns,cdnsp for
Cadence USBSSP controllers without the Dual-Role Device (DRD) register
block. It restricts the resources to host and device configurations,
requiring dr_mode to be explicitly set.

> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -17,22 +17,24 @@ description:
> =20
>  properties:
>    compatible:
> -    const: cdns,usb3
> +    oneOf:
> +      - const: cdns,usb3
> +      - items:
> +          - {}

[Severity: Medium]
The commit message mentions using an empty schema wildcard {} to allow
future vendor SoC compatibles to be prepended. Does this break dt-schema
meta-validation during dt_binding_check? The tooling usually expects
concrete compatible strings to be explicitly documented via an enum rather
than using a wildcard.

> +          - const: cdns,cdnsp

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cdns,cdnsp
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: XHCI Host controller registers
> +            - description: DEVICE controller registers
> +        reg-names:
> +          items:
> +            - const: xhci
> +            - const: dev

[Severity: Medium]
In dt-schema, specifying an items list inside conditional branches does not
automatically override the top-level minItems and maxItems length constrain=
ts.

Since the top-level schema allows 2 to 3 items, would omitting maxItems: 2
for reg and reg-names in this 'then' branch allow a 3-item configuration
to incorrectly pass validation? Similarly, does omitting minItems: 3 in the
'else' branch allow a 2-item configuration to pass for cdns,usb3?

> +        interrupts:
> +          maxItems: 2
> +        interrupt-names:
> +          items:
> +            - const: host
> +            - const: peripheral
> +        dr_mode:
> +          enum: [host, peripheral]

[Severity: Medium]
The commit message states that dr_mode must be explicitly set to either
'host' or 'peripheral' when this compatible is matched.

Should dr_mode be added to a required list in this block? Without it, the
property remains optional, and device trees missing dr_mode could silently
pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-no_drd_con=
fig_v9-v9-0-2512cef10104@cadence.com?part=3D1
