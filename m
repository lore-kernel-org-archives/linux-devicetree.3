Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEECCA4E
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 00:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785024149; cv=pass; b=K5ySjpKo8jZ2Tjy2tEycChgW/gWZ5RTGT3Ee1zVGmrwwgV/79Jle9YDD1tJolp5o/EkxlveT2D2OUneIg0is5b7HKW+J/5CrmVWIlHRR6jeSycGlrFDZk4wIn2eaezmQKsfpG2++4fFg0PVkE9absF64F6e1WgI7YwyT24IIPVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785024149; c=relaxed/simple;
	bh=hGMDwQQLThygxY83szVLHDeO1j19/dPpyXJ0IV8ZMk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWC7uYV2nJ33H0JTcIc6c0PLhzddrEYnvNxYF74wC+nSJkN3j/yGhklF4suPCv60GaH4/281ZKX+VQ1uFXHMghROZZgAX5xYbxDJ6AjPw4hNYJ91OG/AXjacDxXIY3Z4NOH+m+44EIosM0AnuNQjlePnZYJXJUVv/gB20h8Ur5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eeuxola6; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eeuxola6"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69e8ea2783aso2038022a12.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 17:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785024146; cv=none;
        d=google.com; s=arc-20260327;
        b=M9bCP4mkg/lz/Xq8aS45kO56FgNCHFBeI2IYXsqtpvdQbyMF5RbwgM/OFJMmpOUp40
         PgedRZCG6aayBvwgQic2DrYciQoCmZd2nYWP/UmrNaPr73ArOgObeqnneSMwQMAnWcXV
         Y15+JxqYENwgoW+fJshnikhFZUUaF4WRTM3i2l8b2OZKHMElO9oBqusozstfLsHzfaUL
         c0xABtn61yOcfh6WrhA4fsLFzRZedSsF3Rn4bjgSAQE74Ts7CIa4XtsOP8Dcnum6N4Eo
         RlRO5NTB2RwXNJbo7EKu3g/12H2ziGmVA1O7Rg8G1B6hso1qxgQQuUlxhnaIpxvxpCLe
         vbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1OFM/TCyOucQ/FV/J6qU4TAWprxb53QsM1x2T+kKVBU=;
        fh=naJ8y7usUjGH9+S9LhjmCAtSVZg0h0NZGFnf5j+KKsk=;
        b=lHFFwIr7sjqrL6djCu83JSoUTRP5GNgkyTIej9MmPNDCJYMxtD+pg7sOvRvK2No6xC
         zU6OWGKsligrx03yvG6OCEDPh6NJv/9ELZFBgsEyVjS3HYUyodIQqr5evJqhbXA0/LcU
         UEqg0wq/NdE4NacsmfO3xBjuHdz1b9x5IWUD+AfP6llIc1QOjIgfvT6vLiUZdxetBGS6
         hQO+qiDlxJwpN2nPXQ6xO7bw7TdtR6gJU6pIB2tlCo4iSn95uM09Jd/splGo5EOJWokQ
         EgY2OiYEoTMLveUi8pTD4C0CII4lz+HqWrFD+kjAdLlt+hFeNT8lSnLiEINoGc0/NHnt
         jIiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785024146; x=1785628946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1OFM/TCyOucQ/FV/J6qU4TAWprxb53QsM1x2T+kKVBU=;
        b=Eeuxola6zRmfHnrwXdaRnPtMaGU+oZF7JceO1mSfIoo9qsQVk1O15JGoqJVMkyWVuD
         OvE3p5wJb3BOV03CVvGK5ivbW+k1eA+UNHcFyOaxbKCTf0bNh5Zh1sG1ChpnrndXCUNT
         /tN2L6IJUsmi8TuTvqXFY/DfOVNQv93yYDKzhUBA1hDG7Fbp9lsGgo3AhKgXgzwdHYgz
         u8QfYVweCKVHq/j4w6kdaQ52/JpUMLrz2q1k5qBPa01vBcRNJcXCOoXTaveZxyFIgKSA
         +2MJ9JGsAmUpkyBIjJmNempb7YOk5vl73GA6ydsf0Qw36V3c51UNa4m0Bs057Bk3+APv
         OvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785024146; x=1785628946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OFM/TCyOucQ/FV/J6qU4TAWprxb53QsM1x2T+kKVBU=;
        b=dReXeL/x/6Pwj4hQ+69SyMknPDe6wIORfZUNg6jHjabM5niCT/e6qrR+PaKIovnyZ8
         qWGNtrP12WiZEkQE52QHc56ZJ7ePNiULTePa2O+FAS8tcg1xjxORXe7B5NF//ia6PsLo
         2majTDoK3mLDkrqRX6hHRmsWjVCbigfr4rJLInWmfOp2asMPW+VtUnmAYAgB9FDioDXk
         cmI/0RAwblqVwSCa3nOF2wCWimtlOhwWibDhbwzLHRyDLIVFKddqYjEZjCiO86vD4gVi
         WlFTmEI0oa1g9BPxTmJJeN6mEDqxkPyGOXyUgt8+8+y39+GYiILgk69IpSnK3fvgrteb
         5XhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLg6kx1DHo1zkxUld+KatRz3d4uBCflXRpUgztmIeqlVP2CyXknY9AwqBPjx1TbPAZOtIYWAmMBnND@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv4DDWnRTJ+aoHasoIhgJRINCQCKVQ7082Gm068BL1fNrYL2cm
	QZc1llpFJyloHPG+kA4VYRqcM6cPXqPYCW6/yq+jzeF8RaKQqv/3s0ysQOnZ4RL9G2yiu4ek70/
	wPartwkWeozo1Rfhqz0pFmk79RtK42avS1g==
X-Gm-Gg: AR+sD11C6OZt83+kYTO62B5+gKcTJmFLuA2HH2AQGO+wp7l5IMTQQrAgrYbX4FxmFmK
	OCh0GE4XHD08UD/LTuHlb+OaqMwnpXOIXnbX6mhvlE3A9DRc2tQ9mWKhNlUnref4Tb0srfl60l7
	KeIgPH4A2IEEk6iReISHOpYWba7QG6CDPWJGKm36hTOiOC/dcJLdk/vIfq0rnIPIJReD3YYNLO3
	9tVkDKjJTm0nOoeph+JQVjOU/PeTYbQ5VRXDyIPpSG65jnWXS6cDIGXsTWl98DNALgd6XA/blGQ
	nX1dUx9oVueTGqXxrbg9DnFcBoDyIupt0Za8N1yEo7w9LrwhGQ510dl4IpsRiyDp5nklg2Qa9QE
	y3eCGHppfdcfLo1Z4RaymshsNbrnM4926QVRUC5F9RaccybfSNvvkiJQhY2uRx1SuQvl50/u5
X-Received: by 2002:a05:6402:2693:b0:698:3b7c:7e52 with SMTP id
 4fb4d7f45d1cf-69fc118cd72mr1268009a12.40.1785024145825; Sat, 25 Jul 2026
 17:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628231049.1248899-1-rosenp@gmail.com> <20260628232120.0511A1F000E9@smtp.kernel.org>
In-Reply-To: <20260628232120.0511A1F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 25 Jul 2026 17:02:13 -0700
X-Gm-Features: AUfX_mzkRY6Z8kZjUsSyDR6zqqIZ31wwydK7R2vmJU3Bx1SrmlOEVAvbSgYCMTQ
Message-ID: <CAKxU2N9EvtEGzaowAr4J0+0F9iFsd5j8jmL7JTAqBWDPfanoaw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA9200: fix nvram size
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2026 at 4:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Heap out-of-bounds read and write in `brcm_nvram_add_cells` =
due to mismatched logical length validation.
> - [High] Fatal page fault due to `ZERO_SIZE_PTR` dereference if the NVRAM=
 partition contains only padding bytes.
These issues were fixed separately.
> --
>
> commit f8d0bb1af13fdcf08114311cb9160479fcd6bdb5
> Author: Rosen Penev <rosenp@gmail.com>
>
> ARM: dts: BCM5301X: EA9200: fix nvram size
>
> Fixes:
>
> [ 0.182121] WARNING: CPU: 0 PID: 1 at drivers/nvmem/brcm_nvram.c:85 brcm_=
nvram_probe+0x400/0x480
> [ 0.182159] Unexpected (big) NVRAM size: 1056112 B
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> > diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/ar=
ch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> > index 5bbc2ba0f9598..87569408bb695 100644
> > --- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> > +++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> > @@ -26,7 +26,7 @@ memory@0 {
> >
> >       nvram@1c080000 {
> >               compatible =3D "brcm,nvram";
> > -             reg =3D <0x1c080000 0x180000>;
> > +             reg =3D <0x1c080000 0x100000>;
>
> [Severity: Critical]
> This is a pre-existing issue, but I noticed a potential out-of-bounds hea=
p
> read and write in drivers/nvmem/brcm_nvram.c when parsing NVRAM partition=
s.
>
> In brcm_nvram_parse(), the length check validates the logical length defi=
ned
> in the header against the total partition size rather than the allocated =
data
> length:
>
> drivers/nvmem/brcm_nvram.c:brcm_nvram_parse() {
>     ...
>     if (len > priv->nvmem_size) {
>     ...
> }
>
> If the flash data defines a header->len larger than the non-padding data
> size but smaller than the total partition size (priv->nvmem_size), the dr=
iver
> calls brcm_nvram_add_cells() with a len larger than the allocation:
>
> drivers/nvmem/brcm_nvram.c:brcm_nvram_add_cells() {
>     ...
>     tmp =3D priv->data[len - 1];
>     priv->data[len - 1] =3D '\0';
>     ...
> }
>
> Can this lead to memory corruption if reading from a malformed flash
> partition?
>
> [Severity: High]
> This is a pre-existing issue, but I also noticed a potential page fault
> if the NVRAM partition is completely empty.
>
> In drivers/nvmem/brcm_nvram.c:brcm_nvram_copy_data(), if the partition on=
ly
> contains padding bytes, priv->data_len becomes 0. devm_kzalloc() will ret=
urn
> the ZERO_SIZE_PTR token (0x10) which bypasses the NULL check:
>
> drivers/nvmem/brcm_nvram.c:brcm_nvram_copy_data() {
>     ...
>     priv->data =3D devm_kzalloc(priv->dev, priv->data_len, GFP_KERNEL);
>     if (!priv->data)
>         return -ENOMEM;
>     ...
> }
>
> The ZERO_SIZE_PTR is then cast and dereferenced in brcm_nvram_parse():
>
> drivers/nvmem/brcm_nvram.c:brcm_nvram_parse() {
>     ...
>     if (memcmp(header->magic, NVRAM_MAGIC, 4)) {
>     ...
> }
>
> Could this cause a kernel panic due to dereferencing address 0x10 when
> probing an erased flash partition?
>
> >
> >               et2macaddr: et2macaddr {
> >                       #nvmem-cell-cells =3D <1>;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628231049.12=
48899-1-rosenp@gmail.com?part=3D1
