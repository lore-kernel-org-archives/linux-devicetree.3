Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265223;
	b=xYqqqNp4jOEB/U7Orgwi2Em278J2GNCLEdqBtrRpCFJvBF7f0dDvRBJrsN8+ITvHCIHE
	 /Zzc9xNpac3wfZ/GurNpzUxWie99O9peITPtjwmibv7Bo5U30t3urCK83BzcCTbsOdXbg
	 husODdp/Gaq/EA2WwPR6ZND8U8/2n5Qbx+/ULn70iGcAQNhMg+eJff0+f9Zei8K5N93M+
	 Ag3sqNj71jGzWnnYdeRT3h76bxngxoVoCeDn7Vt1oAsN7FiiVPVi+VOh9xhX1WDFrdoe+
	 hOj4iFQ7LGI2TKGYnTo8MWLscb5MAokwLsYZRnVOgb4gavUixIFOhcPC9YaA5728F3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265223;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WS7Bqc8JNRVGdrLnMhu2yajAttB6LARF5REEOKwuVKE=;
	b=AVIA5kTBTORdAHj58t4KyFSr39XZw5lngZss+f5MI8G3ZUP699FJcbYd+tjIVOjzMtQr
	 V4+zaUwT9Wwsa480SXMJdnFUXGPRk50cqRb05t2TvhA+doaPj+WnkX5VXvjtDf/webOMF
	 0xFblR4lrghTrVHqY8JVDnvb2qEobDZ4bd7TKIfiHCFRKn0tgEOb9QK0QWzPtyrlZVJS/
	 WOAFd+wVH4qgLhdF1PIm7jVB0mz92OD51eC2oNRu5HyK/F3OrOoqC0SMYZBKtAjAbL9Je
	 oucPJQDMvuV+BpEiJxxfgEBsmGzRFXOj5tJQ9vbPKHaJMI1d3KTQPpDpUh34G5jzbRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J4IHZF8Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF7606A330
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 23:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J4IHZF8Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693A71F008A5;
	Mon,  9 Nov 2026 23:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794265222;
	bh=WS7Bqc8JNRVGdrLnMhu2yajAttB6LARF5REEOKwuVKE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J4IHZF8QBbPRmDhd5OLOw/fJ44xL/mQ87CaNWoJl5S3swtQsB+EaQAhsBvrQPSI+m
	 7EcDzdDAzIlZQyoqynC46snuPtmj+G2HnHyhmOA6Rg2FZwuwMkoukitl4ezk/XRnlq
	 gTnOfXrP5GCFj4Ira4VkxcV2v9fkaLXTp5rVPlfG00/qGZ7lUs/MARhFNg9oy7ZhdC
	 C+cPwTMufaYIF86N3XRhkrg/B+dF/26R0LOyZs7w2GNO2KXDWNL5+1BHEUiGT1edIH
	 NVjt7cK7Xnp7WBU8v9/M/wU+EgvmvWpakDg0lOj5FYWD+xj9lrbn9K0+hqh2I3c1kd
	 zcs4G9D+fyT3g==
Message-ID: <sashiko-outbox-205780@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: dsa: lantiq,gswip:
 add reset-gpios
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108-mxl-gsw1xx-reset-v2-1-46c1da093893@telaak.dev>
References: <20261108-mxl-gsw1xx-reset-v2-0-46c1da093893@telaak.dev>
 <20261108-mxl-gsw1xx-reset-v2-1-46c1da093893@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 23:00:21 +0000
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
- [Low] dt-bindings: net: dsa: lantiq,gswip: split GSW1xx into separate
  schema
--

commit cbde9490cffae75d1433f9bd1e4ef36f7a9097cd
Author: Joseph Telaak <joseph@telaak.dev>

dt-bindings: net: dsa: lantiq,gswip: add reset-gpios

This commit adds the reset-gpios property to the lantiq,gswip binding for
standalone GSW1xx switches and disallows it for SoC-integrated variants.

> diff --git a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml =
b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> index 49af5573e452d..9a74ea2a6dcdd 100644
> --- a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> @@ -40,6 +40,11 @@ properties:
>        - const: mdio
>        - const: mii
> =20
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the hardware reset input of a standalone switch.
> +
>    mdio:
>      $ref: /schemas/net/mdio.yaml#
>      unevaluatedProperties: false
> @@ -173,6 +178,7 @@ allOf:
>          mdio:
>            required:
>              - compatible
> +        reset-gpios: false
>      else:
>        properties:
>          reg:

[Severity: Low]
Would it make sense to split the standalone MDIO-connected GSW1xx switches
into a separate binding schema instead of adding another conditional
override here?

The SoC-integrated MMIO switches and standalone MDIO switches sit on
different buses and already use the allOf if-then-else block to constrain
or disallow reg, reg-names, mdio, and gphy-fw between the two families.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-mxl-gsw1xx=
-reset-v2-0-46c1da093893@telaak.dev?part=3D1
