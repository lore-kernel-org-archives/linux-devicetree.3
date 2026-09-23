Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E9549C4AF
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164833; cv=none; b=HohJ7TQEpHUjAEAoE1CPMHwqdr/FXOneRKpivQnYXHn40PgXHKd+a1PMe06QzTmi76ORiYWULYwQsMXWC9o5aancK4/rXoHa/Vx5p43S12JSKKXf6qaKjMSIH8t9zlZOZmP+NQYmWn0PtjKGm4SIAeGMZoTGDfqwGhAFLcMV2so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164833; c=relaxed/simple;
	bh=DrImnXGCoJx4++96MkHo6WOWTV0m53F/LSQ7/1nKckM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HMdXaR+h7URF6400DEaAPbfKH+akQinII+Qd+w0Xnciz4v8dSPtsNJ89ItuqTqAOqaRUAZ9b7Vt6NLg0qxX8lLhuzCfM45MW3bGOENiaxb4ZxIENjxvb8v89+iL1WwASS0ogvvu8ZvlfaRFNqFGL0aPfmOMNEmI6dKyfTH4QW/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wmsc1E6a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wmsc1E6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A2D1F000FF;
	Wed, 23 Sep 2026 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790164831;
	bh=XB4BUKjxqcNG7O6VXKX+/Q9C2QHBlXxMLaWGtie9/KI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wmsc1E6a4f4gklDjiY4Zk9wMC9I7mqExge2blvj5GBbgZ1at334tsU6JmHbUJPrve
	 3pCfVlYvdRvr5f4S5/topDfXBMYSM2QyC+0Fje8KAeJcDM4YdvmHd2wIBjTTHM28Fk
	 wKTS3/LLmkCNpxTgYWMqSE/8iHH+16IqSFvRFhdEzgwFcGYu7w6ODqvA610NOlNuvL
	 GSONv800j8ignAJhH8bXffE86VV1nH04SOl/i/Y+DaX0+gpQHwZ3WhS2U162HxS3c/
	 Ub2reTv3waRbaEfPWhAoe1/WAfWF6WIR5oWp8EWvhmseLneVY9Uf5I353y6b/9wkYP
	 wCat/adxFiM5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: thermal: amlogic: describe bus clock
 for t7-thermal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260923-fix-t7-thermal-clock-v1-1-7d4c4682f182@aliel.fr>
References: <20260923-fix-t7-thermal-clock-v1-0-7d4c4682f182@aliel.fr>
 <20260923-fix-t7-thermal-clock-v1-1-7d4c4682f182@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:00:31 +0000
Message-Id: <20260923120031.88A2D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] dt-bindings: thermal: amlogic: ABI breakage by prepending new =
bus clock
--

commit 9cad8324bf204ceb98e53aadbfac54a0b8d04da6
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

dt-bindings: thermal: amlogic: describe bus clock for t7-thermal

This commit updates the amlogic thermal device tree binding to support a
secondary "bus" clock required by the t7-thermal sensor. It adds the
"clock-names" property to distinguish between the "bus" and "core" clocks
and requires both for the t7-thermal compatible.

> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.ya=
ml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> index 8cfa44dcda58c..e72cb39ac635d 100644
> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -32,7 +32,15 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Bus clock, gates register access to the sensor.
> +      - description: Functional clock of the temperature sensor, shared =
between sensors.
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: core

[Severity: Critical]
Does prepending the new "bus" clock at index 0 introduce an ABI regression?

Since older kernels use devm_clk_get(dev, NULL) to unconditionally fetch
the clock at index 0 (as seen in drivers/thermal/amlogic_thermal.c:
amlogic_thermal_probe()), updating the device tree to match this new schema
will cause those older kernels to fetch the "bus" clock instead of the
functional "core" clock.

This will leave the functional clock disabled and prevent the thermal sensor
from operating. While a later patch in this series updates the driver to use
devm_clk_bulk_get_all(), the device tree schema remains broken for older
kernels.

Would it be better to append the new "bus" clock at index 1 to avoid
breaking backward and forward compatibility?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-fix-t7-the=
rmal-clock-v1-0-7d4c4682f182@aliel.fr?part=3D1
