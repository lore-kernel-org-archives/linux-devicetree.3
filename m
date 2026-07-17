Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445083EC6A6
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284803; cv=none; b=IJ743QJGulIXvNU5i8tpPL5wcv1nunb6Hd9/mALsqDPNWanb2FlhkUmLQD6IkD5t1o19qYGXk2ml3xiXWDOs7Vk8D1XxwUQrhk2R1OQ54K8evLHWnH9E8gK6erKqeqGsXqAXu4mKH6xzT7A8aywAt8JlOCwBWLpttw1DusfGtcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284803; c=relaxed/simple;
	bh=SL9Xa7i2g8Fh+hi19+UwF4iLX+qe/Iaw4O9czuqtM0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXOsFmcMP8rOzfLx0AmL6ZBIlNukUcaJfe7g/aUucI/cHVo095hXY9UDLmtLUE0tgrxlbJX9rpTa65H5I89vvOOXWQ/7HSoSEjZTWOcK6GXxl1eePU4PR2h1RzJ8kVRKra5qe8eCgmFmXr8YediNCG2xR4vnQ63RF5qM2pHouzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Ba56ZP5k; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ba56ZP5k"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cee9b74ee1so41731045ad.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784284801; x=1784889601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=96R5fXs7tEdkAuUM/Lc10ei+v25C9Sc1yLyFN1koBqw=;
        b=Ba56ZP5kIaec89icSD3ByMUYkiVf3REYU1iNpZ6dudVyzsuix6kmreu+lhsMjKi+cX
         E3iMLwmt+OCVAyBANqINtJxcjYDEUEtTh4OiLMNX+7UTqYhFvhCSVJ1hcZHkFmxEHlKc
         F6nfyb2sVHLdW0Is18Yk8HDm6ywenxvYdaPItNKM5oblp8sQTP2H5yDhpCDZD9uJW25e
         eo7BoxbJPfK3dv9siCHt0v5oBD197BGrTbXFBXKEkbgcCGBs2oTWuZQzfSpQFTXSE3jK
         RN9RaKAfDkGPqE1BF/WFDnYTpqr0POGEzNm4bujkJoyQTqYZTHRYV1SYVsOubFdQOpKt
         JguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284801; x=1784889601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96R5fXs7tEdkAuUM/Lc10ei+v25C9Sc1yLyFN1koBqw=;
        b=l06I8LVM6W7uQ1R5v4vpN4N/5Kmm36SJGcsWuK/93VaMRm3dR8Y/QWS+2T/PM/kYWY
         xqBR6NlCOoYaI3tD9mViNMAfAzB1nbmqf3EwLBFTg4qPr14MU84FFf6s4+Kgb6TmzLXG
         KzxvgcGOHo/XoXmdh5nDgEP80SjD9lpqu+PCdAkTPrrZ8+04irR07yodvMdUPzikko85
         oEcYCN0Vy1rv8vLmI/uJwn25j+xxT1uBXDI8uVjvlgdIOEv/eZHm8GnTBTdiEGycwKML
         DR7aINOHIWqou57Pmbw8rswYWIsdniAp7bsuOv+CbbPiV3lO7PuUcZyuypB0rxIBwzde
         D7gw==
X-Gm-Message-State: AOJu0Yzl3c+c5IpXRr27r77GFjCJ35lR2Yz5DWcQAe7KuguKlFAYulha
	LEP/kjHVWQydWD+Ed/qhbYkb+FjswziKYe+YDw/avsYUSJnBkaQwbYxRjUwnNhSNGx4=
X-Gm-Gg: AfdE7cmH/oC6UWhJiDqSV7iQyB9oIh5mieVPzbHfAmpfATCk8jDqhPB+SMG2upyo9QC
	ApRI4Uy5WrvytiIs1Zqwl1h+kGUQ8YtiN2wMjpCEkSn9g7vjjsmY8xVKfD2iPtAI+blOh/WVCwf
	COkOGWLHlgZtIHFsfFrvZanE5cjcNyyV3sIXMO5wr6WLAqn5m7Y8S4uETI9JIUZjpbff57HiUB2
	iPa9VnETFWiNXHjtNjLbt4Om7IOE80ZqTTYtxcXDANJaTqThOjVZqSmamcCoC22GUkOkpOYtfXT
	FFz2R1Dmar6JIswqSE0AJPjs4tw1fj7K38/Aw9brr03f0kix2qcSdIPW5Ajk46Lra9DnUntnMdx
	omjysEAm05X4q56HmzlBZJ8xxNEyomilcOTlTfYFRKyUsUZhpTO3faowNCT0rrh6x1M5aLr5TIj
	JH
X-Received: by 2002:a17:902:f705:b0:2ca:f16c:87b3 with SMTP id d9443c01a7336-2cf348bc566mr21191395ad.19.1784284800621;
        Fri, 17 Jul 2026 03:40:00 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34743105sm8286085ad.69.2026.07.17.03.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:39:59 -0700 (PDT)
Date: Fri, 17 Jul 2026 18:39:51 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Message-ID: <aloGd39fAlev7+4p@plin-1878>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
 <aj5m00m4KxRAPAnB@plin-1878>
 <20260626-chitchat-purity-33af51f88380@spud>
 <akOkXpPi46LBHuIA@plin-1878>
 <20260630-frisk-excavate-7d562df75585@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-frisk-excavate-7d562df75585@spud>

Hi Conor,

On Tue, Jun 30, 2026 at 07:06:14PM +0100, Conor Dooley wrote:
> On Tue, Jun 30, 2026 at 07:11:26PM +0800, Yu-Chien Peter Lin wrote:
> > Hi Conor,
> > 
> > On Fri, Jun 26, 2026 at 03:36:38PM +0100, Conor Dooley wrote:
> > > On Fri, Jun 26, 2026 at 07:47:31PM +0800, Yu-Chien Peter Lin wrote:
> > > > Hi Conor,
> > > > 
> > > > On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> > > > > On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wrote:
> > > > > > Add per-hart DT properties for RISC-V Worlds architecture:
> > > > > > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > > > > > platform-defined values are primarily used by M-mode firmware
> > > > > > to configure World ID CSRs and restrict WID usage across
> > > > > > privilege levels.
> > > > > > 
> > > > > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> > > > > >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
> > > > > >  2 files changed, 98 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > index 5feeb2203050..4b5778b6d3e7 100644
> > > > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > @@ -26,6 +26,7 @@ description: |
> > > > > >  allOf:
> > > > > >    - $ref: /schemas/cpu.yaml#
> > > > > >    - $ref: extensions.yaml
> > > > > > +  - $ref: worlds.yaml
> > > > > >    - if:
> > > > > >        not:
> > > > > >          properties:
> > > > > > @@ -120,11 +121,31 @@ properties:
> > > > > >        thead systems where the vector register length is not identical on all harts, or
> > > > > >        the vlenb CSR is not available.
> > > > > >  
> > > > > > +  riscv,pmwid:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > +    description:
> > > > > > +      Platform-defined M-mode World ID (WID) assigned to this hart.
> > > > > > +    minimum: 0
> > > > > > +    maximum: 63
> > > > > > +
> > > > > > +  riscv,pmwidlist:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > > > > +    description:
> > > > > > +      Platform-defined bitmap of M-mode World IDs (WIDs) that this hart may use.
> > > > > 
> > > > > I don't understand what the difference is between this property and the
> > > > > one before it are.
> > > > > Is this one meant to be used by m-mode software to then select one which
> > > > > will appear in riscv,pmwid?
> > > > 
> > > > pmwid (single value) is the reset default, while pmwidlist (bitmap)
> > > > defines the allowed set. The root-of-trust M-mode software may select
> > > > an allowed value from the pmwidlist and write it to the mwid CSR.
> > > 
> > > I don't understand the point of the property then. If it is the reset
> > > default, just read it out of the register?
> > > Unless I am missing something, it's useless to s-mode because it may
> > > not be what m-mode chose and useless to m-mode that has access to
> > > the csr.
> > 
> > Smwid is optional. In the no-Smwid case:
> > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/SoC
> >   registers, exposed to software via riscv,pmwid DT property)
> > - S/U-mode's WID depends on opensbi-domain configuration [1]:
> >   - If next-wid is specified: S/U use that WID (via mlwid CSR)
> >   - If next-wid is absent   : S/U fall back to pmwid (M/S/U in same
> >     world)
> > 
> > So riscv,pmwid serves two purpose:
> > 1. Source of truth for M-mode's WID when mwid CSR doesn't exist
> > 2. Fallback value for OpenSBI to write to mlwid when domain config is
> >    absent.
> 
> So it is not the default at reset at all then. The reset default is
> something else entirely and this is used to overwrite that.
> 
> > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/SoC
> >   registers, exposed to software via riscv,pmwid DT property)
> 
> In this case, it seems like pmwidlist would just contain a single entry,
> and there is no need for pwmid.

The pmwid and pmwidlist properties cannot merge because pmwidlist represents
an optional hardware mask. On physically unrestricted platforms, pmwidlist
doesn't exist, making pmwid essential to define the hardware reset default.

> 
> Quite frankly, it seems like you need to decouple these properties from
> being 1:1 mappings to your extension's CSRs and both name and explain
> how they are to be used by software.

These properties are actually not 1:1 CSR mappings. pmwid, pmwidlist, and
pmlwidlist are the exact terms used in the RISC-V specification to describe
these platform-defined hardware values, so I prefer to follow it.

> 
> For example, how is software to treat the value in riscv,pwmid when
> Smwid is enabled? Must it be the same value? Is riscv,pwmidlist useless
> in that scenario as a result and should not be populated? Should
> riscv,pwmid not be used if Smwid is enabled?
> 
> There's a lot of extensions defined in this series, and there's no
> clarity on how these properties behave depending on what's enabled in
> the binding. There must be.

Yes, agreed. I have summarized the possible ISA extension combinations
and their corresponding Device Tree property requirements in the table
below:

# | Smwid | Smlwid | Smlwidlist | Smwiddeleg | Sswid | CSRs Present                             | pmwid | pmwidlist | pmlwidlist | Notes
------------------------------------------------------------------------------------------------------------------------------------------------------
0 | off   | off    | off        | off        | off   | (none)                                   | REQ   | NO        | NO         | Base: single fixed WID per hart, platform-defined only
1 | on    | off    | off        | off        | off   | mwid                                     | OPT   | OPT       | NO         | M-mode control only: lockable M-mode WID; all privilege modes share one WID
2 | off   | on     | off        | off        | off   | mlwid                                    | REQ   | NO        | OPT        | Lower-mode control: M-mode assigns WID to lower privileges; M-mode WID is platfo rm-fixed
3 | on    | on     | off        | off        | off   | mwid, mlwid                              | OPT   | OPT       | OPT        | RoT M-mode control: RoT M-mode configures regular M-mode WID (lockable)
4 | on    | on     | on         | off        | off   | mwid, mlwid, mlwidlist                   | OPT   | OPT       | OPT        | WID list restriction: M-mode can software-restrict the mlwid set
5 | off   | on     | off        | on         | on    | mlwid, mwiddeleg, slwid                  | REQ   | NO        | OPT        | S-delegated control (M-mode fixed): M-mode WID platform-fixed; S-mode controls U -mode WID
6 | on    | on     | off        | on         | on    | mwid, mlwid, mwiddeleg, slwid            | OPT   | OPT       | OPT        | S-delegated control (M-mode programmable): M-mode WID lockable; S-mode controls U-mode WID
7 | on    | on     | on         | on         | on    | mwid, mlwid, mlwidlist, mwiddeleg, slwid | OPT   | OPT       | OPT        | Complete feature set: all CSRs present; M-mode lockable WID, mlwidlist restricti on, S-mode delegation

  REQ = REQUIRED   - Property must be present in DT
  OPT = OPTIONAL   - Property may be present; provides optional platform defined values
  NO  = FORBIDDEN  - Property must not be present

> 
> > - S/U-mode's WID depends on opensbi-domain configuration [1]:
> >   - If next-wid is specified: S/U use that WID (via mlwid CSR)
> >   - If next-wid is absent   : S/U fall back to pmwid (M/S/U in same
> >     world)
> > 
> > So riscv,pmwid serves two purpose:
> > 1. Source of truth for M-mode's WID when mwid CSR doesn't exist
> > 2. Fallback value for OpenSBI to write to mlwid when domain config is
> >    absent.
> 
> Again same point applies here, why can a single-entry riscv,pmwidlist
> not suffice here?

As explained above, a single-entry pmwidlist cannot replace pmwid because
it would fail to represent the exact hardware reset default for platforms
without physical WID restrictions. I hope this addresses your concern.

> Additionally, if it cannot, you may need to introduce mutual exclusion
> and the relevant extensions because it doesn't seem like in your current
> design that the two properties are intended to co-exist.

Agreed. In the next version, I will introduce mutual exclusion in the
YAML schema based on the table above.

Thanks,
Peter Lin

> 
> Cheers,
> Conor.


