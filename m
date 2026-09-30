Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5442E5158B9
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786746; cv=pass; b=ebYpyzW6Vo77vqOEFRYk9UZpwna6A8SvFFgZXJSe9r7rq1Lrvj2H9qBpHZ8XmQsFQa7/uPF/44jdElPcZn8m6zcYa4PG1BRZcKIRpIMpF+y1xctOGr2gzVPo5Up0GAuCvM5RWO4AXY6Ow00MRV8QOngAfXqeLqKrbbzMDPY/ASc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786746; c=relaxed/simple;
	bh=bhyLwLX3Cbs39RNIdfvjdkMauqLBTv5+SoflpxyeT3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mw0wMeNAyxcRCtB58bNA+GI2NaHJdWYU4Ng8HvF198wT2Ih/aGxVm8oTJPrI4lpAyyPhYSGndbFmg+VIIlWn3sZzYgcQ1nRtdPvbrWVMRzVKEzXmDohpW7eVIXTLA4RDlbEn1CdOx2RwcnCvsqFubD3Aokz3ZCeJyfFhN3T4/rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knt9JlSv; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knt9JlSv"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so4892178f8f.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790786742; cv=none;
        d=google.com; s=arc-20260327;
        b=Q4lO3krLfK+p7CA7iYdPFVC6XWJk53FrTF/oVxpF3OATxhEVYGFh4OmQN41Kz96ZYe
         1Z3fyE7Xll8NClCx/kZ7hru6DX/E6OVh+JqMxEb4bCDRDzg7vpTGwPGKQLBFHS07fBX5
         f4kcENXaqNJVOh6Bm8R+wSEseDNPdEv8vA42F7NtrrxLi2KZvbtG3LOlrqHgdOfjwlqq
         mj2UmHFYWaw9IBFn18MfHAhWJiAfYfCjB+paKJJ6V8RUPMUhLt9CqDEsXTu/ac03R3mu
         9hVs7xQrOoHLwUgCcVPmiv8JvXanq3+Lg6cCEaX8wldBw3RHi2esZsfck+ocPrOscTah
         XX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0qr/Ipxr22SFcNZfSu174bMZPRwg/L3HUY1rLAYBi7I=;
        fh=F4Pziq9XUbimbr7NkOzx/PwDkcSSgLdBNNpw9sfX6t8=;
        b=hxnTNo4lD9xufVG5vrY/GR25d6/wUCG/nP3Naujef0o5TYhChIDXR2Ij8E36BDJ14c
         geHMB/gUmhcVgTcIIrGgfMy+bXIIs5FB7Gawa5fParuohIdBGBsJv/8SuoCf86MlXfZl
         9vXA0Mb5kTjOECOqow+YteAE6/WVbuN3fx2dYjn+HQtc9vq0sSIVDlBS6SGrb7JF13kO
         qReNsSC5nTo85hzM5bGFEYg1l/VuRRBZZAbsy2PryUreUv6O3sItOBiWSF5Izfx9sTsk
         RQVrCfuY0t2aMGh6uTqVX1JB32egiFptW07gfKYnwDuGd38EicAg2EkjvTBJ754GN+iF
         atPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790786742; x=1791391542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0qr/Ipxr22SFcNZfSu174bMZPRwg/L3HUY1rLAYBi7I=;
        b=knt9JlSvHA/ihsQPnXC8Pto5tXIsmr4YXVA0pm0Xeq04GwRzp6MsVZB+aY/hHa2h0B
         yoUINlKRc7bS70qcFZbuxmrJdB6q5eXGOikRuXFhxbpGHqoJhTwLYYEF1UHagKwG0gXy
         smgn3xzTfk8D7fH3T3hp0/0ZP/6h+q4/t/IOMcqsEqYs+Kt7j6W7oyp1RV3y3BIPeQfv
         ExJZWrWTNyXvM4UOF/MrFQMgRTZglQSFgAR+ipYkC4v1+FyStGbHL49dSKF3GNXc8TZp
         XHHNx7oxo1GNGTpT8zQi/WQk9KXrCuLD885xnE5/KnF3WygGxo8SMqjrgsi/S4AjuqUC
         8rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786742; x=1791391542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qr/Ipxr22SFcNZfSu174bMZPRwg/L3HUY1rLAYBi7I=;
        b=OIcWdZpOgaFEIYKZkRZDnY87HIehPBg7EuSJRfrMqfh6I0/OA7gRTkGX/FJJrHGDoW
         KIpnbeeH6nCO08Gn0N9bprvvoVZMKJ8tZOi/1cccQZE1u5lHWwRGvI5SrO8JWW53Io6I
         BpajnEv3RHx4xsrW3qRUipXjTNPR1AZOq3/lY4qS9YWVj6UTVIZXEeVz4okYiq4i2o4a
         Aak8s19/lPVMdfGYhlx88DZ3vpXYlMQOUeNnPtCOzNe6II8f/HDMLqNPzO3OdCwbMhND
         r8YNtQxqt9CuNzkbW4/uce1mDurQtx+wssqFlDC48nUORfVLxkZhcfaTnzdCOZvMWyLz
         8uaA==
X-Forwarded-Encrypted: i=1; AKwUvBz4YfW24rWcpqSVrnvBrES351hQGDpiHRtYq9n1RmCOpOWdwqMrguH/JfyHkN86Y1I7bYJ4VjxBefrJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+n6cJdNqG/WPDx/fLtiKyqEFKyWRxeGiwZP/9V51YRFJb8V1h
	0VUlCfcxkCKZ68IdwPt97iXhn6QrHVFDjZLeR0g8v2jqSxhss+Q7Vwl+o3msyrknOdqwHoFRdac
	wt43qNIQ9d3BzAtUhzgi55I6/g46YHXA=
X-Gm-Gg: AYBFou1nGUStHG9gvxEOrnRML2TTlCME3udl2OLlyNILCaiLAoIfpKJub7QhsGGvq88
	6VTZE+3rIYouEroghWkj7hPGxUHfNwL7hsgsdXIE12iqg5jTfwE5lX88XCP74CfGA29fPx6i38b
	dUY7eJq3c/Gt8Q7RpetnvEHeoGlE0OsklY79JDfA1YclPoC2DGlA0FcIIwC4p8ySzQa0tEcyy+T
	Q8k6Hciu2pLBtIArhp9TK6kZGVFcDQsP2Bc7RoD+KN/kFe53DQKN0oHNZg6J8LOlZuwQktdH/8U
	qPt19HwkC59Hbc13N8AbU1Dqr4y8cPeI/kV+eCj0LUtPuR5KPpr9O9UCEU3/rTAUF2Axae0WBM9
	tkJwGw+KCyiEmQl3RbJYkfXAa0rjMxoe2ndNNQuQLKpNH0zbX8A4Vj4s85ECg3zwywe1a89M0NQ
	==
X-Received: by 2002:a05:6000:4a01:b0:48a:f36d:fb57 with SMTP id
 ffacd0b85a97d-48b024ea6cfmr4110706f8f.18.1790786742198; Wed, 30 Sep 2026
 09:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <arzVHnMtKqQx5rdZ@ashevche-desk.local>
In-Reply-To: <arzVHnMtKqQx5rdZ@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 17:45:15 +0100
X-Gm-Features: AclHuK9DK0fHm8pKCkWA6Zd6bNeQSmhN0p4rElp5jeZV36-WUljPpymXoO3Fm8M
Message-ID: <CA+V-a8sgRHDbJqnp6_-0NO8V5f-J96ZtdC698-2n0Z7n71x5qg@mail.gmail.com>
Subject: Re: [PATCH 2/8] iio: adc: rzt2h: Wait for the analog part to stop
 after a forced stop
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Wed, Sep 30, 2026 at 10:24=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 29, 2026 at 01:42:42PM +0100, Prabhakar wrote:
>
> > When ADCSR.ADST is cleared to forcibly stop a conversion, the analog pa=
rt
> > of the A/D converter can take up to 2 ADCLK cycles to stop operating.
> >
> > Wait for the write to ADCSR to complete and allow the analog part to st=
op
> > before reconfiguring or restarting the converter.
>
> ...
>
> > +     /*
> > +      * When a conversion is forcibly stopped, the analog part of the =
A/D
> > +      * converter takes up to 2 ADCLK cycles to stop operating.
> > +      */
> > +     ndelay(DIV_ROUND_UP_ULL((u64)RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC=
,
> > +                             adc->adclk_rate));
>
> I do not see the point in having _ULL (64-bit) division. Do you?
>
Agreed, I will make use of DIV_ROUND_UP() instead.

Cheers,
Prabhakar
