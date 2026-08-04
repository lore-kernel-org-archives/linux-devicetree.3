Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0967A44C641
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841332; cv=none; b=WFi8j+Wzr1KH4/maVdv+SIJU03XDdj3Xn+nXTaAGmMxWszbXwEyExrzELcS/Xi0x6tsf9OEVu6t1blY+9nYn0ZyUh2kyB1Ni6RdH7YGzyy3d2b5nek9hbCHARjF/kg8w0L4hrlJW07P59G0PRKSwav29CQv+KMc+7EMtalySFms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841332; c=relaxed/simple;
	bh=UvYItnEJ0EATdzav+w/p4auAb/QJbk7yonNevtH50Ks=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XuaMgoVglwg7CM/3zbKBqFyOs/hjGFsBXo+gcbghROQGtmWnewGq2VEvJAgVvq0JJNY8LzJ4N52XjV1rXOYWvB00duUtlMnDiT23tTcamKhOIhkfgrjnpXkV2u2znnhLD4WgNSVEhiPBh5KrpseEpjD1R0OSm4mJfcWrY19oXnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmfibvSj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmfibvSj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BF31F000E9;
	Tue,  4 Aug 2026 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785841327;
	bh=Jb/avARaLv23ENrTTq2NW3anJv/geBdtv91sNkEY2Ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SmfibvSj1++J/4qpPZEBMjkl1cKmt3pKndv+9xdoSFoAVpIbyc4AC5k4awpQwKvrH
	 VCjYI0Eu9Isc9KvlRsxRA1qItPoBApM/AP4IlH5VJXiKerue4/+SeWDSjvHSNoOXoF
	 MJnnsvnlWyTlcB7+QJwN4lpAKxThpZEX2Ig/7kesHJRnxzHSVaRbiAkOxt6iVaITfs
	 A2sSSzNEEt1DdEx5bdRjWwCsMjfCT+L5f9ApFeo71HTeSc69zP8ycLjGCT1FYLF0b6
	 LMYK/9gIZx34JqpKXkl3YVsFyKyBvqA73G8SLgMEmokDJEH98rQQVnUIcsTHgsB2MV
	 TD3zgGSAVL2VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/8] dt-bindings: mfd: syscon: add ESWIN EIC7700
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804104431.1391839-5-pinkesh.vaghela@einfochips.com>
References: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
 <20260804104431.1391839-5-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 11:02:06 +0000
Message-Id: <20260804110206.E4BF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The new compatible string 'eswin,eic7700-syscfg' was omitted fro=
m the 'select' block's enum list in `syscon.yaml`.
- [Low] The commit message description is not capitalized, violating MFD su=
bsystem guidelines.
--

--- Patch [4]: [PATCH v3 4/8] dt-bindings: mfd: syscon: add ESWIN EIC7700 c=
ompatible ---
commit b6fbe8a9c92251f8d7a4c290284000e71004ed87
Author: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

dt-bindings: mfd: syscon: add ESWIN EIC7700 compatible
   =20
Document ESWIN EIC7700 SoC compatible for syscon registers.

> dt-bindings: mfd: syscon: add ESWIN EIC7700 compatible

[Severity: Low]
This isn't a bug, but should the commit description be capitalized after=20
the subsystem prefix to match MFD subsystem guidelines, perhaps using=20
"Add ESWIN EIC7700 compatible"?

[ ... ]

> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> index e228670880631..2bcaaba6948d3 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -175,6 +175,7 @@ properties:
>                - cirrus,ep7209-syscon3
>                - cnxt,cx92755-uc
>                - econet,en751221-chip-scu
> +              - eswin,eic7700-syscfg

[Severity: Medium]
Does this new compatible string also need to be mirrored in the select=20
block's enum list earlier in the file?

If eswin,eic7700-syscfg is omitted from the select list:

  select:
    properties:
      compatible:
        contains:
          enum:
            ...
            - econet,en751221-chip-scu
            - freecom,fsg-cs2-system-controller

will older tooling like dtschema < 2024.02 fail to select this schema as a
fallback, which could silently allow invalid configurations to pass undetec=
ted?

>                - freecom,fsg-cs2-system-controller
>                - fsl,imx93-aonmix-ns-syscfg
>                - fsl,imx93-wakeupmix-syscfg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804104431.1391=
839-1-pinkesh.vaghela@einfochips.com?part=3D4
