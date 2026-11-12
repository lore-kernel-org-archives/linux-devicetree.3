Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504035;
	b=WVW5QJiH9DR4+vektC46zlo6f9ncFsZn8qHDgrWpHoBRalvHQcaHmHxcz+sYuhpcFLMi
	 1h+4PS/+QsI/O6xC2KPj7tUOUK/IREFCtmFKEL+ek5e1JZo6/MCktPVV5/8fyh8asK0Pn
	 7L0dLbqB9jTqwZS6s0gzOTDuLKZONd1zbcaoZoEE1nnGp8Ebz/q2iO39acaf7g5kB2uSf
	 qY6/4DirgOh3aFTpbyLwPybD2icIrrjKSKUnwwFNonQF6+aRi58+RCAaCBXVsHLRCDwTM
	 3VTkCZ5cEcXBJglC5QfsDPf5tui3cgfHaNEVAQriXcckMUVRp5xOvEk6FCVeiRHfZng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504035;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cC4lvDicJQYHil0JjwXQ9y1Yb8Y0z5XYyrnSTft8fVo=;
	b=mwncw8dgtX/dHfzwOEGhFc2++Z97h3q62/pgGDh1esg+kpmGbkH0gXiB8sBJGqjMwBEO
	 uCIgEbJgC+8O35hQQ6Nzq8aT4THz5KM9qlumwqHP31TgQh91YmfufeATyBZ/hHjN3JcC6
	 3kZ7EHC3w5i4uCkbb5/lWYKs/whVmkXa0Ze/14e55fEqqlQXEK0D8f6ePV+8qYiXPcYXS
	 C95tQfj/ch6bbCD+Xh/advxQAHtjKR5qDS52hCTyuLuTBBpYw/0W30tBE8Pvkm+ihc54B
	 hTahtbnOwAUMRhibqokhDtlebbmEwrsu04T+mFs6zddNZYGCRoVHeSRqcG9q6KVeEIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKNqNq2l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB2C606A327
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKNqNq2l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F931F000C4;
	Thu, 12 Nov 2026 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794504034;
	bh=cC4lvDicJQYHil0JjwXQ9y1Yb8Y0z5XYyrnSTft8fVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fKNqNq2l6BQQrGTd+Vl1wMeWEnMVmL8kWRrD7Er6XIQ3Qb9quc4Z7EJ+C6OXrtKUF
	 Odg6+veAFPOQ9PnozraYxrI22KPH42B2zKEXILWKrYpGiIJQixRi+yd/uDyYQBa8ZF
	 Y3/uMk3R0em++oraAzenWINW6iFa2+U5hLyuicKx3l8y9xh32Lu61qz5LFI92hVLFc
	 gLj647TK14bnxg+y7kNYgOm2K8jwUt1cNsP23JIbLdlGNPYNNSeL2SXLUzoOKX6EXy
	 1zG3wW7VNREEPtoK5zIMNbbwAf//dSHjXe0SO9CYcKq9tJ5UDZiJDlChkCLE2oWtvS
	 gmMZIkt7buYHQ==
Message-ID: <sashiko-outbox-211581@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: power: supply: add Qualcomm QGauge
 fuel gauge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112170841.2189322-2-val@packett.cool>
References: <20261112170841.2189322-1-val@packett.cool>
 <20261112170841.2189322-2-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 17:20:34 +0000
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
- [Low] dt-bindings: power: supply: qcom,qg: unconstrained nvmem and
  schema refs
--

commit 3e127648f3c0c46268041b3bde4ad7d6e88f27b3
Author: Marc Lainez <marc.lainez@gmail.com>

dt-bindings: power: supply: add Qualcomm QGauge fuel gauge

This commit adds the Device Tree binding schema for the Qualcomm QGauge fuel
gauge block on PMI632 and PM6150 PMICs and adds a corresponding MAINTAINERS
entry.

> diff --git a/Documentation/devicetree/bindings/power/supply/qcom,qg.yaml =
b/Documentation/devicetree/bindings/power/supply/qcom,qg.yaml
> new file mode 100644
> index 0000000000000..79dd18d878793
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/qcom,qg.yaml
> @@ -0,0 +1,105 @@
[ ... ]
> +allOf:
> +  - $ref: /schemas/power/supply/power-supply.yaml#
> +  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
[ ... ]
> +  monitored-battery: true
> +
> +  nvmem: true
> +
> +  power-supplies: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - monitored-battery
> +
> +additionalProperties: false

[Severity: Low]
Should nvmem specify maxItems: 1 instead of true, and should this binding
use unevaluatedProperties: false without referencing nvmem-consumer.yaml#
in allOf?

nvmem-consumer.yaml is a base consumer schema with select: true that
dtschema applies automatically, and it only constrains each nvmem entry to
a single phandle while leaving the outer array length to the device
binding.  Dropping nvmem-consumer.yaml# from allOf and switching
additionalProperties: false to unevaluatedProperties: false also avoids
having to redeclare monitored-battery and power-supplies from
power-supply.yaml#.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112170841.2189=
322-1-val@packett.cool?part=3D1
