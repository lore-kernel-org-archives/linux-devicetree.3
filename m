Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC28488223
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888200; cv=pass; b=Mhc7AgrKZ8o+5aZ5dzM/oC1pVA/Lm5C9xyEfUoeBGFlKUJNdOJnVKgOkC6e9AnQffar5SFfguXI80+RKte3PL5OqdagLfojfzuVWDT9XxXV8+KQv1Wq974gVG88Fnmy4RG7Wbm0T6YUpJofHDkmpUAlZ7Cy5SwB4bgfYhHsye4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888200; c=relaxed/simple;
	bh=//uOm0VTNuD0y0XaUO/FoU81M1a/Vo/45SryuH3ga2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKYihWorMF0+y8CE3XBo8AciOyXBfUlDgmoEXZ46pPykkz430i4OOp11I52Xxo4L/gONrIq5exXRT1K7WnTI36usCcJxIQH1HmKWbkss43BtQbgwyNe40/T3CQ0CkRH4E3GyBtVLCEBzVfB1CUBQi9F3GmUdZZamNliIN64wiOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0Y8iMEj; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0Y8iMEj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c34bff61551so307937466b.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791888198; cv=none;
        d=google.com; s=arc-20260327;
        b=nLW47hytvlyxGGUckMomwvSRUbTH1KG3J7PM3Fz+Fw0qFqZXFlG2vAHvAnuO4bdgQ8
         3CPiQGiuB0oDhAaVV4vIzcy7yODev2+tvc0xw4E+Dfhr1Y4DyUOsI9jpBvt25bxJTHCv
         JBKdwgThiqN0reX/8/csmECE2QiB0oHGZwHjkcBAwkvJPM+wTK+yQsaDNaOnWbTEx8g9
         /U8opALN+dr/Krz8KgCjMjJuSNBdT6F8Q2+ulGjJVSTqLvdg6QjFoLvehp84g3V3LMee
         Ddyic1VOUIH0lLJVppSRoGmFPF+RvsXnZYvLdaJQc7idhjDi/Nd2NJ1nlh2ygpXLRD4K
         1D1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=//uOm0VTNuD0y0XaUO/FoU81M1a/Vo/45SryuH3ga2c=;
        fh=fpTbj1l7Ttp+i+Z4eOrj/1i2PzW67Ewl4ooVYYL6CEM=;
        b=QKKYa5ziduAj/gns362yw49qdeEwaa9y98YM/XM686KeT1PDFV4UcciCo33C9841P4
         Th8xtwqCsGpgcasdPgS4v/nc1+IiBBqotj5KMWxTPhNWpaQ3Xz8QRR0jRruLaC62X0PZ
         yeeIEongBB+3uFYFTfYtQCPBqKkJT2DKQk609hJQ/ox8x9Ctm1dGWuB+hICYu4fdmcai
         OEXETw9gbi6j/lVQNgh360QJVjdbaXIkS+Ea/yqbsrsDa534CqF0qUwl9+IKHexO9MAZ
         1d/aV9DO3h5qGWDN6vVROt3TxlzzJKKWjcg7YE73C/SJcAKUvxS3/idYPkcwlhZbi2ol
         Rb+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888198; x=1792492998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=//uOm0VTNuD0y0XaUO/FoU81M1a/Vo/45SryuH3ga2c=;
        b=B0Y8iMEjKKdAnXuInmCS1ci4yye2fpzcYPsMiPaJxFbazlxDAo2pjSpfBWZGSUyp0b
         e9UFEu4qn1Fjj0qAZpuB2xsfKLE35wtSmIgz+c9B2QrjfUJ78DqOQ4nCG27PSsM2whVE
         HZ7w3FktQwbesviNP6ygSTeieayw4JrYo4ruRlqL2tpEIN2qnWak8DYl9WosRl4LTOao
         GDAaybbfPWxaMbzembdP25VMd10QtgPZSB2mkgp13ct57x1Qeawqv+sQjbU9QpMzCWQB
         ScNA1gqy3nTmu7IhqWy/7A/nRaGEnSRdkEoUFB5XjxW2cY4hFBtwPhoj6N/Hdhp35Ds5
         pkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888198; x=1792492998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//uOm0VTNuD0y0XaUO/FoU81M1a/Vo/45SryuH3ga2c=;
        b=LnpQGgP16ltGQTAvAYj42hpeZ3wzkXjBrE597dTyU6rVArt5X7z3CNK3B2e1d4HqZC
         GkqfEiAYA9ui9R4Wt5UqkyfSVnH4Nk+dH4b5U2vQc/WwDNrR0ryOOAmNe/0uOHvbXn2q
         pB3vbVWF6F0YLbMPx6Q/2Ek85vY9ee/7BZqNRG3XFcdgLPufSxeh9qzCfTu78BsJUM+j
         xvRF8QwbQIByxvlr9cS8KohnQa+YK6zy0CTeXS/wrNXYGPF9LOW4rkXl9Hgs4bE7ge/5
         JY/agKMdQD8cIhKCU7vBg7gGdkB6c6l7YZPE2upqoJr2mlPQqtpEo3AQoHUZOzZDyP/q
         NX6g==
X-Forwarded-Encrypted: i=1; AKwUvBzXbvRMW9gIfexqWmLYgbbn7QDovUvdAfAMzKr0BC2c2LtAjWQqmX9y2XYnoxgA1/PBNKN77jEozqqn@vger.kernel.org
X-Gm-Message-State: AFq9FYJSz8ejGR2iE08wu+7VDs5Ew9yPHOBEaOnXirAKKW3Eh7LsXzFK
	4Zn0ADhGu9fOc1QkMyLQp7D/ZveHgeCHcfxYZLRQWOKSq4dtA1qXPT25w4j5hTM3LM11rqfS9OC
	Jk/jC1pxld0M5aBS5vgKR3egnUOUD7M0=
X-Gm-Gg: AYBFou1jQpjtUoWqX0dBhR8cYrKvQBNZNDydoLPeFtIEQhEqTVBw7z8vZy9lRy8PtIU
	xN779jT0NrFOdXEmNSilzZXHPo87kiQOXRuNrPDiDhSsl0ZaPoB2GqKdpaIFVF5HuXp7gYHO4mB
	4bNgI3agNaRMspXUOCtJytDxjEE2dvJXSkn8uxnEJYknJuXL5KrWzB9n69tvW/oUJpF/W+5lkqi
	iU6cqs6J2mzxAuJPf+inmjfbBLblWohQgdss01ldRSlmUeDFkH6CxWiydBblj1tn7mvkG/RaCHb
	HHnVHa00vjXpMZJP619dG/ok2usqj9HYyyYCtv9E24hpw+gTlx6mds8=
X-Received: by 2002:a17:907:968b:b0:c2a:c76c:c743 with SMTP id
 a640c23a62f3a-c31aa0b353amr1124595566b.35.1791888197437; Tue, 13 Oct 2026
 03:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791512067.git.zhoubinbin@loongson.cn> <1375bd12403bffc496261953772a45833f9b5a3e.1791512067.git.zhoubinbin@loongson.cn>
 <196b51ef-835e-477f-a46e-575e37bb17e0@oss.qualcomm.com>
In-Reply-To: <196b51ef-835e-477f-a46e-575e37bb17e0@oss.qualcomm.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 13 Oct 2026 18:43:04 +0800
X-Gm-Features: AclHuK_tDCwBdwZoMKnhN-N9F4FyVAhXECtz50Zuv-v7rjKroUjNNoj2cpVB1Do
Message-ID: <CAMpQs4J5yWNsYY7NmWyWDSRuBjD=2HRwjLB0Rh2GnEaXxG1_sg@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] thermal/drivers/loongson2: Use bitfields and
 per-SoC thermal ops
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, zhanghongchen <zhanghongchen@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 4:50=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> On 10/9/26 04:58, Binbin Zhou wrote:
> > Replace open-coded masks and shifts with GENMASK()/FIELD_* helpers, and
> > define named constants for the Loongson-2K2000 temperature conversion
> > and trip gate calculations.
> >
> > Split the temperature read and thermal zone ops into Loongson-2K1000 an=
d
> > Loongson-2K2000 variants, and keep the chip-specific trip register
> > callback in the chip data. This prepares the driver for further SoC
> > support.
> >
> > No functional change intended.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
>
> Please use the bitfield directly in the previous patch

Let me reorganize the patch set by splitting this patch into two
parts: the bitfields section will be merged into patch-3, and the
remaining changes will be merged into patch-6 as preparation for
introducing the new SoC.

This seems like a more reasonable approach.
>
>

--
Thanks.
Binbin
