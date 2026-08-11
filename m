Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE2426D2B
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440986; cv=none; b=TKYypDutlITwcRXqZ55pBhwgYmiY5duT40Y0xgltK6RUCI1RzwWgeUNUE83IghtSUL2SaLCkRifdy6rSzGdzMua1k5LlI6fCqyEm1Mn0x4s/7bPluzgMjI7dYjHmeHCcIcSZTWq33iIt4doVp3Fl9+8Uuni4FVQ5KBVODPqwhwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440986; c=relaxed/simple;
	bh=rqfV6jbzYDUjMrVAKo4zf+EVj733XqEdjvk2G6yYi3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsVoSZzG5iSvKDPyOxeD5h4efVJU5iG/OiXBeaKQCmGdP2sLBdflQUn//1R3wsCCFLy5p2lPdBFGSeCFfGLjXtcCkSOVZyZgDgryAL79ahfVOToDAcyynoRG32FHA3n9BdlHzGky5noFlqG+qTVE3zU60NGAaaJCfGyNQcRcfxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=NhxDVnck; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NhxDVnck"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2073243a91.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786440984; x=1787045784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VcbzXbSdyoexmhki4K88F749nCD4aY9ew05QBhC5eME=;
        b=NhxDVnck9E8f4nDeg0As9Y0x6/us76S9V6iHYBKUAUBnCSqPsU9zuWzKgtqdcZltww
         GwvDFCd4zL+wB5Gdp4CNxTTQfmhJ/MoCoFLQG0Pd+LrpLHFGdOJtG8loLuQYuhJCwjnS
         c/JIXLuIXb/4q1s5RnTO1/QzURK/dnGjuUTAYL8sAvnwbHAD2ynasWxhiYpPxVALYke5
         bYsJTT3oVSmFHbTVvPlKkVMhkuL0Yc4x8p0FemvT3eBKq0teQeaxykyj2sYNEezLOFv3
         OaR2UDROcU2VKOy6CR9/jTNXpeTNj4eJGyd1QT1fUYVeWicwkTeYjpNUJMdZK+UBN+PK
         no2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440984; x=1787045784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcbzXbSdyoexmhki4K88F749nCD4aY9ew05QBhC5eME=;
        b=mKkoY5aA88b8Il4nv08LknVE1zoh17NVzUzqpNtBP4ajUExkR1uUW40tGlPxyWtpwW
         n458vLKd75jVCX6XND/mjuuTPaPDJpjjmvGcNcjLg1ALn6hg71omgMoPpl3E+XBA5vvc
         hYTYftQQELdTWui0fDrXy1v/df7fB3aRsZLKmXiVluR3awapp+5ycQP6F5FtOPGjkMGt
         AoQE1A/i1QwRLR7O0zxtl+jKWscnMGemeupBrG1Ut/AXfGVc2GPcjuZbriSsu3MnEZJ9
         rCYARPuLaRURO+pcIpDtEoE0H+mCPCWHc96dBbqnrgzENQygLnj2RFRbyULV7+xvZ5bg
         sLXA==
X-Forwarded-Encrypted: i=1; AHgh+RqlH6soZuzBajUhKTCTdGN6t43cgg2g9r5ZVlC0i729rwWnDzL4i00CZwg2ifM8km5Xd2h97VTktYw8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4JCKrke+1f+dUSvsj0+feyYlmZrmThK3I04X7scAxKq0Zzrgt
	24hSXtNrtd4hZQ+W+EUTcCtEHtxQ34DkBYvbrfPr79DOyqmfldchTpz/jc3+vleyMis=
X-Gm-Gg: AR+sD10+gx6HHnb9bC8UU9MD/t3XGHkgV3mDlfMHXJunJYGwqYtxr20vrJARUWuSFYk
	jxOqa19kL58k0jsb8fjJ4C/a/B0maJn5mW3y3Ho+TPHBOZCbD9bKu+4qyu5OyWG10xFIOWYCHha
	jUF4zUs1f5Bx5wUJ0bobjNNNRiTBnJUsmw1+9VtcnhNAvBcfFek1wI103UhBMxIAkKcdPQBy7A4
	qAIjwZ3xTLyvV8CwYYMTiUd+EiVm1psGqZS6IugqqMNAfs8Ybf8nBQv6GiafTQgCKfUFu2amjC+
	Ik3stGPCVkSC4oz2lY/mImz/SMJpNc8OT+7Yn+5Dtj4wX/72jsIO/apDESAJbKxjH/lQcz9Q0f5
	pu7QG666IvsHArHyxOnS+FuoEB7I6XgN+EZQHW56oPXjUoodr8TJnvyvW0UiarQU3dnqI9YogYs
	eRskHD2C8Ag8yiFLeSdCCrFO3RZv3s7nsu/EWjoVI4VlSB4rw4PNS2QlnY+v9u
X-Received: by 2002:a17:90b:2689:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-392ec4e4a34mr2095732a91.7.1786440984022;
        Tue, 11 Aug 2026 02:36:24 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d5190ce9sm3040036a91.1.2026.08.11.02.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:36:23 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:36:13 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: pjw@kernel.org, zhangchunyan@iscas.ac.cn, conor+dt@kernel.org,
	greentime.hu@sifive.com, robin.randhawa@sifive.com,
	dfustini@oss.tenstorrent.com, raymond.mao@riscstar.com,
	dave.patel@riscstar.com, pincheng.plct@isrc.iscas.ac.cn,
	linux-kernel@vger.kernel.org, darshan.prajapati@einfochips.com,
	linux-riscv@lists.infradead.org, junhui.liu@pigmoral.tech,
	akpm@linux-foundation.org, dlan@kernel.org, jim.shu@sifive.com,
	devicetree@vger.kernel.org, luxu.kernel@bytedance.com,
	krzk+dt@kernel.org, zong.li@sifive.com, anup@brainfault.org,
	michal.simek@amd.com, scott@riscstar.com, alex@ghiti.fr,
	samuel.holland@sifive.com, aou@eecs.berkeley.edu,
	pawandeep.oza@oss.qualcomm.com, palmer@dabbelt.com,
	nick.hu@sifive.com
Subject: Re: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <anrtDcL+iAKDuAO/@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-4-peter.lin@sifive.com>
 <178534841831.3259884.2854898669055783798.robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178534841831.3259884.2854898669055783798.robh@kernel.org>

Hi Rob,

On Wed, Jul 29, 2026 at 01:07:00PM -0500, Rob Herring (Arm) wrote:
> 
> On Thu, 30 Jul 2026 00:39:08 +0800, Yu-Chien Peter Lin wrote:
> > Add YAML binding schema for the SiFive wgChecker, a programmable
> > access controller integrated in the interconnect fabric of RISC-V
> > Worlds-capable SoCs.
> > 
> > wgChecker enforces World ID (WID) based access control on downstream
> > bus transactions. Each checker slot encodes a 2-bit permission field
> > per WID (read/write), enabling fine-grained memory partitioning and
> > device isolation between execution contexts. Violations are reported
> > via bus errors, interrupts, or both, selectable and lockable per slot.
> > 
> > The binding registers wgChecker as an access-controllers provider.
> > Consumers (i.e. its protected device) reference it via the standard
> > access-controllers phandle to declare their access requirements.
> > 
> > Also document the sifive,trustedwid property for the /cpus node,
> > identifying the privileged WID authorized to configure all checkers
> > on the platform.
> > 
> > Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > Reviewed-by: Zong Li <zong.li@sifive.com>
> > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/worlds.yaml     |   9 +
> >  .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
> >  2 files changed, 365 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/sifive/sifive,wgchecker2.example.dtb: uart@1c1000 (ns16550a): $nodename:0: 'uart@1c1000' does not match '^serial(@.*)?$'
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
> Documentation/devicetree/bindings/sifive/sifive,wgchecker2.example.dtb: uart@1c1000 (ns16550a): Unevaluated properties are not allowed ('access-controllers', 'reg-names' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml

Will fix.

Thanks,
Peter Lin
