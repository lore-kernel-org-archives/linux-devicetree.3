Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F533E63AE
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 23:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330468; cv=pass; b=oEEFilaSrarv8LWObQ6UIcrqRleO9vJWgjSHxzRehlQ7w16j431AZjhRGpE0y9PCmo2tTrSLlFNtZZAhTp4T2q83LqEK+nn/faRX4zhzPiigZiBkCKg1e+u3gEOgAdHD7LqXNPk6LFqFON8d9IM97oxztXXCVWo8RALEpReM9F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330468; c=relaxed/simple;
	bh=gexAZAM9D3qySWszn5uyjGHra9XjdPZHkujc4evGP1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKwT40CbFr3EYxeRzVo0zJkAvGTcwaTE1yz7eiz4TZnB/qkG1en9FIBCZlOqkRA83GgG3ojgh/ID1jnEHQmTVv/RWWPGpe6bIHZfgSXkBvQRwq4s9ku8REoNTkMDpZicIMmfIs7tV8kVG8hm+y/D6Fr/yuIhEp0xFepnF5+OrEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5uSQHkJ; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5uSQHkJ"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ae8541a2f0so13383457b3.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 16:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791330466; cv=none;
        d=google.com; s=arc-20260327;
        b=XXs2NMjK5mJUGOjFfzQx/+bp9P0of7WSuoLG2TRbiLP5sjVR9GhRXQwNz45TfIARyN
         lHIO+jR4+hQ2EKk4o8eaAHvZ9NmkKXA7AAmsFlc7fAAwBNRbf4swpXJ3OaPfv/RaSdpa
         XDIwyTBrmwiM4zsjYjCy1e6JGaINn59itUWt4R7/x9stdZTitk3ObiuydzqX9qwGP4yi
         DT8hOAd3g9KsYE5HIZQcNO5pswxM17FLS/InGQ+JsR8MOdCxU37UhpSHjT068WflUa7e
         UomzLKZdVCzCIOD3oRmEcJXdyApSB3redS7APMsHDkTBSDhN1oJHrW2/hIN+F3YDYJWC
         0Glg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        fh=C6VLmjV44ymJNWcE+ePq54XXusWgKZoIMt8HQyr+6q0=;
        b=R8qDf/nRPEIILCc9DMDXBGhU2eZ6/FOYR8GFIuZRPAx99tKW6+Kly7GPT5jgezoA6s
         BMXHc+J4MPcfw1VvXCX74gZWwzuE44N2HdFi1q3D5/wHpuys60Ecu+ger+dAOy2YkFry
         zYMHe3YCHwxzD0pg5NC6LhCP9nYYby2NR6S7GA7gv/pNkpvHWfjnDETbVJY1E3jQNcd+
         b96iuK7Nu40/d5kR4puvRtCRCAKQbfNyiYUdLMFMnY53SlQdhEf3YCtp8Wh0Ci6YQ6u3
         G9qG1CnpSEsxVbm9QnqL+khoqI1NpHLtcxxDsJtnGU3s6qr/3ncwi8Z3mW6AFU9k5wpP
         DmuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791330466; x=1791935266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        b=k5uSQHkJUU5uCBUJ2iMCeuQk6NXZ3sTuNH1HFWHUTegxMX0jy9NBHan909SUQ0+ulL
         Mg4ZB3qqs2+sFYz6Ql8v/Xs+/ZQFclh+EBoDt+F5dsheXmjl9/9npo92PCaDoDms8eTD
         esdlek1oi0tHoUibqyvwWKxfcY+dYxN6DzksCWOjtNKINrrnvU1ZmNlxDhob62hHROES
         zfPFKAquppldgh2dL0v+kI+jZkr/hRMMdFLJ/7lNyyeMR6LAzZ1guAywK2LukAlsmQD6
         8EfcBLPT1P+8/CMsC2bqv8PP6LOSYBjDkZ1wbGKJ3YT0sUlAfTiU7BuCMSSynAA6XFmh
         36CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330466; x=1791935266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        b=jcfVdavhgBJxE96/uGuY6AYkc2uaxHabnNwEl3a+TzH+U7xggfgRf2toFaN0mGxxIW
         sYnrzGgE6k1lG1J1D3phArfiRviYx/rghvZsjSRWbQh1YxdHQ6MYIijmVUi9N1H0DQe0
         YMLyVfA7TdwLm0c+ZfAaS7KoL73Cp5A3KaKvN5jS80ch0jp1XqV0LphwHrffVmRpJNIF
         pMC4F4dqid/oTe+09pyg2rYCSuFUOUd8CM4jGR1aGIL33QxtgE15ochu8JjVx07ZOZ4S
         wCuqz6FpohHnqDHW6D21ALQygRlz6XPe4qtiW0UhRtC8LrQQ31+WBZ8Y5GM827bdLqn7
         N0lg==
X-Forwarded-Encrypted: i=1; AKwUvBwfgTJyceTL6RKM9H4snYX0DUYY4NaGILaa/xjjbZHgdO1S4tISVEnGuhDTWWPsQtymD9DcWRKqHYmX@vger.kernel.org
X-Gm-Message-State: AFq9FYIoFVW714d0d9bIFU5/A9Lxirk3ZS5+55lMUqEm3oUJH3f1RAT6
	BvQzTdj1wR1Z8LSBydri5f8lj5Kcmaoc613oigkhB+i4tkrizE5+OpwEwcBsag438b4gXE5BHbA
	lNwk5Uub+X8+vKGNy4CEvR1S/jPAzWfrOcVJ0xCSOJg==
X-Gm-Gg: AYBFou2WvIRnhrpdu4TEKGnesxKQAkoxrMJLt+cx0NmMziUARqHdZh8i0Ooh3XGB2M5
	69Ip2RTmab9ydqDiSbp4dxoG+SBgK4eAhz889zAr5W7P5okuUC3SE9jprAwecP3Sut4zDJxjtsJ
	XYqAmWr0jyc1WWGKIzm3HRaaXXwH2pKl49Zrie96FBkuAzEq1zQLprBt1d1PPr4SrqovTH0afRa
	XH6EXSlm5D6iwRYtRlGZwLMYyEfn0gz9KMKKEWh+ea+Uoe7fqBwVPCoyEZD2QlJObR5JzWG8PPR
	noArf2/cSQKdXa5XnBdscQgFhO8vwfaHMqYmPiPz4ZC4eASnLi/5S+VQI3/Wd/d5KH/N9jbSTvf
	zkohmwV6waNzdGw==
X-Received: by 2002:a05:690c:47c9:b0:8ae:91b3:f0a2 with SMTP id
 00721157ae682-8b05b01c13dmr5311187b3.20.1791330465608; Tue, 06 Oct 2026
 16:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 18:47:33 -0500
X-Gm-Features: AclHuK8biRi6brKVjnQsgRrEOJZ8txDP9zLFZXlunl0eP3sSkOkiUAUTUCWs2z8
Message-ID: <CAPLW+4m57BbhsuVaJb382af6b9Ek-raHoftEO9m8z62Z=DEzkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:11=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> The Exynos850 SoC incorporates an APM co-processor. Communication with th=
is
> hardware block is done using the ACPM protocol, which handles IPC message=
s
> for clocks, power, thermal management and PMIC control. In this
> architecture, the ACPM firmware running on the APM acts as the central
> supervisor or arbiter for shared system resources, handling requests from
> clients or agents such as an OSPM. In this design, the OSPM is one of
> several clients or agents communicating with APM.
>
> Dedicated compatible string is required for the Exynos850 because
> its firmware utilizes a different initialisation data base offset
> (0x7000) compared to the existing GS101 implementation (0xa000).
>
> Additionally, the ACPM firmware implementation on Exynos850 does not cove=
r
> all clock management operations (such as clock rate reads over ACPM IPC).
> To allow the OSPM to resolve rates for these ACPM clock IDs or sometimes
> called domains, add 'clocks' and 'clock-names' properties to reference th=
e
> underlying physical clocks.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines f=
or
> Exynos850 ACPM clock IDs, clock property constraints, and disallow GS101-
> specific PMIC child nodes for Exynos850.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 ++++++++++++++++=
+++++-
>  include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
>  2 files changed, 76 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml
> index e68f9c3ca5e2..0eaa9c881f6f 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -22,7 +22,9 @@ description: |
>
>  properties:
>    compatible:
> -    const: google,gs101-acpm-ipc
> +    enum:
> +      - google,gs101-acpm-ipc
> +      - samsung,exynos850-acpm-ipc
>
>    "#clock-cells":
>      const: 1
> @@ -33,6 +35,20 @@ properties:
>        appropriately with the clock scaling. The argument is the ID of th=
e
>        clock contained by the firmware messages.
>
> +  clocks:
> +    minItems: 1
> +    maxItems: 9
> +    description:
> +      List of the underlying clocks associated with each ACPM clock doma=
in.
> +      This property relates to ACPM firmware variants where not all cloc=
k
> +      operations are implemented.
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 9
> +    description:
> +      Names of the ACPM clock domains corresponding to entries in 'clock=
s'.
> +
>    mboxes:
>      maxItems: 1
>
> @@ -77,6 +93,44 @@ required:
>    - mboxes
>    - shmem
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-acpm-ipc
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos850-acpm-ipc
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            enum:
> +              - mif
> +              - int
> +              - cpucl0
> +              - cpucl1
> +              - g3d
> +              - aud
> +              - cam
> +              - disp
> +              - cp
> +          uniqueItems: true
> +        pmic: false
> +        pmic-1: false
> +        pmic-2: false
> +      required:
> +        - clocks
> +        - clock-names
> +
>  additionalProperties: false
>
>  examples:
> diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/include=
/dt-bindings/clock/samsung,exynos850-acpm.h
> new file mode 100644
> index 000000000000..87fc6ccc1d99
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright 2026 Linaro Ltd.
> + *
> + * Device Tree binding constants for Exynos850 ACPM clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> +#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> +
> +#define EXYNOS850_CLK_ACPM_DVFS_MIF                    0
> +#define EXYNOS850_CLK_ACPM_DVFS_INT                    1
> +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0                 2
> +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1                 3
> +#define EXYNOS850_CLK_ACPM_DVFS_G3D                    4
> +#define EXYNOS850_CLK_ACPM_DVFS_AUD                    5
> +#define EXYNOS850_CLK_ACPM_DVFS_CAM                    6
> +#define EXYNOS850_CLK_ACPM_DVFS_DISP                   7
> +#define EXYNOS850_CLK_ACPM_DVFS_CP                     8
> +
> +#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */
>
> --
> 2.51.0
>
