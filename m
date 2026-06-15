Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C53140963C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781540662; cv=none; b=iOKv36W+sTO1Nm4qBkDXeae0B883m7YP4r4Yku2S7NUS4OwoQ5Ejjiimy4P4AlpPPL809NH5cLqcCmLZalu4f493Dg1ZtTBFDPHsPvs55hjjLbKPTDU2raPeN5nFBpiCGbkyKYLszmslQgo1KjK6x0naSa7d6C69i8i7z0DE7ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781540662; c=relaxed/simple;
	bh=Q7c/NMSHjYKqqzRK4ynaC5ZpCoSj5lV+1Asj8hqT12o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XfRMGGFEmpcvTAA2RrFPdyH0BbGwHRypfKSCHUuCfg8L0WzEcHIQvjaRxlWRoceZSFyw+JiP+/IUnOd4LoLNZKp+7ep6BJ2MVGn6wcEwqu3Sbmw1f84CYafLvqpLb9bKtxQw87FVg2maVPEvgtxtpb3Xyhm1uIppPUfQTa2trnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oX7OuEko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oX7OuEko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C512B1F000E9;
	Mon, 15 Jun 2026 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781540661;
	bh=47Dcuv73lzfZc1kpN/UgpIBQiNtJh3Y8tS+NVhkIIjo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oX7OuEkouMTMTO4bX6TXlgZZBludLnpizvyu6A/QqXbxvBcmXToX5MiGL3kitWoh+
	 n7WebJfML4XV8bNB31ENGW1kpjyrrjauyAoulOtNUILqszxMPCzYkpHdQtwR3Y8fGy
	 cuEyL0wBbIWdL978b9Mn7Kqw9cu5mUZhO1KlAAKii1aQY2eTUGSWxyoNd2doSHemYR
	 MfXPofzZXkNf20NCBW8w0TztdBEdr+Nqj5GFDY0Cm2aKWzm/RyVdflPXpfSzowFnoy
	 aPjWBlFAmUddAbYCVln5ZA2+VhjBx1XBKz0QbpeSPuRilTovbia90sNU9Brae+QAEU
	 zuBuwsN9AjUqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 1/3] dt-bindings: pwm: opencores: Update
 compatibles, examples and maintainers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hal Feng" <hal.feng@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615155759.129210-2-hal.feng@starfivetech.com>
References: <20260615155759.129210-2-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 16:24:20 +0000
Message-Id: <20260615162420.C512B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Invalid YAML indentation under the `items` block violates the subsy=
stem's yamllint rules, causing `make dt_binding_check` to fail.
--

commit f6d46c997f1ef83c6c55a27e0e3260fdf27add18
Author: Hal Feng <hal.feng@starfivetech.com>

dt-bindings: pwm: opencores: Update compatibles, examples and maintainers

Remove the jh8100 compatible since the JH8100 SoC has been canceled and
will not be released. Add the jhb100 compatible to replace it. Use a oneOf
construct to support the single-string opencores,pwm-v1 compatible.

> diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/D=
ocumentation/devicetree/bindings/pwm/opencores,pwm.yaml
> index 52a59d245cdb1..5f05606a2d3d4 100644
> --- a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
[ ... ]
> @@ -19,12 +19,14 @@ allOf:
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - starfive,jh7100-pwm
> -          - starfive,jh7110-pwm
> -          - starfive,jh8100-pwm
> +    oneOf:
>        - const: opencores,pwm-v1
> +      - items:
> +        - enum:
> +            - starfive,jh7100-pwm
> +            - starfive,jh7110-pwm
> +            - starfive,jhb100-pwm
> +        - const: opencores,pwm-v1

[Severity: Low]
Does this formatting cause make dt_binding_check to fail? It looks like the
YAML sequence markers under the items block are indented to 8 spaces,
matching the parent mapping key, instead of being indented to 10 spaces.
This might violate the yamllint indent-sequences rules.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615155759.1292=
10-1-hal.feng@starfivetech.com?part=3D1
