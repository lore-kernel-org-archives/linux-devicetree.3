Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC652F29A
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071992; cv=pass; b=n+KqU3UGo/Ipl3n83roT/aIBaAumPdzVufLmeiGGv1XooFuTtPahxbJSWg360AJFxmYJdraAkV2mEo9LFfA+Q/jL+TQApk13gycx3dsneh4K+0tTRe1fKVD6HSivTLoTovg7x8Zavc+gKVaqw03QvxzIlNpj3AAFYnerGZ9fqNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071992; c=relaxed/simple;
	bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBb37jbVhl7jOmHhjZFE8Onhzm9Pspa3QWtX0a5jVf28/86YhK2RxtRWpu1CF2t9PeK4KBD/uh2sYz0iHlQU2rrBmRf7nBuWpk+/hXz5xBksrhXjnlyNez/unu0CiWs0Mp/l1ilIGabfBjsDJC7drfxL/gv/zo/XeMglNUrGuL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIsGQHnE; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIsGQHnE"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c985f055b9so861807e0c.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790071989; cv=none;
        d=google.com; s=arc-20260327;
        b=MiDP+68inIO7Uo4KRveBqKARmwFPQANmdBNHlL0g1stHTf7fIQqvmD3rr9Qb/8ohk/
         OtzOa0gAOJqWJp7zUVnyRZo2CWehWxWNpNIqr+lr/paajYJpAW+J7yGbhoL2vBsEdrTr
         mhB12kQoGs7Lkm/ru102I9NKNjen6A8dvseEX/8gIQgMW98KOhErjKMrgDnAusL+UteC
         AMSOp8JyP7rB6ip8muD/RlJXUU6tNrBE0+pRBPkjjrOgQb0v3gxnshQggofob7OsFtVq
         3r2epkFL0K+ft+/OvUCVY0aP61YSh4vXVLIQpj1/zDieuAcWBGPv4G++hwS7CrJA8N80
         Vf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        fh=Z8TDDuxguA9TavhWRhJ1nX35OKel+ZPbwJq2dWp3dT0=;
        b=CtKrmOz1lxHvFGC1/I4tYtqM/YmcoAxpA51ogTTLplx7ImXehB/qV8LtfJZwIZvD9M
         fzKG3hxa9aZpb/DADsSZoLy8UPiaQPXytomjQeok2smTNxl3AyNtWcV+M5xRPeQrzqOG
         5cE3P9wWMaNpsQ+Qz01lqrfO/j8f2iG7dHSxSS+4rIMItj1xuzXSmJwrS2KMzJStsbv4
         A5Ei1JcAOHMjF+gtOqTwDLcRPyhtb4VXWZmdRZQHwhMjbbhh8WLysjrNQMCF/NI7gAKv
         FEfh8E4s42fUA11kib1HkaX3YfSZyBYhZiiDe1DpKxVBibX2vx/8drdd/MfGWPsbLH0L
         ZfAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071989; x=1790676789; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=XIsGQHnE1pPlKZKqZgo4ilQtUMe4Cj3c5voawIYa1Z8Bh3WzEN1H8/7GoChObEaZVW
         G4RZsHUbNEH+/yAoJ7SB1VFNsbEl7hplQzwO7i9tjnKmCTWCkXOsYksFfyyQCD/H4koF
         w8utch5ZpXHMzcSx7/UDCPTrouFxQenf5hPqXLJKYjNyhbG3NQv06eHCSM9klgCX2oY+
         21WnEIAk9gzxld6HlD24HeKtJaShfpUtWoIrT1JiOWZE/mIulzWtk9Kxc/sg2/ThOs6k
         J2H/HmSbyhu8QUlqqZrhwM/opShTb785AFnOI0kiOp1Ko+gc4+J/nvtin+4EgKnZ2Ayb
         fdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071989; x=1790676789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=MbBaBlb9XjiEJAhLcl70t/GHaVXE0AxFg38aYkXPJNBwH+36T4bl/OKPdj4Z/YdMAP
         n4J8IGIy0XMPjHHv0IMCOy+2MjZ/cnqzuwY24zws/UO7f2LYiNJdd79lb649H3enOARp
         3BIl/ixESWsge65amlJs0cyc0T+7zaA5DIIrDnwL9b2LSujx5Ct8Eyf1O3q71ZKF/ffI
         YyGipAyV+pHjfG7zWUkxdgXJdPiKz9Esdia3VMZafSSQNHuv+6scmaHi9hqImGOYqCEs
         nhoxnzSkhU3lbTlLR3b/B65X2frz3JLzLPTWCisPZuBpMnTlms1E1hYyMpqunc3UddQi
         KO3A==
X-Forwarded-Encrypted: i=1; AKwUvBw0TIciapMscb8uPO5KsQ2mV8nb3CAil9m5yFTP8cUFy/Qj7A5oMP62CUN7LDbGmaj+SHP0CI73iO4C@vger.kernel.org
X-Gm-Message-State: AFuF++kGe9Wxo9xp6VIrsSf8e0lNpfjLHLs0Z71k6Hy0yM8ha3l9st8i
	PosYgWmwKRDlIjy5DA4Ox7egb1UyyQimSwH+790H0xSSauuKcHjSZm71T7FynhWo+DUayTosq2o
	6OvzwNDydYYHRRWnsxvLABR/5htnlNEY=
X-Gm-Gg: AYBFou232sQHNtbkG/9C+ikBxm8dquzSr8mxLTW8lhnFfcJKS+8w+OfDsmuyRHOlu/I
	68NRtX71BZ9oG5i4Rt1EUbHHGX0dgJg1XV58HW54EXBjkhRRLVaoL160djYqAkSqm15zI+oXsD4
	ub/GQqgTh0PlIS0CCUw+XVdGE/7nyXmnpMcj5MsSwWM+GoHnA7+qYdZF9PTF7BnS1Rq5QqNfrKD
	0MFEDo/+gRehI/JRHPB+ZFp6/CcKFtZSEGMJFx+NitPRtFAVIBjq0b4F2T8iLxfDj2Uf8D75GqD
	5Yo1RDjud0RI2ZtEkoEDnTy6XHh5pyJpSM6xOiYbQ/uleBDYsMU9CA==
X-Received: by 2002:a05:6122:2b8a:b0:5c9:9f03:cb07 with SMTP id
 71dfb90a1353d-5c9e343983fmr1483343e0c.2.1790071988975; Tue, 22 Sep 2026
 03:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
In-Reply-To: <20260921135933.7e8857ba@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 22 Sep 2026 12:12:56 +0200
X-Gm-Features: AcwNN1XO-IQtQQeBFy8m7z0RqgCFyAn_vcQf_nLSSDZxar5hmkBbTIMafTrhl4Q
Message-ID: <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 21 set 2026 alle ore 22:59 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Thu, 17 Sep 2026 01:51:26 +0200 Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> >
> > At times there were 2 different implementation (this and the one
> > from Sean) but Sean agreed that this can be picked and used in favor
> > of his implementation as long as his case with race condition is
> > correctly handled.
>
> Looks like the review for one of the patches failed so it won't be
> emailed out:
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260916235200.20712-2-ansuelsmth@gmail.com
>
> Are all of the issues invalid?

Only one is relevant, but expected.

The remark on the fwnode patch are invalid. The driver is expected
to return those error as probe defer is not supported.
(a notifier and late attach/detach is used to align to phylink logic)

For the specific Airoha PCS driver it's really speculation from the AI
but HW doesn't work as described by AI.

The only real comment that is valid is about the alternative way
to give supported interface with the .get_capabilites OP.

This is currently not supported as there isn't any user and it will
be implemented as soon as there will be one. It's really to limit
the patch delta of this change and to progress further.

Maybe FIXME might be suitable?

>
> Once the AI review is cleared, some human will have to review this
> and vouch for you as a maintainer. Better still be your co-maintainer.

I think some revision ago there was Andrew that reviewed some code.
Anyway thank a lot for checking this once in a while, I feel it's a pretty
important change but I understand it's complex to handle as it does
introduce a whole new subsystem.
