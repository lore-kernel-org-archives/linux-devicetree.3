Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392693;
	b=X4FtJlO4jEQ05s8XEe20MsZTUZX0FqcbsJR9vPvpsSCZAPKtTGuVxk/4N4bB79IWsVpj
	 D/wR74lr/hapoSVuQNBmV4Gvv5CSXmAby+YE5o46RsBu1oA91VdtLHcKSzKlPyXh94up8
	 wJbqDpSy9SGbm0HmPA5V5vqU/Sm29oMYQmbQV5kOn0t/hcWI/BAQPsuuUP/yjY+rQSEyh
	 zCWhLMyC9rnfWmj6R6PQ7bGUDOrgQQoMXcuAeOjzmTlMqt7CegxUJWEiJ6hNQWtmeb80J
	 8i9YJ0I7n9hudJLeFV6MXDzJLE8xhPVNa+DU6rLIWr9L6AyPlV62gaR0ahlh7BpxRVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392693;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TY4dDjhHgFMMencCQ8Bi6MCRa6S9pmKclpSVGqOSWLo=;
	b=LUCVhhHDAj9mSaBeetxTendBc60S3jh4uhrqbbQvAo7I0H8e19yYYOFUBLnbE02IafEm
	 y2BdtLKf7GLJEePjrVVAeymx+GIaawsCKeE+Q85kRm4dM5WGPRvId7TfYKD0U8S2upAC8
	 +Ryd52IgdkIk4mvTEyYUG9aHjiaOpLuXUAArgY4ayyA7u40IbKqUkaQIgYfiM5Ce/TVqx
	 w5A7s/Z2YAVBDL+Txk+DKk3DNSSM/8/Yp8zEciqzX2iHDvdQIb30yNXLKgYvmoRRzTOoS
	 +MXTc9N6i51p0MZ/eEk3i0LAW4XgMnORnoRlmAJUcOqzVRXf0wuxlwKFqirhdg4SfbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kq6WR806;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E26F606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kq6WR806
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C6B1F00A05;
	Wed, 11 Nov 2026 10:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794392692;
	bh=TY4dDjhHgFMMencCQ8Bi6MCRa6S9pmKclpSVGqOSWLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kq6WR806c7qHokwiZwZyQ6E+HgQQUCf3MkgfS+J4T/l6QEhA9C6I8BfcEDeyXwrn/
	 N+YWGZGsTKlcMl27W+Avz62ayhZJCw5x7ayGIiRZPkaEnoBqdtzgbNvmCn/S8FyXPX
	 BdSFQxi1sKqudKACC49vGY7nqc7o5cvPAfk2Q7KRN39OWSjHp0qBkAHjL4yKHCRi3l
	 qhWU4mo1Gz1L+88wby8HStrrtlconQJyYgEzJALm4LHhKpRSHXHbQ30CjMVqsqJ0jv
	 FWsopCzyAZfcNqiMr/BlktyCG90pNlqy9rSNShHIipOYHdYs4dhbpCj26BKBZimz2U
	 boakxQRcmbuYg==
Message-ID: <sashiko-outbox-208800@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: memory: tegra: Add Tegra114 EMC
 channel registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrick Fischer" <admin@tsv-stahl-riesa.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-upstream-emc-t114-v1-4-54d9e1bceb6a@tsv-stahl-riesa.de>
References: <20261111-upstream-emc-t114-v1-0-54d9e1bceb6a@tsv-stahl-riesa.de>
 <20261111-upstream-emc-t114-v1-4-54d9e1bceb6a@tsv-stahl-riesa.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 10:24:51 +0000
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
- [Low] dt-bindings: memory: tegra: piling Tegra114 conditionals in
  tegra124-emc.yaml
--

commit d5391965f848eab5127dd4add5fff242e933a0a0
Author: Patrick Fischer <admin@tsv-stahl-riesa.de>

dt-bindings: memory: tegra: Add Tegra114 EMC channel registers

This commit updates the Tegra124 EMC binding schema to allow two optional
channel register blocks in the reg property for Tegra114 while restricting
Tegra124 to a single reg entry.

> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,=
tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nv=
idia,tegra124-emc.yaml
> index 8e0c67d671f91..c9335483ba850 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra12=
4-emc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra12=
4-emc.yaml
> @@ -25,7 +25,13 @@ properties:
>            - const: nvidia,tegra124-emc
> =20
>    reg:
> -    maxItems: 1
> +    oneOf:
> +      - items:
> +          - description: EMC registers, writes go to all channels
> +      - items:
> +          - description: EMC registers, writes go to all channels
> +          - description: EMC channel 0 registers
> +          - description: EMC channel 1 registers
> =20
>    clocks:
>      items:
> @@ -218,6 +224,9 @@ allOf:
>              enum:
>                - nvidia,tegra124-emc
>      then:
> +      properties:
> +        reg:
> +          maxItems: 1
>        patternProperties:
>          "^emc-timings-[0-9]+$":
>            patternProperties:

[Severity: Low]
This isn't a bug, but would it be cleaner to split nvidia,tegra114-emc into
its own schema file rather than adding more per-compatible conditionals to
nvidia,tegra124-emc.yaml?

nvidia,tegra124-emc.yaml already relaxes nvidia,emc-configuration to a 97 to
143 entry range and uses an if-then block under allOf to require
nvidia,emc-bgbias-ctl0 and nvidia,emc-cfg-2 only on Tegra124. Widening the
top-level reg property and constraining it back in the conditional further
diverges the two variants, whereas Tegra20, Tegra30, and Tegra210 each use a
separate EMC binding schema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-upstream-e=
mc-t114-v1-0-54d9e1bceb6a@tsv-stahl-riesa.de?part=3D4
