Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35964334C08
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845741; cv=none; b=QZ7mdDsZAHtO11m1c4jVE6RlyPqGaopzr35LhytySGBVsD5uWgiuwRQj0aBNNtV8/H181fmloofrOOMY37gPeLT0xLiGJOisHPjmSeFeRYCsoucUEDmDs+DADY1Illli3/B0aHPuw8JvyXPD6XndV+W55/pf12Olxl2qg/gD4Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845741; c=relaxed/simple;
	bh=uIZlzca7wlPKLQlxUXUSejQzIJqCeICNzOAyQt1Nq2U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gcvF+0DHe43RQoYtJhbPvygQmDKH4QDHgnfp7YaYeyR6SSLSacv/kl5yGDb4pH8QGhHb4e/JKlJk2aq0/ceHFa1TAYWKqhve0PNNDCeRZCDxlkzxEPPakO0FN60kX3LfvF64DNQzmiRX0/M+KlCdsdcoQFJy9Ld6h+rv9SwTb/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eA1gf8JC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eA1gf8JC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441531F000E9;
	Tue,  4 Aug 2026 12:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785845739;
	bh=jNlc1/2H/tYW6O3NqAOXTyKmcZTGLuP4zz1/HgBcn6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eA1gf8JCGI6/hFgockcWZ4UH/A10O064yarSduxUct8T4OuspRGKZxMhGvnFyTCb0
	 RKQGYA2HsCiR6DQaa2hhf2Mm+xMvxndK6TZ27ztoCKAamG04gUBkPlxih2vsqkBYWg
	 I73UbUtBqJqW8nt1oc7+4pzn1nM9P+RJibXuWFtrcNbV+FKSS/Z8St/tvSP+jxxnFZ
	 smK7pZvwJPIWTtKOqP2MpA2/aVZg3z07CQQjfEWEn8Nv+6S5UGz0ps8V3YFY16u/Fu
	 rAGBO+C/HRy9hdouHFWDACtnDx2oPbx+i1wb7FLN5puaFUKy9dBGPnO0DmacpeYJ2J
	 N20NeMphaO4fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/17] dt-bindings: nvmem: microchip,sama7g5-otpc:
 add sama7d65 and dt node example
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804113338.261782-9-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-9-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:15:38 +0000
Message-Id: <20260804121539.441531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree node example incorrectly uses a 32-bit TAG (0x41=
435354) as the `reg` offset in a `fixed-layout`, which violates the static =
byte offset semantics of `fixed-layout` and will cause immediate runtime dr=
iver failures if copied.
--

--- Patch [8]: [PATCH v5 08/17] dt-bindings: nvmem: microchip,sama7g5-otpc:=
 add sama7d65 and dt node example ---
commit f1d25062b84ac824ea90292adfefcc0c472e00d6
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

dt-bindings: nvmem: microchip,sama7g5-otpc: add sama7d65 and dt node example

This commit adds support for the sama7d65 variant and includes a device tree
node example demonstrating how a tag can be used to reference a packet stor=
ed
in the OTP memory.

> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-ot=
pc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.ya=
ml
> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
[ ... ]
> @@ -48,4 +54,20 @@ examples:
>          };
>      };
> =20
> +  - |
> +    efuse@e8c00000 {
> +        compatible =3D "microchip,sama7d65-otpc", "microchip,sama7g5-otp=
c", "syscon";
> +        reg =3D <0xe8c00000 0x100>;
> +
> +        nvmem-layout {
> +            compatible =3D "fixed-layout";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +
> +            calib@41435354 {
> +                reg =3D <0x41435354 0x2c>;    /* Temp calib data packet =
TAG */

[Severity: Medium]
Will this configuration cause a regression where drivers fail to initialize=
 at
runtime if downstream developers follow the example?

The generic fixed-layout binding strictly interprets the reg property as a
static physical byte offset, rather than a tag.

If a consumer attempts to read this cell at runtime, the NVMEM generic pars=
er
will pass 0x41435354 as the physical byte offset. When mchp_otpc_read()
calculates the packet ID using offset / 4, it results in an out-of-bounds ID
of 273732821. This exceeds the controller's maximum packet count, causing t=
he
bounds check to fail and immediately reject the read with -EINVAL.

Is there a different layout compatible string intended for tag-based lookup=
s?

> +            };
> +        };
> +    };
> =20
>  ...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D8
