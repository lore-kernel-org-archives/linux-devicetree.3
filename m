Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028664;
	b=4+JW+jG5ijcdLVcklkMjrJ0LkEzgudSQmTHjQgIZIIbroACxFm/tZFgZCz1Tz8j+FRED
	 Etzh4ReIkcpbMr3ILLItoFyksM3HTfrWNZn91MN9rOHTd3En18ul1cvuQl2pcsGSS395g
	 hne+JscpeLqG3/o04ROgf2P/3firaisnlQ5xPARJ5wJsK1gYgox1GIuiCuGzGRTxL9L6r
	 2bEfiMrPnwbLzybukRhRulcvHncKLRyLYku0MEPXxS+uIIhKiliD3KC3w6m9e2nxGvLAX
	 o/3Se3Kc4Iyc1GQMs2atAgb6k8IeTIMsKffLGIuzl8GmMnYgis1ASZXpu/WuVypi0OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
	b=ZVS0786rmofa5Mt0ulyrbNcJ0n45q7M0mGSxrGfusXUMiOMqD1uBf+7xWKUZyf1/UuLi
	 2FH8Oij8nz2ZKS9YKAQiVFh9i0ic+3tbI4S0Q/EWnSnuGHzZOEH7YB7NHG5b7zH9U1G4X
	 WO2WCSyTAbQd08Q+YAC730xFT/PVL5LFfF2F99q75C5Ta3+uRTinor4ZAoDJ9vbNtzl3s
	 8xmhiu2bihmXMP6nP8IjewmO8eISHzQ6UEQK7ynNhtbNj2GhsYGQFkf4WgujDWRbskLam
	 K0x105t0IlLfOK7hrC4kuO3d4xMXjwXzzuyG0pJOl0YMBA6DzdiIAeJa9203Z1fDW6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U37QWvEc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF4606A31F
	for <Devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38EF4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U37QWvEc
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so6188013a12.1
        for <Devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028662; cv=none;
        d=google.com; s=arc-20260327;
        b=MX+U8+MoDcGAjGJfIjaD0JkSsTEpKevpmuB9SKe2jyVq7e4eCaEmmY3650un8gbq7N
         bOeEB6TW16l+Ex8dJJCXHpFZFOl7QM94WtcZUyLbhXgvhrU/GEtOMhkKS2WkJHnfWgLO
         k6yQdLrlp1nZNXejn8tiWr0TD7Y2E6b4XxpM+HK0Ritd8QmTjBD8fD7UO3veF6D8JGRE
         nUtb4xDLOCdSFjNKa/mr1B3vu59updFpjkGHmbg2LsPy7M0ZYh/VZF5R07SB5HeI4Oqp
         vuc6B/UDj0KH5Or+p7vV1gYY9Y3gP2cndzpP1qIFKjXo+We+MkNlGlEnBc/ATwHsXFgr
         /0BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
        fh=TBU5em4Y8RQttOR8qdiA0FQdRkXJpihjf8zHQ5mdw7M=;
        b=QigyaGwxVHwE9q1a0Tn4ORatDTK6grB+IOJkz9RHSyIdBowpfm9khf7MMFZnl/Vbep
         mgRp+3WHU0eXXSLlln9ncCZ38eo7mhLYpIgCIv6HrtGBRF9rZxjgkRcenSyhvE3aPZ9Q
         YndmyYKf3VQkhr/Rgdug43aku1kgnSO2kve7tcp5QtG36TjLtJgSK3w2SWIbyE1uDIDH
         kjC3FqqbjsPXA2/rSwlV5s6CG0+lYKeM+2ob/9cjH6fvX0bHUKw2KMtJ8Tl3YxMuFMaQ
         1XGrOkA1nE02fBZFxmupz+tmOIrCUr+OvnGrhGkxY4TOsdsWSHeFsaMZ6atpRH9mmnx7
         0MDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028662; x=1793633462; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
        b=U37QWvEcjGd1LVhbHoivRYrZLRgY3tc2jN7wyhTo6WzieHQxBOHf0+N0Yyef7EUyNP
         UqE1ZEkqmUOZywyXdiNpJhQM3NpOciuyIHZmYFB+Oz8gUB+BSMZ2l6zx6wMzasqv7SCa
         2JNhTOS6dpLkk2vbACqR6lSqSMXR1i+pxYoUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028662; x=1793633462;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
        b=otpanIAUGTMDsIHVUbxcmU/7xIpLzufCdC2jcRDcdhMZp/ttGrSeSENAMGuOK+7K5F
         O8x4bvlmtQ7mEnep82QCm+aZSGrPxSXHObDWrVo+xpdm+p3wBtS/IPLcYsEhb03Pot+a
         SYAErXodcvM2JQmz9TopBSYAplgsDOngoI06xKJ5vxQ4uv5plEZQiD6PjISoBbvoxil4
         Uvn0muIygMLexsb1+Ia0DNV1KrP6KNyAaZ8op903epcJK+WAYp/IUVzD+6nnHtkKgWgn
         1STQZnYjda1YD47hpLxPKXPxZwQv0/4yb98rns5M/TdLiE/gSXnAX+ggaKEKcWD6g5mV
         BM0w==
X-Forwarded-Encrypted: i=1; AKwUvBx2oHYF2Zgnsol9nYGQApIruF++LQmUGciDK5fC4R1tdMi/6N+MELeSGEEeI3HNG5eED+Ia6dVS5+nu@vger.kernel.org
X-Gm-Message-State: AFq9FYJom/nESROkfMp8LGgWHa5lc0FpVO6HToPD3OoQzCrhMjSST+oO
	dZ664Zp/0frXYvQDbnZ+zQIYKnYMQQKKL4pT+YwDjtm70oajlExzWyz7OSJLn6qpov2mksp5fhk
	wCB/rThHECXxaJ2m76wCLHd6tXDRcQ7mAOk/lGtb4
X-Gm-Gg: AYBFou0Cw5ecoNqRWU2ZV2l0OMG73EYzPaIwyhNV9dvZ8ysH+rDNC3dK+v6z/ZfI+Rj
	yralhZeW2UTZA5GUXkzXYX1Z/ddFwZsPh4i4I++wfx4VtB7EufhqU+Y6bW44+jO2pKa3YexhKAD
	p0W33GNhhwsRNaiLEqYseW8Xz/w4cJ2813zlbByCItg1ae+B6YKkqN94+/uFHdUnpwCz3qu5SVP
	H9CAVS3uXW94A5k+nQJtELwmriikSTrMHEItCidGjgXrv4NHfImXeo/B3W420CJaNVJ4R69FswR
	bsryV9PKs+mZ/oweRj/yUoHinQYXSV208OaIwNrio6Ay0fWGX6YRqt7U6oMkdY82GqJ/kJcguY8
	VqYd4ErMgguuDvLNddmnRddVYsTACsStNrE4=
X-Received: by 2002:a05:6402:4013:b0:6b1:ca87:c588 with SMTP id
 4fb4d7f45d1cf-6b443110cddmr8166525a12.37.1793028661578; Mon, 26 Oct 2026
 08:31:01 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:30:59 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 07:11:51 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-3-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org> <20261015182221.2931742-3-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 08:30:58 -0700
X-Gm-Features: AclHuK_nmjXBTCXflkgiPN9ZyiZhrkAUaOG6cYGE-6f8Kez0RNoxM0wmLg5pNsY
Message-ID: <CAFLszTiCTnpbmcGcjE2oWsY1UpyXd=8QFm+uuVBQTLw3-u_pFQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-15T18:21:33, Douglas Anderson <dianders@chromium.org> wrote:
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
> [...]
>
>  Makefile                   |    2 +-
>  README.md                  |   58 +++
>  fdtfactor                  | 1218 ++++++++++++++++++++++++++++++++++++++++++++
>  meson.build                |    1 +
>  tests/Makefile.tests       |    2 +-
>  tests/fdtfactor_board1.dts |   69 +++
>  tests/fdtfactor_board2.dts |   73 +++
>  tests/fdtfactor_board3.dts |   96 ++++
>  tests/run_tests.sh         |   61 ++-
>  tests/testutils.sh         |    1 +
>  10 files changed, 1578 insertions(+), 3 deletions(-)

> diff --git a/fdtfactor b/fdtfactor
> @@ -11,31 +11,195 @@ original device tree.
> +    if comp == 'xz':
> +        return lzma.compress(raw_bytes, format=lzma.FORMAT_XZ)

Python's default integrity check for FORMAT_XZ is CRC64, but embedded
xz decoders often support only CRC32. The kernel's lib/xz is one of
them, which is why scripts/xz_wrap.sh passes --check=crc32 to xz. So a
firmware-friendly .dtb.xz input could produce a .dtbo.xz that the same
firmware cannot read. Please can you pass check=lzma.CHECK_CRC32 here?

> diff --git a/fdtfactor b/fdtfactor
> @@ -1167,20 +1349,24 @@ def factor_dtb_files(args):
>                  d, base_dtb_blob, dtbo_blob, args.strip_local_fixups
>              )
>
> +    base_dtb_file_bytes = compress_blob(base_dtb_blob, base_dtb_comp)

If you keep --verify in the tool (David suggests it belongs in the
test suite), it would be worth running the compressed bytes back
through decompress_blob() and comparing them, since at present only
the uncompressed blobs are checked. That is cheap and would catch a
problem with the lz4 command or the compression options.

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> @@ -1147,6 +1147,36 @@ fdtoverlay_tests() {
> +	    run_wrap_test $PYTHON "$FDTFACTOR" -v --verify \
> +		-b "fdtfactor_base.test.dtb.$ext" \

In these tests the base output always uses the same compression as the
inputs, and the input extension always matches the file contents. Two
extra cases would be good, perhaps as a follow-up: a compressed blob
in a plain '.dtb' file (to exercise the magic-byte detection) and, if
-b stays, an uncompressed -b alongside compressed inputs.

Regards,
Simon
