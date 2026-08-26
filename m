Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D2D286D70
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760429; cv=pass; b=aDSlwzO4AI6zQZoNW+FJp09le0fRdJ4E7FhOlppGMZhQraTK+D4mUiWwn+1N2QgKrTpve5ISgQ4ODbHH24Nk7iY5ASqHW1geCInJ3R8ntMUQrHRDN+yOODunOvytwggGMvjvtB1BBUuSQWEetsgGueAEIzCrwTYMQ31PyXQcru4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760429; c=relaxed/simple;
	bh=aFuIk6AbhdcNiE1bV56o6X7K9fMz1Hx6enV/8s/aroE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXvQFM7G4xRFJq7BZrUCUFYiEV6ZH8s82eZ2nJ1vU4Yyo+aayksz+F4Na0Im5YsxaZlzoJQ1F2iPgSZAt5X/fzRue78aRdGS07U7MRJChrDTSPWzb8gTWSXurYUHGShS2lMCtttIC+dbCa/4aiQaw64WRgcxQ0qLwaVWzDOagZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAyksSd5; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAyksSd5"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66b32bb75beso1702019d50.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787760426; cv=none;
        d=google.com; s=arc-20260327;
        b=AwJqdHNC6JvqCuz/S9q1V1RDk56I8XePGClVGhKt6no2GUX1W+l3E8Z4ISn0xN1IXb
         f5A0mJShBbb0kVHhH0bt7383odGA+v5ryOZXidLOi4/xkYzam1UAQ19SOer+V3Yiu33T
         qsesZ2NQoPhR42B/uCZGxDnSI4vQ+zTBCivhknWFdhN4nRNir5wk/8FliLWF3mXXBKLH
         n9knXVmG6Yoeo/KdOgSofyYp3DKAiOs+n/2EHid7nCV699jJK5mllA/uTjmuPczsbSNh
         JGCNpB0QroAnPVgTKJPpza93Hou1oRQKUpt0aRe1DLdL6UAxNTuizwhkZ8+JuTKlIQJM
         3Iaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZlZQ8Rhh1qyGK3bhrJ6S37zPY0GD0Zfh5+8vycnKN4=;
        fh=xta/SRClZsoMS6h3+a2hxel40XM22EqOk70gvVsNumg=;
        b=Xbk276hiQq2uM0IKe2f4lyCejGJ1hB8Wi6E5Pinl7AVdidRxKFRJMX40uBXr65pOHw
         qBbxIt6+8rft5QS1JxzlgzMvrF2emgXYxDbuWtkogC8h36flBmW51Jiln2paKhlfBQrm
         diCK2C7otsNpaosgs3m7nYEOrzQKLKKQhieazs4wGcXbXUfroaEhBmwhp3s86fHK1ooR
         TsudoHISOenVWb09rmOKeLw0bts7BN4YV98lJYs1xj+QeV9wL76vEpuiv/dEDngcIcGt
         DVJ54KbyeoxtzoIDekI3xqg8NpDxBprvA84ywccidJGFncesZs61MWLoodK8B07iVLJd
         rIvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760426; x=1788365226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZlZQ8Rhh1qyGK3bhrJ6S37zPY0GD0Zfh5+8vycnKN4=;
        b=ZAyksSd5/Dm7wmw2SqPibtg79xKHT9liPdYXA2k50TFiw+nnuXd/lKkFvtdANK0909
         FJvA2gFPQEIjsOANZN+yjVwQJyvtEWjVy6WMkSjg2Ubp/Ekl6LouEXhnOU2RHNXfBxDY
         0ErbnX/z095WYMmHOAbxsQ5DwNTVad3zkNJT0v8C1PfmrXbKvjg5t98zgy4i20beBA7P
         s8gBsnn7oUUACZUsKHiHYi76VcaRgh+M9StIZcoLsRyOUWtAKLv9bLRqkyN3nVyaq2Mv
         B6v+WiP1bG5CMduItYtUD+7crr8Wy1lQAmw0vaDvjq7XmC0a5BG3kikhvjBL6GGD4HIS
         wXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760426; x=1788365226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZlZQ8Rhh1qyGK3bhrJ6S37zPY0GD0Zfh5+8vycnKN4=;
        b=O++dU9MkJR+ZJxMH8BP3zgMhGKT1C/9CHmNDnyHC9bso1DYVGHuD1efwIA3FPIQOc0
         96Lxgwi9pKewA2W7sRhmY2bm/I/DEu1pj0tRocXUX7Cg2f85KPIO/ApK9az+86hiL2/Q
         JcEzZ1NV3sxgtIhwC34KDTRQwDly1uPFCv+DkGM9L/6z6wMZgAPQ9ngziNm8l274kxLd
         E3Bo0O50AhSbHPuKis0jpQNOW0Lv179r3QotHPXpQCQlBlSa9v1yWiXW/h10uRCi9/wp
         8xZxT1M7vZQ8GKPrCSeaV2V6lQTZbUPsCKWIVe3Bud2UkhsVDX1TjyaEieIMSNGr79uo
         Vrbw==
X-Forwarded-Encrypted: i=1; AHgh+RrL1g75Hr9O0oZtiFiqOMj4xhVCnJtY/pweUuNvfdUCrQY5Cv+n+Tv/NTDx6mEucTmNeAj3UvqacZtb@vger.kernel.org
X-Gm-Message-State: AFuF++ngXoW/kSENF6yKc+wJbfZNrSzYpW3BbGjPE/mwBy92YR+oE6fb
	OlnlVwK5BiUCpShdTph3tB5T4ie9efLwHCddvq2RJTs02F/KnpXIdG29F+8toocN6U08+SvNJOx
	qmQT5HsmfnQ3LPEqyzGdbP/pM/4OHnuI=
X-Gm-Gg: AR+sD10/HUung2vW/Su2h0NEl/v1hG9rPgqK/M7zcrWdHEo+EuyOqYLdwXiQljcLZ7p
	4v7dUsmymLT/MAMrJT6YPg9XAvatqLF0fegixraJL4CdNcMo2ZqKuFxF6ifmVa/lC5lyfwaJUGc
	CFFc2U7zVc6QDrjqg+tl0tsjP+Rn+Lw1ETc4S6u2/XjfRF644BC+W5Ol3yL469eiOhyeuEnsqj4
	PBXUHiHzSsEo84/BN9UAg2ara2IpQrI74EpwLlWxrzclpNRnpCaw1jI45o95xGY1ZjKEp5I1Y7g
	5bWyCnGjf3opo0LTz9uYuyb1AiaauoVHz5ZfMCEmoX8ez54fg4wtEKrQr/N2F5dPR/sotpUXhhL
	VrnH1tni/TdSG3yoG3OgQSaVpOiQUOQ==
X-Received: by 2002:a05:690e:d53:b0:66d:2469:2518 with SMTP id
 956f58d0204a3-66d256eece7mr2798681d50.13.1787760426443; Wed, 26 Aug 2026
 09:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
 <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com> <a518f6c8-7880-4854-8dc3-ac90f0eb93c3@oss.qualcomm.com>
In-Reply-To: <a518f6c8-7880-4854-8dc3-ac90f0eb93c3@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 26 Aug 2026 11:06:52 -0500
X-Gm-Features: AcwNN1XibUJOXyNOa2k-QB-afByCcBkGNudzVWR4SXKPlPfS0zWVsrdForCs6cY
Message-ID: <CALHNRZ8rqcDYcBJY0+Y_ioJroWsns_BFggMpuwZy9tiPavvBaA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 5:26=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 8/21/26 5:30 AM, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
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
> > index 0000000000000..2422be63f0f13
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
>
> Do these actually have any common lineage with the AYNTEC devices, the
> common DT for which you include above?

Please see the cover letter to this series.

Aaron
