Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4962F1A267
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785676900; cv=none; b=J0CqfJ8cdG5LEt3EQVJAc384ItR+3gmQ5V/9TPJ2PKZNihQ30CUALRmiQgHlvgzQeTFVzT5NzZLS5WxBUu9VvQSNhd1/diH9zbMaIM6sbcblR/8jEnSekDY7Ak/DHyDfKOWLzkZgJbolYmShAH2GAqcuA2r6DdqAL4gWZztAbmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785676900; c=relaxed/simple;
	bh=k2KJ8CS0fRRvyKW0lMhVJkNlMQWOGkX9zEmqM96V8Ew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FYJbtoGeSkoRguQqCH/kL3Nijdv1/84E3fLJDnoyVwxK3p8d8PnRvQ1QbfGrcnlcB+5s6ZTwWuX70BWFopq0Z39EskLUgthfacIdejLTIGKCxrSa7hZfUrH5dGv0yJnWDl2znqPJOTeuvTmCoF3+tXDI6WKzFAiLm1dcCsmXVmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRoL94sa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRoL94sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEC61F000E9;
	Sun,  2 Aug 2026 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785676898;
	bh=c7FKAGoIvFsK5S5A9j17hNfrxW0xR0Ay1z3FTO4WOIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FRoL94sam2Wqd4jjvCArougHEAdkRkmDKH4e61itLccv9DuLbLk/uX0uG+wl2Rhfx
	 RxMAWm6Scu81ok5M7p+v/d0PNpCQ/Ttvo9iu8reEAxPB3oYhqj6l1w8MjBZALujxMt
	 efml2fw7iQbDsRWm8RI+V1QJVU82NuZDCGtKzDXXPlrSot3gk57mIecgaRlvwpH5Gh
	 ZLlgwxaJ61mftbuqvIz09CAfDPEz+M0t4VKjuQ8mfu0Gx4S49CkNqMSCrHBCpugPus
	 PbzDmqYSdUf3MTkYvadUAcr4PLmLpOZGro2ZHBtSod4C5swxS+PuFQfC2TuihA2QzH
	 pn6EmfNoiH4LA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260802-i2c-qcom-slave-v2-1-27653118fa75@oss.qualcomm.com>
References: <20260802-i2c-qcom-slave-v2-0-27653118fa75@oss.qualcomm.com>
 <20260802-i2c-qcom-slave-v2-1-27653118fa75@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 13:21:37 +0000
Message-Id: <20260802132138.ACEC61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `pinctrl-names` property will reject device trees that speci=
fy only the 'default' state because it is missing `minItems: 1`.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: i2c: Add Qualcomm I2C target con=
troller ---
commit 3beba2240037bb340190bec9ca3218b520506b95
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

dt-bindings: i2c: Add Qualcomm I2C target controller

This commit adds a new device tree binding for the Qualcomm I2C target
controller, a dedicated IP distinct from existing master controllers. It
documents the required properties such as MMIO region, interrupts, clocks,
and interconnect paths, as well as optional pinctrl states.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml b=
/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml
> new file mode 100644
> index 0000000000000..1e34e874cc4c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml

[ ... ]

> +  pinctrl-0: true
> +  pinctrl-1: true
> +
> +  pinctrl-names:
> +    items:
> +      - const: default
> +      - const: sleep

[Severity: Medium]
Will this strict list reject device trees that only specify the "default"
pinctrl state?

In dt-schema, an items list without an explicit minItems defaults to the
length of the list (2 in this case). This makes both "default" and "sleep"
mandatory whenever pinctrl-names is present. If it is legitimate for a
device to only define a single "default" pinctrl state, would it make sense
to add minItems: 1 here?

> +
> +required:
> +  - compatible
> +  - reg
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-i2c-qcom-s=
lave-v2-0-27653118fa75@oss.qualcomm.com?part=3D1
