Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E70C4D7D37
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607082; cv=none; b=I/hyFSuk5B8dmyLUEjobbAs6aNng3Eg+Dk8i1HNcAOP7vUu4V1IHwQcMNnyTsrGaBDK7JaRGZQ9T7c9PgsSeINl7pQ9gfwcb1yoPAFJLd7W3teQ93xkapaxsbrEo5R5Kv2prJ0UpOGQcaCk+Kpd74koqwUwYVGV7q+Chwd+nXkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607082; c=relaxed/simple;
	bh=H5RW4JDB18kDEujj7W55lMwSqdonqk6ZDNxaQzGbnV4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dHbxXlYcYRE+qVvVRCbJwlNv1u45oBMDMiONM/OwJ92WZcBGZTVJUPNytASSILgLRIs6Is7pIktmsld1S/Nu66W9f/vIoVAS8Biw4Yd7dpwhF0+Z7gVb/Q8UTmThmbvYRpOQMWBiPsYZ3CzEN/aWYTcTq+H0sJu1BKzZ+0rx1YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9qHd1ju; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9qHd1ju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1C21F000FF;
	Mon, 28 Sep 2026 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790607081;
	bh=ahCaz7Ws4Jn17hroOCpsAeUNZmbbtexxAs6ruXPKrbI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c9qHd1jusXNkHVRrY/cRG7KJ/uH0wWYetif/w5HP3HIdW9qPzBnkO2Bn6U36+pT8e
	 RwIOt/k13UDGjuUSQrw0Z5WOAAfZmrFwfWQjVMLjetoOK1J6IDmbVSjgUvGUmjpF//
	 MDUhX8rcbW1vlGCRwEyletqnLZz4mJ7EGbAKg/qF1SZf6iK0SuK6ZtZ93mUBxdW1hq
	 yrblz5WrdRlAGSCVJzoiJC7NRHeLjw270FfTUMl9c2wUCtImQ6/fZZXiNCkK2Ye+SX
	 fpx1DKuRYENWSfTz46oOMwe8HUPLHIfzP5fnWmGJ12QqUAVp3Ub7lYnh6i7l6n2YW7
	 CdFoE1JKMOCOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 11/11] arm64: dts: renesas: add support for solidrun
 rzg2ul som on hb-ripple
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-rzg2-sr-boards-v9-11-5901e0fc9e44@solid-run.com>
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-11-5901e0fc9e44@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 14:51:20 +0000
Message-Id: <20260928145121.2B1C21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: invalid physical memory addresses in reserved-memory nodes fo=
r 512MB RAM variant
--

commit 92cda0c205abe05e3b0184f1c8a5222e1d09b1d4
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzg2ul som on hb-ripple

This commit adds device tree support for the SolidRun RZ/G2UL SoM on the
HummingBoard Ripple baseboard. It introduces the new board dts, overlay
files for LEDs, and the shared SoM dtsi.

> diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi b/arch/arm64/=
boot/dts/renesas/rzg2ul-sr-som.dtsi
> new file mode 100644
> index 0000000000000..c629688189270
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi
> @@ -0,0 +1,437 @@
[ ... ]
> +	memory@48000000 {
> +		/*
> +		 * Physical RAM starts at 0x40000000, but Renesas RZ/G2 BSPs
> +		 * reserve and hide the first 128MB for TrustZone by default.
> +		 *
> +		 * Minimum size for this SoM is 512MB, and the bootloader patches
> +		 * the dtb according to the actual RAM size and reservations.
> +		 */
> +		reg =3D <0x0 0x48000000 0x0 0x18000000>;
> +		device_type =3D "memory";
> +	};
[ ... ]
> +	reserved-memory {
> +		ranges;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +
> +		global_cma: linux,cma@58000000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x0 0x58000000 0x0 0x10000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +
> +		mmp_reserved: linux,multimedia@68000000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x0 0x68000000 0x0 0x8000000>;
> +			reusable;
> +		};
> +	};

[Severity: High]
Will these reserved-memory regions cause boot failures on the 512MB SoM
variant?

The memory node defined above sets usable physical RAM starting at 0x480000=
00
with a size of 0x18000000 (384MB), meaning the physical RAM ends at 0x60000=
000.

However, the global_cma region extends up to 0x68000000 (exceeding RAM by
128MB), and mmp_reserved starts at 0x68000000, placing it entirely outside =
of
the defined physical memory bounds.

Additionally, the combined size of these regions (256MB + 128MB =3D 384MB)
would consume 100% of the usable memory on the 512MB variant. Could these
allocations be scaled or dynamically assigned based on the RAM size to avoid
memory initialization errors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-rzg2-sr-bo=
ards-v9-0-5901e0fc9e44@solid-run.com?part=3D11
