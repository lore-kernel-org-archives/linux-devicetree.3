Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D31A4963B8
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734222; cv=pass; b=Z9HaNoed/C9VPwLBapAtF5D+FHyTpsPpv2OC1BkVlK7dgtmekYO2hNwbtBxD54uivfzQ9Zssg6h3izrBmGDOtGcvNTv1K4x80dzjt4ZusnQvHHlLUfwvYZZ0+7w9nzh5bwGAKLBjsNp8g/1Mfo/zpyqHGjD3XoU5zksULNj0WMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734222; c=relaxed/simple;
	bh=qQI/JXDVczQ7y8XoDStx4EtR3tJDwfAXTphzlNpcO7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxS9hUDjYYk38uCw22ogS2ZRJUnSbvdigKb7cVBlsUyynpaqVPc2hhaDc/6/SATck6U1DnlxdZy+WbaA/XcBOVlEt6ntjgseaC3nhxxdvkOf0+60fkr66z3ZRsZs5wd78siDfjSPp1JsIsu1Tl3HH1daop0r3J/lcSopoXC+q8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvoor54R; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvoor54R"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a1321319a9so11489691fa.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786734218; cv=none;
        d=google.com; s=arc-20260327;
        b=Bjsg98VCRiwhoq9fmGmHpO2k7KGwTBhYctJWQ1MEe/uhM9GFzo8GW2eJUgN/5QfDj+
         82fYQKvdbjBuNPS4gRSWzoFbJHhZDmrCHHTvojHoc2C0zM2se6XGXbHDsH48g3pxxrqD
         X5yT9KaPahmR9xTkOM5PVhQKSn7LMbt2bNPg1G6+EYRJUDYnXPjNB0DEccSTEFDQECtd
         FvDP8BoKpIbXMVoNl6NXIJGHN4qtDl3AlADp6+g/ULGcdC1EDxhJaBY5rPetJSLgN2LR
         siZGuBXhGHREc/JpV1PNwYPSOTnPLJb1qrNUuIdZBGn5lqH4PXv2egKbZxuiuA3aS4HQ
         0qMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tg7eFnXbdlEJOVdwgdnj7Wlcb/VkpASkYOtfHYmgAf8=;
        fh=hCMHrySSrIimSPSFEtEyaoyHlHx3KelWHxRhMa68WZI=;
        b=pPZtWLdBeGgA8BBk1OEa8+cx93tottAaZAE7GtPTlmTiCW6ZFGd9Ly9qW84S3cYnRL
         bq3csfjfcRJGVENprr2dWPUd3yEfEkH3+qJIYt6rFI41ylkJnccQx8fGBMy2tr0p34O8
         QzZx1hSLFXGq56mk+gWe4Te0gJ2v9DiLkB2uhADPaKK3mGXevR4gZrQIsvyna5AJEPpD
         k2hwckIbtMjPG3jMRvpoHK7GWu/7cSQ7fV4lQwRA/bzhmWxJux8PHaA/ufUi1EfbM+eH
         50BCT+33zqWt3a7/jBj4EeYWaU8wk4K9vFZTvUm19Fr5odIq2U4Ko6peZeUVLnMyzBeZ
         vo8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734218; x=1787339018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tg7eFnXbdlEJOVdwgdnj7Wlcb/VkpASkYOtfHYmgAf8=;
        b=qvoor54RLzKuPOgyE8jx0snm6L5a0TXzc038AZ0lkTEwl9dHwlVAAszGW+t7CmXi15
         XbevtDT7LBiZl/3FUCWWzcq45NWYe6TqksLLiFMgypJ4fL/gSvI/4SMBglIisS1oC6il
         laoemXEG5zdgg0mtmezz4QJj28lX7k2Ivb/rLRTONq6gXfpEIctxJmeBaB7Hw/t6c7Vx
         Wi5AyGhxGaWn0pr1E7sejT6A/UKuOZr1s5FFFyHCy3d8Y1pG68/JfilP+Mo9RN4p6S/7
         odSdASDFuSR1JIvekPtu2S3tRE/0twtWoJz6pZ1JuORH4xgJeZzk9WkLbcuXkFm8nsKS
         0KBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734218; x=1787339018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tg7eFnXbdlEJOVdwgdnj7Wlcb/VkpASkYOtfHYmgAf8=;
        b=msc/kgLn6Ftbcx7Hrhhkmv9bWsEEPOHJJ52CpxHE/8U4K2ONtj2e2d1uJZe3+CmaFG
         MPJRmsUBm6Pw9Kqv0zGK7wvaMQov+fhvPauNgub4bkqPi0MQFcPe7sRAgSSiJMqg+e9/
         qSpmBR+ictgURntjw2kQ+bkdCQyuQ8hwwFtqQkmYrKbKp/ZUxsVsmu4AHSPCaPcqwR4u
         PGcj2nTdTuIrsYn7Wi07K+1fMdGVrqME3/VXUQ/JwzJBoL2c5VLd2ZPhwCAef6fs0L09
         EQo/uuO+jYjKZ64n8YUJ11JVYcjtGuUofi9nJq6qio6JRHlR+uTiUdIxd4wzvD7IW2HL
         H4EA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0tOtzrGTcTxWpnqgKYjKX3ScD0a88+VMoBJj9qjen8pBqyc2ItrSowjAbMxWtIk2akSI7rGPNUb+M@vger.kernel.org
X-Gm-Message-State: AOJu0YxTnYwA6Avwk4mByYzjCSy1Zv9WY9R1hLka+Ctong+0skOhpmL0
	njPyrgfZYNBaoiKYvBPbs3P8CpVkMtGPVF1kgjQIKWbtBTu9BrIt2Oqh3NFUVNR86svPugFPe9w
	5xfsOyIMVOIDjK3JaA1hpMzHF5/0+Vcw=
X-Gm-Gg: AR+sD12hJqh3YGxM++UjAn3hOXEffb6tUJ9Dp7HKVNQuTvVCOx5TLwzJ+XS4P+1CaA8
	I3+Wu2wvQZBwKJj7RtUTyK+1nalFHJuQ31DfWJ/QrILaQcbpdq0Q3mEtZbQXoMh6HUxaOIqGev9
	sb489ozgILkL2iQr20dweBb7gNUhdOC+CLOmO2LyMdtQZd6ixtWjxX/7nPxaUKsUt7HZL0ff3Nf
	v8TrTUwOP07nsw3Eh2asrChLskNr8Bqo2hfU3rHzXcpNO8Ow4y2ElAozaG5LU5h/VScJfNwLBxb
	GRwBX0fl7a6xz5NPgC+ZsPXbR0E6xYtxUGZVyCzWxc2c42grcuzY5Vcehg0dBMy7Atl6Nhr+pVh
	CBJ0NdrhVcULYFSPUpEAgn1uKoIQ6uA==
X-Received: by 2002:a2e:a985:0:b0:39a:da70:2c77 with SMTP id
 38308e7fff4ca-3a1323afc12mr9160441fa.3.1786734218362; Fri, 14 Aug 2026
 12:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-4-a5a365ba3dc5@gmail.com> <20260813-private-brass-rhino-81d7a9@quoll>
In-Reply-To: <20260813-private-brass-rhino-81d7a9@quoll>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 14 Aug 2026 14:03:26 -0500
X-Gm-Features: AUfX_myLhnVJMTjLABXPnREVf77347qXPc1GGgdYTRAzQmrMSKyYh9ZAhwJ9YqM
Message-ID: <CALHNRZ8U3BgQJoKiQi-yX8pT+YDdp_BE6NVK7M3v-Jwe1qh3YA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 4:24=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Aug 08, 2026 at 12:37:58PM -0500, Aaron Kling wrote:
> > The Retroid Pocket Nova is a high-performance Android-based handheld
> > gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
> > featuring a 4.5-inch 4:3 AMOLED touchscreen.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> >  .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 118 +++++++++++++=
++++++++
> >  2 files changed, 119 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
> > index 09b3c5b2d9dab..582805e89f4cb 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -196,6 +196,7 @@ dtb-$(CONFIG_ARCH_QCOM)   +=3D qcs8550-aim300-aiot.=
dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-ayntec-odin2mini.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-ayntec-odin2portal.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-ayntec-thor.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-retroidpocket-nova.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-retroidpocket-rp6.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-rb5gen2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs9100-ride.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts b/=
arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> > new file mode 100644
> > index 0000000000000..10dabb1d51f5a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> > @@ -0,0 +1,118 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include "qcs8550-ayntec-common.dtsi"
> > +
> > +&{/} {
> > +     model =3D "Retroid Pocket Nova";
> > +     compatible =3D "retroidpocket,nova", "qcom,qcs8550", "qcom,sm8550=
";
> > +
> > +     backlight: backlight {
> > +             compatible =3D "pwm-backlight";
> > +             pwms =3D <&pmk8550_pwm 0 860000>;
> > +             brightness-levels =3D <1023 0>;
> > +             num-interpolated-steps =3D <1023>;
> > +             default-brightness-level =3D <600>;
> > +             power-supply =3D <&vph_pwr>;
> > +             enable-gpios =3D <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&pwm_backlight_default>;
> > +
> > +             status =3D "okay";
> > +     };
> > +
> > +     vdd_disp_1v8: vdd-disp-1v8-regulator {
>
> So foo-regulator?
>
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vdd_disp_1v8";
> > +
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +
> > +             gpio =3D <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     vdd_disp_2v8: vdd-disp-2v8-regulator {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vdd_disp_2v8";
> > +
> > +             regulator-min-microvolt =3D <2800000>;
> > +             regulator-max-microvolt =3D <2800000>;
> > +
> > +             gpio =3D <&tlmm 142 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     ts_avdd_3v0: regulator-ts-avdd-3v0 {
>
> Or regulator-foo?

Given that the associated AYN series uses foo-regulator, it makes more
sense to me to remain consistent with that. The question has been
raised on the RP6 patch in this series, so I will wait for a response
there before sending a new revision.

> Decide and also read:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml

Ack.

> Best regards,
> Krzysztof

Aaron
