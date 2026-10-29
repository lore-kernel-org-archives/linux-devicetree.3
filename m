Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793300896;
	b=R01ZQ3JW+YZ0b2HcQfWMWL2RoQUBiamSxtAdJOd0rOPI3igTdjarMQuH37anoLpVglIY
	 1Y6L5Tx0p1KYmV9gqqZ4I1SeUDM0TF0oodgdKAgXfzzZatCw/9jaMrNYgFJ0tuIz9XOc0
	 M9Jd6SMc42ezVDNsljHBrUod6KklPSL2P25ieHhcm81jATEa0/2zgo+EDIRupbtygKvVv
	 5adX4YqZeEX6rZniEFFd8N2nZkbxwgeHvnxJ5lyCdHxKgNMTEd//l+v8lmL9CPuF6TQ4u
	 kTzu8WSG9bsgMPwuQ/de4ml6dxstl1kok9DgTi0wUtsZRozut0evEIBriP9mUnGot4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
	b=ZK5UUTh+GQsgV+CEQUIvNvDUqzRLMR4q9mbTtoA/VfDU7zXTRiHTtmCandhkJR5PhQJE
	 VXfvWopit3RXNUSW/ypeg59Otc+A4D1tlu87iDS83+oKWkGnfny/8pcHkQ25aZDlCenzh
	 NhFWGggqytho2F1ToS6pId+7Wj63h9xY9Vg2JiEuO/SC2iBxIX2KbQq8voh1qHoMmlIae
	 XqRJWGbzhjzeQCmhxDgpYWupfg3vSegyJ2corAprSXKFlOGCna5KUQjrr1d01SlGqWRQO
	 xuoEsX8VHPAxa0BWk5jXFYkY74bNVBAeUcHT4YwA6JqoQND57HhxjE0hk5eWM4VoCng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCAGxuYm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731B7606A32D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 19:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731B7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCAGxuYm
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eac01ff101so3751e0c.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 12:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793300895; cv=none;
        d=google.com; s=arc-20260327;
        b=mqHV1HWpgS9AZ7cTlnlGP9WCOmxYbbB7fEHkbA/R0tW3JkXqF1ZPrUVmrvEMRlNdWF
         06gjIDizUEG88ih50hwT4T62zod4nNGwV/qXkxFkrekEratfvBbCFZHWV9ajTIjynYmY
         HuK66w1D3jzYZRdDM/Oh6l/ECGTMT+3xxJ+dDcVnl3y1yuF8QWjUtJrSHE3X9MYN1+Vt
         fPTj7XLtvpTT3EjW9EzkvKhfmA9QbMotoM7pwTvXz8b4UD2+TIH3v4wtd2jfgiyuLrqI
         IK4iULA/DD+UpjfHiGQnFwnAybh8/GiuW2w2qEuaH8Lw+vm842gKwo+g+RRCXiCwWNW3
         rAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        fh=n1ithPpsBsKsAcDg+lXQWvznUpPaNO4sY2wlFyAPVlY=;
        b=aUyp0CCH0FxoTS243kdQzBHML9D9vtwXfnVLclvtPP58kUed4pcj2NOJTn/fn+cdQ/
         MzVaviJg2E5BQfvGg330Hm650LKFsAz+lDjhF+smeQIM+vQOAFlWaNpRRB9nwzhmK4Uf
         hkXjWWfvL/NlIhv9BzMS6pSzs+9QH3JqaUM3jJi90vRMIKixsHDG8mT3t2z42sPRDhRg
         r/FOUU8AL5L4Iu6qxvG6ThRe77gJ1cysmBzxCkN9fELEXwZqK3PD0pHw3cWsiIYtkuQY
         aen6GmZGS42vnGeT3kKnN2aitBYl5dVpBq7SDAA74vm3J+6N0jjbRaPSTRYkMoiHmw/h
         ePgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300895; x=1793905695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        b=yCAGxuYmwrHIgmNv9ZiFwfNSpYDff3cIORj47ZcLMJc1M/JfIUPfFYJ0hgfFLheU5y
         k8+jCl1HJd8pxaAifNyTOo3nW/vfq8JV7w7a+1aWKDmS8As2p32MovbjXtCnATsdC/3U
         jdVBmjOs4X/8Qf4Y3CkbE128NmtvbpR7JtzhUUMW+dSysSKqFmF7VD0vO99xtRuYqJdF
         Tun6zrf+HCH22iD6Y9s0suAei1XujF6WsjdUEXeC1zL2GExoYD9pEwxZKMmHMhMYGH+g
         xM3O0+QHW8dBcPGN6lVsU5YYNy7Qqqr/NHfULULcnU2gJ5W00w9HQ+konuJ3NjwDgqf7
         HCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300895; x=1793905695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        b=oaO74mPWhbBv27HTRA43YT/h52LbfxFYqcynmwIcqJraE4RvihZKl3hhs+PDwYHVHe
         2Qa4TD5cJPG+XcL268dIKNgKYUXivcz9WMnTPqcMUA85A0MveStyzEvr41KHzJHZIMEC
         8HSZREGJeQxuwH3kvaCbwvksOj+Fg5BePjcna2p024bm+62t+KAcVCMbhYgJceKW46m0
         RotxmYQzhjv+pHzAdXgR889M/qd1rfmxW8LCgUtyfp6mRY7P7o+C+opEAqrriny7NDsD
         xX6Kczx6mKMNo+AUOamlcds4mFnzBSYuFAdNPPwtUSfyYqt07MY8U2YffLStqa1sEqiN
         RWjg==
X-Forwarded-Encrypted: i=1; AKwUvBxf5S2MHlxoBNhSHlAZfUB5e3SVwSQrGwdO7nRlNY18px5JlDQCSSpDbuI9Aedu2PBcxBGpXcCDR0L9@vger.kernel.org
X-Gm-Message-State: AFq9FYLz+3ABuHdRhDaXefQTBafDBME18LK4LmNYQlX9JF1udseXqrKz
	6fPpjMgPU15h5H9JyW5avhXytslPBT4rULQp98rqxYBbh8yWPhHHIto7CfnIGtQ885WblX2DJpI
	auCUaMhtGQrNhoBwRF2lZP4nHEcfVYLM=
X-Gm-Gg: AYBFou1ZfOL0vn1vxLqwGX6eFKQPR+Y0aE3zPvM7DRmOv89yLtly5TKfR4OyT2p/W2Y
	WbV1ZluVGlFlmCpd++PDMKw54BFF8RtTeRH2CTkAQQbk/Kz4HP20Ul00QXHQYyBUYh5BjSgJRsR
	SQqljNFWMBsZasc7uaG3U8myXToc4xqGm6CK28CjPeEnEJYanR+yVvTQ9fKv/CMn52YghQJOjxc
	Utv1LJWjqeCV8zPBolzaN910xA5fKjZdJ7ndL58D+sWRTBtxXE9wB9+20eh/megTeFhHchw1bKF
	1pqG/1JVUoXtZRRfpbFO9s4ZyC8t9LxhPTh4LCpmVXQZpDOkxb/RYmkwllAbh0TYPh+O7TLSHhk
	JcKjbqSiU4BQdXOXwg1rKl2tAa5dWlHaKBiEDaC/03i4PbcAPvBsKx9u22QibBHFZNDP+9yZGcV
	K2e1mA7rsEDGf4guBHNozztWvWNl19664AoG2QgzGVYyv5mh89lN6t2tEz8q+VtZKVRy1ZJRrYe
	CfRwmWfklOqpFKFlW5KUfvxjOzbKA==
X-Received: by 2002:a05:6122:46a8:b0:5ce:ab22:1749 with SMTP id
 71dfb90a1353d-5ec6851cd7amr118633e0c.1.1793300895346; Thu, 29 Oct 2026
 12:08:15 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com> <auHW9nkDqZUXeHNZ@ashevche-desk.local>
In-Reply-To: <auHW9nkDqZUXeHNZ@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 13:08:03 -0600
X-Gm-Features: AclHuK-Rn80HNyPsHmS5HIf099B7rRnzpvWxOBqe3P7d4FosCUXTUKkW9AmBT7o
Message-ID: <CADvTj4o6N6sXk1YvYgMF6d5jyAGZCtyaZUe81ZP10qfhOPwd-g@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616 UART
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

On Wed, Oct 28, 2026 at 5:05=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 27, 2026 at 05:05:32PM -0600, James Hilliard wrote:
> > H616 has 256-byte transmit and receive FIFOs, but its optional DesignWa=
re
> > component parameter register reads as zero. Generic 16550 probing leave=
s
> > the port using the 16-byte FIFO configuration and its trigger-level tab=
le.
> >
> > Keep PORT_16550A and describe H616's fixed 256-byte FIFO depth in platf=
orm
> > data. Use common Allwinner setup helpers to configure the transmit load
> > and receive trigger table from that depth.
> >
> > Derive the receive thresholds from the documented 1-byte, quarter-full,
> > half-full and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 12=
8
> > and 254 bytes; the normal 16550A half-full FCR setting selects 128 byte=
s.
> >
> > Build the threshold table during setup and use the shared 8250 conversi=
on
> > helper to select the nearest lower threshold for sysfs writes.
> >
> > Serialize trigger changes with termios and hold a runtime PM reference
> > while programming FCR, preserving the FIFO contents. Propagate runtime
> > resume errors before changing either the FCR shadow or the hardware.
> >
> > Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
> > DesignWare termios path selects hardware CTS handling, so the capabilit=
y
> > must be present for the corresponding hardware control to be enabled.
> >
> > Select the fixed configuration through the platform setup callback.
> > H616 has debug-divisor and RS485 control registers at the offsets used =
to
> > detect DesignWare hardware RS485 and fractional-divisor support. Avoid
> > those probes and retain the BUSY-safe integer divisor hook and software
> > RS485 handling.
> >
> > Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled dur=
ing
> > termios changes. Its clock is a gate on the shared APB2 source, rather =
than
> > an independent baud-rate generator.
>
> ...
>
> > +     unsigned int fifo_size;
>
> This is should come from DT (based on the property or compatible),

On some Allwinner SoC's fifo size can come from the FIFO Clock
Control register[0].

>
> ...
>
> >       u8                      no_int_count;
> > +     u8                      rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
>
> Why do you need it here? Can it be provided via driver_data?
>
> ...
>
> > +/* The trigger is the masked, unshifted FCR receive trigger field. */
> > +static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, uns=
igned int trigger)
> > +{
> > +     switch (trigger) {
> > +     case UART_FCR_TRIGGER_1:
> > +             return 1;
> > +     case UART_FCR_TRIGGER_4:
> > +             return p->fifosize / 4;
> > +     case UART_FCR_TRIGGER_8:
> > +             return p->fifosize / 2;
> > +     default:
> > +             return p->fifosize - 2;
> > +     }
> > +}
>
> You don't need this, just provide a set of numbers directly.

In v5 I added FCC based fifo-size discovery for A523[0] which does
need to compute these values dynamically.

[0] https://lore.kernel.org/all/20261029-submit-h616-uart-fifo-v1-v5-7-53b4=
33aebbf8@gmail.com/

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
