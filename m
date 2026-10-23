Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750293;
	b=EfUHbaYRE/spROttxsNTH6WYAeAovFnSTkIAQtORm2+Yj9ec+3+LXlGFpf0gqEUM1IEi
	 nCSZ5Ij67MIPFj/4N0tQdontl3mLwPlvb0RsgxLA7FHDphCrD59C/B8vOtULvPmNRRi4l
	 8iznPcbsOUgwZWLkecG48NqNQS6C71Ja1T1mSRcht0f7DqZsF/zz15DZeOpgWfDQ7yRbX
	 B5/aSqJ+aPVndaXNL2CcSAgemGxQGKLWN5rt1A09XMLttK+cUirOYs6QM8sD+AS1Ztw5W
	 ksOItAvlDg5SZMO7MyqlCRQpa7ddyYPE3yY77R5ULybnnvD9QyVNGnC11uYmIFjfN0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Vf0/tSIwGWWNJ9bb8An5z6jIcow8km+TWWZfgfqGZxA=;
	b=r17kvtKb/Zyyd14emKLmnYEqYT7NjPigARLv5/Sk1BEgH7LvDHWppLgBVRWk1W44W8/I
	 h4se+cojBAOHz4LXiF62JPI/84yCLYBQp/jnoDZKv39/4SJMi/bxKrlcmSNoEMMoXHV5p
	 USf1EIld8cFPSx8yiin9YaoiHsdfjljTuqSOtFSsSWPSgajEUw9spg5grgD8uj/qaz7fx
	 2m+/+B5rrWpD7orWcKFPQ7YJ86e4aP8eg/D+2Q+y5moP2Pq1GxtCmkKVSDeMFDW391jNJ
	 Vj1aOYHWx7ghmzz3JN+zzVADbRrGV66cGq8Kpf5xnk7hySrTaL7bx/30tqY5BxM/lzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HA9TF4wT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA23606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HA9TF4wT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABCB1F01825;
	Fri, 23 Oct 2026 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792750293;
	bh=Vf0/tSIwGWWNJ9bb8An5z6jIcow8km+TWWZfgfqGZxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HA9TF4wTdgTzWsI6FfD0twBZGhXuayNhhiWdvhoyASHd3jLc9O/OAA+DZC0DTCwBe
	 S1oEngfnS0Urc9m4gZUnycUPhMzI3DCCNl8hhnDezau/IdsvAqU9s74EBueeG1L0i7
	 9tVnJGJ1uXvmisZjlfiyVps8nPClS4ik4OhoGE1HDI/X36lXJxFFRRANxMQqoazT6s
	 Loqf2egc7DtRNgeQYCD3Y167/WDia3vvwOJwJD/cP8Dem89o2NKBxa5qUYMlKiyAdu
	 6iqMkE7xYaUWVT9NZd3AsBc06YikV5T70c+aHxSGQQzs+385dwokqlx/OczPSZD6oK
	 My3v2T34bDIaw==
Message-ID: <sashiko-outbox-182660@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: power: supply: axp20x-usb-power: Add
 the AXP2101
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023100401.67592-5-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
 <20261023100401.67592-5-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 10:11:32 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: power: supply: missing allOf constraint for axp2101
--

commit 2c463350d4ace5833f7eb6572cc583175ea48340
Author: Olivier Louvignes <olivier@mgcrea.io>

dt-bindings: power: supply: axp20x-usb-power: Add the AXP2101

This commit adds the x-powers,axp2101-usb-power-supply compatible string to
the AXP20x USB power supply binding schema for the AXP2101 PMIC.

> diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp2=
0x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x=
-powers,axp20x-usb-power-supply.yaml
> index 2ec036405ae47..1c582aa5e1d0b 100644
> --- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-=
power-supply.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-=
power-supply.yaml
> @@ -25,6 +25,7 @@ properties:
>            - x-powers,axp223-usb-power-supply
>            - x-powers,axp717-usb-power-supply
>            - x-powers,axp813-usb-power-supply
> +          - x-powers,axp2101-usb-power-supply

[Severity: Medium]
Should x-powers,axp2101-usb-power-supply also have a corresponding if-then
block under allOf to constrain input-current-limit-microamp?

In Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power=
-supply.yaml,
the top-level input-current-limit-microamp property only defines broad gene=
ric
bounds (minimum: 100000, maximum: 4000000), while allOf restricts the prope=
rty
for each existing compatible variant:

  allOf:
    - $ref: power-supply.yaml#
    ...
    - if:
        properties:
          compatible:
            contains:
              enum:
                - x-powers,axp717-usb-power-supply
      then:
        properties:
          input-current-limit-microamp:
            description: Maximum input current in increments of 50000 uA.
            minimum: 100000
            maximum: 3250000

Without a conditional block in allOf for x-powers,axp2101-usb-power-supply,
device tree nodes using this compatible string will pass schema validation
with any input-current-limit-microamp value between 100000 and 4000000 uA,
even though the AXP2101 hardware only supports discrete limits of 100000,
500000, 900000, 1000000, 1500000, and 2000000 uA.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023100401.6759=
2-1-olivier@mgcrea.io?part=3D4
