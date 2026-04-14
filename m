Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245AE25A655
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776132798; cv=pass; b=f0pfSZvVBLvpz2lOcDLQ4QFHhUzFfn9sL2Ndnl+9e/k9S7CIhYjNgF/NzOwmRDlr9KXq8ho694NCIJXXxoa40FVhbqmuISp0URrYhL18gyNbVQrbsvNVxWiNFxR0xMLrU1cx9s8a2kb1zUdK7KKgqnmKJED16Qj8sc0KSaKJy0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776132798; c=relaxed/simple;
	bh=m65vXSGd6/N8O/VG28ITjk1vpiVhj5uezZJgjm1QtKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IuYE+rXO3PCSjvWCwpzxFQWOrJtO+vXlkhQyfzG5t/W/pVdN0KD7tH1UTzWU0+/g2NEvG+BOZkdhrIoAzY770nPf3h7LKsAyLtvMBCX97JpG+nRzVcqu0kvF1DbfQFTMbCBtFobbsWS5z6dUBsZjx8WRgWJVSyeQiwEEXWBlg98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tc7JN6D+; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tc7JN6D+"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a2beddab48so4807022e87.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 19:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776132795; cv=none;
        d=google.com; s=arc-20240605;
        b=lRZtocj6ue8vXU9b8ZF4gcbjMwfmFZhsHoKlA0n/u1JqfCsGxcG0Zw8dwzTpJuwSSB
         HCSrr1K3JwsCI3fFg/wkhP5Uo+72LWuv2s5treUR2cuc37Gs+XesqrQ6FVNPZiAqzbPI
         OLmkZS40eYOtNjBAPZUdYumWciqw9xY7NxihF0hSTZJY4CMX3DC/c8W5HUrmodlXUtWA
         e7oO1h8b+1SOKxaSf/gqSvW/vem7AbIofpGNSb9ohzQctRRIyDFs/hkSUuk3IsGB/U3l
         G18DDyEH/49h82d7re/dIX4kaDUDWFxm1vC/Xl9f+pKizHS2/9+sN8EcGUYfA0oUUt73
         aAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I+e7hsMexJg4a4gZwQemDX/leyw3i9/Owg8p2nuOmmE=;
        fh=6x3TKbHuO64Z3qxa2OjQP3lcZg+X0cRQXXf/iuZAcYA=;
        b=R7ejRYU9LX1367dm1ZdUHTLuisifPY1wMzI+yuabsRl1Qq1liM4l6Nr7SogPRl1PWG
         hjKuSNDTqr5yW+7NstJ3BV3yxX/50wO7vy/39c+wIL80Miw0aR4sssbsbCT19XyXh6SY
         nEJIpeXF6IHb2zjML7MP8IZ11EZsyjW3487C2gWdaXbarB6XjJMStQbeBfcORC9VJZu/
         KIxgl2EYwQNtapRbiMxSGe67+iXtfnRcW+85by8S6Qon8IruSMMSa8MpI/zxLkVYH7di
         +rM4agQlqJVYiDYPoLTKYOMZD7TEN9znbc9FVQ5N91ejsoKnY5XQRqIOG4PXhzbmV2E1
         vlDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776132795; x=1776737595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+e7hsMexJg4a4gZwQemDX/leyw3i9/Owg8p2nuOmmE=;
        b=Tc7JN6D+Cvx9Gv9kdcGAw2TZeSC1989kD5/htIh7n+q4qIMw0kWu75ajBmCx2vjKiH
         waQ+khKoK24xv4/S5WV5eo71ndwJRLd3N639AdkQsy89sL/N7bfY5s6qRYzYDZPUzO7n
         swvq+WSH8ZauQ5z3mO4hT+lKSMPbx+o0M+pPXP3VEY86U90gjfRQEvm2e+YVotgHWspD
         IdUn+ua2Y4w9TAN/ivOBvWNKn5fQoufod0bx9tos1kDiLSaKlNFR1qWHrWI4QmSHSOv3
         mFyFsBBmvD7dPyTOh8sh8/R0kYcnLmiOlIl6XU2DbfOfh06w8vjg1suG5U5qlgFpBasQ
         N/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776132795; x=1776737595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I+e7hsMexJg4a4gZwQemDX/leyw3i9/Owg8p2nuOmmE=;
        b=Wr408xJ22CYoYkCFINpGehi8NeYw6LXYj7pDyFsvettPrtCtQkdLsgZ9WxJbegr7XD
         AJQQrfuehsuqrfNwcJb28Re79GlUeTWFM+FlJMaqymiwuHTpZUfUAWaL0K/rhpJwyJdc
         R52BXdVnfeNLgPeMYepPw8KmKID7fmRkP90URt0LFl5y65+QUvtzbOVk0YpVS9vpDV0w
         mG67DyP1/HTmSUXv7NOeXUedd1mh/8jjsvPUpwWrrZkZm7yxjeVPMTOLw6GOQRiv0jtn
         kYGVOqNd9OD7V22pTPvEbvGeM5Z5RRZPKMPVToH/dM6KD0cI+GrVYIyEyScdd+WEd5Ou
         X/Vw==
X-Forwarded-Encrypted: i=1; AFNElJ/TLES8u0NnmKOVa9kNMacZnR+Rt5pfsnseQ61Ht8Np0mv4YdcWhIF8fchmCDJXW11lrsMzbl65w9il@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Y4lN6MYXxP75oH2fGVrkJ/aAonrb30F+tg+sIckXsFnS2fFr
	gfvhzd9rr+WtKzAsEhV+0K5eqG7bvOacSKN4O0cQIrtqYZKiuzzdAyIKwB4VvyB1oyEmKV7a47w
	CWWPRfWMGYUSXun5/l59oulCHzcXs6y8=
X-Gm-Gg: AeBDietLD58zYU0Xm4qQYkBjwitnfkQzOowJFI0ECxQv83I1lz9/JnS2kpN8705mlVz
	HwFNFPY9Tdll6FC0UCK+XpURnR7+6E+ZW22n1orJc0bQISPiw5Aki+InswCqIPLQ1FVH2XDp86I
	dhNFtQ7nGS8oXESUkwyCrvyi4rObzWo3nIuXhRszFTGTt4OsC0tVAq37fSuZboSwv0bUAlbvKND
	SZU5Bx7yE/jtkRvNCCU04iK7pY08Mp0oFKAb7L2LLnqabHdl8XypmXnNTgXobNpYw+E5cwhtodX
	Ft1RkIaECgXeChQD4pqNDK2RihNAPS34AMvsBtKkqSNrH0o3SYuT
X-Received: by 2002:a05:6512:1315:b0:5a3:d381:2a88 with SMTP id
 2adb3069b0e04-5a3efe99632mr5305059e87.37.1776132795007; Mon, 13 Apr 2026
 19:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327114653.593582-1-padmashreess2006@gmail.com> <20260407184455.GA3369046-robh@kernel.org>
In-Reply-To: <20260407184455.GA3369046-robh@kernel.org>
From: Padmashree S S <padmashreess2006@gmail.com>
Date: Tue, 14 Apr 2026 07:43:03 +0530
X-Gm-Features: AQROBzCYwV_IIq0oP35YBdligNvJel5nqZfvIfKxL--K-9W0cWq1dLbsYt8YGEA
Message-ID: <CAEjBr-aigr21LBV9-hMzwDGbfMJO0A-QwNP_WLJncuo9MSd=rQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: marvell: Convert armada-380-mpcore-soc-ctrl
 to DT Schema
To: Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 12:14=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Mar 27, 2026 at 05:16:53PM +0530, Padmashree S S wrote:
> > Convert armada-380-mpcore-soc-ctrl to DT schema
> >
> > Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> > ---
> >  .../marvell/armada-380-mpcore-soc-ctrl.txt    | 14 --------
> >  .../marvell/armada-380-mpcore-soc-ctrl.yaml   | 32 +++++++++++++++++++
> >  2 files changed, 32 insertions(+), 14 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armad=
a-380-mpcore-soc-ctrl.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/marvell/armad=
a-380-mpcore-soc-ctrl.yaml
>
> Please move this to
> bindings/soc/marvell/marvell,armada-380-mpcore-soc-ctrl.yaml
>
> Don't forget to update the '$id' value.
>
> Rob
Thank you for the review, I'll move the binding and change the $id in
the next version of this patch.
