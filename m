Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F2A313523
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763445; cv=pass; b=eec3bxQKjUU6Kilsci6h6QCLqIBiuSwdjr+FVbRAYw8vT6oEZyDetgd0DoI5K7vlW6kpL7yQSd4ELRZGMUF7BseBcg80xNWGJFbQ2+37mWc9Dw6fNiu0MTUSt4jGp2ZPScEbBvYWJVu+HtA4/4t8LB0gvhy3aR4jtMYUJCuL24c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763445; c=relaxed/simple;
	bh=65EU+LT8ShoHnvOp3wnA17Kkc/vTm6Ghc+27Z8+Oepk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dx7fzXdqthn8aVaMntKFG1UTwnmE9QiNWptBfVKnpdefuNkyKoVMAbw0jIWggLmb9Jy+PREWm5taWXUCsScp1g1bzpqb6btRZmC+wrAd40xXIIdEH2RUiiBj+G3QX9hTsEIC80UdtEUNCigD0c8U6Uh2sICqrz0Bv0lHwdeW3LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd5ZrFwm; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd5ZrFwm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44e1860558fso5135010f8f.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778763442; cv=none;
        d=google.com; s=arc-20240605;
        b=BRQSYRR2S1VX7gdmxqsxv3gMCzpUxnrC5hECbm9iJIsyeK2aAm7RHIJ7o9m+bKp6yU
         /kVcuMTr8m6iCZXV2V8oGaAFHeEfh3qKTOITMO8wcDJwYzL43gY+fg3jEO0GgU4mtWca
         VcXDYq/1BihaNPOxi5l9KQyQY2b29cYIV2Q3od6E1vXEOcSEFExuJR3iyZiXCACY0tpi
         gds/ms1U2YNgFk7QKarOz5wrI8eCVtZ/bcU6A1XMyYRmF/kxikD9MzYlSlWF0J5Vlp/g
         F3ijNuIrvB9ePua+1G0UBrAlmWVVFGCYju2nzkyZrE9KXNxp+Cg0Y5HwpTRHz8bl4Nia
         06nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QJj2MCOLAauZByFtae0gIhlDdGWCUi3MspOPavj+fQw=;
        fh=LDmHVf8hszZo8uSJHH58lFm/vSkjzHju+rL5qFPIZM0=;
        b=hky8+PhA4Vr7+thJK/uo6gAXYTUW3+461wM6YvuXDy5gp51BaFc4i/Jny0boPqe39B
         /mzwrx64sqFy13MWXkBPWmIyNBk9hNBZOj6ZK2WavokJz37SVCQEL6gTbOs9rn6w2yHr
         qDsSms7DTIYqpLlYziKHMJryeg4MU/INEcHYylGi7gJskk6Pyer5Fpb5jNnjBUh389gz
         RuMvHNKfxt2FkUuyJ/bIdPvyw+NiukOC2mFDUqw5/gZW+qw2kpv3qlZz2KuY/YyIbrwm
         31VeWbz/00gFPlasgrDQ6Gh0IZjC+SaNR3/scA5Np82QGPvKaNenEohiNCxPTSWqbvsr
         pG5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778763442; x=1779368242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJj2MCOLAauZByFtae0gIhlDdGWCUi3MspOPavj+fQw=;
        b=gd5ZrFwmg2xTcFu+udU30MCNLardFOjCl3U6RXYlP+53ythCl3twul4lswSUzxObW2
         YsPwgto5RKKUtynnqm4F56hqLZwzypHDrW3O7Fq0d/POtOGm5tmw26STmSsldxaFSGlW
         XmVd2uBkNlOkS+p/a+KNj+EHmoB39W7HVE5ZfvfIa+Rf8gI9ODmC/q2F+YidqOBZfQJ1
         U0l+K/S1zPC17wla8FOm/ttGx+cBwDLzHLaqz06HIHeEFl7zVD1Kktyc7aX0mKxXVIWZ
         7IdpH0xYYKExxWEX+HqAylwOvXw/gjxjg7QY+WOSPL1Y2M/4XPpRkUA21DGtOw1YI7VL
         dnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778763442; x=1779368242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QJj2MCOLAauZByFtae0gIhlDdGWCUi3MspOPavj+fQw=;
        b=nipUseyRg4hg062+iXk66S34aL9GB9gMFeWphb1laR5WFUkCAc36sq6TS4QF8DndoO
         nVdvkQVC4dBjY6MQs5Rsa+t5V3cJ3fWYpO6MoTyUcI/fdrIFuhDltQqz3ql989lIO0Dw
         4sn37fxsqqBflZKCdIctH/hMdJ/2I1Ez70Dzdyc1rVooNk5+fnEt/a7r99fAKs7fG0iv
         NtHl9HsbfClrK7Uv4Zw1t61ZVpV90pISRnrAFNIWpF/87HjZyhEEGZfFV0TvHC7M9Mla
         upzHcaHfO3uBA8vZHf3xoQhhT4huMjo2bt6mIZslFzO3pCbTh7+4GnvhICX2hetHPG8b
         AERQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uCVKMpRAk2/3A7tGCan+KltPURnNlJMhlu/DYbjHJkfdllszeIdMDYj6LvJdJK38ivfz+R3GApZHO@vger.kernel.org
X-Gm-Message-State: AOJu0YwQahuCC1itfHiXsjn28q9kgEfgJtbsa55UIYYFq5tvwgmLLrXu
	PFybuPjeO6GartsTO6zKb0Y2uSksbFpzIHaMv+QGv+jEmwiXqG+e2a8NKTh3obKsIvWwfnmVWc7
	yEfqXHzyA3frRkGurI7GWRP9XogESlfQ=
X-Gm-Gg: Acq92OF7O9NWOAd02DSMs0D7nbXBI3t9ctQ+uUEsjZ+yGNbapeL/AFx74j3ADZqVi3h
	hMH5NIdBHhiiH2FQThreiqt8pIiEUCdsXAKX5Z6wepPxIqXaev0MzzhjJqSslUpFFBgrq8YEf0C
	BtQR4DHX6xFl+ZHLX4moTtviGrCkOwPS+m+feqyhUkrK8EJBKnIRw1tmTVi9hgkEtsTxzpJziqW
	B0PXKmz3nR5ElOPaP2m7GMRFXVwmUmLf24vQc/8qXhwKWAPhSpXiWq78T3vDYWU2l9uALOKiPHd
	VydghDbEmbao8diVkRFanU0Ivfzri3MTdRSJAvq3doy/oPp83Xgwu/HXUb3FpGm69AEPeA==
X-Received: by 2002:a5d:5d85:0:b0:43d:6787:9934 with SMTP id
 ffacd0b85a97d-45c580ce1fdmr12148663f8f.9.1778763441512; Thu, 14 May 2026
 05:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260512144104.761531-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260513230208.GB291825@killaraus.ideasonboard.com>
In-Reply-To: <20260513230208.GB291825@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 14 May 2026 13:56:54 +0100
X-Gm-Features: AVHnY4KbiOjn7p6OgTwUEPB8jMaJXzcFxbR1snrUWBRJrF42n-t6aSXedmu1OB0
Message-ID: <CA+V-a8sqeio7K1f4MYWVSP5rvq89fzcVhnZL_jFZRz__FhG4cQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-output clock limits
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Thu, May 14, 2026 at 12:02=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, May 12, 2026 at 03:41:03PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move pixel clock validation from a fixed encoder check to per-output
> > constraints stored in rzg2l_du_output_routing.
> >
> > Previously, rzg2l_du_encoder_mode_valid() applied a hard-coded 83.5 MHz
> > upper limit specifically for DPAD0. This approach cannot scale across t=
he
> > RZ DU family because pixel clock limits vary per SoC and per output
> > interface.
> >
> > Add mode_clock_min and mode_clock_max fields to rzg2l_du_output_routing
> > so that clock constraints are expressed at the granularity of individua=
l
> > output interfaces rather than globally per SoC. Update
> > rzg2l_du_encoder_mode_valid() to look up the routing entry for the acti=
ve
> > output and return MODE_CLOCK_LOW or MODE_CLOCK_HIGH when the pixel cloc=
k
> > falls outside the declared range. A value of 0 for either field means n=
o
> > bound is enforced in that direction.
> >
> > Set the DPAD0 pixel clock limits for RZ/G2UL (R9A07G043U) to 20.875 MHz
> > minimum and 83.5 MHz maximum. RZ/G2L and RZ/G2LC (R9A07G044) share the
> > same DPAD0 pixel clock limits.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Moved clock limits from device_info to output_routing to allow
> >   per-output constraints.
>
> Given that the DU has a single output, connected to multiple encoders,
> is the clock frequency limitation really a *per-output* property of the
> DU ? Clock constraints coming from encoders can be expressed in the
> respective bridge drivers (and the DSI encoder driver does so already).
>
For SoCs supporting DSI + DPI, the clock ranges vary for these
interfaces. For the DSI this is handled by the DSI encoder drivers,
but for DPI we must perform this check in the DU driver. Therefore, I
chose an approach involving a per-output clock range check.

Cheers,
Prabhakar
