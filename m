Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24CE37F01A
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714131; cv=none; b=lkaUCyh4Xke+L3KPgYWRTV1baVNq8Mmc0mZbvCwrE/6E/A4YMTfzeCClnhDh/mmydDMrAx6iB93A8HjKHRLC4VLFoArYgITsHF3whTV6ERZP79B3SvWKVnaN0QiP0e5N+zxv1vqkasKQhEddOcZsT0kSkhRop3H84XUKKmdb7Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714131; c=relaxed/simple;
	bh=EGuRcxNwY1pXDHR8FBOwuViWJIEsMLhXMkrzssKjVcs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DsjM5XqdHUnkRWOKRxK/P4suiInLurJKqn/CoxpIN0iM/izhe1trE9GcRuFcIHT/DcNJv2mK+FmfHSA6jXoA67GpslEATcnqizwf1uoTdXj4XT3zGibkB6ymuMs2G6sf5Amf9Z6JZK+yD20/ZWikEo4+tUaz/DBKrK8ikWV9ph8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGhPSlLh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGhPSlLh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D7F1F000E9;
	Mon, 25 May 2026 13:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779714129;
	bh=z97M4R3Eu8pc76Fk19cHSasjm8W9AxXN6VIxRl7Bh98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nGhPSlLh9gU/3MPbjOIduPNKEUKCSe6ygelCx1uxBpIaG9T+6E1qz3uCdome9HXhm
	 kmIiWRwyOGNGuj2Ti8kkXVZ7wFYSsGY010KtE2EZE/kD8A488PGUAWLUD9eOKMy0Ix
	 KOaZviu+EDHOm0qGa0bXmmJBoeSyOCE93pOtoiwHdLdP+NVUO34rgVnBXsxRfJL1Sg
	 Ig54zP+O9MMXfvm4K1qKiceB3WKqCKghL607HVS3dh1bd+QQjfBJsfUQdQynfpI1p9
	 aJyfcRPaNbtYzcwGu9ViDZZXFa5yFwE/Sn1FykgMiLjAonF7lSSc4C0MsSyGBtjeM1
	 VR82lSAXtewNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: add Realtek RTS490x I3C HUB
Reply-To: sashiko-reviews@lists.linux.dev
To: zain_zhou@realsil.com.cn
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525125128.297-1-zain_zhou@realsil.com.cn>
References: <20260525125128.297-1-zain_zhou@realsil.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 13:02:08 +0000
Message-Id: <20260525130208.D0D7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The binding supports configuring target ports as GPIOs but is mi=
ssing the required standard GPIO provider properties (`gpio-controller`, `#=
gpio-cells`).
- [Medium] The commit message claims configuration properties that are miss=
ing from the schema or incorrectly described.
--

commit 7ef74db38a704236da2879cdad3537af86a4d897
Author: Yin Zhou <zain_zhou@realsil.com.cn>

dt-bindings: i3c: add Realtek RTS490x I3C HUB

This commit adds the device tree binding schema for the Realtek RTS490x ser=
ies
I3C HUB devices. It describes configuration properties such as LDO voltage,
pull-up resistance, IO driver strength, and per-port operating modes.

>     The binding describes configuration properties for:
>       - LDO enable/disable and voltage level per port group
>       - Pull-up resistance per port group
>       - IO driver strength per port
>       - Per target-port mode (I3C/SMBus/GPIO/disabled), pull-up,
>         IO mode, SMBus clock frequency and polling interval
>       - Hub network always-I3C mode

[Severity: Medium]
Does the commit message accurately reflect the properties added in the sche=
ma?

The schema defines IO driver strength per port group (e.g.,
realtek,tp0145-io-strength-ohms) rather than per individual port as claimed.

Additionally, properties for 'Hub network always-I3C mode' and 'IO mode'
appear to be missing from the schema definition completely.

> diff --git a/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hu=
b.yaml b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> new file mode 100644
> index 0000000000000..851a433abcd3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
[ ... ]
> +patternProperties:
> +  "^target-port@[0-9]+$":
> +    type: object
> +    description:
> +      I3C HUB target port child node, named target-port@<id>.
> +
> +    properties:
[ ... ]
> +      realtek,mode:
> +        enum: [disabled, i3c, smbus, gpio]

[Severity: Medium]
Should the schema define the standard GPIO provider properties here?

According to the dt-bindings subsystem guidelines, when a hardware variant
introduces GPIO provider capabilities (as enabled by the gpio mode here),
the schema must include the standard provider properties gpio-controller
and #gpio-cells in the definition and required lists, as well as in the
examples.

Without these, unevaluatedProperties: false will reject them if provided,
and dependent drivers or subsystems may fail at runtime if they are omitted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525125128.297-=
1-zain_zhou@realsil.com.cn?part=3D1
