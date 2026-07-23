Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE70635BDC2
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796043; cv=none; b=oMPsshZuRZUZhKowK6+exuVBFpMUf1386zm8K++iFhmxUp01jZf3vYrh9WC6ZvCwWwLRr//0IMUfcSEXgOYl9Ubnp+vGsc8BT5C/epaS1uHFkMVEfi25bWJEqcgoS4I3CXeVYn4ssEDiN8NiAK+Do8skYf9Dl202SnQEFvyDgXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796043; c=relaxed/simple;
	bh=1SA5Jz3Bx5a7Ov4l5zA8HTcxP13x5ZODVa/I24Jb5os=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A0dbBQ2fz50SNkHq7rV1INgdHFJq9MzR8D+SiVvyz6++SNy4Wa7LNd0iu+17a3/+uBbGt/0FgeHCzhX2qC9Om7uNlVg2JWFVpXATOOpySoF7Nfd9F/oGvInYSz5NcljT+aD3bI0GzojjX5CC4y5MYV61wTalkeDGdOzGac94K58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfgcTuLa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfgcTuLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899991F000E9;
	Thu, 23 Jul 2026 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784796042;
	bh=987RKL6amHUizVFyhykMj9G7WeyTYGx5bwWfSZYX8BE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QfgcTuLaAH/jgRqf3n3ieD+SP/b+1Uhn3+FosFG2oce5lzAoCzp3j9umGmoYAgLh5
	 9yX939LJpcUxklXLXSeMJw3vvijDV8xnect7S+ezJPeayxia8NsN9bJ6QqEh0H9FnI
	 rRW/vVDv5Yuu7NwSg94sbIjqN/B92fqi7Xaxxhsai8Zn+EmF+SnqpQPPffkhvlqx32
	 CZhF5oEbMMeoTLkt1M9Ok0lyn+kKYwjk+mJh5797sUuyzS9tIQfw4nva8Hd8RKCTsM
	 WXSLy65pl2EPcRdquzGUO0KTJ3uCqTGogxlhci2T9Y1pd8UnHOUMrsDC9xgBQyV9dJ
	 ujfYGBdfBCFSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: es8316: Add regulator supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@thundersoft.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260723-es8316-regulator-next-20260722-v1-1-721f757879a0@thundersoft.com>
References: <20260723-es8316-regulator-next-20260722-v1-0-721f757879a0@thundersoft.com>
 <20260723-es8316-regulator-next-20260722-v1-1-721f757879a0@thundersoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 08:40:42 +0000
Message-Id: <20260723084042.899991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Variant-specific supply properties are defined globally, improperly=
 allowing them for other incompatible hardware variants covered by the same=
 binding.
--

--- Patch [1]: [PATCH 1/2] ASoC: dt-bindings: es8316: Add regulator supplie=
s ---
commit d435f3d7346be3dbbefc6d1734447b71df8be5a3
Author: Hongyang Zhao <hongyang.zhao@thundersoft.com>

ASoC: dt-bindings: es8316: Add regulator supplies

The ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs
for its analog, charge pump, digital core and digital I/O domains.
Describe all four inputs so boards can model the codec power topology.

> diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml =
b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> index fe5d938ca3102..f45f59b7b0709 100644
> --- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> +++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> @@ -49,6 +49,18 @@ properties:
>      items:
>        - const: mclk
> =20
> +  avdd-supply:
> +    description: Regulator providing the analog supply, from 2.0 V to 3.=
6 V
> +
> +  cpvdd-supply:
> +    description: Regulator providing the charge pump supply, from 1.6 V =
to 2.0 V

[Severity: Low]
Does defining this property globally inadvertently allow it for other
incompatible hardware variants covered by the same binding?

Since cpvdd-supply is defined at the global properties level, the schema
evaluates it as a valid optional property for all compatibles listed in the
file. This means if hardware variants like everest,es8311 and everest,es8323
lack a charge pump, the schema would silently accept cpvdd-supply in their
device tree nodes instead of properly rejecting it.

Should variant-specific supplies be guarded by an if:properties:compatible
conditional block to restrict them only to the hardware that actually suppo=
rts
them?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-es8316-reg=
ulator-next-20260722-v1-0-721f757879a0@thundersoft.com?part=3D1
