Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5144B387363
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 18:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757329; cv=pass; b=e2T3nVat9NKi5/pgbAo3wVGvcZDrBTflg81T6/vVk0g7U880ZLnuJxr11hEXj7YxsBEPDCG6x2gWPqB/C+kNGJSsHftttJr30YQ9IhFCJX2gKjFNhSz2b/P5+TBfwPj3kAzphHdSioWKfVks7su2YRfhpfo9Gse/Y9IBfTk9xWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757329; c=relaxed/simple;
	bh=rTCC+Q2QI/RNZdcYErq5nB4Tg1Xxg7Ybj1fhnVetaOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjFhtC+4th66kq3vVIbTZqra4Ou4YZJzPskaJXxJp8xquuzbrRQGG7x0o15Mq8GhBcEm7L7FVg5yUpdp2iYhxQyPVxKPqEmyyvkFsZ6WShRfqLbS1vkq7pycbQtfmmBopaGy4SxSy28IZI7IRmCeKUEYfyuYqLSJtM6ieSNtoNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZVlrTnH; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZVlrTnH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so2815624f8f.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782757321; cv=none;
        d=google.com; s=arc-20260327;
        b=IHVJgM8gZoC7ZZlfSfBQIvBBYUn8PbW0rytllVN+WYWg0d2mCsbmprpYOMivjtBuNl
         D6EMttZEyOoz7pXLaO2ePoHzsQAujT8wmmwe0d4EfFReLev+MBvqRpmO9sWrV6KYKpRk
         6zVqAu/QwiDyrTdJ9XpnzBg4K9ae96pZx5RRtufyrsj51osFFhBfjlxNos4yShb/VrSO
         pplOQx/ItpFEh5By4dYIuli/LhT9KkyYPbKKrvquVOU8t6KD3acR8atCeOtUrzb23oNC
         I5TkCLmCd37ObyfkxawJaCwUGXXN7TWn/wtHsjIbuj8/oFl4pB/T8bCkZUm4n+nfDqF5
         bKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5NfKOjNU6srylE75C2adpej95bKtXYvziT0LYJSnVds=;
        fh=4TZyWmSV5OyW38t8cGYZ63qT4gRZLrHJNYSpkJXkIJc=;
        b=X3KFTLitO/ney8DTtghiWe2Fh/ywZ1YUA1b3t/g+5aptDB9h8oWEJAyXNatco7me2p
         0HHuQuQwFBywQ8utpPRJ21NhmWFIyotDUYVFqZErVvGzyUqNDcdiWnyV6rQ9pFTUMQlE
         u7AId+2OQb+aOTbkyiju7CYywAxEYCdrFoM3+SDRm4JlC/a5xB2MfaMQbeTkOIVSvX8h
         qEGtu+K3ISnkw9yZ1hXQwS9TSMQyk5k8wkL9YbTre6iC5cuh8AdxRU478FrV6rkmU2zE
         zfpbmGc2cdXJLYpy4YVNLiykL2PEaBocbI9leR6P6TRWj/I7Tn8sIMMunmWyLFZc9dpl
         RpIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757321; x=1783362121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5NfKOjNU6srylE75C2adpej95bKtXYvziT0LYJSnVds=;
        b=lZVlrTnHAIE6MHhnr76cv5+Q9ab3WEF37l1jXtbCTR0zXFkwPQGjAcZs9ooF4TN2HA
         0zv3vLRXJ/Z4ZopSsJuTeilRNAlXpdGx3QyUDpnwM2wLstJ3OzCQas6HEMKgpo0BeKYJ
         qj7xeSFA26oJJb7ArIsLKQ8MBfTpLrvdPRsvqW2zDgjdJLFbP4TP+j14v/s7S+CqLrcc
         8O0IDAPaVGDl2vZiXU9ZFXkSR/oXnO0+fTzcGsoxpCfMkTGKGgQauqdKcH0ChPVIRWEr
         tD9o1Y7MPxLmN+a05ofn6At1meODNOzZbpa3hAkbYofXv4rW3ruTPeITd8d1GbJVn0wM
         sevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757321; x=1783362121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NfKOjNU6srylE75C2adpej95bKtXYvziT0LYJSnVds=;
        b=OG6N/kG7S8wTUpIGlWM6T8Vh1S3PE4p5dJW9Z602CRZYd7F2dGIPjTpsB7UsF9apo5
         1tOPzmEyT2A3dU4zf3EpF9Gbqq1TICTi29ZJQe8M3cCj4f1BbkAc8qxr3AtJ5KAE42uj
         4PWSsZiH8aBqNI/vZw153MirpRrD5qhCFoXoOdzxWYB/HShwPFeWSnTF11QfXgLvE2SC
         1wG1B53/GipnPJx0zZ1Djm5pSLQUydDBmDZrEPz2nqYgerGHzWqe2P+0eycxGosss07L
         yZhk2m8TMAtVnZKT5Qe4o25W9UcJTwk07pHf339CyNvt4XkfhTn6QaI7rNE5Cxgjiksm
         2uVg==
X-Forwarded-Encrypted: i=1; AHgh+RpSE1zuSNYZDIVjs2YOk03G2MKrhRclgD4AGjrJejJ1JoWmJTiN2O7RyN4pMdQeNlDik3lg8I6bs2sF@vger.kernel.org
X-Gm-Message-State: AOJu0YxqIUIAm4rOmX5TJ+vBWcysORoDok0r/FoXOrgIi4Mj0P+hs8oZ
	5cBbzm8ZRDE2dXeDBOMkvcd/jbfqsVMBTTlTS1eQpStYm+M+Ku0LcFYbkOmODxJJvFv7ERd/dqd
	Dkj63XxaucjshVncW5308CWoWnHB7LbY=
X-Gm-Gg: AfdE7cnx71orpYTupZwgmj11ZhcZvFF1LUj7ILRoTzmXIcld1gIKybvw9nwA7X6ELuw
	d6kJ4LaAuvtLaPzKfa9ARJdD2Wa1Y2jSBrYZIQvUQmq2Z5pTFN6l5jRldJctUdXHQxhxwWZd+yu
	s6iSACtBednfDzo8GwA4eBNdT2u5pQrTt5TYnQfkqdKtESqZmVY/B5malZFmoCxrlsVQkCHi7np
	w54AQQ/iJkrSPdhw6xx/KARUg+nRra4IW9e/iml0xwswG6Ca7EBg1X7NiFIbc2fB27tlqvDBX+U
	qIsixEX73m5FUlQ0C1FC4Ic+SoUsNQ==
X-Received: by 2002:a05:6000:460d:b0:473:6e8d:7f3 with SMTP id
 ffacd0b85a97d-475506e96a8mr558778f8f.1.1782757321163; Mon, 29 Jun 2026
 11:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com> <20260611-rva23u64-hwprobe-v2-v4-6-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-6-3f01a2449488@gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 29 Jun 2026 14:21:24 -0400
X-Gm-Features: AVVi8CeVJe5kDV9ivsXrbK-CzxJfU-Om1AQNkB7-XLVhzZDb1etpOuW05CkKE0c
Message-ID: <CAJFTR8RK2sR88ePKREmZw-9FRkWEpV_FH6s7M9TegaObqU1cwA@mail.gmail.com>
Subject: Re: [PATCH v4 06/16] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs
 to cpufeature and hwprobe
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 4:14=E2=80=AFPM Guodong Xu <docular.xu@gmail.com> w=
rote:
>
> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
>
> Add Ziccamoa, Ziccif, and Za64rs to riscv_isa_ext[] so they can be
> parsed from devicetree/ACPI ISA strings. Ziccrse is already present
> in cpufeature; this patch only adds its hwprobe exposure.
>
> Expose all four extensions via hwprobe through new bits in
> RISCV_HWPROBE_KEY_IMA_EXT_1 (RISCV_HWPROBE_EXT_ZICCAMOA, _ZICCIF,
> _ZICCRSE, _ZA64RS), so userspace can probe each of these
> RVA23U64-mandatory extensions individually.
>
> Rationale for the validation dependencies added for Ziccamoa and Za64rs:
>
> 1) Ziccamoa depends on Zaamo.  The RVA23 profile prose was updated
> post-ratification to spell out the Zaamo reference: commit
> 2b218613752d in riscv/riscv-profiles ("Improve description of
> Ziccamoa (#224)") reworded the rva23-profile.adoc (and other profiles
> that include Ziccamoa) text from "must support all atomics in A" to
> "must support all atomics in the Zaamo extension" [1].
>
> 2) Za64rs depends on Zalrsc. The unprivileged ISA manual src/zars.adoc,
> integrated in commit ebe06adc22cd ("Integrate profiles as Volume III
> (#2771)"), defines Za64rs as: "The Za64rs extension requires that the
> reservation sets used by the instructions in the Zalrsc extension be
> contiguous, naturally aligned, and at most 64 bytes in size" [2].
>
> Link: https://github.com/riscv/riscv-profiles/commit/2b218613752d63287286=
b5ae801b820cbd8cc10c [1]
> Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/unpriv/zars=
.adoc [2]
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Reviewed-by: Jesse Taube <jtaubepe@redhat.com>

> ---
> v4: No change.
> v3: Indent the added hwprobe.rst entries to match the normalized style; n=
o other change.
> v2:
> - Rebased to v7.1-rc2.
> - Reworded subject and expanded commit message.
> - Validation added for Ziccamoa depending on Zaamo and Za64rs depending
>   on Zalrsc.
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 16 ++++++++++++++++
>  arch/riscv/include/asm/hwcap.h        |  3 +++
>  arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
>  arch/riscv/kernel/cpufeature.c        | 21 +++++++++++++++++++++
>  arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
>  5 files changed, 48 insertions(+)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 49d9fb68632d0..893e1a1215d23 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -405,3 +405,19 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is suppo=
rted,
>      as defined in the RISC-V Profiles specification starting from commit
>      b1d80660 ("Updated to ratified state.")
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCAMOA`: The Ziccamoa extension is sup=
ported,
> +    as defined in the RISC-V Profiles specification starting from commit
> +    b1d80660 ("Updated to ratified state.")
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCIF`: The Ziccif extension is support=
ed,
> +    as defined in the RISC-V Profiles specification starting from commit
> +    b1d80660 ("Updated to ratified state.")
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCRSE`: The Ziccrse extension is suppo=
rted,
> +    as defined in the RISC-V Profiles specification starting from commit
> +    b1d80660 ("Updated to ratified state.")
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is support=
ed,
> +    as defined in the RISC-V Profiles specification starting from commit
> +    b1d80660 ("Updated to ratified state.")
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index e8f4a7dd96a93..0acb7a01ecc0f 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -113,6 +113,9 @@
>  #define RISCV_ISA_EXT_ZICFILP          104
>  #define RISCV_ISA_EXT_ZICFISS          105
>  #define RISCV_ISA_EXT_ZICCLSM          106
> +#define RISCV_ISA_EXT_ZICCAMOA         107
> +#define RISCV_ISA_EXT_ZICCIF           108
> +#define RISCV_ISA_EXT_ZA64RS           109
>
>  #define RISCV_ISA_EXT_XLINUXENVCFG     127
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 6819df159c51e..58d1e86e47ae7 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -117,6 +117,10 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_IMA_EXT_1            16
>  #define                RISCV_HWPROBE_EXT_ZICFISS       (1ULL << 0)
>  #define                RISCV_HWPROBE_EXT_ZICCLSM       (1ULL << 1)
> +#define                RISCV_HWPROBE_EXT_ZICCAMOA      (1ULL << 2)
> +#define                RISCV_HWPROBE_EXT_ZICCIF        (1ULL << 3)
> +#define                RISCV_HWPROBE_EXT_ZICCRSE       (1ULL << 4)
> +#define                RISCV_HWPROBE_EXT_ZA64RS        (1ULL << 5)
>
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 1fb595581adcf..b9538e69fa1b3 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -90,6 +90,24 @@ static int riscv_ext_f_depends(const struct riscv_isa_=
ext_data *data,
>         return -EPROBE_DEFER;
>  }
>
> +static int riscv_ext_zaamo_depends(const struct riscv_isa_ext_data *data=
,
> +                                  const unsigned long *isa_bitmap)
> +{
> +       if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZAA=
MO))
> +               return 0;
> +
> +       return -EPROBE_DEFER;
> +}
> +
> +static int riscv_ext_zalrsc_depends(const struct riscv_isa_ext_data *dat=
a,
> +                                   const unsigned long *isa_bitmap)
> +{
> +       if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZAL=
RSC))
> +               return 0;
> +
> +       return -EPROBE_DEFER;
> +}
> +
>  static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *da=
ta,
>                                      const unsigned long *isa_bitmap)
>  {
> @@ -502,6 +520,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, r=
iscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
>         __RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv=
_ext_zicbop_validate),
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, r=
iscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
> +       __RISCV_ISA_EXT_DATA_VALIDATE(ziccamoa, RISCV_ISA_EXT_ZICCAMOA, r=
iscv_ext_zaamo_depends),
> +       __RISCV_ISA_EXT_DATA(ziccif, RISCV_ISA_EXT_ZICCIF),
>         __RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
>         __RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP,=
 riscv_xlinuxenvcfg_exts,
> @@ -516,6 +536,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>         __RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>         __RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
> +       __RISCV_ISA_EXT_DATA_VALIDATE(za64rs, RISCV_ISA_EXT_ZA64RS, riscv=
_ext_zalrsc_depends),
>         __RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
>         __RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
>         __RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 9cf62266f1890..b15ac9adf7920 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -206,6 +206,10 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *p=
air,
>                  */
>                 EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
>                 EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
> +               EXT_KEY(isainfo->isa, ZICCAMOA, pair->value, missing);
> +               EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
> +               EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
> +               EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
>         }
>
>         /* Now turn off reporting features if any CPU is missing it. */
>
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
