Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4F5432BC1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507653; cv=none; b=CsT3SDVD3X0BFlcUhWJGOvhdei7ZBat2HS1qXzI1ykwIXnmqP+z0cc9jbd/0B5tpQ/2MPxzjxcsxQZIb7ofjKze8UGJ7YKZeBQm7hi6fhZJk2/hdHoVQMkff+Y66jK84WL4/mzUYnYB/uyABbPPs+8ELciX8zxY4E9DLclLmK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507653; c=relaxed/simple;
	bh=4iNtBA1yoPbIWCj1+adLSCrW4GrtSotgr0ZVQntyHCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YzNhXOe0TT7oaOZYM93rjTWlO0KGHiQ5CgGFGbHMcGwposRKDFBSZSjMx3GdlszDjg/Rd740vrPJkXLvnLSQ2iGlNZ9PRaoVOKcdgvLwW16uoHv/RjOB3k72ZKsyjnhJwcxy7WJhB0IwKdxpj0BhFAK+IBo+s/8/bPHwRVirfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTu8tArQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTu8tArQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052F21F00A3A;
	Wed,  8 Jul 2026 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507646;
	bh=oxa6gLHnv1NbQhOz1KWkyoru91c7Fa5iF8flnalK32w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PTu8tArQFfKCEe4cEkqOCm4NUcXK6WqcCvDEkW3jyb8pM78EaG/vCFFbdZh3qFSSG
	 Kwm1lwdZh7Elzss7j+OuWIQyw6E88zcK1nhJwLk4LFO00LO2yzo3y697beDK1YEvtu
	 SoZC25JRwznWmMaej/aOG0iIkKlJExlIOd5px92ku713LsG0yZj8V5HuQhB7CJ8Nb3
	 PQgl9sHN/9TC6CoOyr+0w9YX6Kbzi+uJxIVCstf6/A+fvLkeZ8EPO5RPY2Yepb9JST
	 97qiJ/4TgXUAecE2JdnlUTiOquByg6SKVvfRYgpdzRD1NtkRHNlkgrlyT+1XAyxIGo
	 fYVdxrptqo9jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
References: <cover.1783505142.git.geert+renesas@glider.be>
 <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 10:47:25 +0000
Message-Id: <20260708104726.052F21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware mapping mismatch between MDLC driver and DT causes prob=
e failure for hscif0.
--

--- Patch [6]: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes=
 ---
commit f3c8aa0f294cd575595329194a9adf5e14b5f350
Author: Geert Uytterhoeven <geert+renesas@glider.be>

arm64: dts: renesas: r8a78000: Add MDLC nodes

This patch adds device nodes for the Module Control (MDLC) blocks on the
R-Car X5H (R8A78000) SoC. It also links all (H)SCIF serial ports to an MDLC
for power domains and resets to complete their hardware description.

> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/=
dts/renesas/r8a78000.dtsi
> index e22e307ce31fb..6ca1b1e95aef2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
[ ... ]
> @@ -886,6 +895,8 @@ hscif0: serial@c0710000 {
>  				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
>  				 <&scif_clk>;
>  			clock-names =3D "fck", "brg_int", "scif_clk";
> +			power-domains =3D <&mdlc_perw R8A78000_MDLC_PD_APL 0x41>;

[Severity: Medium]
Is this the correct ID for hscif0?

The r8a78000-mdlc driver introduced earlier in this series restricts power
domain attachment to module IDs in its allowlist.

The driver specifically defines ID 0x54 as HSCIF0.

Since 0x41 is not mapped to hscif0 in the driver's allowlist, will
r8a78000_mdlc_attach_dev() return -ENOENT and permanently prevent hscif0 fr=
om
successfully probing?

> +			resets =3D <&mdlc_perw 0x41>;
>  			status =3D "disabled";
>  		};
[ ... ]
> @@ -922,6 +937,8 @@ hscif3: serial@c071c000 {
>  				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
>  				 <&scif_clk>;
>  			clock-names =3D "fck", "brg_int", "scif_clk";
> +			power-domains =3D <&mdlc_perw R8A78000_MDLC_PD_APL 0x54>;

[Severity: Medium]
Will this conflict with the MDLC driver?

The driver explicitly maps ID 0x54 to HSCIF0, but here it is being assigned=
 to
hscif3.

> +			resets =3D <&mdlc_perw 0x54>;
>  			status =3D "disabled";
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783505142.gi=
t.geert+renesas@glider.be?part=3D6
