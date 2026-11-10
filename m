Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338249;
	b=1eN/rKciTs29yYVfLQlqdtplzu1QY2necTyyZRsBnOoJyrH2zX0DHrIOW7LyRcixha3+
	 2XbSveNr3ndNXgiuOm33vQvmVQZZiwiql+8bkvFx/tOfIY8hEnA+IUYz1oEexUE9vcBtL
	 MWlkEkRaeewHbJynHB8C9+3c8n/sreM6MN8rSwbsp/Isg4zMVCMRTbwHKevkbDxxNGn2m
	 rS4vf/Qim4eiRXDe0L23sfxmDnWhOMQ6znR7d9kHikuzwHOfivFbhLwJ5iMJlHZw+yhIt
	 rmISP7NI0xTOvmzsjfnebooKEjJRpbilxnMCaLwfls04LruzIPkgDylp8FQ+iEArRdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338249;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dv3uaaB6Ui5MANHlkK04nHgEZe3lecoVzFt0iQHdZQ8=;
	b=fg7V1KeXk87blxJLRtWdGq1u8R6Wod3D5KMxPFp61q6W37LJHIMHSEQnJ1KGpEsvKiqY
	 VMU3d2Ff+Z7JW9RYoP4kgh81s12rQShxrxvOBzkAxM+JYSfwv5wjJU2E8m7V2PbOVyrKz
	 nnJa6xYQ/4Tw2aRUXw9aVi/1NNaT7hVWYMCl363wC2VtweKvtABpTPkU92Nz+5dFT9WBz
	 1soUw2estSKXYNwt487S1d8MxBjBdJz4jlntcgeJeOWP34QXgKgvhyft/tKBaJahOEDGN
	 bOIyPZKJG9tRWHiZyv7iATz5jqP2xUix/8BqxhlxlKAFv+QAQgqumqSjOAo8wpi57EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEjnWfWq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38799606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEjnWfWq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978721F0089F;
	Tue, 10 Nov 2026 19:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794338248;
	bh=Dv3uaaB6Ui5MANHlkK04nHgEZe3lecoVzFt0iQHdZQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AEjnWfWqG9Q6RuuyxmvDHcm4Jde2dOy7tvnej2L4V9llUVze4VvcYRH8A0L+KY0wi
	 RY4wUgqM9aSD+Fn+uZNtB0vv7tw9jBTluBUDjlJWSbbLnUsPRSaJR98iorH0ezf+HZ
	 K9rq7n4eAKOeF8kT/czrUN37dGKpIRQmTxk/ri0vzs9rx0CmQ8zbDPrfvyPXPQswRT
	 rS7KGYVjRw+a8XgelQPolE2hI1fB4OaVmtR6stZ9JZNfZYW1Y50KoQoWn7eQDAZtzF
	 kdrL5s2w72LibGdflhh4xakzYz/U6tmLnDS/FSOFpQT/VQsvJGpllNESp67gE93ogn
	 tYHzF6y71YOqA==
Message-ID: <sashiko-outbox-207650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: Convert HiSilicon GMAC v1/2
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109191641.653847-3-robh@kernel.org>
References: <20261109191641.653847-3-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 19:17:28 +0000
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
- [Low] dt-bindings: net: hisilicon,hisi-gmac-v1.yaml omits
  hisilicon,hi3516a-gmac
--

commit ab6f211d13f9c7a3f51fb6e0f45f7089669c73d4
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: net: Convert HiSilicon GMAC v1/2 to DT schema

This commit converts the HiSilicon GMAC v1/2 binding from text to DT schema
format and relaxes the node name pattern in mdio.yaml to allow ethernet
controller nodes that directly contain an MDIO bus.

> diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1=
.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
> new file mode 100644
> index 0000000000000..89ed6ab1905e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
> @@ -0,0 +1,96 @@

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: hisilicon,hix5hd2-gmac
> +          - const: hisilicon,hisi-gmac-v1
> +      - items:
> +          - const: hisilicon,hi3798cv200-gmac
> +          - const: hisilicon,hisi-gmac-v2

[Severity: Low]
Should the v2 compatible entry also allow "hisilicon,hi3516a-gmac" via an
enum alongside "hisilicon,hi3798cv200-gmac"?

The removed text binding documented "hisilicon,hi3516a-gmac" as a v2 SoC
compatible string, and hix5hd2_of_match[] in
drivers/net/ethernet/hisilicon/hix5hd2_gmac.c still matches it, so omitting
it leaves that compatible string undocumented for dt_compatible_check and
breaks schema validation for hi3516a GMAC nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109191641.6538=
47-3-robh@kernel.org?part=3D1
