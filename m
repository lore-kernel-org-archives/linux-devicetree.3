Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430413876DF
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780030023; cv=none; b=mBCqMpYNwpKWcTmzdIhEj/y2Lb7qHI1eoJUBb4jantqllZK9xjbwrERjqJuWQk0EstO7koR43yg8pyO925i5I3V/O6mlsz29FenzfEw1/bpV53TrnLewozOqVBqlpJuSFJQSZ1/j/30D1BmFPhyjGLZT4Wz1MPr67fiQagE+tMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780030023; c=relaxed/simple;
	bh=Do2IHWBGWxpqrZO8nmtOZMQiJ6txQeNsNix9REbI8vQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tWZa4r/gobFzUmYFsXAA6jRt1TGfevtQrfZ5mFJ8sBdVPnxZdz9cfeXqwiPyG0X1FFE6+phCWtwlbY9dLM+icytIZPYmOfz73F0OH56WG5XxQnF3tT1t1B/ebIm2+IVkbnqycrvUqxkkjJqNAYZxmE8T6TGyBkrjrAQtWh4OzCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7mZ38op; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7mZ38op"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6190C1F00893;
	Fri, 29 May 2026 04:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780030018;
	bh=i3BLqhCSaL4AT7hgdw/bB7Vk51Pru9GEc/0n1HfoFpw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P7mZ38opJWuDgAikdOme7YR2D7x7Aj0WrMuKr+HLiyAoeQuDSi/QA0cWGS90cuiTQ
	 q9rDZMWcGJRtv7V5nEYhOjHpcgWM83itGcoWaYPfLiX1B+yvP+GXeUkCQXcshvOrT2
	 Oknrbbg5D+I0T+V9PZug9ZsxfTw5B0bZJK/7O+3bqgeUMp3YRLCGDaoNJCGRWg02it
	 Xrfzq6kT+QKjToIe4xsASVmSCbzeOQixU7K04mWYnUJYf/1zC0N6CN63JoTznkMPLZ
	 ogFNgWnUaTac22BTShl1TRgASEtnEteU2E3DIRjRUsR0d2mAu7tVZOS/LR3Ksc2HX4
	 WTj9TN8ZJvh4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: display: bridge: analogix-dp: Add
 data-lanes support for endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529040530.741336-2-damon.ding@rock-chips.com>
References: <20260529040530.741336-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 04:46:57 +0000
Message-Id: <20260529044658.6190C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree Schema Validation Bypass for data-lanes property
--

commit cd3810bac14e15433ba605ad5fc1eeb8345f5c17
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: display: bridge: analogix-dp: Add data-lanes support for endpo=
int

This commit adds support for the data-lanes property to the port@1 endpoint
in the analogix-dp binding. It allows configuration of physical lane mappin=
gs
to handle scenarios like PCB lane swaps or mismatched pin definitions. The
patch also updates the rockchip eDP DT node example to demonstrate this usa=
ge.

> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp=
.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> index 62f0521b09245..ecf206871cdde 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml

[ ... ]

>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Port node with one endpoint connected to a dp-connector node.
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Port node with one endpoint connected to sink devic=
e node.
> +        properties:
> +          endpoint:

[Severity: Low]
Will this literal "endpoint" property match nodes in existing device trees?

It looks like multiple existing device trees, such as rk3399-evb.dts and
rk3288-evb.dtsi, define the endpoint with a unit address as "endpoint@0".

Because these nodes do not perfectly match the literal name "endpoint",
wouldn't they bypass this constraint block entirely, meaning any data-lanes
configuration inside them will not be validated against the specified enum
or maxItems limits?

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529040530.7413=
36-1-damon.ding@rock-chips.com?part=3D1
