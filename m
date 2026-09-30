Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6699F4D2EFE
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 17:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787865; cv=pass; b=YPyFwdBdLBzGt7Ec+xXnqm9AJo+mZuHxq2mZ97h3pUM0TpaWPLbfd6SUGL/glULrjSKZt7GgpaT9MCkZZTB7y/1nz9FL2ZPMtPmn+zMAAK91UHY+xr60IMgM3u5A/KPyFv6e63SWZWBLfDPn9xCBOWsUccl32rtXvT+HWAf0PV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787865; c=relaxed/simple;
	bh=YPB0OuzgSu6bYeqdbKJsDvFZ0QIOxvCezfQ72jpnedE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3B+OBGP7vUx8bzZ8ZCBApX30cr4QMB7XxofbVb+VS5u30nwZSjAc5ewZhp6QWvJiAzr5BQkR++kUjQEqpUSkkm0mnpNPBBSLr/6ClWwMKI+mkUg3lqIvJOFF+mSWO59VyarQiEUbxk2xfc3IZ71DZRuWvX20wvNWpYleiK81Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivTyT5JU; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivTyT5JU"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso3549033f8f.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790787863; cv=none;
        d=google.com; s=arc-20260327;
        b=sDuxWq5mRR3yqtji3R7ASWNjc+haR6MROKMHWGDMuiqfoBRJg82ljovdAQfpCWz7EV
         kBO9ZppJpNxLz39U5YriR+5rB7T+HB2QZ2Lj9KRnATg685ieU8Lm4k877xkypdDdtSEc
         j5QBzoLV8/Flp7fIxp+gm6Nz3agtSMfc/bEnB5LQ0kKR9jJcnWqu9hBLG6r7T0RKgt4Z
         S2MUqJbeMeyNJVUFoQmoMkmEbyJDpa5dHDxwnHSKqmhl8Ogss99qkiy1T+wFImwyULR3
         puu5wstEXm/4n+oM4mtH5YYR93DOfhfkdbCid22ALbx7sWTpbD6NbzkjIaOeHY0tBIKE
         3jsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zbCTMDLKH8sxYxpZqqOg0zEN33xQKgj6205FhZee8H4=;
        fh=lJp0EuLef1bcKWg1DUycPzHuA4xiWtVYP6aCpPr4oJs=;
        b=pxLGCUcRcwjhPCAs/zUAfoy4gzddllGzhpG39GMMeeTIAL8Mc+ZFoEXOtd4Vqc2cjX
         BhjJhffK8XnYGtApUhIawo8EsJ4Mfjych6P3KnC4ip/Q86EBUvEAlPo7r/hzx6Tunhbd
         /5N0yZB+i7ZjSx45FK3GKHUcC+39Mu8DKGY3xocoYUjsJHml5gbqf984PPnzp0h2Fr65
         Op7U5r3jWTskuEhh6+/RpD34O1C8WNfE7yVWGQ+Htio0z9CTBsfO9WrUkbfa75JyhNCc
         d0UHQL05cQXibZb7IUpCHfqGiv/nBRs8gwLw6ddXmYLUsEG8cGCbrgdnajIEIzwwTFle
         izQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790787863; x=1791392663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zbCTMDLKH8sxYxpZqqOg0zEN33xQKgj6205FhZee8H4=;
        b=ivTyT5JUHKeGqQuEuNbfdAGYblvHXNS4/cO+fgAoTGcyxuty/wgF03oAUMwj1lM80i
         lp0f/IBpZKvT2slcDmaOsfl6LAoSc19DgvJlOJRXn+OQukYfFWu1BlJ5BVCNd3ImmpPc
         eBKqB95iAqIn7eWFOAoQxmZG7v4Y3fvy7vllRxa7mfnOORdW6rbHcVmuI0qVx96C5efk
         HvrKNEKcYn9yTYyFKSgMWj/sf0T2+Cf8L0WFXC7pYWmf85Hu3ttNEybGwuxhu1q4nDFm
         Z4JJskBc9pGj38DTriJuzMWfv1K2RkxK8kfCthViHRDvkGP3q8iODb4iJ0Y5XAco1fcX
         QfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787863; x=1791392663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbCTMDLKH8sxYxpZqqOg0zEN33xQKgj6205FhZee8H4=;
        b=ehscokjeWCbVAkaZTOs1/nmfykjaYcNugdWhseshvoQ3st/xIrrKKY3bEn7ROKdq48
         GeigZ+9dzNxvDb06sz+LidZiw3Y4ncIt84mAlpk8mkS9N4b35Rv3v78+OruWBPGIfOqY
         K/7iH7i8Li3HwBrGyKqCxIySIvvO4bIkd4zDaSTlXYluAF1BSUGBMQs7tsP2qCY2T/fp
         jDjTNoGw9LrQtcB9CivHd+euLIrFcrRgy7SPgcoV030aQyFI8QY3NPQ37mrhnp12M6yK
         iTu4EJ/1bJObUlEhv0xJGrx5RRKgOI3+70lu16XGArZWXH0XdNnnR2WDKzmMdlr7dAd0
         yfxg==
X-Forwarded-Encrypted: i=1; AKwUvBwXo0c3oS30cHe14KMb5p15087VKt07KKEZCFBlkHx8Jn/IrGqq0GvfQdGb5Qf4xUN6a2BXxW75nay7@vger.kernel.org
X-Gm-Message-State: AFq9FYIwYySPuiJeEJxTgSOAeIs8AgHRDXxYdWX4MiCgrxg0AaKsmwgd
	g3YSw0lGxMYcDUXXdABnpdu9wG21u7Mw6iZaHRTBjUVxif8ntiSLU6wxNx9KvrkdmSi3lJtTge8
	oHIuzC5TSbU6TyMHc0wgJuEeNngErevY=
X-Gm-Gg: AYBFou27HXATnV8qEJs3xm1LzUiZ2LOSSgjZF21IuGe9wPDB2sh2pnHrLtHqCrl8yqd
	jULY9vgBPjzbGEFfVTlRjw3loWkrnTQy8ToCAzWv9YzCE/wIamAY+G4zKM1uz04RWVDEZ4wzmHb
	5xzyyYu8onOTtvsIfrY7FoVUS+5Nuaj4VfjZLmuhxh142Gucf2/gQ6Sz6sIJdtZbX2uxI/mTFTj
	5YYMD8T219ZvQJGGY73LsWGsEsVlVtfkYaR6i6Sjpj5y/+OZ61i2bZ8uUmZghkwpM8zOYoz2sBv
	DXSSu9hdmzwBhHwqakiFCjf9eVcdnCcAr+j0VnRncUcKvAzBUZtwJ9hoqeUvCWWVUENaWRSLoZY
	fo+bIeY9I6AygcA/I61yaIu94XtCk6hmtdXmDeyM2vG+V0oV52mOlUbk8CkYJFgt2xrgcXuwD6d
	c=
X-Received: by 2002:a05:6000:4283:b0:487:106f:ee31 with SMTP id
 ffacd0b85a97d-48b02524089mr4421323f8f.27.1790787862365; Wed, 30 Sep 2026
 10:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <arzWMViKacekCSdS@ashevche-desk.local>
In-Reply-To: <arzWMViKacekCSdS@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 18:03:56 +0100
X-Gm-Features: AclHuK9LOI7GwX6WVy-CRezdreahkEzOs_5YWlyyazInLnkw8984BuD6XWEzDWY
Message-ID: <CA+V-a8swr65n3hnGA_a2L-uGfLbzAKeQ3TqddjcyC+iWF52Vgg@mail.gmail.com>
Subject: Re: [PATCH 7/8] iio: adc: rzt2h: Use scan type for ADC scale
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

On Wed, Sep 30, 2026 at 10:28=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 29, 2026 at 01:42:47PM +0100, Prabhakar wrote:
>
> > Prepare the driver for RZ/V2H(P) support, where the ADC supports both
> > 12-bit and 8-bit conversion resolutions.
> >
> > Use the current IIO scan type to determine the ADC resolution when
> > reporting the scale instead of assuming a fixed 12-bit resolution.
>
> ...
>
> > +#define RZT2H_ADC_VREF_MV            1800
>
> _mV (yes, as it's called officially for millivolts).
>
Ok, I will rename the macro.

Cheers,
Prabhakar
