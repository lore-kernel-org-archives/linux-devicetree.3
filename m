Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526380;
	b=0KvremVWSWzopYG+VA/+IqXgSv6XEQ02eVJT7wczKIm4etiEZGUV3hKIRYv8K2+zhdT2
	 FY0KIdkDD04Uf+8p9Wq5OEqj3V46ZwVvIN2qN3DbU3RaN0zwqrPArmFBYYDLqeqOwcfaT
	 GR/XGNzbpGVpmAfoHk1R2VCibzsLNtlwJdLUJ0vK9RGCOjNK/RtnoUbxhK0sVufxCcqse
	 ixIOrq/+ERL8u42uZouwuuZ0sG2sKsJUUA09+ycKQuoz59Zv3JPGDJNgCloRnkO8HJ8AK
	 dVTEtnMXQ6EsQ7X4TBDfhCmqONf7VSpehsq6WAUh1/6SzdE2N+V8GPTUcAYiYeu1xUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
	b=UP3e/D9/9eH8GuxYktuZMFRiux6B+I8n5uI7nwEBRHeyyZrlS+Yw2Q9OhOl6kiC5/70Z
	 1/HEH16MRkRHnLMuIFc2LEjNPfgfcwyO65rjvDts4BeO9uAobo9fPCdD9EAbBjzGYS9ee
	 eS6yCFx2GuVsCspVMlScL1+3xwpijwfiEhcLy2LKTIWHO4oaZosKQExWZn6yRx5pwbXpQ
	 CjjO3CbCYyoKRsRPtaP6A/i6LZ0sKefFDFK4P7YB/8241Pn69EJoZec4h7ecP0qQtQkZ0
	 jtMx+8APSREf0/Fl4f4CQecEnllvJSIJIsOCcVG0PGYM/ZdVJpKlMkf5pZBgwtiDB9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eBYWubu2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1965F606A32A
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1965F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eBYWubu2
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso5186933a12.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795526378; cv=none;
        d=google.com; s=arc-20260327;
        b=m4jRF0jl+HTIXPnWMRhPK3oQK1fuZFSFfI0oNxVnjkcor6NTGzcygwocw9GVFZjWP0
         oyHfSaZpV40trPLdIlBdCu+x1AJKCTsRd4BBYzFZEj0dHaWIW2MiSu5z/a5XHNV1Qz3q
         8Ox5mRAKm5vP55RjOsvUJBmpD0RqRIEm6jG2XH9x9dtn4MASCARXsB9joR4Y76ASiGRt
         cGDxVca9D2L9LkdAqAaFRfQxSKZiJeRSjxJUGlNTIvUCBVTxsv3lIWWqsLmcOCOSQPlC
         MhN0WAfi1+G4mMkd+x2VZ6A34ev4Dc6b9EMBs8xvIiESQrIdR3BqcIiP/QpsBHCDBe3d
         QWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        fh=FibwBu28+FxUGOOfxV7JY1JxuFUSlPu9oHzBTJF+NPM=;
        b=H75/qyousCoVBFT7eCVFdk7x+uNRn+4BD+0OaxJ5/c5h5wgce4KjBtFtjOExB+78F2
         Y4dkkWCV2ADljPxuQ9AlIpxll2C0VUijKNXfQ5zydKSjz+GMP3SipXKp8vaUwipRbrEA
         +fQeQEpQlnzcQfB1oUfG97qfr08t87zI6jv+2fPB+vor+obHTVwuY6Rpz1BohtjUUMqz
         CByejurFArgLFm0V8mBIjaGfCt6yfnBFN+0pge01nl5bgVpSFEcwhjVLQ460b/mIRUAG
         +9kqCqnTmvZl5kBWgaXauBszaory0UC56NmaePNIs2JYQ0xXrXZtc3uLpMhxHWygfeBV
         8r4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795526378; x=1796131178; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        b=eBYWubu2GiEXhpZu6NdOBq+vSwbV2FWVHzzO6RCiBLF3DvcP2g1JrmnU+BQv3R0zGN
         kvvTgrQIAxANAxro5Oi4eaxN11YT4WSo0OGv3sRSFgIFtpq2En16+JONirIcUEETALNQ
         lRVCNoT0kNT2qPFD2IWuVCxhrYBnh5jAlemWaTyIE7hEjR7KV8NybKjN0kUWJdA+sB4w
         QCdLvsMub7B5jXdqoCYHrijtJ+6czKn3vhUqvkpfWmPyXwN3GWPgW6exGBFya7/YtS85
         mfcSZbYjUeSYDWzqhY5Mvgb5gdQiAC4XUEToNNz56GmU6lGixrXnDd5LM/7NDwcPiHOn
         69aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526378; x=1796131178;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        b=f9TLmmhbx8z23f/BBoQ/NQpeTmRJf8Wa3ltNCOcEtEMYHzS1l9kjSCzy5i2Im1F42W
         6DKqSSbUOoxw8zMtYK6cmfM5pP4wD9/2nc4xSyULfNko9cejmvDxoRfQ6CvT3kryANld
         s5iQYpocCRxY3B6zOF1uN1ZU6GwssdsQpLh/PG9Io2I77QtrCf3aCQ12Kcrw5Oa4Mpgp
         usVJRr5wfYWj/dBnuTkxZOL/bTpAghvR0sY/YG+3I/gacAA88ECZCU3qeZ8NsTqCKiK2
         w3eui0ccz1I+t/x5GXszfUiLEvaXKZA+jUofCD8FJFJFhiUlLpdi+GhkYYkvt3jStZQD
         bgRw==
X-Forwarded-Encrypted: i=1; AL+hErFMcOrEck1Uj3QnFOe6ycL+fNwgpQd3ULMMGmoZjjg7lzdEk8Ave4lJ0QcHqJXrLnSWbamDTy/sloUM@vger.kernel.org
X-Gm-Message-State: APuU4Z/KyKKrEjo5QIBryHPjgwMpLVoAolfjwp2fS164UfSlmNi/7DZU
	r97qQ/6LCFYqJmpFWVIpMf6lg0jB5ETEpikwk0Tu+B6LdSjsGiEJAii9e/TkvU+QMNom6FHtDxO
	5kwsnkLJtKYtD9bZjRlvm1slzHe2VejyNrLAnBbDz7Q==
X-Gm-Gg: AZFdTZedIg7I2ye2wei2M9WGXNizXgA2uLmnPJoEfILzj33NS/j+cmy0Q4sxX/Hgp8f
	fUHU+hQGAPo5ceBm4TOvWhuItJUTgJ5c+LqCRcVdP3IiieVC62Wl72uAclANsPYoMFF0cvyzfBu
	HtUIS4IdZQga8+sZ2nafXz0wc7vlRrL4Wyd28fYO8IDs3ak3BnRHu5FbW3RGLQuGc+yLIrCT5QD
	+vU4VrJCzSaI8eFBGEFc/D2QfmLRlcM0n1s3SPEKyKCLvjPFvC8SBZtvbXSa6cw9pU3mI71AMTk
	vBV5Y8tsnhj/2IoCYuOvXO1Kya+D2skPlX09mh7ZGA+fiQwF/8rA9ccZQzcN8jWMq7ACdSZshrv
	Cw82jwJN3AHTTjnMPizstVCbJvqXD6iF9X0duWTeaRHi1ypuFd29+LTk3
X-Received: by 2002:a05:6402:1596:b0:6bb:6c8:c4d2 with SMTP id
 4fb4d7f45d1cf-6bb06c8ce30mr940474a12.31.1795526378188; Tue, 24 Nov 2026
 05:19:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 13:19:24 +0000
X-Gm-Features: Aa3M54ooVkb3f-H5oJfKOqKUsi4VT1Jkh00xU7wD3yuOn0cj9WC5t6c3w4KgoWc
Message-ID: <CADrjBPojS5tSJw+7E99AYec6NY46QLcM6iv=i3xodNJvvxKJRg@mail.gmail.com>
Subject: Re: [PATCH 0/9] google: Add support for Laguna CPM
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
>
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
>
> The Application Processor communicates with CPM over a pair of mailbox
> channels. CPM provides clock, power-domain, reset, and interrupt
> services.
>
> This series adds device tree bindings, DTS, and drivers to support CPM,
> and several of the basic services provided by CPM. These services are a
> minimal set needed to bootstrap many other components on the SoC --
> e.g., I have a working proof-of-concept PCIe driver running on top of
> this series + pinctrl (not included here). CPM provides some other
> components not yet included in this series (e.g., PMIC, RTC).
>
> This series depends on the bindings and mailbox-payload-definitions from
> this series:
>
>   https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
>   [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
>
> So this series cannot be applied as-is yet. However, v1 of that series
> was under review for about 3 months, so I'd like to at least:
>
>   1) demonstrate its clients (this came up at
>      https://lore.kernel.org/all/CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com/,
>      for one); and
>
>   2) start review for anything that isn't significantly impacted by
>      potential changes in the above mailbox series.
>
> With luck, the general design and DT bindings don't need to change, but
> even if so, I expect any changes should not significantly affect:
>
>  (a) the CPM DT binding or DTS (apart from #mbox-cells)
>
>  (b) the CPM interface (cpm_request_client(), cpm_send_message())
>
>  (c) any of the CPM clients (irqchip, reset, clk, pmdomain)
>
> Thus, I think this falls somewhere between "PATCH" and "RFC".
>
> This series has been tested on a Pixel 10 Pro XL (a.k.a., Mustang) both
> as-is (plus the aforementioned mailbox patches), and also with minimal
> additional local patches to get other components running on top
> (pinctrl, PCIe, RTC), to prove out some more realistic use cases.
>
> - Brian

FWIW, I tested this series, plus Doug's mailbox series on my Blazer
and Frankel devices. It was enough to see USB come to life as a gadget
using the already in-tree tensor USB glue and phy drivers (see patch
here https://gitlab.com/LinaroLtd/googlelt/linuxlt/-/commit/b7866f74743fd6828036bae570ca6d022e23c4ff)

Tested-by: Peter Griffin <peter.griffin@linaro.org> (Blazer/Frankel)

Regarding merging the dts/dtsi (arch/arm64/boot/dts/google) and
(drivers/soc/google) parts can go via my Tensor SoC tree. We will
likely need an immutable branch for driver/soc/google part to base the
other drivers off.

regards,

Peter
