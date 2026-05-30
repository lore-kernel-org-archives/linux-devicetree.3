Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26A7337B97
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780127495; cv=none; b=ccc3vsbY4CyFCc84j196ZqmGRtCJODEhneAIZWzmnxZ32xWxoYFXUffFA7k185rBwWshJE1haF67PNuoKCiR0lxztifX45diD+qb2Uh3zxBSN+8O/JgLEhUDEm7/UiUumWM/dFLLYxVHRLPKBPgCyPH4NaFO3HjOGuiikC/Vz5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780127495; c=relaxed/simple;
	bh=tlP6AlUgPr4h4QDboe3ZHyFIW+EzvQ1ytiKOne7+43k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cltzKi8SDikwarqzqb5RAgxOAzsIwEP+23SB80dTlE3bmhORrqp96lXApDcYAIaXtNtDkIYk4JWeniWHl5E5WfFSlDiS61WtL3QQRCOw0qzf8maV6czWzfUJZvFXY6wSbErNEns5ioCvDhIGDD0QxGVuASIQuiJJC/GfdOob/o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mE/Juyq2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mE/Juyq2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6096A1F00893;
	Sat, 30 May 2026 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780127494;
	bh=ymNOVNJ70FMAm4bjf9hOw6L62lIepCTcYr0/PdhBbVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mE/Juyq23y4PkfHVOIjBvihUHbGbPohTwAnGdJjrM/OTDa3bHv6EHiBAiOXOFH5Tq
	 GPNI1LCFGa8n4BKIFRFGJ2vcP+3aXxSuVc9mKTuG2mcqKCzT6AYe/yO/ZenDk1sMjq
	 4Ypj5OHmCPEAJc7mzFGmBEwaK0ZlZuRPPZ9jr5VoFOWOUaXXnoz66pDg1T85nSALsI
	 0LfAJCXbrs6IYBMRNjOWvFazTvim6Z6sxJhytedABUU2DwRG6h360dHokn6jQKdAWR
	 uA1kB+1wGWYN7osw4UBxSLnIFKIUZDJ40jYwLL3lnNnM2LRk2CFZfANCgTOzYNND9r
	 3to4OlhJQFjjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: renesas: r8a779g0: add MFIS node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260530074202.24203-2-wsa+renesas@sang-engineering.com>
References: <20260530074202.24203-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 07:51:33 +0000
Message-Id: <20260530075134.6096A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] DT Node Ordering Violation: The `mfis` node breaks the strictly asc=
ending unit-address sorting rule.
- [Low] Undocumented Compatible String: `renesas,r8a779g0-mfis` lacks a DT =
binding schema.
--

commit 78d3c8790425ff24dbee915cdb875dd580b0da33
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

arm64: renesas: r8a779g0: add MFIS node

Describe the MFIS core which is used for various tasks including
inter-processor communication.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 82a7278836e57..9779b88b79952 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -603,6 +603,23 @@ tsn0: ethernet@e6460000 {
>  			status =3D "disabled";
>  		};
> =20
> +		mfis: system-controller@e6260000 {

[Severity: Low]
Is the placement of this node out of order? The mfis node (e6260000) is pla=
ced
after tsn0 (e6460000) and before i2c0 (e6500000), which breaks the strictly
ascending unit-address sorting rule.

> +			compatible =3D "renesas,r8a779g0-mfis";

[Severity: Low]
Has this compatible string been documented in a devicetree bindings schema?=
 It
appears that renesas,r8a779g0-mfis is missing, which could cause make
dtbs_check to fail with warnings about undocumented properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530074202.2420=
3-2-wsa+renesas@sang-engineering.com?part=3D1
