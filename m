Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3273D426D0A
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062465; cv=none; b=q0eScL19mO4B5fiwxAez1NXQr1OtOGWI+YLtd+GaNRCTzMD7XWaYMUdnIAxlycwVg4eLBVvqE9P4qpUMaAywBFOvnHtYZz73gA9pikDV1ClpGulVdh0rOaXOVY7aXWzLfcbCO2TwIfkRe1CW5e1IlZiICqTDd3xpSBFNKbM2BRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062465; c=relaxed/simple;
	bh=0Ozmvu2lwa8BPfbCqm7uqONwuDls4Dtq4KBHT1QHtas=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=g5WG8tvxaRWox1AEHs1tKV/nXmcjQN79lkrgPZNQ8QiKvPPPm0ESrWJ4D5xS0Oksi2WX9dcoJ9rrE+BG3s40ARWZy7SGl150QLn8/SiUKH+G4EUQ1935wQKXPOA8wn24xEvkfdGRTNTncs+isbnc30ed6AybCiy4LsFdxRy8FSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbPWLNnD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbPWLNnD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C9F1F000C4;
	Thu, 15 Oct 2026 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792062456;
	bh=tsLecVHZgPGIorR3sDAA8v+PoOjI7jDRhlE+LE3Ukhk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bbPWLNnDeDLrSs4p3FgKLv2Ruw78XH2YyVALGaYXtTTmvdNYeQumEUWPyil/4yY/S
	 ZTLFSGjOuHa7sTP4sJ3JbuWVUkbnG/OLg7Ph3FrcK88V4Bv/c0+hLP+LrySEgNyoAn
	 OAw0Pm+Aldo+yJhNgRt0P9mhzd7ACnirZWQMyYgZol/5eI6JtP1MIV/8LxigswfDOz
	 j/MtTLEpkuu8ZUp5/2Oegs+Awv1MEFi88iOGLXVxN90klY6gYJKHysZhbfrz+WTlq/
	 UJWrLnfp3ENAFij9MpomxYUow/ldtQevvM5Q4M4EptNk/9670LgOKiGqSzyKJt1gLU
	 VnaUZum6s78tQ==
Message-ID: <sashiko-outbox-172720@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP
 tables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
References: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 11:07:35 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: validation failure for array compatibles in OPP tab=
les
--

commit e776719b7efa77cf87d1178c68ac8aa49d25b4a5
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP tables

This commit allows the qcom-nvmem cpufreq binding to reference the generic
OPP schema for generic operating-points-v2 tables. This attempts to fix
validation errors for peripheral OPP tables matching the OPP node-name
pattern.

> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem=
.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> index 547265b8b118a..fa9330cb3223b 100644
> --- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> @@ -60,6 +60,13 @@ patternProperties:
>          then:
>            $ref: /schemas/opp/opp-v2-qcom-level.yaml#
> =20
> +      - if:
> +          properties:
> +            compatible:
> +              const: operating-points-v2

[Severity: Medium]
Will this strict match fail for fallback compatible arrays used by peripher=
al
OPP tables?

Peripheral OPP tables, such as GPU OPP tables placed at the root level in
various Qualcomm SoCs, frequently use string arrays for fallback. For examp=
le:

    compatible =3D "operating-points-v2-adreno", "operating-points-v2";

Using const enforces an exact string match, so it will fail against these
arrays. This causes the schema to skip the reference and incorrectly trigger
the unevaluatedProperties: false failure during dt_binding_check and dtbs_c=
heck.

Should this use contains with const to properly match these array fallbacks?

> +        then:
> +          $ref: /schemas/opp/opp-v2.yaml#
> +
>      unevaluatedProperties: false
> =20
>  allOf:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-opp-v1-1-f=
18fb6f9bae1@oss.qualcomm.com?part=3D1
