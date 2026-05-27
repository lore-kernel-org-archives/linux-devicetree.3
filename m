Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F66283FF5
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905176; cv=pass; b=KSNkp+PSprfItjR7ydV+B3gVHlv+pEQNjEKehKFIEKhoEEEq95QR48REx6d32eX95bjWT5knnO1ouitQ35FAOa5lm9Twy4ewWCBBhQuvlqJZQGswEQYqOqgUINqz1O+LIqsNi7dovyOAAsEiuHkLMAJ2/2PHrDw7sZYPf0junvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905176; c=relaxed/simple;
	bh=QMQJGWOuylEu/q2KAHEDFT8dECfH7P2/iN9dTZERWUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9O2TKp9JCzIi5PM07fV4OEUEqT23ZSu+AT2BEULXSaQaSv/wzlaoIuz6YEU/05guQGT5bmBZJlzCoyraXRKpJfQDPb1aKEVKchOtjjKhDhqhI9qcBDNYFQrhMWO8ebEYP+R+OCN7jVy/Q2Beej1k1aKPzRqvfK54MCxgCPRlHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oSHLb0Qk; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSHLb0Qk"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d734223e4so7565855f8f.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 11:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779905173; cv=none;
        d=google.com; s=arc-20240605;
        b=K+HUgrM75OYj9NUjB8TV6fOJ5/Wb299j4ndZgkEiYxO1egmELojW4qjlVxhq52ccuR
         c2PKDOW1RUZsOyriMFOPuZilWeNKapNGUMpiDCBEd9gwu2cuTRpFTbDkxZdbRTaRdSXR
         eF1WNwFwJHjcdQBPqU/S9L3Y6904xFRPlzQsVJo1KzAVsv2QaEzW9EpQtM+Af+Q8053s
         yuCclFvQBF4nZvvnzjfchda8PhSvx+k+eO4/xVq9oSnXHvVX53/5gHto7jftj/3iFbiz
         tKTiDg+TssAWD0PRcFIJ/1gKCRo6RH1t8YnG/kTIZ79dUK/a+wHdOS+f1sDbmvcHax64
         XtOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U8QoHGAdus2wn6B1doGtbB/NA8r9fzf3vojzM1uxBD8=;
        fh=UWnRd33Qxx5vZj1t3tAfYRofL6r/t1tjpHkbVNrFgQE=;
        b=AIiyHB50yBuZAe4FIn4WvgzonUY2hPaMtZilTuVJNdsQ78/YU1TBHjYXM0xLojqIxx
         w+LM/TI9n13o1fnJAGyOLbt1cLXW6Sbbgvk7rPJ5bSWJpKZsqpNsE52xRf/K1ff7/zb3
         SVNo8I78JM39BwvErATJ4Fr50XQFp+/BKPB+b/w+p77jm7hGHSjTHXRUN1ta0n6SgzE3
         pOOZOHkBdHZ89A0BzWI3gLVKUZicL9Eir76K6aFntcaBF4UGR4fhmonNAWhwScPeFfsg
         Sv/2tSOLkqMZxO0IRwgEpjav/PipZu2/pjDRZVFEcPXyLy3OcHAIu4jHhpfsHbJOmwnQ
         h+AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779905173; x=1780509973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8QoHGAdus2wn6B1doGtbB/NA8r9fzf3vojzM1uxBD8=;
        b=oSHLb0Qk7smyTf8PLUyw+fZqLnx8NMR6c8TzimiyufoPfX0+yhidViPZYuwyKFAUQh
         SMQS0x20NXpvceOmgjJZ8eouj0g1HtBErGOfoyO97d5ohN2AyGlC7ocFlAKu0X0WJdKE
         5TK9m9k6chlZSKR8LU9UaWWk5NHxEcBGvKCHFnpQ/FJnUtrw/Fs4Tr//yMFBe8NpDiR+
         vL2RuLvpNs+U6NKn2zkv5AxVtJq7NszseIBf1hUYkqeNfj6zIAD6CcNoYwwbvKrRpzkg
         rABT2LVZg2tdOnprD1LjIgK3CcUTYGufdhwpJ1w2aNYAAGc0BW310/T1FQ8ABNw0qYSM
         T2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779905173; x=1780509973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U8QoHGAdus2wn6B1doGtbB/NA8r9fzf3vojzM1uxBD8=;
        b=bRP39NLNh/vA3vxQ5PtqkFrqCzRGYTcoJwaL1P/LyqGc8U/dEIyfCUpcoDI31X25ZR
         1RPeusmdzZmtowwa3BckdmMb2pWS3IRJ++sI3Ziw4MJolLVvefVMU6jaUcWabDtBaB0Y
         YmhSzrpm13Rd0b6fzKtuouL0P1vZjPduIDn9fDs/QXxdby9IjHqUbN/f5gCq/zWKv9RS
         gw8/yYsMMQgek42ADW13NwQbl6jo0GWkbmFiOzqWs2rV+OS2oQTSHAqxoHAcWefnzcca
         wGdiexG1lgfXvr7wZTcK88utzH1Nfzwh9wbtXPbPUSA5HwjPK3kMonqOfcMNsXH/jORW
         Z8qA==
X-Forwarded-Encrypted: i=1; AFNElJ8bNPVH3oudckVpQnGihv9gFwo0Ui/GvpJbNPmuZbLpyhi5acacZG6ngKBY0oMoSburx96+uZNTGT0T@vger.kernel.org
X-Gm-Message-State: AOJu0YwSIkwNEeE7tZCCmDYWVHuvUdlzHLlaRIMyBtOlkLtXvEa7wu3y
	7cfIiE08xBf+mZsO/fKfZqV4vQ3y0lULS7OyM0UG3nDUMV58wVwBv63NdJDCnz/CXYF0ArEpdee
	yDmgk5+SVejtB4W6RGjPBwi99c2tlm6g=
X-Gm-Gg: Acq92OHFyANW2FaXQY7gmUR4sf2TPYI/00vxFx+VyOG6+txLFNV2MX7K/oaUHW01OHE
	03E032N9WadBgSsiMlYTA7pmLimGvxK57kJEGG6nJ3W4Jraw+Z2X2VylesIvWwtsLJU5igYzlgH
	R7IH9j17Qc3E0HX3IsoyhmFI6pVqZ810EQMCqZ6hvK/5GPe+B/wsWiTwp38YjIsGvZN53LReB9Q
	YylZBf53n0m/5qF9wRLFlN5YPxGEE12uvZqe5QOZ5NPAaa3pl2eZa1mODYAVg3Dd71fUzj8pIkD
	VjKnEDDOVMw8mrL7gqP8e2CeNOcgIdqBnnnwa5zL0vVX71EOkwx85JM6YSrJHA/m0Fk1hJI=
X-Received: by 2002:a05:6000:41e4:b0:45e:73a1:8d04 with SMTP id
 ffacd0b85a97d-45eb30cfd63mr37237429f8f.1.1779905172629; Wed, 27 May 2026
 11:06:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 May 2026 19:05:45 +0100
X-Gm-Features: AVHnY4JlerP068n-ZleAXKIVyTpaQ3MmDXw0dlAjg9eNr3LEYVQDkiCtV8ZKahk
Message-ID: <CA+V-a8vhCqdVf4iAusGj3rtCjkazAFqQJ4cwcnEGS0qK-EnVVw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabrizio,

Thank you for the patch.

On Thu, May 14, 2026 at 10:02=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The HW user manual for the Renesas RZ/T2H and the RZ/N2H states
> that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
> interface pins have to be configured as specified below:
> * SDn_CLK pin - drive strength: Ultra High, slew rate: Fast
> * Other SDn_* pins: drive strength: High, slew rate: Fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> HS DDR and DDR50 are currently not supported, and for every
> other bus mode the eMMC/SDHI interface pins should be configured
> as specified below:
> * SDn_CLK pin - drive strength: High, slew rate: Fast
> * Other SDn_* pins: drive strength: Middle, slew rate: Fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> Adjust the pin definitions accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v1->v2:
> * Take into account the settings for lower speed modes
>
>  .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 147 ++++++++++++++++--
>  1 file changed, 136 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch=
/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> index f87c2492f414..46f4aaac0478 100644
> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -275,12 +275,63 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0=
_DATA5 */
>                                  <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0=
_DATA6 */
>                                  <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0=
_DATA7 */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>
> -               ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* S=
D0_CLK */
> -                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0=
_CMD */
> -                                <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0=
_RST# */
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +               };
> +
> +               cmd-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* S=
D0_CMD */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               rst-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* S=
D0_RST# */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +               };
> +       };
> +
> +       sdhi0_emmc_pins_uhs: sd0-emmc-group-uhs {
This needs to be sd0-emmc-uhs-group and to keep it consistent, we can
rename sdhi0_emmc_pins_uhs to sdhi0_emmc_uhs_pins (and same for
below). Since Geert has already reviewed, perhaps this can be fixed up
while applying.

Rest LGTM,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> +               data-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* S=
D0_DATA0 */
> +                                <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0=
_DATA1 */
> +                                <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0=
_DATA2 */
> +                                <RZT2H_PORT_PINMUX(12, 5, 0x29)>, /* SD0=
_DATA3 */
> +                                <RZT2H_PORT_PINMUX(12, 6, 0x29)>, /* SD0=
_DATA4 */
> +                                <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0=
_DATA5 */
> +                                <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0=
_DATA6 */
> +                                <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0=
_DATA7 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
> +               };
> +
> +               cmd-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* S=
D0_CMD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               rst-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* S=
D0_RST# */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
>                 };
>         };
>
> @@ -299,12 +350,49 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0=
_DATA1 */
>                                  <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0=
_DATA2 */
>                                  <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0=
_DATA3 */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
>                 };
>
>                 ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* S=
D0_CLK */
> -                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0=
_CMD */
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* S=
D0_CMD */
>                                  <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0=
_CD */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +       };
> +
> +       sdhi0_sd_pins_uhs: sd0-sd-group-uhs {
> +               data-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* S=
D0_DATA0 */
> +                                <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0=
_DATA1 */
> +                                <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0=
_DATA2 */
> +                                <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0=
_DATA3 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
> +               };
> +
> +               ctrl-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* S=
D0_CMD */
> +                                <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0=
_CD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>         };
>
> @@ -323,12 +411,49 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1=
_DATA1 */
>                                  <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1=
_DATA2 */
>                                  <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1=
_DATA3 */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>; /* S=
D1_CLK */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +               };
> +
> +               ctrl-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* S=
D1_CMD */
> +                                <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1=
_CD */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +       };
> +
> +       sdhi1_pins_uhs: sd1-group-uhs {
> +               data-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 7, 0x29)>, /* S=
D1_DATA0 */
> +                                <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1=
_DATA1 */
> +                                <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1=
_DATA2 */
> +                                <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1=
_DATA3 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>; /* S=
D1_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
>                 };
>
>                 ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>, /* S=
D1_CLK */
> -                                <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1=
_CMD */
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* S=
D1_CMD */
>                                  <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1=
_CD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>         };
>  };
> @@ -342,7 +467,7 @@ &sci0 {
>  #if SD0_EMMC
>  &sdhi0 {
>         pinctrl-0 =3D <&sdhi0_emmc_pins>;
> -       pinctrl-1 =3D <&sdhi0_emmc_pins>;
> +       pinctrl-1 =3D <&sdhi0_emmc_pins_uhs>;
>         pinctrl-names =3D "default", "state_uhs";
>         vmmc-supply =3D <&reg_3p3v>;
>         vqmmc-supply =3D <&reg_1p8v>;
> @@ -357,7 +482,7 @@ &sdhi0 {
>  #if SD0_SD
>  &sdhi0 {
>         pinctrl-0 =3D <&sdhi0_sd_pins>;
> -       pinctrl-1 =3D <&sdhi0_sd_pins>;
> +       pinctrl-1 =3D <&sdhi0_sd_pins_uhs>;
>         pinctrl-names =3D "default", "state_uhs";
>         vmmc-supply =3D <&reg_3p3v>;
>         vqmmc-supply =3D <&vqmmc_sdhi0>;
> @@ -372,7 +497,7 @@ &sdhi0 {
>  #if SD1_MICRO_SD
>  &sdhi1 {
>         pinctrl-0 =3D <&sdhi1_pins>;
> -       pinctrl-1 =3D <&sdhi1_pins>;
> +       pinctrl-1 =3D <&sdhi1_pins_uhs>;
>         pinctrl-names =3D "default", "state_uhs";
>         vmmc-supply =3D <&reg_3p3v>;
>         vqmmc-supply =3D <&vccq_sdhi1>;
> --
> 2.34.1
>
>
