Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573744DB95
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844107; cv=none; b=IEBvQhMoQDUEzyJKmMlnkI+lLNpGmqSfp++D7DEcy6htntouQip/6Ej1QYHsAth3Jn8kQ0rotscmQFQW8rQiK/2fWfYku6A9RtEmK2u7UJpXI/4B07mqHwBa8OntgNWR83I4egRvc7nhikGBdESLeMzIqgjrkkxOimMwNe7JRUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844107; c=relaxed/simple;
	bh=aJ/rU6ph5k4vviXAjgoTxsM1pluAJ2pkRGjYLT5uyYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=seuAxYDiYnaaCLQ4sXixjvXpm29V+SfbXUEO+7vJJ8tryZLH4SpmXocgckSpAE3jTkKYEemKM4mLpaZOLAhmNBgtIi1DsCboYRriOveTLEoGeH4qfXKdC9c/7HJYJwoRnbEAHXt1wHTeuq+V+tgeF1LOeVfxkF9mx1TAf+nzAeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgDu1dpS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgDu1dpS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE29C2BCB0;
	Fri, 15 May 2026 11:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778844107;
	bh=aJ/rU6ph5k4vviXAjgoTxsM1pluAJ2pkRGjYLT5uyYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QgDu1dpSjQiNHYQSr/vheR18Q0Y5En9GMv91hy3g5uZJtFXXVVGj+w8fVh1KfNJko
	 1xNJdJfR+64/YILgjSnzvxTAjCTGPC1uhmyet2PU/BhHxZ2YDOkN7u2BL8LFIon61Y
	 x8iZ8zDP7Gn/qVzuNZnY3n3zyrIg7sgdq/ujF5dGmSyibu5GwJpnRtFwF0J0FAouUs
	 Wr9vnaa+TIoL9anCaneFgN1MJsa8NBNJbb690NVy6OznY/O+bqMTG7oO1IOEgl3/gp
	 8mPjvQVFXnFOuiDolGbqVjZwG1dbns+zgaiPMIvQO+7XDhV9Ml9GKdxubCbtx4qKDO
	 nRyKW71gz17hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: usb: cdns3: Add cdns,cdnsp-no-drd
 compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-b4-no_drd_config-v8-1-75cb05317679@cadence.com>
References: <20260515-b4-no_drd_config-v8-1-75cb05317679@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:21:46 +0000
Message-Id: <20260515112146.CDE29C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The 'dr_mode' property is not explicitly enforced as required for =
'cdns,cdnsp-no-drd', contradicting the commit message.
- [Medium] Missing `minItems` and `maxItems` limits in the conditional bloc=
ks allow incomplete or over-specified property arrays to silently pass vali=
dation.
--

commit 1fd95ddfc77fad408e99901f5ed7387c21b64dfd
Author: Pawel Laszczak <pawell@cadence.com>

dt-bindings: usb: cdns3: Add cdns,cdnsp-no-drd compatible string

Introduce a new compatible string cdns,cdnsp-no-drd for controllers
missing the DRD register block. This restricts register and interrupt
resources to 2 items and specifies dr_mode requirements. The standard
cdns,usb3 maintains its existing 3-resource requirement.

> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
[ ... ]
> @@ -93,6 +93,46 @@ allOf:
>    - $ref: usb-drd.yaml#
>    - $ref: usb-xhci.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          const: cdns,cdnsp-no-drd
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: XHCI Host controller registers
> +            - description: DEVICE controller registers

The top-level schema allows up to 3 items for reg. Since providing an items
list doesn't implicitly restrict the overall array length in dt-schema,
could a node with 3 registers incorrectly pass validation here?

Should maxItems: 2 be explicitly added to reg and reg-names in this block?

> +        reg-names:
> +          items:
> +            - const: xhci
> +            - const: dev
> +        interrupts:
> +          maxItems: 2
> +        interrupt-names:
> +          items:
> +            - const: host
> +            - const: peripheral

Similarly, could interrupt-names also pass validation with 3 items because
the top-level allows it? Should maxItems: 2 be added here as well?

> +        dr_mode:
> +          enum: [host, peripheral]

The commit message states that dr_mode must be explicitly set to either host
or peripheral. Does the schema enforce this requirement?

Since dr_mode is only constrained by an enum and not included in a required
list, a device tree omitting the property entirely will still pass
validation. This allows an invalid configuration where the USB core might
fall back to the default otg mode on hardware that lacks DRD capabilities.
Should a required list containing dr_mode be added to this block?

> +    else:
> +      properties:
> +        reg:
> +          items:
> +            - description: OTG controller registers
> +            - description: XHCI Host controller registers
> +            - description: DEVICE controller registers
> +        reg-names:
> +          items:
> +            - const: otg
> +            - const: xhci
> +            - const: dev

The top-level schema was relaxed to allow a minimum of 2 items for reg and
reg-names. Without minItems: 3 specified here, could a malformed legacy
cdns,usb3 node with only 2 registers pass validation?

Should minItems: 3 be added to reg and reg-names in this else block to
maintain backward compatibility?

> +        interrupts:
> +          minItems: 3
> +          maxItems: 4
> +        interrupt-names:
> +          minItems: 3
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-b4-no_drd_=
config-v8-0-75cb05317679@cadence.com?part=3D1
