Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103FE344D9B
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781272302; cv=pass; b=jVgI2U/T78vbg7DWONDn31is7+qCRSmHwL6d7yPDIq21hUM4NMsZ4x2ZHRRutsca+/KH7ju6pLlfj2H8CjMSaY9ztXABsKj8myb+UMWGvalgTfajpHPXrok+aqVrtbqtkKeUbcBUfp6fTrhyOGjEOwmZT83WBhc+TDIAreKvVy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781272302; c=relaxed/simple;
	bh=tT4YqoZd40mTDfR7B+ZovVmHGlTP3GckEXJWWqPnoqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZ2qENVxrsHwCThA+7Yr/TJvQWYtaXiVwPTJYFD3evw0FYfFr5NYGsnJb1aq7FHgHzp2HPYwgYbyHOgxOWlWjVXvAOrBrkQurp4ocuxD7Eg7btbt9bkl+bg2kcVMbvcJ939KCI2+1NpWZ32TVxcPZ5nsa+dKBMEWqBDPPmqR8lA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OynQW16g; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ibIu2lwG; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OynQW16g";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ibIu2lwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781272300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iy/v7kxpOlqBCTDcC4jlmM2w9KphND71Hvl/We9DfQ4=;
	b=OynQW16gkfYLqs+w3Vswg0Xt8Eoc7NhdUHEqeE6VkZ7HJt2NCXTKoAvnLpRBGp39Eeuz5b
	7tGDlNMUqMYTUlMwiExsgcXwQK9lNNojaldLy+gOXxoMtpA51riBQWy5zXGM1lKQZzkQyc
	hWe2mV/NQN1s4Hr/XMohPxSOjBNMBQE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-8uTUn6fZMSW2e0n-FZK-0w-1; Fri, 12 Jun 2026 09:51:35 -0400
X-MC-Unique: 8uTUn6fZMSW2e0n-FZK-0w-1
X-Mimecast-MFC-AGG-ID: 8uTUn6fZMSW2e0n-FZK-0w_1781272295
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91574ad6871so169420485a.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781272295; cv=none;
        d=google.com; s=arc-20240605;
        b=Ag90ZlA+uVWbBOEe9Xc2e+YTH5DaUq7Bqi7HQqu8xV/9qiIQ07vhLBdKh/CfZJMNe1
         LeAcHNBJb0PwvpZxk16OGkdekQ+3wiu4wQucASlrKBxLINJ84NltvfZtbctxJ3xvxLnB
         5DPEZvhyiDnFgxgFdvweXAoLfrRvOsOG3Odf4gwBH2NMckrXqFoRCeh9ly7G9iej8l3y
         fotm10sr86rx/X6C/0fh6h9E0qpC3XpNwLwFpLheLgG1miCYAcr4LeLZIL9AOalFnzLa
         PckWFZYvkkJiHfWt9eMG06cP7oagRr/l75UqriIEsZ37cHKsY7nU9/Oefr+kNCbpdRAf
         uKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iy/v7kxpOlqBCTDcC4jlmM2w9KphND71Hvl/We9DfQ4=;
        fh=WBzRXTU4sq8Ky/BBy2+QVXXk92t1fImV3buRkDwKYEM=;
        b=CV7l8jG/KLBGqBjfNOCTS+iXeSfTtSN3q/eJ8JVGd++pa+dEVigJAWQDdyb9tcv9aQ
         nHFHKgDlFz4RjybPspzXoo3Y5s/40MI4CV2Xk1tmzxijAxj5NEvILRaK9v588CxvrCRl
         74W+1Y/Z+qecMfT0yMQWUFnkQge1sE5SnQ5sc0oK2zH5tB3DuWNYycxLc9HRcAhiDtdJ
         J8ol+hlY5tWkJ28utHwOsgQZYQL4APg23UFvDhdpqft1BNgd1Rb64SK5JLKBYCipnNDz
         wGOu2ZfZkGlEr0sS+Nz40XpO6wFQiA7oCqL0IBSZzq7agoW4/w4zEaHb6ilA1hm2hUA4
         bFww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781272295; x=1781877095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy/v7kxpOlqBCTDcC4jlmM2w9KphND71Hvl/We9DfQ4=;
        b=ibIu2lwGWGi5LJXd6uw6IrKW+nTUsdKRyOeOWPAsqY9rq9JHc9pqUcff16cSolR1vk
         ClWmdurqIH7zKU1tp2RySSbkSM997Zt1Gq4dZGnvTrg9sRjOZQRuVF+gxuH7keIcKfOr
         dkYawBZ1Fi6xstx1YVK2k+9Z2uBqs2SVNnvhudCZUG/LotUcEg0yAf0o9uUVVTAYupWH
         gp8BFJ9c+pu9bZ383xN6otcx1vYBLDV6RL1WCzDSSNHB+GyIE+MkEKjKQIfT7nHuRChH
         Y65UgaKxIxgwJzjqhTCn/DTAeJ7zBwNc8q9n95K7d2Dr2lRpCJkScUXgofmB9lWN2OYL
         8r5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272295; x=1781877095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iy/v7kxpOlqBCTDcC4jlmM2w9KphND71Hvl/We9DfQ4=;
        b=Uiz1/EiQ5MDJiT8575HLk2TlsykG6zbBZ4c+nEAYyE/jVFZS6veY9dW6wcwkHwqmb5
         mDGxhf3wAwLQ7Brg1hGRX8JAZVsRmuPdkBBi4upK3WXmirXkB0FGnkQUYRwThXcitiDn
         kpy7WmVcgy8VFIdmNc8nUkRM6NiWRy7PsSkruI2/293B5jhy7mi/Cg2ZbO0tc3N8krY7
         2IihmlryeO8N36X+7ueKodsABSs/oefrP8PcrI7BVw916bFW3/SBcqI5xc0shsBINNh+
         6zFr94MfnCIvFbR/71a31EtD1SDmAUP5vjDzM3TbWdV1QqRH8B+MttTg4DXfSkiFcULC
         Av+A==
X-Forwarded-Encrypted: i=1; AFNElJ+OxJwCsygBWD9hwAMwsyxJPOL0Y/yyeE/lgpoRZfWca/Q8c6xw+xDNHWrnEzyttxkQsGZVwdpLW8V8@vger.kernel.org
X-Gm-Message-State: AOJu0YyNj2DWdQuGcApZw0rgvut0lsKNiimtQjltACUwvyJjew1SPZbI
	UnGPGQGcXtQVe6SCnwvAPyxRE8DXgjzjHb59Tdjbn9awW1cjyKccLAm8qwKCowCJJG0HnZJ3JxY
	BfX+AwUYSwq8/GH7XclA6R9SSA21vaY5YVv79AmBBahMdWFLzq1wNLMpNn3l7DL6v49UdL9/sq/
	olU2ZmEhdCBMfOqntKKLX7UT4af/3Cfs/3BlNNrQ==
X-Gm-Gg: Acq92OGaR/rpysOAZMkucxJSAtFxf1SiGHaytVYAga3h6VBHhc/qcPnuUWkxmTt4MlV
	S1DaYMSDWm9pga7jIVuhq6kW+h9M+awA+JQ0VpU2BYsEfwH5PxonxXN3s7NJ+U9QexR6Glxq1sN
	yWo8zNiVEoRBw0iZPDF3HLYBs/xJpY6AGZVUHrD7qigW2DprFUbyD20MdpXmhs9wBR+52pwmT7g
	zaObtlTxq2/zp1CxTB/Orkii2JEbw21BuNNEw==
X-Received: by 2002:a05:620a:4149:b0:915:d5cd:8cce with SMTP id af79cd13be357-9161bc02c6bmr425212185a.22.1781272295105;
        Fri, 12 Jun 2026 06:51:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4149:b0:915:d5cd:8cce with SMTP id
 af79cd13be357-9161bc02c6bmr425204785a.22.1781272294560; Fri, 12 Jun 2026
 06:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com> <20260611-rva23u64-hwprobe-v2-v4-5-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-5-3f01a2449488@gmail.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Fri, 12 Jun 2026 09:51:22 -0400
X-Gm-Features: AVVi8Cei37Nc7wEh-QPxeO4jIlCv0ZbORPC259y2xDJU0379i8L_rI91Rp2DJbE
Message-ID: <CADRr4bd10AYwAZwHxEiuSJEOwD5qv68L1r5DRjxXFM8pmrG+WA@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] riscv: Add Zicclsm to cpufeature and hwprobe
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
	Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Andy Chiu <andybnac@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 4:14=E2=80=AFPM Guodong Xu <docular.xu@gmail.com> w=
rote:
>
> From: Jesse Taube <jesse@rivosinc.com>
>
> Zicclsm requires misaligned support for all regular load and store
> instructions, both scalar and vector, but not AMOs or other
> specialized forms of memory access, to main memory regions with both
> the cacheability and coherence PMAs, as defined in the profiles spec.
> Even though mandated, misaligned loads and stores might execute
> extremely slowly. Standard software distributions should assume their
> existence only for correctness, not for performance.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>

Thanks for the update! Just an fyi email has changed to
jtaubepe@redhat.com though.
No need to change the signoff though.

Thanks,
Jesse Taube

> [Rebased, rewrote doc text, minor commit message revisions]
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>
> ---
> v4: No change.
> v3:
> - Move the hwprobe.rst entry to the IMA_EXT_1 section so its
>   documentation matches the IMA_EXT_1 bit it was allocated in v2
>   (Sashiko, agreed by Andrew).
> v2:
> - Rebased onto v7.1-rc2; moved ZICCLSM to IMA_EXT_1 and
>   allocated a new bit for it
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>  arch/riscv/include/asm/hwcap.h        | 1 +
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/cpufeature.c        | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  5 files changed, 8 insertions(+)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index d9928641deb99..49d9fb68632d0 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -401,3 +401,7 @@ The following keys are defined:
>      as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
>      extensions specification, ratified in commit 302a2d45c243
>      ("Update build-pdf.yml") of riscv-cfi.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is suppo=
rted,
> +    as defined in the RISC-V Profiles specification starting from commit
> +    b1d80660 ("Updated to ratified state.")
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 44bf8c7d8acc5..e8f4a7dd96a93 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -112,6 +112,7 @@
>  #define RISCV_ISA_EXT_ZCLSD            103
>  #define RISCV_ISA_EXT_ZICFILP          104
>  #define RISCV_ISA_EXT_ZICFISS          105
> +#define RISCV_ISA_EXT_ZICCLSM          106
>
>  #define RISCV_ISA_EXT_XLINUXENVCFG     127
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 9139edba0aecb..6819df159c51e 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -116,6 +116,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE    15
>  #define RISCV_HWPROBE_KEY_IMA_EXT_1            16
>  #define                RISCV_HWPROBE_EXT_ZICFISS       (1ULL << 0)
> +#define                RISCV_HWPROBE_EXT_ZICCLSM       (1ULL << 1)
>
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 686dde3ce3b98..1fb595581adcf 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -502,6 +502,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, r=
iscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
>         __RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv=
_ext_zicbop_validate),
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, r=
iscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
> +       __RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
>         __RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP,=
 riscv_xlinuxenvcfg_exts,
>                                           riscv_cfilp_validate),
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index f8f68ba781b45..9cf62266f1890 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -205,6 +205,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pa=
ir,
>                  * in the hart_isa bitmap, are made.
>                  */
>                 EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
> +               EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
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
>

