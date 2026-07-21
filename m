Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174EE39D3FC
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621727; cv=none; b=Zc87jjD8Celrme/HQgfgF24X2noMGeqwXkZVKiRyPdQqEh1O3khBILU78wsa4ZkejdI0nj4aOabv08qWrhGj7QdWJnTrQlR5eFM0OaDRTb4v1RbsoPJil2OA8YFIU8W4WsH+lTK1WhFnGVf1Af6ueqsayZvR0rDxLVppHLTFLb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621727; c=relaxed/simple;
	bh=GEfIkfgIsyPB7ykUITLu1JfZU+LTisRn+Cwnv7PL1Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhKqeXbPvFyFjefW0sEvBe/JefIZ9IIs3Vdhf+2myAonGCfQb/dGm5U6nJY2+By/zyOY1WdDOIIeNnxgr7gpfSczQdCCo0gTuKEAyo47C66fI5vaTgJVK+3O9Ob5mldvIVVwbc0qjZjp+XxPDol7hh59/fbcnhu08S/d/3NiA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=acR9rXj1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="acR9rXj1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce7d2adef4so109759475ad.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784621717; x=1785226517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQhiaBXb4FQySqVLoPouzb2vEhitkvmWNOzmKqQGHqM=;
        b=acR9rXj1oOL+BrXP7hE0AJRC9xUaN3OTzq3WuLiy2bqkwG0bVmbsNrs8l7vhMd6mJO
         EfU89hBy/SJR2Gtha++TbYPhQ5r8HnPKpH7pS8c4vnmKLyp5EUH1T8pyusJDIO1FUWwt
         OGdrb/Hzl3DT/hPIbPZt4CDXD5VTOiNfFwKtVYStM9SWQUDAMPKS2iQf3t1FOZ4Kl+n6
         wAeF3JLrA4xkCu4ihGb9L1PYt4Z9W5D32Ms9QhvWg7H4s5DorJ53DEP8QAwK+UDhtXAO
         IB1UGjdKz9fXmbBCGo0M4cmtrpDOJOmUpa6CBelkgl0PohaSVziVJWGugcYH5cv7yt5z
         5a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621717; x=1785226517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQhiaBXb4FQySqVLoPouzb2vEhitkvmWNOzmKqQGHqM=;
        b=BLHrgvD439iIZatn/QG3U/1tHHJVZv+Efmtz2q8pQ2UlEUMWjXGzgnlJQhTIJUWLcL
         khwZ7mt0eugNwaKlSh9429VZBsfoXO5RQUJlJtRFeTFrr7m98szOAbADI8dLN3qI734q
         KhPG8vIAhOu/bsX5/a8k+R+ARE1d3nv3kE5w9lzAVHAvqdnIj/TAi4vaTHQ+GZqsAZER
         o1Jt28jKCkd08wJyPLCVMjzCx99xqAan3j/tI8GiPpRbj6j7xV5bcqSksQEvlXCGdcrj
         Pyc/dgycHaybTGtpF1E7qgnoEkxhpsTscdsK9lMR4t3fEqJ/OdDn4EOgo9s2RXB8H9XT
         Ux3w==
X-Forwarded-Encrypted: i=1; AHgh+Rpo/aoSGHgOeIJbz3Oq4fqNBUiba11f7KeYb1ShGDVSoKCrnoKzG0s5hacap3izD5HW/s6xtdhVrSB6@vger.kernel.org
X-Gm-Message-State: AOJu0YzcQNegDZNTLtWIon1GVcwxwIZOv+AYekNOTEhDcsa4uAlj38qk
	77H8PRv/1aExzrRfbAz9vgGz8ATL88+spfliJIaTXQF/mBVUszuG9fHiV49HkLe9Nao=
X-Gm-Gg: AR+sD10i0DQelgChFErZF8zSxMrrthG+vt0dPCxS80RVzhKASBzMb9z/g+Xszqdbgif
	UNJ38iKHaeLbH8CiOyJEmUBMNhG9Hkhwl0m7ShhogmKaMSYwvdKJnIVb/CkMfj9SO+Irn60OJNo
	6dwwIq3ajQrH1sw3aSnLZ0105FQQPg6SQuXhoWHm20Ax5p+dvYksYecO1kHwN/Y6kH0qpRPa9q+
	UG4E+e1uQe1CA4rnShnd8FUHI7wV/t3jU6NA3h9CPCUI8mYgFIYJ8RKoDPTMtaEAWNoa2MjHM6N
	Av+X29VJKhf/TKff++vA++KjA5qAKe5G8VxRbuxuc87aPbfdH5QQ7qVG47ONDm6mcBKGZ2vd+Ys
	dyfFeuV6lW/Eh1b+PoIQFyo5PTr/JWAf4Mg7X5F0VVdFNmyQ5+lZ14h57185dTYZu1s8emhPvVh
	U6
X-Received: by 2002:a17:903:240e:b0:2ca:bb6:e7c6 with SMTP id d9443c01a7336-2cf349ab740mr197154885ad.37.1784621716761;
        Tue, 21 Jul 2026 01:15:16 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b36f9sm74117275ad.23.2026.07.21.01.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:15:15 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:15:07 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, samuel.holland@sifive.com, dlan@kernel.org,
	guodong@riscstar.com, dfustini@oss.tenstorrent.com,
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
Message-ID: <al8qi7k4LUlSTvhb@plin-1878>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
 <aj5m00m4KxRAPAnB@plin-1878>
 <20260626-chitchat-purity-33af51f88380@spud>
 <akOkXpPi46LBHuIA@plin-1878>
 <20260630-frisk-excavate-7d562df75585@spud>
 <aloGd39fAlev7+4p@plin-1878>
 <20260717-imitation-corridor-ce127d4093fd@wendy>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-imitation-corridor-ce127d4093fd@wendy>

On Fri, Jul 17, 2026 at 04:55:00PM +0100, Conor Dooley wrote:
> On Fri, Jul 17, 2026 at 06:39:51PM +0800, Yu-Chien Peter Lin wrote:
> > Hi Conor,
> > 
> > On Tue, Jun 30, 2026 at 07:06:14PM +0100, Conor Dooley wrote:
> > > On Tue, Jun 30, 2026 at 07:11:26PM +0800, Yu-Chien Peter Lin wrote:
> > > > Hi Conor,
> > > > 
> > > > On Fri, Jun 26, 2026 at 03:36:38PM +0100, Conor Dooley wrote:
> > > > > On Fri, Jun 26, 2026 at 07:47:31PM +0800, Yu-Chien Peter Lin wrote:
> > > > > > Hi Conor,
> > > > > > 
> > > > > > On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> > > > > > > On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wrote:
> > > > > > > > Add per-hart DT properties for RISC-V Worlds architecture:
> > > > > > > > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > > > > > > > platform-defined values are primarily used by M-mode firmware
> > > > > > > > to configure World ID CSRs and restrict WID usage across
> > > > > > > > privilege levels.
> > > > > > > > 
> > > > > > > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > > > > > > ---
> > > > > > > >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> > > > > > > >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
> > > > > > > >  2 files changed, 98 insertions(+)
> > > > > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> > > > > > > > 
> > > > > > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > > index 5feeb2203050..4b5778b6d3e7 100644
> > > > > > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > > @@ -26,6 +26,7 @@ description: |
> > > > > > > >  allOf:
> > > > > > > >    - $ref: /schemas/cpu.yaml#
> > > > > > > >    - $ref: extensions.yaml
> > > > > > > > +  - $ref: worlds.yaml
> > > > > > > >    - if:
> > > > > > > >        not:
> > > > > > > >          properties:
> > > > > > > > @@ -120,11 +121,31 @@ properties:
> > > > > > > >        thead systems where the vector register length is not identical on all harts, or
> > > > > > > >        the vlenb CSR is not available.
> > > > > > > >  
> > > > > > > > +  riscv,pmwid:
> > > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > > +    description:
> > > > > > > > +      Platform-defined M-mode World ID (WID) assigned to this hart.
> > > > > > > > +    minimum: 0
> > > > > > > > +    maximum: 63
> > > > > > > > +
> > > > > > > > +  riscv,pmwidlist:
> > > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > > > > > > +    description:
> > > > > > > > +      Platform-defined bitmap of M-mode World IDs (WIDs) that this hart may use.
> > > > > > > 
> > > > > > > I don't understand what the difference is between this property and the
> > > > > > > one before it are.
> > > > > > > Is this one meant to be used by m-mode software to then select one which
> > > > > > > will appear in riscv,pmwid?
> > > > > > 
> > > > > > pmwid (single value) is the reset default, while pmwidlist (bitmap)
> > > > > > defines the allowed set. The root-of-trust M-mode software may select
> > > > > > an allowed value from the pmwidlist and write it to the mwid CSR.
> > > > > 
> > > > > I don't understand the point of the property then. If it is the reset
> > > > > default, just read it out of the register?
> > > > > Unless I am missing something, it's useless to s-mode because it may
> > > > > not be what m-mode chose and useless to m-mode that has access to
> > > > > the csr.
> > > > 
> > > > Smwid is optional. In the no-Smwid case:
> > > > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/SoC
> > > >   registers, exposed to software via riscv,pmwid DT property)
> > > > - S/U-mode's WID depends on opensbi-domain configuration [1]:
> > > >   - If next-wid is specified: S/U use that WID (via mlwid CSR)
> > > >   - If next-wid is absent   : S/U fall back to pmwid (M/S/U in same
> > > >     world)
> > > > 
> > > > So riscv,pmwid serves two purpose:
> > > > 1. Source of truth for M-mode's WID when mwid CSR doesn't exist
> > > > 2. Fallback value for OpenSBI to write to mlwid when domain config is
> > > >    absent.
> > > 
> > > So it is not the default at reset at all then. The reset default is
> > > something else entirely and this is used to overwrite that.
> > > 
> > > > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/SoC
> > > >   registers, exposed to software via riscv,pmwid DT property)
> > > 
> > > In this case, it seems like pmwidlist would just contain a single entry,
> > > and there is no need for pwmid.
> > 
> > The pmwid and pmwidlist properties cannot merge because pmwidlist represents
> > an optional hardware mask. On physically unrestricted platforms, pmwidlist
> > doesn't exist, making pmwid essential to define the hardware reset default.
> > 
> > > 
> > > Quite frankly, it seems like you need to decouple these properties from
> > > being 1:1 mappings to your extension's CSRs and both name and explain
> > > how they are to be used by software.
> > 
> > These properties are actually not 1:1 CSR mappings. pmwid, pmwidlist, and
> > pmlwidlist are the exact terms used in the RISC-V specification to describe
> > these platform-defined hardware values, so I prefer to follow it.
> 
> CSRs or terms in your extension, it matters little.
> Your properties should reflect how software will actually interact with
> the devicetree and wordguard. There's no point having a bunch of
> properties that relate to aspects of the extension if software is not
> going to actually use them. 
> 
> I fundamentally do not understand why software ever needs both both the
> singular and list properties. What does software actually do with the
> list property when both it and the singular property are provided?
> 
> I expect to see something simpler and/or much better explained in the next
> revision.
> 
> > > Again same point applies here, why can a single-entry riscv,pmwidlist
> > > not suffice here?
> > 
> > As explained above, a single-entry pmwidlist cannot replace pmwid because
> > it would fail to represent the exact hardware reset default for platforms
> > without physical WID restrictions.
> 
> If there is one entry, use that, and if there are multiple entries, pick
> one?

Thank you, Conor. I am reworking OpenSBI part and hopefully PATCHv2
will address some of issues here. I will also rewrite description to
focus on software usage rather than hardware spec terminology.

Regards,
Peter Lin

> 
> Thanks,
> Conor.


