Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F096175A6E
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 02:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538848; cv=none; b=UNwh/YAcBo1gMqS1ENJyqM2zvCRe12XmFqA3H+OnXRLppF+NyhjBHVVSyITfHjDl7f8htHEUXnNznZpbh7t8XgQgsSUMTH8M/EdbEsihZPbKuQx25OgOiuulx1DZiJwAzSFlPnkXkqhhazvhCT3l1x52+3K5HsJa0TmPqfqmYNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538848; c=relaxed/simple;
	bh=uPQ/LC7XjmZJDqvNF1OgHD9sfsre+CqQmLcQHV06wNQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qQF3NMMdmGS13sZatrHC3TfioOT4nYfUgWtOS0cpd9syS62/+Z4jfc/xXHo4H7sl1ZzMxwnPwNSrRNq0DzMwHXbD/YRlANmMUfNE7OsAPawXWvKaVaSWuG6WBHwY+06B3TZzRLtd3lXn6mcQfrrLTMW5mKPt15caADA6b2tEirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iwf9ipt/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iwf9ipt/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A0B1F00893;
	Thu,  4 Jun 2026 02:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780538846;
	bh=6WkFurCUem9g8lrAbGLGw6sJlyGKIQVkPVUeCs0VNL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iwf9ipt/84pBCl+nVkJLIclMERg9PiaX17CZ7kJ7wsHy3OXBe5e2b9H9ODhL+oHUu
	 R87akv8hL7BO3LX730qpeowL9a50b1JyVBbEWzaw9GovqCBXl6ReWOth1htxG1k95B
	 kTztNZqqDSSaXDwV9u83mcyGBeQWybJWDxJGYoIw+CdapwMGnao+p1WZROeEzvCdBR
	 h56XPJnzQQ1wHHjNPsIFxFgB8P+wMuZL8JeoaDDjxdh/qI1EOiH9mDanrkzwAZ04QU
	 Lm0M8vCSqD9tCb3XqgC3G8ElD0YmVjKDqexIoyLbDVLEVLeP4eZAUFulEvGtUOHP8e
	 Uubz91p5k2unQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: ls2x-i2c: Add clocks and
 clock-frequency properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Wang" <wanghongliang@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604015848.18643-2-wanghongliang@loongson.cn>
References: <20260604015848.18643-2-wanghongliang@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 02:07:26 +0000
Message-Id: <20260604020726.95A0B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `clocks` property is used in the binding example but is not dec=
lared in the `properties` block, causing `dt_binding_check` to fail.
--

commit 2429ce4ee39320cf5271a51cef0c60497b97ce80
Author: Hongliang Wang <wanghongliang@loongson.cn>

dt-bindings: i2c: ls2x-i2c: Add clocks and clock-frequency properties

This commit adds clocks and clock-frequency properties to the
loongson,ls2x-i2c dt-binding examples.

Cc: stable@vger.kernel.org
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>

> diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml=
 b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> index 67882ec6e06af..baa26684bbed0 100644
> --- a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> @@ -33,11 +33,14 @@ unevaluatedProperties: false
> =20
>  examples:
>    - |
> +    #include <dt-bindings/clock/loongson,ls2k-clk.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
> =20
>      i2c0: i2c@1fe21000 {
>          compatible =3D "loongson,ls2k-i2c";
>          reg =3D <0x1fe21000 0x8>;
> +        clock-frequency =3D <100000>;
> +        clocks =3D <&clk LOONGSON2_APB_CLK>;

[Severity: Low]
Will this cause dt_binding_check to fail? The schema specifies
unevaluatedProperties: false, and while clock-frequency is pulled in
from the referenced i2c-controller.yaml schema, clocks is not explicitly
defined in the properties block.

Should the clocks property be added to the properties block to prevent
validation errors on the example?

>          interrupt-parent =3D <&extioiic>;
>          interrupts =3D <22 IRQ_TYPE_LEVEL_LOW>;
>          #address-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604015848.1864=
3-1-wanghongliang@loongson.cn?part=3D1
