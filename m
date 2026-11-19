Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111389;
	b=28AuPJ2FtTPPK25EbyDO06a1HCuY0TSkX+dqOMvqhh0DVGvExgrF5dfUkg07Gz3vhDJm
	 CRBK5f9G0tY5VrWBFQyrIrR1t/zBD2eLLs1L+SqW1MOAiEgYSP5gvfeagYVAtJvzrgwTj
	 a8bWbLmlNePQ2kyFiEevIKV1zwYsDNOqC9trm4J9SEY8TwQlLcdUhOtrA0dr0T012cetl
	 PjHaJNIoxKY5IzOlOfmxvDpOlLMNRTBjP+K2mnFf5bcqpadsSzBAk708gm2AAZwl2aiFk
	 ebq0mIxFDvEo0bzFn+5OmjZs2zeE2LMmC12wWvWdTERvK73mYh+y7p9q+UOkYun4w4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111389;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+Pn80E8d5gsVFjBGmzCTzCOc2lkW7/bLDVKxQoCqa3Y=;
	b=NIeId3V6UQlsZ8ePf645oXZXhyPa11/bIuDDwTa7rmPP7KLr/MW+uBHelBjWRUnmMAle
	 O0Q2R4QWgY6DzvpxcPPJoGgxhdyLafDCCCimrfTasUAXdXf5DOW/nK+DcFwqiB6AY9HqL
	 CFdN1l9NLQmlpW8GxfMfeFsXhD/zpMvqC5/vBqmy7ZOT7bBpolaDTzMlDRzx7BRVMTZJD
	 TFBMicn/Zuq54Pa1RcRjFxqu3O0rx17TCh3ky4Gk9CUCeCD0N9NyhgkNMqZ5BfgLzUNEA
	 ezetaYX6GwRICoToBzhpqRBnTK8SehNwuHCqiQa4AIJfgs3A6t7mol+93pHz7d/1IfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AHGWrLYc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9A9606A33C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AHGWrLYc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A951F000C5;
	Thu, 19 Nov 2026 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111389;
	bh=+Pn80E8d5gsVFjBGmzCTzCOc2lkW7/bLDVKxQoCqa3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AHGWrLYc5KYq9SfO0BcHIXNljW/jc9R+kYEueUjYeO3ebcBywmkF3XYhB8LHTJiwY
	 e85hnHZbgblO91zhWyPNMRHr0VKRXJEUTAt6kJnnO4UjGTUCuumGuL/LS4YkwnQlSh
	 /hOhBxx4Les50pzz4nBH3ZAjfhvHLaLbSOgjU/5r9tibiAzYwaStJTXyuNxHyboKHo
	 r8mvENAbmbQhuTfapyTpzKb8pgh2rdNM417lM5i7OeR/H1/F9VYBCF7gIJePG7t2A6
	 iVWMnCMspsz7ecjK0YR/w64eYOhb0kC0OwXqzBr4sbNgtUQ9d59jVO+7BmaGmSgRVZ
	 FoFFSyBthO9XQ==
Message-ID: <sashiko-outbox-223749@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH wireless-next 07/10] dt-bindings: net: wireless: add
 XRadio XR819
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Heymans" <arthur@aheymans.xyz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119175002.458988-8-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
 <20261119175002.458988-8-arthur@aheymans.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 18:03:08 +0000
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
- [Low] dt-bindings: wireless: xradio,xr819: missing
  wireless-controller.yaml ref
--

commit b88f95dc24f2d5de0e0e72e80a5e05cb457e6ac2
Author: Arthur Heymans <arthur@aheymans.xyz>

dt-bindings: net: wireless: add XRadio XR819

This commit adds a DT binding schema for the XRadio XR819 SDIO wireless
controller and adds it to MAINTAINERS under the CW1200 WLAN driver entry.

> diff --git a/Documentation/devicetree/bindings/net/wireless/xradio,xr819.=
yaml b/Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
> new file mode 100644
> index 0000000000000..4f6919b6bcbd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/wireless/xradio,xr819.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: XRadio XR819 SDIO wireless controller
> +
> +maintainers:
> +  - Arthur Heymans <arthur@aheymans.xyz>
> +
> +description:
> +  The XR819 is a 2.4 GHz IEEE 802.11b/g/n controller connected to the ho=
st
> +  through SDIO. Its out-of-band interrupt may be connected to a host GPI=
O.
> +
> +properties:
> +  compatible:
> +    const: xradio,xr819
> +
> +  reg:
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  local-mac-address: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: Low]
Should this schema reference wireless-controller.yaml# with
unevaluatedProperties: false instead of listing local-mac-address: true with
additionalProperties: false?

Neither wireless-controller.yaml nor network-class.yaml sets select: true, =
so
listing local-mac-address: true leaves it without its uint8-array type and
6-byte length constraints from network-class.yaml, while additionalProperti=
es:
false rejects other standard properties from wireless-controller.yaml such =
as
mac-address (which of_get_mac_address() in cw1200_sdio_probe() checks first
and which bootloaders populate via ethernet aliases).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119175002.4589=
88-1-arthur@aheymans.xyz?part=3D7
