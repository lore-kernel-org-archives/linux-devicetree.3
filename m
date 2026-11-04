Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776967;
	b=k1nymbl+pPXwJ1bPpveW7/YFTZajPImMHdmWDSTsLEyryCAis2p8is2uJnuPcVwVUE8k
	 tTNQY7sUMRk9CY6K/mW7u8IYpKLyGqrquZ9+pC1yGrXoQPKI7c+Ei1sHui+dbFCEH/nZO
	 Gt2b09u8CkU/AkTpB8MiHe6PyKU+cHIkcF0qE6EW2ul8TgMc5BWRsKyQcDQgXJyQY4b3A
	 LRI1FSsGpcesgwIo+sI6xMGpIFW6w7t7uolFCN47yaJ0kHrGOuTS1wtSx6PqU6ASIpMEy
	 DSwXJj6B2S53Wmx6loHt11XxNNRd5anLh/vbfIiwFXjQc8dAXq0iTwsuUmAOOxsdctA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776967;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/9jz584ynBu7Sj7Ps+BcnxDJbg/SJ0jjq9P9M+C3V3Y=;
	b=f1XM8eAEt9OxHq9+oCsTI8a/2c+q5W/cOHjpRgwodBzVByc7GWW3ovhyfm4E9xJd/Hb6
	 KQZQolypN4mgPvdjbpo+IWCFyckgul20UZ4mb1JNqsHFLn7BuOqeJa80qqFP3fZQ6V21U
	 Ac3hbRf9MJCjFBZpaaqN7Mb2xank0NjELMi7UD6Itt0rqoDUMNi+nvtFFXvh8VfUPq9lD
	 ZsmXuZj1MMZTNyrSTu3yoPcCjko466x6fLkSfIZAdCzTpLHZGr4YYBJucM+srd2Ex2iMg
	 42BVB1nG/lBUAJiEuVRI2E+aiTmXyBbhkCFsz5JIqvIDk7Y6UplzIkmfnxJt4k4TiUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePMyMMdo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3467606A33B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePMyMMdo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052431F00A1C;
	Wed,  4 Nov 2026 07:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776967;
	bh=/9jz584ynBu7Sj7Ps+BcnxDJbg/SJ0jjq9P9M+C3V3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ePMyMMdon30PgoY5hLv+8Y2mN8q3A4t6qfdzqX+LSFqxqduT6YFyRAJrh4ZuV7xKR
	 1/9v21VWKF5cS1b8aB6d0SYXTLztbH0QkYpHBVjdV6gXcafBDn65IPHA1u3GiHfm6y
	 z/tpTrMvNFFSa0L8JgQGQ2hpD/045FQ49G2Gwmhe61/VqQvmy1QbD46+ec/YsYTX9S
	 mPSx8PmLmumMqkvbNrZDnz65oDHedoIRd3viV3Assr2yTgzuuQedemnYKGFgA5Pd7V
	 FYMzIRQ6kBPLA6lz/20D0nQYd291Qy6uZou33NHaaCj4fYnoEkREAQNNgNL5dWWBSg
	 Z6erdvzjDdo+g==
Message-ID: <sashiko-outbox-196784@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mips: Add Siflower SF19A2890 based
 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-sf19a2890-mips-v1-1-eae80820af68@telaak.dev>
References: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
 <20261104-sf19a2890-mips-v1-1-eae80820af68@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:22:46 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: mips: dangling drivers/gpio/gpio-siflower.c in MAINTAI=
NERS
--

commit bd8c11a7f9d608cf21a8f34b06b16b91d2058197
Author: Joseph Telaak <joseph@telaak.dev>

dt-bindings: mips: Add Siflower SF19A2890 based boards

This commit adds the device tree binding schema for Siflower SF19A2890
MIPS SoC based boards, including the GL.iNet GL-SFT1200, and adds a
corresponding entry in MAINTAINERS.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065d..2a7a083f2c470 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25698,6 +25698,14 @@ N:	sifive
>  K:	fu[57]40
>  K:	[^@]sifive
> =20
> +SIFLOWER SF19A2890 SOC SUPPORT
> +M:	Joseph Telaak <joseph@telaak.dev>
> +L:	linux-mips@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mips/siflower.yaml
> +F:	drivers/gpio/gpio-siflower.c

[Severity: Low]
Should the F: entry for drivers/gpio/gpio-siflower.c be deferred until
the commit that actually adds that driver?

Because drivers/gpio/gpio-siflower.c does not exist in the repository yet,
running scripts/get_maintainer.pl --self-test=3Dpatterns triggers a warning
in self_test() when checking the SIFLOWER SF19A2890 SOC SUPPORT section in
MAINTAINERS:

  MAINTAINERS: warning: no file matches	F:	drivers/gpio/gpio-siflower.c

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sf19a2890-=
mips-v1-0-eae80820af68@telaak.dev?part=3D1
