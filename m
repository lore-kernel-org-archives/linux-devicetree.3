Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95682866
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785669753; cv=none; b=cDz1qFvGHWalbz00zzEhGATlTdAi//+XJhQh1799eRntxnMRfeVu1DvGM/HnZUmhB06boyRdcxmWuz9T71l9VhAJ+uHOSGkeNM8pP/67V8XFwvKHePEWZ3IG9H6SETQJ6cwP8sBS2ep7IqAavAAoaAMUKkkbqLhb+P2a/kNE1lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785669753; c=relaxed/simple;
	bh=OhZ85jLGzyKLHACI2CX7NiwCR6IeNXqeyFEqmTp+nhA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h9Vu89ugkhv4c9+a4HALnrebGMQtxTlfOS/Mog+vvqA0s3ADEgjiPQx3mXpm5tD9GpCVxt0+4kgYnU2+K33MJntK/J6IMe2ZzdopVCVanWxcBxDcy201o2JmDPrdnpbx5nwoNaNKdTvHPN/hU5U6WHKyiY7lQUq6dDqZxIANgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crML+lHo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crML+lHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DD81F00A3A;
	Sun,  2 Aug 2026 11:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785669752;
	bh=dNKxO+r53WMb4KAIoaR8u69Dsxtbh3P5uR6qxVZHoCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=crML+lHojSw1GKh0HxVALukwfqgkiaVL/nTuL0b7/uIEMk+s6n3vmQnRcrlkoRG2w
	 93DsYS8jnX8S30ktfdVzp9RBLttzshI3sbq5qAym6Jr/zKov8Unrwz8q83lTZUnGcR
	 N2Mg0LDGRnCh6tkmZzOAQjIrnpyHoQ+Bc4Ul/LxWjrzAgDKGmEd9t9ulCmH2+ayQfB
	 v/TZprj+PSnjNcD5/16FEilZBE+GuTSZLRjZxTRWUj/mp/9WvReGFZOYkTUuEFNtw8
	 FCWg8AsfHanp2Dh1IGmNPU8x3Kfnm2u8mXSOXJO7Wl0W1UCUADp3LmszCuKSdtJ12k
	 1znGb01HGhZ8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/25] dt-bindings: clock: mediatek: Add MT8189
 system/base clocks and resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-8-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-8-ac4410697cc2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 11:22:31 +0000
Message-Id: <20260802112232.38DD81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `if` conditional block checking `compatible` strings in `med=
iatek,mt8186-clock.yaml` is missing the `contains:` keyword, which causes t=
he condition to always fail.
--

--- Patch [8]: [PATCH v5 08/25] dt-bindings: clock: mediatek: Add MT8189 sy=
stem/base clocks and resets ---
commit 58f0ae2ed060320d3d6921afeb65e04b05e09665
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: Add MT8189 system/base clocks and resets

This commit adds compatible strings and binding headers for the system and=
=20
base clock controllers, as well as reset controllers for the MediaTek MT818=
9=20
SoC. It also adds compatibles for frequency hopping and spread spectrum=20
clock functionality.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> index ab9f8cb7dd6ee..380dab8f4e983 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
[ ... ]
> @@ -133,6 +146,8 @@ allOf:
>              - mediatek,mt8188-imgsys1-dip-nr
>              - mediatek,mt8188-imgsys1-dip-top
>              - mediatek,mt8188-ipesys
> +            - mediatek,mt8189-ufscfg-ao
> +            - mediatek,mt8189-ufscfg-pdn

[Severity: Medium]
Is the conditional block wrapping this list missing a `contains:` keyword=20
before the `enum:`?

Because `compatible` strings are arrays in the device tree, comparing them=
=20
directly to a scalar string list using `enum:` will always evaluate to fals=
e.=20

As a result, the requirement for `#reset-cells` will not be enforced for=20
these newly added hardware variants, allowing incomplete device tree nodes=
=20
to silently pass schema validation.

>      then:
>        required:
>          - '#reset-cells'

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-mt8189-clo=
cks-system-base-v5-0-ac4410697cc2@collabora.com?part=3D8
