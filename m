Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793273954;
	b=eFhIg4Iiz5BQ2Lp6QEltGE42IMhsuVonlCEyo9kmr0akVCFSbAM8I2/Y1g/8xl/g3DSb
	 HV27cMdvPn3cs1yG2q9DnGIy83QjzXRuzCeDDvB60rMXYvU7NMsvRZ9FoC7b80bWSDJc7
	 Dh5oN3NtKMk3Ay4ZSWXA1SsL2fmYkXiyec4uTFXvD7qY1bUcikeZb8z/OQkqe2yXeYJid
	 k1pNd+kf3daoGYQJRdFP6StZMgk52dD6A4yiAO/5bt1iR+2F7dsI7XPohHVy3LAddWuGx
	 mnCcQpSh6s/4u4ui7wJkUmeiA8myFcIpJ2QX6i+2NCN+l6/XF0ycOwxk9h5Ogzf44xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273954;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6++6VMZwrXUxUBmgEuk2YEHt6xp2N43QVeKs+TeqBOo=;
	b=DNheFfrtgCGujhjxEZFkv69c9a6FHPDR9hrN9Kd/8rnDMN5C6GSO2Lz8XUlaDEnYwjCQ
	 DhQh87tIqht+2tXuy2x4XsgT/oXJyihXeWdAxMK6KK+SGCYx6NrFn1g3W0Vda/Mc9yDAa
	 PHLRoyYxMgbi6BK+DB0gqwY0vLhhcZDcaohS1ZYkw0Iotqy/vLJjmoThfYafpV8BXy40D
	 rTVBtl2m1tXSNC/VjCKedNexuSs1kvFCg3v309sTouj348yno9tcYC8gfkMSTa9cgOyvy
	 wvuUYeJKCjDJzOa8pIKzuOeUBaR60uvdNuGVj2i7jMquItNA+JwUYoaHXAlHZ7AiZPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eF2kxukI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD499606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eF2kxukI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EC01F01825;
	Thu, 29 Oct 2026 11:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793273953;
	bh=6++6VMZwrXUxUBmgEuk2YEHt6xp2N43QVeKs+TeqBOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eF2kxukILNozB1jBo5kJBlI6ywYj8D9oqyvZPyPLIoAuOSvkH9WkC/T4U96zC5GDq
	 adu0EWWmwPLHLk07esnIkYVbZ/NCb4JTwtBHCD5LaFsgLCBPQKyb7dAS0nTM7/sixY
	 OemQsIbmuSBE3nczbv5542b4sRL5JM0WhZ0FcMOUDL2hjvbyS9tzt18RnP+nBqmSwv
	 YDiltn9mYmQtvgoO4VfR3TqcjTWbIj7iqPRXTxhGG7ndRAcYDLWqGBeJ+RURp99roH
	 zx4c/oz30DcwkrhXPtGHoP84e3C8xHvcsh47/h+cX4FZckPmxiZ/Xc2gjrygx3DrcZ
	 l0MTVwRSaur1w==
Message-ID: <sashiko-outbox-189204@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] powerpc: dts: Add support for WatchGuard Firebox T30
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lefteris Koutrakis" <lefteris.koutrakis@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029112742.10238-1-lefteris.koutrakis@gmail.com>
References: <20261029112742.10238-1-lefteris.koutrakis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 11:39:12 +0000
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
- [Low] dt-bindings: vendor-prefixes: broken YAML and pattern for watchguard
--

commit 00a5866796adbcc672fe6cb4dfd1295ffc4e930c
Author: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>

powerpc: dts: Add support for WatchGuard Firebox T30

This commit adds initial device tree support for the WatchGuard Firebox T30
board, enables building firebox-t30.dtb under CONFIG_MPC85xx_RDB, and adds
the watchguard vendor prefix to vendor-prefixes.yaml.

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba20029693734..73b6cdf72b8d9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1995,3 +1995,5 @@ patternProperties:
>  additionalProperties: false
> =20
>  ...
> +  "watchguard,":
> +    description: WatchGuard Technologies, Inc.

[Severity: Low]
Does adding the watchguard prefix here break dt_binding_check and
dtbs_check?

In Documentation/devicetree/bindings/vendor-prefixes.yaml, this entry is
appended after additionalProperties: false and the ... YAML document-end
marker, which causes dt-doc-validate and dt-mk-schema to fail with a YAML
parser error.

Additionally, entries under patternProperties use anchored regular
expressions and are kept in alphabetical order:

  "^waveshare,.*":
    description: Waveshare Electronics
  "^wd,.*":
    description: Western Digital Corp.

Should this entry instead be placed alphabetically inside patternProperties
as "^watchguard,.*":?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029112742.1023=
8-1-lefteris.koutrakis@gmail.com?part=3D1
