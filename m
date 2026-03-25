Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58172609C5
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 01:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403332; cv=pass; b=T8t/GEbbhR5cti3o9BUR71kiXORVSPor0lC314FTEwCXrRYRS0ayRrZMdjKTaxftfsFDe7kxFnA+XhEX5WpoBdo4VpMJMd+8kJQuIxdNlNTSV8GtsrL6mdQAyYnuUd6jh3qK+bTygjpWQKBdG5Q4ScMxvO4y2jcRfQVYg0YQKBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403332; c=relaxed/simple;
	bh=8j/1RkEqSK8cDEtrMb0SmRPLJt1HSounD9iRf5VcPkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbYPJbGP49YyHapkwPMGOOYvLovZcOopo2ffteCeYq3/M5akJCX4ZUGPaUb9hQL1JTBfcGspT5FDS7ZbsYj/Ex3a9tEImrcrD2an//MPRJPuU1A40j6AxfDenqpF4L/vjZuHzSXSFoQAH5ifupORScGW4C/PqSe5EfSwkyIcaDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Q5jGkkB5; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Q5jGkkB5"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d750eeaec3so1933919a34.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 18:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774403328; cv=none;
        d=google.com; s=arc-20240605;
        b=gik1ALSwbzMgdRJ5vsnXhv7pa76it1onj5m2yYTI4GM0A/dFjSjoGkyS5xbZiyVlPf
         zlsgrkjJpGzqgT8sQulQpa9ePt1Xyb6QepAM1foGADdVfcxrBb6hFtBIp3eIVWBsBt7j
         zQELNJL7GeMB73mmysz8rbkBB8fKwKz1F/RXCGKcmwKBV3FWhua50iTw5mRD8rJwlbMP
         x28O8B1KmpeabUWYLqBpV6GRWvnoJ2eslntEnDAlKuTnUV9ZxT0EfgoIYaj/+mASJMRZ
         FWrYjegY2whzaMYSd6HKaWqkfblBgZVCEJlAKZ3ubkEEzLAzH2LEYOcs3ubGC3wStDP8
         eSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vGfOtY7DNTv8x0CTjSLzY868SkapZdn6D7qzRjb9QRw=;
        fh=YZDeDe/9RgM+QHpm8qzgcBBy3QdNTTeiacM3VtdWQKc=;
        b=AbqRiMBDo5Bwci2d0QAg0yAimipeuRwSbRiIkEqQO6uriXBniRVaofKPJVMccH2fpo
         /dee9Fm8hlxMC2U2WRZrXPdkWSAb+lsbxchCpoeNEW7NGGdp9LCD4bAHUUFz92gC5SDv
         VyRkitNLG9hiAGJKA9RYmnCd95bdlsz9j2IfZZTpP2yntfcWIXGK5srCSBgUowyeN9rd
         bFbybSULWkol7oSS9zQ096OOpytjYoJ2adXD9f1uDveAkKLkOPGe64EnXyPb8vcMvqvN
         I9/fOfj62F1OKnXwWX/w37xiu+iCwi7dtzdlGWmj9cQq+8Tr7UVJz7uhAeBJKWqwOESW
         QJTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1774403328; x=1775008128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGfOtY7DNTv8x0CTjSLzY868SkapZdn6D7qzRjb9QRw=;
        b=Q5jGkkB5llpionInOIj+O4ompG5Atw4xxbCrSL37xMUiCORZ7FQ2cuyLzxuJm1+vRc
         q7aBKK2bNp9lClMZUclvLWPPgeeT33bYhhr4IwmdxxCrG1jBvKqin+4cmLWOse3heu1K
         WZIEGoMAsNdtBrtA09vcTWlJjPfTHlduxTdPCkC1Rdk0THgJYds4n9YvXwUIURWuOJny
         r/rKDqWwhC9ywskIxnH2N0A28zl3ygoFf3wqcuN8byxROlQNUG7tXzHJAP6hYUgugk5W
         iRvc5GepeE+fMNOPSIsZPJugj6j/iRilFRJ4ip1AVNIsKFNazZWaLASZN7HqqHMOtENc
         HSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774403328; x=1775008128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vGfOtY7DNTv8x0CTjSLzY868SkapZdn6D7qzRjb9QRw=;
        b=o39+LseFkdQytwew6+zfyTdvuPTP1TWsY9DZnFDlSVyg1173pnAGWE5DZxbEkWUaJf
         Q8Zfx7gdYtaJOQNHJAOVAFtynCYUvNbDDZ4AqPgBKYy7Smcd/IVMNHrky9s1QJjuEddO
         Te/oZkJ9unSA15jeqNm1UigfB+KaPTNpEAeyjc5Hu2BVGBV3gJ7NmPvVF0fRMbpn6XKd
         3BIcM0zcI/R4SLGDSt6LpP0VNrVr5Psr1nix9Gf+Afn/ChB5kjuBsKJmGC5eVhlsWFRc
         yDNazeoel8ciV1WTiWnBj2tJ1PXYz391TCWW5D6aqyzHFNZ3/iTRi0im9Ohttlq/YuhF
         axjg==
X-Forwarded-Encrypted: i=1; AJvYcCXIfRpQaKl0IQ9jUCeiUYdD1WP9Cjfz164/+oizP3qmyHf5FNylgTfuP1vXuArJcabsUGtEdmj42pd2@vger.kernel.org
X-Gm-Message-State: AOJu0YzwwytNNG6EYoIZKcHt2bKCYyKxWFvrqjLSCDLuypDw+LcxS4zS
	2drvK0M3YksvMiYq+N8J73VXtL8WpqiYzEl7o3Mot+5XitZUOOP+L4tLU9pxEP7gvtLGsRTkXr+
	w5jOu+W3bdFkGulZmv2W7bx6F3vz/qMj5WxpFVmNuCg==
X-Gm-Gg: ATEYQzzM3uM5peMHGo8j/sk9EWyuhuXGkd9tN6JqChJKHj74cEUJ0yH1VJUmVaOpnwd
	yR1Ycjkec/flWJFbe/oXxU6sC2e+GICoJkgqqmh5Ykj8zVHS8qjLe3RdiF/FqYB9mgrN+xOJcG9
	Q8DD6VMh0U7Ylck3nuB4nqnrNtoYXCJeO7DwUqj7CmWrecXUPKGyYvifmHSwCOI4LWZJMD2sySd
	VOwgfSAhlKOlOPl9hNzUKfx7ZGbWGEv6mXfJs+/Nu69/DFxEENG7HnsHZO21aGpmuBcZQIzMq/m
	T10LUX2LJzEyJg==
X-Received: by 2002:a05:6830:44a4:b0:7d7:cb13:3fe9 with SMTP id
 46e09a7af769-7d9d66ebce6mr746710a34.19.1774403328448; Tue, 24 Mar 2026
 18:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org> <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 25 Mar 2026 09:48:37 +0800
X-Gm-Features: AaiRm50a2XpCtEI0EunEN7ujOM94GRAQRhXw7yAPEIMaeAZSdyGXWlKvSXA68yk
Message-ID: <CAEEQ3wnhvV03FYfqBqz8ihyFCcxKS5ztdvCHDF789ubSQAMw1A@mail.gmail.com>
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

The spec appears to specify a length of 2 bytes for this field?


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
