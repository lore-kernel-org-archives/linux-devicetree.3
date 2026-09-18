Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EA470111
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754043; cv=none; b=Wdr+UzG/Bd/JFNxwV5mHl3tpCNUEyqZfHmHSlnfrbfk7octoEwscY8ileYVxlvksxCwGb7N4RKzXQlbThgXdFO0ImMaGyDvJK0Fpz1uQ0VB0Rxgg35i4V3M5Q0dfPO9LvRiSrDKdC0/mMxCI9Sf64W+FFYqV5fak5JWQ5n9fcqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754043; c=relaxed/simple;
	bh=jtP1ibn/4yc7fE5zv325tbFOKhjrKLAz5arkNl4eF+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jAp1xRXX+zvsaq9vOi16YJaX7uPYEwC0g+lTsSsExTm7yZvs99EfnI9wb44PrfSMsmKOXfUpbNVsp8If/OTySaT62zYO9+1PB6UiZ5fvkKzVS3a7+D7QqlU6UDGuV/RLuQSVbHsNqESrutYkusJSIm9PL5xvHDZSpGdoDRkbTsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFhtxEqW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFhtxEqW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0F51F000FF;
	Fri, 18 Sep 2026 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789754036;
	bh=MeG3Zsz29iVOkRoFW2w55ZxZJHdlOnnY1jOM1b7Cy8U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFhtxEqWLaPQFPYLH9MahpXjzCEfX847GLUanRg3+Rgy31XmAjFPOIXSUVftogh4e
	 r05A6SipuBYA46dfdtNJeOu0g7ZgIig7B6ewQbgg/h0U5GdhAu5m0whgLLByo/4P8q
	 5/5zl3cvXoA3PZ2jKjw3jYvuz5x/X/kyNuGSMQybSjdu1NdfyrM5UPyEdb1e/t8W9u
	 9i1lemZgBEWF0aFQVwcEPu4+4GThMxKAkwYb1JBN5PD2yfkkA2+g/CDuIzQSMVQ3iw
	 5M81r7L/42EFn2QluGhkvj9tjQxgPe7qi/Ap8ESh6vu1PpDy536lezUfJfnL6LSUGf
	 +EAETascQv41w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: iio: adc: Add dt binding to xlnx,xadc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Omer PALA" <palaomer100@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918174413.17155-1-palaomer100@gmail.com>
References: <20260918174413.17155-1-palaomer100@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 17:53:55 +0000
Message-Id: <20260918175356.4D0F51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: conflicting constraints when xlnx,external-mux is o=
mitted
--

commit 406270de35d17021a1ddb6e41307e55905cede41
Author: Omer PALA <palaomer100@gmail.com>

dt-bindings: iio: adc: Add dt binding to xlnx,xadc

This commit converts the xilinx-xadc.txt device tree binding into a YAML
schema. It defines constraints for xlnx,zynq-xadc-1.00.a,
xlnx,axi-xadc-1.00.a, and xlnx,system-management-wiz-1.3 bindings.

> diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml b/D=
ocumentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> new file mode 100644
> index 0000000000000..f9b717c297158
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        xlnx,external-mux:
> +          const: none

[Severity: Medium]
Will this if block evaluate to true when xlnx,external-mux is omitted?

In JSON Schema, an if block checking a const on a property evaluates
to true if that property is absent. Does this block need a
required: [xlnx,external-mux] constraint inside the if to prevent
it from silently succeeding when the property is not provided?

> +    then:
> +      properties:
> +        xlnx,external-mux-channel: false
> +
> +  - if:
> +      properties:
> +        xlnx,external-mux:
> +          const: single

[Severity: Medium]
Does this if block also evaluate to true when xlnx,external-mux is
omitted because it lacks the same required constraint?

> +    then:
> +      properties:
> +        xlnx,external-mux-channel:
> +          minimum: 0
> +          maximum: 16
> +      required:
> +        - xlnx,external-mux-channel
> +
> +  - if:
> +      properties:
> +        xlnx,external-mux:
> +          const: dual

[Severity: Medium]
When the xlnx,external-mux property is omitted, doesn't this if also
evaluate to true, piling on a contradictory requirement for
xlnx,external-mux-channel?

Since xlnx,external-mux is an optional property, omitting it causes the
schema to simultaneously require xlnx,external-mux-channel (from here and
the 'single' block) and explicitly forbid it via false (from the 'none'
block).

This creates an impossible constraint that rejects valid device trees using
the default mux configuration. Could adding required: [xlnx,external-mux]
to each if clause fix this underlying conditional logic issue?

> +    then:
> +      properties:
> +        xlnx,external-mux-channel:
> +          minimum: 1
> +          maximum: 8
> +      required:
> +        - xlnx,external-mux-channel
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918174413.1715=
5-1-palaomer100@gmail.com?part=3D1
