Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316D636654F
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121165; cv=none; b=MxIyhWg/FIhYxAqoGDw+C6IMpObptp8UBFdVg59DhATJDJ09n82G8l0tJRwWgFIOgdh6UROBE089amP7M3XlltW1I3CwLYCJfOebnLc6hWOuiXL9oL2enotga6UuCntiKqCxTzDvnQ8ryyMVEhie+HbEh1j6Lp1tuhbauqYLl9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121165; c=relaxed/simple;
	bh=kKj8uPxAYsg41xBtgAyKzDOYzPziCYf0c2MnLTv1ss4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qnt3HUxUUx8g4K4jyAANzbgx1YPSp9EunGBakt8VymwV3yEzndY45V3qEF7AMuor7eHjfjzPT+HbIjcOgly9yd4MOXkCjiWIRwq13sqxoQQ+A7A4t6lBLE8gB5u+YPvVSROCzXdliTA5KzAzJGrFEpM4Jq42t6ll4/l7gZW0yKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhxTz+1F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhxTz+1F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD8E1F00A3A;
	Mon, 22 Jun 2026 09:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782121163;
	bh=FA1zIG9t9UX8iueBnMuL8+gE547HOG5RO4KyhyTwGoY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mhxTz+1Fsbc+jI2hPZfCIU91y48/ymPP1juNMIetMC/JneK9Td8IRkS11ID5k0Ltj
	 KF/MUJomaqTAXn4RHAF9JhZw18vJBAU2jEO7BMs8g7UzcjvHBzYELPNO6W2Ze+QaA5
	 wReWo4YdtVth+qUhkZpGL3gaIG5u3iYnO4HhnyRr6ZaAxkkBYVTt9mYgcCUpTCvG97
	 7m30pEP6ndUOcbqFEaYOjdMZAcAiKNXb7j+21uZ3sKFtzVb1sdcyexrFFbLR2sbBop
	 JwUIPwYPHrVsf86KYtkwbgMnWuYgIIEuHgzj5vXBFcNGYKhjFOi+PtXGX7UB8lZLZu
	 ZJMJ2cG515/xA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: realtek: Add
 realtek,rtd1625-gpio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260622092335.1166876-2-eleanor.lin@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <20260622092335.1166876-2-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 09:39:23 +0000
Message-Id: <20260622093923.BFD8E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding defines the GPIO controller as an interrupt controll=
er but fails to include `interrupt-controller` and `#interrupt-cells` in th=
e `required` list.
--

commit c069bdfb1e6325b567084e608f2dc45bf15e2fcf
Author: Tzuyi Chang <tychang@realtek.com>

dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio

This commit adds the device tree bindings for the Realtek DHC RTD1625 GPIO
controllers. It introduces support for a new per-pin register architecture
that includes separate register blocks for configuration and interrupt cont=
rol.

> diff --git a/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.=
yaml b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
> new file mode 100644
> index 0000000000000..f13c910b73c69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml

[ ... ]

> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-ranges: true
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-ranges
> +  - gpio-controller
> +  - "#gpio-cells"

[Severity: Medium]
Since this binding defines the hardware as an interrupt controller, should
interrupt-controller and #interrupt-cells be included in this required list=
?=20
Omitting these provider properties might allow incomplete device tree nodes=
=20
to pass schema validation, which could then cause runtime failures for=20
drivers attempting to use the undocumented functionality.

> +
> +additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622092335.1166=
876-1-eleanor.lin@realtek.com?part=3D1
