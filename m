Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5051C84A6
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 00:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784334226; cv=none; b=YG+x70dYMko4oNtesJCCmh4FkfHiI1IWIAyPFWEotPWhzebAVg2ILXRu2UUJ4sekhGovrGZN3oqBBfzay/Rcde1cZNoUIf1sajy4+S5l6YTJR2MoXWJLRJDrbNU78OQG4FB5lsK5GmllN3V5WF7uTHb43u2z/DVzHmY1kxfIiAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784334226; c=relaxed/simple;
	bh=suHqQOzmFUUZuMn8sVgvmQzO8eMkWUD7blxL3kePC8w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u1ZdRKBjQYla7lWEzwyMK/WI7dpkbxzc9WmiOXAqa3l7T+p3B2atVhxUNaCywEZ/chsDBQIbZO1f/iwj06+evPxyQOW8zH77f4BWmoFqVKZSohXlY+AOEtv7Tq3csJwZb/uQJbCq/LMhdJZcW6VlVFSImL70H1oYLR6UZeest2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDI8bWX0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDI8bWX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836221F00A3A;
	Sat, 18 Jul 2026 00:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784334224;
	bh=BK3co8iST1mzG1je6z2uBv18jgytmKfSV0WDRRaJ6LY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dDI8bWX0Pa2/ofU3F6wu5s919IOzhlk70uBOL6vGri4/xZSHxrZMPapSuLa+O0lMH
	 /WWtsEgSNnEeuuNa6MWiQcjRyo7376oB3pDn1qX5hlvsYWRgRHctE0rdkFVKy731b4
	 9nQ3cAvDpNH0aML8AzeGHZkVeUDv/B3TKXPgKTC0y4fJwFHdo83kMBPr8ZpF4bG/ug
	 MMod6olrZScznqgej8mOpiwwIWDsjDHTaLzmy895k0lFaqJCzmVEbCl5QYORJYVir6
	 zkfMgpN3tBfVEg1NATfsx1hqwhsN/LeUdXSF+TRq+wGn0tKrjhy604wnvr97eRAkEV
	 kpJ7WFRU9R/ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: tegra: pmc: Document Tegra210B01
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-t210b01-pmc-v1-1-bf776be8b3a7@gmail.com>
References: <20260717-t210b01-pmc-v1-0-bf776be8b3a7@gmail.com>
 <20260717-t210b01-pmc-v1-1-bf776be8b3a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 00:23:44 +0000
Message-Id: <20260718002344.836221F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema binds `nvidia,tegra210b01-pmc` to the exact same pinm=
ux pad constraints as `nvidia,tegra210-pmc`, despite the commit message exp=
licitly stating there are pad differences. Furthermore, the human-readable =
description tables were not updated to reflect these hardware differences.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: soc: tegra: pmc: Document Tegra210B=
01 ---
commit 4180e7276638ec7a0b3917f5607e6419625d20cc
Author: Aaron Kling <webgeek1234@gmail.com>

dt-bindings: soc: tegra: pmc: Document Tegra210B01
   =20
The PMC in Tegra210B01 is very similar to the one in the original
Tegra210, but has a few powergate and pad differences. Document this
soc.

> diff --git a/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-p=
mc.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.ya=
ml
> index f516960dbbefb..8ec36c49f9594 100644
> --- a/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
> +++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml

[ ... ]

> @@ -346,7 +347,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: nvidia,tegra210-pmc
> +            enum:
> +              - nvidia,tegra210-pmc
> +              - nvidia,tegra210b01-pmc
>      then:
>        properties:
>          pinmux:

[Severity: Medium]
The commit message states that the Tegra210B01 PMC has a few "powergate
and pad differences" from the original Tegra210. However, this groups the
Tegra210B01 variant into the exact same conditional block as Tegra210 for
pinmux validation.

Could this regression cause the schema to incorrectly enforce identical
constraints instead of modeling the pad differences?=20

Should the human-readable description tables for powergates and pinmux also
be updated in this binding to reflect the new Tegra210B01 hardware differen=
ces?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-t210b01-pm=
c-v1-0-bf776be8b3a7@gmail.com?part=3D1
