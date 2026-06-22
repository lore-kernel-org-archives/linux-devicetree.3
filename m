Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F321FC7
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 00:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782086771; cv=pass; b=rWvzBybGgy2fc4aFy7HhxhuTBZ+CbQ6iyH8BKqPDuAx+Nozz/QKghZKwqgpHQvFA7YbLEgtlwgdtfw0cX1bGEqLkU2kivXQhO7GaTAp2YEfDL+IRaCRVtvqEaubiyDotjgdlY1TJwl+5yNRKp0N/dBHCVRBY4UPSVt+YYTvFBgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782086771; c=relaxed/simple;
	bh=ErQ4AksUVGb6gjv5g0n/ymeD2WyZRJFl5+vFM5Os5cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iu2TFzSBbt1VgxbyarTdQydLc5SojKpW8/lA5SX1hebruc+QkbI1OctEBNeOFnFkgcP3cA8MZmhR/FPh8k6b6MLA54YtDNP/tOakeWvZrPQhhmBuyBcAv969Upq0YaQ2EVo9+NGxFTrhy0OAW59MEFryCFeFtupNr3Upcia2Enw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC+BebHm; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC+BebHm"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7ff0645d1d0so32206507b3.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 17:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782086770; cv=none;
        d=google.com; s=arc-20240605;
        b=gYO04Sr6V3huE2mvze6EC1xk+KrJYV5ZWGpL2Xyc4H5xHtS5Z3d2FFgw6nVWOQOskq
         B+inuT9HF/T22dCBXwoAo1gYS5oWnzHkE/qgn06qc6dVVRXaKGHhnPQ7b48mzwytH8bO
         JlsjB3HnID6989cJO2iHITU29CdriBA5tJf9brnZBojtOx8O7mmi46xeWmerr4IJpQ63
         viZeCop9qyfzcvRrVXC0u2og51VtL0AJFRHbWLb49rRDHcrH7dN1/bJmkiZQpqjygeky
         kVGUnf3K/dzYXq0xuhNNVgwKHKhRlhPYOWY3S2AHOla4K8DOSRwYlUu7fdZbeokvGaNQ
         vamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ErQ4AksUVGb6gjv5g0n/ymeD2WyZRJFl5+vFM5Os5cc=;
        fh=m479QwmGJRwBEs6uN8v9A+zNVMH3Q44hoIQtFCG3xC4=;
        b=PaIIYr7Xr1c/BqXGaQW3mOwaKK60wEc6V3DIzm0ELeEraBi+Qw58Nibu4wVB0iBMrx
         9ZGtutwDIuZLsXSe2WYTi7Ipw9ISKfdIK0oYRdVODHBwNwxJUh+CpM0SlqOfs0mRMpoB
         IbKE+qBCx64KziYxj96uFHsmjqHZmsNtaQor0uEizf9GXKRZTm8f2mJnl1sWOhmyPkVp
         bARToyEf9vH3a15rZxfvaEojpq80VkfiQGhTOY/D8UHvXSHApF2Q1t3z54EYHXNuba/R
         NjSBWuOJrU2CO4je8L4VnhRwgVGHNYQtCMG0Go6zIdsyASDCGvK5uLCpthUPu+fo8o/a
         vmZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782086770; x=1782691570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErQ4AksUVGb6gjv5g0n/ymeD2WyZRJFl5+vFM5Os5cc=;
        b=AC+BebHmg1S1wOnsAx3mrauXA4vyK6jqtemjwxloIAsaeIzl1UfLFTTCwJNZ4zbrVu
         avewA8M8Y7tTJLi8sfwW+76LRh4NU1t3xcREVpnehUPZEdj/FLP48SOBO3nmEx1W6apg
         wlCb8lhjEj8l05Euul0xvF7TrGhrnkh7Y8ctzpyHaeHo+JxxCo0ZFitijFVDBvrySFJH
         U5CtjUeDpH8IoqTN2QjLZ2K4yYHGfBNid9OkHUKgpG4tNueau1cK9vSaADiXatHdtGAR
         GJfOIT0ueZxNvjR+uUp8iRAo2nkHnh8u7PST1YcxUo6qw/BOy8jkkABi+WiimaCmSNjD
         tmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782086770; x=1782691570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ErQ4AksUVGb6gjv5g0n/ymeD2WyZRJFl5+vFM5Os5cc=;
        b=O5lxif+Mh6WzoSVoSULMhstRpnU2CbVzw1sO3E6+i0kGDw8d9X2UzGYQIndocS58Uu
         hBvDw/Fpo3FdHqDLnIJYSN1Ue3GECBwuliCSyLjF1xdhUjERicoxERLRWKISXS+E2pDq
         s4+idkBCtaXH7DDV0KrOdIVytP2um+m5GYLuoOkfRygD5+bB3HiJA6WlN6dGJSjVeaXS
         SPhOIu6xjcfIMyvqKY5/Rvw0PsDLg/ABTDTHuPk6TW7Nj3TpJSBOW2lCvlPlKuXo8Bwp
         nHUI7Kkq2zNxvmtDT3nloEiiKNFXUx5wxRwY0N5fMoiCGIvwB5uU3IKggIHBS68WFH7o
         IlaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKftIWkJ8Oy3FFQqJEaD0p+vr/tl9laqJaxtMnR6LFF+/kE0zETkiUl0EdC5YVS4GtC9rGjf5JfcmP@vger.kernel.org
X-Gm-Message-State: AOJu0YwlZ4GZuK2JkNzRF/53ejpueMNFYdPP3amPKs0zB/Pa245Sqw4Q
	VQAx4E/olZIr9qLGBgbMOQY14EZLXQBloO460rIcOrCVBU8PB4lHtBIDAQR1v9jgC9e2hK4/GId
	yNJau7chMCye9Ev0p+mhN8RSjY6yH6pA=
X-Gm-Gg: AfdE7ckz4X7GAikutxCPrQsRRVheooqIAwSJ7P9N6YlNCXFeVdY+/1b7zZ2h/QIffz1
	OUIlh/CC8WjJ4PmOeEZeXLYh/DqrhiPS3H4noEtH0nVQ+PGXODeixVHOSNpng+5Eo0Fjxe6uhbS
	c0lBGRCYel4yojVMxK7Spv9ixjg4CwJP/fRDmtwOUxn53QP9cPSUBhoZek77sxowHA08D0eoTd4
	HCcMtI6/+Sw6+QhRD7xtB5uiY3YQ+AN4BRixHNvJEjgskokkCZzcD7PMJ37HQ5ipWel2xf640Zf
	m0s6
X-Received: by 2002:a05:690c:e0c:b0:7ff:5d6:201d with SMTP id
 00721157ae682-80134c779a5mr119196487b3.28.1782086769621; Sun, 21 Jun 2026
 17:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621004626.66629-1-m32285159@gmail.com> <20260621004626.66629-3-m32285159@gmail.com>
 <20260621203303.0f8c5d08@systembl0wer>
In-Reply-To: <20260621203303.0f8c5d08@systembl0wer>
From: Maxwell Doose <m32285159@gmail.com>
Date: Sun, 21 Jun 2026 19:05:58 -0500
X-Gm-Features: AVVi8CeRhaBHZabaiTeL0-n8AlAEkTYDZRkLcdAkn06lqtsN7fSD7b_D7f6hllI
Message-ID: <CAKqfh0HUih0q9PEh+5pwwMuBBkm6nsaZP9e2yPjHO3+Yccuvgw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: temperature: Add STS30 temperature sensor driver
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 21, 2026 at 1:33=E2=80=AFPM Joshua Crofts <joshua.crofts1@gmail=
.com> wrote:
>
> On Sat, 20 Jun 2026 19:46:24 -0500
> Maxwell Doose <m32285159@gmail.com> wrote:
> > +#include <linux/array_size.h>
> > +#include <linux/bits.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/crc8.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/errno.h>
> > +#include <linux/export.h>
> > +#include <linux/i2c.h>
>
> I am a numpty as I also forgot to mention a missing
> mod_devicetable.h header.
>

D'oh, I ought to look at my includes a lot more closely as well.
