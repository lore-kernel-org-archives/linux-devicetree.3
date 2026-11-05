Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869103;
	b=khOQHW2+DV5ximUNjZoIlCLBnFjUfT+ROrrgfkjavbirAsVlyN2594pyhVE1oRQcwiF6
	 zeHui29qDvCxW1aYCFrcPEmuTpiui4UaLeVcU+qkHlu92xyCQdEzMd0DpGfWiA7zT6QTd
	 hwabUGfi5VAieqfQoG6c1R/0rxb6ULhRf4B5xj3uA9bFI19Frh+MTkDfKqkjpdiMFTVlX
	 ULfxxE6P4bglGEb3itR/bjUMERNSoJ9BfZd2VWRRUbnvmddiLfdHg1P4ZA4y+suQINcy+
	 BZH99cITAsLqTTdGTyzLrrWu2Z5zF5GsMA8d4kexami7JvuIpZsQZjLZJafP+ZN/8ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869103;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PKNly8UN9EHaaYP2x5RRnRjXy9kMnNoiMkXmJ60sgLU=;
	b=oy7li3v5byBREGx6KOeMzLf8p0jlE0HLZRQa+Uxh8yFdy7yqGzz4kGiOVVwonbGRFRXg
	 bXcWHBOfws0vHKRkldxfZFjoi6Z2nWFP8kFtJFmT8sQLi2jy0TxSHy2bffTy8YTOvKpvN
	 vTNS3D97lvTmsI1D4M0mqfKL64FBrJrOYae2Z19p7fvV0fPq6NszMoh0SOgDauNuV5b0M
	 FOQHV9R+VrXn9FOpKtc66mw9BbZbmzSf7kCoGnNkcIHQc/h/Ww9tLLAyC0k60/ZIgGsuw
	 0c6QMXNTLXcI6usd86BB/ayXQvC4RALNlEJUWHtMKZpPW8GVSIa5hY+9ldqb4fsGl8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bfqBdZFc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23110606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bfqBdZFc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99211F00A17
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 08:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793869102;
	bh=PKNly8UN9EHaaYP2x5RRnRjXy9kMnNoiMkXmJ60sgLU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bfqBdZFcg1vlT9xo6LwjDU5axc25ZOYu5IeDBRpvqKcR5bUdGOo+kR7fbU4Z0z1ax
	 dcca6Mk1trHKjDHRcBxWjU4DDbF1juP0jqJcMw3CyRs01tkfqR2K9LBq37fpzE0TFE
	 rgftkXDmwBscUBDfcu7CO4GEIy+6Q9F0fUQLRgZnfJtsWTAvFraOUH7+1kS9/o/Dm+
	 XecD0OTWxXl++bygASGRu+YeLllQi4FTDe73wWpsRv6TGnrQ91Y1X8upmNy3yd/3L2
	 Crsj1QJ2N6KDl8482xRQbAObmc4nzqtQ5RJhcrk5mGdXSqtS7l8We+hp+WvR9ZVvwB
	 AJ3ljOcsfoMHA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2038769e87.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 00:58:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzVnmiojLE4kjDsIXDp6fJdEi9n9wQ5KK/1FVlZRnF3FQzRmQg53Rjd6fQcx6iNp82CCBbsSRjKfjO8@vger.kernel.org
X-Gm-Message-State: APuU4Z/9ZC5yPxn0N52EZb2f+JVxYnC0BKtpKm6TQFBRqpVqEpvUkHYL
	GxGg5fuUND+32Lt9+IoLpBMeQYWdMQ/UmJxiBeiZCQl6TDeg0BYjkIFgyfyq+TRgC8bt3t3oHKK
	APg4krbuVGkqWevzZRFnWfi2bYVy41/c=
X-Received: by 2002:a05:6512:304f:b0:5bf:cfcc:5444 with SMTP id
 2adb3069b0e04-5bfd94cc790mr6486911e87.0.1793869101536; Thu, 05 Nov 2026
 00:58:21 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org>
 <20261027-mali-c55-renesas-dts-v5-7-51bbb43969c1@kernel.org> <CA+V-a8vEub2y2gvXp8jkjVHOGuj1Eqkbq75t8Nezz95iidtL3Q@mail.gmail.com>
In-Reply-To: <CA+V-a8vEub2y2gvXp8jkjVHOGuj1Eqkbq75t8Nezz95iidtL3Q@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:58:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLn_3X65zu8q-DfWbn4xjyPrSfp5BVH4SO96XCxmegcvXg@mail.gmail.com>
X-Gm-Features: AclHuK8AQIjDmJmMWxQBLXnB8djEy8vqJf8iVobRFUYDEbaAMH5O2I21RMaJX7I
Message-ID: <CAD++jLn_3X65zu8q-DfWbn4xjyPrSfp5BVH4SO96XCxmegcvXg@mail.gmail.com>
Subject: Re: [PATCH RFC v5 7/7] media: mali-c55: Sequence resets explicitly
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

thanks a lot for your help!

On Tue, Nov 3, 2026 at 2:47=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:

> I tested on the RZ/V2H EVK with the clocks and DT left untouched,
> changing only the reset order.
>
> The hang comes from the reset assert order in __mali_c55_power_off().
> Asserting vresetn (the ISP core reset per the RZ/V2H manual) before
> hresetn/aresetn wedges the ISP. The next power-on then stalls on its
> first register access. The deassert order doesn't matter.

OK I will drop the clock patch and keep this one.

> Asserting h->a->v (deasserting v->a->h) passes repeated runtime-PM
> cycles and also works with the IVC enabled. So 7/7 gives the right
> reset sequence, 6/7 isn't needed for this, and the existing DT mapping
> (0xd3 =3D vresetn =3D ISP core reset) is correct.

So this is a Tested-by for this patch?

> A smaller alternative keeps the bulk API and only reorders the names:

I guess that works, but I'm not sure the reset bulk API in the
kernel guarantees any order, so we better keep this patch as-is if
it works so we explicitly show users that this is critical.

Yours,
Linus Walleij
