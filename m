Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781EE3F1048
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 06:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787985829; cv=none; b=GtsBJ+K1tWWimSOL7WU2yR0SrQiNNZQHjHFVcsxKoSRwC1FjZTAnGkax/B7827x4Nakcnc+y4fxTLyb/CUxLaf8p0tMPnrjip4GKQqDZRoNT9Pl+GlUC+H/wMQR7eyaEGlZS4CwQG1k4SUFuJGOOch0cPINUtjBCD88X5NsCsag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787985829; c=relaxed/simple;
	bh=uImJwW7vh/u2ZEy7q1WuBGCVCt9rL+1nOivWI/9UOyU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JkAC9c1/fnzLiYgdm5cxHFJmGA43ryFU1LBqZegNF/rzUzr7OMHnPu9ZZsjyQo/Yleu2+x2OE0TaVKXCyGtFt0don7Ye1a8jFb1KZtJv3VKZRRnBjtH4LyinNhybZFmcDjJIYrQKCSEgz+RzRYVOwpQx04dcUSw8jlX4NP3C7fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqh+dXdV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqh+dXdV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5161F000E9;
	Sat, 29 Aug 2026 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787985828;
	bh=LGI79hyL9oIr4cETOk4NTq0ScfTS4oCmWuqlDQBw3nM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nqh+dXdVYN/vu5jKeJBZmX/qcZtJ9RNe+6ogAZrbM4Lpp5+yZcxeMBRyho6PLkQMI
	 xWZm0+f4YVf9kll7Aq5uame+Y8P2eo6DqXu6oLmVcN5OKUw7W3VipweEr0egAc7y5x
	 O6pnpnvQx28NC/Crl5fPYAgpHv+3z/rhutxlHSC0NqsTsSsPRZrOGLloT/eIEdmrDQ
	 +dqBCafiU6OuHhLPx703Ch0aQbbCnz+cAfQh1SoE5oGUB7uj9AynyUTEC6f+FILHRn
	 wffRvotYpL4c8qa2K9Jo+obzs4634sYyWdzqfoSOJ8FzvxWXgcfeQpQHRoLHx7wgzl
	 x483O4tESlHhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: add Chipwealth CH1115 OLED
 Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Tmljb2zDoXMgQW50aW5vcmk=?= <nico.antinori.7@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <5e1a01043e1935d59d48630dc6211652e64b108a.1787973729.git.nico.antinori.7@gmail.com>
References: <cover.1787973729.git.nico.antinori.7@gmail.com>
 <5e1a01043e1935d59d48630dc6211652e64b108a.1787973729.git.nico.antinori.7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 06:43:47 +0000
Message-Id: <20260829064347.CA5161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Use of `additionalProperties: false` instead of `unevaluatedProp=
erties: false` restricts inherited properties and forces anti-pattern prope=
rty re-declaration.
--

commit 1beb1f223427bea55378a246f7b9205ba032f851
Author: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

dt-bindings: display: add Chipwealth CH1115 OLED Controller
   =20
Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

> diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.=
yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
> new file mode 100644
> index 0000000000000..6b037c40242ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

[ ... ]

> +  chipwealth,offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 63
> +    default: 0
> +    description:
> +      Display start line offset. Specifies the vertical alignment and ro=
w shift
> +      along the Y-coordinate.
> +
> +  width-mm: true
> +  height-mm: true
> +  flip-horizontal: true
> +  flip-vertical: true
> +  panel-timing: true

[Severity: Medium]
Since this schema includes panel-common.yaml in its allOf block, are these
explicit property re-declarations necessary? They appear redundant with the
inherited schema and can typically be removed when unevaluatedProperties is
used.

> +
> +required:
> +  - compatible
> +  - reg
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +
> +additionalProperties: false

[Severity: Medium]
Does using additionalProperties: false here improperly restrict the
schema from inheriting standard properties like reset-gpios or
rotation from panel-common.yaml? Should this be unevaluatedProperties: false
instead, so that valid common properties aren't falsely rejected during
board configuration validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787973729.gi=
t.nico.antinori.7@gmail.com?part=3D1
