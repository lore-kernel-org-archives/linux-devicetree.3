Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C65629AAFA
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 01:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784941296; cv=none; b=bD0p8BOxYJ0mQFcvnHiwH+pdRXNO/pz8tCX7JauEKE9UPbvdciu1p/zi8KbzLRAXuYZz+PTyKKbNeHD1iBgQLXK4Y/3qW+0OvPzkIHhMEz0ovWokhQUnES97n/tXBsN5TYp5qWvbFKjJC4Aa3X8bde6yL3F4Y/v68UXhW0XSmgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784941296; c=relaxed/simple;
	bh=t8fxi+lm5mZk3h0QtiD57w12TvuQE1dLio/9A3tild8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyr1LS0YmQDhaHAeuR8yyNrc8nHsBKlS907TwaZM0kFTJwXcrGdsmasI/PPUwYyTcSd75soDUBv/iFj+dxmBoqnEpCCgwEizjmD4M8d5z9F3/IKkk4gF3nxQm5PdQXyj+qYTqpFJrEVBv1EYlkGoP0QelzNOfW+3JRX0IDcqq4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Me7xOFFD; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Me7xOFFD"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38511175ad3so626437a91.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784941294; x=1785546094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eL0z5oMGThYMtVLCeXNbkW2YxtHOpeXLeMPRqOdxPNo=;
        b=Me7xOFFDcTZmHUtjyjB/g4g/U8yE8riYwzxblXevm4BOxw8sYSkcnOLO4ytUaIHfec
         YUgwdmUDJ2zsgwKZ1RrVg8ZicO3jqpZq702RWIO88dG7JFXbjedCKWmIRYhc1Ipg2AqB
         l7LI49oHgcyIgucSpBjna57QhY6focxOx5WLhTIZextYldDwiPwPBBBLLzDssKzTt3mn
         OQLV57xxQ8afBZKMAJHopqCpqniXlrN0Q6IH8wYwznv9aDJCAIdolDP2Ziuz4UNcfvlZ
         O3I8unzIK2GMta15fvLiWeAF2Pzooe/hrC1AMKfMpSKh44owwsr90nXO3bdNOwoA99B4
         o7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784941294; x=1785546094;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL0z5oMGThYMtVLCeXNbkW2YxtHOpeXLeMPRqOdxPNo=;
        b=OUxwHU6oO5uN1wU3PNF23W+SRAw9RpnxvYVxJRDUpvG4Y5anoDeBHfjTHYxf4yqSe4
         4BiHo7JK9p7wAg8CW/YsPbRneD8aH+cqn7Yn6dkJ+vt4EW/Du0TVny1QKTHsz9JlOPQK
         v2+Z4BduFFgAdMqpYZ1dIul/NvcYEpn3+4Sm9EVON3qklgzfeNSg/joZxemDS8CnDh/J
         XuXpBiHiPq57LV9NkIRB1Hg9P0zcgQUPqJdy2wB+Ixr2+Veu016CXVxbEi/f8Ksn9yb5
         L6VCqki+dUg5wf8DgP1xth3aAGRvVDA7xmM1KiNZZV47BLx7wNK5Hp8VxrX0Yy4PbKQ1
         eFLw==
X-Forwarded-Encrypted: i=1; AHgh+RrpbuNVhYNq0rZpk4bgOXDNrsf5Kwp94wikwsiNlTu50fNG5ALv9xaIv6L1RPbNOkwxHVqTwDZzEP4O@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ+Y/SLiCUa3nWaHcOujfcS4egOGvma11tBGTeMcuyyPI9VZ9m
	YcLI6xqJUER96KNVLHOZ6OK5MauoXYaNeqPMTZrbfeRVKoXx1Hh7Ay7i
X-Gm-Gg: AR+sD12B5AoLZuCi8A3T8Twk/m9aLQIJoTuuUNZ+ySdnx1YyHyfuaA2TNTdh30oASLc
	3/I1OCrT7zPto9Drwg/VpRWq3bzX5U4KmjnD1GHy7vC3eACtca/N6pQ0p7xCU7JSeNBpBFU4p4g
	9OgKSagz7+1IiJGt8VCm1U7o9sxMUHBD9UTAcE3vWKbBm7A4EHsqXL+zNzzSRvOZ4PpEjpduP5b
	LB5CUQjWyJqL9rL/3MjiW0ZIDgkvgEGc0vFQ6W3rAZsUIy1DIvsiePSHZQME7E58Y0ZnkVAjdxk
	TEXJvyZpV8neSyhYV+GHvxQNKubAhiBm83qlYegy3u0vb8nOolngsHpbXTh5F9lDVcd6YLxCWbm
	4szz1M8wSr2T4pjuDG1mx0XVojhace0w7fgdzO6QuRyaO5CW5cFY6bRsvX7nvyg==
X-Received: by 2002:a17:90b:3bce:b0:38e:e0b:320d with SMTP id 98e67ed59e1d1-38f297812c8mr631281a91.41.1784941294392;
        Fri, 24 Jul 2026 18:01:34 -0700 (PDT)
Received: from localhost ([2001:da8:7001:2000::1:5491])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03adb224sm2297589a91.2.2026.07.24.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 18:01:32 -0700 (PDT)
Date: Sat, 25 Jul 2026 09:01:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for
 the PHY on PICO ITX
Message-ID: <amQKpgD7NKlR8qEE@inochi.infowork>
References: <20260710063314.1030249-1-inochiama@gmail.com>
 <20260710223804-GKB106000@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710223804-GKB106000@kernel.org>

On Fri, Jul 10, 2026 at 10:38:04PM +0000, Yixun Lan wrote:
> Hi Inochi,
> 
> On 14:33 Fri 10 Jul     , Inochi Amaoto wrote:
> > RTL8211F require at least 50ms deassert to guarantee the register
> > access, 10ms is only enough for the PHY reset.
> > 
> IMO, it's kind of too trivial to split into two separate patches,
> while duplicating the commit message
> 

For backport, I suggest keeping two patches, so it can be backported
in a more clear way

Regards,
Inochi

> > Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> If you agree to squash the patches, then should be fine to put both Fixes here
> also suggest to adjust title to be more simple and explict
> riscv: dts: spacemit: Increase deassert time for PHY RTL8211F
> 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> the fix looks good to me, so
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> 
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index 1eb5abbc61f9..b2a7d2d0d3a8 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -200,7 +200,7 @@ phy0: phy@1 {
> >  			reg = <1>;
> >  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
> >  			reset-assert-us = <10000>;
> > -			reset-deassert-us = <10000>;
> > +			reset-deassert-us = <50000>;
> >  		};
> >  	};
> >  };
> > -- 
> > 2.55.0
> > 
> > 
> 
> -- 
> Yixun Lan (dlan)
