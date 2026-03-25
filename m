Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C91039B963
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431764; cv=pass; b=unq+D1JKob6rea3hnowx4+N+7Hjs6ZLL6OlloH1EEKG0u3cPFJZU3ER2IquTTowXWK0SvAzCkI2Tk2Qj5XlzuPMDgGRlTto+esUKOZLUazUHNjm5RxkDy25Dj8cXy4GCrUP4Ue06wD4ja9T+JjDWd6AVnOzVd3ij7IQGmG4Z83o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431764; c=relaxed/simple;
	bh=iB1MpeIq1U/rE6xcz0FTAu5KFzbYanQ/voAFz7+KWP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1wygOtprp/xqTioRuLpieH6WqDIT6VUs3qi7p4zptQANwaDfKmm9yLhCyvw8qknex8xOO+gSTzQa2dwO/ZENfwzhX6KdRvty5rhfWbMDCoq3G7J4HLzfVrbqzVPRTlmWZjsaOUymo6giT2qTufIDAaTNrxmqP+noSTd2HAHbqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ouup2Y++; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ouup2Y++"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486507134e4so27093975e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431761; cv=none;
        d=google.com; s=arc-20240605;
        b=bTiDZ948xc3SyQAu3lNKL28zdZG6I/E/iIqmizW4ncFR+zXyju1cNUjueRu5aHI9jD
         fhb2e249mlBUMaz0WQ5TAuya3LdAcjmF6Gk7vlVfHvEC0KqjUsOl1VH8oTE32Ufaij6l
         o31P92K5awHDhz7UidNyel6+biILtR+pETyaEwSFQrV7sizmG1ULzE57D43YYHqqMv6p
         4HFlk2o75EBUGfOpZL8MU0xPaUoMhqWqBScLx9BSELRoFJP/1HS+yEZdECaN1NxmjmW/
         fELCyE7scNO370QNJEEFxohSXGZN8nl1pcjWnB9W86Q7zjOllrXqMQAwK0dXpJ1sB2HP
         Joww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B8SmLIXQ3rCfuPKUyweZ8Jdf4VFN2OQAa6knDsMspLg=;
        fh=3OEcIDdGIEUimQo5ZqHco7TKal/P2Ja96GkDyyHmjUE=;
        b=Hrhg6uityr28eRh/yY0rLZQ+XpW8ONaBj5dxuIa53MosUaq8wA+8hcDswAwEjXBz2b
         uDBo8uwJ0uORAY2UqmaDSAw+Clhej0+wlwyE4x+KM6KTjQKmk8x81idSfqT4mcI/ZWjA
         qW/cYMtC5GciFG66UAYK3aI+Fv1TyL0vDLdIlZtw7KBL1Ya+J2oxLDCarE21kVOawbLA
         X3ei2oJjdgumPKb60HYZ/14b0m5oE9A4JJIHJhHFrHEYM2lywzxBPnqGKzSiG6kNO1e0
         BOVIEvzSmCvfeR5pL3eL53YyteI7q86dEGaIg6wC6lkxlF0vv2Y238d9RQ25gRFbZUGa
         RFHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774431761; x=1775036561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8SmLIXQ3rCfuPKUyweZ8Jdf4VFN2OQAa6knDsMspLg=;
        b=Ouup2Y++zGVJMKgkzqqkJVTiBroGJXZGaRx1oacMlnc1DUD+duQt4UkUtwnnheeGSz
         wNLmXJaRlfHDr9+3uPL33CUUkqyjYoZ7JJ14FH+SX7JocpFZ57nbknZe3tuKaxSmW+w3
         IlP4ysevRxc8K5ZsrjYA0n63ZaSKKGVW0okqOt4hVVxSFHsGmFiNRpGbPYE+RvB1fVDQ
         72/KCClSaQbWBB0II3difRnlxz8RX8g8tg3LzqynJ9CwnIbknADgVwLPT5vwiPGQuUpk
         vqTjNDeYJjjAncQ9E4KKEI7vfr1tB1hV4RM337KCEwdYanObrbNrZDHNKErcvlqVnyNw
         vN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431761; x=1775036561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8SmLIXQ3rCfuPKUyweZ8Jdf4VFN2OQAa6knDsMspLg=;
        b=Fji3XulUbL69muaJp5HOdVgxwHHdepLJt8vZSuWi0PKC+k1dYfHdCMJ4MvQ+pboIHW
         58Jpkvy3NN2Y2BHW7p/6vFc2twGvvOBvhACx8379TRUNW4cfd95+T2xRRSLD8FfibhSz
         yYyaM0jfJ5DlvGp2ZAgsCW2ISUiL62Cx7YUv4vcoGbXVXMP5YR/bbY0QbUxX5ShiFmSz
         xULCn8BhV3oBOVnEnb/qMQRDCdYbhGantAIc96svqlGcDqPMz/DMetl1o0f0zxhs72VR
         rUXP71eQb0uxLyQzUo+XWvpmIWXlNMk6ThRCZwlm84H+rCVKF2IjMthDSAabSTPmFPbR
         iWiw==
X-Forwarded-Encrypted: i=1; AJvYcCVPkKKqIlJM5dUj12CwG9yTQGpsRWFjboXu4kN180mR+N209n2fCLWOYt5aVVmbQ15daiod/1d7f8L+@vger.kernel.org
X-Gm-Message-State: AOJu0YwaMpeaMlSaCtgfhAsUmiMrwIR7zO9SFrmOVKSnUu3Qr35BSd8E
	ABE+KTdFdLodavjBSyxY7Ax6JfEii2WH4lPbR/t8tdbpC0EUf9AVJqw7BC0bxuwAHVGQ04AIGD0
	/x9vUo23XPxedh7X0ZVgsidbIl07EHebVzTGm8lnwtw==
X-Gm-Gg: ATEYQzxyAbddQTnBHnxAkQWaQ8rvP06gTq40TdUqHFtdCRH4u/XmfoVTnKJ5CZEZrSD
	4d+eHEw+ioQ2r6H8e99PGtax192d/3V4ZqylCyXgJbW3Mlhj1wZ5TE/v6H/vP0XrDRc69lUfkQ3
	ofsQMJzAk9vMpKZjBdlBd76u6C2JrnkqAknBuJIAWY07pnUpugwhPJmlzvMLEMm/RaYK6NgXAtA
	qusyNLXmbjiDKIehkIjELU3Vg57329lQJi6dO7BJRsc2O6aVsbNr2WMajioULYNy/mG4Mf2HuMH
	j8D1X+VuY8CbriO8KBSi5ItWPnA4ikXnOqPY8H5MWkicgqQTFU+XejY=
X-Received: by 2002:a05:600c:1394:b0:485:4388:348b with SMTP id
 5b1f17b1804b1-48715f0389dmr43148945e9.0.1774431760449; Wed, 25 Mar 2026
 02:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Mar 2026 09:42:14 +0000
X-Gm-Features: AQROBzAT47VIcwfqTpzGpASCq2Db9bAff5rSwNiFG5slkBrcAGVZoDPbA5Eb1t0
Message-ID: <CA+V-a8tDhStdSCkrvG7Bmrqci2CHscyd645B--XZaF_g4GsUuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 11:00=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 CA55
> cores and 1 CM33 core.
>
> While the user manual doesn't explicitly specify which cores
> should have access to particular watchdogs, it turns out that
> (similarly to the Renesas RZ/V2H(P)) it only makes sense for
> Linux to use WDT1.
>
> Remove DT nodes wdt{0,2,3} from the RZ/V2N SoC specific dtsi
> to make it compliant with the original design intent.
>
> This change is harmless as there are no users for the nodes
> being stripped out of this device tree.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 30 ----------------------
>  1 file changed, 30 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g056.dtsi
> index 9192c5bf7e59..40525470194e 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> @@ -599,16 +599,6 @@ ostm7: timer@12c03000 {
>                         status =3D "disabled";
>                 };
>
> -               wdt0: watchdog@11c00400 {
> -                       compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
> -                       reg =3D <0 0x11c00400 0 0x400>;
> -                       clocks =3D <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4=
c>;
> -                       clock-names =3D "pclk", "oscclk";
> -                       resets =3D <&cpg 0x75>;
> -                       power-domains =3D <&cpg>;
> -                       status =3D "disabled";
> -               };
> -
>                 wdt1: watchdog@14400000 {
>                         compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
>                         reg =3D <0 0x14400000 0 0x400>;
> @@ -619,26 +609,6 @@ wdt1: watchdog@14400000 {
>                         status =3D "disabled";
>                 };
>
> -               wdt2: watchdog@13000000 {
> -                       compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
> -                       reg =3D <0 0x13000000 0 0x400>;
> -                       clocks =3D <&cpg CPG_MOD 0x4f>, <&cpg CPG_MOD 0x5=
0>;
> -                       clock-names =3D "pclk", "oscclk";
> -                       resets =3D <&cpg 0x77>;
> -                       power-domains =3D <&cpg>;
> -                       status =3D "disabled";
> -               };
> -
> -               wdt3: watchdog@13000400 {
> -                       compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
> -                       reg =3D <0 0x13000400 0 0x400>;
> -                       clocks =3D <&cpg CPG_MOD 0x51>, <&cpg CPG_MOD 0x5=
2>;
> -                       clock-names =3D "pclk", "oscclk";
> -                       resets =3D <&cpg 0x78>;
> -                       power-domains =3D <&cpg>;
> -                       status =3D "disabled";
> -               };
> -
>                 rtc: rtc@11c00800 {
>                         compatible =3D "renesas,r9a09g056-rtca3", "renesa=
s,rz-rtca3";
>                         reg =3D <0 0x11c00800 0 0x400>;
> --
> 2.43.0
>
>
