Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBFF33D512
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 19:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778097538; cv=pass; b=ZyUt+Mxonkm7/u2sv0KrviZh7yfu/mn52eXOuSvNP2Hagkqun56k2iMqPjH0E3odj8c05inM4KbcygmBKTfNwUwgAkpEqu+hlADsH+5y8IA99MixlOdCiWsuguY3VxCQuk3apXgd7w6zsGG4xZ9i+sX9ns3Vlx87BmjQzKdFdo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778097538; c=relaxed/simple;
	bh=cKQwfi3VdbXqK1EPlrp+rIWkQqAXhahRUcj4Mc9yLZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwzBaom7XAsWjpTYlfxdloZtcg/s+kAl2PbV/AslosykgDJBEl9xUFXciLjBUW9TsnOcBGYn7V7G2Y2sRDIp8lNSVTnqOKDwHFyB0S2IA//ohGHkBMjfA+yzjHsR5e285TJXxu/zHmEFin8VMBYLLNYwzEZyiLoB6TIvoQ3mJyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfyueNpm; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfyueNpm"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so77399f8f.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 12:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778097535; cv=none;
        d=google.com; s=arc-20240605;
        b=FagJH6R00PvvXQQeXpGmOFtAB54CZ6kVNgxcfQcVpksP/zZ2+kQDYjU8qQxXM2dYrx
         UeT4JfUBbXmmCNCLtOWgh6Zx7+neaAm8XQIDRFk3dgOPs6hv6WoEGtK/zDyKmwuyvSJs
         Rw9fPIEvxijR/wjowSMUl7hgh6aKiUGwYiJNzb6mjsTc5Vg4FPEDRAi5J9GuslKwbLLk
         trnL+altgsUZY5UfXJ1iVeVO0g+rDy19p8xUsCLa4cSRqhkYG0DRl/Y52PqO9qhfwPBN
         krQgi9002yq55c1ZgBzKwlm3MHDlLRlZI80kF9ntINZBx2iEQFxbID1bPxQ+CpwMgxfb
         fFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cKQwfi3VdbXqK1EPlrp+rIWkQqAXhahRUcj4Mc9yLZo=;
        fh=WNw/0Vv6aA6w7gNkEtnw0Vbo+XBlkOkHM/1/1nhmEIg=;
        b=GAklq8fFdTfU6PDxccJMF264uoPduIH1/x0UGWiVvO4DOqbyezxo767rghcWkOyea8
         AKgabiKbs8jgX0UmoVkC6ohto2tA070Lt8hCikWyKQJzJSns53zT8jpX2FQCeuOyll4R
         /95dLlhIebS+/E3uyF6K7dMhK0C0X1nq1AlZwW2Vbek15DOrhZ3HulZxEKk4kAxI6kNh
         QhcY3EjdcXlgR3BblUngxR09o6xugR9HFg5H8JRx9uyfzkK9Nm1CItFing607S42sG1X
         ZKrKnt4dpQ18YGrm/PLaZ5L55+aes5NB8yOvDZQKSeX6mDxJVrZ0L8b9qyD2wmB0eWCS
         2b3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778097535; x=1778702335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKQwfi3VdbXqK1EPlrp+rIWkQqAXhahRUcj4Mc9yLZo=;
        b=IfyueNpmrnIHDE+grq7rAmz0gffddBpuukW5tvnTPN5/FIR6GwOQxlk+Qt6eVOgLdQ
         v9CZuQPV70ZKPGykxqnHyPRkXxoF2x3Wco7gTtmHwCqKQmNHziQt2n0JvXtVHMWKyALo
         lSLxE1Jgjw+Ib32mfp5RK72QGO+iEH8DpNZd9rjxITyIaIqEOjASrpDFsePDVP2F6iwF
         zUqm4gPU4d1tDmHVxEOch/8DSr2ti8cMN2RkGZNzTzgdwOBugeAllHLsapLjL25nC9iL
         hAAf1Df5HFqgkift0LV9Dru/UQrXVGFOvZzjE3q6e/9TVOjXpBwRkdOpAGbigDcKqKdX
         RKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778097535; x=1778702335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cKQwfi3VdbXqK1EPlrp+rIWkQqAXhahRUcj4Mc9yLZo=;
        b=bQERsSmYt8MgA0bv/uEfC9GhEsl89zOgHyT5yplB21DSXMolhYQrko6rv4Gh5bO4nt
         8L6gUx5oRWKXxPcWM2HXd72sBWdtyLVCDE5V40bT7S3vAgkvg9WCW+v/Rsxjc21kPqB7
         TKx5OjhLOUhF0c6ieC/9kWRbd7mSJxjPdIRG5u8hjNCSTPNKh3w7/oJWAON2ae16MhS4
         ayeETjzpkhqzwT18CFlAizO8U1z7VK2h/pA3lHFlSrZjkweLLhrsIi7Ip3Y4KNNb6+Ri
         tTZQ0VQSPBJuVdW+6s7CxOvtsh983JkSDE23qf3ZTIKsPA7vd36JygvpicHt8Ai0flrj
         TF6g==
X-Forwarded-Encrypted: i=1; AFNElJ+6lcF7Q28AN33/KNbP54LaawfJssXQl+KhSjWJvBeELNjXW/fX/Eqhi6NUcUzETLwUZ47nX1OowHth@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/aVaD5MWm0bcqEOq+92WZ9CAcSzntblmrNCuapj2bpejvG+cx
	M2WJxI2+qcmifC74mavtG9jhHl5VwRo8RaYh0zkrPTc4Y9vIfCvOuWFhIngQesNO2CZ7K9TF/nI
	132fmkqWqL1REkByUWzuKdUVv6qiVvFc=
X-Gm-Gg: AeBDiesuvGPSshEi4AYjSwnQMIQmwN0nGBZ/ArmauwvlK55XeJEBCmfYlZfs+zpBAFG
	QfQhsOki82KXBPM4dQUlamZ1/wXY7itN7V0e0JNss8JLTYXolfWntYw5auJvt9uctDyM265pTm5
	xuMCj5MdC3CJ6d+x1jP4g5oywfoGFMg7IF0r1SIsWycmSiinVL6t+V8VsBwlcv00afNCnfaJNrk
	TfZLHfW22OsqeiYyRZ2OUEOIa8J6AU2UIumTd5QeIJ+S4YU3kepXAvzbVftEpWBCB0kYHVAM6st
	UrhWmO1XRKlrUDpHT3bnIbLKudz2LlkFKJbweTZAjDhD44aTNCg5BC2j4fsi9RHWPR6s242P9gS
	09rwop5qnvzsvTH6T9V9JEoM0PyGiN1GHJr1c
X-Received: by 2002:a05:6000:2309:b0:43d:773d:78ff with SMTP id
 ffacd0b85a97d-4515ce1c7a9mr8612810f8f.27.1778097535163; Wed, 06 May 2026
 12:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260506195002.GA1778786@killaraus.ideasonboard.com>
In-Reply-To: <20260506195002.GA1778786@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 May 2026 20:58:29 +0100
X-Gm-Features: AVHnY4JcTk1czQ8A4YapAWR6cDFrvvjoC98jxL7sK27uKvjqiU99iFcUrsGiPk0
Message-ID: <CA+V-a8u8=mfR0zDJRNMEjnjrzFVAkOrqtro05Zgd1JFqGRByKw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Wed, May 6, 2026 at 8:50=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Wed, Apr 29, 2026 at 06:00:09PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the Display Unit (DU) support for the RZ/T2H and RZ/N2H SoCs.
> >
> > The DU block on RZ/T2H is functionally equivalent to the RZ/G2UL DU and
> > supports the DPI interface, but includes SoC-specific register differen=
ces.
> > Add a dedicated compatible string to represent this variant.
> >
> > As the DU implementation on RZ/N2H matches RZ/T2H, describe it using an
> > RZ/N2H specific compatible string with the RZ/T2H compatible as fallbac=
k.
> >
> > Unlike other DU variants which use a multi-port model, the RZ/T2H and
> > RZ/N2H DU has a single output and is modelled using a single port node
> > with one endpoint. Add a port property to support this and update the
> > allOf constraints accordingly.
>
> Wouldn't it be simpler to always have a "ports" node, even for variants
> with a single port ?
>
I agree that, from a binding perspective, always having a "ports" node
keeps things simpler and consistent. Biju suggested this change based
on earlier feedback for the RZ/G3E series.

Cheers,
Prabhakar
