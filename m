Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73873AD517
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149193; cv=pass; b=aOwiWJYucCOOwrNJig1BqF9bAPoGQ9bOLZiuTLIb9BDgSThk2AI6ChvIOTboTcD0onJzNce51YAuniWHwVgDaubVj2KgtHW72CE/cEdwm5gl2Y25l+O3o2VlRDmELS7w8sbaDPPbNG/YUrWLPudlpeF/xFFaM7jOQdwK+SfmV3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149193; c=relaxed/simple;
	bh=flgCWjJ0Vcdob2VFEhwHid/TpVFCevn8cCNPvWAm4QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/6pfHeH4dMtkrbJ4o0p8R3su6klCyJQEU4c1gbyD+ZZZYpD8WORcwhYv8n9Nty9/UmY7YiDvroCKwphNKx85NxITTXqnOLzZj+iJTib3OhRn9WKKbX6Gumbxlqedr03Px4vjxJzQeuBg9JKCfBzAxPLSWRVlfBrdS21J6jn+yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=SRjP+HkG; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="SRjP+HkG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so7264765e9.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787149190; cv=none;
        d=google.com; s=arc-20260327;
        b=DrmqpqOe4dHEBqDevD6OBksLpLqq/pf12GrV37McVERxzE/xP8GiVtJBLDoVZFUgNR
         EKIPPCIdFfqhMbBJVROt9L03KYcIvkB749tRGESFeA0bherS/dF/xp5/+Vj19fmnYHgd
         kU9OJGs7Ms2lZkhwX4ToxY2TVc/e3fouaNJ9O5zD3GQsGPL07q5svX7bjD67+gi26KpK
         rZYVrSpniNxlHpLchDkCwUMbx9qRKe7LALcJTIo5SoOlWb/SzmwSADUTc067yuj65t7k
         mS+6suksi6N5zB3OIrK1lXASIhlkziortQkr10Ixpwr4LnA9NE9GiGooMiZd/124R/vq
         7GWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MeJKUhVwZjDQ5ldC5TBiCaKL9cckQ2oDXCu8SH2HVSc=;
        fh=jp96bsPfRlbFFCm9Pof13e8D8sY5dT9m3zAA2857p9o=;
        b=sc0wdVUlRMZk6H43nVJAeXbOg5EWRI32PAJh3Bqd42ZVmQq9YbuGY5xxty72N1NDDZ
         P9WFw0quPlqR9tzjv9C6khjKGLj6/2QhSpW4VeUt5E+J5mBr4Rks0LenFlmR1EYCM8Mr
         ooK13HVbw08G5Xxi+TbO65hLC1f2fp6EcCeCGyc8Jo4VZJ/sB5Yodf4qP9wLE66Mscvi
         bWpKjfYi288UbBuo4N01575nGqAhKteACRNqv6TBtlkkCrpis8im3YknAgNrshn9zEgP
         noe3kJ6WHxHjrawDuOMBJ/QqtMW7f90SsrLXyJH7NhLRYrjIof08h5PoH/LcAJs/d8Li
         Jzpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787149190; x=1787753990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MeJKUhVwZjDQ5ldC5TBiCaKL9cckQ2oDXCu8SH2HVSc=;
        b=SRjP+HkGPsLTrJ98PATaLU8/WYmKptYO7WDrS3vkPjAwGmJUhbvuouoKquAwK5PnXa
         Yel1kYjH14nllNyZ7rNCS+nSgn+KAXmoRQ0Kqst8Ec8NML4o3AKHwSNodNsKtBq01VPd
         W3Ctbphgpbw+Br4NoiMcO7MxlnKPyVcsqhK0Th2DLVux+/jC/GD8vF94ad7OGgnNUFJb
         qAhNZPHspDj1+XdCRKSQl47vo7XkEwGaaD88wd7ODjyn/K4ao5/xBBW0hjwILI5lNtTD
         bj9oPftWoT5DUHbrza6BpOLChC/U6CQgvUpDCG8pn+nkGXzAfr5J8uyFSO3jU0ibXx4R
         pCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149190; x=1787753990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeJKUhVwZjDQ5ldC5TBiCaKL9cckQ2oDXCu8SH2HVSc=;
        b=dMH9Ag6uBKEFjrqzP+47Oraji4KkC8eBbeY9OuB0/cX8d8VrARXcYFnKTLdmN1iQSJ
         O5MbTnp8ysSt1HUSSjdfy4FeRR4kVr/Z8gS34CZk7A35PbQMMrGCAlmWFxiVu/23f4sF
         iDly6cfbOoIfefYWdgUq2YO6AYK6pk7f4Ubc+y0cah35Xl5xe0K/1aB7TGavabgzV5aB
         PMg1FnJLEn699SJfm0ut9j+d7PziELMHht+4EAR1EAWNpL4k/Z3xbwytnEUjBlHhPIvP
         09+D4AV+lolnbIndWHIEn3/koS6XSDh+th/MzGtx9Om+jv4u6NMuW8Sdac83Mu+mRdoe
         8CIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+qRoNwJf22hCJhEoFlkMBRfn+uDqnfV8chdct3Y+T3osjbcmOuyxLZzfYECi7tl2e0at7YJEVF2ax@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1+1ytvjWJ7Wu/cyah26q8tC31s3+bHjxxIASOzbioJfQpqvtS
	6G+Qwl9zG+nrNkBDVSbIOjAldeByxaq/Z/Rhcium+yGxwg58rqerHp42bMH/04g/uuI3/DkENz6
	/pm7QwRA/Ywi582ZbIhMfeGubKSsUS7P+1X9xnBnqSw==
X-Gm-Gg: AR+sD138+obdiAaaGrQt2sIg20/9TxoPTc6PA6IgsarPXgbdAS90Vd8Tj2Qjqc4Kw5A
	FPSGt8XxdkDcc6rgqBtR+Vzta38LR5q4uYpNqk5k6VkGtgNcZqEvoNGT89aXBd5905k67HKaaxi
	YomKHZYrztMctUL49eqXRe1vs4OHbuEAj+wTYWduL5sy9r3E79fd83in/fExKb8nOloUb6MFmfw
	bJ6X0jlEoBLU736BcM80puuFO1IG6yBXQYS+CT3hsbBbb9DGmVLgwVvZEjz5N0rMJss4KG5lijI
	wi6bzmGpaZJuK+r4htehBl/0z03dHjUnwCi82/CeGHStpIWObV6SEz4j/Q+hvQD1UfPgdiKRgIN
	pyEzk1P6FO2w/yUhkOq/64hKA8wDFgpetKoQ=
X-Received: by 2002:a05:600c:3485:b0:499:a685:c10 with SMTP id
 5b1f17b1804b1-499aa19a3b8mr105118355e9.4.1787149189928; Wed, 19 Aug 2026
 07:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-4-fd7cc0b338ea@9elements.com> <178714815308.32179.15619694497271022262.b4-review@b4>
In-Reply-To: <178714815308.32179.15619694497271022262.b4-review@b4>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 19 Aug 2026 16:19:37 +0200
X-Gm-Features: AcwNN1WSp5z3ykm5DhYgUXUEaifqr2FKPqOZiTmJSVGHJcNVXhm6Z3n9CL5gr0M
Message-ID: <CAFi2wKbvOX+E=nsWuVJj=_xQZQm=vCA=qPWwzgJF2oio2ov_UQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] mfd: aspeed-pci-core: add AST2600 PCIe BMC device driver
To: Tan Siewert <tan.siewert@9elements.com>
Cc: yh_chung@aspeedtech.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
	ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
	=?UTF-8?Q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

> > +ASPEED PCI BMC DEVICE DRIVER
> > +M:   Gr=C3=A9goire Layet <git@gregoirelayet.com>
> > +M:   Tan Siewert <tan.siewert@9elements.com>
> > +S:   Maintained
> > +F:   drivers/mfd/aspeed-pci-core.c
>
> I think it'd make sense to add the linux-aspeed list as `L` here.

This is already the case.
The following maintainers and lists are set for all paths containing
the word 'aspeed'.

From the MAINTAINERS file:
```
ARM/ASPEED MACHINE SUPPORT
M: Joel Stanley <joel@jms.id.au>
M: Andrew Jeffery <andrew@codeconstruct.com.au>
L: linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
L: linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
S: Supported
Q: https://patchwork.ozlabs.org/project/linux-aspeed/list/
T: git git://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
F: Documentation/devicetree/bindings/arm/aspeed/
F: arch/arm/boot/dts/aspeed/
F: arch/arm/mach-aspeed/
F: arch/arm64/boot/dts/aspeed/
N: aspeed
```

From the linux kernel doc [1] :
> N: Files and directories Regex patterns.

[1] https://www.kernel.org/doc/html/latest/process/maintainers.html

Regards,
Gr=C3=A9goire
