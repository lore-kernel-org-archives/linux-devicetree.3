Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364633;
	b=NgBCFJ9gkSSwW80Z3iOhaTqEbTjEXJkvKsAsYseSlx0WQ31jPJeHblECglsuN3fnzJPK
	 nJfp6O9mfbZPx2lUJmYcys1eQ9g+l4z7o1O8vt8XSXxzZO3r0106iM89e4lgXJvevkdvp
	 f3xwYYhCzwm7G4ycTdVs2VpwWqVtl5ACx4BUuLJOGCImcFLx4wJ/R9MHt800mu1qd4cLC
	 oD9FcpJcZTgNZc1MPD8q+J7KoKXc+jg/W5NJg6ccT3eqhTnELyZ2P641yVl7gUUILLnq8
	 ZIC6p4O5aARo3T7H/1tnaWlGwKukndjAtxbVtytUINcsdVPou0/JXEn+adQ6KNi1NIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
	b=vV9aYkvKD7+W9awetAAuCcBEAw+lB1gVSJ9yKJE174cY5M87b2Z0Tv55EBeNLvAyzSaU
	 0/M+D3HYROomnkYP3vltn24VlOXw/ISmRiMouXvKHLjwVubjMeTDlRqkFWHIpd5zZ2BfD
	 S4DGk9sgYhfZxd9dC0xBc6RDahIn64M4qVy469sy2m+Bb38b5TZ8fiW6Egtmcv6e6OD9h
	 78Bq9xXWeVwn7GN5EyQjdV484vghFHuIk0eX/TxeivQXPsFZYTgF7Z4V5299BbtJnNEKk
	 1CGFNHHNaG7vMMA27w0lITOL4YC0ZkQXMARJBQHIR1fuZBEwaY+dBPObp7q61YNwSbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SYbesSV1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C7B606A329
	for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C7B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SYbesSV1
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso782297a12.2
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364632; cv=none;
        d=google.com; s=arc-20260327;
        b=YGw+XcllWAl1Gw/1h2Q2y4J6p8kH7Ro1UEwq3AsLzUcVBj63IoABzGY2hplNZUyaaw
         +sJy2x+yK6/pTfR21QTz8LYlKLdhqtTs+nrW2vqY3WIqg2+iWhwJw10Mf9SajGlp5F8E
         xrf6ETzG8Ms4PX7qujNUvV6zQabmGVQSuuLEXIqT6rwIESVgil9ux+PYFaKBH/7sgi2d
         hznYrqeHOLTnB+tlAaVY+lEnHAC79w5NAj91T+1bSgxO4LBQoWoxsjKjoqouOwjiiAJ9
         PDFwRXDGtVLLINzyCs7SwKxAIngzyx5o8G4XKTG1pLVRmcoKeHS1WdIs+45tq3Uti2xh
         7RxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
        fh=rvmiiLig62BirLrYkY/m0uRbD3MwfnCkgVBu9DCqlzc=;
        b=VJiEbXW1Io4LRUrUbpS/ReL9O0FpvxLpyzHPOeAzsKlNYEq4FGpWhASH+Mksfq0sw4
         jIn0L6J9NzjVBHzAgaW8x1bsPCiKzx7K9j7i4uQeQJ8E0H3VmH8f7HsPJMNA+Z8ukKko
         e6NPc7WQNxikQajrXRkuBacYzZwmofT0lOcoQymIAyS9FRpuzwd3n19n6uyP+hDLrlqu
         mGDQKdojkvNj5QAZvUp/GRF12Ckf7Pdy4QQydem5F5REORorbJxbcKIE/7Wq8OAcTzjF
         qIB941ZVnSYEHsIK8GdLApZq0gQj0jsLnGV0AmJF4LqZQO1vL+1mos0K+uHWmLTWHPo3
         btfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364632; x=1793969432; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
        b=SYbesSV15T5/9mZIx8kfcRNmn6l3YY8QGeI1q8Hely+8rS2podieFf9mOy2+xsDRsj
         U77SNQy5fVGsS8tR6YhEeb++HJ5Oyn9vwVGmcIRXhieoNGGDnTKkc3HaDUzzXbgMzq8F
         dYVn/3f8xOtoGt2MJk/Msw8qqcBWv4EKr1+wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364632; x=1793969432;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
        b=aDlfdWs3Z2NL/sxfxK+Rq3Hgs0NqdAZix52QPXB/LEya7yuPzxFxHZFLa7a7BXGsEu
         WVFntnRfBiw7K8ySp3w9w927BWUpmlAvYt7h6XIUjhQVOoGNGEli1R6FGQcliKNWv+k+
         GiJPrt8Yd3Evhhfzci+Bk18omLOX2OZ6OCI6CbO1g5UxdB0aNq5TqcajYLcjtz5rIVAh
         bw6C3/bQ6+TVFNdJEmUtDKfLQiyL9jDF5UFuj6cDms3U2TMc0Ks4veFIeMcVWOlgoqgu
         K1Eci8QGd/Y9kYHDhqk9WIS+rHAOeBirQLapbi6wY9cvcJPiVwYjIlmWTAd2UOVedog/
         PvXA==
X-Forwarded-Encrypted: i=1; AKwUvBzBhBVI8MBsRRGQVBnXVxrwPetkhAWHI7Za1+AZ+13/r6Cx2TqKQzCubVoRhqqZQco+oYIw10DN8h09@vger.kernel.org
X-Gm-Message-State: AFq9FYIWXQKAI0ahGhA2isneCDpQDm2r3NfDCC9w4nsHmyX4Dsx9/lDO
	e7iF3o2iUMbW2rZscO7d9CZOAwVkYecmNbmw+1necESqomQ5gjV+BOi3UhqJX4uFKwXEXGXvcJ+
	RzSeDxCs9jKq+vjZiHxB/JtMstsrsO705QrKlxYWx
X-Gm-Gg: AYBFou1fi5JvrASbsRyzuqQR7i89FXsSkKYNjEoLTvN/qXml78saWMfGOVVOknB8hmU
	HI3cVgrT7lGuLj6oGIxoKsfAiOonZJDeFgLt52lhd/98+SBzd2B35NRE/0cfgc3PhxVxfg/5eCB
	Tp0EGqVhpJ9Xqx8fQX+HQSBU2gRupIq68+m59itc3LsqlebJ7ngsax8RGENfZ8acfJKI/qUcDm1
	zmhnvPHeJ64+DaEiSmnPoMTQLMw6ZlJVK4+6TS+wzme5WPB3g1EIanzoEYZa4p6uOADY1Pj76ae
	BCi3y+TK8ZJ/PHIyBjr35vFxK1AS0GwKpX3zCd5VI/sb90YpE2rcYE44DVsL5UUben7jrRqWQb1
	w4R4bUZ8saHL9ih8jWNsEq1v+v7RrJZ7nK0rnuHFD065uambVI6Sr988FviDUod7Y3ZAsrgw=
X-Received: by 2002:a05:6402:234b:b0:6b3:c499:457b with SMTP id
 4fb4d7f45d1cf-6b4d5ee4694mr1571580a12.37.1793364631626; Fri, 30 Oct 2026
 05:50:31 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:30 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:40 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-8-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-8-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:30 -0700
X-Gm-Features: AclHuK_bLtvWnT_sBBLVpqNMOqp9dk3T0gTPOazDaN2_jgPIOOOV0mKPKAh7ZHQ
Message-ID: <CAFLszTjddQakuBaj3UYk0sKxVsOvhrE0+6KnGOQ6tQJ2o=aVng@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] fdtfactor: Add tool to split DTBs into a base
 DTB and overlays
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add tool to split DTBs into a base DTB and overlays
>
> When shipping a single firmware or kernel image that supports many
> closely related board variants or SKUs, bundling a full compiled .dtb
> for every variant results in substantial duplication.
>
> Add `fdtfactor`, a Python tool built on `pylibfdt` that takes a set of
> compiled device tree blobs (.dtb) compiled with `-@ -L` (`/__symbols__`
> and `/__local_fixups__`) and splits them into a single common
> `base.dtb` and per-board `.dtbo` overlays:
>
> - Common nodes present across all input DTBs are placed in `base.dtb`,
>   with each common property assigned the value shared by at least two
>   boards that maximizes byte savings across overlays.
> - Using `/__local_fixups__`, phandle references inside property values
>   are normalized to target node paths so common properties referencing
>   common nodes match even when numeric phandles differ across input
>   DTBs.
> - Any common node that carries a phandle in any input DTB receives its
>   phandle in `base.dtb` so overlays only emit `phandle` properties on
>   newly added subnodes, matching the requirements of `libfdt`, Linux's
>   `drivers/of/overlay.c`, and coreboot's `dt_apply_overlay()`.
>
> Add a `fdtfactor` test suite in `tests/run_tests.sh` verifying that
> applying each generated `.dtbo` to `base.dtb` with `fdtoverlay`
> reconstructs the original DTB (verified via `dtbs_equal_unordered`,
> including across input DTBs with shifted phandle numbers).
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  Makefile                           |   2 +-
>  README.md                          |  43 ++
>  fdtfactor                          | 814 +++++++++++++++++++++++++++++++++++++
>  meson.build                        |   1 +
>  tests/Makefile.tests               |   4 +-
>  tests/fdtfactor_board1.dts         |  38 ++
>  tests/fdtfactor_board2.dts         |  36 ++
>  tests/fdtfactor_board3.dts         |  34 ++
>  tests/fdtfactor_board3_shifted.dts |  34 ++
>  tests/meson.build                  |   2 +-
>  tests/run_tests.sh                 |  65 ++-
>  tests/testutils.sh                 |   1 +
>  12 files changed, 1067 insertions(+), 7 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
