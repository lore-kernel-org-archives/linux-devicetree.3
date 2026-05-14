Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A5231AF2D
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 16:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778777893; cv=none; b=RicNC354QozQ3oTfvRUlrObNdxnbDmc8VBOV1QKPqV0elZqUzqurcpz0KzdBsczDExjepTdqCeTGgYL/y9laCKy6rtXOSncs39U4zQ86td1IWMDwgHbJ898H1vfGpw2GEZEITAoMuRmnoBT3PXTpiciwjcuv6X9+sIyPusT25ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778777893; c=relaxed/simple;
	bh=gEJYTff5KkuHuN2JJ4XpcnxcZ3VQ94Vt8bozEYt+fis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lz1xquOlh4IMDennrql8PjMhKQrrrZKE09S1dz0lsAXCYbdoq9m5njniIyZs9jj3YMLB+75x63vTuIynxt7DoWUIwwp9KRT+T5oUZUxUcYYMbea/aZ5xIKN3Q/Vy+KLYNlpfwjF+8owB/wMDKxiIAhFKSfvii6evbM1LnIq0W7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VD9BnXIC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VD9BnXIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D578C2BCB3;
	Thu, 14 May 2026 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778777893;
	bh=gEJYTff5KkuHuN2JJ4XpcnxcZ3VQ94Vt8bozEYt+fis=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VD9BnXICJhzMXgy0t/5rILrv7uOG9eazm2ex9GJHr2xpv07MBoX9upZS3DsovxraO
	 vaCVJepPf2IIR+2Ri9JYEiQzmzyAMQKWW8zCit31gyxJcPVf6T7L6AgGjD//V+rbat
	 V1A60gknr6IpNIZgQ+oW4p31Ff8J/slKDb60xJhEZEeC8cF1Lfkwbyh2WzaOsS7Dwu
	 ab8KKX+PJiHA8tbDMB2RxTSrLbysRhwKtATwCQDhNP+7KRCWY+AlzLP1GfNqEbGDjf
	 IX6+2D4RQKOaHIjkkwr/usisSGpzqQlHBvQdGZt550G2F1PZQRu/iGN9KmAQL1wfWt
	 okLLAL+KKnw3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: display: bridge: analogix-dp: Add
 data-lanes support for endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514070133.2275069-3-damon.ding@rock-chips.com>
References: <20260514070133.2275069-3-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 16:58:12 +0000
Message-Id: <20260514165813.1D578C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The patch silently adds a deprecated top-level `data-lanes` prop=
erty that is completely irrelevant to the analogix-dp binding.
- [Low] Inconsistent validation constraints for the `data-lanes` arrays.
--

commit f1eb1174d9c0a3dbfb4324c331483cad76c51c68
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: display: bridge: analogix-dp: Add data-lanes support for endpo=
int

This commit adds data-lanes property support to the port@1 endpoint for
physical lane mapping configuration in the analogix-dp device tree binding.

> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp=
.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> index 62f0521b09245..a82f9b7776c0a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> @@ -36,19 +36,35 @@ properties:
>        Hotplug detect GPIO.
>        Indicates which GPIO should be used for hotplug detection
> =20
> +  data-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    deprecated: true
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      maximum: 3

The commit message states that data-lanes support is being added to the
port@1 endpoint, but this adds a top-level data-lanes property marked as
deprecated.

Is this top-level property addition intended?

Looking at the analogix-dp driver history and earlier analogix_dp.txt
bindings, a root-level data-lanes property does not appear to have been
supported previously.

Does this remnant come from another binding that was accidentally copied?
Leaving it here might pollute the schema and allow invalid device trees
to pass validation with just a deprecation warning instead of an error.

[ ... ]
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Port node with one endpoint connected to a dp-connector node.
> +        description: Port node with one endpoint connected to sink devic=
e node.
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]

This isn't a bug, but the valid items here are restricted using an enum,
whereas the top-level property uses a maximum constraint.=20

If the top-level property is removed as suggested above this inconsistency
will naturally be resolved, but it is worth pointing out in case both
properties are kept.

> =20
>      required:
>        - port@0

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514070133.2275=
069-1-damon.ding@rock-chips.com?part=3D2
