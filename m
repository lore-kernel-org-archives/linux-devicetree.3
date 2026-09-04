Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74F1490BEE
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524522; cv=none; b=IcQZvtWRLw+PhNniq1iGiuQ3onbalejA37OXSr1Nte9TC80pbXPZhht23N087Do8cjTEqBBXdACNO8/NShEVWUL2RRjqjkotLZ3/fsM1WBUtXs3nmKn+5jc3JKyQqUcddiDrKhVOT19lzdDTlPrvtV9BqpySdAEKMjpsOjMdgbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524522; c=relaxed/simple;
	bh=1fcP2p47jiUxDB5lR/C46EFD+az51MAFSn8LEQZqjiI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cD7oAgzDv7ywDEVyNHBJ3ttZS0kHaXKstywtOazMerHMfo/72EAzcbw8/CUafrghIf+rBMgg+cOcIJvFxAYjb917BC6MF9hUQLKGUy5VzMBMUCuAIr7JdG7jITYc2EzC0mxYzvL4Vl651xh2WimgWasgEUMHYQ8uj+RD3t0a5Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnzS4Wlu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnzS4Wlu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE6F1F00A3D;
	Fri,  4 Sep 2026 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788524521;
	bh=l/jcdROZr3hWAE2N/t+VQaAa04pCTwZeDsl1kOIqcOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fnzS4WluzMtP86KW2iSLc2MGy8zUAlicEbBiabt3k1kJFikTOA6VwT222y9lsTBmQ
	 FwV6y1T4tmq7H/1EkrEaP/J0KmWU6X+RXcXEn/6uyE8Zai5Rk273ZVd9SNxAZCZv0G
	 XMFevYd6bKz2I8eiupXN8t1CCXIUQDIhPf2vXbPMrvawAg6OtZUXyZ5y0bYrUrjKFG
	 tb0k/Qs50v13clsMSVOW+G+kHddYJthZDiVuWxDu+N32023jx6XuDHCYDcVDHWjmVP
	 pAN0YHAIx7dLHuPUTk9Wd9MOFSabduhs+33DUTG11jjbPNsoADJFVOjYIYoijP0cFq
	 rt7hLAuVqJ8KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: realtek,rtl9301-mdio:
 Add clock-frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260903122119.2638354-2-markus.stockhausen@gmx.de>
References: <20260903122119.2638354-1-markus.stockhausen@gmx.de>
 <20260903122119.2638354-2-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:22:00 +0000
Message-Id: <20260904122201.0BE6F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `clock-frequency` property in the device tree schema is missing=
 required hardware bounds constraints.
--

commit 740105b9d636a18be6fb1810649547d948475058
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

dt-bindings: net: realtek,rtl9301-mdio: Add clock-frequency

The Realtek Otto Switch ethernet MDIO controller supports different MDC
speeds ranging from 1.25MHz to 10MHz. Document the clock-frequency
attribute for the device tree.

> diff --git a/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.y=
aml b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
> index 67e0b23a8470e..6db3315ce96b3 100644
> --- a/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
> @@ -56,6 +56,9 @@ patternProperties:
>        reg:
>          maxItems: 1
> =20
> +      clock-frequency:
> +        default: 2500000
> +

[Severity: Low]
Does this schema definition lack the required bounds constraints for the cl=
ock
frequency?

The commit message explicitly states the hardware supports MDC speeds rangi=
ng
from 1.25MHz to 10MHz. However, without bounds constraints like minimum and
maximum or an enum array, dt_binding_check will successfully validate device
trees that specify physically impossible clock frequencies.

If a device tree author sets an out-of-range clock-frequency (such as 200MH=
z)
in a DTS file under patternProperties:^mdio-bus@[0-3]$, schema validation w=
ill
incorrectly pass.

Should this property definition enforce the physical hardware constraints w=
ith
minimum: 1250000 and maximum: 10000000 (or a predefined enum list) to
accurately enforce the described limitations?

>      required:
>        - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903122119.2638=
354-1-markus.stockhausen@gmx.de?part=3D1
