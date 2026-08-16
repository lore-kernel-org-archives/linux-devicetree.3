Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFA13D79E9
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786916882; cv=none; b=kN7hSmQhSyqNQAQpzosLiPyGgz9d1Rz2F9XWS4y7KMrc5KBzrVtonE0EcBAJ5RNpbXukO/vtnkthZMNqVZvDKrteuC++kTFbqEnFxJ3iUoZf+1tjohoXTN4EIb+Ie/IQCgixNwJbTVQoP3hBaOHTijJ6o9Yz3Tj6ubnvzwq3z7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786916882; c=relaxed/simple;
	bh=YAP6OWlRRrwps9zsCBX/J5k2KIB6JvIZXkzyPZZJINA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TTvlSBJu+bkp7Jzo7LAUgWYpmYudFL/6o5o2xX1uoTJ8i4YZ4kerytQvdSRb5792wI4u8xclXvFp4w2RoCi24VCMKRZBOdsPXlhrZ0wsqEzRQbr5NDv0iMvcyBkanvTY8E7etTzUeSQWWH9fbrJtlRcj5PjJDAyLWc5F2sn9bIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUDortpi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUDortpi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 569FB1F000E9;
	Sun, 16 Aug 2026 21:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786916880;
	bh=w+FZ5qD6PqFaJI2a+RpyXgNEYR+Brd6qjaqgEZw7kNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mUDortpiVqH7+M61pNh85IlLSkG7bPivf6lMqDTa6vFfnP1DUIT6kTW7Wpx3U8Dm7
	 cp8vRlvh8jyah9L43SGEMOR3E4EnxQFaPzfI6NgE8p3D1TyRVwJHfcnTNY8JEZa/6w
	 yhbxJi0afGnGFhvO7EAS3qDQReMsOD9aPb0dxQzwANU2VYXsbgTuZp3flwzeVm0WZO
	 QZb6yu/jmk2HbALLhMKQ/8rd7zKctWhpUaUrUc9r6ReRg4yga+horqMnR42sVXjYoB
	 Xx4EGmJuJgiW6FXfBZuYv2GSPyxWLfqRZXgjF/cADp+uw6jg96MwlyfVB3BPHKU0NH
	 DnOVevJo2PU+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/9] dt-bindings: usb: dwc3: Document ST STM32MP2
 DWC3 xHCI USB controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260816213849.1044073-6-marex@nabladev.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-6-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 21:47:59 +0000
Message-Id: <20260816214800.569FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The st,stm32mp25-dwc3.yaml schema defines a flattened DWC3 contr=
oller node and sets `unevaluatedProperties: false`, but omits the required =
`$ref` to the standard DWC3 common schema (`snps,dwc3-common.yaml#`). This =
causes all standard generic USB properties (e.g., `usb-role-switch`, `maxim=
um-speed`) and DWC3 quirks (`snps,*`) to be improperly rejected during devi=
ce tree validation.
--

--- Patch [5]: [PATCH v2 5/9] dt-bindings: usb: dwc3: Document ST STM32MP2 =
DWC3 xHCI USB controller ---
commit 1e1f5ec0770c94ae4e8d9d9545d561a05a898622
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller

The ST STM32MP2 SoC contains a single instance of a DWC3 USB controller
with a glue logic wrapper. This commit adds the device tree binding schema
to document the controller and its syscon-controlled wrapper.

> diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
> new file mode 100644
> index 0000000000000..e377efef43503
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - resets
> +  - st,syscfg
> +
> +unevaluatedProperties: false

[Severity: Medium]
Will setting unevaluatedProperties: false without a $ref to
snps,dwc3-common.yaml# prevent the use of standard generic USB properties?

Because this block strictly restricts allowed properties to those defined
locally, it appears standard DWC3 quirks and generic USB properties like
usb-role-switch or maximum-speed might be improperly rejected during
device tree validation.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816213849.1044=
073-1-marex@nabladev.com?part=3D5
