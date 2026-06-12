Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0DC397329
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255538; cv=pass; b=LILqPYS6LPETgQJgDtxMzVhCMr47KYWqj9Ss52i0SXcKIjnRPpA5LgZ+SKqbFJWJOduatEbizCvpUS73H29j2GFylSdgOgF3B7b8q4NNWZk5qtCOn5InjK/scSgD1f9dAbgC98WAO4nmVM3lkmoAGN6L/imtIhUzTraPy1rYUp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255538; c=relaxed/simple;
	bh=V9+QmrpZdZ64QkPAYEa/J5l5l39WRUXFgGRxiy0LOV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EADBK1UnsFURHphMYnZEu18MVhyRHL/N48WYigFxSYn08MliQKP8QniZ6yXsUBaxTEEO/CZIIhIjcC51MS9DDkOh1vOOHfH4MoNElLKZ32qgUdPE3B0sheCq/PMgTJjWNm/FqKr3DZ7a1ScGzPhJSVvnegyiY135kywGnqXSWDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VY6z8Y27; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VY6z8Y27"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7e8833c99fcso7755917b3.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255532; cv=none;
        d=google.com; s=arc-20240605;
        b=LXfJ3ofQHJ10znlYjjPJ56W65IClWp7QSyR9FxeP3KEvWFvMz5CNfeuicrJ0cQcPu3
         2p/d0EP8kF+d0tQZ/e293snL7IQmr3WuItTPdp4cQLtjUFriv2OP3J0ZEnsRqOrUalP+
         1vnNwBKoR22/dLyj2L+PGolJ04cfvvU4GZhxA+5uNuArYdCy0LHEaxO0coKARn5tBRk2
         ACg8ALRtnuKr91FtKWR2umtrBLCRNp1aSS18eCUAXwmSoHWnsDQGQ/nqwQomohbVbAXO
         H3PUNYvbbDIt3SetvA5Nr2AAimDPvvR0mCwr4/lXyg2Rh5r3RP14QWkN4cZ0MJsZD1S3
         EUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        fh=1GzrPr5QrRFpqCpiOO67YgsLZE+f0tG/44nulfanWnE=;
        b=kKyMbuuJDWJ4DduwkL0D4/f9Z4WuzqnQMdcReBgrOGazxQp8FMI2XXhjJOTmva0/ok
         cLtUsyL7N7z4tyv39l24OFmbHQtaOQ5Qf2GzJcCnURCCeYWhB/1s7BmqHChRfvMeK6mf
         pVFKT1wiGub98TUiX1wQbrX9EpFyFOE4hkqcnTiFDkpqABHL5MFwksOy3EQPcsL5KoOw
         cDW1zNq/rEc0Ev1P5oIXTjoot9w9LCqYGGlfMCQ3ajrGOCC7SBhFHSrFXse7Vdp9aO3N
         IHJ+yMoRzWQSW35vySvwQBwZzwYNMYCQHAGejaDPvA9uuStJBnSAaZ4YA6Qw6vrdFJzr
         6qFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781255532; x=1781860332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        b=VY6z8Y27Bq/k1VaXQDtfw4d6RhDkAb7ja36E1h1GoBPyxh8YLLuJ0VGxGCciWhduL3
         K6pOSFQWx1us+l10HBVmKuj+38x5U1b+jmRjcTWKFAb1lZmSa9x2dBwuyDpyBhsriic0
         0cEp83ACaRF9R3X5w43ashV/jsuNNogzc5ovw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255532; x=1781860332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        b=IDEsJNIWoQJv2wBFHiKFHNQPvDwmUIbmpM3f0DFBfE6UmVM8gZbVsCWZmlVP2PlZFu
         ohPb2o6Qnn6EPEST44qmLalu8ttZmUFGatuAb5/sHuWb94nAoU3MYImbwXPEf6GWiAWu
         yNCCiIFLC9HpdPx6+sMHzsXOdzjX8GtOkuOerYNiF2EzQx7Q/X9TjkMM9LKUmEJuXLBK
         UQ4thYHi8VzKtx4MhDFHt8OpQCBVyU/6/J7gmT66P4HDXtXOO4R8/sMCJd/U66/CPAEI
         YUAabVlT2kgiwORLM8Y8frRkHDT/dwNm0zKlM3ot479wRU1q5No98yNfw6q6v778Gjin
         EiGg==
X-Forwarded-Encrypted: i=1; AFNElJ8Jb2rMEgP5yG2yO/NWEcgVvJtZODA8pRRCbM5+TdlyiU3X5a/xwmvmrnkd0MGUPhPT3wqVGpPyL23Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwNERpp2gkfv6Y0e0taYwp1vtTM9N9xHyTmVVSQ+S0MdcWtvDeK
	lJQmC+T8P/AVepDYzuGVfThthnqV0d+vRS4kg1SJzUBLvo7+AvFAC6w1L21TWHXoFGNC0O0qDZD
	Yvf4OS2HSa9g/mrryUwcWNox5xm/fdExUsynatAAG
X-Gm-Gg: Acq92OEv5BWU7GPkGXgYcPnoDDiLiwcFzxyO0GdahI9HyCfHUV6vbIULOxZLhlcoJly
	cBJVogGTQDTeHy+wdseLGBBBRD6Tf0hMkyU/R+tq7ighJz6CcCU5lqeQO3Ejn22QfTFhJ4l8W3T
	2LT6ZbxptEDiTh1Q+/Y+YSI3RJnYAh06/ITs3PsgRaoxCAp8Cge6nwVq7jcodfDqvsH/JmwshUo
	GAxhWh6SRvD2Q1+yDRREfxQaSLNVk6T9KYeQEnp+smD+n8hjLOPOyQZpRPX+dTXbBfUGCwE9OKC
	6o/Xqm4L
X-Received: by 2002:a05:690c:f0a:b0:7ef:d039:a334 with SMTP id
 00721157ae682-7f7bcf0d73cmr16871217b3.22.1781255532401; Fri, 12 Jun 2026
 02:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-11-wenst@chromium.org>
 <ail1sAxgh5Xtkj2y@ashevche-desk.local>
In-Reply-To: <ail1sAxgh5Xtkj2y@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 18:12:01 +0900
X-Gm-Features: AVVi8Cc47lUt9lrnuGQ2TayhjSsjO0Ufug4-8BS--usEeOHUYmKa3VTCiJvbq60
Message-ID: <CAGXv+5Fkp9R3i+WnCunbydJpn_rjxX5Cz9Cb=auS-cR1RE=R8g@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] power: sequencing: pcie-m2: support matching on
 remote "port" node
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:44PM +0800, Chen-Yu Tsai wrote:
> > A USB hub can have multiple ports, and this driver needs to
> > differentiate which port is being matched to. The USB hub driver now
> > associates the "port" node with the usb_port device, so here we can
> > use the remote "port" node to check for a match. Then fall back to
> > the remote device node for the other connection types.
>
> ...
>
> > +             if (remote_port && remote_port =3D=3D dev_of_node(dev))
> > +                     return PWRSEQ_MATCH_OK;
> >               if (remote && (remote =3D=3D dev_of_node(dev)))
> >                       return PWRSEQ_MATCH_OK;
>
> We have device_match_of_node() IIRC the name of that API.

Ack. Will also replace the existing instance.
