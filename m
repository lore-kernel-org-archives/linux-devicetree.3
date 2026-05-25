Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA29340281
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704139; cv=none; b=A8NkQbTAWRFjeJKHVt0iKzSTsVvX7IKuchSjHyS7CZuYBv0Y3xmpS/UjsoKtCRcobUHdmuFEwfpiKJBMz7jisAqMTzJkoW6ZAhfMEYWXHd+Qh5oBSHd+x/pnUCqaRwpLlnBThS3v9SZoJ6IL8AjyUgDhZJGl6xnQcRNALIfywbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704139; c=relaxed/simple;
	bh=ZxEKZRA6GVFgRKI9JiiQsOynJiRLTSLdj1iDKKe40Jw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eIYR22Lxt5wBIbENrbQZrQ6PJfbI30ivfZ71AbS5EJNSMq2IK65pdgrrO64LTBDUi5yl0ioqotWvJqVh6OHk/GkdinqzQby+G+zcWpgoLm/lEfolRUQ0pvcpOkBHmsr/hi88yYcbjBJ8EKm4EwTvNVOYUeqmpDoZfX1B6iggI4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhE5Z2bj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhE5Z2bj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273521F000E9;
	Mon, 25 May 2026 10:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779704138;
	bh=J3STuHteXxTeNg1JsFeL6ZAgowgfzPpAmL4IilJ0uPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JhE5Z2bj6WHar9rmmWRfY6sI5MIwFKWIk0VEGIVLr9r6nf0Iv29WnZNnLbpnBEYpD
	 ccf4F8ji8XSWcMkFwrhfTurzTwe2TWTS9TH8bmZ4SaHegdyohC9x3VUOubOo0eh6vE
	 fyzXiq627lz0sjCTMo7VDP7jM2b0sCYftbhcB3L2P0JJdZCwNHXOng3Os2D+XewOkB
	 BOfaFjUy/Tzg7Gi7t7FaEoxtgYPATn1eJ67qbepPo3HkcdmAIRt83Nim1DHXopFZg7
	 b9Ywy7J74ysrS6wPX1QPE74HsIFlNAfuiJKEyGVsGYhPzszF3xilYk4uThk4eGfd+R
	 MqU9UUq18fbGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: analogix-dp: Add
 data-lanes support for endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525094731.121380-2-damon.ding@rock-chips.com>
References: <20260525094731.121380-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 10:15:37 +0000
Message-Id: <20260525101538.273521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML binding change applies constraints directly to the exac=
t `endpoint` node name using `properties: endpoint:`, bypassing endpoints w=
ith unit-addresses (e.g., `endpoint@0`).
--

commit 3468102ebc8a5b81fae59974120da2cbf68d87d7
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: display: bridge: analogix-dp: Add data-lanes support for endpo=
int

This commit adds data-lanes property support to the port@1 endpoint to allow
physical lane mapping configuration. It documents the property bounds and e=
num
values, and adds an example to the rockchip-specific analogix-dp binding.

> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp=
.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> index 62f0521b09245..ecf206871cdde 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
[ ... ]
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Port node with one endpoint connected to a dp-connector node.
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Port node with one endpoint connected to sink devic=
e node.
> +        properties:
> +          endpoint:

[Severity: Medium]
Will this successfully match endpoints that use unit addresses?

Many device trees for this hardware use unit addresses, such as endpoint@0
under port@1 (for example, in rk3288-evb.dtsi and rk3288-veyron-edp.dtsi).
Because this schema specifies the exact name endpoint under properties,
it will bypass validation for nodes named endpoint@0.

Should this use patternProperties with "^endpoint(@[0-9a-f]+)?$" to
ensure the data-lanes constraints and unevaluatedProperties: false
rules are correctly applied to all variations of the endpoint node?

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525094731.1213=
80-1-damon.ding@rock-chips.com?part=3D1
