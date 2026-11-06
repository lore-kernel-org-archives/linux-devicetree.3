Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962345;
	b=Io38Fg06ZQ2KkvauXvcbzYAucvQ9YU00GBTlexzP4oQsZkQd5N4Z3aT2+x3spylLHhu+
	 r+FH7bxjbmEECcK9xRK2yxuPx7xSp4Bc4okIoL5q2qrEuk3TsmL/j35Q3ZaCbDmlLMRFF
	 gXUV2fd/VZ+RstLbzhZUT6yzDBayR9Y9QvJu0lGtuGluqFVOmZVnNNjRxNHRxLrLqHfJW
	 knkypATGV2eWBLQWEPerdfzTCcI1gyBjSL74YQoSc2sBlN5xLgQhCqialwX5LdARjUnx4
	 kVcAccfoRi0o5zKl+AjLHfE8fUtBGJuOFBxcof5LMl9sDFT7Lt1Apz57NCTP+WSGGPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
	b=ySp2UkgTmivkSaZznNURw5+Pk5dNeZcjA+6vjD9TPOf2O3RuKCVjIuB/KsLi8gDir9fa
	 wzLryb91XQFN0GpcYqeZu9ZcCNifzdrvy30/+94QuwWtLl3sOgcS6CsWm2Vt9M84BZq2y
	 ASuw70jt8xo8bb7Dz8MK5cGUkt8SVhQv+SLg8D3KBezE0XWGK3NJkRUThTb50vLUi5brE
	 ZFwC26ihrrLP+MmAcv2x6KR6Ye6x+Z7XXAGSZp3FPyigJFiJ7aUNvEb9iNgO/Kery4R8L
	 MULWE1FXIi29sle4D5+51vEJE5ipjPO6ycyYbUMzQYJemS8Zn/pzZhsmLzQ1isc2Frg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvN3tpWT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A42606EE9B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A42606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvN3tpWT
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso3205525e9.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:52:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793962343; cv=none;
        d=google.com; s=arc-20260327;
        b=pfqS771iDNUq1WP8dVi2sDU0K7sEp3KznAFeuLCWdKCA3zzsSWkHfX66Gv084AvhGC
         JrOq2858B22hGqnC1QNdHQRZyqYFgFI86EKLu5c253+VxO4YcKNo3rW7wpM7dF3UbgP+
         lU+pZgsEG+2OyUn4nRZKDyqkCNlrb3OdLdnCRh6G0aUd9u4paTLmMNdQgW39CULNhaJC
         9r9WD5GovL61S5BjCAlrhVtEwByBO1Zg9edo86mvoktAF4yINuRVpfmrwUoC/UrFgiW9
         WrBueqANUEOOK5Q12P4ai+2VSVYT43AOZANQmbpI2Y9xsdy7ZAeB1JSJ4Xq7YCM7IcwJ
         cjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
        fh=bDVPiSihGEqhP17Pa5hoBxeOqfXKmWDIVn+S8Q0q7hw=;
        b=AIneIY5+vGzpQ49pptMZiLoIY418zUaWX9Vzm6/PLrCZqm0Fu3/EhaovPVFhNYmbn2
         QOJ6va3OjEj+/lhEpV6j+fDCz0OnchsG2ebDJdo2QZWHTpwA6baOfAlGGunM9FAWu5Ti
         3PoIvGaQk7eM/8WH9fFo5y6V1SZSnHwD/mEUAdJYMUXXI3wOYtzkP9oJ845DwBqyrepc
         PkDWdizKsKs+zr07icGNO48G4x03QaAix2fC+9J/njWHZFggAFXzhC1sDbIalxeJ8xiB
         2CXRiHX+tDizP8pmrL+IFS+57YWyIjn6yN1C4lFI2NgVXL2FuyqDQOlzpXccEskpkoPp
         czyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962343; x=1794567143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
        b=lvN3tpWTeQpNWoDkbs3yHEwVfqoGP1Ll9s/HrfhG8tEDDv3PUO1hwT15EkduXS+rWm
         aKWxHsXRIUr2QeleSRc+K0NgYrShBjliU8NjORCRwkrNoin3iunoivkUiQVSnOVPn3Rx
         3bw9l9mkskwPFOKzC57OGkiAtMteSYznGOZSX7n89i8iGMDsWXZApoeXQWBtfBEuFZpy
         KcN8x+453vC/bhc1y32uowH4Ej1eJXdn8Ad0zClYJTCUv5BGywALZQmlFJ5fvNLFRNKj
         DMkqNrtPcHnNDWbKKAFD0WvieXZcGyKH6qqVqbR80niPzNimQRLquSkHFkxdOBQvYL9E
         L88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962343; x=1794567143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
        b=ZpvddExnhudHl84GEOhdJuO9oE3vX3kyLuOPZ2iZaDKti857L+MMjD680c5/Gmsix8
         GH17EQTwYwMBGJ6PBLph65ssHh+VE/BPrk+MwGCPwqbGKzmoKzOWyN7TaD4g9K/XbKRM
         y5gBWzk5aYFsQiKjYS41KiV3OZ4/v3w43L2mGoJpRd6YZuKqxeZmg5DfIQjgO3xo4Xq+
         0zGKJALlncFaAHn5ioSYDI0B5lCiYJkPE/3t8ejK/0xEkDeRtSqn7ldbtryLBirn7LUa
         CqWxyl6KELeq3NZ3/1XWnKkZsozeY6Hr4pP3Yl0YTHKEbhuaI93WWnCBpaM9MFskB/lw
         7XMA==
X-Forwarded-Encrypted: i=1; AKwUvByavkLDTxuvPBKKYdV3sq5/KhhPRwO50OAc+XHpc3hqLcSmx/oZxtIGL6XTdPBVeURULIe+L5vw0rVI@vger.kernel.org
X-Gm-Message-State: APuU4Z/0dwJ+v60/XVtM8zFG36ZYHu6Lh+K0Uk7FoitaiBNwNEZEzEjB
	wNnzvL4Hc00+zIaJtlYZMJb/t8Uto7GgOprAkXibpdZzILWZS+f/dmGIWfJ4yqEdugmlrGdarNa
	vjgLZyf9TD4v4JDxM5SpGgkiLpfQ37SQ=
X-Gm-Gg: AYBFou3SBe4fM2+jeNE2Fzkpys8Tnk6AKZ03Q6uvej4ZKhBCCkc06y7TWxhv4JL167J
	ZcLAa2Tc8/HNx2sq0a//OmUbsm2hDIpDbEUGSwV3kqTaKtfga6mSZXbWva33mF2NKfA5ynrc9Vl
	lIBZuIFq1bpbco+BYXw7KwjK5R1nFlQiXX0rnjkz0P/BzDrCIST5fcxmcuQ8QzAvRzWE6v+ld3C
	ZSHwywZOfZjfOuw1+G/eEjLffkPtadl01gLphuDbKKZhje+5CagJNyEfnbccxnu3H+HxHNmGKkX
	HKZeTiIHnMuo0k+lX4a0lXbBt4uwsMge8btX56LQmLu8vT/uFLcirqHdoEuYB93rRSuOkLPePEt
	53LlsvV9BWVrTtzYLqklsYareXIEKv8ieouQ9foc1RqP3sMTi2ZqJOE0L+zYEAJRfcMuu3WC51Q
	ogN5sbVFkoM056aTwwetohDD3DPatqU0gy2Txj0oSvtFm9xVNMbZzVT0Aiug==
X-Received: by 2002:a05:600c:4e43:b0:49f:f099:6fb1 with SMTP id
 5b1f17b1804b1-4b6de0cd91dmr32855205e9.15.1793962343270; Fri, 06 Nov 2026
 02:52:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org> <20261105-mali-c55-renesas-dts-v6-6-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-6-7dff41bf7107@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 6 Nov 2026 10:51:57 +0000
X-Gm-Features: AclHuK84X0AV3nOTm5UaYtDdNo8XHTBLk32hG-FVymrE-EyctstaEQaOUyISrDM
Message-ID: <CA+V-a8t5BeTXN--GZUMWsoKkJ7PK8f-iFeFp+XXuKO9x2cc2fQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] media: mali-c55: Assert the ISP core reset last
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:02=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Asserting the ISP core reset before the register and AXI interface resets
> can leave the RZ/V2H ISP in a state where the first register access after
> the next power-on stalls the bus.
>
> Keep the bulk reset API and reorder the reset names so that hresetn and
> aresetn are asserted before vresetn. The bulk API asserts resets in array
> order and deasserts them in reverse order, so this also releases vresetn,
> aresetn and hresetn in that order.
>
> Suggested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/driver=
s/media/platform/arm/mali-c55/mali-c55-core.c
> index 241a625f7284..e37f87e36eab 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -70,10 +70,17 @@ static const char * const mali_c55_clk_names[MALI_C55=
_NUM_CLKS] =3D {
>         "hclk",
>  };
>
> +/*
> + * The reset bulk API asserts the resets in array order and deasserts th=
em in
> + * reverse order. The video core reset (vresetn) must be asserted last, =
after
> + * the register (hresetn) and AXI (aresetn) interface resets. Otherwise =
the
> + * ISP can be left in a state where the first register access after the =
next
> + * power-on stalls the bus.
> + */
>  static const char * const mali_c55_reset_names[MALI_C55_NUM_RESETS] =3D =
{
> -       "vresetn",
> -       "aresetn",
>         "hresetn",
> +       "aresetn",
> +       "vresetn",
>  };
>
>  /*
>
> --
> 2.56.0
>
>
