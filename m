Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BDC4D2EC9
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070373; cv=none; b=We4+jVf1LVKv7RH5ErintZ/+ETMYG1b8i0hN9jJFgS9Ac9svYKr1ZjBfOZZpEp+bKuARFDD9/esJzXW6dHm4bRuCwzPLAoQMqQ0Fs3eW2a3OSu1qehYH4LKEinDCu2qdDuPu9vwFWSbfQXwOcuQU9LTr/YpTkZjnzC20RjaOw5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070373; c=relaxed/simple;
	bh=AmgA5sEM05+tN+N24S14zGv5qmItVg+7oNbk/ZnbEzI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sf+CQqBq6gbt0GbVpNkuAFA28ACEdCpzKlzdSvMED++04JpE0P8H379pJ66Tsat0u8FmRuu0xvQqT7EHt52q1Wa8ovB0cVWYQkPhZZpjdd8PQ+VsR6/El9PkyA8mjlUbRetierF/Dek/NblsZ+/k0vwR5gtR6juKaAGr/oRqsTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyJIM/je; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyJIM/je"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777CF1F000C4;
	Thu, 15 Oct 2026 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070371;
	bh=mvKd9jrJvgWPw8ad+fO9cuyDgq0Tz0GKqKc/MFd0MU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DyJIM/je9VTvN/GGG8MqmN+5sko8Zs2+vjLqXS8N3zxEJ2pfiAHvI9/Oj/+GFcO6+
	 zdE4BvbtTea76Chls9s3MILfdDaUY0LkdBLG8PvskwiV1eNVaOVpUJa3DNm0YHdTWZ
	 eU/tdp/oXVEcuhRoIRTtjn8+DhjhbNGjh1kzD9OWGhU17pz7TptqiHWSfhx7kfz9Sh
	 cw381pjKsvzZEa+9PLni1uBfBz36cqzKOs4uurlQ1a6TxmVy4ZfNBY3NqQmvTLKFwH
	 dEPAJ8ZTS25+sGOoakN3TT0C7dIVIjLLNhW+n1jy/Hew7YnaiOrVBhSG1B5wR+QpOY
	 y1GIUcdofUIDQ==
Message-ID: <sashiko-outbox-172911@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 04/13] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Disallow ports beyond port@4
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261014131906.990077-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261014131906.990077-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 13:19:31 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: net: dsa: incomplete schema validation allows bypassin=
g port restrictions via ports node
--

commit b100423001348cf87abe9e11b4f74d424451c2db
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

dt-bindings: net: dsa: renesas,rzn1-a5psw: Disallow ports beyond port@4

Restrict the A5PSW ethernet-ports node to ports 0 through 4, matching the
hardware configuration of four external ports and one CPU/management port.

> diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw=
.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> index fab6aa6237e93..c5e652c057a94 100644
> --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> @@ -61,7 +61,14 @@ properties:
> =20
>    ethernet-ports:
>      type: object
> -    additionalProperties: true
> +    additionalProperties: false

[Severity: Low]
Does this schema allow bypassing the port restrictions if a device tree uses
a node named ports instead of ethernet-ports?

Because dsa.yaml allows either ports or ethernet-ports, and the schema
doesn't list ethernet-ports in the required properties, a devicetree could
define a ports node with a port outside the 0-4 range (e.g. port@5) and
silently pass validation.

The driver in drivers/net/dsa/rzn1_a5psw.c has a hard dependency on
ethernet-ports:

drivers/net/dsa/rzn1_a5psw.c:a5psw_pcs_get() {
    ...
    ports =3D of_get_child_by_name(a5psw->dev->of_node, "ethernet-ports");
    if (!ports)
        return -EINVAL;
    ...
}

Should ethernet-ports be added to the required properties list to ensure the
validation rules are properly enforced?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014131906.9900=
77-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D4
