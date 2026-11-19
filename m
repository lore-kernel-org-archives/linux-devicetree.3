Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795101815;
	b=NYkhKp4SVBt4yyrnkR7FBKemn9Ii/kEgso3bS39PgKk0YAOW+BaXVkESvcn8BPqinKp0
	 GSGX0Pf/JqJTVAbF4eumDZ0y0C13Z0WbYmbM9an8OeNDB91rNluVz3eQtwxUL96pGgsh6
	 6P1rJDRVYIZLGCFYs/uL+POGFXHrn7lymVufpdJDSqKDcA3N0u3PHCDH+84iRroMGevn/
	 BPAZ1niopSag6VQE3X0Fqf3iJXMED/sT6kc05S5cXxnRMiGS1fqKV1Au5VqRwcjtYRxd2
	 +7QujjWyIg6Z8N06uAk7pm+asjwqRULVFmWhvE/Bgf0faslIgg7Yx5hFe+uHa7Di5DQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
	b=NceIWXUKlw0Dfp8TYpYiCTDWOeqWAF0DJlPTJyyVcDhSQ06AtI6xvG7dowcX6sntubqd
	 lRyAzdLgR/OWZbs5tytVlw0ooW+1wvohMZQaZssNS4y2QpYfnro3WtTDoYBGw1Wi0Uq5n
	 j+m9W3g03T/08U54XDqqgwxv7GeR3Uck91w3o+UD/ihKmEvsRy7hgzpGS3ZDCSfkgAdvQ
	 U2i4kqFDz8W18yR78dG2Cjslf8Bhje8i2BAjRNL0uZjosLYUtmaPqAgspMjqP5SlQ4aoD
	 D8szOX4t+pjY6HDWTVlNP7L4GGXVy/2n/cRrVCIdee0x+hvPj8UtQvUHT1VZIIFqi3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=PsKvSipo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB4A606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BB4A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=PsKvSipo
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so23413771fa.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101813; cv=none;
        d=google.com; s=arc-20260327;
        b=RSzOJ+fcvBRDthX5mxn9xVtUiGNUbi/5njEArhcUMeMGsKYoowvkWUdP6FK43toDao
         Ftc04r2288p58C2PyIupXtX+H4qZKNGcwIcxnkgy/Du/RF04koKZVN6b0ieEQLHJ8PFu
         U9EWkCIc+CG1WKrs+nhgJJ/+BI+cqGiDvAPGT45qqpoHhqvdtIRzmJ+Vyjc0IfddpZWA
         oXXqTeuz9CulojiK8gIiHwNklTw6f5oHXRIPZ9hjeh9ctKu2EwWzj1zkyMlcpQpJAVPR
         ox4B35nmcONqGYD7u+ixZiK+U1nbr0ztIF7jNxyVHVZ3jFrCaPnUo+iDwaImUtzBNm04
         DHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        fh=fRmaxMUZHHMvCDkw/VGQHO2D+ynw9J5GGAfQAbMlyf8=;
        b=Xr9EH6+xgpWrM95WgKmTtBywcE2hGZPbEPinvsZZABOzFoWuH5dlcRMcCyL4OtGOrr
         zB6KMG8ye+EqcPFAas0zqTIRAo/03dhcPHH2ax4CmNiByELARNhlH9dB+fxakGEfSFhE
         KMBPasC1gXN0BGHbYz9yI7WwphVNUsv2cuLiqboCwQNW1eDtidHO6qqnCyqu84/Pw2tf
         5Tt39wQuUn5KxqpHFGCRpOcQV2cR/oAXnvi65VsRwepB6KeSX9QM2HCmj0UlyWqGE79y
         sQMq5IzsdkVYQBw8Jao/bWCkTWyqNFeyclMz+DSXNE2LprS8TVPjee+OBHL4wajAuO7i
         VdqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795101813; x=1795706613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        b=PsKvSipo4uwtGNDpuodh58qPWVhgfzyjHZK7Ju83zbKIRcDW6RBRLqDwxpgEQ3B0JS
         FO+hCtjaF8ylDWAgZxhOgWjeLdbCRH6PeIpfdDCJVR84Im3w3xATL2GCh0DkTY640PYx
         nC7Vg58Ij7lX60MSiWsikqTruxxW/QgyQDR+XKwC22zdqRyGBNofVjK6RrNnAxO81NhF
         SrUM+xGyAAZqEPFqJnDSKlZXzHn5Ilv3trNGXCYQk/ixaOifH0APmsKf6DJSsDkLf0nO
         4VZstfeQTsvNX+f9/2k5Y7Ign1Z9khBqS1wBn7xXpNy+7c0L5HNSbCzIbR7c0au51+K1
         Lh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101813; x=1795706613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        b=Pia3tticpsv2/7xNyLlbKNjRaBsD9dTNbzXW1CXg+zJtQbJ3/ITsBXkykiKTX0tqy4
         ETlbCnUdt/pi/z3LJhZs1soaHJ+Yg6j9E2ux8T84UaWl/A/zduTaJIkTh9RHuHZiyXg+
         oGQU87U2jJnRAMSG3XC1/4AdTMXsBErcxzuxdCv7hy/TPAJ3pyZB1bJySTtcAYWLah8n
         /uRk1VqD/KpDqCxPdXhAF/vtf3SCXKDXUMvZ/+CbCOoQrJmwK36Dvc9li0oTEDnCP4LU
         U1T+WuhW5ixyY20XL06QPcVJl1U+eXMjKtnzcC2uq/ZPXGKCWsWYoYkRumbHF2BtJvk/
         b6xQ==
X-Forwarded-Encrypted: i=1; AL+hErGYx41zycIJ6YvHHZomf6+/AdK/0itZK8fCAKdkXLAGPhWNibIjsrbnZNA3nB0afJBiDvxMAd+uU901@vger.kernel.org
X-Gm-Message-State: APuU4Z/hZJqGz34Y1mnPXwoc1Np2TMEqQOouTO6+ZSgIHOEMGcHGpIch
	U5vBUBMuR8L7TsSWKMhLmjNxHxcEwoKNxxkUcv2MYdBnkUa+wvYXAZ5zC/SXJDPAh2myRGLG8O7
	UZAiTjnhMct1m3K2Ro19InGeNFC1TpblKdVRXmwaKOA==
X-Gm-Gg: AYBFou1aAVVv/oJ2pqsEWhOnSvXro6hH0KUBRGN/cbJMMjcqX0wa8M8ffsaODRZuimu
	h5iPP5IiP2KVCrQi6MCNY0ni2LC9+1r7X3zUaz5k0mtmPgHYJiqpac9uxgZGq/8GOv2dKxpScex
	HwfJt0ARorCKaFneR+h0q9miUyHGNVyAAje8B/82BZaldC1Ozcg6yrFqsQdUzpAZ+JaIGFszFI2
	rQC/rTcPHrpoG0PpQdkxT57SwCIxjFcqToAgsPw6VSFs4lX9XwWk+UYraz8roOBMzLodHAFL5U3
	r5+9D8zikPJMbtnqPynFPH0uwOADc8mgWEOSNpdGJPnvTcYUtO/cmGmopcrp3o/RP889FHWdsjU
	gmKeq8Y+Nq5gtpEAqhb2ne4qw0vB/f+MSpOgYE4NYlD29YnwyZw7jn/NQ9SX4RgXEGFZXalEU3n
	mAKsKVhAZvvtRB3MZwTHITupbq7JxMpcCZBc1op0cab7s7U1BYICZ8rio=
X-Received: by 2002:a2e:bd05:0:b0:3a6:6d05:7375 with SMTP id
 38308e7fff4ca-3ae7f9d5f2bmr884941fa.8.1795101813092; Thu, 19 Nov 2026
 07:23:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-4-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-4-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:53:20 +0530
X-Gm-Features: AclHuK-bYeekeWya8STnw2Y8eECaMfbCySlAAK-yinBr0JM6XHZ34xL9AEfbGuQ
Message-ID: <CAAhSdy3TtQCE8Fa5FitihgSKewXLApPOOhWHU1QCw=6F-P_4=g@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] riscv: Add Control Transfer Records extension parsing
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:21=E2=80=AFPM Vikram Singh
<vikram.singh3@oss.qualcomm.com> wrote:
>
> Adding CTR extension in ISA extension map to lookup for extension
> availability.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-4-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  arch/riscv/include/asm/hwcap.h | 6 ++++++
>  arch/riscv/kernel/cpufeature.c | 2 ++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index b5952db9259f..ee200d8cfccb 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -126,6 +126,10 @@
>  #define RISCV_ISA_EXT_ZIC64B           116
>  #define RISCV_ISA_EXT_SV48             117
>  #define RISCV_ISA_EXT_SV57             118
> +#define RISCV_ISA_EXT_SSPESA           119
> +#define RISCV_ISA_EXT_SSPLCOFI         120

These two does not belong in this patch.

> +#define RISCV_ISA_EXT_SMCTR            121
> +#define RISCV_ISA_EXT_SSCTR            122
>
>  #define RISCV_ISA_EXT_XLINUXENVCFG     127
>
> @@ -136,10 +140,12 @@
>  #define RISCV_ISA_EXT_SxAIA            RISCV_ISA_EXT_SMAIA
>  #define RISCV_ISA_EXT_SUPM             RISCV_ISA_EXT_SMNPM
>  #define RISCV_ISA_EXT_SxCSRIND         RISCV_ISA_EXT_SMCSRIND
> +#define RISCV_ISA_EXT_SxCTR            RISCV_ISA_EXT_SMCTR
>  #else
>  #define RISCV_ISA_EXT_SxAIA            RISCV_ISA_EXT_SSAIA
>  #define RISCV_ISA_EXT_SUPM             RISCV_ISA_EXT_SSNPM
>  #define RISCV_ISA_EXT_SxCSRIND         RISCV_ISA_EXT_SSCSRIND
> +#define RISCV_ISA_EXT_SxCTR            RISCV_ISA_EXT_SSCTR
>  #endif
>
>  #endif /* _ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 72bce616491f..b3e3c30f4c8b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -652,6 +652,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
>         __RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinux=
envcfg_exts),
>         __RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
> +       __RISCV_ISA_EXT_DATA(smctr, RISCV_ISA_EXT_SMCTR),
>         __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>         __RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv=
_ext_ssccfg_validate),
>         __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> @@ -659,6 +660,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinux=
envcfg_exts),
>         __RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
>         __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +       __RISCV_ISA_EXT_DATA(ssctr, RISCV_ISA_EXT_SSCTR),
>         __RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
>         __RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_e=
xt_svadu_validate),
>         __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> --
> 2.43.0
>

Regards,
Anup
