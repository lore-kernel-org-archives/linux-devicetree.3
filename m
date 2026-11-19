Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795086035;
	b=wJB7YIEiar7TUu5p1cndwqPnqX39lFia2cePNZrf7qjXts4jFMrtwuUwxNYTIgWMTcAB
	 ztytvrzKlI1To5LIDOZa5ToB3QU9XPOIp5SAcXh2F8/UblS5qeeMtgsJvufMxOM8l+Fnk
	 AlzD0bWVNeOXyDc0Xsp9vV4eGW9rm8170D2eKgawm8bXuO146Gmq+cklibG7JV4b5WB+/
	 ZM26TQbwkDgu3VQm+a3dl18Zv9lH20H56ILod4dsf3k4c+GbzbcoT7k8tl0IISnUudTdb
	 vFKlBgtNkxfpYRN0eRq9FSstsO5XrQyEgB8IX9mbt/RrTOaWIOm0tdLth2QiH0k7/lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F6y1X7YxgT/qvetOjdraVACUP5Jk6TwGLYcodl3QDzo=;
	b=C0NegMDGmHU1zBpjQKIy/j8ouukcj0ViSe3Yv65KW6ZddaqUXPCyW0exdgD0pvvRSSCb
	 J2KhanbTC+2ZYFN+mfHoq1cVq3xe8Vlll1e5RzIewPHwYhBu523FfDTl3cyuwNm5QZ4wF
	 PchK4G7ZEQ6NJJdEPNWAMoTGJHxl7jo3ARANDMLQPtGL+ZSwJnGYuyQHkPpi4+Hfvrxby
	 XquWK+5N6CnvBnUTx9nFUnlx/2VhrwOZfEeRXXCm7NZaXyNuE4D+ZUSy4v3gUdsnOsqEr
	 tpZPfWlRcicbVZn4gv2fs/kHiaiC7HnmD6ZrN8w2PTe0QFWf884XlthP2ADvGHjhCsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AqsyAZUH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC0606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62BC0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AqsyAZUH
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8629fc8ad64so1166619a34.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 03:00:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795086034; cv=none;
        d=google.com; s=arc-20260327;
        b=DLqTGtMfszRvZYLEqrF9phyMBEhF64NuLfn5Arw7mt5Q/T4kGApNZ/oR2B+CfnEkss
         3gpAkwsQsrTCGlKFAS6As9hCVHWgQEVLwbLJ9kd7ic+nKfBuUclGk1AZsoVj6H/RWDPt
         zN9I9l+j18IQK9zrwHxcU+BSRYQ3t2RaJx5suvS6ueHEeaaXMam9j6PN9EiDFlzU+FiS
         cqRBZ5Efo6LDqNOLerMkQ+7A5yR55GG9hQ21jTe4nFlB7NVC2VlBGy+gpU4IsecYeNId
         7WPK+mZ6Wf4DfkcUBvVfDepTOqDgwjFzciebLK4/X7RGUd6NL/OmZC8YvoQML+TssxL4
         BPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F6y1X7YxgT/qvetOjdraVACUP5Jk6TwGLYcodl3QDzo=;
        fh=q9b3Y8+7SuWTbvAHygSoQm7B3kG8yusOy6aFx3DQXm4=;
        b=YVLIkamXyYP2LcjttENhOPjWCY3BYNjYGXaIA+bXV590+aSaLYqQSNL+L2sEazL5oQ
         1gM8By9EXyHdsaIknkAhqBbUHSGOx8exrjNIgRhbsilwlsMjseRyVMwRPTcWFSc0nksE
         7e2P5nKNQZ5jvKtRhV2em+ZD0PtcI626e0D+Ou/vFeMPgePRccMPs9J26wQYAd9iEevp
         Oour/ifVs6TCpjCTSFUBwyODxwtHYgizmoAlJmeYwyB/tR8a5BARk+dg306OY0GAS3jO
         cqTnKnarAlS7DWABx3E/ukxUsq4R/iTg3paTeAIesOMDL9oIDbboRNClocxuhxHjekrU
         Sy8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795086034; x=1795690834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6y1X7YxgT/qvetOjdraVACUP5Jk6TwGLYcodl3QDzo=;
        b=AqsyAZUHBX7DqoVcv2Aw4Az9jP8C0mP5bUKEopn8/pBFIpaNnRo6D/FjmLc/3WFO+n
         SOJH8FCxMTrXzdGp8tCp0qjsc/43QCPrL9o3VAlkaAewObMGTjmFI4aOKlW0rL5sFkwq
         t5rCRSIXtQ+24cwM2hSEblwGTqaZSICgekqt3Nh7xUebFxMCWYl9atux89YXu6mmlmoH
         vTytKdl344fBLoHJx4w5Z/ViyzhnDBm4xMuw65LOjOp3dogVsneT8HC75kfeawtmxXuR
         rTDaFnivdexnphA+qjYP0l8qZPCG3mPoS3c2SOLf39mrjCa6SXqrrmo/ebchz3QhUF6E
         +0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795086034; x=1795690834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6y1X7YxgT/qvetOjdraVACUP5Jk6TwGLYcodl3QDzo=;
        b=tIcaglfROx8BV52gwHp04Jnfl0ljxoqIQzxVJhhQ9n0Oi0bzKshsWCzPQHZnFfeBtz
         EPya06yeMwqbkEkPNdEO+7inGTI27Gszog5oFvBSIqGyWOEnQciVDh8xwi8DBiSZJDoy
         zH1GC4fM+Wy3LRV3Oy4GnkVAUR+s4JmMJEWy0p/FSFA6dyDw7YnYlpAMynaMDwTZN2NR
         x6h7iEHy6+87CrZ8FMLKnjMNcz7xHzoLBJTn+nGb17E9F8Q/MChPP/wA14CK0W78Fdsh
         yICTWtdZDfpTy9eXB6hI3J9+DQsEiHIAJ5Ls3KhHM3ahgM1bWwdlxhDhthC9/sNeypnK
         PTsg==
X-Forwarded-Encrypted: i=1; AL+hErE+iS71UAgOIk5FuXoW00JIfqmR7oHtd892YY/5x+I1/xybhUb9TwPtVbX7DKVHCiF7m/DrEQ8oJLyp@vger.kernel.org
X-Gm-Message-State: APuU4Z+5EUxAIjxZ+zvhHiCDSnThpoX01a5+tevU5uKAUdUEOdIs+FUx
	9m/mW2ABRmTAZ3KSLenuZ0h0Eht4AYbKu/eIZSnZoSYmTJvH8o5nXuJt011oFdrIRaoXMlCVfLz
	4iy2C1U7yK6oAtJcFn1xy1eW2niveOFWxHcBHuaRHbg==
X-Gm-Gg: AYBFou3E9GA5QphMpr0REZycDOG9gzjFefzTTZriqbYmX5XWI1aqa6CRwS3R37uJua1
	9RPBnXXTjAXK2sB+pDxc2jDtDL/45ipsvs4y8hdEKmg1kzS1nuvbQWNuWM46g5bX9bmUdVHbWUu
	U1Oftq+cGmQDcvwc9hZuk8X1eikIeAtHR+p6gNMboS1IIy2Veip0UDB+V3e/8PpgF4P5SARpXL0
	XyUDo5WA9Ytc7lRKBzRgypXTnI0SGVE5m1jeVEVZGY2bNZXKZWDAO7uxLW9q738ooKZ11ljslRh
	ViMJg5X5LF5LSTG5swCMytObmP4U0kBBpRrmpTCvvsQeXwzbj5vft/ueEytYhGruCBbs5eYrNuS
	EAWPm9FO8yYcdr1csE68IoP5lDGfIAF5fNQyXNBx05zk=
X-Received: by 2002:a05:6830:2549:b0:85d:4ed7:1caa with SMTP id
 46e09a7af769-862f08cd866mr8439412a34.29.1795086033987; Thu, 19 Nov 2026
 03:00:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org> <20261119000846.776930b3@jic23-hlaptop>
In-Reply-To: <20261119000846.776930b3@jic23-hlaptop>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 19 Nov 2026 19:00:21 +0800
X-Gm-Features: AclHuK-ZS4CtfVSYoecAopleoJOI4rSJiggklncDsYMDaJRN7z2tsew2GDgMPx0
Message-ID: <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 1/5] riscv_cbqri: Add capacity
 controller core
To: Jonathan Cameron <jic23@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Adrien Ricciardi <aricciardi@baylibre.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
	Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	Fenghua Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, 
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, 
	James Morse <james.morse@arm.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Peter Newman <peternewman@google.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>, 
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Thu, Nov 19, 2026 at 8:09=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sat, 14 Nov 2026 14:06:21 -0800
> Drew Fustini <fustini@kernel.org> wrote:
>
> > Add the core for RISC-V CBQRI capacity controllers: the register
> > layout, the capability probe, and the allocation operations that
> > program a capacity block mask for an RCID and read it back.
> >
> > A discovery layer maps the register block and describes the controller
> > in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() probes
> > the controller from that descriptor and adds it to the controller list,
> > which stays private to the core. The core owns the controller state
> > after registration, so nothing in it depends on how the controller was
> > discovered. The caller keeps the register mapping alive.
> >
> > Tested-by: Zeng Heng <zengheng@picoheart.com>
> > Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
>
> A couple more drive by comments.
>
> > diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_de=
vices.c
> > new file mode 100644
> > index 000000000000..5522872f5cc1
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_devices.c
>
>
> > +
> > +/* Read the configured CBM for closid on the AT half via READ_LIMIT. *=
/
> > +int cbqri_read_cache_config(struct cbqri_controller *ctrl, u32 closid,
> > +                         u32 at, u32 *cbm_out)
> > +{
> > +     int err;
> > +
> > +     guard(mutex)(&ctrl->lock);
> > +
> > +     err =3D cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT,=
 closid, at, 0);
> > +     if (err =3D=3D 0) {
> > +             /*
> > +              * resctrl exposes the CBM as a u32 and cbqri_probe_cc() =
rejects
> > +              * ncblks > 32, so the mask fits the low 32-bit word of t=
he
> > +              * cc_block_mask register.
> > +              */
> > +             *cbm_out =3D readl(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
> > +     }
> > +
> > +     return err;
> Unless this gets more complex in later patches I'd do
>         if (err)
>                 return err;
>
>         /*
>          * resctrl exposes the CBM as a u32 and cbqri_probe_cc() rejects
>          * ncblks > 32, so the mask fits the low 32-bit word of the
>          * cc_block_mask register.
>          */
>         *cbm_out =3D readl(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
>
>         return 0;
>
> Just to keep error handling out of line and that
> comment block less indented.
>
> > +}
>
>
> > +/**
> > + * riscv_cbqri_register_cc() - register a capacity controller
> > + * @info: registration descriptor. info->type must be CAPACITY. The re=
sctrl
> > + *        glue maps info->cache_level to the L2/L3 resource and uses
> > + *        info->cache_id as the domain id.
> > + *
> > + * The caller resolves the cache level and id from its firmware descri=
ption.
> > + * Domain membership is resolved per CPU at hotplug, so no cpu mask is=
 stored.
> > + *
> > + * Return: 0 on success, -EEXIST when a controller for the same cache =
level
> > + * and id is already registered, or another negative errno on failure.
> > + */
> > +int riscv_cbqri_register_cc(const struct cbqri_controller_info *info)
> > +{
> > +     struct cbqri_controller *other;
> > +     int err;
> > +
> > +     if (!info->addr) {
> > +             pr_warn("skipping controller with invalid addr=3D0x0\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (info->type !=3D CBQRI_CONTROLLER_TYPE_CAPACITY) {
> > +             pr_warn("register_cc called with non-capacity type %u\n",
> > +                     info->type);
> > +             return -EINVAL;
> > +     }
> > +
> > +     /*
> > +      * SRMCFG encodes RCID in 12 bits. Reject an out-of-range count r=
ather
> > +      * than let FIELD_PREP(SRMCFG_RCID_MASK, closid) truncate it sile=
ntly.
> > +      */
> > +     if (info->rcid_count > FIELD_MAX(SRMCFG_RCID_MASK) + 1) {
> > +             pr_warn("CC at %pa has RCID count %u beyond the 12-bit SR=
MCFG field, skipping\n",
> > +                     &info->addr, info->rcid_count);
> > +             return -EINVAL;
> > +     }
> > +
> > +     struct cbqri_controller *ctrl __free(kfree) =3D
> > +             kzalloc(sizeof(*ctrl), GFP_KERNEL);
> > +     if (!ctrl)
> > +             return -ENOMEM;
> > +
> > +     mutex_init(&ctrl->lock);
> > +
> > +     ctrl->base =3D info->base;
> > +     ctrl->addr =3D info->addr;
> > +     ctrl->size =3D info->size;
> > +     ctrl->type =3D info->type;
> > +     ctrl->rcid_count =3D info->rcid_count;
> > +     ctrl->cache.cache_id =3D info->cache_id;
> > +     ctrl->cache.cache_level =3D info->cache_level;
> > +
> > +     err =3D cbqri_probe_controller(ctrl);
> > +     if (err)
> > +             return err;
> > +
> > +     /*
> > +      * alloc_capable comes from the probe above and rcid_count from t=
he
> > +      * discovery layer. Two RCIDs are the minimum for a useful system=
.
> > +      * resctrl reserves RCID 0 for the default group, so one RCID has
> > +      * nothing to allocate between, and CDP would halve it to zero.
> > +      * Reject fewer than two.
> > +      */
> > +     if (ctrl->alloc_capable && ctrl->rcid_count < 2) {
> > +             pr_warn("CC at %pa is alloc-capable but has fewer than 2 =
RCIDs, skipping\n",
> > +                     &ctrl->addr);
> > +             return -EINVAL;
> > +     }
> > +
> > +     guard(mutex)(&cbqri_controllers_lock);
> > +
> > +     /* The resctrl glue keys its domains on cache_id, one controller =
each. */
> > +     list_for_each_entry(other, &cbqri_controllers, list) {
> > +             if (other->cache.cache_level =3D=3D info->cache_level &&
> > +                 other->cache.cache_id =3D=3D info->cache_id) {
> > +                     pr_warn("CC at %pa duplicates the L%u cache id %u=
 controller at %pa, skipping\n",
> > +                             &ctrl->addr, info->cache_level, info->cac=
he_id,
> > +                             &other->addr);
> > +                     return -EEXIST;

A controller with the same cache level and Cache ID is not necessarily
a duplicate. A distributed LLC may have multiple physical controllers
managing the same logical L3 resource.

Matching controllers should instead be grouped into a logical component
keyed by (cache_level, cache_id), with the physical controllers kept in
a linked list. User space would see one logical controller as a single
resctrl L3 domain, while the update path would iterate the list and
program every physical controller.

> > +             }
> > +     }
> > +
> > +     list_add_tail(&ctrl->list, &cbqri_controllers);
> > +     retain_and_null_ptr(ctrl);
>
> Common trick for this is something like:
>
>         list_add_tail(&no_free_ptr(ctrl)->list, &cbqri_controllers);
>
> because it couples ownership passing with stopping the autofree
> magic.  I'd personally only use retain_and_null_ptr() in cases where I ne=
ed
> to check for success of the ownership being handed off.
>
>
> > +     return 0;
> > +}
> > diff --git a/drivers/resctrl/cbqri_internal.h b/drivers/resctrl/cbqri_i=
nternal.h
> > new file mode 100644
> > index 000000000000..c3e39e6d30c5
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_internal.h
>
> > diff --git a/include/linux/riscv_cbqri.h b/include/linux/riscv_cbqri.h
> > new file mode 100644
> > index 000000000000..b0daa1a7e42f
> > --- /dev/null
> > +++ b/include/linux/riscv_cbqri.h
> > @@ -0,0 +1,49 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Public registration API for the RISC-V Capacity and Bandwidth QoS
> > + * Register Interface (CBQRI) core. Discovery layers call
> > + * riscv_cbqri_register_cc() to hand a capacity controller descriptor =
to
> > + * the core, which owns all subsequent state.
> > + */
> > +#ifndef _LINUX_RISCV_CBQRI_H
> > +#define _LINUX_RISCV_CBQRI_H
> > +
> > +#include <linux/errno.h>
> > +#include <linux/types.h>
> > +
> > +enum cbqri_controller_type {
> > +     CBQRI_CONTROLLER_TYPE_CAPACITY,
> > +};
> > +
> > +/**
> > + * struct cbqri_controller_info - registration descriptor
> > + * @addr:        MMIO base address of the controller's register interf=
ace
> > + * @size:        size of the MMIO region
> > + * @type:        controller type (capacity)
> > + * @rcid_count:  number of supported RCIDs
> > + * @cache_id:    cache id used as the resctrl domain id
> > + * @cache_level: cache level (2 or 3) the controller backs
> > + * @base:        mapped register block, which the caller keeps mapped =
for
> > + *               the life of the system
> Out of order documentation is unusual.  Why?
>
> > + */
> > +struct cbqri_controller_info {
> > +     phys_addr_t                     addr;
> > +     phys_addr_t                     size;
> > +     void __iomem                    *base;
> > +     enum cbqri_controller_type      type;
> > +     u32                             rcid_count;
> > +     u32                             cache_id;
> > +     u32                             cache_level;
> > +};
> > +
> > +#if IS_ENABLED(CONFIG_RISCV_CBQRI)
> > +int riscv_cbqri_register_cc(const struct cbqri_controller_info *info);
> > +#else
> > +static inline int
> > +riscv_cbqri_register_cc(const struct cbqri_controller_info *info)
> > +{
> > +     return -ENODEV;
> > +}
> > +#endif
> > +
> > +#endif /* _LINUX_RISCV_CBQRI_H */
> >
>

Thanks,
Yunhui
