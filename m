Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1741643B
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727623; cv=none; b=XqLG6KtNqgB/U662dYIoIcO5eoWocJTEusVvMyYEtlnTWUbNWnEMtnYZVWUooVGyRh210YKw3AoBLYNQA6uEEv0+qEIAVUA1LcFK2BTCCz/gUsmLAbYQwPJMCzne7Fvn0Say73ClHwCh4luNC+I+5WlGKx7/Q3kEv0oynJ4WP8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727623; c=relaxed/simple;
	bh=Y/REJJckGutvq0UpZhJDhW2jds7aXaEaqk6EQ4CJvKY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gAofe43D8jZSm1Cel4H85RMTLYW38xk4o42xfGFpBUCrzEWyiz7My73jFWGCt9bD//Z5dbezqT9zn6tUKRDZStp73DDfSp8kkJtVPTK9cfOdBTlOm9HATIKMWhYijE7Qz/AhSygF+0P+EdI0ojlPBbwV0NgpT6GL6jlf01gKPDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOfFepts; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOfFepts"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B09F1F00898;
	Wed, 30 Sep 2026 00:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790727622;
	bh=U2FE6DS2LTakAuHu9mZgpqnAuSCe/t3o23HWXKkJ5ac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BOfFeptsP55bOSr8dGExydA8BSpcPFcM+HCW8D6suJy/57wwd3YdnjuvcypKhvYFB
	 bGOv1v/NwXe5M1Lcnhgclb3XNIEuiMlf7gHDKSMDhp+DVoWXrXGb0cnlhQZ72FUmAF
	 D/HuBMf0Ge2QhL5c7nbUF9VSix1+ukCTY7z+XprvQcQtMx8MqRW0VokPiyCeRW3j2J
	 qb2aRz422hcSjk3evdRGdzEtLUisejfIbpOnQ0mT4deZ3BagOMxPXyEf3I3ppF2RU+
	 S5lrtAEN1I7+YA8irB412CZ4fsnEqV6O0jFps9pjpuXcjJB8zAqExoIRjJrr1eszXL
	 waaR4m8jeL+9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Klimov" <alexey.klimov@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-2-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
 <20260930-exynos850-cpuhotplug-v7-2-203245826333@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 00:20:21 +0000
Message-Id: <20260930002022.0B09F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: incorrect reboot-mode restrictions applied to Exynos850
--

commit f0529e2252a91a7f009c0becdb948b0784d4d52f
Author: Alexey Klimov <alexey.klimov@linaro.org>

dt-bindings: soc: samsung: exynos-pmu: Require pmu-intr-gen-syscon for Exyn=
os850

This commit updates the Exynos PMU schema to mandate the
google,pmu-intr-gen-syscon property for the samsung,exynos850-pmu compatibl=
e.
This ensures the hardware is correctly described for the driver to obtain t=
he
syscon regmap.

> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -196,6 +196,7 @@ allOf:
>            contains:
>              enum:
>                - google,gs101-pmu
> +              - samsung,exynos850-pmu

[Severity: Low]
By appending samsung,exynos850-pmu to the google,gs101-pmu conditional block
to enforce the syscon property, does this unintentionally apply Google
Pixel-specific reboot-mode constraints to a standard Samsung SoC?

The reboot-mode pattern properties in this block use a negative lookahead
regex to allow only specific modes (like dm-verity-device-corrupted or
reboot-ab-update). Standard Samsung Exynos devices utilize mode-download,
which is explicitly rejected by this GS101 negative lookahead regex.

Should the requirement for google,pmu-intr-gen-syscon for exynos850-pmu be
encapsulated in its own separate conditional block to avoid breaking schema
validation for valid Exynos850 device trees?

>      then:
>        properties:
>          reboot-mode:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-exynos850-=
cpuhotplug-v7-0-203245826333@linaro.org?part=3D2
