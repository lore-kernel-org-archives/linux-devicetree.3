Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA283264D8
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 03:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780629377; cv=pass; b=PFcWLMkT4QqqxVYfPYkK0r+dB1Xx4fPNt0GbgYaZCW9iernI94G/lbXpx2bJdueagh855azVr5oaX6sEKyZC5UWK6B98o0evpEO8Aq8XKvMaa64xUGsQsWGjSFGBrbxp6BhHT2h0Xd47bmPzB7nkLLSXFf+c83ksO8tl+57k/Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780629377; c=relaxed/simple;
	bh=dYRrm5JNSUnk7c4nDW//lJb97LaLyQ3ZyJS+ASQu0K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTHw2HtflJ74lAUlUAoUhQgyZUCHvA/9leyJrFWhn9B80L1Vosb/Fo/O7ADN7v2nloWbTWcf/L2rNSXKgZFkJyTN8uWgcfa+fwn8wSDlKakI6MuSKL5+EhxEHuI5t1YLll4J4fs3Oymw9bVwMHln9O0A46+vREl7QvDPHh32/XM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=fxh6x2Fv; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="fxh6x2Fv"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7dbd25309f7so16860167b3.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 20:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780629371; cv=none;
        d=google.com; s=arc-20240605;
        b=AA0q7caOGpcqtPtET8/fwl4RPzfyYR5EdOSMMBNEH51zZjKY65A0K8swU3TF88gbml
         rRHmrZqKNYu5axxTgSM3/uaDUkA7CUonLKpOfOg4mCuj2GYH71W9+dH6FNGYYgkbKEs5
         Ot6uxnqrg4YGt5YEgfaeLPJbUkJ6XsItvyS1mAInxUpGp74aPQcPXfoxgybb/MGG6X4z
         yONYoApAQR6b4Ka6XcFk67jlCYZFAhDOwVwhU6s6V3CU3cYu7ehCpHg683wU1SjwAecB
         ZP+IjwRB0ZSxAJFTXrafEscA6WOZHOtkwxj5TlpJaKN6Io7v0bjPGMPrBxR6QW7UCOeu
         NaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DYRAaYwduwwMFPEJSpIv6yQaYPElDxs+NUQslYWVbos=;
        fh=Y1gx4EdQo8/Ys/Qe3g4Z2HJZnIcq/kFS0y+Rx5EKpwE=;
        b=WQ3i2T+xSL1JydFvelQUtua+pn+UOv2L14IjkleJeoJM+QlqWJyegNv9bPgtUBp0mr
         Jdwfxtu27Su2Zcy8JZonC8Ic6q0TZ0NdHn5scJ7IhMddmsjV7zZ8hVleu1+NEjXC93X1
         FFMfGW4s+Hwy5uyWaYvSWPD9qL+GfG0/fv7Vm2bkZxffUdHVlR4G7poWMfWlze4Emyky
         eqebHqR+/TR2zhUA0vv14LcaPoXzRj80x600P6H5SgPW64+t08jjt5TIWs2KlJ2T/bSq
         hUla1jm71C+1HuygMHZZrRh8EexpPwr4+9a+eOrBsZUNOgjhtpTYnhMilan3IIDax6oI
         16Kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1780629371; x=1781234171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYRAaYwduwwMFPEJSpIv6yQaYPElDxs+NUQslYWVbos=;
        b=fxh6x2FvHHnsgUHNIZV96WS/5wUgTHpk8w9OV83YX8lkOcKErirUV8hU1jlzu+8nbO
         c+UpzeUsJNEFRqJUSmcvnKLFUzdmi5KZr3Ys42iS6lvmhbiwkfcnySIHhjig+YhqK+6k
         bYfn4ICuV/zYeL6/TW1Hkuyn2ItUHBOZi5qscW246bV4iYghWuUFF7wpCX1/0f2T5Nam
         GCW7QSUQAL0cT9NEkPueMmRZtq/0aPof1BDMX9GoqV0NTYL33tEqSjMiKgoCnfV7aeB7
         FlVlISmU+DCYV9miDUHxDJ6uif0s2vFOMlQAGefLuyORT1CCFzGGDT59K9RRn1gE4b/l
         HgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780629371; x=1781234171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYRAaYwduwwMFPEJSpIv6yQaYPElDxs+NUQslYWVbos=;
        b=gUkMcmV4uUkNykLjDKFfHBVuGi0CbqKmM0fFbV4xisVNORemrTEAzQOuvRV6PRR8xG
         PPysraEn9mppxSvTR/enQ5ij+O5lqbhXG16TJ3tgWmVZzLUxqRX1C2mHQ6qGEN1Xg/N4
         gGECx39DTCj029YtyLU/v1wJs3zmGgEg935lp6Rg8WTEfcoWOwpVX3M8T3sM2zcNXlzG
         UIllttPALo3M3I7RJvLzuuvzggMtSfPasMwl3QL1Ju+VqMw5omdZIZWsxvVMVYMa+8qw
         w6f986VyI++SilfttisMILaPYmpsHtiMO4RMekGGdQMJqZBbLqyy7QmruLCR/ZLV7/Qp
         fKjw==
X-Forwarded-Encrypted: i=1; AFNElJ9Wmdss6nAP4S6zS8W4z8/IGR6fLZ2heiyv+Ypinq9+4LwQao//fUAOoS8mip/BpAOJbPgc5NGk/jat@vger.kernel.org
X-Gm-Message-State: AOJu0Yye0uS23b0FUV5IZkW3OI/g1l2GOPOATFgIoTtJp32pYkUXbhOJ
	siIkFXG7EAb98eMN/IeefEHFtY6yrxRHenD9sgRMXK8n98AHEfR6CvUGu9AWWoYnXLY75GAIIg3
	gOSm5iBRuvMcNcLN70z8zhkzkqk9pn7BVjBPKDAGJLA==
X-Gm-Gg: Acq92OH7kPH2Sk9CDd46e+ZDi3zkkVoi9lxPgUIjyi4o+icf1zzCP3x5X+RyHBUe9/D
	DTU2+j0L5hpOClpG3KRv/LwEHnJLGdaf3yXTwuNEtkVdZnqKGACg1khHlgpvFHewz3/4yg+b3Wn
	xr5uzLogvc0+5IEguTiZDy07wJhsG0FrrEiwi38bBLyqIdZefBo0mC0boZIeWnrmyqPDdfCDkr9
	C7+u9yvCK8/Z/p2mM60+otAP4MFr9gPVJrKfWsZJ0goKI4N+UjvL10M9IO5eSksTedwoMGYNZAs
	Q/GEBTYPPqNrm4VC7gel6iuCK6p0N6sI+luiXgouyDrQCaoTU+coCvfJsSMzDEMs98uWDuVwW6F
	GgCzvR5A=
X-Received: by 2002:a05:690c:600a:b0:7c0:4f0:7bc1 with SMTP id
 00721157ae682-7ed0f825e7emr16245817b3.31.1780629371403; Thu, 04 Jun 2026
 20:16:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604143957.668047-1-joel@jms.id.au> <20260604143957.668047-8-joel@jms.id.au>
In-Reply-To: <20260604143957.668047-8-joel@jms.id.au>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 4 Jun 2026 22:15:59 -0500
X-Gm-Features: AVVi8Cdt4ovc7avZtDiQZF3NkqfzmPFNT9hCzsKPZLJGyudq_YtX5OFBV7Nin_I
Message-ID: <CAEev2e-OuutFYQUo2mtzvM5z_brneR+qn_WrPbp5_DeNq-7Fmg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] riscv: dts: tenstorrent: Add Atlantis platform
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 9:41=E2=80=AFAM Joel Stanley <joel@jms.id.au> wrote:
>
> Add initial support for the Tenstorrent Atlantis platform, based on the
> Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
>
> The evb machine represents an internal bringup vehicle with just the
> interrupt controllers and a UART. This will be replaced in time with a
> full featured machine once details are available.
>
> Co-developed-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  - Update mtimer compatible
>  - Add Drew's co-developed-by
>  - Correct aplic num-sources count
> ---
>  arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
>  .../boot/dts/tenstorrent/atlantis-evb.dts     |  33 ++
>  .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 471 ++++++++++++++++++
>  3 files changed, 505 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
>  create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi

> +
> +               prcm_rcpu: clock-controller@d0000000 {
> +                       compatible =3D "tenstorrent,atlantis-prcm-rcpu";
> +                       reg =3D <0x00 0xd0000000 0x00 0x10000>;
> +                       clocks =3D <&osc_24m>;
> +                       #clock-cells =3D <1>;
> +                       #reset-cells =3D <1>;
> +                       assigned-clocks =3D <&prcm_rcpu CLK_RCPU_ROOT>, <=
&prcm_rcpu CLK_NOCC_CLK>;
> +                       assigned-clock-parents =3D <&prcm_rcpu CLK_RCPU_R=
OOT>,
> +                                                <&prcm_rcpu CLK_NOC_PLL>=
;

This should be
assigned-clock-parents =3D <&prcm_rcpu CLK_RCPU_PLL>,
                                <&prcm_rcpu CLK_NOC_PLL>;
