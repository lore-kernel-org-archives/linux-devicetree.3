Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E95A283CAF
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 00:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431939; cv=none; b=rkipQwp7fZRXv3h1SWX4tViikEKMoggWSDGz61ptKE6tK95myaOak31GvC4+w2AZV6nwNfBNpKwx/QoheXgCfvPlTNQfjXIXTz615FgKeUNBqGUhsC6tC+TYEatCir13n5+sHIooQYhC+kgHgUa5bpztYtuxNxPr7SWAcKJKDbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431939; c=relaxed/simple;
	bh=BOkdKc2j5CkLno1SDBYJ7JhFqiilaDOl6EorzSMI8ds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YbHeAnioUazB8puFo5ctH9jt1a/ttoQbfPiG/+rN9lcKOubAX9QrsaKhKdT0nWWBeEYUPgxgtJX+LUO8JMvdjJ9jZ28DhG8JN3GcNiGKIHhQtGxppwQRhYX9gUO9RYjNTZsX420h3rlB6OATfcixf28RGuihEWYHrocj6V2wM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzwHcIha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzwHcIha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25A41F000FF;
	Tue, 15 Sep 2026 00:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789431937;
	bh=IyMqZAdvAKcBFV0ZllVH4k40MYHG9m5TKywygtvbnLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nzwHcIhaUm4fOUYdY/zChf8Va4fYbu29u5maVpXyPP4JJisnayyYss0PS22IBU66i
	 PLX98uZvZKYvpOnGj5/CMa3mQQj1UCKvKlo0rgZuv6Z4zXKfJC6Vwrl+m8nZJHuItm
	 APzd+I9olrRI9FUNE8+7lDsVV/ekicAxwgYnzTk8FzWHeGmBQSis8XFzFg/fYaOqtm
	 JHWMbv0PBW2sImuZhY+NDtMO783yg0bI7T3TRItxl8PEU66bVGSPTdbMXEyAlRBf1W
	 8BZJrRc65lXdEi9J1Lt33j87OU9LGv9qVyDMF+trmwjSW03uelwC+RJ8zYCjr92mV5
	 J529xS6WevWIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add
 GP_SW1 efuse node for silicon revision
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260915001304.3781247-1-jm@ti.com>
References: <20260915001304.3781247-1-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 00:25:37 +0000
Message-Id: <20260915002537.A25A41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] nvmem: uniphier-efuse: 8-bit bus access causes SError crash on TI =
K3 MMRs
- [Medium] dt-bindings: undocumented compatible ti,am62p-efuse and uniphier=
 hijacking
- [Medium] dts: ti: mismatch between commit message and GP_SW1 register off=
set
--

commit 8299f82c1d81975723ca388690e1c0edc25d737b
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add GP_SW1 efuse node for sil=
icon revision

This commit adds an efuse node for the GP_SW1 register to determine the
AM62Px silicon revision. It also references this efuse cell from the chipid
node via nvmem-cells.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi b/a=
rch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
> index 8612b45e665cf..0f00e9d87f8ba 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
> @@ -19,9 +19,23 @@ wkup_conf: bus@43000000 {
[ ... ]
>  		gpsw_efuse: efuse@230 {
>  			compatible =3D "ti,am62p-efuse", "socionext,uniphier-efuse";

[Severity: High]
Does using the socionext,uniphier-efuse compatible string here cause an
SError crash on TI K3 hardware?

The Uniphier eFuse driver in drivers/nvmem/uniphier-efuse.c is hardcoded to
perform 8-bit byte-wise reads (econfig.stride =3D 1, econfig.word_size =3D =
1).
However, TI K3 WKUP_CONF control MMRs strictly require 32-bit aligned
accesses. Attempting a byte-wise read to these registers triggers a hardware
bus fault during k3_chipinfo_probe().

[Severity: Medium]
Will this array of compatible strings fail device tree schema validation?

The patch introduces an undocumented compatible string ti,am62p-efuse and
reuses socionext,uniphier-efuse to hijack its generic nvmem driver. The
existing socionext,uniphier-efuse.yaml schema restricts the compatible
property to a single const string, so dtbs_check will reject this array.

Should this node rely on syscon or a regmap-based nvmem binding instead?

>  			reg =3D <0x230 0x10>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			bootph-all;
> =20
>  			gpsw1: gpsw1@4 {
>  				reg =3D <0x4 0x4>;

[Severity: Medium]
Is the GP_SW1 register located at absolute offset 0x230 or 0x234?

The commit message states "Add efuse node for GP_SW1 register at offset
0x230", but the device tree defines the parent node at base offset 0x230 and
this child cell at a relative offset of 0x4. This places the register read
at absolute offset 0x234, not 0x230.

If the register is genuinely located at 0x230, should the child cell be
defined as gpsw1@0 with a relative offset of 0x0?

>  			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915001304.3781=
247-1-jm@ti.com?part=3D1
