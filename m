Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7F1371CEE
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033611; cv=pass; b=UYxh6fRDNPVSfnWHf7yBW647WJakNj7UTlVEdcipDvjXfZkKsLFl9q68m165rvfu4PEDwS/+2ByTauRKGA2pK+AX0J69XNzsKwO6K8xqYAqF5IXWJkVQh3DXDUyEdFBgeZ2VUPt+fHwWh53lOHBABhSz5fKQZrJ2Z3NgJDvt8Lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033611; c=relaxed/simple;
	bh=uXo5sGUS+X2GeacJ66r0n5qoFH9G6+mkiyEHkwOrSd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZpA6cMiEaz/z0l6mRDJ9gQ9F5mG+71+oktQPr91tyGOvgxgACFc6A7PRnyy1EVGajeKya5nyPiXL2JpG0MjuqQWI2H0Yu3LrvXVxFlFfmmadLFitai2F1At2HCW8Mf5WK/M2ba3kd+cXs+r/RZUmXqPSo4mfMr8Wr4YH/EbPOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeTYK7x0; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeTYK7x0"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79f8d6bc4e1so5837097b3.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 01:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775033607; cv=none;
        d=google.com; s=arc-20240605;
        b=ik759IAQ+f77FIh+SMySKYD7v/8yqdwgBgq/oCxTL5VsQLTH+tB4JsKVZFlcGACSj1
         zKEjF9rCsgVrBEQQM9mtRhtOo+gZiebP/FTWjAPpM96vCtp74dRc1ZrkmXsKuoMCiH1a
         ZRKxDaPZ6znVfzYdETwNC8VlN6FWkXOb95ritnVL9Cck7e4I+A7cTgtKlzN3PYPbsRge
         pSMtatIQ/eRIdXnQf3w+wonsL5XkjQCgMaZaJ99W9uhYruRzmqtJ+/1+HVUpaWEonjAr
         UdjOU2rsGvgSNWeswq1/Dtzt3aZhwuuYA25j9+NG1debx5YsCLvl4wlmeMOrae4pa/ul
         EimQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ENRki6GE3XavXQugQXE3GjN1Vl6hypf25Ont7yDJwJM=;
        fh=EDIY2yNdULfHq/vhvz5f8Iq//ltSWoPA9Ej/p2LoYLQ=;
        b=P0HjSuzhOhiQdarxLeBLWb0Uvfb3uByPiC958mFh25iPm/90jkr9el3iK3zhNgk3eT
         7CNWERSRttczOa4F9PHdmXZVPbjf1P54FOaFXkFg6T+FceQkzugoBZhXaLsyzDuSA2Jp
         yHXz2cq9Gusgse64RmgMOqlYl4vKANDGn7SyQca88LiQhuR34BwqnjHG6jhHK7QxtHiQ
         QT2iG+TcgMx3UgCQHqcWwS5vDJtS6GGT/7D4fls+O52UrILdOcIR/EdzyBLy/OWX27jf
         c0nWMzKi2JBfwdRFKnjdtO8rkPx3yakvm/ThS/LhSFA0xSCJsZEv5X8rj7WSAqOUcral
         OAVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775033607; x=1775638407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENRki6GE3XavXQugQXE3GjN1Vl6hypf25Ont7yDJwJM=;
        b=NeTYK7x0FC2LVI1nWe/ovu/i+NvbrvkwdfeTtsO9yge7gJDrygPH/TXeR3NuH2tkbp
         NMSbDMKItfGOtXezqmeSqRgdR4LAiW5JGbwUEFONySeOxi7HXjmgX0Whz9VI1LQLOPbq
         K5y3qYToOywVT/lVLe1fhPX5hxWpdKeXaVAgdbfAxel9Nid+w/6up6wm2TC8RRJELQo6
         j61eE18rniPmKsfZ1d3hJJuqZu+gSvfs7HhO6rv0KdQWGNElU/QLLBX97zavAH9IPuC+
         j5j9YDQxaEPWxfs7qP9UpIn2mXCPp2Tvtymr7mkpfjhy1Dyruq1prq8ZlDS76yTr4e97
         UVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033607; x=1775638407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ENRki6GE3XavXQugQXE3GjN1Vl6hypf25Ont7yDJwJM=;
        b=QizS2h2k8sMgGyI6OWtnXZt7040JihrdHfkjIQk+Khj3CCKyExYICCXQ2xXE4xi4Ib
         DNtNi6Yxk1/7KLFD8Nz3Jp0+LSrGCD9aX4nTENbayi9v+JoU9PmthBZ+fuBWKxa9rToB
         MuX3K3c3PyDs/PdyHqfGbsszroo2Xto5F49QRzNf+kUbHEquaQNLqiVojrd9VYjd5E2X
         KdZF2oNTy5Bi860QZY/OB33ivSbnE9pxxqfvfcQPppRTzlsLNDQUARc+wt/umTUHu6aZ
         /yyGi4+/CNUAAt6PxVLEgREzUQYhh0ISF4UMu9YLNK7ghYd6FSWbKC9PLK3CUmfP5rsC
         sz2g==
X-Forwarded-Encrypted: i=1; AJvYcCXyHCvpdZtOS4sjXGMzv2llmCPalQgX4rUM0367GZQuXt86NzxpEmpz5BBO1PWcbMku0ULUta1US4Sg@vger.kernel.org
X-Gm-Message-State: AOJu0YzlHF1cDDLmo4sQPJ4feoWZkLZ0ebGRkEdQCmoAS0ftU6rN0T7k
	YHIkiWbwKL/v6wMUBiQCQWxhJFtfv60bKG+PPjD845h6JD+9jF8giS6rpHu+RsfCOrnjRYdIDAW
	Lg76oiJNIhRebnpdWmpeKHuR91y6Er6M=
X-Gm-Gg: ATEYQzxBTJgOhikYBx1IiDMDolCGKlJlg6s3iUs7F8M8BAiiX5K5L0Kt+VVeU1gZ8xQ
	jPCnzzbIP5jg0HZcBSG2oDSIpETyuPGlfzOBVj9ArcRB4tawyoqHXD/0Xt2Af4M/X0qphblff9J
	zeTXlddvjrJQjqHUtIdfrev3rFfTH2t6HKeTt0YMc5oKkO65iCvuqB91yHVHVfETdjYfEAY/w6O
	/5z2XmO+ULU8+QSvmvTJrJaJXXMokJ3TrKAJXfiHZrCeRuHpQqzw5NwFKidHl9ZMNY2LdHh0VCm
	BVTylA==
X-Received: by 2002:a05:690c:389:b0:79b:ced2:fa39 with SMTP id
 00721157ae682-7a2133f6f60mr28605447b3.57.1775033607174; Wed, 01 Apr 2026
 01:53:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-5-bd853604322d@gmail.com> <aco9oLumPh4OZtIo@kernel.org>
In-Reply-To: <aco9oLumPh4OZtIo@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 1 Apr 2026 10:53:16 +0200
X-Gm-Features: AQROBzCe0V-3QMHTJmNMWmbyBErt61jt6_tzSI47AYboyyBlMnKTU6WQsgJn7cM
Message-ID: <CABdCQ=MFcDPnzcYUEkbQyu_0qZt=aDD04p1kyxCMuVt7Av_P1Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 30 mar 2026 a las 11:08, Troy Mitchell
(<troy.mitchell@linux.dev>) escribi=C3=B3:
>
> On Mon, Mar 30, 2026 at 16:38:06 CST, Iker Pedrosa wrote:
> > Add SD card controller infrastructure for SpacemiT K1 SoC with complete
> > pinctrl support for both standard and UHS modes.
> >
> > - Add sdhci0 controller definition with clocks, resets and interrupts
> > - Add mmc1_cfg pinctrl for 3.3V standard SD operation
> > - Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
> > - Configure appropriate drive strength and power-source properties
> >
> > This provides complete SD card infrastructure that K1-based boards can
> > enable.
> >
> > Tested-by: Anand Moon <linux.amoon@gmail.com>
> > Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++=
++++++++
> >  arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
> >  2 files changed, 53 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/=
boot/dts/spacemit/k1-pinctrl.dtsi
> > index b13dcb10f4d66022d27307de73a6ea3287e97441..8d82011f1af666fb78c282a=
2abcc0cb88f962053 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > @@ -570,4 +570,44 @@ pwm14-1-pins {
> >                       drive-strength =3D <32>;
> >               };
> >       };
> > +
> > +     mmc1_cfg: mmc1-cfg {
> > +             mmc1-data-cmd-pins {
> > +                     pinmux =3D <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
> > +                              <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
> > +                              <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
> > +                              <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
> > +                              <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
> > +                     bias-pull-up =3D <1>;
> > +                     drive-strength =3D <7>;
> I'm a bit concerned about this value. Looking at the downstream 6.6 code,=
 3.3V uses DS4,
> which equals 13mA. Since 7mA maps to DS0, what's the reasoning for using =
it here?
> Do we have any documentation or measurement to back this up?

Thank you for catching this! You're absolutely right to question these
drive strength values.

Looking back at my development process, I remember hitting signal
integrity issues in the early stages of this driver development. As a
quick solution, I lowered the drive strength values, which seemed to
resolve the immediate problems, and I moved on without revisiting the
electrical characteristics.

After your feedback, I investigated this properly by comparing with
the vendor kernel. It uses:
- 3.3V mode: PAD_3V_DS4 (19mA)
- 1.8V UHS mode: PAD_1V8_DS3 (42mA)

My original values were indeed backwards from both electrical theory
and proven vendor implementation. Testing with the corrected values
(19mA/42mA) confirms SD card is working.

I'll send v6 with the corrected drive strength values: drive-strength
=3D <19> for 3.3V and drive-strength =3D <42> for 1.8V UHS modes.

> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             mmc1-clk-pins {
> > +                     pinmux =3D <K1_PADCONF(109, 0)>;   /* mmc1_clk */
> > +                     bias-pull-down =3D <1>;
> > +                     drive-strength =3D <7>;
> > +                     power-source =3D <3300>;
> > +             };
> > +     };
> > +
> > +     mmc1_uhs_cfg: mmc1-uhs-cfg {
> > +             mmc1-data-cmd-pins {
> > +                     pinmux =3D <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
> > +                              <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
> > +                              <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
> > +                              <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
> > +                              <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
> > +                     bias-pull-up =3D <1>;
> > +                     drive-strength =3D <13>;
> See above.
>
>                                       - Troy
