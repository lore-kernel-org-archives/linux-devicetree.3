Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA703164AA
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195199; cv=none; b=N2uvmfmM2wGv5SZwzRDfmWH1WZ/4fMZBRAYL4P8rnUJKFZZPVxpoHlZN7b7+ZDvOJj4p1C7gMAQjvsoOfU7Ha/a3PEYoxZNil7ed2zKVDIGz6KI7S0YOA+jP6zTard0q88YtKpQyCdtOMlYB37lf5ctcS2MeZ63EI1LjZrK3GMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195199; c=relaxed/simple;
	bh=EiN6zNTle5OF+IM9zfFYuYMufG77706RVhw1iq+jaCA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sb33dcf0qas9rKzFoWKTU2MCxS40ZPWBnPgVtwsQmwDngsH3H6M1GjcuBXvyMTw6nleZ2wEi3IOTWMuLvshL8aVfWwmgmivvp3t7y2Q4uhUnEPbK8GmmvESwUsroT7gDL9dX0yZxU4glxlrDIr2QBUcfpHv1KIpD+6z1J4IRYKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3tTX+VN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3tTX+VN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103A61F00A3A;
	Thu, 16 Jul 2026 09:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784195198;
	bh=pY+qFbwWKBtyGgLzKBKO82QvWL/aJ17JK0zPPyLN8yY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d3tTX+VNut1+7dV9cj08F155CBE9nMocgjfaBG2E93mtPoGguK/tXoMKtcGf6M9FL
	 GpozJ3IGjgjzZqmRH5D53T8hE3WyRvpqeX7ez4RqpKC1HsVrpWDyR3c2RmATxywgrm
	 /KxaEcSenzP0InBBA/lOY9HA5kyvlxtsIA+rmkmaCcYIOFaTX43rMWxfz5T8dYbslV
	 eb7nSL8P8764ROR4fX01cLPqtdyuIiAuTfp9Ke/8XnpG5FKIwi1VXAx1I7Cj4RbgtB
	 jPxFaXyugZE1U6cBwyelKC3RG3LrWmKbghEXVMJgjilVKfcCPkcM4+lQkYt2hHWk97
	 F2EoTu0m93GQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Vicharak Vaaman board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716092859.512306-3-hrushirajg23@gmail.com>
References: <20260716092859.512306-1-hrushirajg23@gmail.com>
 <20260716092859.512306-3-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 09:46:37 +0000
Message-Id: <20260716094638.103A61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Non-standard node name for the 12V fixed regulator.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: rockchip: Add Vicharak Vaaman board =
---
commit 5905db945adc2fafb8754e0bf1a749e342f70335
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

arm64: dts: rockchip: Add Vicharak Vaaman board

Add initial devicetree support for the Vicharak Vaaman, an RK3399-based
single-board computer.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
> new file mode 100644
> index 0000000000000..6060365bf731b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts

[ ... ]

> +	clkin_gmac: external-gmac-clock {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clkin_gmac";
> +		#clock-cells =3D <0>;
> +	};
> +
> +	vcc12v_dcin: vcc12v-dcin-regulator {

[Severity: Low]
This isn't a bug, but does the node name "vcc12v-dcin-regulator" violate the
preferred naming pattern for fixed regulators?

According to the fixed-regulator bindings, node names should ideally match
the regex ^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$. Should this be renamed
to something like "regulator-12v-dcin"?

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc12v_dcin";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-max-microvolt =3D <12000000>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716092859.5123=
06-1-hrushirajg23@gmail.com?part=3D2
