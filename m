Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8032D9ECB
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789898478; cv=none; b=lfLBGNI+8cLVxEC2BFsrFBE40o2XcFOZtEpksLucQCzgBj74O6Wn55ktHTRKJOvl5Vu4MoHB/j442QFX++ERa0mzg4zZran+87eTB2x0iLQ7+LbAoy8Sm+44Hvm4bq+lKNoXKnZiwXUbG2rVvOi2heqgr73lvCGYQtmH4OzQm88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789898478; c=relaxed/simple;
	bh=nlB5jQZBgojNE29iCYcEoW+xcH2KpeYoHcq65/wFbuo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nnd9BHs/Q/9ThbQip5d2vq3L60xHgPeJ9a38ZSl8mjmNlGK+l+EJrUDzVPlMoH7o9zegK8hM+aAi8X0yxla/kPRF6ld1DkC+UqnoIvqHJ/Fm+GMDWDIavKCTMxfAupkX7b1f1hyc3EWVYNHB648u5vL3tHWdHl+nY+vdv/sLtAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGbCShma; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGbCShma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAD91F000FF;
	Sun, 20 Sep 2026 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789898476;
	bh=MVI9p4gqJ5du2VsZ2KPh8eEXGdxbocDhp4YlMYx329g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kGbCShmaecw7BwJ/2kX2XgdCgcfQXse8+A4VYJKb0bYqvsm1su8mMIEvz3PKNoLKC
	 iCdsFdVGMkTFpRHnken4SRv+mf/00CIF5Vwvn/iZDGbnhJdSKxPVYrttDsYYUJW0X1
	 LIU9VLnLrm9tM/KlycdSUa12uikduCBc/3x70LiH6ID+N2IsvKdQrGBmBykfC0buZN
	 ClaHteb2bMCgt8tIHmZvChxR1ofMHW/hrp2YnXJpwMLppglDNrm21d2GzO3+8ZGaan
	 HjVrpF4x8teTBpBzuPZY+kjp7VtzmGebTapaLIpacK7MSjZ/HPrOOKNDNXKjgfFtPH
	 85YaPhXEdWF+w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 2/3] dt-bindings: net: bluetooth: Add AIC8800D80
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanli Yang" <yanli.yang@bedmex.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <a4304d4068002ca854d2aea5609ac8440935a8b2.1789897503.git.yanli.yang@bedmex.com>
References: <cover.1789897503.git.yanli.yang@bedmex.com>
 <a4304d4068002ca854d2aea5609ac8440935a8b2.1789897503.git.yanli.yang@bedmex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 10:01:15 +0000
Message-Id: <20260920100116.6DAD91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: bluetooth: Incorrect max-speed property constr=
aint
- [Low] dt-bindings: net: bluetooth: Unidiomatic reg property constraint sy=
ntax
--

commit 8cfd6d94bf45715d77abf03541df961e63f18ae5
Author: Yanli Yang <yanli.yang@bedmex.com>

dt-bindings: net: bluetooth: Add AIC8800D80

This commit adds a devicetree binding for the AIC8800D80 Bluetooth chip.
It describes the SDIO firmware-loading function and the UART HCI interface
which uses the H4 protocol with hardware flow control.

> diff --git a/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d=
80-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80=
-bt.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.y=
aml

[ ... ]

> +allOf:
> +  - $ref: bluetooth-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          const: aic,aic8800d80-bt-sdio
> +    then:
> +      properties:
> +        reg:
> +          const: [[1]]

[Severity: Low]
Is this the correct syntax for constraining the reg property?

In devicetree YAML bindings, reg constraints are typically expressed using
standard json-schema properties like minimum/maximum or an items list
definition. Does using a 2D array [[1]] expose the internal parsing
representation of dt-schema, making it unidiomatic? Could this fail
validation in future tooling updates or confuse other developers?

> +        max-speed: false
> +        aic,firmware-sdio: false
> +      required:
> +        - reg
> +    else:
> +      properties:
> +        reg: false
> +        max-speed:
> +          const: 1500000
> +      required:
> +        - max-speed

[Severity: Medium]
Does this incorrectly mandate a fixed max-speed?

According to standard devicetree principles and the core
serial-peripheral-props.yaml specification, max-speed represents a
board-specific hardware limitation and should only be present if the maximum
is less than the slave device can support. By requiring it and forcing it to
const: 1500000, does this force redundant, fixed configuration into every
device tree using this compatible string?

Would this also prevent developers from specifying a lower speed if their
particular board design has signal quality issues? If the device always
operates at 1.5 Mbaud by default, should the kernel driver handle that based
on the compatible string rather than hardcoding a required static property =
in
the DT?

> +        - aic,firmware-sdio
> +      allOf:
> +        - $ref: /schemas/serial/serial-peripheral-props.yaml#

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789897503.gi=
t.yanli.yang@bedmex.com?part=3D2
