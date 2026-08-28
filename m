Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AF53B14BC
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912008; cv=none; b=M9jNDpCgYwPI2ZOEBsz2IrhvpKVrz6yaPBYHA/8MWqKUUKHjSxlaTaSsbIHZlnezqQ0/XVtY4meqKhwFh5oGdsyex5xN8UoTT143DUHvF7gObtk/7jTCyftHhjDiwb786GLQyzwNKAafyzsJ7z+1C2Ws+sq8vmCUgKFw0Wnpj8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912008; c=relaxed/simple;
	bh=5eRbIFWzDLpxk1mb+r8+weV3Mo4gZDUA1iNFeCxVux8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XJZb3AyW99jNzg+EYcu8KZzcT3+m+IguYULiH1oP2bqDyx0yVF7b1rD+MWktqcim3Uw6asCanW/NRcj4G3pBhk8J2bLx7npQLvEKrD3tOWuQp6VH1xcQ7zvZUZGZ4mDNxdrduTV9WKrZO9fj98rAGkLVtPOGqnWw8Ow4g+78DnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iv22HHNN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iv22HHNN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3361F000E9;
	Fri, 28 Aug 2026 10:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787912007;
	bh=oVZ2TIyp6j6jztQqy5lxwEvhHd6GuXOyZMFL5p5Lt7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iv22HHNNFP4GQEOfXPf3tWDKzDeT3LYwkKQwO2j90BSMxdSXIwcox8LQy2GozDH6k
	 Pi5lWWAozXcIH3SH+2BbT8TF0RHd1N28R2IeaxVEz8yPc1rBbmiNd69fKCGNqefddT
	 Wrx0fALGSqSC8YoAgl7FmjVVtF9Vl4HJoCJ/WEs+1eR3iiaGtB3ktf05kyfwebCSkP
	 oCxitDbh7CjHk3yXEjgUkYMYdWrw4ZDJMFAfwNunZEqo6GYfPlfhwbKd5JRUG1oMYi
	 EtzzsiSLlmdhlrvut/4nWiLOF7XnxAXP0LqXh3pBuaFD1BAIVyPrIlA1dcA35qRXoW
	 N9+ovK7Q/o4sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mux-controller: ti: add binding for
 event mux router
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rahul Sharma" <r-sharma3@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260828100615.1700223-2-r-sharma3@ti.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-2-r-sharma3@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 10:13:26 +0000
Message-Id: <20260828101327.0A3361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Type conflict in `idle-states` prevents usage of `-1` (MUX_IDLE_=
AS_IS)
--

commit 62dcdc2062832a1a63ed2621fea7779807b815a5
Author: Rahul Sharma <r-sharma3@ti.com>

dt-bindings: mux-controller: ti: add binding for event mux router

Add binding for the event mux router of TI's K3 based SoC AM62L.
The TI K3 mux routers route GPIO input events or Time-Sync events between
peripherals instead of routing to a CPU.

> diff --git a/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-rou=
ter.yaml b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.=
yaml
> new file mode 100644
> index 0000000000000..a5ba7f78a1567
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml

[ ... ]

> +  idle-states:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

[Severity: Medium]
Will this uint32-array type prevent the usage of -1 (MUX_IDLE_AS_IS)?

The idle-states property is locally typed as uint32-array, which conflicts
with the int32-array definition in the base mux-controller.yaml included
via allOf.

Since the property description explicitly supports -1 (MUX_IDLE_AS_IS),
dt-schema validation will fail when a device tree uses it (either because -1
mapped to an unsigned 32-bit int exceeds the maximum value for int32, or
because a signed -1 violates the minimum value of 0 for uint32).

> +    description: |
> +      Idle state for each mux control. Each entry corresponds to a mux c=
ontrol:
> +      - 0: clear masked bits when idle, also refers to inactive state
> +      - 1: set configured value when idle, also refers to active state
> +      - MUX_IDLE_AS_IS (-1): keep current state when idle
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#mux-control-cells'
> +  - ti,reg-mask-val
> +  - idle-states

[Severity: Medium]
Does making this property required prevent users from working around the ty=
pe
conflict?

Because the property is mandatory, device tree authors cannot bypass the sc=
hema
validation failure by simply omitting the property to achieve the default
keep-as-is behavior.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828100615.1700=
223-1-r-sharma3@ti.com?part=3D1
