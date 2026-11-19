Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795101433;
	b=dnOR0gRHyihlN1QM62rhRphUNQMrXAb3siyuFnSVhEEuACsXrm+TRrx8dbikjoGB01lA
	 RkcYr5nmlezsaLKVD2UJmiKiZbjQeBtcSLTvUEiDP9h+ciTQZdNgIQiAulF1s5/hkh5MN
	 Bhha4Xv3WnrqHsE7CPKCvm0wv0wrIuIqunXYk4x9V3E9n6pQzHQtZ4uvTdtRst7D+Tb4V
	 ZoLeA91uo4w4aI+G+LanWD3AhA115XQQbiRJTPJz/ichS0h5GXG6EoYr1UFhJKdkYe/jC
	 45N43hKNrpnRhd9NN9ugvtPJmXzpWOXWKO/6mKtdZnrTWKWVECd3N9x1cGpL8NrhqkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s1nV4pJB/Pg9LULexQxieGs66dNhcFkD3Zb94PHOxG0=;
	b=2gY6S3ZNfmh67PlPK70phkpV6RXqxYQyJmOrubiQyJBowu2qzaigig4AAeP30P6Fr+cl
	 /7FiUO5C2rI4gSchtXoov41rPADY7gP8BtRgojtZkslDPci2AWnrnjDdo6J2ZfQL/89Rf
	 07IRWzAbyoQrRzyRHDgOS4Jnc4dV60Oei0TxFzEs2Ugo+PxeEvZp52oqlhP0PMci5on3W
	 h6CWJbtNfYn9yBPhkbbTClFWttXnlFvaV5O5KJFI1eZFNtvCF1UbSwjzQiWZiDpoaiQ/m
	 fMqvsvETv+rU7pZKxJl9W445BJ1FsAloHDOLXMCUNtOdEyFiEWE4mYgXR/bDvvMODdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=EqLKk95M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6CD606A331
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A6CD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=EqLKk95M
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so7540295e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101431; cv=none;
        d=google.com; s=arc-20260327;
        b=VatVmAs8xS96602PiiC8BZl0/aPsB3aS1l8Sb1YBQAUTAt6yMSXQ7ht6ndKi0hJ5v/
         Fo/+4EfzygmtJULOVuUgBKjwrpo29nDvH7hSyyiVTB7uIL6NFjjZgqIySyxno1Rim9ZQ
         i7kDa6A0cgZF2ZizHE76BGhNql6JXZJrJowdkgXRfR01uSuGghlNvU2brEQ6ilAO79Nq
         Mms/dEwk7/d3ChVSq3BvxG/82W7psZKuv9bBgxdpVXlSgyGFQYc5GW/zgCMAJgiyZSTp
         1ib3TiEQ3/IMUiVNbw7BKjjE4qRTMbUkxQ76mZaM1o0HFK+Hsah0zpxRUKZowFmszelc
         pOHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s1nV4pJB/Pg9LULexQxieGs66dNhcFkD3Zb94PHOxG0=;
        fh=V875RCDit0ruu1yeFU9DtsWcf0Ze0xU/zpXihnOezOQ=;
        b=RNamxwsFxua5m7hOB+fdxl2ZPXNiulIkrGuEpBeyaB/pBB3Do89q+2/Bbaduj12B2a
         IeyVC24oEztOsACDRwCVZhQ99tJovEz6MtK9xNO7uHWNSnlCEAFR6btDHXrWdsRAwVLw
         Kobmqg1EI8viDPdQpHIpGuzkDuJPlxkuQo20Raqe/+Z612GBc5qJnotVusyCNHFAWa7C
         jXWjB72WE9fxRtAAC83nbFzTHv8w1WF8JLCGw7BXIMgxZY4aUNWac+balUNvtWoQvlaf
         T1gW35/THmT+DB5KZZYJJ4NaIoie45QG5/EUsdU69SOkEC1kw8RU+9mU6v6ljn9wTHvP
         ZiqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795101431; x=1795706231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s1nV4pJB/Pg9LULexQxieGs66dNhcFkD3Zb94PHOxG0=;
        b=EqLKk95MuL23AxC5kk0f9B/+c8l7zuzfV35+7PQZcewvu8NBRCyJhTnAnTgUF+eW7W
         QhCQ4ESv1BPBMzj2LpFl+T/Bv+tlhZbf88kl63Ah2E1E3f6zMtAWHTLxvx934Q/a5mjE
         prcyke/LDZWphgODmG/mLb2d7TgR6+bBEqy5Ccpooipu16YuaFabUQ227oLFDi/fcry9
         yEVfvxgj6Bn0LkRr49zGglNIgVsipN/OzHBzL0yOo7riEao4hYfRZa12qkllc1TwEkhE
         q38yPnE18Ihuy/X1waYZ9sNXwsIetbWvtqnNVt4Y6XRkih71XtRN57SiTIr83LiUI7Wy
         u1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101431; x=1795706231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1nV4pJB/Pg9LULexQxieGs66dNhcFkD3Zb94PHOxG0=;
        b=0vOS/p8UaWiyn49p/mKdjaYyvfPjnCQzvCfUpm1+OYAC5x82Juqj1RBebnsolL+eP4
         klMaQuNlJ13tf5EjZuhS9LrxXF3ZEiwUGWInUalkMJB4HgT5ybWMtNb2sgSErpEjo1jR
         iSZQBFixZi3syi1D6Fv2jsaYWtCLDCWUKxDPqetDp+4CXSdWGKKzNUkKrE4FioTlkM4/
         9F06at7RkAyYNmq4rQt+90BsvDMRXjb7RapqIdz/nhMtN1fqqrRoZMVS4Sl5zoK4Uuki
         ATvvd2nyvwmo4MHEkOed+XY7f7owBY61HDqi3L0QOKpF/+QjNtxUAf1IsB6SqNGAPw87
         htVQ==
X-Forwarded-Encrypted: i=1; AL+hErGEorRqfkFzemipNICbRR+JJZ7y3BwdCX+CxC8OFj0D1Hb8H5wyyNXhHU5u71/Y2Eiz7fl8/HO2Gcpi@vger.kernel.org
X-Gm-Message-State: APuU4Z+O5zaI2NsOJ+pPCX0xIFs20nSkjzHRIwTEW0wt6Dr+Iyy36kYs
	OKBSvXB9845fOSSONDonFYT7A9u/jzQS+TRpiNrRi9UwriaWX7aa0wzouFEJvMCB2ssSPDoZd0q
	CZSMMT255fl8lfdh1qt0nkb39aGUcWtDHJBkuTIn/mw==
X-Gm-Gg: AYBFou2MkhQ2VXN4VrFjX8W1radCAJ+dv0xWgRS5O9sGQigcLAeM7UxnA+UpDV7nFy0
	go6nf4FnW6Ltlmvi2xsphaJnBi8INjtHU+4ocRKDUFa3rPEOU6UeXn6SivAP0iPVUaJOLUiSU/h
	xay2uw5GAHG/KAH0ES32GvT7I8v3bjxouOf1bDfgoCouJyPBNfPf9A25/0d6ey4cOWQek3ploc7
	1pgmNyr9Q5rApri5GvewFVVhndyvT36ZHmPNdMow+EjgUMBrvNw0SQt6Xj/alqqhK9s9bGs6fyd
	MiHCJrmCPaPvUelLgT/NCUKvkjSsPIGrPEogwiJcVJdkcFKivQSZVwuPL+wMhLxambwyJ++uFY1
	w+P8aHesEBXcBkoR0PAY3Aa58yQcl2sBQdo/GhEvm4AGgVpVpoFX33A10dcXYtdZELk1OLahwZW
	O6PmkX03S5BQGdC5O24/h7yPwx2XPIpoVXyfkGQaZwQ0TsBg4yfy1vlss=
X-Received: by 2002:a05:600c:314f:b0:4a1:c6f5:2450 with SMTP id
 5b1f17b1804b1-4bb8612e0ecmr32385565e9.17.1795101431510; Thu, 19 Nov 2026
 07:17:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-3-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-3-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:46:59 +0530
X-Gm-Features: Aa3M54rT33sHedk6b52_SmmeeC6_QwQxOJWE_LlMaSuUzG5nqW2zaQJ7Y3n50ik
Message-ID: <CAAhSdy1YOv2hBe9zi+yJ=fmVEfWi9iGSxxKJ7uZbSHowTj7NOg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] riscv: pmu: Add Control transfer records CSR definations.
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
> Adding CSR defines for RISCV Control Transfer Records extension [0]
> along with bit-field macros for each CSR.
>
> [0]: https://github.com/riscv/riscv-control-transfer-records
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-3-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  arch/riscv/include/asm/csr.h | 95 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 621f84d1898f..063351d9b406 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -350,6 +350,97 @@
>
>  #define CSR_SCOUNTOVF          0xda0
>
> +/* M-mode Control Transfer Records CSRs */
> +#define CSR_MCTRCTL            0x34e
> +
> +/* S-mode Control Transfer Records CSRs */
> +#define CSR_SCTRCTL            0x14e
> +#define CSR_SCTRSTATUS         0x14f
> +#define CSR_SCTRDEPTH          0x15f
> +
> +/* VS-mode Control Transfer Records CSRs */
> +#define CSR_VSCTRCTL           0x24e
> +
> +/* xctrtl CSR bits. */
> +#define CTRCTL_U_ENABLE                _AC(0x1, UL)
> +#define CTRCTL_S_ENABLE                _AC(0x2, UL)
> +#define CTRCTL_M_ENABLE                _AC(0x4, UL)
> +#define CTRCTL_RASEMU          _AC(0x80, UL)
> +#define CTRCTL_STE             _AC(0x100, UL)
> +#define CTRCTL_MTE             _AC(0x200, UL)
> +#define CTRCTL_BPFRZ           _AC(0x800, UL)
> +#define CTRCTL_LCOFIFRZ                _AC(0x1000, UL)
> +#define CTRCTL_EXCINH          _AC(0x200000000, UL)
> +#define CTRCTL_INTRINH         _AC(0x400000000, UL)
> +#define CTRCTL_TRETINH         _AC(0x800000000, UL)
> +#define CTRCTL_NTBREN          _AC(0x1000000000, UL)
> +#define CTRCTL_TKBRINH         _AC(0x2000000000, UL)
> +#define CTRCTL_INDCALL_INH     _AC(0x10000000000, UL)
> +#define CTRCTL_DIRCALL_INH     _AC(0x20000000000, UL)
> +#define CTRCTL_INDJUMP_INH     _AC(0x40000000000, UL)
> +#define CTRCTL_DIRJUMP_INH     _AC(0x80000000000, UL)
> +#define CTRCTL_CORSWAP_INH     _AC(0x100000000000, UL)
> +#define CTRCTL_RET_INH         _AC(0x200000000000, UL)
> +#define CTRCTL_INDOJUMP_INH    _AC(0x400000000000, UL)
> +#define CTRCTL_DIROJUMP_INH    _AC(0x800000000000, UL)
> +
> +/* sctrstatus CSR bits. */
> +#define SCTRSTATUS_WRPTR_MASK  0xFF
> +#define SCTRSTATUS_FROZEN      _AC(0x80000000, UL)
> +
> +#ifdef CONFIG_RISCV_M_MODE
> +#define CTRCTL_KERNEL_ENABLE   CTRCTL_M_ENABLE
> +#else
> +#define CTRCTL_KERNEL_ENABLE   CTRCTL_S_ENABLE
> +#endif
> +
> +/* sctrdepth CSR bits. */
> +#define SCTRDEPTH_MASK         0x7
> +
> +#define SCTRDEPTH_MIN          0x0 /* 16 Entries. */
> +#define SCTRDEPTH_MAX          0x4 /* 256 Entries. */
> +
> +/* ctrsource, ctrtarget and ctrdata CSR bits. */
> +#define CTRSOURCE_VALID                0x1ULL
> +#define CTRTARGET_MISP         0x1ULL
> +
> +#define CTRDATA_TYPE_MASK      0xF
> +#define CTRDATA_CCV            0x8000
> +#define CTRDATA_CCM_MASK       0xFFF0000
> +#define CTRDATA_CCE_MASK       0xF0000000
> +
> +#define CTRDATA_TYPE_NONE                      0
> +#define CTRDATA_TYPE_EXCEPTION                 1
> +#define CTRDATA_TYPE_INTERRUPT                 2
> +#define CTRDATA_TYPE_TRAP_RET                  3
> +#define CTRDATA_TYPE_NONTAKEN_BRANCH           4
> +#define CTRDATA_TYPE_TAKEN_BRANCH              5
> +#define CTRDATA_TYPE_RESERVED_6                        6
> +#define CTRDATA_TYPE_RESERVED_7                        7
> +#define CTRDATA_TYPE_INDIRECT_CALL             8
> +#define CTRDATA_TYPE_DIRECT_CALL               9
> +#define CTRDATA_TYPE_INDIRECT_JUMP             10
> +#define CTRDATA_TYPE_DIRECT_JUMP               11
> +#define CTRDATA_TYPE_CO_ROUTINE_SWAP           12
> +#define CTRDATA_TYPE_RETURN                    13
> +#define CTRDATA_TYPE_OTHER_INDIRECT_JUMP       14
> +#define CTRDATA_TYPE_OTHER_DIRECT_JUMP         15
> +
> +#define CTR_ENTRIES_FIRST      0x200
> +#define CTR_ENTRIES_LAST       0x2ff
> +
> +/* Temporary addresses for Sspesa (Precise Event Sample Attribution) CSR=
s. */
> +#define CSR_SHPMSPC            0x5d0
> +#define CSR_SHPMSDATA          0x5d1
> +
> +/* shpmsdata fields */
> +#define SHPMSDATA_CNTRID       GENMASK(4, 0)
> +#define SHPMSDATA_MODE         GENMASK(6, 5)
> +#define SHPMSDATA_V            BIT(7)
> +#define SHPMSDATA_METADATA_SHIFT       8
> +#define SHPMSDATA_MODE_U       0
> +#define SHPMSDATA_MODE_S       1
> +
>  #define CSR_SSTATUS            0x100
>  #define CSR_SIE                        0x104
>  #define CSR_STVEC              0x105
> @@ -563,6 +654,8 @@
>  # define CSR_TOPEI     CSR_MTOPEI
>  # define CSR_TOPI      CSR_MTOPI
>
> +# define CSR_CTRCTL    CSR_MCTRCTL
> +
>  # define SR_IE         SR_MIE
>  # define SR_PIE                SR_MPIE
>  # define SR_PP         SR_MPP
> @@ -593,6 +686,8 @@
>  # define CSR_TOPEI     CSR_STOPEI
>  # define CSR_TOPI      CSR_STOPI
>
> +# define CSR_CTRCTL    CSR_SCTRCTL
> +
>  # define SR_IE         SR_SIE
>  # define SR_PIE                SR_SPIE
>  # define SR_PP         SR_SPP
> --
> 2.43.0
>

Otherwise, LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
