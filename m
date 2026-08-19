Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8A36C0CD
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 20:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787170234; cv=pass; b=UQPEeeBzSWdDSmebEHPOPrqtNl3zLuzzx/ZaGFZszl0IA7V1EBIV5kDPUj1Alr4a6dwz8p+T4TZFdiDU+EG4FuzmsCY0jJ0hwVi6snrHr/kLrnIfVdsZlO2Ufsq24kJqMT+CUPKDw0xYgyLDP4gbFyfr3yCszOnAbCyL3+Qrujg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787170234; c=relaxed/simple;
	bh=m/I5/nhUCkBaUTFPEeaS3Aw1BSBZvrmXMka6Jo2bwl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDs9s3KGvXLMTDdKwcFRtEJzAoFm6CVhV+gVrHUG4ihg+b2Yp6oHGUUN+K+y6A3giJ5xBvBnAMupYCURogs7cq++TB+ldXHfoTxyoyyvjbEsXGLopwD05RfSkoIfP4zQVqWuN4WERh8fJsMnqyIGbIX64M7SeI+dalzE3LhH+CE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hf20IIcM; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hf20IIcM"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4b28d7c729fso820749b6e.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787170232; cv=none;
        d=google.com; s=arc-20260327;
        b=mqXzf6jjWxQTc+YqvdeKLoMjukSourZqRgs9dtv2JJkoZVIaLpRhZprB1YfFIea/iG
         BnqPAhFePqNjyv1T5QPYXS42BAMVcUGeK+5kemkTQCM+tOoO6KXymy8OJ+MGB0465ecR
         eHJiaEXqC5JjO33L0vZ4Ee7FPqIwKG8M6a4WenE3IKlzM66O5sB+45hcY0qXpZGYl2FK
         AaUxratl6U1t3XkO6siOjdPF42wNNYD4wpJvLd9Y5rA8vAhLQzo4WCLIy5fNev1wv9Wh
         P1lpUapwrKY0xc1hzeV08PVWDjYvX0Dfx+fACj+XlbhTnjUROzGCIr1tXYrmEpY1yGWx
         kcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/GaQztkFIctJG6rZXOiIdCznGCsGLT2qU095hUM3D4=;
        fh=XeReOcEL6dG+ff5o2pjdmV1QH+s75jIuc8r6Mm1GOrc=;
        b=OvoSWelSlI7XJ3hHUwkU/MYqjanyaal3YBGYidDxZvG2luR/KGcVG5ToFdGQhzqvHK
         s+L+HDo+FCj/pyinnkr6jYeBVN9OTkFU5l07V5b2PNVH3S1SvTPCCdj04TYRBwiI/KMz
         8xxPm19fZWIJ7L0YMc1XQhSIcGQUQfoHzIwdElC+5bHY9uxLf1Nq0emflpUjCCOZdOva
         772odhHQT5OJcAq0P6f83eLowI2jOD6lDH+oxrEJ9nSIS83F41GTYf3Xvv7kpolCEJfu
         y4BPsSO9JUH0auJinmXiNZ1BNVKY3v0MqHb/Zvg1K6MpwiBcfh407GINqsXEB8SJZX8T
         yhgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787170232; x=1787775032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/GaQztkFIctJG6rZXOiIdCznGCsGLT2qU095hUM3D4=;
        b=hf20IIcM3MhwzqtjUGOHorb1OESb1MGDw07Ftcqby3WC6YvxokAyDhxLAkv04PPm++
         Y5u38Lp3ez8zwdM2Khcr/7gHgYntUNkuW8E4lwyEfhdVPAuFl7xA6ncgicr9OtD3Cvbo
         jZh0iHR3pUq4WUuAqPkCZL3qjmv51eFIX+wjZuTKUkHn34lZFnriZdybmjJgraXPaQMA
         3GmHGmF2BNXNjwNtCVSYzTURyOejxCt1xip23ZxL2TRqF6nbZ9xeTQyYc3WruHt5iuOB
         N5Ojv5KtzKnkfjZVgb4BiZa8n5e+Pgbhe6srFtyUNS7T4AZguyep2LJZWFTC9sMlpAzF
         lSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787170232; x=1787775032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/GaQztkFIctJG6rZXOiIdCznGCsGLT2qU095hUM3D4=;
        b=H7+Eos1zgMxrGkiPAqduxOd0mEMWtbeBlLtNMLsUPSyma9KlB7xQ0mBA2IkSwRnrrj
         Vgu7PaLB3hWIZ66Byj7hd4AI8NH4WgUr1/YW2tySRLDYIopsdV9AIFNeJUCNwTQQwgcW
         cUoruwVsSt+kyfRj+02Twc2wTlqJv3jd5HtVW/LwG1Etusbs2mJnp7vkPgdz3VbRZdtH
         bmlDvlFH3bHYaD1W595sgLE8hq7tdurikN7eEs280hidOkkOqUH+YCI6k0KLiGxoNtgC
         U0ztv1XdkCtJ4urWBjhyhmNedSbcgBu/m9itWPNSbse+H9QnD4/0tSGCnfHzn+lv1LDz
         XiQg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2iBvaNOknXvMgqUN5QlHu0ArkcbBD0jwJ1wG1MK7T6NWd7MHGC9VWgfsZekBS6Tg5u/MC5CagC5BX@vger.kernel.org
X-Gm-Message-State: AOJu0YwfHTgVrOoFPjNYHHuRsrCCmgunS9iOTNMK9OUr+K7Rt0/0/jWT
	YkEwd9+6FIFZv6xlVkekg+oy8pMb77vQUWDNg42h02vtuhvKMijsyH4FH2yT9lEyWrBAdmtaW5o
	Ke+0NV26d4LAEpUOnBbQYV4Nna2puKKE=
X-Gm-Gg: AR+sD13ofYoGM4EaRV6vtl3hS9AMJt8dMGakw0sCujYIj0h/PgPeIZLmpEHyNf6jV+G
	8W3/E+WlM7Ayf9pf9e7OJo7HsJKJFFUhI2TeOz2ukg2GGXt/oyxP/pnqanuU3Lv2JhlQb4IhThU
	DQBNGF6QCF4LHYOhwMoAJSb4gCQYTv5jnGvvdouJl4uZFUkP1+fsIG/dFKTyE6Rz5Eii2ABmpf/
	XeBPwn+EUHEAwd54vD25kZpyw+1rkE3vCQF7PEAOl2Br3CxbvVOXwlEy0hnIuf2HBz9USRybGGB
	pHwhm4G1cu5vY+KCITJQQA3NOUyunrmCn2ZFFsppFHgr8GdbOWTJpf3/i3O6Eveo49nyQFFqd8V
	vJitnkUKJSnD+tC/9qg==
X-Received: by 2002:a05:6808:251a:b0:4b2:8e51:91fb with SMTP id
 5614622812f47-4b2bcaec6abmr6789732b6e.16.1787170232171; Wed, 19 Aug 2026
 13:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816193905.218112-3-mmyangfl@gmail.com> <20260818171025.4020314-1-kuba@kernel.org>
In-Reply-To: <20260818171025.4020314-1-kuba@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Thu, 20 Aug 2026 04:09:54 +0800
X-Gm-Features: AcwNN1U5tqRWcuy6wmgE0xF4MddBd_MlBT3uHidirLc2Q0vd6RKoThrl_IJmR2g
Message-ID: <CAAXyoMMUWGjokvaDAkgbDM0=6SZQ_B0Vos-wNUF+dun6W_7qAw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 2/4] net: dsa: motorcomm: Split SMI module
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 1:10=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> > diff --git a/drivers/net/dsa/motorcomm/smi.c b/drivers/net/dsa/motorcom=
m/smi.c
> > new file mode 100644
> > index 0000000000000..164c25ef494a1
> > --- /dev/null
> > +++ b/drivers/net/dsa/motorcomm/smi.c
> > @@ -0,0 +1,157 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2026 David Yang
> > + */
> > +
> > +#include <linux/iopoll.h>
> > +
> > +#include "chip.h"
> > +#include "smi.h"
> > +
> > +#define YT921X_POLL_SLEEP_US 10000
> > +#define YT921X_POLL_TIMEOUT_US       100000
> > +
> > +int yt921x_reg_read(struct yt921x_priv *priv, u32 reg, u32 *valp)
> > +{
> > +     WARN_ON(!mutex_is_locked(&priv->reg_lock));
> > +
> > +     return priv->reg_ops->read(priv->reg_ctx, reg, valp);
> > +}
> > +
> > +int yt921x_reg_write(struct yt921x_priv *priv, u32 reg, u32 val)
> > +{
> > +     WARN_ON(!mutex_is_locked(&priv->reg_lock));
> > +
> > +     return priv->reg_ops->write(priv->reg_ctx, reg, val);
> > +}
>
> [Severity: Low]
> This is a pre-existing issue and not introduced by this patch, since thes=
e
> two lines are moved verbatim out of chip.c.
>
> Now that yt921x_reg_read() and yt921x_reg_write() are a cross-file (and p=
er
> the commit message cross-module) API, would lockdep_assert_held() be the
> better assertion here?
>
> mutex_is_locked(&priv->reg_lock) only reports that some task owns the mut=
ex,
> not that the current one does, so a new caller that forgets to take
> priv->reg_lock passes the check whenever another thread happens to hold i=
t.
>
> Would WARN_ON_ONCE() also be preferable to WARN_ON() on a path that runs =
for
> every single register access?

It would be better to address it in another commit. Also it's the AI
who suggests not to include such changes.

>
> > +int
> > +yt921x_regs_update_bits(struct yt921x_priv *priv, u32 reg, const u32 *=
masks,
> > +                     const u32 *vals, unsigned int num_regs)
> > +{
> > +     bool changed =3D false;
> > +     u32 vs[4];
> > +     int res;
> > +
> > +     if (WARN_ON_ONCE(num_regs > ARRAY_SIZE(vs)))
> > +             return -EINVAL;
>
> [Severity: Low]
> The chip.c versions guarded the vs[4] stack buffer at compile time:
>
>         BUILD_BUG_ON(num_regs > ARRAY_SIZE(vs));
>
> and that becomes a runtime warning here and in yt921x_regs_clear_bits().
> Is the reason that num_regs is no longer a constant expression inside the
> callee once the function has external linkage?
>
> No overflow looks reachable today: the only callers go through the
> yt921x_reg64_*()/yt921x_reg96_*() wrappers in smi.h with a literal 2 or 3=
.
>
> Would it be worth naming this conversion in the commit message instead of
> just "Minor changes are applied to fix build errors"?  The lengths of the
> caller supplied masks[] and vals[] arrays also remain unchecked, which is
> worth a word since the helpers are now callable from other files.

It just isn't worth it to do fancy checks to these simple helpers with
tons of macro hacks.

> [ ... ]
>
> > diff --git a/drivers/net/dsa/motorcomm/smi.h b/drivers/net/dsa/motorcom=
m/smi.h
> > new file mode 100644
> > index 0000000000000..2995e91f3b3d1
> > --- /dev/null
> > +++ b/drivers/net/dsa/motorcomm/smi.h
> > @@ -0,0 +1,92 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Copyright (c) 2026 David Yang
> > + */
> > +
> > +#ifndef _YT_SMI_H
> > +#define _YT_SMI_H
>
> [Severity: Low]
> This isn't a bug, but the guard name here is _YT_SMI_H while the sibling
> private header in the same directory uses __YT921X_H.  Was the difference
> intended?

We are going to use the _YT prefix for guard macros instead.

>
> > +static inline void update_ctrls_unaligned(u32 *lo, u32 *hi, u64 mask, =
u64 val)
> > +{
> > +     *lo &=3D ~lower_32_bits(mask);
> > +     *hi &=3D ~upper_32_bits(mask);
> > +     *lo |=3D lower_32_bits(val);
> > +     *hi |=3D upper_32_bits(val);
> > +}
>
> [Severity: Low]
> Related to the above, and also not a bug: this helper is the only symbol =
in
> the header without the yt921x_ prefix that everything else uses, and it i=
s
> now visible to every file that includes smi.h.
>
> Its only users are the two METER control word calls in chip.c:
>
>         update_ctrls_unaligned(&ctrls[0], &ctrls[1],
>                                YT921X_METER_CTRLab_EBS_M, ...);
>
> so could it stay a file local static in chip.c, or get a yt921x_ prefix i=
f
> it really needs to move?

Irrelevant to this commit.
