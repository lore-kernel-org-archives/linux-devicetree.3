Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794234369;
	b=i4+Fw2FKNJMvvFr+CiagN5r27Prd+00gU1egsUZ54d1mT/4wpxdzDZEipS4OmCfTLvlW
	 VsGTuYY0IxJMWOWYoiNL+ehwiY9g0xbFLyKkoLXVYcUKTe7oAraHq+EXnKCF3FrV+JoCL
	 hjg3aSHJI0bBsm/j7BPzrbx73ZjEjYvzqTYEm7VKUrNIQQAekLcZT21DNIgFDBMvP9cKe
	 yBbzGgQVu/l1vOg2NMBFPFDYMjyYmsbmGJRvV962I7FgWCKiEUZbhy+afOyT4fIQYXlxW
	 o9VZdXevY0BZcGAyiKGaBmWLkBpw+MkEvcH5gJz/XqFLqNkLrLVinvQdGRwwaCi/ZXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qIH53Dn8wV1Rdnh4wAVpaQfyB6b4Tkg+abD1jmFQLjw=;
	b=RJM281E+xqN/r/upL9Aq9f9SjZpkUY337DUCk41gh0OrQfhkIBtCVTnw+v+L/QHbb+zC
	 E4lgxvwIg7vU9BlqMRw16EXfos+Rm8kEuXf+nV9wmIU1f+V81UzYwl5RphEOIwzvJmSm0
	 3gPT8xLbRnOL4zcOiDAEprQUBGrArvauwD2+2vWoY+pi+bPR+eo6rVd+glmE3zomSEGSX
	 ghG7WPDkpomzUd1eC2+570f1OlcpAa17UTom7soj4PCOUT/19QjWsfhs1b4KGPOS3yvPh
	 7lGJ6ZekPk10UygLOnvt0PI/tT01pxSJJUoUb0D7QMVB9Mbg16ptTe8OLk0FjAuIXWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=H2638CdV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB8606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FB8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=H2638CdV
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679a2b5fe87so1006813d50.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:26:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794234367; cv=none;
        d=google.com; s=arc-20260327;
        b=iuTyYX41+q7bbFt8Pu3MABMVJw4v7AqkaJnd7NKd8c2wO+BwlaiRad/+ZE8OYnCBie
         6bhZKqVwZXjmacmUSVstBbleqAQ/svKTJ+q0hlT55MrzSALp4oNyPs8uBmJ4G5nTkhUD
         O6ty4Rkt3bryqlQITb/L2oxOzerSmra4z02ThyZeBXE6jmGfLD4m2SBDiawNlzSg3zZC
         S4p8wLQ1pKFy8lRordHrcPlzSJPy2X5MXjSVA6QPh4VweNYfsw21uvyTvGG9iIzbBrEw
         JUuc+rgY5U6Sm8FZASWsUkFcl73ntko9S210ehEqpJ5pH7SI2hNf63OaTMmBlVVNJ53c
         fZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qIH53Dn8wV1Rdnh4wAVpaQfyB6b4Tkg+abD1jmFQLjw=;
        fh=p08RClNW0TY/pQL2Xes7j4iPM9oNF6cH1OG0SLe+3+c=;
        b=NppgLSJnFH06cKjngcDKL8sc3FrgvblOb1zwegAuvoxyIeLQUIBYrSvCW/5FzmpOVa
         DvaB0i51wGY+37jtdrxQU61zlnXepQGr+YMtQjyltpJrjdeyAIzLiRLfd4Nv4Qdr/A9q
         IbSY9bZ7wfwfNIXPhL+KC2FPALWfxGHTD4+/bKVwxyOl8411K2tUajLeIBLPlxLHPE3s
         yewHvvMknKWOKVUc0MxizXvoZ7XShppHW4ZjczScdzqyrGka9TYUaorA6fYXFhtGhqri
         d7MTJjD1Mxz1nm/MuIUNXoBLeHR6i119JrApq9+LS4ju7wc3GB5b/KhBkPGOqAA/5ZLW
         yIlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794234367; x=1794839167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qIH53Dn8wV1Rdnh4wAVpaQfyB6b4Tkg+abD1jmFQLjw=;
        b=H2638CdV8Gt/wfG3xY8pfJ+Vaf85XR3Gmzj1fc9o72DK4Cb8KPTLyYgS2e4hO/e88j
         wew9sCuCZqU896VCb03Xghrim/Dwj9aKFcqGPgOPKUbfc4H4rj2AzHyyQyD9gXaLdVBs
         dJUJTmE78L6zqxXOzDi5E8KuwUMWXF7aCUNeb+kUninnLLJ2wkf0Qk7z2p4gkaM2NcvD
         DGOiLS230HC2MPVRNB1V1J+wJ3XRfGBlJfWGSxREGOVgM0dCS1A68F49tqFbsf7Bv6+x
         NlLjK3K/hAENnAEGXUTsO7dEt9OJeSI8fyV3Bl7repwD/APd1ych2P7f1PgRHfp1gOap
         4STA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234367; x=1794839167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIH53Dn8wV1Rdnh4wAVpaQfyB6b4Tkg+abD1jmFQLjw=;
        b=VigKUsQGEEXc8rin5akW+MEMZh1WAN/rh3zXUDoTLTjC78uU86KX3q0eEYC4+tSY1L
         iclnzxypBN/QnJWFxBksMCd58gGT3pwwNlFn78m5N61YEsZgmh+FC/2gQpAUfTPIBZZw
         wiYM+vOsnKAhdQAedxOdK0iFJXvovjBE+jdKgm1IyPcmbfTCJRsus0GRKmNlm0tnWPJ6
         reRjerlCgWFAgymw8UXLy0T6Ucl5LY9xA9xDcy192UwajxHnA9/b1e9CW4pIz7o2vE3A
         M8mU0/zEkAptX/ozgZ6X2niCOoV2AJn3c72S4qXxRo/gHTVCjZeF7Ze3wSedAe3gb2uj
         pubg==
X-Forwarded-Encrypted: i=1; AL+hErEHTGKeJITZR84OTlsdEpf3V95Q7mbXU/xuONGpye2oHK1ryVvXsIFiyTyHoiLpHCfvLlbkAbHNBFbt@vger.kernel.org
X-Gm-Message-State: APuU4Z+xruVPat2Y/6lhhYCLJB8RJ4+FSnNaNeR3GI0alCe1EX9hEy53
	MEwct4sr4zxmWe0rnv7/z8fi+AeS4kB7NvLTlA1xlcg4Cij3JgkOqresRjBLbhszwqf0OY78Mhi
	DuE1hvNioTfN90+MhH//z8DoXhZuNJPEqXgMBO9olNg==
X-Gm-Gg: AYBFou1bo7ZMVG77CedtTXC+wWw4x4yJTAxa2wiqJ2QOPPimx10O+eU6b7b0uBo58gT
	zDc6HpisGe3CoMQN14Gq/jUd6eLp9qtuEaHv8/EkbmMVtCVDmYnqve6P6QBl+ijICixNlXa8UN9
	lFgvxR2Ou3aU4+nTi2ZYGKUs6o5M0ez74PraksdBBkwuC1ustbA58oaiX8TDSLd6fo/fRtuB6fM
	YNrWmuXHwnIkUOBmNRN+rTfzbLf0HjV0UUbcsswDCT4Q9Rlo1zJ38u0+0/n7vyJt1mU5FpELHEo
	aeJelSXw97xwFBaNwVb4StdrCqkawqigwjzSIDLmKVdJmmExdTlOptcvDHtfub+DrzIHTEipwP+
	yZfdlYAazaUxXWgUCrcrDi5UTXMgYtEGgU6mCxkJspjo/8LLo1fGOg0sWvgwLikIp22k=
X-Received: by 2002:a05:690e:3c8:b0:67b:f736:2f89 with SMTP id
 956f58d0204a3-67c3da9c866mr1700371d50.162.1794234367353; Mon, 09 Nov 2026
 06:26:07 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109051050.105623-1-joel@jms.id.au> <20261109051050.105623-8-joel@jms.id.au>
In-Reply-To: <20261109051050.105623-8-joel@jms.id.au>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 9 Nov 2026 08:25:55 -0600
X-Gm-Features: AclHuK--u5hRluPg1JE9nyFkIi-1UdC4R-UX8R7Z_hm47QF1ZiCQSficXx35Ivg
Message-ID: <CAEev2e_M6bqhDuQyygKBFUhy6euX7BmCyFQbk_q0VHtwz2ncBQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] riscv: dts: tenstorrent: Add Atlantis platform
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 11:11=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote=
:
>
> Add initial support for the Tenstorrent Atlantis platform, based on the
> Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
>
> The evb machine represents an internal bringup vehicle with just the
> interrupt controllers and a UART. This will be updated in time with a
> full featured machine once details are available.
>
> The chosen node sets bootargs to earlycon=3Dsbi to aid debugging early
> boot, as the platform may not have a bootloader to fill out the chosen
> node.
>
> The m-mode IMSIC setting riscv,guest-index-bits looks strange, as m-mode
> devices don't have guest interrupt files. The spacing (stride) between
> m-mode files is the same 256KB as s-mode on Atlantis, so we set the
> property so software (eg OpenSBI) can derive the layout.
>
> The SoC has a 8-way 64KB L1I, 4-way 256KB L1D, and a 24-way 12MB last
> level cache shared across all cores.
>
> Co-developed-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3:
>  - Fix prcm_rcpu parent
>  - Delegate all aplic irqs
>  - Drop uart1 clock override
>  - Use earlycon=3Dsbi, document rationale
>  - Fix mistakes in cache info
>
> v2:
>  - Update mtimer compatible
>  - Add Drew's co-developed-by
>  - Correct aplic num-sources count
> ---
>  arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
>  .../boot/dts/tenstorrent/atlantis-evb.dts     |  29 ++
>  .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 473 ++++++++++++++++++
>  3 files changed, 503 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
>  create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
>
> diff --git a/arch/riscv/boot/dts/tenstorrent/Makefile b/arch/riscv/boot/d=
ts/tenstorrent/Makefile
> index 2c81faaba462..92d8bb1a683f 100644
> --- a/arch/riscv/boot/dts/tenstorrent/Makefile
> +++ b/arch/riscv/boot/dts/tenstorrent/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_TENSTORRENT) +=3D blackhole-card.dtb
> +dtb-$(CONFIG_ARCH_TENSTORRENT) +=3D atlantis-evb.dtb
> diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts b/arch/risc=
v/boot/dts/tenstorrent/atlantis-evb.dts
> new file mode 100644
> index 000000000000..839a63dc9507
> --- /dev/null
> +++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +// Copyright 2026 Tenstorrent
> +/dts-v1/;
> +
> +#include "atlantis-soc.dtsi"
> +
> +/ {
> +       model =3D "Tenstorrent Atlantis development platform";
> +       compatible =3D "tenstorrent,atlantis-evb", "tenstorrent,atlantis"=
;
> +
> +       memory@0 {
> +               device_type =3D "memory";
> +               reg =3D <0x0 0x00000000 0x0 0x80000000>,
> +                     <0x1 0x80000000 0x0 0x80000000>;
> +       };
> +
> +       aliases {
> +               serial0 =3D &uart1;
> +       };
> +
> +       chosen {
> +               bootargs =3D "earlycon=3Dsbi";
> +               stdout-path =3D "serial0:115200";
> +       };
> +};
> +
> +&uart1 {
> +       status =3D "okay";
> +};
> diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi b/arch/ris=
cv/boot/dts/tenstorrent/atlantis-soc.dtsi
> new file mode 100644
> index 000000000000..085b0ab90bbe
> --- /dev/null
> +++ b/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +// Copyright 2026 Tenstorrent
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h>
> +
> +/ {
> +       model =3D "Tenstorrent Atlantis";
> +       compatible =3D "tenstorrent,atlantis";
> +
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;
> +
> +       cpus {

Please add a cpus: label here (like below). It'll be useful if we need
to refer to this node in the u-boot DT.

            cpus: cpus {

            };

> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               timebase-frequency =3D <1000000000>;
> +
> +               cpu0: cpu@0 {
> +                       compatible =3D "tenstorrent,ascalon-xg", "tenstor=
rent,ascalon", "riscv";
> +                       reg =3D <0>;
