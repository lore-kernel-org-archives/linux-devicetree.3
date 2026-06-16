Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC3C386C05
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641942; cv=none; b=ggZvnxDKOBlA2NZ6rfA/N/bCYoltgYDGX6A4PrMP3VX2L+rDOSuSygwutejlRilb1icTQSjO2a8XrY/nKqhyamBHU+AsydF3CFEzAN44un8yZpUvuTzYo4a81PKlGu2SqHeEpKIh2m9fmcdrBZQYSJn8HHYfVtpw4fzEmIQ4hrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641942; c=relaxed/simple;
	bh=jN9WVE3qrJ+cXWrAZsJ1rKwX9Zx7uQW7k5MADNOwPPs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LPaLMHE1E+/Zh27rQs0sl8Ni3cuXqAQCOZSYhKW9WWlptYyZqCH626vRIGlPVuUdVCa6Wql+Pmf58MGKSG/Gn6oKUri6i6fCoHYO8lH2iavmd5wXZCoOc3HAe9L2Oy8e6x3ZUf8yCE8gkVJdqznswCebaXWXkmUT8zjPCZMF6Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kD0wh4JY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kD0wh4JY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF5A1F000E9;
	Tue, 16 Jun 2026 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781641941;
	bh=vIO52RBmSXn+gYt3hA75Gjd+eciUJmUxRK/V0jAy1d8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kD0wh4JYMx/IhZJBOoC/VkeUvLThhqjx09onCwgWMrdiYL9xx0Lza4Xqj/MTK+fNT
	 9pxw2AYZAUx5+c8ZrXPKoNIDeQecdbJaypRuk3bYSQAB3R5X8G/aYaT0cmsAlRq7w7
	 fkujOc583U2PNaGzPYifKz0ew9yiP2Qh3ksWBWDeRspiAG3QWqgoEJFrpe0/Ee089B
	 4/Mjpi+wgArsSlRjs9HF7glrAVjEoS9H/8nPgIcCVgzFihg8K9JsPk+ubDwi38LOTy
	 NUdFq8QvxDiqiwsunuWCqVHaPk77JyeETm+EsdPhcII1D6gs2PqlHLOiDdtmypPD3X
	 HnBrnKVbpBXRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616-zx29clk-v4-1-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-1-ca994bd22e9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 20:32:20 +0000
Message-Id: <20260616203220.EEF5A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added file pattern in MAINTAINERS does not match the crea=
ted dt-bindings file path.
--

commit ab1e6a61e65e8f9fc9215bf930c7a45ed74a798a
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: clk: zte: Add zx297520v3 top clock and reset bindings

This commit introduces the device tree bindings and clock definitions for
the ZTE zx297520v3 SoC top clock and reset controller. It details the
hardware separation of clocks, PLLs, and documents the available clocks.

[ ... ]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 069b4aa6b523c..96a5f3bcfc06a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3869,8 +3869,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated=
 for non-subscribers)
>  S:	Odd fixes
>  F:	Documentation/arch/arm/zte/
>  F:	Documentation/devicetree/bindings/arm/zte.yaml
> +F:	Documentation/devicetree/zte,zx297520v3-*

[Severity: Low]
Does this MAINTAINERS pattern accurately match the new binding?

The newly added file pattern is missing the bindings/clock/ directory
components, so it will not match the created file at
Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml.

>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
> +F:	include/dt-bindings/clock/zte,zx297520v3-clk.h

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-zx29clk-v4=
-0-ca994bd22e9d@gmail.com?part=3D1
