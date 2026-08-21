Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FA041F7D4
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299277; cv=pass; b=X/X2kgOhauZ9Gt4w7nphQ6V35HokpRDKk+AXJGU6EcXSWuF+d4lM07Uiol6+R4qGX67ohmJuE2NNWgLCoTzey57x1sCQCUWa+iTJ2ggqe6mnpX7FhwCAvUIbhg4IDpcIPCvQwCcsxAu6qhDzsJaKw5e6Ahm2Uue8b7dtLaa2SiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299277; c=relaxed/simple;
	bh=U9fW2jiIlgiy2XPNBkMcmqoyzd/7xupfaic+yOZJQF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJm3s6yHj5Ftf6BVSEiRDAv+QCzII2uFEgBhTH+bIz9G3sNRXVsuQlSiWeE/wQRo3tpJkUUaLu3J6FcclI9mwfdIWTnGYSg7ikZRTjCkNUMkUoqXYoTAPK3DxiPiS3EYIqmRyMgGpMNIJZr425M9T4TyqKaXcMxzmWCl7h+ErUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRalVaau; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRalVaau"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so12238555e9.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787299272; cv=none;
        d=google.com; s=arc-20260327;
        b=SBwqPHXWmgKpTBx61cWtg/DaOie/0ufUKIw4wiTxj0nVA4yv1uFc7yk8vPnhHX2Cv3
         RYNZgRZlNJfGcCLWlH6WQX4vigK2kEoH8zCm/BR1MEI6FhGqj8PSw35oR35RsNaBe3t8
         Nw7nVuWspPWm5nVhsoUJMcPmaAxTZCv5uX/Icicwnb0Q3XyiLoDHsd2v3PT1ry2pFCuO
         DDmbhNw0/B33hXhNJAOk73DyBPPJ2Wz1HeOiQCKXe+9jBocjBty/qsz+EdaStefAqksK
         OoqteMz8XpdgkjfY8x7J9AxhfpM4RsFvkdWvxJ3CKVjmXamdpubvFTJXfq7f3AQ6YvaA
         /yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QKPWxLRibVTkF5iNiz5OZvS7ih6dW481F+oBUIMZp1Y=;
        fh=xq/639j1MQa6ae/DWrFZpBcqPlVILi3zkQ7KXZ9iUG8=;
        b=depBXtVi0SrWmHm1WyLJ3CAnBD16qd/NL/xZuACqj0bC6jV9Wq89MYqWAWHZwGcfOe
         PAN+Pmeafyt3EPfMKySXXIioIh1voGnQP1RdqW7GGeGNcHQVdI7Ymo8OwFsPcRSu/6sX
         yfxYtubk7j6Z9x+f6PRLqkm6J0p0/hxyL6zLaVJBvOmrlPh63okEEdXyjCWjD9/Rzmuk
         nFR0SIKVvZeq3Zi4J46uW2m0k3pKiEj1x1hvnXURheT45vW+nWAk1GWAEVQrbE3GV2tn
         aTeE40jUm/24NgK3bzNZbZWKa54t7axMuylH/E3LTin0ofHO/7/zsqy75mMcIieMhrZK
         Tr5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299272; x=1787904072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QKPWxLRibVTkF5iNiz5OZvS7ih6dW481F+oBUIMZp1Y=;
        b=PRalVaauxqYvmik87uJ22HYTJ5PVuJtJr1516MKaZhkGQgmzk2hieAoH3YiPKzF529
         0AMK+/LZAc5hELwACRj/riNzJxj1Rr/BhpDxQTtDvzzyh1I9bg0OsFUQXFtncIUd2NQc
         1FC6IYHD3fMUDNr1xJyEb0FGdhTkAjB7UD2L5dy2xjwL/FbeXdxsk/DHJQqH7y/3/bdN
         0V2cS8Q3cif9w78iKi5o/BN+NsgdLpdBtXuqkkuHdzsRlpc9VS8f/mZpdtBbkGe86hfw
         GemE84N4fVlbefBg934ONbL5iJJsR5jLZEif/lad+DlEHcQxvgiTa0tpXCjGl+Y33ae5
         qL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299272; x=1787904072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKPWxLRibVTkF5iNiz5OZvS7ih6dW481F+oBUIMZp1Y=;
        b=e9E3Z1AqQeegWLNxjnHoV1M85yw4Qd8r8hwP1BnLGKUCKn9VRhUGwSSCJTidsaCCow
         5lsEywcmPeYcM0fqZXpFdYu3ATguGYJvuNYQJbtp4mgj56arCDZH8oIIk/YlG87llRbF
         H11GyZxliuSKh1zAJsgLXuFFw0/X6MOw4EgRPswGpBGcJeCy8kNHxwTjRjx13rT+jHTL
         NJBpt7WKsIOrkdd3Ddb/CNcrD3uFKMxNi758UeVYdK6SG7InIh7k6q1b6rScGIDNqAyS
         WfdM1dkdQJIbL05iYjVJzcCTLSSWbIYw4PEUXMG3hNzzyOLEu8PVqwHhyXPPZon2A7Kp
         odrA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0PiWK/AJfyaYOVSRgy0Bt4jEdKcdrQlTpkaWTotRfob06VVnaVtvu2OQMb2RFL9tjRuOFUPx3ai3Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyEqIn50Lm/Xq3XAQ4gZW2zkJgAhtsKZ3n8p25D7GFJcLGjXm8a
	PWZL5UhjZmoCtH1EChAf56O+Zoi15+ZmYFMMT87SB43qV9pa8r7RFUos2je/VpXzWmW6ZvuSxRD
	udvV2gSV3gwmT4Agg9O7lPf7Kjjs3h2M=
X-Gm-Gg: AR+sD11pyxZKiTvMf9bqjGIkHRiCHORf+jvpeMi7g67wxcnh25RedGBeOfuR1i+/25+
	akYCEvbQSRU53Gxffrr6XkEYKZi/ek3KNuOsPGvFOwoe4HYEAHLnrKqmPEKq9a0UpSTi2IqoCaz
	QYcpNDDsGEd630eu4ClFwwWGwHtBqkATvTqalfxZVh0olzVdGiSIk1BA1ioo+ag7+n6jJhqw71g
	elbjiy14c/DabPouZDA6uCcyDjy51IAURCAJIhyKEYBFHo4xiiDXe5LByPgaWkd/L3a82I6Hglt
	Of39s51bNcfs50mOKoVXewZ3jjpwi15RoJTYviDy8CHtYntgYXDcv5au54Gq6eUKgglm32DNK1u
	5qxeOeROoKJz1zYT/qIDK8+ty41XC1w==
X-Received: by 2002:a05:600c:8b63:b0:499:7f37:cb74 with SMTP id
 5b1f17b1804b1-499b06a36demr106804725e9.1.1787299271891; Fri, 21 Aug 2026
 01:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <aobjCr7ZtpLmL3VP@ninjato>
In-Reply-To: <aobjCr7ZtpLmL3VP@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 09:00:45 +0100
X-Gm-Features: AcwNN1XaqV7v4Jl4yl1cAvUjpTPOAGoBa_Le3wz-UFXRDSKArINsOqo29E76N9s
Message-ID: <CA+V-a8tpo2Rc9xsvsj9LLqD2ZjoHzRAVsox=7xURAtwA-GYVEw@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] rtc: rzn1: Add OF match data to gate SUBU
 register access
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Thu, Aug 20, 2026 at 12:20=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Aug 19, 2026 at 11:39:24AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/N1 RTC driver selects SCMP mode only when an optional xtal clock
> > is provided at a valid rate other than 32768 Hz. Without an xtal clock,
> > or when it runs at 32768 Hz, the driver uses SUBU mode.
> >
> > However, the RTCA0SUBU register used by SUBU mode is not present on all
> > SoCs that integrate a similar variant of the RTC block. Allowing SUBU
> > mode on those variants would expose RTC offset operations that access a
> > non-existent register.
> >
> > Add OF match data to describe whether the RTC supports the SUBU registe=
r.
> > Reject probe with -EOPNOTSUPP when SUBU mode would be selected on a
> > variant without SUBU support.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I still think, this code needs a change:
>
> 454                 if (rate !=3D 32768)
> 455                         scmp_val =3D RZN1_RTC_CTL0_SLSB_SCMP;
>
>         if (rate !=3D 32768 || !data->has_subu)
>
> otherwise having a xtal with 32768 on a SCMP-only device will not be
> accepted despite it should work.
>
Agreed.

> Haven't checked if that could simplify your later has_subu-check or not.
>
To reduce the checks I can add a else if check like below:

/* Only switch to scmp if we have an xtal clock with a valid rate and
!=3D 32768 */
xtal =3D devm_clk_get_optional(dev, "xtal");
if (IS_ERR(xtal)) {
        return PTR_ERR(xtal);
} else if (xtal) {
        rate =3D clk_get_rate(xtal);

        if (rate < 32000 || rate > BIT(22))
                return -EOPNOTSUPP;

        if (rate !=3D 32768 || !data->has_subu)
                scmp_val =3D RZN1_RTC_CTL0_SLSB_SCMP;
} else if (!data->has_subu) {
        return dev_err_probe(dev, -EOPNOTSUPP,
                             "No valid XTAL provided and SUBU mode not
supported\n");
}

Cheers,
Prabhakar
