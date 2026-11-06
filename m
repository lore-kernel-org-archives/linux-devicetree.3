Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965612;
	b=1dOTkdQGaTlNGH/ffTD5pgjhhP2T9dJ+A4kDqzFU8wcj9ApsDsE+D6ig+yxGwddVEuSp
	 9lqz2zpoIvs9PVXyXDAulT16hKlHxLZRESS+Xkesi4iCqM9GNePSqti9w3X8FkCEDjsTL
	 8TgaGQ9CxKPzmIXvqSe0Qva9L0CVg1VsU/k6kf4xm1d3FaVw9ZT9GEFXpkazW9ScF3yS1
	 RMO7gvC/YgGDay6QRaVB7pN20L+a0tYhiMZCeMFcImZSCY1gfrH6Xr/AxxT7rygh7cmSl
	 LXI1aQ/Nc5aGlkQAcZHcBFjWIpWxx0WWVXfn93X0oOmaXGeIoaTfePf/5r9koiJVEzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965612;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=faQ74PK2AEKXyVx4ethMpmgrCS7GcqHtL6K7wyKDgqk=;
	b=hxGIkX0/py0blMrwzk342gFS+ukTXowoEk6SGmm6sC+sGPs3vHdOzo7bqYvi9iYFQ1VK
	 JQkuxS6nNFSEsuri95/2aiC/lheBeOOZoS54EG1fNAynqHSUc01Tw4LMyrRrWWxvPBK9z
	 aKHS41B324v6ZHkrTQVhz4xAo2r8NXkqqGIcmktQDmNU8vGSfO6woF2YyT006kfrlgDPe
	 OBAcNAeTSdYOI0+JTJJAwZ2fguCgbb5Vzygito+89Gm2DA8L6rze9ifwFRU0aTzAoaT5w
	 TUIkaf2Y3J22DvOvdqnpNjDqFQs2GXYPhrtt7ZdzurV/6XMgFr2E9xaDGIyaj+KFhvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R89HcuK7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFB2606C7D0
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R89HcuK7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943A01F008A7;
	Fri,  6 Nov 2026 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965611;
	bh=faQ74PK2AEKXyVx4ethMpmgrCS7GcqHtL6K7wyKDgqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R89HcuK7/xBmzdlAh2TATf8LY5C6JuFLHEbaHS80M39zkaIMw8audFAs87iiSZQmO
	 Hq3ExlA96ZsICDy3D+T3MttNKSogcCg3mBVY16nWFT3LlFRvE3m1VzKT9jc/P4Ptt6
	 LJvdNpfiP607fNfhFCqXSTNbukZoDkz046v34pi35TPHYup0W96p4lkm4C/vmnuzuf
	 o0BiIo4meqnS5CaJiHsnuL77ck4bhLKt+r4TK+iazW8NImbaT1iM23kN8EFnhzwzjx
	 a0GLubIFSP9XmYMr9Fu7XXK1EMxKkhCAjfsWD8YzW3Jul9nSkwhleu52uYa/OnGi+R
	 BQa1Yc0ChIzSg==
Message-ID: <sashiko-outbox-201357@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: willsemi,wl2868c: add the
 WL2868C camera PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106113005.970822-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106113005.970822-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261106113005.970822-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:46:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] regulator: dt-bindings: willsemi,wl2868c: unrelated node in
  binding example
- [Low] MAINTAINERS: nonexistent wl2868c-regulator.c path in dt-bindings
  patch
--

commit 445721dc45dd58c5fcd063ef3e6a8215d244f0d7
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC

This commit adds the Device Tree binding schema and maintainer entry for
the Will Semiconductor wl2868c camera power management chip.

> diff --git a/Documentation/devicetree/bindings/regulator/willsemi,wl2868c=
.yaml b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
> new file mode 100644
> index 0000000000000..df7990d0d8a4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
[ ... ]
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        pmic@2f {
> +            compatible =3D "willsemi,wl2868c";
> +            reg =3D <0x2f>;
> +            vsys-supply =3D <&vsys_reg>;
> +
> +            regulators {
> +                ldo1 {
> +                    regulator-max-microvolt =3D <1128000>;
> +                    regulator-min-microvolt =3D <1128000>;
> +                };
> +            };
> +        };
> +    };
> +
> +    vsys_reg: regulator-vsys {
> +        compatible =3D "regulator-fixed";
> +        regulator-name =3D "vsys";
> +    };
> +...

[Severity: Low]
Should regulator-vsys be dropped from the example?  Per
Documentation/devicetree/bindings/writing-schema.rst, binding examples
should only describe the binding being documented and do not need provider
nodes to resolve phandles such as vsys_reg.  Also, since the example
enables ldo1 and the description states that input supplies may be omitted
only when their outputs are unused, pmic@2f should include vin12-supply.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe23913b1e432..08cfa3db0ecbe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -30180,6 +30180,13 @@ L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	drivers/hid/hid-wiimote*
> =20
> +WILLSEMI WL2868C CAMERA PMIC
> +M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
> +F:	drivers/regulator/wl2868c-regulator.c

[Severity: Low]
Should the drivers/regulator/wl2868c-regulator.c entry be deferred to
commit "regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver"
where that file is created?  Adding the path here causes
scripts/get_maintainer.pl --self-test=3Dpatterns to warn that no file match=
es
drivers/regulator/wl2868c-regulator.c at this commit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106113005.9708=
22-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
