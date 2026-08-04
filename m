Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89D3D3CE3
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 20:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876608; cv=none; b=ko0MYLftcMlu9djniAon0OMXYn/HbKqpcTdCVUA/qQSuXx1KRCuWGn++IeuzNriGE15uZebghnH6Goqftl+6k1XzTBPP5KOIFK6gtn1zCXzIyC3d5s0dUDYw+6KzOXuEEfM3+VwCzFyj8SyBSPml3Nc8qYmihLtVHbzPu/i/iwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876608; c=relaxed/simple;
	bh=JmWiVmd4Nd6WayL2l0rOeGzkd6TqNX1vRIObxONb8yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvXbRWJo6TyTgFWsn3w473fqQD5E+ib5F1dS5pgiR2HI4RJW244ysnOzLSjha1zR3BTgNiI6XvYCUmAQy8xH1flhP6LXLNgfCsSyZ2nt6HDoovXoDEJuLwuZjUrzY5LI+4XHQZZLhEJd+JeeprClJZ0GmnY5abr35ejLP7c0ot4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G2ZgsOjI; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G2ZgsOjI"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7542a2ee156so111050137.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785876603; x=1786481403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JmWiVmd4Nd6WayL2l0rOeGzkd6TqNX1vRIObxONb8yE=;
        b=G2ZgsOjI6pbRffXqZiGGbk2cemUDTL0QIdDG/k7+XqyFdKmp8w4ObfgCf3pVQh+zXt
         eCxeoMPSyllRPISUlo3ua9/dbOOS7ySHpjlcr3sZkwKdTeL3YmqXfaub+F4awhZo555A
         aINRObXsSpW37pvHDhkA+KCLcubxA993O1yjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785876603; x=1786481403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmWiVmd4Nd6WayL2l0rOeGzkd6TqNX1vRIObxONb8yE=;
        b=jVggi7jmE2SqFPsihVtwgSBE17edFn8k3LCOl2vrGe3WZti7bfloAhG5AxLHoKy4Fb
         gH8wl+i0ypVVFR7oqAFX9r1fx+qG9Gvo6nzT4tyZ8RCDGwJMivkgtum4rFfFB1CeIRBZ
         G9LCHYahtB1zh97hUVenDqkNenI1xekAVZzOQDZ8H/0ymHfIgpTQV89Zg44QP0R7GaGq
         GWok2wCx4sxWCoV3L7AhBfqFy4/a9RXbTr/7LSEuHy8KCtOUrPh9OHLHdd4n0Vmqrpv3
         XuL1685IM6N72bkEcwabsR829dQ2OVzDc0+lTnZW55zeNLf9jSM3MzrO9GgNInWfXjdb
         mdxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2DGMGGIsr/ZrEg8mncp8R+lYS/LB7ldREYl/J6qlU+V5gDg3Pg1MVOFrRCWPFE4znVkeT9zRExPBw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Qe4KGDW/JxIDKZiHZIoflO3y87L1lZ8yK1v5ybr5ztfzkM8r
	Brp+S/aVEgMMmMMyQ0DimCElHPlt3A7VQw2j181b01V7fCK/cc6VL/g2N/LjLCmEjxeIkJ4GBlZ
	x2bU=
X-Gm-Gg: AR+sD10+5Aw2ThUK9aaF+TNPZDCAC0elCEggqChIgLiSM8lFHBwMNkfx5KbGsga0/39
	smJD7QEvwILZ+In46IeX6owqfMEOLgkGlHDhnpZDkRc1LXoiU65kcsBvFGtYMpkTwFNQFmTST8O
	NWKEaHUkTAksXnxSvibRZexqELJKS8ajl43i1YA0OoZUY89qEX40CMbMno5gQ8akTk90LRsXS84
	EB+JC0yp2817T7L5CZOdkD+6nhDSX+kUjjgRcxRRxOSQnLYwySp+CbuEhEm7omJSBcnEBGCLclu
	W+LTf54Fzf524cDUc8atTDPEDgrfwMucXvUiDZkqOz/WQYra0KKBzlI0B+O07zIVW/sv86s1/jX
	nPiZ8tNdoZkDpRfFPbRrnvVzTKGvF764aC9h7/HWWSmigt/d1V/6M8juigrzMK5AFjNVdXnCHki
	/cZvMYsJRjNZXX7+ViPWlPbrjQufpWcWfQ9MAp2Jr07Oay2hJmiVfIJddiNwQ8TVVdOBoL31X2J
	7Ro15z8JeJXnA0dw7aCOJWMDc0=
X-Received: by 2002:a05:6102:54ac:b0:738:bf0f:d0c6 with SMTP id ada2fe7eead31-760e3b9ab74mr528317137.0.1785876603528;
        Tue, 04 Aug 2026 13:50:03 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-760450312a1sm1041426137.2.2026.08.04.13.50.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 13:50:02 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7475a4f8b05so120119137.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:50:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpjLo/tiA/b8+M/AqcOkV30G86Wm9YMYVJ+Sxixq4vy8IuUH/AJi7AhGRkyRBCWSyEl0RKX1207GtG1@vger.kernel.org
X-Received: by 2002:a05:6102:5345:b0:745:31e9:f3d2 with SMTP id
 ada2fe7eead31-760e924341emr549143137.10.1785876601279; Tue, 04 Aug 2026
 13:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804133801.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid>
 <20260804204450.03CC61F000E9@smtp.kernel.org>
In-Reply-To: <20260804204450.03CC61F000E9@smtp.kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 4 Aug 2026 13:49:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFAM=y2p-AornMprUSN2dRHrrhUinBXy6K6-GAgo+hjQ@mail.gmail.com>
X-Gm-Features: AUfX_myMue-9Vsq0yOZmJgKRFBa-_y0bCsp87pVyUo1YRYj-fxTpnsKL0Kr5PaA
Message-ID: <CAD=FV=XFAM=y2p-AornMprUSN2dRHrrhUinBXy6K6-GAgo+hjQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: Delete old 'mailbox.txt' bindings file
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lee Jones <lee@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 4, 2026 at 1:44=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Deleting `mailbox.txt` without updating references to it in other=
 binding files leaves dangling, broken documentation references.
> --
>
> --- Patch [1]: [PATCH] dt-bindings: mailbox: Delete old 'mailbox.txt' bin=
dings file ---
> commit 1b70b3f250d6bcf306aca223e0e91c9fb8a20cc2
> Author: Douglas Anderson <dianders@chromium.org>
>
> dt-bindings: mailbox: Delete old 'mailbox.txt' bindings file
>
> This commit deletes the old mailbox.txt device-tree bindings file. The
> documentation contained in the file has been moved to the dt-schema
> repository.
>
> Link: https://lore.kernel.org/r/20260722140214.GA548057-robh@kernel.org [=
1]
> Link: https://lore.kernel.org/r/dc7a2041-50a4-482e-9930-566bb3fd1e72@kern=
el.org [2]
> Link: https://lore.kernel.org/r/CAL_JsqKVjQ2m-dzMUENQry-f_YE9QrYSOKoH9CPj=
1gjj8XkPRA@mail.gmail.com [3]
> Link: https://github.com/devicetree-org/dt-schema/pull/202 [4]
>
> > diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Do=
cumentation/devicetree/bindings/mailbox/mailbox.txt
> > deleted file mode 100644
> > index af8ecee2ac687..0000000000000
> > --- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
> > +++ /dev/null
> > @@ -1,60 +0,0 @@
> > -* Generic Mailbox Controller and client driver bindings
>
> [Severity: Low]
> Does deleting this file leave dangling documentation links in other bindi=
ngs
> that still reference it?
>
> For example, there are explicit references to mailbox.txt in:
> - Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> - Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
> - Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> - Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> - Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.ya=
ml
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804133801.1.=
I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid?part=3D1

Sashiko makes a good point. I'm happy to send a v2 of this patch
fixing this, but I'll wait to see if there are any other comments
first. If I don't hear anything in a week or so, I'll send a v2
anyway.

-Doug
