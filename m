Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE0437CD42
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477627; cv=none; b=RXe26/Odf9CVy5DRjBIX227wtbUQYhl8MViYa5v1WDoSC+4QR+MdjlN+cD2QvQjgUJsSp3Y31LWuUBg1xy9Dbbcd2ryWdqnWdj3V/5JJJ3S5sJWtu4m1xpLRHKaeUgyqlUAq59CCI2P8/OHz8TVKiPdtvldrgkj6wln2PTALVpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477627; c=relaxed/simple;
	bh=aq5W4zuuo0ZW5c7CbNvp6Hmu6EiBEr1sYUWj+157+0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rhyJ0puNEt/7xTFzhLlLOD9svoxv2jUmL8m0B4JGnTi5F0moBrXFFqNUzZMrtPRzFlF5Kop/P4IU2dj3RsAn92+wiPvE+sKCXwBfkCn9z/1to29hLqcLnhjAfSw4IF6Pj332/nP/EXP+Zg544s2I2r+wuvlAKeDiC/6EEsedWS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNkK6JVE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNkK6JVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F8C1F000E9;
	Tue, 11 Aug 2026 19:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786477625;
	bh=suRc+2FsuqdGShd7YLemU6VoBpagKQmJhzknUumHOM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QNkK6JVE+V8JVAg7fiP+n3RrVlcUHBZsBY32Sc3fLVSxQmjd1Vf3h064aVGCy/fYc
	 IlkLlu49Ksy1txiYd8a8Yzw5N9shJGW4o99igm7nkXAcTHippBl4WTuUucORD9xQ+Y
	 TmFdT5FcgX6H6PWuewdqf2OdA3DwjNx4FN7xQAJIJBEoIEbqLFNnJgU6YLg5GhS0nL
	 8hoInc7Q1wW/EGWi+Yvb0Ypf2jf6voP54idtv1jGQlT4+v2PTQahf6IFAgEG3YKkJH
	 0sS+C0XrBOqohalIGgLn9aAknEvFZ75wULpk7GnCmrkWle2INp6cVjDRBQ07fj0IG3
	 4epbqhOSsEI1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/9] dt-bindings: arm: apple: apple,pmgr: Add t8132
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yureka Lilian" <yureka@cyberchaos.dev>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260811-apple-m4-initial-devicetrees-v3-3-6bf32d45ad0b@cyberchaos.dev>
References: <20260811-apple-m4-initial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev>
 <20260811-apple-m4-initial-devicetrees-v3-3-6bf32d45ad0b@cyberchaos.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 19:47:04 +0000
Message-Id: <20260811194704.C5F8C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing companion binding update for child PMGR power states (`a=
pple,t8132-pmgr-pwrstate`) in `apple,pmgr-pwrstate.yaml`.
--

--- Patch [3]: [PATCH v3 3/9] dt-bindings: arm: apple: apple,pmgr: Add t813=
2 compatible ---
commit 2d86c5231638bf787326c9263ce70838cbe09c42
Author: Yureka Lilian <yureka@cyberchaos.dev>

dt-bindings: arm: apple: apple,pmgr: Add t8132 compatible

The PMGR blocks on Apple silicon M4 SoCs (t8132) are compatible with the
M1/M2/M3 predecessors. Add "apple,t8132-pmgr" as M4 specific compatible.

> diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml =
b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
> index 1d2001836eb48..da660fa13f771 100644
> --- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
> +++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
> @@ -41,6 +41,7 @@ properties:
>                - apple,t6030-pmgr
>                - apple,t6031-pmgr
>                - apple,t8122-pmgr
> +              - apple,t8132-pmgr

[Severity: Medium]
Should the companion power state binding be updated to include the new
generation as well?

When adding apple,t8132-pmgr here, the child PMGR power states typically
require a corresponding update in
Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml to pass
schema validation.=20

For example, the previous generation is listed there as:

properties:
  compatible:
    oneOf:
      ...
      - enum:
          - apple,t6020-pmgr-pwrstate
          - apple,t6030-pmgr-pwrstate
          - apple,t6031-pmgr-pwrstate
          - apple,t8122-pmgr-pwrstate

Will apple,t8132-pmgr-pwrstate be needed in that list for M4 device trees?

>            - const: apple,t8103-pmgr
>            - const: syscon
>            - const: simple-mfd

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811-apple-m4-i=
nitial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev?part=3D3
