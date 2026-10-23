Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768376;
	b=qOW/YS4BNwVBmiAjIJn0SZkqCr8vIFAloWXIKSDvwEp3AjKhEDuuezQ4eBkyfpQVbx55
	 s997Mrzjd8XtaDkVlyePCZ9QoBHn0gmKtou2yQ1wkhCTPc4NLcPZqjyDWh2jroUXgHVxN
	 GJrWNETVVE3vFBY14ybquYk8dfRGxy3obvXvTDECcRsK2IgZ1z8ddyv9p1Xy8MK+a9jYK
	 MAlK2mK0LCpzimKni+hH/p8a1dr/lnkDua2KsJ4TOZJO/FfkZ0J0cfzymaEFxNxvVj4vW
	 MW8ul/q+X78cYyaGQHjpMg5pAPBdlQtwpXgK12yIflhzLJ+G0capZaK+pMCMh7z6VEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
	b=aW679mvZC5txGMNcUFyCjBHdQM0sN8vKLCzys1itlcz2eSoVVNBIVX50puuA1R0FHc7Q
	 GG/t+rvcwfshjkbCgQiSWJ2dgVVBx8furmqsGqqU7LR8dZRbXHvJZldIL+TH0+LOsEN66
	 3RYpAqy/V4rdJUh/L7YOd7yPRlMu+tU5ZdIVniIjbXZZyUGWOG+tTqfd+kol2ezzhK7QX
	 DPS8HMb+eqkbGYTYq5OLmfHE1OjYK8V2Yl27+BWQJpRAsTzjFpkHr/NFWjLGykTnUNgpO
	 5h12MOeJ/sCmK2hlDCXQqwWUc7p5qQV8Afpjfd/FnAYZk2/OjiSGPSP+OcElq8g/yIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWGG0AQy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E37606A321
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E37606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWGG0AQy
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4322d310e7so152629766b.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768374; cv=none;
        d=google.com; s=arc-20260327;
        b=Pv1OjSzkbtbAwaAbYNdNlawzr5fZRhhfzDf0VGkcu1MXvUBy+npgNCKg76ZlxAB4b5
         sk38srZMLr46j8AgLwf0XpsLLvcc5JFqbe4PzxzynIArQJXIjGzvyaVHwfnTAI9UZPeb
         L9RQfLSXGWQWpP+6VyVNe+xD05/BxSFLz2Qnfx3hTy45L2ke+Ajo1ST3az+j4UBL68hK
         g2HU888yP97Ycrp5Ox/NiCbA30NvYQtMnnojNoC4jExgKQcXpQ07sn2cqtkc/TWe/wbV
         kTs7h25uGr7yjAdcnPCoKZ6UEdsg+GqcIMgQnzEzIO8AnZWiG0EVUU7YDLaQkpYD/S+b
         n5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        fh=corcrP1H4gKk9N/bONEpP4qitDEDE8aoRQ9rvBh8/EU=;
        b=nVgjimysGQrfhmZ4zgG+g81UrMHzMOVBCtQAChYkj/nCMMLxok0BRe3i4xf4iYiSfa
         6JDqeoIuDPVW90fifty5TlGBDZnSPVrRdO5r3SaI0tMNB/QWR373te4OeEDAEozDC8CE
         OpUDx923DV1bWJe+ZUW4YH6/tP984Y9GryJB1jaVYAMSAzn3PEbltXlq+p+VfpgOX/9D
         NXl4Pwm2FJHu10WBxmD4RZHdGq1Ebqny7z9KeDNnKN9h1cdArVVhPXoo+OkHoyBAOnRo
         fC0nLh9I7wN6XMNL2/ylgBu4xyl7exqPf4IY+rJXakMhDwrg7F/Smf4/DsPriOcRhZCP
         spfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768374; x=1793373174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        b=EWGG0AQy2mGqncgCdvHiz4YaQrECiIJLSYoSBJ5NHSMunVaPrfVvlknF0DuKclSyUu
         qCI+SC31yn2BoepSszw36L8zEOeJf3mj1C+D4RWWBxJtXYB2LTHf6W93JTSrrS2tbVzs
         /SQReJc0ZT5f5ckNvF9/2aGpl92C17PlbkNdMVJA5oXvMmF+vXB88XDBSUj9y7ltGHUP
         BTYzibNxNnm+toKAgpaXdQcTZofbUnRLAei86WuXqw/qCERy4xLDn/4N2yb15w5YuWpR
         tTItHoUSIzfZpdy67qzB/9sXgsSl6pFGsuiTQZ/aoJmzMu5gZzNPmNFlS4+8RELQzJB4
         YcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768374; x=1793373174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        b=Gy/9r3grqpPTKwt+NY+ilBcQunGIVXwJB+CRehAnHjobQ4F3xWQ97lut54Af6QshXa
         DF9DnZkcKYqbhfyNQfTEXteINmSmzRp9M0fzOggPpDyaM2zOIeDTd3TKEL0D3goEPQmt
         lf/s6NOm/muW/y+kBn9MA5j8RmJdBNrX8uaLuo/tcsQ7yaCmCesEhzxWcON6Sf/wB+IZ
         oDmZ6WAX27Vco6Sghhu21gmbjygKzmnQPP2TRiPOJAfqQ+vefjPMJ8gvtT4TFZB0p1Yx
         ofL0XGwGhtA8wf77JLTHtXIwwDqiBM4UAZz/wtHqO8JeGRdY2Na8TWJUfp2ARxIXdjY6
         Wm7Q==
X-Forwarded-Encrypted: i=1; AKwUvBywiECv2KuHY/g/oPJ0x4ZMF+rxSQgEXb2Ak80//oQN9sIas5EM6j8WKFy7CnW4EFQDtN+2+x79ePTm@vger.kernel.org
X-Gm-Message-State: AFq9FYIRiNx//9Bmu681rgDDhtSunK1CTqPlWACUjpD2+Mp2KAajgVZr
	1LrEcKGVwgu7jCgWRHZs96/eTqJ/LHA+rt5eS64Zmi7S5tpiamHx7hGI3TMJ9xWwHH9KNM5mJry
	vW21KV9ZIEeLD+IVnakhGcsFeR9xAX7E=
X-Gm-Gg: AYBFou3o7bd7ZWWzHbPTeIHyCTcwpWcf2Y0y70u0+QSrFwOmme2j3MRqstbTLFlG7QZ
	cBXioHwx30URsvrzVr4bL2uMM76SJqrUgdSJ3YGWkPMHLgIxU3v5kcKcib9HbRTSxtE1JifBLRB
	szqSLypK3E3IeOTntZTDT0vGcQipW98TbS/xhV6rbGCXIZY67n35igGsoTERlt4yBYFLSAqkzIU
	eJQd1/YeCr2P0kesZ6/u0OmnJAzxM3UlHK/lBWtcj8FEUlvX4gbInDWTkSnUm+mPYI/MKBiLlas
	PH42Ddk8S1Tnws6ayski06B5kioCBN4hgc+t6D/wwHasNNTuctf1Hm6sZ3JeLzGBpx4bOTSclIJ
	gvqOSU5nzrGoZ313iCc6JNU4luYazW1sbzs5HV6TeHTSA1WBK+Mw9sBzlX57reuxNnFP8Xma7Qu
	n4/sqvJ6pTkoHVgKsmwb58H9llBm05Dq+zl1CG60tc3d9cOfa3bWGnlEIwo34u0+GsAGfk9ai3q
	G+5Luwji6NYEC/7mU8D4sbIsCiz9Q==
X-Received: by 2002:a17:907:3e12:b0:c29:22cf:b0f5 with SMTP id
 a640c23a62f3a-c46a922dee5mr411130066b.33.1792768373956; Fri, 23 Oct 2026
 08:12:53 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com> <atseYvQUYvpMFEIM@ashevche-desk.local>
In-Reply-To: <atseYvQUYvpMFEIM@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 09:12:40 -0600
X-Gm-Features: AclHuK8N0aoS8N5_iVP1byTsJlqPWe2cGv2Z_GYIPJWKyo5TvqjUOKI8du6YHIo
Message-ID: <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
> > H616 has 256-byte transmit and receive FIFOs, but its optional DesignWa=
re
> > component parameter register reads as zero. Generic 16550 probing leave=
s
> > the port using the 16-byte FIFO configuration and its trigger-level tab=
le.
> > DMA attachment also depends on a FIFO size being available during probe=
,
> > so these ports do not reach the existing 8250 DMA path.
> >
> > Use a fixed port configuration for the H616 compatible, with a 256-byte
> > transmit load and the documented receive thresholds of 1, 64, 128 and 2=
54
> > bytes. Select the quarter-full receive trigger by default.
> >
> > Skip optional-register probing for this fixed configuration. H616 has
> > debug-divisor and RS485 control registers at the offsets used to detect
> > DesignWare hardware RS485 and fractional-divisor support. Probing these
> > offsets writes unrelated registers and can select incompatible callback=
s.
> > Keep the BUSY-safe integer divisor hook and software RS485 handling.
> >
> > Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled dur=
ing
> > termios changes. Its clock is a gate on the shared APB2 source, rather =
than
> > an independent baud-rate generator.
> >
> > Attach DMA from the fixed configuration before registering the port. Th=
e
> > 8250 core installs its FIFO defaults during registration, after the pro=
be's
> > FIFO-size test. Configure single-byte RX and TX bursts because the
> > peripheral request can correspond to just one character. The existing
> > startup path requests the firmware-described channels and falls back to
> > PIO when they are unavailable or the port is a kernel console.
>
> ...
>
> >       /* Internal 8250 only */
> >       UART_PORT_AIROHA                =3D 124,
> >       UART_PORT_AIROHA_HS             =3D 125,
> > +     UART_PORT_DW_APB_256    =3D 126,
>
> Why? Besides the poorly chosen name, what prevents us from modifying the
> corresponding parameters at probe time by leaving the one of the existing
> types?

The new type was primarily a way to reuse the core's FIFO configuration
table, including the RX trigger mapping. H616 uses thresholds of 1, 64,
128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to 1, 4, 8
and 14 bytes. Overriding only fifosize and tx_loadsz would leave
rx_trig_bytes reporting and selecting the wrong thresholds.

The core already has get_rxtrig/set_rxtrig callbacks, though. I'll rework
this to retain PORT_16550A, supply the H616 FIFO parameters during setup,
and use those callbacks for the correct trigger mapping.

>
> ...
>
> >  struct dw8250_platform_data {
> >       u8 usr_reg;
> >       u32 cpr_value;
> > +     /* Use a fixed configuration instead of probing optional register=
s. */
> > +     unsigned int type;
> > +     unsigned int dma_maxburst;
>
> This sounds like a hack.  Why do we need type here? The address of platfo=
rm
> data is enough, no?

The type member selected the new table entry and also identified the
fixed-configuration path. The matched platform-data pointer can select
the H616 setup directly, including bypassing the incompatible optional
register probes. I'll remove the type member and use that instead.

>
> >       unsigned int quirks;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
