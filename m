Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C6F47C0EC
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033865; cv=none; b=MkK0EHFlLPWn25SVl2vJi3GUgXbd1J8IvS4E/tE7CO0iw0hcdrOaTUMV9CBOej8gHpI+fkXOYskgnf2RkKOKqp0ctMhsae8uXXhpt1VmMRNQSf8CYoFQyC7NPI8mC6Y/h+edKmwg0FiGzMEkfwMYZMDCsys8MUtCRb9cIsqvN4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033865; c=relaxed/simple;
	bh=yht2jCfHJOSOTOPOmEl/7/iTEPDSdavHEKugd6CGfrI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ohegkex55Oc3Ii/PiQCIwtltRZR7FpqnaxdSoMT++s2e+Z+t8dDGDVayumleCZ0N5UXz1z3X4xvkO4KyevDP/6hmXmYSD09ntj8aaTONy0aa/nRm7ytxTc3lTMZOEWivCVPYmZc0JF26XhmX/a1xzjw1u9Wa2yK5ptQEi/BQ1ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPH5jDqF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPH5jDqF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDBF1F000FF;
	Mon, 21 Sep 2026 23:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033864;
	bh=mbfWn830pBx/ojDJ0XgG757c95ud6c6sSQURTBXIyzk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MPH5jDqFBV+T7WLh0wpIWZLOon+6chDgrd2NjkTvjT/h0BnncgmsRTfWBGTXxn57h
	 +zDlNuZhiuQ80ctwuy1zsh1qm76H7a7xdXGMu2FBblZ22WXTTc0HW1vLxswx/g3Abw
	 0MqnpWRuK6TJy38/oB8wDrn993Sa2dcBVUiLQUBgye8ttf/xWpo6lrf2qva4F3yqgx
	 OcOjG0NR5lza+Eln7exsZHySBVxbDT/h8FKzOxCivDGVVyit5oXdaTjJTQ1jD+wE+S
	 sprMqbWA7SQyfw4FElfQDf5gbQ9khM3az1Buc4IFz8YntCIDAaoQ8Rg0jk5NChtkoX
	 pWDmljMq1x+aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921232834.3138571-1-robh@kernel.org>
References: <20260921232834.3138571-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:37:43 +0000
Message-Id: <20260921233744.1FDBF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: clock-names schema forbids valid single 'atclk' config
--

commit 50eea7a4ef1f09b2ff4cd2b8b69396c108a1c74e
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: arm: coresight: Allow funnel clocks

This commit modifies the arm,coresight-static-funnel schema to allow
one or two clocks, adding support for the apb_pclk and atclk properties.

> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-f=
unnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-fun=
nel.yaml
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.y=
aml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.y=
aml
> @@ -30,6 +30,16 @@ properties:
>    power-domains:
>      maxItems: 1
> =20
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: apb_pclk
> +      - const: atclk

[Severity: Low]
Does this positional item list unintentionally forbid valid single-clock
configurations where only atclk is present?

By specifying items as a rigid positional list, the dt-schema validation
strictly enforces that if only one clock is provided, its name must exactly
match apb_pclk.

If a device tree node for arm,coresight-static-funnel provides a single clo=
ck
named atclk, it will fail make dtbs_check. This seems to conflict with
hardware configurations where static funnels lack APB registers and may only
require an ATB trace clock. The coresight driver itself appears to fully
support this configuration, as coresight_get_enable_clocks() gracefully
handles an absent apb_pclk.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232834.3138=
571-1-robh@kernel.org?part=3D1
