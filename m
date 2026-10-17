Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE40480DC7
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792236055; cv=none; b=WkguDzVlOEly2yIpbd8eXKUnYoxJWtjsVcqbEL0NYMA6n4LAbBvi/R4aLW7vuSuLJdeAlBDRul6WpwgvIW7+3t9QN5FL3TAYA9drFC7TnMGLWuSisrswTipv9PvK5YzlMK5pFKSLNtN4txLh/xP2BjVb/HFMHSAcXPPqzyWUrbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792236055; c=relaxed/simple;
	bh=EbWS6unFnh5DaxXOs4+A2cbdnH8ROXLvfskA0SZnHEI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BbO68I5dy70Kh62mv2jhLcel63R7ExmvVELH2bLBjFMrHQ1UiAcac2lwQYPNibYD2HESLpq0FgRECBjiJ9JkQ90eOMIo19PVNFW/WedVwqz3xzcqA0hTzui2l8Ztvth9WnLodIkUs2BkvKNtf+t3cIPUxeAlVSbsAsS4zBSBRHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1SL9NFV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1SL9NFV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C4E1F000C4;
	Sat, 17 Oct 2026 11:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792236054;
	bh=N49EFMOti0CTtM8M07cLnpbLpnIz+ebO6WcfMhN4lk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P1SL9NFV+qjXEo+XOzRsMWTha6B65f/kiEbBsyJRQiNkcPU4ws88gNuvsEsqeQEUP
	 q6wXONVIKxdnEQ3vKLot6/7ljTiK+ATbIvbGP0SbOWIjuktKME69epBkv5ZU/CefLx
	 jokl/XDgCqKnElV0Uc8RfOic7NJNeYmGFvOpihj0R8faK5al2plhcGzlM0mv3sOpFe
	 u1aH1nQws5syRSrKOD+E/I2JXzT+2ockhtbgb8BF7xJGC8Dtc7mhSggiTJOna6ay9f
	 jz/lKkkAtOXL0C2FYoqK98IALmLIRUYwYnVRXh/jvhHZQyga2cfuzJpPJDLf7022TA
	 l0dTf+NCKDweg==
Message-ID: <sashiko-outbox-175492@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 4/5] dt-bindings: net: maxlinear: add
 MxL86211C lane mapping support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016112033.949026-4-robert.marko@sartura.hr>
References: <20261016112033.949026-1-robert.marko@sartura.hr>
 <20261016112033.949026-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 11:20:53 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: maxlinear: dead code in else block due to stri=
ct select
--

commit 414c3b989bc8453c4971568d53b96638314826bb
Author: Robert Marko <robert.marko@sartura.hr>

dt-bindings: net: maxlinear: add MxL86211C lane mapping support

Describe the optional board-level mapping from physical TPI lanes to the
MxL86211C analog front ends (ASPs). This allows DTS to describe wiring
that differs from the hardware reset mapping.

> diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml =
b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> index a0dfb6192d81b..4323be300c721 100644
> --- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> +++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> @@ -35,6 +35,7 @@ allOf:
>      else:
>        properties:
>          vddp-supply: false
> +        maxlinear,lane-asp-map: false

[Severity: Medium]
Will this else block ever be reached?

In Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml, the schema
contains a restricted select block:

select:
  properties:
    compatible:
      contains:
        const: ethernet-phy-idc133.5400

Since the allOf / if block checks for the exact same condition, it appears
guaranteed to always evaluate to true, as the schema only evaluates nodes
that already passed the select filter.

This seems to make the else block dead code, meaning maxlinear,lane-asp-map=
: false
is never actually enforced for non-idc133.5400 nodes.

Additionally, does this strict select block prevent the schema from
evaluating older PHYs like GPY215B/C? If the schema restricts evaluation
exclusively to ethernet-phy-idc133.5400, properties like
maxlinear,use-broken-interrupts might skip validation on older PHYs and be
flagged as undocumented during dtbs_check validations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016112033.9490=
26-1-robert.marko@sartura.hr?part=3D4
