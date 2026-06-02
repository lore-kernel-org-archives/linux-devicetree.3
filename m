Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F31B3D410B
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395372; cv=none; b=g57Cvbpa0JOe1ALYt4v6FMP4ZZHv4B4jL7cZDJDABpMyksj43BqAheiG033DFemkYc+SjvH9d05a/o+5q/SYd5texzYpAv/zo+/J8G/ZEwsXGYIRSOruDyXJO98x5DJJrPzw7iDxGZJe67l4DAmOgiaMJPlWBpqyQEZXGx5dJro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395372; c=relaxed/simple;
	bh=f84VhQa/St2+evr4TtwcBCBAVfxHSYOs3xw1PSgUknk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FmPXWaOTs4f3r2WuAsLvi99fkGCandvW/5GkaSf4uIJr1Me2TGet0rpEcRtwbz/EAvxe6CmM+KSYK87tzw6Teadkn0FI3UPBGEXnDVx4wv0mmP2TZpcCQsVo6/52HN1zu0k1AP4DW48GFIhj/VCDZXtnNCNu1IObsgfQSDngl9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlwLhYeP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlwLhYeP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0971F00898;
	Tue,  2 Jun 2026 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780395371;
	bh=F+Nk+ceO0alfZGjD8Y4fftB4La0hJqtLUjdGIzsLjO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BlwLhYePlqgHrTK2Jqqu6xpAwlw4J2a6UPAetKrJlhxF/j8sS6tVKqkbrgzShUsPj
	 sS6ezbuSAhMayG1MNhg1cUh1UaUGAN0yH7Uud3l+5zByu2tmj6LR65dD0lnzstCfO9
	 g5Cs0njN7NyIZ13y1RUdh8tz9XkSjj+bhevQnzcGyAFaWIp27APJzP5QVYFRbhea2C
	 b5gS/V7gTH3lQPcQ6Xs83rLSwy17E02+4RJsZtk/IPMMgHomFA0JLPvfLy8tyddPv5
	 tT0TMfOIgIfjdkV01NvJnaDj4nVf4RCVzPiJzPXmFnjTHjDQHbIpQ4BjPTtBrnx7WY
	 yCVm4gKAjPrZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: ti,tas2781: Add TAS2573
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baojun Xu" <baojun.xu@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260602100532.6463-1-baojun.xu@ti.com>
References: <20260602100532.6463-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 10:16:07 +0000
Message-Id: <20260602101608.5B0971F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The dt-binding schema enforces mutually exclusive `reg` constrai=
nts for `ti,tas2573`, causing schema validation to always fail for this dev=
ice.
--

commit fae137d4c240a643a606f184ad877663a7719392
Author: Baojun Xu <baojun.xu@ti.com>

ASoC: dt-bindings: ti,tas2781: Add TAS2573 support

The TAS2573 belongs to the TAS257x device family, featuring an integrated
DSP and IV sensing capability. This commit adds support for the TAS2573
to the ti,tas2781 dt-binding schema.

> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Do=
cumentation/devicetree/bindings/sound/ti,tas2781.yaml
> index b21466bb0730a..aa5a317b5a361 100644
> --- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
[ ... ]
> @@ -183,6 +187,7 @@ allOf:
>            contains:
>              enum:
>                - ti,tas2563
> +              - ti,tas2573
>                - ti,tas5825
>      then:
>        properties:

[Severity: Medium]
Will these mutually exclusive reg constraints cause a regression during
schema validation for ti,tas2573?

Since the schema requires ti,tas2573 to have ti,tas2781 as a fallback in the
compatible array, a device tree node will typically have:
compatible =3D "ti,tas2573", "ti,tas2781";

This triggers the conditional block here, restricting reg addresses to
0x4c-0x4f.

However, it also triggers the later conditional block for ti,tas2781, which
restricts reg addresses to 0x38-0x3f.

Since reg cannot satisfy both disjoint ranges simultaneously, will
dt_binding_check always fail for valid ti,tas2573 device trees?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602100532.6463=
-1-baojun.xu@ti.com?part=3D1
