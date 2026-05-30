Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D871C31282F
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 02:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107274; cv=none; b=tna7CdO/ONVAZq3ybHRVYMJcX2GCV895ks65v0QtLhKIecJhXi+yUNRucFN+N/FO294P+3EqA+D9XxdylxfEzFLxB3iIvjdZvqqjOIdI7kKaJ7lpZgilMWXyFs08Bxv6VSX2OLhGjPfPw4KnH0bOxfPLEYB6+jw0fSIY8EbavwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107274; c=relaxed/simple;
	bh=6RD6w6nMPWm8uMNOS7GTYbwMTpaDZ7SXbDkkzCoIBOo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CKPRdBWj0ecbYgtXKxGIlHQ1XmdEoV0ET6E7MjB688PygIgpVQewtftsFqnW7VYRypXASUnaA8oxirw9sVkd7lbiAeEQcwarD83hgAdmN3GwLrevcGIWx7RYNoGVyB+CLTsq6XQ7frLgkvVgltXid6WnkPZZ8wTvmqsk9cOhDNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltVbGei2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltVbGei2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40921F00893;
	Sat, 30 May 2026 02:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780107273;
	bh=UIFn3arw4mZi9lo49f+fbacg10gwBBw0gApTF6fz6/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ltVbGei23P7YYg1Tul/NGdjR/rPEuw3RutUlxzhD6t/w6LJO7itmDwunma70WpoEH
	 N4eO5KewPep9r6AavhjEWNrqHlOVPrsFN2zTTHHtclxoXXyG7MvRYts5LOLJKH6Has
	 7Ypta/HFUis0gYuFKf48LKYe+rkXjlrE9aFxvYU7ZbqrrXiv1QKPuhDJ9jBb+mFeDf
	 W7YXOs04YInyCETGPWanTLIWl+3iXQKSLIq/ptuD3XrwzQnVqLe+1z7bgkQqKbregg
	 9WvCiZ9nKIrgFCgLBDHQADMwN+qdr9njjbH19Va/6tsuXC5fClh/SfeL5GH3QD/WZR
	 0aIp03n7NQN5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst via B4 Relay" <devnull+markus.probst.posteo.de@kernel.org>
Cc: ojeda@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260530-synology_microp_initial-v13-1-aa2bb9c56efc@posteo.de>
References: <20260530-synology_microp_initial-v13-1-aa2bb9c56efc@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 02:14:31 +0000
Message-Id: <20260530021432.F40921F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Chronological fallback inversions for older models in DT bindings
- [Medium] Model prefix typo (DS vs RS) for `synology,ds1221rpp-microp`
--

commit 420a38b2f09dfb652dcda0d1d821575521540bff
Author: Markus Probst <markus.probst@posteo.de>

dt-bindings: embedded-controller: Add synology microp devices

This commit adds device tree bindings for Synology Microcontrollers (Microp=
).
These devices manage LEDs, fans, beepers, and handle power events via a
serial connection on Synology NAS devices.

> diff --git a/Documentation/devicetree/bindings/embedded-controller/synolo=
gy,ds918p-microp.yaml b/Documentation/devicetree/bindings/embedded-controll=
er/synology,ds918p-microp.yaml
> new file mode 100644
> index 0000000000000..eb1c9d3fac074
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds91=
8p-microp.yaml

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - synology,ds1221rpp-microp

[Severity: Medium]
Is synology,ds1221rpp-microp a typo? Synology models with redundant power
supplies are typically RackStations (RS) rather than DiskStations (DS), and
this falls back to synology,rs1221p-microp.

Should this be synology,rs1221rpp-microp instead to avoid establishing a ty=
po
in the permanent device tree ABI?

> +              - synology,rs822p-microp
> +              - synology,rs422p-microp
> +          - const: synology,rs1221p-microp
> +
> +      - items:
> +          - const: synology,ds1825p-microp
> +          - const: synology,ds1823xsp-microp
> +
> +      - items:
> +          - enum:
> +              - synology,ds725p-microp
> +              - synology,ds225p-microp
> +              - synology,ds723p-microp
> +              - synology,ds710p-microp
> +          - const: synology,ds214play-microp

[Severity: Medium]
Is it correct for the older 2010 model synology,ds710p-microp to fall back =
to
the newer 2014 model synology,ds214play-microp?

In Device Tree schemas, newer hardware variants typically fall back to older
established base models if they are backward compatible, rather than the
other way around.

> +
> +      - items:
> +          - enum:
> +              - synology,ds425p-microp
> +              - synology,ds1525p-microp
> +              - synology,ds925p-microp
> +              - synology,ds923p-microp
> +              - synology,ds1522p-microp
> +              - synology,ds1010p-microp
> +              - synology,ds411p-microp
> +          - const: synology,ds918p-microp

[Severity: Medium]
Does this correctly map the hardware relationships? The 2010 and 2011 models
(synology,ds1010p-microp and synology,ds411p-microp) are configured to fall
back to the 2018 model synology,ds918p-microp.

Since synology,ds918p-microp enforces fan-failure-gpios as a required
property in the conditional block further down in the file, this inverted
fallback forces the older hardware to satisfy constraints defined for newer
hardware. This will cause validation failures for correct older device tree=
s.

Should these older models be listed as their own base models or fall back to
an older base instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530-synology_m=
icrop_initial-v13-0-aa2bb9c56efc@posteo.de?part=3D1
