Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028666;
	b=YOYykGsUej4hxY9J0rysk0Glg1uOWphRvGH1gbtfWkiDVRYPP3QyJu8w3FtzjcJxqctJ
	 ATVX226LTEKKuQmt/xtvaWr1crWRDNEV1JT4/Z+6xwGcwMXviaL2rBsiaHkTWKu82Dpc5
	 0LMQuPzVVJhupzVxqHcMd/L2o7S1U2ulw8q0+naWXV0OY6jhHif5DOW0bxTU7Q1LZk8+c
	 aSJns8WwZS2BlC+AntWVylSoQHv1S52wrEn6pDsVVVB2F1QgRXMVmUw7mdVoAgm2U5rUr
	 gVT/1CwY4aX4n4JnCvYYxJQIs4VxmNORtzABEpHMpQbAQZvgZlwjsLioXP0PQOeXPcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
	b=gw1dBCZGwYA8cIjmAhgNghbgttLZhSkXG2z2JSDRdrsNKiM5R/TAml5hm5RdRm4QUYFp
	 FM8aoQIUhGWd7xgi4DDM5zDYDiA26/9a9Zl4B7uz0p/Vq0ZxH1TmhdfyjsZPExGg1TUw6
	 +jK9oEaLIFO5q/5e0JP8PISeu+qqqRPJ51YaUGO6VjCZ1iI0Jy4R7/o1CzhQilSD56vDp
	 aAqAqqRVxmD6Bfc7QyblimpwFjzhrOwFi7oczuDnJGv91rV0y5CylNZ2kXpEM3HMmtyJi
	 CJwYncq+QUfrrjxk4jp3Y6/sgMpPps3DAxPuU5ccOUHzm23dBdYwNBaHFojdIffR0tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Za13/Bq8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A380D606A324
	for <Devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A380D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Za13/Bq8
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so6188145a12.1
        for <Devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028664; cv=none;
        d=google.com; s=arc-20260327;
        b=KHbGnijjpE/KKs5tAwMyl15/K6m74uoeZLLu/wwSfzdSF4BjcmcpC8tTzmEhciK5Gn
         DXqfldiPjM13kD99pGK1Sh4JZAeUtifOvKcj8fn/wOen3G39jzIw/h0bwCDVHQTNJJZB
         pwbyS5xvIhMH7RnrI8qcE4fMovjbB/zEYe6NbhNzsXr55V+CfNWGF1PWRVFppfegEnPd
         4NkRzG7DHUwFGwwuNrApyeDOGp3oCp8umlW00+3Bu1nsFPO7ikRC9waau62EbzJiNDCu
         pCHEGv2ZfQzKs+u+h4xAOFE3sobWcf0MQgsIl/EtQGHdiEX55CutrnGAE/mOyPoyFeWv
         za1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
        fh=gEQiurBR4hXcqqMNhsLxtenRP+GlWRm72Or3g/mgZf8=;
        b=GemWNwnSGPb/WZ8pwd0j76UUwypNY0rJgEUx2BteN5p4XmdMoMybODIT1hOmbgYZWg
         nd17V2wsQHgkeEVnRFZcbNZyO0C3ODg6lrS9nq5a/OtWQF+fNnbax/BIo+LkazQcwZu6
         Vl+OwCzACgPqKknXJxqrciWijNlCg+722PHgkWk0cRMpDFg0SJukys995OfU6vheL2Rd
         ZwuOLSeNw89sidi9iNPlLiDvlL5mk8m7Xf9rbV3HIkZUomFxD5BYmfeh2iN8oFVM9V4y
         9xaPwKA4Ym365kg2VJc6PuJAKLcRyPADTnLuUoZAYbWgVpLkQ/QO5LyiMB1muqSjUJ0u
         dJag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028664; x=1793633464; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
        b=Za13/Bq8Yi/UnFcjNR5tbGFu6kj19LhC3A9gx1tmwCDExrLmn1zErs+eDYhHxp9+j5
         3j5JlknAT+0EZg6ehVMZjvqzpyyq+PC3nAmWP4Ze3hXIDLwFkM6PwYR5T2jAAFq+tlNd
         br/Buw7D5rWdgMJaHj1hlo4Y0RHJs1g224bkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028664; x=1793633464;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
        b=xTr5LGRO67JLf/P/L5ttQKr/r+qyzyRyH+pFGLcW3HRYgx09Tw0B72UN9iAVfqFiVo
         GlX6ZhJsr3PLUmqnoSaXotsBhcBO0/9jPaap+MgWM116Ni0aWStuDseTRsb37+OsOOhr
         WeUKlnDXSZfGiTldxegvF4ZvB47PoeSJXRU6edgLH4WlUJ6qpcSlaxnCAIS3p+rFHrJA
         aXyEUA7aFzZLlSjjgH2pxH2Jrapz+tRMxmMkz+nGUUXcu4f25UIqJR5G4JgnI9udO4ui
         85xpYfdFHCZd5rhd0p57Sruk4N7/Tl9OMRiVn7vJoD1WExCqWydylNIqr4HIV/ugmhHl
         IQwg==
X-Forwarded-Encrypted: i=1; AKwUvBzxKafsFuIo8CgSV5RErSLSkXxiVPOGCfjbYHGRLKb+5jWVatGYMoxpWbA7i0JdPov+vAyCwm5f79uL@vger.kernel.org
X-Gm-Message-State: AFq9FYLOMIOBJibwMipJeX2ZHtHUtuUyKuBAOtbltDGskFJ7gLOWfJoL
	1vIQGJ0F1ZEIURemm2SUBcqO1IY0VY3yY3e3/Wfy+h7NepblBnl8G4auEPRa3d7R6O5+FeEEIg3
	j4fzuBwy4v6skesaINiS7sFGvhEY7I1+d0cfyPT6I
X-Gm-Gg: AYBFou3hdyMfpzu/g4b5s58h9qBPTR1Z4vKePA01nNq0mm2pk11cj5xew3GtxBXwFya
	7M5NKeFTRdbsRM9OVg+xOkLfiFei3hg2HXfGQU4A9tPi9Ac6QQfeqCafn0+yEoWGhW/RSQ5tMaX
	IMBDuRjX2y7SDiqjzlBSL+SAgxLUc1ST0Qkz+z5JPPTLEcYuvsKMm/cowxSfLHqsopf0xmZAWwS
	LvTbbWrV1W5yyvLgUzz7gZGykM3vUXOehZj0e+y76A1AaSTVs25bMNO5kcR9CjFgHppOyVQmRjy
	jNs50Z99Q1TIavN9Qh7PJpva0Dw7bVR66ITZrYBLmfUIKKCMDrPzrbHmIILcSO1R1BQzTVmaehz
	agUZCwaOPrG4bzJVSfViSkh97SJuAgZ+EOIQ=
X-Received: by 2002:a05:6402:1356:b0:6b1:8316:ba32 with SMTP id
 4fb4d7f45d1cf-6b442ff2d2bmr5868656a12.17.1793028664145; Mon, 26 Oct 2026
 08:31:04 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:31:01 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 07:12:00 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-4-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org> <20261015182221.2931742-4-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 08:31:01 -0700
X-Gm-Features: AclHuK_hy_WTcUcfTQINhQj2aXPqXOcXmBmhHpzgXfBxsWcmA5gscgp9ZGWx9GE
Message-ID: <CAFLszTi-j8HmVy8u3gtH-6YCigakX5CNeqZ9sVc5ksn7q3NxaQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] fdtfactor: Support compressed DTB inputs and outputs
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
> fdtfactor: Support compressed DTB inputs and outputs
>
> Firmware and FIT image build pipelines frequently store device tree
> blobs compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).
>
> Extend `fdtfactor` to detect compressed input blobs by magic bytes or
> file extension, transparently decompress them before factoring, and
> compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:
>
> - Support `.lz4` (via the `lz4` CLI), `.lzma`/`.xz` (via Python's
>   `lzma` module), and `.gz` (via Python's `gzip` module).
> - Preserve the input compression format on generated `.dtbo` files and
>   compress `base.dtb` when its output path carries a compression suffix
>   (e.g., `-b base.dtb.lz4`).
> - Report compressed size savings alongside uncompressed savings when
>   `-v`/`--verbose` is specified.
>
> On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
> `fdtfactor -S` reduces total LZ4-compressed size from 1.71 MB to 213 KB
> (87.5% savings).
> [...]
>
>  README.md            |  16 +--
>  fdtfactor            | 267 +++++++++++++++++++++++++++++++++++++++++++++------
>  tests/Makefile.tests |   5 +-
>  tests/run_tests.sh   |  34 ++++++-
>  4 files changed, 284 insertions(+), 38 deletions(-)

David is leaving this patch until patch 2 has been reworked, so these
are just two things to carry into the next version.

> diff --git a/fdtfactor b/fdtfactor
> @@ -11,31 +11,195 @@ original device tree.
> +LZ4_MAGIC = b'\x04\x22\x4d\x18'
> +LZ4_LEGACY_MAGIC = b'\x02\x21\x4c\x18'

Legacy lz4 input is detected here, but compress_blob() always runs
'lz4 -12 -z', which writes the frame format. So a legacy-format
board.dtb.lz4 comes out as a frame-format board.dtbo.lz4. I checked:
'lz4 -l -9' output starts with 02 21 4c 18, while the compress_blob()
command gives 04 22 4d 18. The kernel's cmd_lz4 uses 'lz4 -l', and
lib/decompress_unlz4.c only accepts the legacy format. So a consumer
that handles only one of the two formats cannot read the result. This
doesn't match 'Preserve the input compression format' in the commit
message. Please can you track legacy as its own compression type (and
pass -l when compressing), or else reject legacy input?

> +def decompress_blob(raw_bytes, filename='', comp=None):
...
> +    if comp == 'lz4':
> +        try:
> +            res = subprocess.run(
> +                ['lz4', '-d', '-q', '-c'],
> +                input=raw_bytes,
> +                capture_output=True,
> +                check=False,
> +            )
> +        except FileNotFoundError as exc:
> +            raise RuntimeError(
> +                'lz4 command not found; install lz4 to process .lz4 files'
> +            ) from exc

compress_blob() repeats this block almost exactly, so it should be in
a helper. If the helper takes the filename, compression errors can
also say which file failed.

Regards,
Simon
