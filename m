Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAC7331EB4
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110665; cv=none; b=rjLNTuLWk8qNNMxHjEQKt670rWySTsdiwOzGr3Y5WDGYZ09C+qou6T78lPe+nvrGYbLaGp5QlGmWvrzXlWVi+vqBVZtERJXlnk5bFjjEi0lEnlwIs4wh3wYFCjyvJeaS3dDjV2THuk+1ot+ieNEUD45lxzSGeQB8w6tNjebiAvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110665; c=relaxed/simple;
	bh=zQx7zBaGL7r/ZENxpj5peY8oqbcBQ4UP5rjKkzrxw9U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KDedbi/RxaVrNR6HSba4e20K/L5PoNz9CWT5QkADTYHl/WGrbNKkqeoMUofxChVTWPa5FnTLTxT5ZHxaZ4OApYhA52XuHJ37EhPk1TLbHWnqmOOHRwH65Hrwn5bb2elrjliUY8Ovcjd1Ic013CyrM1979Lpl7510qOq+N3sMDLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxAOfnY9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxAOfnY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9374B1F000FF;
	Tue, 22 Sep 2026 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790110655;
	bh=aE4VN3PaEhS2/labyEAErQSWe0WL0wa79CAuXQb0A/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KxAOfnY9KXXkIx6oafSb0rk5URIzMOqF2YRgZrCWfe+3P0+2QZxKv0ycqrxOwosKd
	 37TdAQ5goeM4JFhjJyp1I5U3zjVufvkPMRvVd8Ni4Tovz4CdMb42O05unSLWRQ5tea
	 APNKhCNuWG+mzc2N6hBItPg2BQnoQ8ow/XIK2iA4EYcXaE4TxeXuv/7UditupL9/an
	 8XF6v/fZKIBybGoGB9fOryo5LTfWPXCw8qOPdGcflGDmYtczUoRUKTjYbm5RD2F1Y5
	 T0KJq1wB8aMo1ofZooOWfhE0lMGtIpufORfEVIZp5kEcjFFO/Nkt/xdQ9lCT2SHEGO
	 wyuHovlLkodMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 18/27] dt-bindings: gpu: panthor: Document AW
 assignment DT property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karunika Choo" <karunika.choo@arm.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922204535.2850094-19-karunika.choo@arm.com>
References: <20260922204535.2850094-1-karunika.choo@arm.com>
 <20260922204535.2850094-19-karunika.choo@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:57:35 +0000
Message-Id: <20260922205735.9374B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: gpu: software resource policy in device tree
--

commit c9c432471efad1a2abcbaf062de9fa8ddb5708c3
Author: Karunika Choo <karunika.choo@arm.com>

dt-bindings: gpu: panthor: Document AW assignment DT property
   =20
Introduce arm,access-window-mask property to allow partitions to define
the assigned access windows at probe time.

> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbit=
ration.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitr=
ation.yaml
> index 9ea2b4bb9a344..4e7933829e2be 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitration.=
yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitration.=
yaml
> @@ -52,6 +52,15 @@ patternProperties:
>            Hardware partition control index. Must identify a partition pr=
esent on
>            the GPU and be unique among this device's partition nodes.
> =20
> +      arm,access-window-mask:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        maximum: 0xffff
> +        default: 0
> +        description:
> +          Initial access window assignment mask. Bit N selects global
> +          access window ID N. Masks must be disjoint across partitions.
> +          If omitted, no access windows are assigned by default.
> +

[Severity: Low]
Does this new property improperly introduce software policy into the
hardware description bindings?

Encoding dynamic resource assignment with arm,access-window-mask in the
device tree dictates software policy rather than describing pure hardware
topology.=20

This restricts the kernel's flexibility to dynamically assign resources
based on runtime workloads, as it forces an initial hardcoded allocation
upon driver probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922204535.2850=
094-1-karunika.choo@arm.com?part=3D18
