Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6421F5825
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784382511; cv=none; b=Nc2P3TpbhO60qhBbVuZd3VmRJZaOVryAztcRKqZBi5PoANaV/vEQy50KH4dTYz7JfJ6BeVgKxRxrh7YwYrQYLzDGF5GYMevKYFvnLzf8lx8HV34/rdPMnZVS2zIbQszdMjtqVckcV2xS9p6hYbhNmyT6dbflfNEC1ojqz0YNelI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784382511; c=relaxed/simple;
	bh=cLsfmt8SYqVuL+T96eTYJanig+4c2UXJLXA6n49Uq/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZZY8Ulu8En+JZrxomY7xZjfJiT2w0UHa3DQ+lHGKzIYCKMymYJs5qdXbWdxBV5/h2KyL4IFPZQuw2+kfL4O4Ibd5jkxfxLeTheueIr6jEgzk/nnIJ6QjZjjT3q4F+jzfTTpSTlvRgEEtHA1JIsb3L2B4m4+GhEreynjadruwt6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndTW7R5H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndTW7R5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A0F1F000E9;
	Sat, 18 Jul 2026 13:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784382510;
	bh=d93IeLAssnYOfQg8RCABHWLMrH8kpBrmN76K6CAluEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ndTW7R5H0la713CEdwoQsbKPDgSCc5hDofwTRsWgMCY2sv/IHq8qC7sGHdqxvj14M
	 D1Oqd9Pjj0VYzBj1W+KN4DZ56Be8F1Ag237xewhLK1Mpu44OKAyRXy9sR8yD7A3gKi
	 IfJWq+ItHstydTGb17L3JjbwitVhvJK7bkTs4uLqhcGrabxHTcHnEloW7b4PVEc4rE
	 BwA1VHweu3L5ybR8+oDk+dd2CIfx1/6HGnduQ7m9BcmFLJgI3ctjE8GIuJ2BxWNMW9
	 36ElKz4xfitGTbnCPM1QZbIVFPGfkRFbbMMYB7MrPOlPAYUu1hAa3jcAs0xvM0xZw3
	 VKQxu6xGWrPPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 01/12] dt-bindings: mmc: renesas,sdhi: Document
 RZ/G3L (r9a08g046) SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260718133838.152905-2-biju.das.jz@bp.renesas.com>
References: <20260718133838.152905-1-biju.das.jz@bp.renesas.com>
 <20260718133838.152905-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 13:48:29 +0000
Message-Id: <20260718134830.19A0F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds `reset-names` globally with `maxItems: 3` but fails =
to disable it for the `renesas,sdhi-r9a09g077` and `renesas,sdhi-r9a09g087`=
 compatibles, erroneously allowing them to specify reset names despite havi=
ng resets explicitly disabled.
--

--- Patch [1]: [PATCH v21 01/12] dt-bindings: mmc: renesas,sdhi: Document R=
Z/G3L (r9a08g046) SoC ---
commit ded5b3c418cd0dba150466076b0e30dd19fd0243
Author: Biju Das <biju.das.jz@bp.renesas.com>

dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC

Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
controller is similar to RZ/G2L but has five clocks (core, clkh,
cd, aclkm, aclks) and three resets (rst, axim, axis), so update the
clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.

> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Do=
cumentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 4d66966ce2900..6d229a41a4b56 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml

[ ... ]

> @@ -116,7 +117,12 @@ properties:
>      maxItems: 1
> =20
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
> +
> +  reset-names:
> +    minItems: 1
> +    maxItems: 3

[Severity: Low]
Does adding reset-names globally allow it to be specified for the
renesas,sdhi-r9a09g077 and renesas,sdhi-r9a09g087 compatibles?

The existing schema has an allOf conditional block for these compatibles th=
at
explicitly disables resets:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - renesas,sdhi-r9a09g077
              - renesas,sdhi-r9a09g087
    then:
      properties:
        resets: false

Since resets are disabled for those hardware variants, shouldn't
reset-names: false also be added to that block to prevent a spurious
reset-names property from passing validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718133838.1529=
05-1-biju.das.jz@bp.renesas.com?part=3D1
