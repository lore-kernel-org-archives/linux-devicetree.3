Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930D345D19E
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981022; cv=pass; b=HTTnYrIFLLOj+oLY0wjljt2z7glPpubRO9ucqYtpKR4bTjtCblS1t25NphiCOI5UV5mzC6FpxrKQnSyb1dTwwCut5UVPGCkddFQOkf33wA/IoZ0pHY/SKMRIXjYdDeQuhauU7wVN9BlIW9zAle6FNUF6ojtpD1inFxUy2Zp9yoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981022; c=relaxed/simple;
	bh=LIMisOFGt0qIn1CPMIveMR4IC+rDqNbpmZfUtuIDlQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g38ApbAgNSqcscbmkb31womYdsv6N4nrBPHg0gclfIekIzwwF/kRP29d00g007tIn+5HVPZtXLPyjc+SOhKMVNXRGu+id+5mwNEiCT0DeRF9WEuYMYS8cTqTXSuu0JV6QU2MinbkBrAo2fcCXKbMIb/M4qWUfbpAPpdciONq4Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9SmA2aW; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9SmA2aW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so1466516f8f.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 01:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789981018; cv=none;
        d=google.com; s=arc-20260327;
        b=rN3eQ71dqXJvP2bLX/duqviALrejBc/vrYEOqnJHOkdmTtsIIuaA7tob38fGP9P5GU
         0dbztycVyOE/PM3sRv7zL8o9Q8mFyWWApo0gbnd6sRCDa4FAGcWoXCmwTyMw186NO2yW
         QSTVfUS1iZtyPn5M66jTFK68fccvDFaASGYyhrHzofanewWRB0mpMMuZN9gtpm7jGP9K
         Q2MgcYJO0/B0y86h5gdbOm9gu+QH0sSB3ZP2OCYbvHAKGEdDwoi8AnTKLcKBHkWFYeg3
         rSLPDxWutke30/1ToOB9r64JBSSv3RGpfm4vAcyy1j2b+zzQ805BuL0FwuhJ3yId9C7l
         Jicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qON0nZ3j82CiOmvFqun6r6qqh5dkAemGnmHmfUfUMgI=;
        fh=fXOaArnuE4ElpbPRNZHwl6YrPq0j+P857lB5XW8vUjk=;
        b=GrpDpPEXIVaCrTty+NuVQYylIY2BztRkFFeOC3swf8fP8MFSDYSEXM2bVhzYJHyXEC
         gCcQ4800nxfYBvKJZbW65e2RuOl0A/IMK9UByxYsLBBwFdCMg3QxRC2l6ZyHA9LYj+R+
         Eux0YVR/ISdVrocMFS0tnvtH7rh063Fx6MTeiFvlz70lm4NyTS3W2PnCT+8ZR2P/8v8v
         6ZpcHi1+gBwKvgjDlZGtvdVakmWdvpvyCV69TKgr26wwail8RQVQuEiaFOwvJLv8fO/5
         bazgjrlNIsLYfCUggTOkRRnzC5C9/t3NVnKwpzHsnKH3Ldf8S0fOL+ldIM9domdx/PBa
         E14A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789981018; x=1790585818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qON0nZ3j82CiOmvFqun6r6qqh5dkAemGnmHmfUfUMgI=;
        b=r9SmA2aWbdtQDOK50ymPvhTVeRUUSayv17P+1q+tWz8l7VTadUph4aJiemMhWNyVHn
         o9CDznKLNQ3j/hmc977Rg404wDglH1zk9pPC8R7Gyp5q+xq2R8g31HYyXDZkNwGDhiF5
         ixhHx4puuB9dHflPVvnuIu6Hw1fJKAPrL3fwXKSbBusz06/3GpZYYNCFzo5ginUlyahJ
         ua/VQW6RaxcBgynx3xaLd5Z+34VZ8Fl7anAK9ziZlugRJFseCBJEj9a6gWDeSgfGLK7q
         j1FKgDkq/KskJHhoOSwFcVf0GN7iwgdTtmJ6V5GMHu66khVnaHPf5wLL12ZIoCCSDczS
         XFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981018; x=1790585818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qON0nZ3j82CiOmvFqun6r6qqh5dkAemGnmHmfUfUMgI=;
        b=PPheN1PDIwuHKGv88hC0v4MZrmSeGYe+PzuYv2iFXDA4ZoIyFcExbaZGlo+qC8vzTC
         3g8aObulvkc8Ncbe0R3feyEbxRUbLNo/WNk1+9ccJco96H2lXDBlejuCODuJjxOlZepI
         XOlY1at/Dtb2IsU9VwSqV7SkFc2lnCVsSh4dLirYz3yL/ITPTSDNv1D7FwlN2+uOfuW2
         E5yExNAcFjBaNjTd8QnGotGg8TEwAyh20XToS4FhgSQw2+ZjmNvS2IyetytfJUndOeO/
         F1dYnBhB4mOnDRg9hIeSnKKyYm1IH2MmNrwibUgRzHk+18xKtvEqHd0uQy8NMQTTcNim
         wEIA==
X-Forwarded-Encrypted: i=1; AKwUvByYLeXEUZOmAB4+42zDgKI1V92W9884H/wBTtpGYZkdsqLsWTEDWN+7QaGf6jIvKwrhN/x6v41b5gQ7@vger.kernel.org
X-Gm-Message-State: AFuF++ngQ6Jc/yKJcTOwsx6YLHEiK7L17jz/D64b4xQf7wNKTkHEQdlv
	cMDwlLEGRDv/g1W3nyCUc3cHMd2aPiFFSJfp/GFtjQBcTOUt6YuE2v5v9dWL+SXBsSPrNbiwrkk
	2SyWKPrGspQd7qVYEj0GkO75pPcL2Yi0=
X-Gm-Gg: AYBFou0QShT/5qL+7FmyQ2+W3wb3RX5vTzUkkmWw/16pHW5gEbGznVxttGTaanMLwyu
	3AchiwMIoycRe91E4BKhswdEo5CWn766EM3qNbFcb05SOYb3W5c+rk8d/s8kXCVa17o8TTQ+4pE
	zK74TyfZ6B6dlyD7mbxxUfiuBiAKv8nNWZWr3f6Vq8Ks/BMsSCUzMR7kE0C0N96TssO+DdYNNj4
	zz+/iFGM1NVnfmt43Nm04uPEkWZcQvfWS7u1xDIbG1y17d0gpHb8rmRuylf8Xs0tfwq62wnWpk/
	YuaSPxIaZi4nIrEcwYf+EEdfgEVGur3PMwX2jsowG+WqDixSVNxchy3tPRCRrXirryXRWDeOu0M
	KgsOwamELXz1byCo5UeVFHRRx9hWcvKNCRmT12fvLSyjnH2IrxBnAz5zBra+6TR2vLZA8+FEX
X-Received: by 2002:adf:e001:0:20b0:487:21a4:f617 with SMTP id
 ffacd0b85a97d-48721a4f785mr12067196f8f.19.1789981018022; Mon, 21 Sep 2026
 01:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917185903.61253-6-wsa+renesas@sang-engineering.com> <20260917185903.61253-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260917185903.61253-9-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Sep 2026 09:56:31 +0100
X-Gm-Features: AcwNN1UuhHZT5-lbDJzHKCaC457x5CxrktdfiOsZEU2bG1XndBnc3Ogxq0Q1bIE
Message-ID: <CA+V-a8vdkeOP3uh-jObET1oCEOaEsyW4LJ9mxE0tOTqe81Rg_Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: rtc: rzn1: add R-Car X5H support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:59=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The RTC on R-Car X5H is a bit special because interrupts are not wired.
> Future R-Car Gen5 SoCs will have them wired again. So, create a
> dedicated entry for X5H without interrupts.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Changes since v3: tag added
>
>  .../bindings/rtc/renesas,rzn1-rtc.yaml        | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml =
b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> index 7ea77cd0bee1..b448725671ec 100644
> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -23,6 +23,8 @@ properties:
>            - const: renesas,r9a09g087-rtc  # RZ/N2H
>            - const: renesas,r9a09g077-rtc  # RZ/T2H
>
> +      - const: renesas,r8a78000-rtc   # R-Car X5H
> +
>    reg:
>      maxItems: 1
>
> @@ -52,8 +54,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
> -  - interrupt-names
>    - clocks
>    - clock-names
>    - power-domains
> @@ -66,6 +66,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - renesas,r8a78000-rtc
>                - renesas,r9a09g077-rtc
>                - renesas,r9a09g087-rtc
>      then:
> @@ -75,6 +76,20 @@ allOf:
>          clock-names:
>            minItems: 2
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a78000-rtc
> +    then:
> +      properties:
> +        interrupts: false
> +        interrupt-names: false
> +    else:
> +      required:
> +        - interrupts
> +        - interrupt-names
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.53.0
>
