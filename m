Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552860;
	b=oKkK9OFl/djiyW29f19tD4HyjrfHs1bAuAuj93PlwHL2TaV/23f0IMKe6d/UT3ic0LsB
	 SD64RRTNHkuuLAmNyR3lmd6KnaYVedYOjv1me48Tywh69RTUqduynbSkGhboFrcLGRMUC
	 FT/U9teRfRbZOvEBxEwc1y4MmaWWYEgnP7b70xG500jkYImw2mUm7ifh/MR29XpGdUiV7
	 Z9vYJCauciKQlqy5OGjZZHLiTk2IDRoXDilOSBG+ZcQAcOY9LAHS7oMlV8tVHYDakmucL
	 yyhgkYTqp02E84/4wTOsmBV7ZvZ55Ooi5th2wEWDfDn619tVgLZhI2xSiGRrXr6wpng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552860;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qYg1GnhGMu6VvQC4qjO857SyQPwQU3tgicqkS35PKH0=;
	b=VulLIHf6LnitLoB60l7w0yycUWAO+O7alCZAjeB1XqosW2dIL7wwtzolznp9GKxjP6pW
	 +GxI57Few53ygtd6CB/iB6U+aDHv6PP/wTwrjy0SYc0+1S8rLN1Hm0RzmGmpx6oVDSvaR
	 chBXXTar0s2WwP+p5k+y30VoYhHnVKjXeni9B5f+68bBr+pcTKUQcyca6Zy9JGHCKjouS
	 92N/k8Hfifn5OCXEwDrpj1Q6fD3ea6QAx28xxTN3BgAuhU6xjxRXFY3cS/ItYVxiAMPvx
	 /Ph1MjYVY2d0AvnJ4ySwchpPrGTxPgZUCajVcTWvQyNOoKQbx9lVf6h/ubeZtUocl5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cy260hwN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008E6606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cy260hwN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FFB1F000CA;
	Tue, 24 Nov 2026 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795552859;
	bh=qYg1GnhGMu6VvQC4qjO857SyQPwQU3tgicqkS35PKH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cy260hwNtf91hWWtSUBJ1YJWfIzyr4e5vEJTnT+QH8LcomFqseI3SYrMUgOv8b3/Y
	 gTUIXSxP3+4a5dvmXHkzETebS7Ap/RNht8bWmB8gnEbYpbmP6Nx0/RPuOjFkOHEIag
	 3LZ4b6fgVU10pb3GSvjoJm8hJWl/S7vrhtH2e0Uf+4Kv/apnt894rtVlF7NY28QCRn
	 FEQxcbXwU3nEwrMCKHCaTC0DkmkgTq7QP5JudDMjWDsYQyQ5k5GoCJPnUPTm7erQrl
	 +vN65BoNtUtxRuUdyMVAd0cQoxH9m6dfoVo9ApTyt+yS+krIxzlyJNEtYeyGxAQlVX
	 ZuwY/Y/tglRXQ==
Message-ID: <sashiko-outbox-231994@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: net: Add Cortina CS7542
 MDIO controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-b4-cs7542-mdio-v2-1-30465e831853@gmail.com>
References: <20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.com>
 <20261123-b4-cs7542-mdio-v2-1-30465e831853@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 20:40:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: net: cortina,cs7542-mdio encodes driver prescaler
  limitation
--

commit 04e9a6026303087134e93ed2f1da3b9480cb0d59
Author: Fil Dunsky <filipp.dunsky@gmail.com>

dt-bindings: net: Add Cortina CS7542 MDIO controller

This commit adds a Devicetree binding schema for the Cortina Systems
CS7542 Clause 22 MDIO controller.

> diff --git a/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.ya=
ml b/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml
> new file mode 100644
> index 0000000000000..77b5e2f09f423
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/cortina,cs7542-mdio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cortina Systems CS7542 MDIO controller
> +
> +maintainers:
> +  - Fil Dunsky <filipp.dunsky@gmail.com>
> +
> +description:
> +  Clause 22 MDIO controller. Firmware configures the MDC prescaler before
> +  the operating system starts; the driver retains this setting.
> +
> +allOf:
> +  - $ref: mdio.yaml#
> +
> +properties:
> +  compatible:
> +    const: cortina,cs7542-mdio
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-frequency: false
> +  suppress-preamble: false

[Severity: Low]
Does setting clock-frequency: false, omitting the controller's input clock,
and describing how firmware and the driver handle the MDC prescaler encode a
current driver choice into the Devicetree binding?

Since the CS7542 MDIO hardware has a configurable MDC prescaler, the binding
should describe the hardware capabilities rather than driver behavior, so
that device trees specifying the input clocks or bus frequency do not fail
dtbs_check validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-b4-cs7542-=
mdio-v2-0-30465e831853@gmail.com?part=3D1
