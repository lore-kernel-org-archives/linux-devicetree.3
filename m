Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFAD322C88
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775610; cv=none; b=Tomk/vOmIJQgC6sEGg5hj972m1MCGpe0drtoufN850tWcEar++203kJkf6qCTd95kGCezW6XayLbQjMdVbbfx8We1pjUGw+eNyge4Yp3+vJ5JGng0jY/uNT2wy7ijNDmlz7sdUFdGyqzKZTUgw+7ASL2hMqIvHrxeLGBGq5Aeig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775610; c=relaxed/simple;
	bh=0rQPA8qjE6ICixfxUUoagENaw8882jE82NAIz6pGqFQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DB6sHnRqC1r7UAVh3f7GdRXfonqP3TTtc5tmXehP3plGF+TFClw8KALia5T76F4xPSrMhd1J7bvN6NEqehP4p3YPjBK0ZKhxPElG93LEBrp3o4t/be9zhAI/YPHEivOTZTESMeQ+XEGrbagD8NHcbPK/WOutum4KkGI3PzfVH04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fj70pcx0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fj70pcx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBE6C2BCB3;
	Thu, 14 May 2026 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778775609;
	bh=0rQPA8qjE6ICixfxUUoagENaw8882jE82NAIz6pGqFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fj70pcx03G+Nvg+uaJnkGTg4Q3Q5UxIq5ayHVpjlZSY6VCeqP7F/iKT/kLiiJ+K/8
	 /vtmq0xlGlb/TWKwPkQ18lt4vkMa003cylVj2zpBJujFsScGN8d+Yc9km01U+DEqYe
	 Ak8yw/7N91+ZoEoALXJD7WWZzNxDJOUZi+JfpGVoiUwplNf+u8Sv8uEJbay7DKXhCR
	 5W95c4hY355Ec2n42eziWjuNfcTx/bNt7UfiTmyu3qepP0BcZk6SqJLea2hKxUcsD3
	 JdXjADPaYpGQngESn307mH79JWn2wvGrHWOhgI4PY1YbVS4MtdGRpsg5rJFXyAFoKI
	 SIrTYIFNyPQng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: display: rockchip: analogix-dp:
 Expose inherited properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514070133.2275069-2-damon.ding@rock-chips.com>
References: <20260514070133.2275069-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 16:20:08 +0000
Message-Id: <20260514162009.3BBE6C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Redefining inherited properties as `true` is a redundant schema =
inheritance anti-pattern that weakens future validation.
--

commit 6cdf876f78b231fc30c12abedc12fb6b25fa8e18
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: display: rockchip: analogix-dp: Expose inherited properties

The commit adds true values to several properties in the Rockchip Analogix
DP binding schema. The commit message states this is necessary to expose
inherited properties to satisfy unevaluatedProperties constraints.

> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index d99b23b88cc59..4118b87b8dc53 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> @@ -49,6 +49,13 @@ properties:
>    aux-bus:
>      $ref: /schemas/display/dp-aux-bus.yaml#
> =20
> +  reg: true
> +  interrupts: true
> +  phys: true
> +  phy-names: true
> +  force-hpd: true
> +  ports: true
> +

Is it necessary to redefine these inherited properties to satisfy
unevaluatedProperties constraints?

The base schema analogix,dp.yaml already defines these properties. Properti=
es
evaluated by a $ref within an allOf block are automatically annotated as
evaluated, which should satisfy the unevaluatedProperties: false constraint=
 in
the leaf schema.

Could redefining these properties locally as true introduce a validation
regression if the base schema changes in the future?

Setting them to true translates to allowing any value without constraints.
While the allOf intersection currently enforces the base schema's constrain=
ts,
if the base schema is later refactored or removes one of these properties,
this leaf schema might silently accept malformed device trees instead of
failing validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514070133.2275=
069-1-damon.ding@rock-chips.com?part=3D1
