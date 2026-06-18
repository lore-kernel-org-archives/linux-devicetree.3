Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C70E146A66
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781763378; cv=pass; b=NofRYow/VCMvSOPXcFsQgTvLcvIe5SnqPKwLNgIcCej79Ews8mpJef/RB7B9FNsWO8JqCkK6p9kl+cApOE1++5Sou2LmSZVfrnRKA8hKtWNS/yWxb9bvgVJbXeHOWNKwVw11or+UetmQLsvCh93Zs1//BpYFAEfpDJ1Ai65QE2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781763378; c=relaxed/simple;
	bh=6Du4FMFP7UPcAJzlB4al9sH/b35QZkMHKVDjgrhrnV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/D4kPPtak2hLqSym9IIOTNS/dZsNrF78ymTRfXjRMb5bBE8RMd/41Vzc8iUR7IBoF62iRnS9e+Dne/Y39IJnaMkhCt/y0d6NjMy+jcTqI8STE0qxhkFlsp5wtyoWCZa9W8rgF0o48qNOI7CQ5hz5HELxMoEcWC9XO0djyr6WB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=G4hiwl0t; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="G4hiwl0t"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-69e4adf9ea5so254652eaf.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 23:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781763375; cv=none;
        d=google.com; s=arc-20240605;
        b=KCq09ZahjpRQcq+MtFDYnCQeRyMquQAHoZBHsZWIxbzBPUlTdvJzaDRaabGA289e0C
         b6djpvClYopqFIb5qr2ClzBTIaX3x6sTVD5tqlk6SGeB3uBExyN6QRa3tBqTsD0F0Uh6
         xVBhBMLpQIuflowg7XXqa8xIdfYCK8GadKIcC6NhE3+FGcDysNPhjp12wajY1r4LlUte
         rvvQhM8NMteqs8zJuF+7eaRIikrVzr8HUQpgXer3ejGWGg2FPwcWVygxR0xVch2a6Ifd
         QGgX59n8qHEP2RvKVteBy7hLbERSUPhFoU+FwAkCVL8DUkeNpc14KCSAMH/PqavxAl0S
         saVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XvwDdUwqNB/mJRpzgcLfrzEdZHAgOs9CmXdopX1fav0=;
        fh=ZLsACl1ONHQ/na97IdOoJrUsETLUYnFdAfzU8qvDIYk=;
        b=JlQ/x4pKGUAIXIa4Tx4ldedXxKoXs7rLPAYcxe7pHPY5pPQ9IB3rEMmz3gsG5qCN05
         vytTbEuxv0QE1LwfXi1B2G+Qostlu88GMskH8FOpdmYd5wIcLrC9W9BF14vG9NGmUW0h
         TtrorAf2pzIJ/Zoyeu9XxQKOYOq1Gq/REe/tH6moZ0Mfs81NUK6UApMQB3cEW5mLPmcr
         mOPLf8kwYONrVWLf9iYHphrJ8un6MgGQqgGP9AmAoLWqkswEftCP5GGc2CqQspzhEpe9
         JIkgAW8Nr98cbnGkgrjhB2JQG4I2cFz+3GQ51P+edi/V7Jwpu7gObmHcwW2Y/0o4KDsw
         6SjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781763375; x=1782368175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvwDdUwqNB/mJRpzgcLfrzEdZHAgOs9CmXdopX1fav0=;
        b=G4hiwl0tkQde6/q0h/GSJqnBPnze7dsOLtQotRbPFYiLchnhtgOVHe+Tz135jXhEij
         gI8gmKCIT6CSWye6LJ3vY37Tki0ad8XM5yWTdK92Jq6S8JKIt1D0AF51ieBgLTOPJCjf
         efzIDwzWyVeeGg6OsRsWSWfjo9TlCHQA928MJKsdggtuuXUyGh23287yV3tP66ODOJSe
         Dr+XBpSNSMQODFF3XoRBJjC6/opvvx1BG0mpucWe4YALt7kO39F+VTJ+pwaeojErSKVn
         LQPkSG4/fmXgeqmKYqXJuYoy6ZlaweVfSSn/9xIwXDSrz5ATVqCse2uShp/idSvmS1w8
         m6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781763375; x=1782368175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XvwDdUwqNB/mJRpzgcLfrzEdZHAgOs9CmXdopX1fav0=;
        b=FpAKVT4FIGMBKyNcNhkzWFCQpagg4qjSmf60Rwb6LK77iZaZ5x26ap26xKVpVkNHYQ
         uI8JINcEEsYwtl71dlSK9aYOqhiHYfmUMW/IIF7QYder5hQOK4Zgxk3GR1dXnCoo1EIf
         7WAeRRNA9Q5TghwyZYtQZD7tbAGPJWrWhNy8R53wm0DhLcFN+ldeFLvfoLZNP42H32dS
         t1sp+eaiGj2ZnmpqmCjcFdyJfGF7mzxGWm+i2Pe7t+PufNvW2MJjlnEkByhd1Z+SOu37
         qPVwQW42eNVBl02JMOBZa8aTpX1tBb+cwSkhNJnBj2XzYbLzC9wiRfVRgY+hUXBVaq/8
         oZhw==
X-Forwarded-Encrypted: i=1; AFNElJ/bpz8SVE+yy8Zx6r/BeuqkyBHjAtrYSI5u2pwJDaQ7luEyjNZYHs7iLL1q3QI6peMlxx3jo8z7E4L/@vger.kernel.org
X-Gm-Message-State: AOJu0YyOAhOtKmVxZfj179krKJRVg0E4dw3D61WwtRtbWjikqu3hhLr/
	NhAQ8E8j6BjEJnUrXIrV2jpR/ZGhihkDjedLzTHXGpjUi8XFhV4Kp3hhyb0WRmo+05Uz3eVeBZ1
	CDl0DkkI2CQPIvzmRITh64MjGuKaxLG2XB8jcm+OmAwFQOReLuRhj1lzUjw==
X-Gm-Gg: Acq92OGhnflhQb/sYUWZBw/zZNAWLc7TJ1O+njwHW0s384mz8zO8wKptMQw/8HDTPl+
	ehrzL0WnnVaN5O6cTD1lNoeZLas03QCWDgsWb2ZG2AeBg6NZuSmd+2iu9mU+uI8HH+f2KGqjVyd
	zzyluFOoDK1jRJehWVL6WjHLChQABMfA/jfJQtwIA+devNnLXsZphR3w7jZgEFTq0ctJMj0ZcPG
	S2u5XAm1ZuxZPFfU1FW8s+s2mvOx+XdPPL2IcmL35EtsZTIHtHS62TrAl62kHTsus+X/+PfDl2j
	2eI=
X-Received: by 2002:a05:6820:80c8:b0:69e:39c9:c6d6 with SMTP id
 006d021491bc7-6a0b5e3cc18mr5260511eaf.10.1781763374599; Wed, 17 Jun 2026
 23:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609130021.99899-3-cuiyunhui@bytedance.com> <20260609131621.3541C1F00898@smtp.kernel.org>
In-Reply-To: <20260609131621.3541C1F00898@smtp.kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 18 Jun 2026 14:16:03 +0800
X-Gm-Features: AVVi8CfbhIfrfyOhP91UzVJ7Wt3CfSeCLsAl44UT7jOTGHzHjqut50HYYR5OKX8
Message-ID: <CAEEQ3wnt9wrVvSvdcuyA3wME7oCyRmNrKOKi=LjwKWKzYxWhNg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 2/3] riscv: track effective hardware PTE
 A/D updating
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,


On Tue, Jun 9, 2026 at 9:16=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Incorrect global ISA extension check prevents FWFT enablement on=
 asymmetric SVADE/SVADU systems.
> --
>
> commit f3d7c0060d5bf449bef26605d30b6a4b56780451
> Author: Yunhui Cui <cuiyunhui@bytedance.com>
> Subject: riscv: track effective hardware PTE A/D updating
>
> This commit separates the tracking of hardware PTE A/D updating from SVAD=
U
> discovery. It enables Firmware Features (FWFT) on all online harts before
> globally advertising the feature, and requires secondary harts to enable =
it
> before they are marked online.
>
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> [ ... ]
> > @@ -287,15 +291,88 @@ static int riscv_ext_zvfbfwma_validate(const stru=
ct riscv_isa_ext_data *data,
> >  static int __init riscv_hw_pte_ad_updating_init(void)
> >  {
> >       bool has_svade, has_svadu;
> >       int ret;
> >
> >       has_svade =3D riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
> >       has_svadu =3D riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> >
> >       if (!has_svadu)
> >               return 0;
> >
> >       if (has_svade) {
> >               riscv_hw_pte_ad_updating_requires_fwft =3D true;
> >               ret =3D riscv_set_online_hw_pte_ad_updating(true);
>
> [Severity: High]
> Since riscv_has_extension_unlikely checks the global intersection of
> extensions, will has_svade evaluate to false on an asymmetric system wher=
e
> some CPUs support both SVADE and SVADU, but others only support SVADU?

 Thanks, I'll address this in v4.


>
> If has_svade evaluates to false, FWFT enablement is skipped here, but
> riscv_set_hw_pte_ad_updating is unconditionally called at the end of this
> function. Could this cause the kernel to assume hardware A/D tracking is
> active globally, even though CPUs with both extensions would remain in th=
eir
> default software-managed SVADE mode?
>
> If the kernel incorrectly assumes hardware A/D tracking is active, would =
this
> cause arch_has_hw_pte_young to return true and erroneously expose the SVA=
DU
> extension to KVM guests? It seems like this could lead to unexpected VS-s=
tage
> page faults and guest crashes if the underlying host CPU traps on missing=
 A/D
> bits while the guest OS expects hardware updates.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609130021.99=
899-1-cuiyunhui@bytedance.com?part=3D2

Thanks,
Yunhui
