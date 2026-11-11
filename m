Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396403;
	b=jvMnvXiapztZx5YZu+gZOagFBBELKnTe3g9s8S7ujKkAxgsUBx2Ok7XYH1pZgaGK1h0e
	 pRUqGH6FtFy5MCSJCeKy9TxNsNNS1QoRP35FoMU7JgUTm+/yiqVNLmgfjLQbhnDxeFoaX
	 kOqsx1xO+/wGCGnMhYEPC4tpK+vhw7rfpgIH5rT0Aef2zc5zYfHoElUeW6vntgEn9B+0j
	 2C1dOZ7qlcjia57mQxUTxPmzFSIsLV76CfsSU0voPd1q6VnD19mB6Azp9iko2uAVrBzMZ
	 nyw3Iuvf4bGn2tchDe10B0yv27irlwbOmQug14iEdr+VGJpT1hrT3ZUkbVcEOALuEtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396403;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rq/0BY92ovll+sdF/Fqt/90gT7zmz+HyIa+ppKfQiuU=;
	b=knZ1T8eCZ+byztFK9YXD0qy853IRaFdozBCUXmQSv2kGBNCc7c7uDO+FDR8Sn76ztaSu
	 aobdPbzXW6NtTsUJXHKYwo9SU8W84RXHMN5xgrg8PiWNiG+hLfsrV+pbfuAFF5eIeQTzu
	 Rsnfcasz9mIULXy+mRIleNyoXP2XhsAfSBs8r4T+VaK9My6Mk6gBSZGnrw6mqOFWgXYFx
	 q+VvVHmmvscRdTMayrX9Nlmb5G0m8RAr88ejiewZSoqmVO0t4eeFCkqMDmhqs5/dp4IQC
	 MrG14/w4jPD50ih24u3hZrfjWP9ITfeRzyqKRQjwrfw9WEAkArzSgZ7lKZEzg7WIJCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VSdkku5v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D621606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VSdkku5v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1861F00A05;
	Wed, 11 Nov 2026 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794396403;
	bh=rq/0BY92ovll+sdF/Fqt/90gT7zmz+HyIa+ppKfQiuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VSdkku5vO2gMghxhrhj8/yxnzIdSzzb62CDtevhBR5+bd2HW5pESc48IK/ihYnW81
	 IIBXQzwmgW5dJNGCqmnkj6nuP+WUrWkdoacT7QeeiVIsNXDVvBPilGVXla670hBod8
	 8sOihVM7+/9Z9IL5dvOi8Fj614zkjYhcPvOUbbXGE+r2tqBFTcZuFdbJS8+2r6OEE6
	 ZYcnkzttt54dQ3zfw7kJOwfQKjifVEjQvL3zHEPBcgzeO7HCvC1/rn0BA+jRiAmBwk
	 cVuow9Vzf/ko7ssQ30HtoO3tcEnnsJbnttqgvv5K7MxfRWmOXsH/RypvzbTiKGjcb0
	 mHXdS/6onQB3A==
Message-ID: <sashiko-outbox-208873@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: example-schema: Show example of
 dependentRequired
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111111403.83665-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261111111403.83665-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:26:42 +0000
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
- [Low] dt-bindings: example-schema: duplicate dependencies and
  dependentRequired
--

commit 1be156d7b94f469cc7bb5216878b759c591f8b64
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: example-schema: Show example of dependentRequired

This commit adds a dependentRequired block to example-schema.yaml to
demonstrate conditional property requirements.

> diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Docu=
mentation/devicetree/bindings/example-schema.yaml
> index b04f3cc4312c0..a37d10ff7469a 100644
> --- a/Documentation/devicetree/bindings/example-schema.yaml
> +++ b/Documentation/devicetree/bindings/example-schema.yaml
> @@ -217,6 +217,14 @@ required:
>    - interrupts
>    - interrupt-controller
> =20
> +# Properties might be required only if some other property is present.
> +# dependentRequired is a shorter and preferred way to express this, inst=
ead of
> +# if:then: block.
> +dependentRequired:
> +  # clocks is not a required property in this binding, but if present, t=
hen
> +  # clock-names must be provided as well.
> +  clocks: [ clock-names ]
> +
>  # if/then schema can be used to handle conditions on a property affecting
>  # another property. A typical case is a specific 'compatible' value chan=
ges the
>  # constraints on other properties.

[Severity: Low]
Should this replace the existing dependencies block just above required
instead of adding a second section for the same construct?

example-schema.yaml already demonstrates conditional property presence under
the Draft-07 dependencies keyword (which is also referenced in the allOf
comment below), so keeping both leaves the example showing the legacy and
Draft 2019-09 keywords side by side.

Also, requiring clock-names whenever clocks is present conflicts with the
clocks and clock-names definitions earlier in this file, where clocks has
maxItems: 1 and the comment on clock-names advises skipping xxx-names for
single-entry lists.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111111403.8366=
5-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
