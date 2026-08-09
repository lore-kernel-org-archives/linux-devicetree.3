Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD54333F58B
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 21:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786312056; cv=pass; b=t6q54Xs9+F6AOXj8WQrX3Qpe+uccBLCxU1nxABAjNGgw8GWhc6kciHM6dhv5F4CSvcVX/pGJuKKuKLYsoScPerymj890YvrFCQ4zeIA6Q746xFjduKNNCFuiN12A8XwabSnhcYznYZ8vpZ6/tZ2/2EqRHVbUHJrP5HVItLNGzQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786312056; c=relaxed/simple;
	bh=y1udmsBEzAQtkixw39R/oiQFVpMr+tk/0BM/vlqjjHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qe0Iyr0+jN5AuHHISwC24TSCmA3w2snSvycOLCxcoQ4myG7bkGiirVOVeak4mVNahlrYbC95AmHXxARaxnIKMXbm4veJEUrco/QLgk9XLdrdWgBL2eYBD5XF1xO/+BK3ZSFqXsnHoltnl4wKt3ugdSN1mkx1g6BO8M5oBedpmvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SptmK6J8; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SptmK6J8"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so1697712a12.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 14:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786312052; cv=none;
        d=google.com; s=arc-20260327;
        b=o0GEELHUAu5ib04gGUM3whmfPntHmwfychwommbU3xNuOGxmY90HKVv8aXXSzA1/lV
         25CIsbai5OSEA6Tk1BA6Iu7fM5E+9HOMEAejUH+uMIZhJlGGoqezQ6HSf3VM0wgLosqC
         ba/qIgIXxbOiYobqclZ3YQWJjuRGczNkhk/8onS6Po14erHVQ0fvsuw0WlkSHBez++OJ
         /ppS/paWdWRAr1DZmRwFI9qd5hKWihOtFj2Qw2oripuMilRxLrnuy8k2SmRP8DUwxh8A
         8hB/JmH+Kng/rywYIdjhWyPfM/aXTBnJiJtFT511Iy+WKjeLQlHfFIcbxWzwXKoIbfGs
         ICCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kFa6zcCkY2hKTR0O+eW7i6R9ggV2gSRqn9c14SMG6lw=;
        fh=JBhkAcxVPsguuk5c4FgUiaENVPBRfVhpRvvEHUOBKas=;
        b=g+BS0ZjNPjpa3Mmt7kExnlGTQIJVHK8ixWQgi5Q/qAadL1W0H7I6Ui+Iy18MDdSdzt
         53k9owKRNhL3aSSqYLSy7Ur5maOueoADnF6cJqZS/25O8XMGxHM6ME83yC9yTC6TNEEx
         5XiqKaOX7rKvQJczhRKJv/4IMJWyh/G7efwycuU4v/wk+2TkvGMWcY0uuMxnMzkZRkLE
         7oHcKB1p1R0VMFlgImHRMLQK1l1jShIMW8oxtferW1X2afRqWjuWcCcfxkXwl3TMbsLn
         4ncs0BHvbi/Kd8ena04rDE0T710RsffPsHqjko2rehvO+IaQzjnsowc469XrjnR48MoU
         AAKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786312052; x=1786916852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kFa6zcCkY2hKTR0O+eW7i6R9ggV2gSRqn9c14SMG6lw=;
        b=SptmK6J80H4u0YjRuUn+UWrZLYdNILBlIyLTGcH54BP5NF7eVpLbZ7tLdNk+xSuwe6
         fZ+rw2oH+YEUEZv6Cslbor1usE4IYugU2i0itFAggZ+proV9ZsPYcwnNSXIhRGAm39+N
         45WZMicJKeBCKD2aZy1C3sCh6j2VK3+mrWIeHgCAkIgz5w9nYLh8hXQ2wWi0Kf33S/TW
         Aj/5SWFFz0gW8TeEW6dnH6mT7foMeTdiFT1EyQKHE7RuA3WB24WU5uP3nlNFUkLxbNdl
         tf/6rc5ZC8JZdMGgTqDY09/rlksTBKtxVt3MBVAdLEIkA8ZoeUbZDoLYZKoJtg/+USTi
         mYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786312052; x=1786916852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFa6zcCkY2hKTR0O+eW7i6R9ggV2gSRqn9c14SMG6lw=;
        b=tHfKe4GWPQubUVK7ixhdyBk46aYbAvcGIOaDTgthbmteVz7JjIVWbNJQfgQi4b/63F
         SaZEcWUyO36Fyic3tXsvA7zLrTvMfTC53RQEigTEJoZfDUgoIsWaGysH0ewrMJcatRfj
         uVMfK/I30hyMRuu2J3XQ81QOXOK3kLqdGOFpchYOSrIKoZE36zivKugkKfuniYDSwCRE
         kN0/tvEm7vT9Il7m+RFhPE8NWp38vaVAWgFu/8L3P8T0rO7H9MJIdJ4thvaYfvzl/N59
         yCRYSuGQQe+9lSsW1v02sNP44lq4lWAQ3Ok7FT6ECaBFx2qQTq8OUEvsyLEZwt3HU76u
         oLJA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5p3jKGIMwHUXU2d3DfRDkJ4yLZiN4ylG8FcKRqbvB011z74SJLnuqw9Oe1kap5pE7BX3Lr8i3Ms7b@vger.kernel.org
X-Gm-Message-State: AOJu0YysumhYyxclHq0vDLPZfd10TPIcWFfk/z3jXKPdFXB8JXf0yGwp
	kNL+VUm7z9NXCogjnG8+0cR2O3ZaX1oAWOd1pykwmX5r805dsNRt0sNKAsPo61lhOjYbJ9qrEGj
	HgkjeTk99rhjFIzLdj2J1TaBVxz3qPy8=
X-Gm-Gg: AR+sD13HIBHW/RhJ9zhpAHmXcHjDj4m9MI2IYvbSLtYqKSUstm95FIQ9ve4ZUf2H1lx
	t1txmXoffTYMUeKmAX4gmEpdR1gaa95jAyBp0vj1abzgfbuH6nMZ0Dhoa3Q42GHadlf9q8mUVsi
	IWeF3z3VoLazjgdU3G8MTanQUjGevRcKJXM2mRpgaKxt159deOozJUI4kh2zNk4cUTVy73bfMLy
	oyE1LcWvL0gm/dYoyNz3LFXQTVVba2smeQx3xvoNIRd1ShFhv5MLyhD0AYY/0BvJqZ1/P15IoTl
	kjMU+r4nqRtFFLMBJLuq3fau5MZMAgkttFegKGqEoNVE
X-Received: by 2002:a05:6402:3215:b0:6a0:ffb0:273b with SMTP id
 4fb4d7f45d1cf-6a14f00169fmr20000239a12.0.1786312052321; Sun, 09 Aug 2026
 14:47:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804225617.264861-1-maximpedraza@gmail.com>
 <20260804225617.264861-3-maximpedraza@gmail.com> <anb6ejVQMPqD7G3r@carbonx1>
In-Reply-To: <anb6ejVQMPqD7G3r@carbonx1>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Mon, 10 Aug 2026 01:47:16 +0200
X-Gm-Features: AUfX_mzKCodxQvroNt5kk61f8zcTHiHxpI_vZk2XUB7pEBxAz8egjMYfztdkV_Y
Message-ID: <CAEUXW=GPXiGaShnDp4X8UrK+2_cgd2NS3XPZyJCP4i83wOdGEw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] video: logo: allow the boot logo to come from the
 device tree
To: Helge Deller <deller@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El s=C3=A1b, 8 ago 2026 a las 11:44, Helge Deller (<deller@kernel.org>) esc=
ribi=C3=B3:
> This patch feels "stamped in" into the existing code.
> I do understand that it is by itself clean, but maybe merging it
> better with the existing code makes sense.

You were right. The placement is now a patch of its own at the front of the
series, with no device tree in it:

  struct fb_logo_placement {
s32 x, y; /* -1 centres on that axis */
s32 offset_x, offset_y;
  };

fb_center_logo is exactly {-1, -1}, so it stops being a second path, and th=
e
device tree patch only fills the same structure in.

It also turned up a bug. fb_prepare_logo() and fb_show_logo_line() each ope=
n
coded the same decision, and my patch had made them disagree: the reservati=
on
took the larger of the console position and the device tree one, the drawin=
g
took only the device tree one. Both call one function now.

> why so many fb_logo_dt_read() calls?

Down to one, in fb_prepare_logo(). fb_show_logo() is only reached through
logo_shown =3D=3D FBCON_LOGO_DRAW, which fbcon_prepare_logo() sets.

> I usually prefer if people use the IS_ENABLED(CONFIG_XXX) macro instead
> and put it at specific entry places

Done in both files, following your example.

Checked with CONFIG_OF=3Dn on x86_64: neither object is left with an unreso=
lved
of_* symbol, and the structure is dropped from .bss. That last part needed =
a
second IS_ENABLED() in an accessor that read it unguarded, or the compiler
could not prove the read dead. Also built a Cell config, where SPU_BASE mak=
es
CONFIG_FB_LOGO_EXTRA real, to a linked vmlinux.

logo.c was the other file with an #ifdef around it. The rest of the series =
is
the binding, the reserved memory parsing and the host tool, none of it
conditional, so there was nothing else to convert.

One thing the reread turned up: fb_logo_axis() added a coordinate and an
offset, both straight from the device tree, in int, and the binding bounded
neither. A large pair wrapped instead of landing against an edge. It is don=
e
in 64 bits now and both properties are bounded.

The series needs this, or dtbs_check rejects the node wherever it appears:

  https://github.com/devicetree-org/dt-schema/pull/204

Max
