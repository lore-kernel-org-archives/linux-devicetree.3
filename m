Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DF83C5837
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927898; cv=none; b=rPFft3DwthfWp7VWuRACW6uHcRtm4jpux2G7UIHsH6CUDJFhMIadamjjyj2ZyMethXAXWUklIpxX47e5aRfanubB/Kzt2dxPHmex78cY//GHJ6wcQNOQ3RmN/P2ST9UmSLfKVn+ruagx/qeQgSInrYxvpVGxcyRU99RwkI1hhqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927898; c=relaxed/simple;
	bh=KEicl9DBhJYzIdnDu1EAI0F9zbu0qSuTi69uvZ9+iFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UP+2CVVacZJlB6TVgbktIuWfEtqa+Kmh4B92q4/ds5T4NJYWPfECqVtdc371HwX0OPSOM3+d4wmqy8poyOeq6Ni+VhUKR5+T2nMX2hiM/oBOV6DSomjjXmTGWvRbL/2Om2r3IGVWMfI9UJSgau+zUgU/6TQNOYhiKLSFNzV4UEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lf51SlXP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lf51SlXP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3121F00893;
	Mon,  8 Jun 2026 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780927896;
	bh=Hb4kJeCte0+S1PyZft50iubCe6UATJQGDAjjIWhCVEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lf51SlXPAfRIuE4as7AhaycN3xOAhBpkOz6b6yhUA5hhJ2NqbVx63pfA6h9gMxrVk
	 uwo96p+KDAbZwvPnz7UF1re/wTr5+ytRuPb6hflGXjPSVk+EFdEmQWHXUWJT/hsSFh
	 BPMgesw3/u/xduYuCSZiTw4ORBV4cKuss9aFhzh5gQgLaPN/l8Hz1mQWELUGNIwQLW
	 TrN1PjaP2e4xIU5K1tRHUcPf4nnB/Zn0Ta5FYR2pDrE9RImawTOFftjNYTPaYlAziJ
	 moTQP2+vAkdWUVQC3SYt3iV33IpDxtf7IrcBLml2oWITU/GMpLarP3kcpbAYS7hygG
	 /uPmfj0OI7UfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] ARM: dts: ti: Add specific compatibles for SCM
 conf nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-4-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-4-0203e6c249dc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 14:11:34 +0000
Message-Id: <20260608141135.BB3121F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible `ti,omap5-scm-conf` is incorrectly and generically a=
ssigned to the `omap5_padconf_global` node instead of a dedicated padconf c=
ompatible.
--

commit e73bdcc41065ea6e37040a568932068a0bac18ec
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

ARM: dts: ti: Add specific compatibles for SCM conf nodes

This commit adds specific compatible strings to the syscon SCM conf nodes
across several TI SoCs to comply with writing-bindings.rst rules, and to
resolve a contradiction between "syscon" and "simple-bus".

> diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi b/arch/arm/boot/dts/=
ti/omap/omap5-l4.dtsi
> index 915870eb5c990..3350128db22df 100644
> --- a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
[ ... ]
> @@ -96,8 +96,7 @@ omap5_pmx_core: pinmux@40 {
>  				};
> =20
>  				omap5_padconf_global: omap5_padconf_global@5a0 {
> -					compatible =3D "syscon",
> -						     "simple-bus";
> +					compatible =3D "ti,omap5-scm-conf", "syscon", "simple-bus";

[Severity: Low]
Should this node use a dedicated padconf compatible string similar to the
OMAP4 implementation? The OMAP4 equivalent correctly received
"ti,omap4-sysc-padconf-global", but here the generic "ti,omap5-scm-conf" is
being applied to the padconf global node, which creates a semantic mismatch
with the actual SCM conf node.

>  					reg =3D <0x5a0 0xec>;
>  					#address-cells =3D <1>;
>  					#size-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-n-dt-bindi=
ngs-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com?part=3D4
