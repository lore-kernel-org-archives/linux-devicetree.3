Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558D6511202
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778555; cv=none; b=aPnXOvkkf4kYvKu0Ei8O9AOWulgBU0FqcLSkIRF/mmvQAf27vFp/r9rIXhTKCxa//xR+VPTkSdlB8zGWuf/0ayKC1/oR7z+6XFTUyHWouEOtCm36ynhlPmVR96KBefh7BIB2ZLeDD5Hjnau1ZsRS72EKOmfAPyrxf5rJq5HjJR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778555; c=relaxed/simple;
	bh=kXoog86jzUq2iy1y+wPesv13OwllCuL9Or7HjAUAZ4M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DpcdP2qRYjeFfJiNjQ1lb1JrHfhcx+gokdJyia7Q7syj0p6L2XrjIxQequNuFuS82ZMiXYsNw0JBqHssLSLn7JTgeRaXhobKkLFjOkbco1+ShJWmgqTRXWlivibUpqmTKTkiqUUxezcaT3iZRrZZ8baNdV/4wmVYo79jlCjQHC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vt7Pt+FD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vt7Pt+FD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278231F000FF;
	Wed, 30 Sep 2026 14:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790778545;
	bh=MQscQ2dPlA4c+NCvDGRqHfbBWbBz/Gzn66Nwm3gSgTE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vt7Pt+FDebQS3DaQmgD8JcQamZTRBVgbcvApwWr9c6KK511om4Nu43DziFl4ntpvD
	 lZasE+WQbyYMZv8gBNNbEtmTiW1+6AU9P2I/CBrF+g6sgAzCgk4SqISXw/T/MCb7tZ
	 W/07fF9QdLBpD5BRr471j+7AZPdj2vUXFdK9DJgD6rAHKFCX9EgZ09cDFmWk/8QB9U
	 OSAsDMTi03+eCGn/YY9K0dYixwzsxLjSt8l+JaIuEYHKBcw95l8RmLmikC3yQE7t+R
	 VAgvP9qHfJkPmZUKT2/OIOIfTiBQLHHCGu6fGJVsSu2t2I9EPjJHU1ted2NSylLca9
	 ANCQLfNVGZ6GQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/15] dt-bindings: iio: adc: stm32-adc: add support
 for stm32mp23 and stm32mp25
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-1-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
 <20260930-adc-stm32mp25-v1-v3-1-406834430d72@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 14:29:04 +0000
Message-Id: <20260930142905.278231F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: channel 19 restriction bypassed via valid hex unit =
address
--

commit d2461d12172d54981aff89ddbc3a421fb6e6897e
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

dt-bindings: iio: adc: stm32-adc: add support for stm32mp23 and stm32mp25

Adds support for the STM32MP23 and STM32MP25 ADCs by introducing new
compatibles and block configurations. Includes power domain support and
restricts deprecated properties. Also attempts to restrict channel 19
which is wired directly to Vref+ and shouldn't have direct measurement.

> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml =
b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml

[ ... ]

> @@ -486,6 +524,39 @@ patternProperties:
>                maxItems: 19
>                items:
>                  minimum: 40
> +
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                enum:
> +                  - st,stm32mp23-adc1
> +                  - st,stm32mp23-adc2
> +                  - st,stm32mp23-adc3
> +                  - st,stm32mp25-adc1
> +                  - st,stm32mp25-adc2
> +                  - st,stm32mp25-adc3
> +
> +        then:
> +          properties:

[ ... ]

> +            assigned-resolution-bits:
> +              enum: [6, 8, 10, 12]
> +              default: 12
> +
> +            channel@19: false

[Severity: Medium]
Does this correctly restrict channel 19 if device tree unit addresses are
supposed to be written in hexadecimal?

Because channel 19 would be configured as "channel@13 { reg =3D <19>; }",
matching against the literal string "channel@19" only blocks an improperly
formatted decimal node name.=20

Would this leave the correctly formatted "channel@13" bypass open without
triggering schema validation errors?

> +            st,adc-channels: false
> +            st,adc-diff-channels: false
> +            st,min-sample-time-nsecs: false
> +
>      additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-adc-stm32m=
p25-v1-v3-0-406834430d72@foss.st.com?part=3D1
