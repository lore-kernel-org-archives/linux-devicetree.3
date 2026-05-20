Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AC236AB49
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264000; cv=pass; b=Axs0mTayLmtHNuridCJcKpEyzs0meXFr71mBXMKAbJRdJdJSItcWrrf3FMLzwo9uXbLYF05Ytn10MbD68CaH9ogvewihojjzli+cXC2y0szCPzT7f2lgorWomOY3yVcuv2WHFUlRVk/xAlh+tHaLHKxzDmhcdTR213LfaOefDXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264000; c=relaxed/simple;
	bh=gLKkvrPd8WDYkNr6zpplE+sWuXbgiUo9qWP2bGP6r8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDmKGhl22PpS8kSC9U2lTBlOHPCB5bcwN+jyW/g1ebtbRbc3TLIt2QRPUQd7Oicr3yYI5stbYAR5S8DCu6BxmWuwrD3lucW+Geuye6a3jRvkBzMQNM4v3RtV9aLC5EkHxfPvb4OT28qPgtgJW26qggU0OuFUTGqc/SiF4QJSLck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ly7TAbPu; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ly7TAbPu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so26362635e9.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 00:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779263997; cv=none;
        d=google.com; s=arc-20240605;
        b=btbmgpNdku1i1NfPggBEev/7H9meg0iPwSObU8MUSoqjMCDPj9+mQnu1iLz3Wp/3nl
         0iFpKz6E0HGLXtKSKKtTl84AK20xcCVBfxqkUF3l/vSW27hAZ+LMizRZJBBb5q2wyNVV
         Rj6GugoQO8RAgycTgsHthRuCKryGE8rP5h7umXu8RjA8lPK46OZw6r1A2n5Bk/oFu2SF
         dHZK2VtMQDi7eo26xRK04JKp2q8P9xymfSls4fioRM/e0Qrdr/RmiNwxucsS4YdCvnZR
         MKYIVCSdf0aIPt8nx8I+xpTlGJ3syn5r4eA+s4Ky6O0VQWTvMw2EjvOdzLYvEF84wYuq
         5YPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cq71RQNyMI8AmBA0uR0b6qzFKcn3nBaBWfVomG/2ktY=;
        fh=AuEs5EH6cq+sc2oqQjNsmwCKsEsxx4ymamMcOzEgKBk=;
        b=D/bZNx0TruFNOPO4IVrDaMe7uS2L40upQCrTuTY0PDEcRo0z5Or+RPox44QU0puoVt
         ciIJnPAI2x5fynvyxyq8DSnnWMPRePrfz8u5N10BRouo3BGE/55w5c7PrGmvTpk/lZZj
         1LzOowU4WhUEEY3xRKWGE6J50TUfQvp5MMyxE5NI8OaLZpJgTMnH+cX+00HudWYdQZ36
         EmP0cqLBigxgyXuSFx5Wh0qduYOLMyBls8dxHUBlEBDVI4kv75tc+9Nz+WToWgN+icU/
         oBk/B5PknzPogp8A58pxsnKqil/3AgwOrnVlCIkhVQixAlLv3MbD912PykucJX9VjsTV
         Q4/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779263997; x=1779868797; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cq71RQNyMI8AmBA0uR0b6qzFKcn3nBaBWfVomG/2ktY=;
        b=ly7TAbPuBpNzLPRQPds2DWtxUOqHHYCTGYWPyHYA6DwEdru5jbY5D/6CRkS8Wu2WTY
         OLY+vFyDtIsMtj1FVA+0PYnW8NwBiMHIibsBAqwT92eIpeXD7hq5v6gThg8QkcExDvnk
         1WU7Znfrz6Rged1vCY77F4ORfBmeL3FmTtgPmwFirKj9WMBjsMLc08RTuZhoqmdF6mfL
         7lDA9F8Nr+34x0RaER9n1yh7mKL3Aqi9JFpl/IYgWterZbvEm/YHugNo8D0Dwk6idX2h
         OzQL4nb6nLkuczYe9LmW0vuteIg61PMdEIXXP2Q0D1ETCKszotZ+xVQTY6fMBZspdnOP
         BGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263997; x=1779868797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq71RQNyMI8AmBA0uR0b6qzFKcn3nBaBWfVomG/2ktY=;
        b=mGdKcqUYpWcnfoXFY3l/1/BsozWu1ib7bxEMId+R3QLEnhSRBwJBHdmEekw7hntqcs
         5JQqmMLibKhNY+8Jk89r00XKO+3+//BkIjd6v0fMlykDEJuuMqowxnlB+sG35ylqD3Wm
         Wtx6zLnRc2bRv/ySL60WguTVQb14bwpHxNphpNJumKPwiX5Dc1KSIIRohSOwcoHbjgX7
         qiHOvcxzmlMUvpxaUHMvjagRvkNt5+W+OWX4EfcSpkOVKgBB6xYDXNojmXFs+ykQCR7o
         c867e3ae6gHv5bA0JBXgHbowQlXLgCOnvYIjR4MsaTHiC3saJ1D6Ao0E3CZ5LPZG7v5i
         BqDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0kuFa8FqQloE8idvBCEFwBmmkBxpQ/1Ah6B2SCrdmiYD3RRiatOW3ygOLCk0twbA8a5lcARTTH5S2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2jBZBjsQJlllrMOaDjrYOH7oLBxRUp4rd0eCUcGcQ9/oiINSQ
	oyaEoxUyhGAOZUyiimKqwXEqokU1JpppUezukEotrb7O7xE9jmfnafgcJzraQEWqpDqM3tJp2eN
	mSupUBd1jC1juoyz35gpIu+PiDSr1TFg=
X-Gm-Gg: Acq92OHDXqjCnWksbhwUE7uJeOBcXop2zhIMdR8NyppHsw8Ux3CW2ukRP3egRrO16Up
	xVwuVV9PsQ+zbgHeKZuQXj9IlCU+vhcql4c8u6Vs72zukrXUE6gqyhx2sdPBlv4vNmzn2lmTSgX
	SBNKJWQiYUNYeV6qfeS2g/c8CBIY4IwlRwIDM3fzm7/izAkIyBIWnj1XYEXm9/Nl+txyVQet34H
	+mwj3PJCIgv5jtD2SJjmGuKIwFrccn/JnChjiE6WdXTjI/OqCQXxyK/mmPnTVzo+bE81XsF9+Of
	+rVwjxzNxtOGLtOK5gTnlWUfM0FIWHdQjKGPqeF2L9/XQGSRkXKCVvxbCbW7NYYp2Tf8HuD3AvC
	+RXiPaJQ5urbTusQFuLZbq3dQeZfpGiPBJS9hBQICi+B2ZoQC97ONzrraX/mmgsHTs4b7zPYa8h
	g91NJQiAqJ3o8r8JNC
X-Received: by 2002:a05:600c:314f:b0:490:389:7644 with SMTP id
 5b1f17b1804b1-49006db5bc0mr216098075e9.17.1779263997315; Wed, 20 May 2026
 00:59:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520072843.3593-1-kimjinseob88@gmail.com> <20260520072843.3593-4-kimjinseob88@gmail.com>
In-Reply-To: <20260520072843.3593-4-kimjinseob88@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 20 May 2026 09:59:46 +0200
X-Gm-Features: AVHnY4LibJ-k84UCcgSiKOiq_SKlPJItvh7cn6hdkPZpeTaScSKdQ7TTMwmqIoE
Message-ID: <CALoEA-xOGAGb=-uXBv+Q2QC=viPCGUESGZw=rfoBHdEJFCkEAQ@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] MAINTAINERS: add Open Sensor Fusion IIO driver entry
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 09:35, Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> Add a maintainer entry for the Open Sensor Fusion IIO driver and binding.
>
> The driver path reflects the current RFC layout. It may need to be adjusted
> after review if the driver moves under a different IIO directory.
>
> Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2c6d7927..001ba4ea6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20011,6 +20011,13 @@ F:     Documentation/devicetree/
>  F:     arch/*/boot/dts/
>  F:     include/dt-bindings/
>
> +OPEN SENSOR FUSION IIO DRIVER
> +M:     Jinseob Kim <kimjinseob88@gmail.com>
> +L:     linux-iio@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-uart.yaml

All of the above should be added in your dt-bindings patch. If you're
adding a new file,
it's expected for you to also add a new entry in MAINTAINERS in the same patch,
otherwise it creates confusion and an unnecessary additional patch that the
maintainer could overlook (highly unlikely, but could happen).

> +F:     drivers/iio/opensensorfusion/

And this line would be added in the actual driver patch.

-- 
Kind regards

CJD
