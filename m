Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D6F377EAF
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089454; cv=none; b=cWPRi9BvWb5+y7awMmyVMkE/OO0N99vxRjqobO4ugiPTOcljR924dI58k3CxYVKgkG9PEMrPi7QYYrmby5qmjcjCJ6LtDe9TGZ4evHUYyj8aw3J88Ou4I6t/a4pGirRXDIh+n9++qdAuwSgFVo3svjtKAhR6mROCht8in9c4ib4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089454; c=relaxed/simple;
	bh=h08aTahiqi1m9ruk8Olk/qa4cCx8pXonALOooSZy55g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTUec8C08g/5SE9sYQ5FyZ2CrxBIUeXHgH5/Mop0ASTjmPyUtRE0KpN8foqCrIUDSYVTwL9Zz8vCpzUTsu1uM0h5bTLG424FT990Dku3FXdcgTiiCA5hVfAhWs/pyFBFizwOmA+yQkRTDGCE243B14oOIrt30zB3G31k/Oiw0Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=f322AXdF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="f322AXdF"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8487214ad2bso4778086b3a.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786089450; x=1786694250; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CW77S2KS53iUGhDCuDUUq6n8FNmbEq3lDEq9IFk7LgY=;
        b=f322AXdFy0oOgf4YByOTOHi9aKvExCQIebwdW1Hnp4NcGjr9saOiUeZtj+qHsMXWh8
         M1u0uBv0rZnP3Xen4pyYuMnpXdHibjT6uM2GaSMfWx1STsEwm61jb+wbSZJi6A/UdDXL
         7BGLs1EqjlDBJ4+UDkIbZ7J1uDBdguwI/xnvwywHSo3oNQDkWtA/4Whvq3uRsry3fNbF
         Q/SUu0i3sTchl4RJqsdN3vBwhsXwNrbBsTth0NAJfbFK9CIZfIX8pQa1XSD5kNW67tNh
         mNRxQBOVYzGA0C6N1V6gQCooxPN/KTK21a7Oa2dS5LJLO6BPpS22SnBnyGLf4VXAyBwc
         X3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089450; x=1786694250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CW77S2KS53iUGhDCuDUUq6n8FNmbEq3lDEq9IFk7LgY=;
        b=b7719b7PxDmprzquWqWAk9kr6W18gSp3TwdSyqZf8QiDxrHOGc8RooVcDHOu/efQxK
         Gl0aeV/wihE6VeJRZljg4Vdv/VhVtqVwNrXsN012LJ5yMMsfjCmhjmq2IihxoNWiRdo1
         bqWxG+cXsPPRi/F85NzrnUQXt9X2549M1XjtuFH2lIYZyUNeXloMiuBatq+m/uXLVXTk
         su2nQ/Kh3xnKsrJnWBFR2cUI4boz6iVksHcHZNTMYJi2tGU0dHjg94JsJrFOJTAKy/hR
         HFkOCqUiVOyzqXKJRanbAq8/kLaAT0yydSQycgg8jBiISDLopZ1oaPmwdLGsuRX5yMo+
         cY/g==
X-Forwarded-Encrypted: i=1; AHgh+RqfgNHMoleRQFRBEpYnjKqFaT6taScG1/74ppZNQ+c321B7yWJzQqF7EvVl7tpM7Rj48MtrlK1VYfb1@vger.kernel.org
X-Gm-Message-State: AOJu0YyfdOk88F+CXnNJRmJ4TWpdVux6B5eAAYvd1mCVIyRM52bxqcm7
	HlWFbSZmSjnrVeemLFGp26h0wF7wkd1WuSQuZ4xALh/+sF2jBKrWAVdag8dsMo/fVLU=
X-Gm-Gg: AR+sD11W/xa+lRa/SMdncvTFYuJ5+S8dUYRSmvsF62Ll9RZMz8e0OVhvV40F0Wzy4EI
	7ZRQxK0X5QAnk9t+4F0yUceC7Dd4r3tBOKIh/IphwBvCW/FuMx6nlvkRUzGKiCQFf0vEAEvsuw2
	mDgNyDMsRtTDZof6SklQpjLtCITF5j3YZzBICWFFN8MuSrjxmBNnZUltSes8Uw8foe9IYF5GbEl
	de/jZlTo8jNc19yut7gqzuRIUZkRo6JEfymoN79ZtniRkgBmSMI38Ijp15ZoH3BCGiKKk9+LU1W
	ILe22C+1k4royIR76h17nkXa+6FhbbI+mMHnJYh0nLsvu7WchwKqMeLW4XojGDYg4WtiLYvquYF
	B5I64dBa27tFUSDkM6L9Ty027es4+AtXVqoAwzp2DNLbU1IbfGAN/tqjQgDBMP68f4yYfYTQ7jS
	GFDEZpdo/nd/VobYQVkrSUl26Of604QctDle4zh9p+NMkrpGfKoWV4UCyfFCLp
X-Received: by 2002:a05:6a00:8d96:b0:848:467d:293b with SMTP id d2e1a72fcca58-84f5df78196mr2125649b3a.11.1786089449949;
        Fri, 07 Aug 2026 00:57:29 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5528adsm611851b3a.45.2026.08.07.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:57:29 -0700 (PDT)
Date: Fri, 7 Aug 2026 15:57:20 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: anup@brainfault.org, guodong@riscstar.com,
	pincheng.plct@isrc.iscas.ac.cn, alex@ghiti.fr,
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, michal.simek@amd.com,
	dave.patel@riscstar.com, pjw@kernel.org,
	linux-riscv@lists.infradead.org, zhangchunyan@iscas.ac.cn,
	raymond.mao@riscstar.com, palmer@dabbelt.com,
	greentime.hu@sifive.com, dfustini@oss.tenstorrent.com,
	luxu.kernel@bytedance.com, conor+dt@kernel.org,
	akpm@linux-foundation.org, scott@riscstar.com, jim.shu@sifive.com,
	krzk+dt@kernel.org, robin.randhawa@sifive.com, zong.li@sifive.com,
	pawandeep.oza@oss.qualcomm.com, nick.hu@sifive.com,
	samuel.holland@sifive.com, darshan.prajapati@einfochips.com,
	junhui.liu@pigmoral.tech, dlan@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Message-ID: <anWP4Gyx9H3bMwUE@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-3-peter.lin@sifive.com>
 <178534841698.3259786.10094204605740986474.robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178534841698.3259786.10094204605740986474.robh@kernel.org>

Hi all,

On Wed, Jul 29, 2026 at 01:06:59PM -0500, Rob Herring (Arm) wrote:
> 
> On Thu, 30 Jul 2026 00:39:07 +0800, Yu-Chien Peter Lin wrote:
> > Add per-hart DT properties for the RISC-V Worlds architecture:
> > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > platform-defined values are primarily used by M-mode firmware
> > to configure World ID CSRs and restrict WID usage across
> > privilege levels.
> > 
> > Also add schema validation rules to enforce valid property
> > combinations based on the ISA extensions present.
> > 
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/cpus.yaml       | 61 +++++++++++++++
> >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
> >  2 files changed, 138 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0 (riscv): 'riscv,pmwid' is a required property
> 	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
> Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1 (riscv): 'riscv,pmwid' is a required property
> 	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
> Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10 (riscv): 'riscv,pmwid' is a required property
> 	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
> Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11 (riscv): 'riscv,pmwid' is a required property
> 	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml

I plan to remove the 'required' check for riscv,pmwid in the next
version. The riscv,pmwid property is intended to provide a valid
fallback when S-domain WID is not specified. This is a platform
integration responsibility, not a schema-enforced constraint.

The next version will only retain prohibitive checks — e.g., if the
smwid extension is absent, riscv,pmwidlist must not be present.

Regards,
Peter Lin
