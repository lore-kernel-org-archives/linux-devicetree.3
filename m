Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378127;
	b=uyqcP19xzLU994T250jBDrGRj1rbVPAkQ89D8c/oKWEvuODMdPy0UTJTHnqLHlZAJUMS
	 jFlZ5UbKgMGh5EF/twJc178+oUxxnSJAJXiWEdtPerKQjCWLGpexYIPvS/aRTEyjY4RqU
	 zaUo3PdnXwD1dJy0CedSkNYKDKPAr8r1k9qqI9BHYCDmd+oRbvBK06WJsvyPzqQI9U+6X
	 4unKjcKLy96lGAoGzTK7Qtw2m0t9BpAWkxFr6pbK0uqNANYt8hXNIiXugTVTwacf7FxHR
	 03rtopcOpTW0cqXTFSgZshyXioKZTh2SO5tm3/BFo2XsM1wvfOxVrws/3mK5wLo9slw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UfQ1SBe18fofvg8ZZZgctDqwagjqFYv2el79q9J7+kI=;
	b=1LW+j+9XIHTc7qBuxRV+1Dq31fnzcyI0lEmBlQHuL7y++GcSu7XDkxdn5gJlOm9SM3ZE
	 LD6hFjkKaPsRxYg3oVmJ7lCmsS69eKMmqEMPy6CDwiWEhuLcc7WoKaNL4WhHzDiI1uUp+
	 PbedGRPLK5g0PZVY1Hl3y9nEHfBYHOpCpu6AGjDAs4OX3+pwS8cc3EhGjfU7A14nOqpX5
	 SbJe9Q1wU+SU/XF2V2WbzJRpb1QpLBDR1hN7XMRlB3mTQbIoZElXoLjX3C9RV1UisvsR3
	 wIVKCt5pPtim5H0l6WPy7cV7K+48Q9SWf6nYSiuETLsDApCTnfOu3wpJTAX8pRkH31w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXehbeHg;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CD606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXehbeHg
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1678471a91.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 22:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378126; x=1794982926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UfQ1SBe18fofvg8ZZZgctDqwagjqFYv2el79q9J7+kI=;
        b=QXehbeHgYw8wmrna7fGcN/xWOqyngNhzI1nMjUkqk62yIZkmCWChdK8GLTQnjdJIXl
         apH1KMx0GOZIsB0svJnWzNT6ZhoJf1VIZRSUuSOm+iVXBUPh8w2S/I+RushevOyIMZyq
         G/8+gkb2fE26Pju2TcxmCCkcX4AyNZPuHKKT6gijVItDoL+xTo+vVTPN+iSFr2udwBlV
         I2r03Xl/dj7D+UEsUWN+OTXQeMyfD4PBYoFTu/6uXr09vvwapTsT8gfTii7T7EuyHOgp
         xxRRVFrrGC9xW0KmprHfzL/Acgf5U3OflZQDUOnrzMbis4CLXqBfSq6SfdhYNNB0uI2M
         Celw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378126; x=1794982926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfQ1SBe18fofvg8ZZZgctDqwagjqFYv2el79q9J7+kI=;
        b=UtSs98sWWVaqpcfQIKtx5vMLq1kiitKHmWxmRJ+ys/vnusQAtsqDPrXDDLRPg/sX25
         RyDhvWGCOgF06hB/eGfHihdkSQ0Hg4iWZjAAPZwSbAzHEWYRnxhIqS0u3jvVna5cvPLx
         lbQaWQ+ak0mhpb+K00ku4TOU0n+mP9GC47OWg75iXP1LlIcUrqOeG/FlYVao38LXuWyz
         7Bk9Q2xzxWMO2HMpwpIC0DZhI+xoq7w4SgiZOsBZdURB5HgYO3STHcqBISq/AKANxd4X
         WTqRbQDmHY3P1e0f62lpaLuw68xswizNULoDZUdqB/wj7z5C7ct7ewUUkGhvaKOr5K7d
         pUww==
X-Forwarded-Encrypted: i=1; AL+hErHhs3K+Q05cjSYmsZw3ouBnHztUCTMZdTRMF91umE81B6cljqUqZN09jQt6c7KA1KZNsCWWbOrha1sP@vger.kernel.org
X-Gm-Message-State: APuU4Z+lHRyXONRw5HqMjzLLmwCKmFBPRyTvsdWkj1oC29f7g1VWoHUr
	BPznNXER0TryW2AKGruKTzKdy1eiX2DaAQjbEWF4bo2ohLme6GtwSoc6
X-Gm-Gg: AYBFou0Tz9BUXA3fI2GRL9LEUtYYbJNJmvBubJf144w8pfx575f3mGJG9G+Ma6AjSoJ
	KF/8eEOlSXypifzPOmFrA9sC1/+GfAV/lrKEzpVHng1FimgAnlPB6bCJQLhRADDf7VB23YJKrZv
	TnH/jucvu7kGyiMSa/D0Bb0NaYWpwDtXcHpA+rPA41gD7K0eYDY6H/R/R9mB9s8QlUebEL9f1HK
	pgDYmq4pTXWzMpvdI05uw1/rWMu4CfNMMZl5tLPyGpJaYA9hormK6kvrVKC6MwrLE28ww+ytzVF
	uW1tsxKVfyrfxjqEIigmSVVOFmgDd6l4sL2E/S85aAFjfQK9eykiA0ki3FVr2kB/Z6HIz+glkDI
	ifgzuAhPCXa19IaXlnvGakCePd2sYLC/folqdA0vFazu3oXcRxutb8PGjmhnOJPXz86dxuo7Z4A
	lBN9Ylbu5e546dP9YlseW40wgxwdMJ4yI4ecY4GESkebABWQ7cxjyNDcG+mOWRcDlKZ4HuvDdFj
	UqVypWLBVolb5G7HqkIllygcLO8Gu6M7iB9r1h6ByBkOVjs8Kb4hz8l/FMJiZKMax+LdOjq8Q/V
	3lIYPePUKED8qY92kwBaW/UZjOU=
X-Received: by 2002:a17:90b:3901:b0:3ae:533e:7e3c with SMTP id 98e67ed59e1d1-3b182f58c51mr1596933a91.35.1794378126465;
        Tue, 10 Nov 2026 22:22:06 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm2990708a91.6.2026.11.10.22.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:22:06 -0800 (PST)
Date: Wed, 11 Nov 2026 14:21:44 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joel Stanley <joel@jms.id.au>, Conor Dooley <conor@kernel.org>, 
	inochiama@gmail.com, junhui.liu@pigmoral.tech, aleksa.paunovic@htecgroup.com, 
	chen.wang@linux.dev, dlan@kernel.org, guoren@kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Gleixner <tglx@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Message-ID: <avQFhoMuUGhASMla@inochi.infowork>
References: <20261109051050.105623-1-joel@jms.id.au>
 <20261109051050.105623-5-joel@jms.id.au>
 <20261109-jester-zestfully-a664203cfbd1@spud>
 <CACPK8XcnPb9oMQq4YpNFG+RznroP-647E-_O5j84OW_YQ7P=9Q@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XcnPb9oMQq4YpNFG+RznroP-647E-_O5j84OW_YQ7P=9Q@mail.gmail.com>

On Wed, Nov 11, 2026 at 03:34:26PM +1030, Joel Stanley wrote:
> +cc people who might know more about the various hardware this binding supports.
> 
> On Tue, 10 Nov 2026 at 05:59, Conor Dooley <conor@kernel.org> wrote:
> > > +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> 
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - tenstorrent,atlantis-aclint-mtimer
> > > +      - const: riscv,aclint-mtimer
> >
> > So, what are we doing about thead,c900-aclint-mtimer.yaml?
> 
> Once we agree on this binding, I planned to submit a change to bring
> over the devices that implement the common binding. I can do that up
> front instead.
> 
> >
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: mtime register
> > > +      - description: mtimecmp registers
> >
> > For example, I note that you have mtime and mtimecmp in the opposite
> > order to how the mips folks have had to add the mtime region to that
> > file:
> > https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com/
> 
> This is the order OpenSBI has used since v1.0, when support was added
> about five years ago. It reads mtime followed by mtimecmp when there
> are no reg-names:
> 
>  https://github.com/riscv-software-src/opensbi/blob/v1.9/lib/utils/timer/fdt_timer_mtimer.c#L79
> 
> QEMU also generates a dt with mtime followed by mtimecmp, and without reg-names.
> 
> The MIPS ordering works because it specifies reg-names. OpenSBI uses
> reg-names to parse the reg property so it would continue working, but
> u-boot takes index 0 as mtime and ignores reg-names.
> 
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: mtime
> > > +      - const: mtimecmp
> > > +
> > > +  interrupts-extended:
> > > +    minItems: 1
> > > +    maxItems: 4095
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> >
> > You've also not made reg-names or interrupts-extended required.
> 
> That was intentional. A mtimer device without harts attached won't
> have interrupts (opensbi supports this), but I haven't come across a
> system that uses it this way. I have no preference here, what do you
> think?
> 

I think reg-names is required. The spec archive does not requrire the core
implement both MTIME and MTIMECMP. So using reg-name will let the DT parser
does not reply on the order and leave the room for MTIMECMP only devices.

interrupts-extended should also be required, it is kind of weird for 
a zero-interrupt timer.

> > I think we should swap the regs around and make these two required at a
> > minimum, but also "initialise" this file by renaming the existing file.
> 
> Bringing over the other devices sounds like a good idea to me. And I
> appreciate the spelling.
> 
> The nuclei/anlogic boards document mtime[1] support:
> 
>  - nuclei,ux900-aclint-mtimer
>  - anlogic,dr1v90-aclint-mtimer
> 
> K3 has a mtime register (at 0xf181bff8, by experimentation on hardware):
> 
>  - spacemit,k3-aclint-mtimer
> 
> MIPS has it, as per their patch[2]:
> 
>  - gf,mips-p8700-aclint-mtimer
> 
> Note that MIPS have mips,p8700-aclint-mtimer in opensbi.
> 
> T-Head has no mtime[3], just a set of mtimecmp registers. Sophgo are
> unknown, can we assume it is the same design as T-Head?
> 
>  - thead,c900-aclint-mtimer
>  - sophgo,sg2042-aclint-mtimer
>  - sophgo,sg2044-aclint-mtimer
> 

For T-HEAD, IIRC all the design share the same layout. C9XX use the same
layout for both C906/C910/C920. Sophgo is just a SoC vendor, not the
core vendor.

> There are two options for T-Head:
> 
> 1) Leave it in its own binding, because it doesn't have mtime registers.
> 
> 2) Use this binding with an optional reg property for the mtime
> region, which means putting the optional part last.
> 
> If we go with 1 we can preserve the mtime, mtimecmp ordering, matching
> u-boot, opensbi, qemu. If we go with 2 we put mtime last and make
> reg-names required.
> 
> The current K3 and Anlogic current device trees would need an update
> to their reg property to describe mtime when adding the riscv
> compatible.
> 
> I lean towards 1 because it reduces churn in firmware.
> 

I prefer 2. as the ACLINT is designed for modularity, it should 
tolerate one that does not have MTIME.

> > My ~assumption~hope is that all of the devices in that file have
> > implemented the aclint spec at the -rc1 revision that we're citing here.
> 
> (-rc4). Yep, we can move the majority of the compatibles into this
> binding. The T-Head family might be the exception.
> 
> Cheers,
> 
> Joel
> 
> [1] https://doc.nucleisys.com/nuclei_spec/isa/timer.html
> [2] https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com/
> [3] https://lore.kernel.org/all/IA1PR20MB4953D36ABE26822B62415500BBBBA@IA1PR20MB4953.namprd20.prod.outlook.com/

Regards,
Inochi
