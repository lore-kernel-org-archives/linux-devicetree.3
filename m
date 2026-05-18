Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7506A4048B0
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107011; cv=none; b=Czg0OMO/0jh4W3uJogQY5CTQcFgeoJHKD2RCeogr+ALJuIvItGF2sC9ksjR+hHhT9S1uGKFPDC5fg1DGgxqb2YTVHIEULxTd2NDnyYRNVdb5ew6Yhv6tue54gHqXMDw+snuPPITONe/7iI61Hy8EONspXzOy4fdprtg7nvjn4+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107011; c=relaxed/simple;
	bh=usTofiHBe+VOrGvgSKALrk7cAdaELwleZ/gsJ3VfXWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Anzh9yqPdmu6TL5ieLGALrgIqySj8wcjKRbWVif7cYlqm9FfwWDYwEKpmOOrVnXILHmoF0tECDevWmy+eYtzrvX9Qo4dl2Az1uoPkHNNn4Ic/x8lBwuEYInLRQ2Mg4qEjnWzOTP2Cdd1rTz6gSxrnmeJfHM4jWvP4zqvJc3Q2ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxPaS36p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxPaS36p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE713C2BCB8;
	Mon, 18 May 2026 12:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779107011;
	bh=usTofiHBe+VOrGvgSKALrk7cAdaELwleZ/gsJ3VfXWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mxPaS36pEv8Wkx3Fl02K5yg9+3vlsp1R2724GV7W2hm22KBdXAnxmQIh53gsng2fC
	 TWNwc1SgFEU/mleUvzA0CsHUr1aVxbyeTY6Q2N6SuNfXGjygnEXvIkvAkkGQeZRJkL
	 8upEmn2e5BqQsdj6n620Nj4tz9VaN5bGZ6Z2/whTwziBDZYBixXLCDbMVZQgOszV6V
	 BSWtBVgmZLkB24QMlB/arf1ylYbXKICpPFQpi0Behw2NpvFs5KSh+e14RXUT+q6acM
	 TQ+nW7UYEAQviziYGIv/8prqaEmR192lJxJfDjeXnkq3CbKvhQS+zLRrnkfAgU+3aL
	 YDEon8ugaDJiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/10] dt-bindings: firmware: add arm,ras-cper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-9-42698675ba61@arm.com>
References: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-9-42698675ba61@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 12:23:30 +0000
Message-Id: <20260518122330.CE713C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `memory-region` property uses a `oneOf` block with multiple `it=
ems` lists, which causes a meta-schema validation failure during `make dt_b=
inding_check`.
--

commit c89aa0b853ed683df337769736a4dd661095a6ae
Author: Ahmed Tiba <ahmed.tiba@arm.com>

dt-bindings: firmware: add arm,ras-cper

This commit adds a new DeviceTree binding to describe the Arm firmware-first
CPER provider, exposing the Generic Error Status block and an optional ack
buffer. It also adds an entry for the binding in the MAINTAINERS file.

> diff --git a/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml=
 b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: arm,ras-cper
> +
> +  memory-region:
> +    oneOf:
> +      - items:
> +          - description:
> +              CPER Generic Error Status block exposed by firmware
> +      - items:
> +          - description:
> +              CPER Generic Error Status block exposed by firmware.
> +          - description:
> +              Optional firmware-owned ack buffer used on platforms
> +              where firmware needs an explicit "ack" handshake before ov=
erwriting
> +              the CPER buffer. Firmware watches bit 0 and expects the OS=
 to set it
> +              once the current status block has been consumed.

Does this oneOf block cause a meta-schema validation failure during
make dt_binding_check?

In dt-schema, standard phandle array properties like memory-region require
length limits to be explicitly defined or statically deducible at the top l=
evel
of the property definition.

Wrapping the items arrays inside a oneOf block hides these constraints from=
 the
core meta-schema, which prevents the tooling from extracting the implied
maxItems and results in a missing maxItems validation error.

Could this be simplified to use a single items list with minItems: 1 instead
of the oneOf block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-topics-ahm=
tib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com?part=3D9
