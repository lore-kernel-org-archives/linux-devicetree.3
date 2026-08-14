Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1E426ED59
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 22:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786747256; cv=none; b=nrnVEiS09H5ha4b4bxzcdozTa1GBk8ivHB1q+cDmp1g6GmJrYIpaYQIPVRTnioYIzqmjBvkPlsn1lDy6RJIA42gHnlhHQD6Nr8OyEfUlz5ZTFpI2dJ7vELjeFST6+HjkbGAqeA0tqK27ieUa+wX9YN3sDm2j+nQJjvXTqxcU7/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786747256; c=relaxed/simple;
	bh=ZWartToHNYnJ6GJ9i7YMo91CyjmYa5HxYkEUvHGjyds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=snDZgfvCr/FHkGqiaaeVLlk7Ibyinjjeh606m+GdmE0cCTzkoXjT+tG4IMQk59gPbfM4cbN2FCrzqwYzsDHgNc/jCzmsyx43zxUqzvFQQVVoFjiVVJ7Vww0huSH8+gf5PPoNt0gKZPzFxiGeo2Kt8OWhlGCHiTQl6QTb0r2wBSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJz1tW3G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJz1tW3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6C31F000E9;
	Fri, 14 Aug 2026 22:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786747255;
	bh=eJY9zQBFbmbfdqahVy5Gl9w7+UslOvwdYTvuEGX9MxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KJz1tW3GYyIpIJqsdkTdTBYRCm0UyG2aPKwmT/LcndiKwiOmnxX+HP9p2Wf5Jc1HH
	 nUQhqi64jsKbWa96vSH53Zpmvh4Oz+iPbZDivsGwf+ECP75SV1+sY22cPVJkv/J3No
	 A10SV1CA9rrXDd5QX+rL+qnbQEogLcAkl8be/4WX2m7rgqUPAjSsRbNHxM55rOzri0
	 J+bW315bvJKueCf311SCHMlKXBdzpDvq3/NkDT7YcONtAEbMvk9hv5zKFyRf8p4++D
	 II23zj4UZeYaYtYePFIahEP7dWYIeMoF64t6v3OqlOjpQ5L2mZOf5a2UTkA/fu0Wmv
	 5BK5mUBm+pwaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Rivera-Matos" <rriveram@opensource.cirrus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
References: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 22:40:54 +0000
Message-Id: <20260814224055.3A6C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unnecessary use of a child node (`sync`) merely to group configurat=
ion properties.
--

--- Patch [1]: [PATCH v2 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC propert=
ies ---
commit d073a7883f1698278c7c1d6cde1ee5dc878931ca
Author: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

ASoC: dt-bindings: cs35l45: Adds SYNC properties

This commit introduces support for the multidevice synchronization (SYNC)
bus by adding properties that allow for the configuration of the device's
transmitter IDs.

> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
> index 70f6c62aedca8..f64ba8c872b95 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml

[ ... ]

> @@ -53,6 +53,29 @@ properties:
>      maximum: 3
>      default: 2
> =20
> +  sync:
> +    description:
> +      Multidevice synchronization (SYNC) bus configuration
> +    type: object
> +    additionalProperties: false

[Severity: Low]
Is it necessary to use a child node here just to group configuration
properties? In Device Tree design, child nodes usually represent distinct
hardware components, sub-devices, buses, or standardized structural elements
rather than serving as logical folders to group related configuration
properties.=20

Could the cirrus,sync-lsw-txid and cirrus,sync-sw-txid properties be placed
directly in the main device node instead?

[ ... ]

> @@ -155,5 +178,9 @@ examples:
>               gpio-ctrl =3D <0x1>;
>               gpio-dir =3D <0x1>;
>            };
> +          sync {
> +             cirrus,sync-lsw-txid =3D <0x1>;
> +             cirrus,sync-sw-txid =3D <0x1>;
> +          };

[Severity: Low]
Similarly, does the example need to encapsulate these properties in a sync
node? If the node is flattened in the schema, this example would need to be
updated to match.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814223456.6111=
60-1-rriveram@opensource.cirrus.com?part=3D1
