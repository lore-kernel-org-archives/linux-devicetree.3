Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2078F4534A5
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918162; cv=none; b=Pacp7Vk8gs6fqyJNiaBJsZSyyxjWzy0ZauKeaJH7OYAGJ+0VPAp72bwvBNfm5IGQTH032vlb/yirGxZKgqANSxrLaRnd4IPEs3nbfFGT1WQylUtmvITRT3JXHTDbUgdlwwg8zpm++dYifZOv66NlcEy4nfZDL69yK43N2LVxaK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918162; c=relaxed/simple;
	bh=xfnJ7fo+ERBdQX0zI3It5v7enV/695xUbSdZqrHEMzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XUqsHt4sDKt7qaDw1UDs40Je9QE21DnzWWQdhoNqCZyvc/vuWrrc2fakKTPIdblc1+j91gi6ZJlJPjNow4wja45QG5cQIWHASHZsUMgZ7xbSNxCmYBSTEwGNlrx9uWlEE2p7pcBAnWe251c+iqfUpa2bawsCOkmkcoc7fm/Jj30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZ0v/UxM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZ0v/UxM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634ED1F000E9;
	Fri, 24 Jul 2026 18:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784918160;
	bh=UZNDehn9YPFHL6zWJ9+T31P8BNEbpzn8Q5dJB1lKwpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PZ0v/UxMuPulbN4fsjrTgzOwLsOtIMU/WAIiOy58ixHHiZP59iHHJrb7Yo66ORbZS
	 kEYDEmPr5HN0VTgOoH5KF6suO1kGNOfDcBoG9/cFOS/wmlon7aUJqKIU15WrHqrjp5
	 XDg4fimvumt+q3BN/251VsKIthgf5fGloeGnRfnYZSLGwTKd+TlDY+Dkn+MRyy8DQZ
	 YWKLufHnYkfBWAuj1ULbSP2P5Y9GwtC9jH34WmnkEiBVt0tGIC3e0dF2vQi8/F/OFA
	 3zM3KEjky0XYfIS0ls/VIdT8hPsT9VKO5M0YM63bVN9H5Owty1NaltBmLARXW6fqPm
	 6VfuDosOgFS7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/9] dt-bindings: arm: apple: apple,pmgr: Add t6030
 and t6031 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janne Grunau" <j@jannau.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-apple-t603x-initial-devices-v3-4-bbeba0420603@jannau.net>
References: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
 <20260724-apple-t603x-initial-devices-v3-4-bbeba0420603@jannau.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:35:59 +0000
Message-Id: <20260724183600.634ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete device tree binding updates for Apple PMGR subnodes.
--

--- Patch [4]: [PATCH v3 4/9] dt-bindings: arm: apple: apple,pmgr: Add t603=
0 and t6031 compatibles ---
commit bc25eb1e6eaf03811fe921a56f06dda28c171040
Author: Janne Grunau <j@jannau.net>
dt-bindings: arm: apple: apple,pmgr: Add t6030 and t6031 compatibles

This commit adds per-SoC compatible strings for the Apple M3 Pro, Max,
and Ultra PMGR blocks to the apple,pmgr.yaml binding.

> diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml =
b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
> index c67b67ba065af..1d2001836eb48 100644
> --- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
> +++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
> @@ -38,6 +38,8 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-pmgr
> +              - apple,t6030-pmgr
> +              - apple,t6031-pmgr

[Severity: Medium]
Should the corresponding power state compatibles (apple,t6030-pmgr-pwrstate
and apple,t6031-pmgr-pwrstate) also be added to the child subnodes?

Because apple,t6030-pmgr and apple,t6031-pmgr are added to the parent
apple,pmgr.yaml here, device trees implementing the new M3 SoCs will fail
schema validation when defining power-controller subnodes using per-SoC
compatible strings.

For context, earlier generations are enumerated in the power state binding
under properties:compatible like this:

Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml:
      - items:
          - enum:
              - apple,t6020-pmgr-pwrstate
              - apple,t8122-pmgr-pwrstate
          - const: apple,t8103-pmgr-pwrstate

Does this regression mean make dtbs_check will fail for device trees using
these new M3 variants?

>                - apple,t8122-pmgr
>            - const: apple,t8103-pmgr
>            - const: syscon

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-apple-t603=
x-initial-devices-v3-0-bbeba0420603@jannau.net?part=3D4
