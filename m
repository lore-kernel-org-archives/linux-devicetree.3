Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FA13AD501
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513981; cv=pass; b=CIAYPQmja4kZVte11fiopIyop7SnKV2Z+LDvr5i1Jxz4TQj1kpzbnedFhx9EVmnCNMkr4MEcIH2qyLCmEwlfRlqem1qiAKxLDmDGHYEvAgBvHNZFs1Dg0ueU65WvWwjApicDiVnYQgpoc+cBADGGmyB6BKG8l/zZ1culRe4EUyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513981; c=relaxed/simple;
	bh=y1dooAU1BdG3t77Ol/IyqzrIRk3RQ4SObO3++MueMSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2lMGi36aby4ENuC/XdATLtdxiSuC9CMONL3ys2JCS8ixaRKsRaw22yrfqjaL5bOTdaMyG/vt5ZxuFs9Gm18al3NV6Ti92amUH4DYn+hlR0bxu0pim1UGYYJtrJKM15Aj9W74HfjQCB1WXeiaFXwNvL4ZGnnuRwUwr6c4gQOG0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=H5E09jiR; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="H5E09jiR"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d75ed779bfso543539a34.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774513978; cv=none;
        d=google.com; s=arc-20240605;
        b=IMzUUF5t6+FAIxQ6e3acDSKZhaLly+pNwFE2LnTxCwI4frMmMTj+lbV7utMdnDqh8K
         fwe8o9R7DjtP3ChAawRkVK9hnqxBEEoBX7ssF/l6LcrAm61UVFJ4hLUnIzRFNUDjK8GE
         xZbG38H7AL/xTmY01LgBtNY0yZuFCFzEGNptmOnnKSi5+/5oU78d0EBnl5A6wAGbJDH3
         jU1KNlPX38MVD07Yc6r/0vw+1M+yP8vqS082fVmgfNRVHkEnnYfI5Z31v2dirdbVdBZD
         iGw4G2FJHnoH2ryCjgg07OD3QLQLD57FX+yUJH3k4JwCtbwyv6ZA3vRYHUrhUmItjmzF
         Ry+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mePLymdm4A/01lEY7TSspPJxPyHHrcq2b7WusiYGL2A=;
        fh=FV0oR85KM62X0BZxZwwc4Vev0EkQz6tMtnvmEpbHMLw=;
        b=OYWOYZSbB6TSfJw57LuvK3vF9QWc/AKhCU62SuxQzbGALVmVJyySkDcwa3uDC9/s48
         tl4pdy4tN0IDIC6tG3Oxe6W15OgGNbRvQNx7fVnLpse70dGz/3IUKrm70C79Bm5/DIT2
         o2ELnjJ5SdAJAPmhl5afF//Jc2WhDS00B62WRBG37TAJjPpc7KSAA2RdcBnMfd8yeT33
         cx0OEFP+PJhHcrmtIujdpaxSJzoTcpdSjKAqTE4pA/5a78oLufJRupa/NBH/LvIFKaK+
         r1VSr5lQDEk+NBTinqNJPa8OaoNV9LffLuUgvrWGrFy4VTdo7DiUdq33UnENnqmS7oGy
         E6CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1774513978; x=1775118778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mePLymdm4A/01lEY7TSspPJxPyHHrcq2b7WusiYGL2A=;
        b=H5E09jiRGdFfXO174HqKQe2ylSV8/+PQLhgLEfytIIUYJDgjgVDlgzmFjTxLHOErr1
         5Z3qNYJwXOtvhOOJfYOHwCmsWx5GGVcm8DSqMc8jKJ0MOjoFfojt1/wwE2uQhsnNITBj
         TqD2WR3YDeOfr0DYZu9kXqJhIY6Rl/PmTQaKzj2kLH8Zd8sADH4iA2ZX89KFvTskAkiP
         pyQd0niCoDOMqcBEJun11z2SNo2gF1hRLCpqAPz80sjfwUB2CrrjNyV1kVqx5h7Xc4FD
         AHhifJQRb+PCvW4A9u2VRMLCfHKVQhGM6bAA26WvTbwxFFgpH29pXWlu8l2Fn/gbmyAt
         UokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513978; x=1775118778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mePLymdm4A/01lEY7TSspPJxPyHHrcq2b7WusiYGL2A=;
        b=Hb6GMfk64e9y1+/cHI2QNd+uO8xJVoIFWFgP0/6mMM//Y4UdLnXXVzIIVnEAchJU9t
         rlCZjWH5CF8MkGPQ1Q2aQg44im8TWvrzCFDuDn6k6bqgnolLsvVUQ0LhduD1getugB7g
         qY792Z7dGFTLss/GOssKK0QY3BxdAWhqzXytBLn6d0krwGYTavJAUXHFkAk0Z/devsVj
         f6fV4v5kOJeMu0kyqJr7MacS4uZ98p4FxECze9d6YFBO2SQtkAjRo079J4vJQ4rKwxVJ
         FXWo7OW7EIWTRzEDK/d1NPRDOo+o7WLCplkd9J6SztUpborL5wrwPOhI+f+MXB2St7uK
         UZ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW57I3824pO1AYyJDZ2J8N8UX6+S3qeCMCzhUfiKizFRpd7UV2eR1sFPMWmSW+jPnwJ35QaQQKat47F@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp8QqtDtwUSXSSlrXGcg+FFmHGD9ik8N6gq4I632LDudT1HAds
	EJMbZysXbDGoJvFa0hTCyDFXi/EnT6JWLFljBWxOVi72ymNjTYufiXvxsuMsTkArR4e14U+zxgT
	yYc6CJuptHG5e/m7ujSI8M7dYrfl5Aag/goQ0ihPf0g==
X-Gm-Gg: ATEYQzwKusDhd8m4wvq5wmSDa559hLBv++lsfTypU7BPcALN4OFTnXyJHV0ngTt0fN1
	52gdT66GSIWjTdkbK+/ONcGvhjuuqk7jaCGvIM4WcJOk9+It1ZQ1KhXlVg1i0S+HYhyyW9r2Drs
	ptua6QhxNKSu7HCrDW1SJL23GjDPDZ1/sX+1W3IkO7zcKNSCL5J/LP5y6CaIcKOGtTsqFPsTvOi
	WVSyN3UBMt7ypKB0j/AbQtRTydc6O2Bg29GBXaC183I53PDXTCuznoDbhTeDOj4RtlhIZAHUvoC
	wUMGTw==
X-Received: by 2002:a05:6830:3988:b0:7d7:de7f:1216 with SMTP id
 46e09a7af769-7d9d6a2ee3fmr4210937a34.34.1774513978540; Thu, 26 Mar 2026
 01:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-6-dca586b091b9@kernel.org> <CAEEQ3wmuAnHU1VBFDwbCBFb8j63ZcizJ3jEC2SiVWnoMPc4=SA@mail.gmail.com>
 <acOFef6f9og1hft2@gen8>
In-Reply-To: <acOFef6f9og1hft2@gen8>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 26 Mar 2026 16:32:47 +0800
X-Gm-Features: AQROBzDH3jYcjM2CiSfjVYp26hEHF6X2ANXFbNRUWifhxguxrWvAlswpTfv9uY4
Message-ID: <CAEEQ3w=zV1k+uea5D9tnO=O5X5LQUpyNVZi8V8TOANxXJQbg=w@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 06/17] RISC-V: QoS: define CBQRI resctrl
 resources and domains
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

Hi Drew=EF=BC=8C

On Wed, Mar 25, 2026 at 2:49=E2=80=AFPM Drew Fustini <fustini@kernel.org> w=
rote:
>
> On Wed, Mar 25, 2026 at 10:31:39AM +0800, yunhui cui wrote:
> > Hi Drew,
> >
> > On Thu, Jan 29, 2026 at 4:28=E2=80=AFAM Drew Fustini <fustini@kernel.or=
g> wrote:
> > >
> > > Define data structures to encapsulate the resctrl resource
> > > and domain structures.
> > >
> > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > [fustini: rebased current upstream]
> > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > > ---
> > >  arch/riscv/kernel/qos/internal.h | 27 +++++++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > >
> > > diff --git a/arch/riscv/kernel/qos/internal.h b/arch/riscv/kernel/qos=
/internal.h
> > > index ff2c7eff50be..c0402dd06cfa 100644
> > > --- a/arch/riscv/kernel/qos/internal.h
> > > +++ b/arch/riscv/kernel/qos/internal.h
> > > @@ -65,6 +65,11 @@
> > >  #define CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT   2
> > >  #define CBQRI_BC_ALLOC_CTL_STATUS_SUCCESS  1
> > >
> > > +int qos_resctrl_setup(void);
> > > +void qos_resctrl_exit(void);
> > > +int qos_resctrl_online_cpu(unsigned int cpu);
> > > +int qos_resctrl_offline_cpu(unsigned int cpu);
> > > +
> > >  /* Capacity Controller hardware capabilities */
> > >  struct riscv_cbqri_capacity_caps {
> > >         u16 ncblks; /* number of capacity blocks */
> > > @@ -125,4 +130,26 @@ struct cbqri_controller {
> > >         bool mon_capable;
> > >  };
> > >
> > > +struct cbqri_resctrl_res {
> > > +       struct rdt_resource     resctrl_res;
> > > +       struct cbqri_controller controller;
> > > +       u32 max_rcid;
> > > +       u32 max_mcid;
> > > +};
> > > +
> > > +struct cbqri_resctrl_dom {
> > > +       struct rdt_domain_hdr       resctrl_dom_hdr;
> > > +       struct rdt_ctrl_domain  resctrl_ctrl_dom;
> > > +       struct rdt_mon_domain   resctrl_mon_dom;
> > > +       u64 cbm;
> > > +       u64 rbwb;
> > > +       u64 *ctrl_val;
> > > +       struct cbqri_controller *hw_ctrl;
> > > +};
> > > +
> >
> > Can we trim down some fields? For example:
> >  struct cbqri_resctrl_res {
> >         struct rdt_resource     resctrl_res;
> > -       struct cbqri_controller controller;
> >         u32 max_rcid;
> >         u32 max_mcid;
> >  };
> >
> >  struct cbqri_resctrl_dom {
> > -       struct rdt_domain_hdr       resctrl_dom_hdr;
> >         struct rdt_ctrl_domain  resctrl_ctrl_dom;
> >         struct rdt_mon_domain   resctrl_mon_dom;
> > -       u64 cbm;
> > -       u64 rbwb;
> >         u64 *ctrl_val;
> >         struct cbqri_controller *hw_ctrl;
> >  };
>
> Can you explain why you don't think these are needed??

The functionality works well without those fields, feel free to try.

Btw, when do you plan to send the next revision?

>
> Thanks,
> Drew
>

Thanks,
Yunhui
