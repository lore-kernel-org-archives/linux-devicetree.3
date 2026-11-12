Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469098;
	b=35C8CxxYu4pNVV1tQJLrrJ0d97vbpygiVfe4wWZFECN9f36ePhxVW5XBqli2syqEbRJe
	 BrEms4qAaDAn7rTi/PTULZKZWdf904vbzl+i2KBNx8DaWtMsXHIVZwzhOSHvYbkG5sjiL
	 P3sq3MahcVshMS+fJ0yUCOqN7e7JJS6Hwu3uISOmZYfAF0MZOiadZkM6mVWG0YkReDqc2
	 x+iZ8DMKIn8RDuCeggwsBEPHowUzdFqbUrpHJVa6JVLUrTuqGKI+UAuVv2NnT5kToO4hG
	 /m2mg3feLrF1gp/iDOijYvaZ8/3WmnfsuX/1IN0lA3vYLvN7R9DC3bQczqJUlsH+Krg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469098;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dkQgB5NoHFevWH7EkgqE0vJLn7G/yTOV13J4t1HJz/c=;
	b=3tHzXChH9dxZLLMGU61N0sAmI8zsMUYgnivIYwaeIBlYl/oQ2h2ydRJXV14f/UZWFEcH
	 gzIFemwxdQz4sPnhj0plytCIN/+VC7ysjPOEWTcNOjcLaA29HQnHl1NisszvKKmeYVycZ
	 s3XpWJSlw/292iNCk/x2xxoccDsbBYjBBQ4P2e8mJ/1jKh2bekCzPvl24wkjgCm55twB/
	 gFhXDnv4oZSLslToGh+WfI41PwmXHecgemBKlNvqAs5XahGcZmIol1WuttZEY75HPiecw
	 ygLDsqZo3GPvTaPzbjJ0YIKA1yZRe03GpWRV/l+NRs6h4c9yhAHixvdvMzNO9jy5jpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERuzX5En;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43453606A327
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERuzX5En
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDC01F00A05;
	Thu, 12 Nov 2026 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794469097;
	bh=dkQgB5NoHFevWH7EkgqE0vJLn7G/yTOV13J4t1HJz/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ERuzX5EnPtbc36aoSv8C6vSaw7qlxR1NClX4657gwOYMFyQ3hO08/Q+rJhGb2x7RH
	 +Udt6I1lPYGX0ca3rMuBqe1d5U5fw5h8lI3krJpSt2FJa+kL6NgjDUx01Yy8Ya9CKM
	 cVwDTzTY/ZsTROyXg6i/nCGTZ4CVg8szlFPHd32y46lmqNYePsyLvlKjMIyNNm6Lcw
	 2PJuNgg9gEocbahMM9wJnHdgDH+89T4+XjY6RflqG3uQAc3wLsOyKV5mW9MRfIyBpq
	 nmgsK69GPIFjcpwcgihZz1XUSKBzoky1m7W1w29paYXI9or1WCE+DJPZlON/L3u5sf
	 HbmESpLdBfObw==
Message-ID: <sashiko-outbox-210620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: thermal: kirkwood-thermal: Convert to DT
 Schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shaunak Datar" <shaunakkdatar@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112072925.22075-1-shaunakkdatar@gmail.com>
References: <20261112072925.22075-1-shaunakkdatar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:38:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] dt-bindings: thermal: scalar maintainers string breaks schema
  validation
- [Low] dt-bindings: thermal: missing newline at end of
  kirkwood-thermal.yaml
- [Low] dt-bindings: thermal: kirkwood-thermal.yaml filename omits
  vendor prefix
--

commit 70c9f13751a18e94c7372bae17a84a1ba365709a
Author: Shaunak Datar <shaunakkdatar@gmail.com>

dt-bindings: thermal: kirkwood-thermal: Convert to DT Schema

This commit converts the Marvell Kirkwood thermal sensor device tree
binding from plain text to a YAML schema.

> diff --git a/Documentation/devicetree/bindings/thermal/kirkwood-thermal.y=
aml b/Documentation/devicetree/bindings/thermal/kirkwood-thermal.yaml
> new file mode 100644
> index 0000000000000..1f9b97bdd48fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/kirkwood-thermal.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/kirkwood-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[Severity: Low]
Should this file and its $id URI be named marvell,kirkwood-thermal.yaml to
match the compatible string and the vendor,device.yaml convention used by
sibling Marvell thermal bindings?

> +
> +title: Kirkwood Thermal
> +
> +maintainers: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

[Severity: Medium]
Does defining maintainers as a scalar string instead of a YAML list cause
make dt_binding_check to fail?  core.yaml requires maintainers to be an
array, so dt-doc-validate rejects this schema and dtbs_check skips it.

[ ... ]

> +examples:
> +  - |
> +    thermal@10078 {
> +        compatible =3D "marvell,kirkwood-thermal";
> +        reg =3D <0x10078 0x4>;
> +    };
> \ No newline at end of file

[Severity: Low]
Does the missing newline at the end of the file cause yamllint to fail
during make dt_binding_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112072925.2207=
5-1-shaunakkdatar@gmail.com?part=3D1
