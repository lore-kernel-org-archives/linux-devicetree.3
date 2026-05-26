Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8E93A6B89
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779765992; cv=none; b=QRHmb3LVMJIoj3PCr20Mp3LXxUS2QpkrrXj7j3WqMoEX8HsqTQuysIwvDbIAUuxJ485JPL3tpfraGyTOJV90BgYXis5c+xtV7NYAj4lH4udUyVsz/0wWT3ewEgou/xMQFsWlOSh64z85ImYzgy6hfYF8MzNShTQL+c/LzQ4I4CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779765992; c=relaxed/simple;
	bh=lBFGd9z9gW3uZuM4GSFdaaU8sUrEoX2J93lekIpOPC0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=owbuF2BfB/mAflK5AdYk3xDZs8NZMGKAkR8VnnPLj6NqNwEb6IWqwk8FQKpQrsQyppOpC1ZQkR+KOGOAtB5BK06phsxWHuSPblzRfda8kLwjWvQwwYQ79Lk37TmrNXaTRI3JlCW8kvqHZ8g5hgnGyaHwZbRgFjtEvk0CPlGAtAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUObRhuZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUObRhuZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8434F1F00A3A;
	Tue, 26 May 2026 03:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779765990;
	bh=oKyRRFxUesVe8S8Em3xC5NL4EmTZFmae/pYFNGE4GB8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SUObRhuZ5NSS40VnbhkObr9F9DFvx4brNabfIBj06ibR/zKlMw+dF/9NiL+E4Mn7Z
	 64N91omq352ZmVgE/gMQZ8cJeXHQPIISIh+jgTkIqmzge9D9WrZU1yD3JOm8k8G/nD
	 lPwsXEY5FGDSIZDWKLnwaRP+u710GmTifJcqIFxAfjSckOfhJl/BdZwfkm6O1jp6Ke
	 ryGtkhaIPxGepPJtTWk/EbzIQcLmHKfKoyK4YJGH25t9Mnb9dN21OxIa13sCa10NZZ
	 Awpbs9E4YGMawIAWl9/FVeSQiTs/W/wGMRevaVCIgVPvnKlftV4RbOB8jEHtvNHj0v
	 d9GN/dAV+1DPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: ls2x-i2c: Add clocks and
 clock-frequency properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Wang" <wanghongliang@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260526031021.32662-2-wanghongliang@loongson.cn>
References: <20260526031021.32662-2-wanghongliang@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 03:26:30 +0000
Message-Id: <20260526032630.8434F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `clocks` property is added to the example but is not defined in=
 the `properties` block, which will cause `dt_binding_check` to fail.
--

commit dfdc495c318fa2d081d4ec5526c34bbf035f948f
Author: wanghongliang <wanghongliang@loongson.cn>
dt-bindings: i2c: ls2x-i2c: Add clocks and clock-frequency properties

This commit updates the loongson,ls2k-i2c device tree binding example to=20
include the clocks and clock-frequency properties. It also adds the=20
required clock header file to the example.

> diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml=
 b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> index 67882ec6e06af..2161f74b7c432 100644
> --- a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
[ ... ]
> @@ -34,10 +34,13 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/loongson,ls2k-clk.h>
> =20
>      i2c0: i2c@1fe21000 {
>          compatible =3D "loongson,ls2k-i2c";
>          reg =3D <0x1fe21000 0x8>;
> +        clock-frequency =3D <100000>;
> +        clocks =3D <&clk LOONGSON2_APB_CLK>;

[Severity: Low]
Will this cause a schema validation error during make dt_binding_check?

Because unevaluatedProperties is set to false, and the clocks property is
not declared in the local properties block of this binding, including it
in the examples section typically triggers a validation failure. Should
clocks be added to the properties block as well?

>          interrupt-parent =3D <&extioiic>;
>          interrupts =3D <22 IRQ_TYPE_LEVEL_LOW>;
>          #address-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526031021.3266=
2-1-wanghongliang@loongson.cn?part=3D1
