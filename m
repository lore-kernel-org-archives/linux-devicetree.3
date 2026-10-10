Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56B83806D9
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791614261; cv=none; b=trCm6EUiiT2ZkMf4iSkCrKCgZWsuZFbC/ERiBWe/xQue+LSom65EbH9WdJenuYZbj+GhxNHbVS27C4xPqmbtQ/bJvLbibRaI8hFv1ybtSTZ31Kfh6RbHKh+DeFv9wm3NEvv+LyV6jMwBoAeEMYTWZiUJknZolHZMSqv2BNK6fcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791614261; c=relaxed/simple;
	bh=YVSqoq+0lZ8jo/RPC46rS8xI7QOzcbUvZM3j9dEOv9s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ixMImwcx9T1wC3HzUOiGET0Hpg1yHQKjG6uY9mE5drIjloj4lx8/fpHibMoljGIB6qJauOaX/0LnPgTJTOQvHkMT/oY4bcV02Q6yGke9W0QLSVuieCaFDVIczAnw9SKM1DqcbSjZ87E9UZVQpHJU64xehV7erfMJx3umyrlCuGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HerYiJsf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HerYiJsf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D491F000FF;
	Sat, 10 Oct 2026 06:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791614260;
	bh=Oa1bvfGTFPWgA50vOeGqZdczt77xvNVfeyKbfkismLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HerYiJsfCZ1t3UrlkNoZF+BjCmAOFo5NntuyXMqyEwerCrkHPZpWNIAkKJlNWcAPG
	 UwzZXQLxUw6ePslhruwC8bgrLZ70uqNTXsIXVPe4XnI7OONg++0h+rrgnQFuxiuQw7
	 +Sd0aZ54y2t4eQa0hs37kQuIh+ZyWu7LG/iqvN7QzqlPMk5JsE9cARnuxQxml6n9eD
	 k1Q0eiG1qT056OzxrtPu39u9J7VRwnIr70yl6jHwFqAtCM7064W2LARWCZccs5R04X
	 QBhzohIb/2pSVzMTSwV2RY8qPzenp2U8jvnz8anEEt+ahyWvn9qaca0dxAvMLUzikk
	 yGWxHdybwWQcQ==
Message-ID: <sashiko-outbox-166281@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: rtl9300: add 'rtl9607c-i2c'
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Zavertkin" <misha.zavertkin@mail.ru>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <9a95cfb2f09ec69af02d51d6a71e4f1a7e42cc4e.1791611999.git.misha.zavertkin@mail.ru>
References: <cover.1791611999.git.misha.zavertkin@mail.ru>
 <9a95cfb2f09ec69af02d51d6a71e4f1a7e42cc4e.1791611999.git.misha.zavertkin@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 06:37:39 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: i2c: missing patternProperties restriction for rtl9607=
c-i2c
--

commit 9c59eaea467911b21ec4b5c1d3ef7e034bb19883
Author: Michael Zavertkin <misha.zavertkin@mail.ru>

dt-bindings: i2c: rtl9300: add 'rtl9607c-i2c'

Add realtek,rtl9607c-i2c compatible for RTL9607C SoC, deprecate the old one,
and rely on pinctrl driver for pin assignment.

> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
> index 5873cfdc5b3e0..7c00918f33c8d 100644
> --- a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml

[ ... ]

> @@ -96,6 +104,16 @@ allOf:
>        required:
>          - realtek,scl
>          - clocks
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: realtek,rtl9607c-i2c
> +    then:
> +      required:
> +        - clocks
> +        - pinctrl-0
> +        - pinctrl-names

[Severity: Low]
Does this conditional block need to restrict the allowed child nodes?

The RTL9607C hardware only supports 1 channel, but the base schema permits
any child node matching '^i2c@[0-9ab]$'.

Without adding a restriction such as patternProperties: '^i2c@[1-9ab]$': fa=
lse
to this block, dt_binding_check could incorrectly pass single child nodes
with invalid reg indices, like i2c@1 or i2c@b.

Since the driver ignores the SDA index during configuration, it would accept
these invalid reg values without error.

Could we restrict the pattern here to prevent invalid channel definitions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791611999.gi=
t.misha.zavertkin@mail.ru?part=3D2
