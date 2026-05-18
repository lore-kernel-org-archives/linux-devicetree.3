Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845134678E
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104576; cv=pass; b=rQpPxe0/N6o+2jgKHGryKdfN0JNk1CaZ3pb7uUYIn0zPP+1JH6/5JAbQjC27pwspMBoEA3Cx9QqS9rIVLnFCnTnjiyP07bK50gnyQCrRmlHVC1yan1/1urRuhPE1DLjunO8ADxrMVs703favQ3x84a52NENgzwjerkRE5uBbbuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104576; c=relaxed/simple;
	bh=eJ6iS27yRakIf4dYz6C/Y0DusUAUtD+ryR5U+Q9ozcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AV1AVoXANY2IKkKzdqpJRWmIzrjRQ4v+yyxDVXJKkEb9VHr0L6T09G8KCmaBtuwB/V1W1CrsJpAq212yGCZ+y2biq97HcQok0fFt/v9CUM+QKRMJtf4WpP8NSFYaRvis2VFCNh9GQk1+6P+eqQj/RG2k2AZs6cAWBOA8biJMzaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJypSdsG; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJypSdsG"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-40423dbe98bso901633fac.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779104574; cv=none;
        d=google.com; s=arc-20240605;
        b=LmTqDUpOaqfFwb7g3w+Dr3uruwFt7f8D/piOJOGlwX2Ibz+uVYzUeqhdSUrBnpXLXG
         INsOJWUB+Qi0Tll4i1HFzJhub1PE6Ba+7oQsh9CWY/ujm4k11vPfMdF5DV/2nYcNb9aq
         8blH6MxMKXQgt/ZVzcMEsYilp1EGmJkjQPgkqVoSWNHJkmqbTk2i/sQN3fqiMRysfsRQ
         V+jMePI6Jj0HtI8DIacm0kOWrUpqIBBK0UR1NQk695V+K+TFNwlR6IWQ7WMAsie/3TCe
         iF3w+uSw2Bo5lO1kLUEiMQyir34gJeJVhXoaObMci210av4fSfLJ65SjI60kskzK69xA
         5anQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZSVFgnDLqoibhkNbK9QZ3coCLRNq5Ci4ji9hjqvuAE=;
        fh=hqDLjh6jasF9mtnbf9x/85/7Ug6XXMb/njW0WbBDCgU=;
        b=RMAd+AKdr1U/JxWyvExdeAzP+o9Nf+DKBGPXNMlL5FR5U26U246H2wM0NZCribN3AM
         T1Vuxn+JybWaL25tYhrNFoxZuyGbCPJZU9k71oRcVJq2cU+iD5iXs8jSXPrN4hYXtOed
         Y8p4CWGy6r/wKvKucBdV+UctHNTv3B1/g+oEMcCF66P9jUVe2RyPVmbM+EYbgL166Vjy
         l2EM6My3hflYv/h/aOXKLfCTq50G1oOOvR0gm1Za7pMxDp499CoK4VwGGCiPxxB9AriP
         7YHk7d/1tOf+P2TlVpd/4Z7IXRZbZWDZNEmKQnHFuSqh9KJR1epxaBHbkkyHo2gfXJxj
         YfhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104574; x=1779709374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZSVFgnDLqoibhkNbK9QZ3coCLRNq5Ci4ji9hjqvuAE=;
        b=oJypSdsGgLKt7n+LzPPxnf6laWcM6lAH+TuR15VSIhwssuo0/HtCkolSB2MmOEVgol
         FCuzxrmIQIWVYaNWR6yC1uSQ/RT2lW0sRyugmN0cNgtds7m+FcXCunlC/d5XmQ/RDwYY
         C4Rr3UXjACN3WCni3ha6RVg8to9uJ63/elvS6O8NX8up/tTu2D+T23yECCixNP5N3bTf
         tHLAutIADvjhxnix0AD9lmiaQ4VDsATOQpZnO7z+lBfcepLMvHgSMUMasRbVrbZs5kWg
         /7azJtaapX0zmZHx8MW59K1VsLaa5tG5EnrO13Fe/TARHIr1/81cxpRvvCRqC75TcGEG
         TVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104574; x=1779709374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZSVFgnDLqoibhkNbK9QZ3coCLRNq5Ci4ji9hjqvuAE=;
        b=p08is7YkVfAiGk+Sewth7rdc3qk94X9zJqvi+QiKJqslPXCvcZyrQ5VgdjH6LqwiBC
         NafTD5iQtw8/e69SJ60er05h/ar0RgHm2nuStOqg1DuuQoceS8J/olPfaaAWjTJUrJZa
         C8at8aMI0R3cq8ih7gUGHrOl1z4sfXnc3qTMGHZ0XaoRVjJy5wSqYoXCtwyon7lvMzuy
         YET17PmXwnwStRlW91sUwFADbP/rYPw6kwjUsYNZxNbP2Fls1709jSmiTZ7OF3GByfu8
         2AXtYlkk4LRgBkAw8VuuJ1obOVUu9xDJHy34SgqP80C8mmPqAca8314aVSvYZZlq5zcO
         xrgg==
X-Forwarded-Encrypted: i=1; AFNElJ/tsM9sndykMGmGIKZaiNafPU96REzlHT0RZoxB6I70iXpZbaPdbRPX268aS/pKCjBbQHH6LlT+B3pz@vger.kernel.org
X-Gm-Message-State: AOJu0YwxTkinXGzz4CVrfA3bMJuM98AZywrk5hv5uZM+CMAxlczCcLLb
	xgzEcz2FOj5lgYw4rLjfuXp6XG1S0y3Wce2cxnQNT3rJC4D4pGmZNuNnvKfh9grEU2o0aFiTnd9
	Fg1wCtUJvJfJj7ECbfSPPAUzCdSZTASU=
X-Gm-Gg: Acq92OE+6ge8bo0uNZSuFS0xBf3afk3yng11plNeOWPmS7RPEFVUk6LIuW0YdoLLuOz
	0ALfDCH9+RMjfY4w8wtjP+99bCTn0ZDMYx3tYV/Y7nzn5gPl1tj2B+yhMzVNY/Ipm58MyZQYI/D
	yzjtyworEqayF8IQl0ATIbIm3RQzHA2N1qwTeKDiUhw3Eu4g9zHqm+oX18afUySWzj9elFMlTRM
	X8sr4lbtk/cIdCgWeHW83BwFdnpIPT+x9W1xjQKHktkRmkvfY8a/V/MBqSdlqzXhkzqnKhbuTIv
	BN5u++iAQfm1ilGWlXRpwlY4JQ==
X-Received: by 2002:a05:6870:c233:b0:42c:711:a235 with SMTP id
 586e51a60fabf-43a2de6d4e8mr9184021fac.35.1779104574383; Mon, 18 May 2026
 04:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com> <20260517-cartoon-slather-ec5ad7605449@spud>
 <20260517-pulsate-shining-547432ab2ca0@spud>
In-Reply-To: <20260517-pulsate-shining-547432ab2ca0@spud>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 19:42:43 +0800
X-Gm-Features: AVHnY4K5bYIE3B-YL63O3FZeaOtgyPunJ0_rHmAr8AXg2dK5L-d96T8-eA1kvlE
Message-ID: <CAJsYDV+-VprPUK_CJsEpEa8ifphmp3ztHga__H=QWLoq8Jv4yw@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: add binding header for sf21-topcrm
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 4:52=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sun, May 17, 2026 at 09:47:26PM +0100, Conor Dooley wrote:
> > On Sun, May 17, 2026 at 10:12:56PM +0800, Chuanhong Guo wrote:
> > > +#define SF21_CLK_PCIE_REFP         30
> > > +#define SF21_CLK_MAX                       31
> >
> > > +#define SF21_RESET_IROM                    17
> > > +#define SF21_RESET_MAX                     18
> >
> >
> > Having _MAX is not permitted, but is also really confusing that "max"
> > appears to be max+1, so actually represents the count not the max?
>
> To be clear, if you need a define like this, put it in the driver.
> Bindings having a "_MAX" or "NUM_CLKS" doesn't make sense,

Sure. I'll move it to the driver and rename it in v2.

> and half the
> time this number ends up changing anyway.

This one will definitely change later for the two clocks I can't test yet.

> Also, squash this with the patch adding the clock binding.

OK. I'll do so in v2.

--=20
Regards,
Chuanhong Guo
