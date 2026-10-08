Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D85046A611
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448642; cv=none; b=gXFQ1Ek2/Fx93LWxDUFh+g9eWC5n2vIZnGnwLMw8lcAxAcnIrv2GR1Oo33ktEsfZOXzRJnLbwsmpmdTDJ+v6xqyEdNgP/0Uf6Ro4EkMw9rxMaHum0Dod9/BTbCmd/EKBZsgQV06M6SpON0d7JhTEqXKLSo5CSEoiHwqbVfPk31s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448642; c=relaxed/simple;
	bh=7gfQ3/O6KDKwmoc0pmZJEUXx+om9gQbJ9WDsJH5IWik=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lYSfySAG6sSa/ZUq5n/BIeibkwiTna0VOQs17eW4Yx16QKEx+Eeb9VayPWZvb9oC1wD2VjFjVz2/UL5BgYHPsO9bsMjrBQfS66Uw0QbkOUKuRYaKJDyjPMJl86EU0I3FNQDIyfCXdM50miYeXelPtUiGcc097QiYtJF+bSBBXWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlocJ77z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlocJ77z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0C41F000FF;
	Thu,  8 Oct 2026 08:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791448640;
	bh=bAZcgpB3cUMzXvrd7hMOdca2kr1Chvhfx+pYMwy0v4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jlocJ77zQpGSzLtHHsa2QaMeuHy4EoZlm/Y34lIOP8YqRDpRWhyB3O1HIfLso8iFw
	 66ULQMzfcrWGm/jGEfB60+ZcFpWq/1gngp0RsCbSga2HyqqXkrbiJOeHhFScGKgSy7
	 c8BcOceYEgJ4EgVESdjngLFk30eKuv/WV+UW0TmezksrTixS+B5XpEyz/tX0J9mnFk
	 l1GrBhi3pjnpF9kfv7rwEQj2jxDBh5/DrHN6cuN3eY6KzwaIZkPMcE+nX5X4PPhpxG
	 TT/OkqmofbG3F//F8YTmy4HewYdaxcDCZ/eLJDsUelL8zGjjM/clEiVlYasARgrFsb
	 3QP6oCwqZyYNw==
Message-ID: <sashiko-outbox-163845@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: iio: imu: Add bindings for ADI
 ADIS16607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261008-adis16607-v2-2-7c94df80878a@analog.com>
References: <20261008-adis16607-v2-0-7c94df80878a@analog.com>
 <20261008-adis16607-v2-2-7c94df80878a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 08:37:19 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: commit message claims nonexistent FIFO watermark pr=
operty
--

commit 46f4e849c03631bf69981fbde007debcca23f628
Author: Radu Sabau <radu.sabau@analog.com>

dt-bindings: iio: imu: Add bindings for ADI ADIS16607

This commit adds device tree bindings for the Analog Devices ADIS16607
Precision MEMS Inertial Measurement Unit. It documents the supported
compatible variants, required SPI properties, and optional properties for
external clocks and reset GPIOs.

>     The binding exposes optional properties for:
>       - An external clock for sync mode (falling back to the internal 8 k=
Hz
>         clock when absent)
>       - A hardware reset GPIO (active low)
>       - FIFO mode for buffered data acquisition with a configurable water=
mark

[Severity: Medium]
Is this commit message accurate?

The message claims the binding exposes optional properties for a
configurable FIFO watermark, but looking at the properties block in
Documentation/devicetree/bindings/iio/imu/adi,adis16607.yaml, no such
properties are defined.

Because unevaluatedProperties is set to false, if a developer attempts to
configure a FIFO watermark in their device tree node based on this commit
message, it will cause a schema validation failure during dt_binding_check.

Are FIFO watermarks managed dynamically via IIO sysfs rather than statically
in the device tree for this hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-adis16607-=
v2-0-7c94df80878a@analog.com?part=3D2
