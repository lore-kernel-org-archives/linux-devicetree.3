Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E353C1F5C
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555357; cv=pass; b=qxBwXs5PamDV8W4pMxnWiTYmbStjAMNGFEZ58e0MzSxq9LsXrI5TKbDKFqOiQO7v0FmlCpUvmqTEe1lrybT/qyBI22s0lcRt7u0jjjaCVQI0cUJYWn304FYQEBGGWmdb5+OfdAlBf4Qfj0C143KKpsCcK+kQ1dxI1Bd6479vH8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555357; c=relaxed/simple;
	bh=H3rnulMfl3DeILYXkuBtcVo0HBpok14PmwBuns7JPa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5ztxm2GziNMJQ4t7iMialU7gEhbTVzYmnGfZqoZXGz74FCCqjJYGLknJiyFipD0StIZMvScDRCqQCsiMqCuaVtLcHjK+pdawYAjGinOnfGzbMNlI4VIJEGHYBox/BVeacdHbVJsOVGySb3CgSL1cDumNQxStJBHmtZfoeNCLWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXlvLZ8u; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXlvLZ8u"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69e1eb34b20so208198eaf.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780555354; cv=none;
        d=google.com; s=arc-20240605;
        b=iIqpoYcXD7D7Q5T0YgEgEfLEh5CeFQDGaVzOAo6sEm/hjpTxBikhqsNf+MgR5Lzmat
         /3fcpTKvuZMshmDjUijLyREpODlPqVg7Lv3c/vjQL+qxDx0OMEh2TAlWghj40mKIXVj+
         JWL6AY4txZDdbo6x1KQXzafw+M9Plr1RUPbkIVLP/wK9Rh168e//31KijEd+zK6l3uMZ
         Y5N28+hHhyshPONc12GIgMZKu/xCWjMFy3rz5CK2vDJPlY3b5WD7+D766QTeXO8WzFg6
         ps4InXxMkRXTkD8DOzJRa2DMhXWf2pCBtjlGpkYQ8y7O3qcxLOh9MazVzOynHdqY0Qli
         B2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6yfZQB52noCs/9R98yvRH4ThEmgKOXXjOByci/XdGgY=;
        fh=Hh6cRoKR2Y1BOnMqWzMiuxYYyJDxNOoFeUigzrYul8I=;
        b=hwI9uBYHNlWaEvQehxt+j6AXDxeWxZjVo6CY2ClJHTwukfB3t+GbgHBBjdxfrLHm3c
         dxtjJU/3p5I0voNa3FUZQkwWd9o6xjePY2LKNTQ0HhuRdrvEv/KrjQOl5HZ8t9G5rao0
         P1KaRNMoekFuVo5qhvWrTy/6gimORl1a0zWsxUncSl5toKB/AAaR2eik2va346MQG/we
         VMXgPnzdf68bsWbfxRo+0pTZAM4T4h4xjVIJbKCxQ7Vt74LSVn3lSsX+7naC9icqE+NM
         WJlwp8CFkCHmjsFbrPzTgB4ejwFedJqBuy2qXvO2G38qn9BykHTxXSGGNeWqsVLEmjjQ
         oyBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780555354; x=1781160154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yfZQB52noCs/9R98yvRH4ThEmgKOXXjOByci/XdGgY=;
        b=eXlvLZ8ui7sSGYpCke06+8h1Qgai2sl90b2578fC5hDPB8AApIz1f28pGiRVKW8ve2
         Y+hCzyp5fVkaTezhoLzu9+xSSbBSxQwRX2RpabmuTcidmDEV2lSnaL1u4BS0/18IMXuh
         TUA/hMcpt4s3cua0N9JvqsB1I2v5M0+MjIYUPpzp86s0xln1PoDhZlzb6Ob2mFXekmjw
         IrSStPc9FNfd2BZN5h2vVtWf49R/q4L8vREJCnEaqxeAlb/HBB1PI8yUxGt4oxBjCQG4
         em5uwa2/smD+epUa6c+Donp0v3poyN32qDENyY+zOmrtT7FepGGOblH3C5l7FvNVfmjH
         RP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555354; x=1781160154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6yfZQB52noCs/9R98yvRH4ThEmgKOXXjOByci/XdGgY=;
        b=BnPanoNbQx9H6nEBEH0jrtvCBgLD0QI6ODMbOTTROw4LpGoo1mtRJLHtCLS/HmNfH0
         tSwtFSD1y/McIRw0dz5gAYXes7N/xgXHAYyMErfUBPekiHm80tvcc9Y/2DFnoPXQEPqb
         zFTcNiqDOXoO0WmngNYRc+gu1884KrbqG8ubkE0npmxluSAkNtCeZ0vVRBzHTJBUzjVx
         Jeq0V0AwjDLhRLtVZvp3OYWybwcioKN6Iayr88PMUgFepmUK5sc561Se1rLXwMzAym2x
         CDKm3n/G5088lUxDiW5OpNEvvcgPMUqZR1CXoR31AQa54epOZBeUg34k1JLfv8rCnABN
         o42w==
X-Forwarded-Encrypted: i=1; AFNElJ8SA5lDLE3uLvcMHnOUB//f/UFSKzHCdaLw+u8LM/aMOzUO7hoelld2mObD3g6XvwKRNswLpwXA4+UN@vger.kernel.org
X-Gm-Message-State: AOJu0YyLDWuM/dYzvOLo3xriqK7SOr2q/TJu/FvZgDYCZa94Ivb2FX/2
	Vzv93btxSjPpcy2Pk6+Ai66QFR1UFy1pzmE6kEd9ln7YcmPcw+q+TBLBHsYENSQIFGinftGqPQT
	9RcmE3DS/EJKWiNZ6bvG3tx5sHigmPLld4Bv2O4bwbQ==
X-Gm-Gg: Acq92OEzWUvR//URus45miJjoc18a4SX4k5jQGXSXopCDqQXSncg1hYsB2lJ6ZBTzb0
	99XCEfDG8oIVXdmArBO/Ljq4t8VPnk9efFNABvtmObxkTQBYcHvhI+dtLQPbe7fSOBnYVWqe7OK
	HJTEzJ8d8EdGAnHFnakZbTlFvN5xlhgq10rSWt1KD9rLEKsHTWlcGcCE3IJFNvCWI+hx4Q6Fx20
	LInYMIoHbByE00Jja2C1Axdnpkn4G/VFwEFxDvC1K7yMmRO9xOq2JMm4b0EQlYyL6XG7iHAGuEt
	2ASK6FxBgw939KOKQrH9M5s=
X-Received: by 2002:a05:6820:c3cb:20b0:69e:b8:ffe8 with SMTP id
 006d021491bc7-69e480cea9amr3162580eaf.52.1780555354372; Wed, 03 Jun 2026
 23:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com> <20260602232800.768311F00893@smtp.kernel.org>
In-Reply-To: <20260602232800.768311F00893@smtp.kernel.org>
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 4 Jun 2026 14:42:22 +0800
X-Gm-Features: AVHnY4I8rB9-WPj3dLhf7Mcp5Ee0Ym_vIrvBsuBkaWpxQWp0kj0HO6TjI-qUSM0
Message-ID: <CA+Ck9FbKRM0wjJMg1fQpdwmow8cf_zTfir7V6+T=CRxU+vomdg@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and hwprobe
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:28=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> > @@ -154,6 +154,23 @@ static int riscv_ext_zicbop_validate(const struct =
riscv_isa_ext_data *data,
> >       return 0;
> >  }
> >
> > +static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *=
data,
> > +                                  const unsigned long *isa_bitmap)
> > +{
> > +     /*
> > +      * Zic64b mandates 64-byte naturally aligned cache blocks; cross-=
check the
> > +      * cbom/cbop/cboz block-size device-tree properties to avoid inco=
nsistency.
> > +      */
> > +     if (riscv_cbom_block_size !=3D 64 ||
> > +         riscv_cbop_block_size !=3D 64 ||
> > +         riscv_cboz_block_size !=3D 64) {
>
> [Severity: Medium]
> Will this check erroneously disable Zic64b if a platform does not impleme=
nt
> all three CBO extensions?

Zic64b is mandatory in RVA22/RVA23, which also mandate Zicbom,
Zicbop and Zicboz, so all three block sizes must be present on any Zic64b
platform.

And architecturally, all the block sizes are one quantity: under Zic64b
that value is 64, so the three must all read 64.

Anything else is a misconfigured DT, and the kernel should not trust
the zic64b it claims.

BR,
Guodong

>
> If a hardware platform implements Zic64b but omits an optional extension
> like Zicbop, the riscv,cbop-block-size property might be absent from the
> device tree, leaving riscv_cbop_block_size initialized at 0.
>
> This unconditional check evaluates 0 !=3D 64 as true, which would spuriou=
sly
> trigger this error path and disable the valid Zic64b extension.
>
> Should this validation only enforce the 64-byte size if the corresponding
> block size variable is non-zero, indicating the extension is actually pre=
sent?
>
> > +             pr_err("Zic64b detected in ISA string, disabling as the c=
ache block size is not 64 bytes\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-rva23u64=
-hwprobe-v2-v3-0-5529a7b28384@gmail.com?part=3D8
