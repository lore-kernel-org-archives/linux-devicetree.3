Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794060394;
	b=zgAzz+aKqqw6Psq6jCmJD1qAIvbbiv7Ej9oPHiXDJD2QY9C1Q0TR7u1JXGfKiyh3pUNA
	 Ojm22a0lO3tGqoEnwdEL2b3gonDuPk4FDhFypZp3HjnwL0akYk2abVBImP9Yg5Vu/Lotw
	 1ZPeO93dhkkGXINC/0ShhdBU7e96vh6piS3seZWZ3mXXbHFrWhh/gVKr8Va/XS6bGHpiT
	 td2NvgpsxH/mpfOOOLpiBSGB32PmhEo8dnoc7vWq0tVhmOMX6Iskdahx5aEmSaf4zSKcr
	 aC5TJv1jFwfF/00vUkL3brtf04O0mM1P4LaawTnfMKPHTQ0GPmNPmQ43QpeG9kGDYPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
	b=gmamhlD4Apa+G1rHdEpS7tr8TSbsbj9blNhs6r+itQKvXsH0daot8e/iJAJxXl3FAxBP
	 Cm2gJ93Vw76rU+4Ocn5zu4SD9aH4QcL1A/Fe+BVMpQGbdmPp6AogZ6VxeU042VAsCzqyE
	 fViGaGCtthaEQ6WanHuo8d2MPTSMjHdidS8Bqa2yQ8SDvnrafgQFm0/Zf5wrU8j+T5B1x
	 vVxaPSYNZieUCV0P796ooTWlj62UX9/bkvKkngAWumv8yIHm45tqofLH8yor4P1P5OHqX
	 3ITMghN+DCh8tOZ6WP61zaCIFua8SFYSQtWv7b+JKmpGyEOEtNY+Hy8Q+EEaIDnfveQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDBlyIAS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA497606A33F
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 14:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA497606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDBlyIAS
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b1a705b88aso1023397b3a.2
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 06:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794060393; cv=none;
        d=google.com; s=arc-20260327;
        b=b4ocKwSU382zwXSix9xr5q7M3DX9stfOGKiD+hxFAf8v6qZ/g63JNNvP9u0W/VfgFg
         lIrqeLKK5/bqVYYZ44DjMEMb7a2vCCTNTrbf2KaZSpV+w5tglKMRsqT4VpVJnbAjmny9
         RKQ3ZfA4MK1BXVAq94JQUy7FNYYcdy3oetCWu3YHLzOeDqBlItHGj8RiR1QbDI4OcF0p
         xU3MPZP4ttJYQtJeU8APvNr7+8yjVurXm+kJVxGkk5lTJ/iGjwoNMDq0AdZnKVIfQtiJ
         hH7i0+M2IZMPcUU1pARfI2JlfYVhzlMnW3eFCEQYrrE+zSDfDjpg/M43wdTJeTKDrJNR
         4VjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        fh=SBtWW0SrN+pLf0vGXouQz6rNAo5FZfAV2T46t1i8kY0=;
        b=s0r0ec60BR6bvWsKZlyvhlKaaE6mEoCIoYu7DiDxbPghiE8/P9OVo6KX0EQrn14mXR
         VeocBlFIGd+KiI3XytWSmqFH2n4a2PGad68mN6IhEYfSih3aWu/N1taGPikTfDX8sS4Q
         BtMBvPkVGVWYvITVVERbT8klGiyTsVxTiNWX/zsmbd9Z3krxnepe97lmDwEulRwyChV8
         os4wA6BsXp2sKd7yseVsBISRISmg7hRcATwS9yDmuLROXjAF//Bz3BxmEjcH+vum8CdF
         seSe2Oo2su6RnSUaGqoknhgdBFN0F080C+ro0rL9AJe8ohzmsTWTgt8F+a/zbxNMhtwp
         XK9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060393; x=1794665193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        b=dDBlyIASGe87airtRsC6OYAtSLt8d6JrbobgkmqzvHZG4f9MUAgKofmlBTqz06bmf7
         X6/cLnOfY0szRdLNS3X2edK4IKxHbjdDSXYPSt31ow1YyWXi1Kqjjm0QF8nHW2t4qXvA
         0NYnlBfL3p280jC12DBHa5hRcP3rn5qi3RG7leKLPOtEEwGOwBz4i3puzoxLu0A/ERDn
         tEb/Fe4tigaNJLz1eYJOyd+QMI2kRSEuRujtP7juCjFLv+Kx9QXavedEeGOPrXGBfMZd
         CXpWZX3fCI3edsCjV2z66r0g7h11SLsxjerD+lVx8K9D+fefPaf9swx/sLCRgFYnFBR9
         wFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060393; x=1794665193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        b=tTLoOmuAvfxRXiaMa/mSvmVPz7WF7TgKPKIPbHn/8yc0X+oOetlB4nFKZJXtvj+zux
         U+/qC5VUwZP/P/Hzi73SEVOrsTzIZwpJaiQXWa94tHA7lIxbwyffM/DmRdZdIZANoJAw
         cuDIxzGEyfL70yVvW2J85hUjfLo8lm4qcYdWb1h/9UL1sjy2yBklRHjyHuy1oWT9rQlW
         +ZHAwOnvXj1eRouZg/y/G48+Ao5diTlEQFmXe7h+p8rGddaxQ65PrFgWM0AeESuQfTWy
         HJjtwkHk0jcuTYdwDdkZPC3if9cZ+tXShU9ZS1KV+bh5uboMhxkaXMhYaIouhwZPAGF+
         L+0A==
X-Forwarded-Encrypted: i=1; AL+hErEnfdN0Ystxbu6K7H5fKFCOvopmUdsAJkjZepH3NT5fZezKM/kcHyNQI1+bK/Kswx49QEflphcE/dgI@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q8J6wvU5/yWuQyBmVJQi1RXXTSQXsG0p/939NG0IDVDs5N4GU
	nMNo40iAE6+VFFL0oeaPIM+o8PTTd2+4etZ/cp/IUZFNUuZedDJW+gcBL5vT3xcG70RseH3DZkD
	lewOZSf2DWBApvaFFPVTdD+j3k3IfyMw=
X-Gm-Gg: AYBFou0Rv5FjnW9bfFbYMmm5eG9ktBhcSaKkUMUhdEb1zIYCtEQzeMJMdGtKKyQw7uB
	4hXk0uXV8cr6A7hOuE0QpCgdrSSk2dU6AmLsSh4KjuRqmvGID6Dg6OZ5BnvP1oQzEQVa/c3WD0Z
	UgSCdtuddHOi2LN9KoK6bZqg750oITmPjiS7jpl9I4P6yEeCJOvb7DKIYZrSOFgfwQlpvg0IISJ
	boL9Cu6OnO4L/Ymrkl4HOz1RV7CWYRVzrBQyjT0+D0KNJb4DC7Z7aRpFlmO4UI3+uly4o+NfE95
	Qnn91dfhd88xsCP5fTodFEJI80qt8kY2MAV2XZYz5ujB1smn8K2dW6wB2kgA+uN9NuIdBTmj5hy
	mh2ChQ/G18zrTvwL8h3coZ8xNz71i7eEiH9qWhJ4h1leKuwp65VXGVivJnLybMTU+CfpxCVVrZ5
	48ToosYdN+RLXByyB3fONykjkJagjV2qsk3CjaJLJWMW5IAx0QYyRf7x4IdddPjwWYGGUOM+XU3
	v1EUhP8a/eCQd3HIJ92Tp+Ju3T/SVxu/nhmxMpRqT/1nO0Ld0jC+P4H3OVOHw==
X-Received: by 2002:a05:6a00:13a4:b0:8a0:21b2:7c7d with SMTP id
 d2e1a72fcca58-8b37525709bmr5141902b3a.0.1794060392907; Sat, 07 Nov 2026
 06:06:32 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org> <cover.1793882260.git.alx@kernel.org>
 <qwpovcqznx6eltou4inmj3v62qhh6ouvihqnze7bobnd7lmcbw@rcri4e623icb>
 <auyOkL1Vb1iKicS9@devuan> <auyV47xUCr1EJ7A3@ashevche-desk.local> <alpine.DEB.2.21.2611070239050.17804@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2611070239050.17804@angie.orcam.me.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 16:05:54 +0200
X-Gm-Features: AclHuK-WBq_EIF1I_SsYN7csCkMj3s3jbsrjUQ08xBHpkztbklIxJpPZrjAee2s
Message-ID: <CAHp75VcVT2kQO+URZbrH_3-A=4DMZU1KfcQsjDf6bNdtjf=t+w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add strprefix() and fix a bug with it
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Alejandro Colomar <alx+linux-hardening@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alejandro Colomar <alx@kernel.org>, linux-hardening@vger.kernel.org, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 4:42=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me.uk=
> wrote:
> On Thu, 5 Nov 2026, Andy Shevchenko wrote:
>
> > > But yeah, I can send them as separate threads, if that's the preferen=
ce
> > > here.
> >
> > Yes, in Linux kernel majority of the maintainers (a bit of speculation,
> > I haven't counted, but it feels like this to me) do want separate threa=
ds.
>
>  Cf. Documentation/process/submitting-patches.rst, section "Explicit
> In-Reply-To headers".

Even better! Thanks, Maciej, for the pointer!

--=20
With Best Regards,
Andy Shevchenko
