Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BAC7083C
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782684461; cv=none; b=IZ/pl3MP/vrxAa6HkPXcJO89K0w81PmgoVLAFgef8aD0X/9UVlD+Yf8zOc1pmHup3V46OZ+jX4Zq8cTw1QIFvbtKXiXjQ5uQxv3V2Jd+R/3YscpQJA+NUTAGIew9spJhz5SFM1i8VCTGuc4kzq5lscfzGYsPHrr1/iS8MThxlYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782684461; c=relaxed/simple;
	bh=BgVNjo+VO4vvod5e48mTVqMNh//hktRf5RBuOFus4lw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gbH0Ra/wXBYJdZIh1FEl3cWhsWuEs0Q/FAdwsMkMudtifvE/ihvTVKKidGb3kiJC5W/D/SEDeLVNo0+heJp2zxRlqFhQXnYGgxtXxnivn5YpWsDpNbPb+AWSNllmorMejXyRdOFKc0s8s42R/PasCtMdcJvpLswxeJFYfv8Uyn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ct5S/gnf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ct5S/gnf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37191F000E9;
	Sun, 28 Jun 2026 22:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782684460;
	bh=014QyZeFbFvMibi16Gv2EHrhRKZXTcCMPRd2Z00LG0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ct5S/gnfS4r5fYwxnRzLX91r5VUIZP1FQKOTHsWTlYhqfIPb5M+qdVMpyloxFsZSd
	 5Ju0dCogZ3YBTJ90k4YuXZuYLOe0ISPT8hhAuzDjabLZhAtOu+rpz1NcCkV3Xsq0JJ
	 /8r8SyGSLszJ+foE3Lr8WG/uJFEZUt+uzGL8fk3rwluD+Fz6wbccbYis0wh2X/L8te
	 0rbqO4SOy5hBlWqi1Rt5L5dryguWPLIvTHlMffBdHS6UeIutk4Oa1hcoD3KgDZfNAb
	 J2a3BObl6a27v6YXqDAx71cdtMit6Euu/j/cwT0+YzaYvCK3uMEYSghGorlv0eql5W
	 Xy1TZmDOeA9ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: power: supply: Add TI BQ25630
 charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Waqar Hameed" <waqar.hameed@axis.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <3c28e53cff6d2e6ee94f8bf516ffa75134cb0959.1782683551.git.waqar.hameed@axis.com>
References: <cover.1782683551.git.waqar.hameed@axis.com>
 <3c28e53cff6d2e6ee94f8bf516ffa75134cb0959.1782683551.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 22:07:39 +0000
Message-Id: <20260628220739.B37191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The devicetree binding example references an undefined phandle labe=
l `&bat`, which will cause `dtc` compilation to fail during `make dt_bindin=
g_check`.
--

commit 4d0f17bc3ce487f6e8027b9ef945b17aba3d6bee
Author: Waqar Hameed <waqar.hameed@axis.com>

dt-bindings: power: supply: Add TI BQ25630 charger

This commit adds devicetree bindings for the TI BQ25630 battery charger.
It defines standard properties for I2C and interrupts, and sets up
requirements for a monitored battery reference.

> diff --git a/Documentation/devicetree/bindings/power/supply/ti,bq25630.ya=
ml b/Documentation/devicetree/bindings/power/supply/ti,bq25630.yaml
> new file mode 100644
> index 0000000000000..3f2904731c5a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/ti,bq25630.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        charger@6b {
> +            compatible =3D "ti,bq25630";
> +            reg =3D <0x6b>;
> +            interrupts =3D <13 IRQ_TYPE_EDGE_FALLING>;
> +            monitored-battery =3D <&bat>;

[Severity: Low]
Does this example reference an undefined phandle label?

Looking at the example scope, the node with the bat label is not defined
anywhere. Could this cause dtc compilation to fail with a 'Reference to=20
non-existent node or label' error during make dt_binding_check?

> +        };
> +    };
> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782683551.gi=
t.waqar.hameed@axis.com?part=3D1
