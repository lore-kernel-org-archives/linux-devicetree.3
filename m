Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C25B4028F9
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944810; cv=none; b=ARs+EYA1xpSCn+ROqrrN6fhsyAIIk8ortI8y8dWmx48/i6wCI8Db3l3bsQLyF6wLQs36WaUs8O5k/iosHCh/zJWNozbnQmjXaX9XjVZ0H/3+HKIRwHe6VeA7c1XkraZ03Mzr1NcAJySeQndVBEHrAl3F+uuGGFlkoUg4QqTDfmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944810; c=relaxed/simple;
	bh=TOAJWFKrxRXH5jqbKNlPvuPzCA0aLxl2923ZzwLda0o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rdpk8odYxHHLUkqZJeYfpDLfFRcEuwxWTRwJ2FOa+H+dGvTLdjzERtTf1E4OuUAFMxXs99r4uJFydY3R/Xzanpvszwp1Cm0t/6aDKCKSL58LMLdzqG0o13Kb8WWB5/Kzt1ZMH8KrFLl5guEcdBurFzIqjQfhOLLTt2LuY3G0QSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WonuKhYI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WonuKhYI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339151F000E9;
	Mon, 13 Jul 2026 12:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783944808;
	bh=PSGaNNerjx5NHq76aUou1Pn8hXh6XX/MW5RhJ5+JrQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WonuKhYIZatQCSpy9wzAlaIe8+NfZZpd6hkGthEg+CB71MKHcRpYBCl6VR3NpOybB
	 UOUQL+GtLWgQZVZ8H3IjhuIFypdugJotawSU2WjTMr3ddylpf+/3g8VgMnANA/9dx2
	 0wLtp90ve9uIt5CaL5wg8NcFjC5G9JvN0m58/n99BVby2VhhM11r9nSk3JOUuU91hS
	 exVw8c5SjxFR2B1pEskr9IvCwqv0uJuP8Hah2USFK6xHJVxR46CMRB/CgcQWqjOd8c
	 AgnTmYqtj2wOG2G73ygBPwVeXANo46eptdG2jxAncXGUTgz+RlNWNkSLuaXeugKPUx
	 0C/sqWHPzMj2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rakesh Kota" <rakesh.kota@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713-b4-add_pwrkey_and_resin-v5-1-3bea476e1453@oss.qualcomm.com>
References: <20260713-b4-add_pwrkey_and_resin-v5-0-3bea476e1453@oss.qualcomm.com>
 <20260713-b4-add_pwrkey_and_resin-v5-1-3bea476e1453@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 12:13:27 +0000
Message-Id: <20260713121328.339151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The schema incorrectly forbids `mode-*` properties for `pmk8350-po=
n` and its fallbacks, breaking reboot mode configuration.
--

--- Patch [1]: [PATCH v5 1/2] dt-bindings: power: reset: qcom-pon: Add new =
compatible PMM8654AU ---
commit c59d0da4493e27ba6b287b072dffcd65652a9310
Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

dt-bindings: power: reset: qcom-pon: Add new compatible PMM8654AU

This commit introduces the PMM8654AU compatible string as a fallback to the
baseline PMK8350 PON implementation. It also updates the schema to enforce
that both the hlos and pbs register address spaces are always present for
the Gen3 PON peripherals.

> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml =
b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> index 979a377cb4ffd..09eea48c709e5 100644
> --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> @@ -17,12 +17,16 @@ description: |
> =20
>  properties:
>    compatible:
> -    enum:
> -      - qcom,pm8916-pon
> -      - qcom,pm8941-pon
> -      - qcom,pms405-pon
> -      - qcom,pm8998-pon
> -      - qcom,pmk8350-pon
> +    oneOf:
> +      - enum:
> +          - qcom,pm8916-pon
> +          - qcom,pm8941-pon
> +          - qcom,pms405-pon
> +          - qcom,pm8998-pon
> +          - qcom,pmk8350-pon
> +      - items:
> +          - const: qcom,pmm8654au-pon
> +          - const: qcom,pmk8350-pon

[Severity: High]
This is a pre-existing issue, but does the current schema incorrectly forbid
mode-* properties for pmk8350-pon and its fallbacks, breaking reboot mode
configuration?

Because the Gen3 compatibles are missing from the earlier allOf if condition
that matches pm8916-pon, pms405-pon, and pm8998-pon, they fall into the else
branch:

    else:
      patternProperties:
        "^mode-.*$": false

Will this cause dtbs_check to spuriously reject valid mode-* properties for
the newly added pmm8654au-pon PMIC?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-b4-add_pwr=
key_and_resin-v5-0-3bea476e1453@oss.qualcomm.com?part=3D1
