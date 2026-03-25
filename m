Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1651EDA32
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 01:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403001; cv=pass; b=KKrT+HiTKDNEa9W5eCph30p7VRAaj2FSkZNQVWmUIJ6uNTyvc6GwnUOc+JCXVY4NvKyYt+WC2WgeSTx50vyqHdWOg8J45zYOfAB6wcCGmdrkwwX80Wsl4g7wrH8yLtREXzhe0aSWAwATNeZXpWUR3ogSYVPZrckzx4CmpGFNs5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403001; c=relaxed/simple;
	bh=7Z+kIRVbQ7WV37i1YmClsJWUkbW+slAO1Y2IpTQEZ3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qS0bGuLfZOT5Vo0G6PNbVQXs76q3HgHQRPGcm/HDSEBQmthMgRcKijNjp+osEHuRb4j5PJUZOBxo5EcQ/Rj0e1Yv/PLX29vlud0nUbJc1bpeCJ0ih3L/vtKU/FjRWoEiHKrxSWbCQzAFwWEE9RlLDEpthhEdfOJX/1zV2opxZAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IC8ebO1M; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IC8ebO1M"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-463f00cda04so1131937b6e.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 18:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774402998; cv=none;
        d=google.com; s=arc-20240605;
        b=h05qGZ1Vnx5pXASwbfum7rSZMt+Un9kcbbg5JLmTU3tt70MH83WBKgrPmhIhrQX+at
         da4Yn4DYmLxVttSdd8xbailLLri4w15tUicNd5gJvGSt6ddAlPHcdh7emZhJuR8vS+1t
         AM+bHvMUYk6BpfmSQAsjT7x4nVPFtpfN7nmMP9S7IYrBD8biWB7Be9M9ZihWP/wYRJah
         iP0V/5ygphfu9dBlt0NIqGn16T0ekvj+m/itorafS6bRLE93f8k+dEbwEfDQiVkKd8iv
         0mp8kOJLMxKhVjV5xe27vMOFQh0guUcFL8jwPGqPjyLIJbe2qD6XwxrkoaZglpL5vXHm
         REHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BVjPu0rHHBy1UzY463CDPxiXdA8El4sI25AORgmrANA=;
        fh=lG8m1FrLkGNk6zUmdYWZXHElET4RtbCpOU/s92Pxsj0=;
        b=BCzvXEy7VgivNv+FPxpZ9ycNdZT62vUxp2TE8QT7maezG5xhXk54ZrZFoKEXGSz+uw
         EfEhM/XHYVOFmEH1+yMIHsibF3feVXfIQC+vfjZaLLiTtAETVL/wk+x6ehKXEYkbskZj
         t7JXPCyDJXWJVtUGt2KI9/RjCP+MOIohmSKNgsL8pYp8hVn7eL1EELku+ad5noovE4hI
         5MEFJoZ0eFZqcShnzbu6xw1rOpkg74A36PS/YgbU+f8Kh7hbcLPTN5i05tzFZ1hFSdga
         FWJjP5FvgDUuGKwA1X1t+PI7GNpvMy53vHLw/9drgfohLDhb7aToKVLLy6MmwhbVGNOF
         cM+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1774402998; x=1775007798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVjPu0rHHBy1UzY463CDPxiXdA8El4sI25AORgmrANA=;
        b=IC8ebO1MxqVZWrOBOh1IUjchJ7YJll40MtaExiaFWK6CVl5qnKo7tvdMC9Dka20OAF
         vliAP9V1Ak7FAWvbQ01Ugyyu71utcMA4shO04Is6pGj+2c6RfvMYVckzvraKPYr8qfUW
         dWW7UmIwQDUQG/7CSeIry+lKWO7Rfj8lBwxNbbfapNB1yqwhzE4Tk3LJ+7wI6y+q705O
         FliHavBehCPRrwiqEHQ3ZMqUlDQ20vD1BD/w63yNuMaPNSNhQ5mN5GeAEx+6yYDR/akK
         WK997G1KTUyVwD5uWWmJfT/y4tVxJ6eQHu7zcUpMitWkqtiLj6AIWRT091bSJq4ba66J
         SAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774402998; x=1775007798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BVjPu0rHHBy1UzY463CDPxiXdA8El4sI25AORgmrANA=;
        b=cCi5gnoqJYCjtpTKptv0ct+h7NnEEsNWrUHWGC//zPx1ckDi0fyQe/EceQqQJH75RH
         4rQvEzIuX3NvPXj1iBgxR1FlvSp1c0V67utEIHExG5+PdK7v74vtjQAKAT80UG5b7HE6
         IhVqTO2KIVwYHV12BPJZTu54TPJ5JZXMq8pE46QAJAZlsQqqNQ6rxFgjbQ56BT6ky9vJ
         OBxs9MqcrWQnOmHpRzDpk6yEmQ1+j05veatC6aYKRvbLutunCCjHwm+Tu2qamkBtnA6Y
         y7RYx8GVw6BBhddPO0cX3pvhT2UbcUrxeRK/+RYU9TFtlJzGaoLGB5mFH3D/M0hrQUA4
         qxHg==
X-Forwarded-Encrypted: i=1; AJvYcCXYdh+NUSmGwrnQ1iuTIbffP7bxXKjszZTT6ilvKNIUsmHlus+HLZFCoqNIoBoeFFJ3d/SktYFY9fcv@vger.kernel.org
X-Gm-Message-State: AOJu0YzhMxOz8LESuV28dmxTWnSU1VJ5TbXkZdUALHvpnyc36wyQO/oj
	MdiQ5H+d83fu+1PCd0qvMWRZP8QBIhWpVG5qKygk5JTC78oANFbkn/GxS97WkHPvUcWH8Dm8D5J
	8t/IhCnuahYKB2bHvGAokKgHom60OILmAaw5pDlmjzA==
X-Gm-Gg: ATEYQzzAhIbOL/N+DPZ4x91i227jA5n5U/wG4VRxjrT+pqIo9mVVoV3cUKQxCluYxIP
	WRqmEndxWomfDsj/2WPajmWWZ3lxxVWwaxSAto8KEw3vgw6K87BaT+Oy4yqaQnme8BpjrOGltAc
	1mKIuIsSf7eAExPFKUqxljh59Qy21tT5aI+ZWL3i6avBXAXtBCq/Z9GaWKDH/YGEez1SRykO0VA
	Dq8KSnTgITcs0EiEAMP9IE87RrnKNgeXeYAleWrFTayE46Zxx/P6J2FzULdyqfjvT9n82Oq29fh
	KefckO5pPHITGw==
X-Received: by 2002:a05:6808:c222:b0:467:26e4:728e with SMTP id
 5614622812f47-46a5c7a4ecbmr851588b6e.49.1774402998286; Tue, 24 Mar 2026
 18:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org> <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 25 Mar 2026 09:43:07 +0800
X-Gm-Features: AaiRm519bl_Rt9ja-VV8uGqhbXi9qjWu8MIOxUSwOQfzA4YoBDggIUB3VQtcL08
Message-ID: <CAEEQ3wm4vGcOChkj+z58nP3mjG8hvQmAhQLcLxqxwdvoo_8q6Q@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 14/17] include: acpi: actbl2: Add
 structs for RQSC table
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Adrien Ricciardi <aricciardi@baylibre.com>, 
	Nicolas Pitre <npitre@baylibre.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	Atish Patra <atish.patra@linux.dev>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
	Chen Pei <cp0613@linux.alibaba.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Weiwei Li <liwei1518@gmail.com>, guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
	Reinette Chatre <reinette.chatre@intel.com>, Tony Luck <tony.luck@intel.com>, 
	Babu Moger <babu.moger@amd.com>, Peter Newman <peternewman@google.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, James Morse <james.morse@arm.com>, 
	Ben Horgan <ben.horgan@arm.com>, Dave Martin <Dave.Martin@arm.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, 
	Rob Herring <robh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Thu, Jan 29, 2026 at 4:28=E2=80=AFAM Drew Fustini <fustini@kernel.org> w=
rote:
>
> Add structs for the RQSC table which describes the properties of the
> RISC-V QoS controllers (CBQRI) in the system. The table also describes
> the topological arrangement of the QoS controllers and resources in the
> system. The topology is expressed in terms of the location of the
> resources within the system and the relation between the QoS Controller
> and the resource it manages.
>
> Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
> Link: https://github.com/riscv-non-isa/riscv-rqsc/blob/main/src/chapter2.=
adoc
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  include/acpi/actbl2.h | 92 +++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 92 insertions(+)
>
> diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
> index f726bce3eb84..7367990349ee 100644
> --- a/include/acpi/actbl2.h
> +++ b/include/acpi/actbl2.h
> @@ -53,6 +53,7 @@
>  #define ACPI_SIG_RGRT           "RGRT" /* Regulatory Graphics Resource T=
able */
>  #define ACPI_SIG_RHCT           "RHCT" /* RISC-V Hart Capabilities Table=
 */
>  #define ACPI_SIG_RIMT           "RIMT" /* RISC-V IO Mapping Table */
> +#define ACPI_SIG_RQSC           "RQSC" /* RISC-V RISC-V Quality of Servi=
ce Controller */
>  #define ACPI_SIG_SBST           "SBST" /* Smart Battery Specification Ta=
ble */
>  #define ACPI_SIG_SDEI           "SDEI" /* Software Delegated Exception I=
nterface Table */
>  #define ACPI_SIG_SDEV           "SDEV" /* Secure Devices table */
> @@ -3165,6 +3166,97 @@ enum acpi_rgrt_image_type {
>         ACPI_RGRT_TYPE_RESERVED =3D 2     /* 2 and greater are reserved *=
/
>  };
>
> +/***********************************************************************=
********
> + *
> + * RQSC - RISC-V Quality of Service Controller
> + *        Version 1
> + *
> + ***********************************************************************=
*******/
> +
> +struct acpi_table_rqsc_fields_res {
> +       u8 type;        // 1
> +       u8 resv;        // 1
> +       u16 length;     // 2
> +       u16 flags;      // 2
> +       u8 resv2;       // 1
> +       u8 id_type;     // 1
> +       u64 id1;        // 8
> +       u32 id2;        // 4
> +};
> +
> +struct acpi_table_rqsc_fields {
> +       u8 type;        //  1
> +       u8 resv;        //  1
> +       u16 length;     //  2
> +       u32 reg[3];     // 12
> +       u32 rcid;       //  4
> +       u32 mcid;       //  4
> +       u16 flags;      //  2
> +       u16 nres;       //  2
> +       struct acpi_table_rqsc_fields_res res; // 20
> +};
> +
> +struct acpi_table_rqsc {
> +       struct acpi_table_header header;        /* Common ACPI table head=
er */
> +       u32 num;
> +       struct acpi_table_rqsc_fields f[6];

Is a fixed array f[6] appropriate here ?

> +};
> +
> +/* RQSC Flags */
> +#define ACPI_RQSC_TIMER_CANNOT_WAKEUP_CPU       (1)
> +
> +/*
> + * RQSC subtables
> + */
> +struct acpi_rqsc_node_header {
> +       u16 type;
> +       u16 length;
> +       u16 revision;
> +};
> +
> +/* Values for RQSC subtable Type above */
> +enum acpi_rqsc_node_type {
> +       ACPI_RQSC_NODE_TYPE_ISA_STRING =3D 0x0000,
> +       ACPI_RQSC_NODE_TYPE_CMO =3D 0x0001,
> +       ACPI_RQSC_NODE_TYPE_MMU =3D 0x0002,
> +       ACPI_RQSC_NODE_TYPE_RESERVED =3D 0x0003,
> +       ACPI_RQSC_NODE_TYPE_HART_INFO =3D 0xFFFF,
> +};
> +
> +/*
> + * RQSC node specific subtables
> + */
> +
> +/* ISA string node structure */
> +struct acpi_rqsc_isa_string {
> +       u16 isa_length;
> +       char isa[];
> +};
> +
> +struct acpi_rqsc_cmo_node {
> +       u8 reserved;            /* Must be zero */
> +       u8 cbom_size;           /* CBOM size in powerof 2 */
> +       u8 cbop_size;           /* CBOP size in powerof 2 */
> +       u8 cboz_size;           /* CBOZ size in powerof 2 */
> +};
> +
> +struct acpi_rqsc_mmu_node {
> +       u8 reserved;            /* Must be zero */
> +       u8 mmu_type;            /* Virtual Address Scheme */
> +};
> +
> +enum acpi_rqsc_mmu_type {
> +       ACPI_RQSC_MMU_TYPE_SV39 =3D 0,
> +       ACPI_RQSC_MMU_TYPE_SV48 =3D 1,
> +       ACPI__MMU_TYPE_SV57 =3D 2

ACPI_RQSC_MMU_TYPE_SV57 =3D 2  ?

> +};
> +
> +/* Hart Info node structure */
> +struct acpi_rqsc_hart_info {
> +       u16 num_offsets;
> +       u32 uid;                /* ACPI processor UID */
> +};
> +
>  /***********************************************************************=
********
>   *
>   * RHCT - RISC-V Hart Capabilities Table
>
> --
> 2.43.0
>

Thanks,
Yunhui
