Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF37B1A3166
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 01:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774402476; cv=pass; b=fni0XWH1krnYx2KkRolvuJ8fo1pRiGkQ9HcWUvDdFPhWjh3YpSx3jtvp/B3HtF5I90I9MAWvkwnC0fz4yra+k3GQNdgSCYSLo2pBvDhOIaYwsoOOKIi+GcXym0SgnKx6Pphr1tKJ+MYCzwqkx7nCL1xQRdFXeDu4o4J55HSf11g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774402476; c=relaxed/simple;
	bh=rdSvCP52jZz7SDxDuWHrEpzIrkFP71B3BSjjo54bZpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khlRsvZ2YE1rEIjShObmtNLgc61PDE27lul5kg3vD/NEGu6d6bRVBOyfPjJBBfvpXOPc+HTqGJ+WbXkqN2o5LCsxe7uN/QvmfqYk+2JVHdZynA+ZRteHV4kEMbPkLQjZvNpdK3HXtopnvGzfbUp2fcCSploXSNZdS8y/DczvO3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WBenOCrX; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WBenOCrX"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d7eb85fb81so2102497a34.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 18:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774402474; cv=none;
        d=google.com; s=arc-20240605;
        b=ewltiqUH+SmASsjyys8mXoyBp5ZE3WHEcgKT2fXsO27sUnvtITXmYnlGqn/EcFOVV+
         dROp8Q9B9dXLPV+hgz0tCLU0NjXdHlHmpfjlD2u9aK7h7SIj6kqWwhwJtmTTGZY+7foh
         bD9BlZPA7FjlS+fU08dmzOeEJsQOdeIXrXEr3KntTSYbPBQVhLd+IgQYw93cxtSl0uzZ
         akaK7KmeCltlzcReCuRqpcmsYG2y6b6Qv8nLw21ORA2eI5QWdLsX/9NsoNVPkXHj9hrF
         F1CejJIfZjD1QM6U4lgDljRQ0QWvXclJ9fiE3tyw2XZvAndPd6sYl9W5gZHNidmpWMJR
         5hBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMJSXWHElAalaVGIQXtj4XQ2QzHBElxpVqzpZTWIIiA=;
        fh=Nm1S2NaAkevW3ueyOGfwhJAbXCP+Xr/j8GupyXVKdaY=;
        b=XrzOQKuNzkcYTiBqjVd80oJHsSpjEAj3zzrxAKRMwPRnNHycindQNJU0JLhia/9DxD
         QWyKt2m1mSyyK56ZRHcWD9MOUlocwjNPfqjFs+nRo5WUEOKCXuIocLzNnuZnY52pLvep
         FrrWkv3KwP3vFfdOly7ecKdCcmilUZ1Dy6qLx7daWJZqjFiW+48RRNaqiZiomyp0Cku7
         2n/jJmh3Zvyz3dtdrAj8AzUhdaB5KZ4iwm0tTqsu2UJL9hXF+qjb0LUyMLpPv1Lj6rJY
         NnUiipacIW44UthCboLmzhUu+oxsXFF3B25C7xmIXzsTYw9lKJw44gK/FA1ll1sSG4jz
         w+yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1774402474; x=1775007274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMJSXWHElAalaVGIQXtj4XQ2QzHBElxpVqzpZTWIIiA=;
        b=WBenOCrXnoa+h7DNAg7AN2od2WNw2ODn5uiVHl32LOAk0cJLIKcbtJyrp4oYobz66k
         htENFHrNOd2XjwYiFc0Gi0gBmTNrNLCv9C6M2EW+auQketqk9cN64XXLIwsXXfClITUY
         lYm0G5W2feJy+7bnDXg1N3UY9BtRyr66HJ87kFBI+M8q8lU/Gu0dTXXzCdTKIH2e4wi6
         Hv7GWTaEOz1637xSBZHxIODGbbwQE3ZeNiVr6FlCf1asE2A7U1E+8Dw4aY0xBon9AU8n
         OwBwHLgNMwMp6d5OTG3WhyHTQsOLBRtaQtDkcLC7YnsYIVokw4lnD0fdtWPs/r1RMA0u
         FJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774402474; x=1775007274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nMJSXWHElAalaVGIQXtj4XQ2QzHBElxpVqzpZTWIIiA=;
        b=pcaMAteQ6opurwAXMgMOYhCaR1nJX2HNetsIZ1EqbzWcrzBbbBbVrwW/hmM2QrRx1f
         w1M9WOD3DjbPYGMZjziqOrmer6rYir0v1f4qMP1iWoHGSrq6Ba/5GAUVlANcckNJMTgN
         Kx15OTcw4Q361AhjJaTm4Hvj0yxbDJkRS66JhyQxVkClfY3TokN8zWxowLWBs4yguMqw
         nHM/IO3kYBuP36WH4eKJ9nqWq3DRERtBDwqpJTWkKp/wYsiOr/hvT2Ip2GTEyI4tomOh
         2F751GNzIoa7lOCUV6e+mH5xgPdgco+GN+BOeX01tGayq6jcOSMdDBkQwdrGFGg5VPtz
         KJlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXFNUm5ATSDRdWulacaj5Fs3r+kCAe5xo6EjFDkmUmuPRAtYOgq9v0Xg8PAAIjqWxYiSwUG8hXrB2S@vger.kernel.org
X-Gm-Message-State: AOJu0YwQIDE5WigKGt13zaB1duARrB7a9IZHniXX4tVSN+y2xbocRAHU
	rDWWQTKLHzbWrh3bExVuQaSZcZcOmRODzTc77W3RO8GyQddLJOMLDLvMAqqSslNMZ0I31Mz3Dzl
	XxLANxbobEgcx97ziTM4sf3NLdAuiN6z0IqRyJ5HOUQ==
X-Gm-Gg: ATEYQzwwl4D3S9acKf1jrZHM/pT2mcb69v6uQ6oDrJyqChX0F0zuHwwr/8Dv138Zr7K
	5Kfb9tk+uLI5ADooAllPnTj6Bg6eU7KFQpEhyAGE1W9NtabcdDyl9FIuA1ffmSvJnrYFV1qw7vH
	uGeGsakyZ/uvrlK/KuWRDlY1WkzfUTaEhHNFluLs+/qSemmzad1xoUqq+FolYxHR1TAZMoIImJF
	Pl7YrIhJhtQ2QsqdGnYMi19md+7Y4Xlzpwl01E1PdTa9cziKjPr9smpV0xNi+i21tn0PMEyEHT6
	nr+s20jPqYH4S/8VNf8DNACq
X-Received: by 2002:a05:6808:1786:b0:467:254:ba8 with SMTP id
 5614622812f47-46a5c559a3fmr976022b6e.11.1774402473754; Tue, 24 Mar 2026
 18:34:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org> <20260128-ssqosid-cbqri-v2-13-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-13-dca586b091b9@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 25 Mar 2026 09:34:22 +0800
X-Gm-Features: AaiRm50-EQhX5eRfy8n3fhONNShK5GtzIxF13pcKegKveCXY8vae28POGPRFJcE
Message-ID: <CAEEQ3wka26n8koB3tErRE=rgE1Bxnn7PDCjnXp2j67gdkp-=Zg@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 13/17] acpi: pptt: Add helper to find a
 cache from id
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
> Add function to find the pointer to an instance of acpi_pptt_cache.
>
> find_acpi_cache_from_id() is based on find_acpi_cache_level_from_id()
> from commit c4170570cc7f ("ACPI / PPTT: Find PPTT cache level by ID") in
> the morse/mpam/snapshot/v6.14-rc1 branch.
>
> TODO: find_acpi_cache_level_from_id() has changed since then so this
> function should be updated. In additon, there may be a simpler way for
> acpi_parse_rqsc() than adding this function to get a pointer to
> acpi_pptt_cache.
>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  drivers/acpi/pptt.c  | 63 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/acpi.h |  8 +++++++
>  2 files changed, 71 insertions(+)
>
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index de5f8c018333..d1002673dc39 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -1063,3 +1063,66 @@ int acpi_pptt_get_cpumask_from_cache_id(u32 cache_=
id, cpumask_t *cpus)
>
>         return 0;
>  }
> +
> +/*
> + * find_acpi_cache_from_id() is adapted from find_acpi_cache_level_from_=
id()
> + * introduced by c4170570cc7f ("ACPI / PPTT: Find PPTT cache level by ID=
")
> + * in the morse/mpam/snapshot/v6.14-rc1 branch.
> + *
> + * TODO: find_acpi_cache_level_from_id() has changed since then so this
> + * function should be updated. In additon, there may be a simpler way fo=
r
> + * acpi_parse_rqsc() than adding this function to get a pointer to
> + * acpi_pptt_cache.
> + */
> +struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_id)
> +{
> +       u32 acpi_cpu_id;
> +       acpi_status status;
> +       int level, cpu, num_levels;
> +       struct acpi_pptt_cache *cache;
> +       struct acpi_table_header *table;
> +       struct acpi_pptt_cache_v1 *cache_v1;
> +       struct acpi_pptt_processor *cpu_node;
> +
> +       status =3D acpi_get_table(ACPI_SIG_PPTT, 0, &table);
> +       if (ACPI_FAILURE(status)) {
> +               acpi_pptt_warn_missing();
> +               return NULL;
> +       }
> +
> +       if (table->revision < 3) {
> +               acpi_put_table(table);
> +               return NULL;
> +       }
> +
> +       for_each_possible_cpu(cpu) {
> +               num_levels =3D 0;
> +               acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +
> +               cpu_node =3D acpi_find_processor_node(table, acpi_cpu_id)=
;
> +               if (!cpu_node)
> +                       break;

break or continue?


> +               num_levels =3D acpi_count_levels(table, cpu_node, NULL);
> +
> +               for (level =3D 1; level <=3D num_levels; level++) {
> +                       cache =3D acpi_find_cache_node(table, acpi_cpu_id=
,
> +                                                    ACPI_PPTT_CACHE_TYPE=
_UNIFIED,
> +                                                    level, &cpu_node);
> +                       if (!cache)
> +                               continue;
> +
> +                       cache_v1 =3D ACPI_ADD_PTR(struct acpi_pptt_cache_=
v1,
> +                                               cache,
> +                                               sizeof(struct acpi_pptt_c=
ache));
> +
> +                       if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
> +                           cache_v1->cache_id =3D=3D cache_id) {
> +                               acpi_put_table(table);
> +                               return cache;
> +                       }
> +               }
> +       }
> +
> +       acpi_put_table(table);
> +       return NULL;
> +}
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index fbf0c3a65f59..fee6a5059a46 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1546,6 +1546,7 @@ int find_acpi_cpu_topology_package(unsigned int cpu=
);
>  int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
>  void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)=
;
>  int find_acpi_cache_level_from_id(u32 cache_id);
> +struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_id);
>  int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus);
>  #else
>  static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
> @@ -1570,10 +1571,17 @@ static inline int find_acpi_cpu_topology_hetero_i=
d(unsigned int cpu)
>  }
>  static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
>                                                      cpumask_t *cpus) { }
> +
>  static inline int find_acpi_cache_level_from_id(u32 cache_id)
>  {
>         return -ENOENT;
>  }
> +
> +static inline struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_=
id)
> +{
> +       return NULL;
> +}
> +
>  static inline int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id,
>                                                       cpumask_t *cpus)
>  {
>
> --
> 2.43.0
>

Thanks,
Yunhui
