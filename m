Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94863955D8
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779318; cv=none; b=CXBCbJAarpjpZXU1JAEYWxRkzJUI8fAMHWcfVNRecf7WZeOp3Ho+9Z7G1UXpWc4tS8Wtdbet8DvxShiPlko9Xf+fKcC94q01KGbQVLviiQLmr2BgR0Q9mWSKfuo5vLH+KXMTQqbjj1s4R9qFlFkI5ve0H/ZaO4HQ0k1ilZHnNtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779318; c=relaxed/simple;
	bh=qz7YCBMeFmwfqIQRWfN+FmRZ72NOsmo/ZZAIld/ipvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HBxrfIh+8goSYcJ1oh3Zdfh34wrCyjVmy9A3/slVo4kNXhtcseQjnMJMe/RvmMJqTt4W9PxCwK6VxqRnoJhRNSuQsHYhkvEtols6HHihaAFEurHd2yIxXuXRXY9Vj/WqgatGvwyXvJ7f0D5EzCHSzxlD1fEQkgFGhD0mBUZOk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNUu71fK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNUu71fK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956242332dso20838675e9.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785779315; x=1786384115; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnDKjAsExIlIO6cGLAGlNzQp1IiRGZFjDF5mAKUFBPE=;
        b=oNUu71fKbSrPlOF8J98E3ExdEeWbs7gcoApY1UAYspY6MSyG5smSxN86AKKaAN1vpG
         ju+TmAm/zagDToky8JlgjFBZqa0jzHd94pQKYQV7V099Q9nH7dhvmVHgxdIvoqkfsXLH
         luOc6N9VFCzjTPJ6Au7rWYoL5rcN954bYXhvYJ+X+XLLc0e4PVtr9T8ZZ6n+AFmimwxc
         B/TmF4k8jGThMX3AfFj3dSAFRQRUlRkFRBd2BNm3Je7CfrJ7Y3eWdHdZt4MPhkG5skbH
         jaOGRcWtnIIQWJX41keIXmR2rDsL9ButgCtJIlgM5lfYP3MgTjsdh59j3whdYP5noBdO
         SnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785779315; x=1786384115;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnDKjAsExIlIO6cGLAGlNzQp1IiRGZFjDF5mAKUFBPE=;
        b=JMxQEXyY1w93j3Lfa04vZe/r0ZLb9TeXBE7ijG1NEuNcZxX6JRwwKWPJL1vUjyRp/s
         Wk/o18pKgjMZw9H6TH/HSxn9+lG5FZEvHakghEMQJzj5Rdu4x4v7fXL/mbzdME1kJm1P
         7s6LTFOlb+WlYEsPi9vBEmXCKVI+ZshNOyGs8nbvJ0XPBZ5oH+bfRfOGCeoLUVaK95Lp
         x+PA6StSHJTNoEV3FMysW9AdlnV6RczrKzjeGqNkcvGpoLaj1SxPyMyacYCB9efP33R9
         cZTWrG4cqwfeQ/PfGMIn1w5WwGRJGJeiy0YZiBnMUXGk9RqIWfAw11Z1G7CGp+Hc64oB
         YMAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqngZmDK2jTeAkZbpu4dyDLGNNn0gCKIp76afOe96jd9KGfmVK5+SZtzoazVxbYuftx5c73m8ymQ/XR@vger.kernel.org
X-Gm-Message-State: AOJu0YwQiv0x7BKMn7vWGBm4JqW8bhEyELXbgWj01jS69ucj9ue393nX
	i6+49bnA+v4Oa1aPPrTDrl2FmbLRD2C2J9TbKI6YcYLHaso99mh2FrlG7CCJSImW3U0Uvw==
X-Gm-Gg: AR+sD10l8kZzONN2qgMRonPFOHV1ZtDvYpwWiW21yMi83YSzuIyaz4IKIZ4qz8rvWWj
	dQR8knY4qKHZZ7wL672L/5SF3a2PAhlmvoi0+63AS6lUQMXanmEgJfk6/jIbXy8vk9PDg4YI7UG
	6YStF8BVp6iSmk5huRIEi8rIOoe+fxotrj0vTdah3uoyAb+qHxQ2wqW6vuqQXrq259eYSZowmY1
	0F32VuErUisLwwv9DSFoLrLae6GyTD+bd/eoJHhyT1g8G5SQHObreNc2ryfJyrqBIYEEKOK/Yrg
	l7y2hxukWaGJDP90Wx8o/7hod3UOKJsH21lUnuqbMB7eU8S6+UkNyWn3itQ38CySuP+SkWwBbSE
	A5k3tuALckWvUYJ3eAguwWKWWyJ3zVcsvkfXiH2gcKmaMqZOqUZDuvn849iS5tkoU1Eo1+Jih/A
	y50Bxt7tpKiwyIvgnj9pcQRVy7TO5nh4soGXk54r749tKP8IjlSvo3NbNMLQg4qMOo/vriMVxmu
	w==
X-Received: by 2002:a05:600c:314f:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4980c673252mr206970055e9.9.1785779314611;
        Mon, 03 Aug 2026 10:48:34 -0700 (PDT)
Received: from strix.localnet ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5b4a2sm295532795e9.1.2026.08.03.10.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:48:33 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Date: Mon, 03 Aug 2026 20:48:18 +0300
Message-ID: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
In-Reply-To: <anC72Cf1zKcLYWlC@redhat.com>
References:
 <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com> <anC72Cf1zKcLYWlC@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartnWZPMUIwR7W-Gw2dYxPvgg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartnWZPMUIwR7W-Gw2dYxPvgg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Date: Mon, 03 Aug 2026 20:48:18 +0300
Message-ID: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
In-Reply-To: <anC72Cf1zKcLYWlC@redhat.com>
MIME-Version: 1.0

Hi Brian,

Thanks again for the review!

Am Montag, 3. August 2026, 19:03:36 Ostafrikanische Zeit schrieb Brian Masney:
> > +	/*
> > +	 * Sanity check: Make sure all parents are there and write a clear
> > message rather than +	 * leave potential orphans.
> > +	 */
> 
> It's not common for clk drivers to have a validate function like this.
> That said, I know you are reverse engineering what's in the downstream
> BSP without documentation, and there is value in having this. I think
> it'd be useful to clarify that in the comments because code usually gets
> copied and pasted between drivers over time.
>
> That said, once it's verified that the clock tree is correct, can these
> checks be eventually dropped so that this validation logic isn't ran on
> every boot?

Yes, I plan to remove it eventually when support for the SoC is more mature. 
It has saved me some head-scratching as I have been working and re-working the 
clock tree. I'll clarify its driver specific role in the next submission.

Another option I contemplated is wrapping it in #ifdef DEBUG. What do you 
think about that?

> > +struct zx_clk_export {
> > +	unsigned int priv;
> > +	unsigned int binding;
> > +};
> 
> Sashiko flagged this as unused.

Indeed, that is a leftover from earlier - before I realized a simple unsigned 
int[] does the job fine.

---

I have a long-standing question about tristate/module support for drivers like 
this: I don't think the driver can realistically be unloaded. I have been 
testing driver unloading by removing the UART clocks from the DT (otherwise 
the clock driver is busy) and marking all clocks critical (otherwise 
unloading/unbinding will shut down the UART (and more) and lock me out of the 
system).

I have made it tristate because from early research into clock driver state of 
the art I gathered it was desired, even for drivers necessary for fundamental 
operation [0]. Did I understand this correctly? It also uncovered some linking 
errors that weren't obvious when compiling the driver into the kernel.

That said, I'd prefer to mark my init tables discardable with __initdata and 
think the module load support is going to go untested and bitrot over time.

Cheers,
Stefan

0: Chen-Yu Tsai's tak here mostly: https://www.youtube.com/watch?v=d1VIAnVb3hI

--nextPartnWZPMUIwR7W-Gw2dYxPvgg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpw1GIbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi7TkP/05WuGUn0opY7QQ8sZB6
OuKTG5SinWEzjuroAKgG/nD8WOveL+GRtp0cJ8+CUdvw0WpzZQeuRnSX/zDbSvXa
2G3pIBOvMcd0MOBBaEHUAtOHArZybsIuoFTVTzsaAYyHf2B7cc7KVbJZWRztmYSH
Z/OUYaxPHYoD6cHC4FlSNHyJplDqLj0LpgZOwY4zP0jaWLbEJpkCTK9Izl+ZIB4N
Q15I4WFfnyUi+J+3/mM3Rl4UYrS0U55ydarl5Io0PUsY/ORocxQY7jhXTvFyVmGV
xEythQnLVsvYici8F6d1tA/VcdG5jbo/JxRgrG53yGGuZX7x31CampUCrUOJRJ7t
bMsQwZz/VwpxL11Pg92G9bI3mzCHb+CZDRLT5zh+DN8cOkF5u4GBnI0CPKaqFAdw
deFt0WVnrrosFn0Vf0p17OrTiycj+f72S3L97DLCiH+0A02LR5XC6rxe5ia0xsFj
zXVl/z67OSLLN+g00eH/Gm7t6wSmRHdNY8QYBxaoIfY7NSPC4sfAm0BPcRfOtHEe
aN2QkZlUqy6LOPzLMKJXsVo1oXp94QXx5YgJpObLC1OH2GasPwX+teqCVXGyJZpt
we0fT64SnRaq5A4TfIcEcb2QJZUmH6znzcgROxCXZIJ1Dla1nW0ASQlNw2z5btj/
bbygfsidb6/n+WxVmEd5JJI+
=Lf/s
-----END PGP SIGNATURE-----

--nextPartnWZPMUIwR7W-Gw2dYxPvgg--



