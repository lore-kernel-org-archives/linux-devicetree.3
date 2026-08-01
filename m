Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2624621ABD7
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 22:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785621733; cv=pass; b=BrbmBcIlw8j4INx48rRvrJ6WwonPr6xoZe6UF/b5tneTUHliGT/v4Y4tIoQrzZRglroxNuDcnj5RZm6QwsgHxTvVBa2XEW3r3ig+WinOJpdHKLRRIjKu0CayRxBK6kDZtbAqMiDbDHkcMm9OayuVr6MxQH3SGq2kLugSWaa2eQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785621733; c=relaxed/simple;
	bh=mRPnZZvS2qFMF4MYzT26qlGn6HblvmPRKe4fqm9r0Zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXJNteskoUN8icarShUKlEHzbmdIPSogGKqFhNBX/FhZtCn3DKxw4vyrnjp0lMzZS06GBAZSnD6bexeP8iC1BO92pDI9k3MQ5OXdvqN6KqBBv4YtmJ8ohjCs41teynammVrppoQvtC6FconNSj9IXCvHEpcwE3Q7Ap+1ogY/4k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azhtwLQT; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azhtwLQT"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so3295353a12.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 15:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785621730; cv=none;
        d=google.com; s=arc-20260327;
        b=pLShuP7TNZrzzwTjKEASpa8ijDEXEJcTdGgDFQo28k8vBHMxXg/TOBqNdjxVogaGtz
         1q8nofkCBACtbRMBwUxiGbI14REev5KTvZ8irVEunLqV12O4pSrhjw7f7hNPQam+m9BK
         SAReu2w3tprVuAJbsp4A/caDmaWsa69aLZTX+W4vDYN2rWiogYNob7uiJ/3k6gO1WVkt
         b4KEzxxBYlsU8ST8exPtLVHQXli6/CRoMQSZD9tFhc9w6pKaR3AQCJZi00HYzMRwSFLR
         PRT8BZL/u7QG9uf253U7XURD6BizzAKR640aVdq9wMIuuKIQUVzeoheiZd/GEVlYeLyr
         Nb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mRPnZZvS2qFMF4MYzT26qlGn6HblvmPRKe4fqm9r0Zk=;
        fh=Yr04Fxnb9r2O+Z1WUKmIRI15H/QKDizffuv/nP6tCQY=;
        b=Pwc8Ajo5qYQw40qK2QswRirsYNzrpNSe00NfH5QiMMd9Xn7puSEzQg3gEm4l8bv/yY
         k5+fScTUJ9esq6m4bwExVCO312ipqROaDe1DROs67lM+BnEMMzA8jnFFwM3/5YtOc11m
         /KXCW/M51M2B0qk7fIO/EgPAZgRRCYXqx/uf5Qk+u103eL5b5T1YyEfrR3fZfXVN6Iu5
         d1+2CuQ2fsTZ67BHNV+1D8JGDdjXbfMc4EC1SqlwMutV5mf910lbOGPrQqwj/ndsipq+
         iMF2rv4GtvpMdmtM3HEo36rmMJAh7fHcgzRlA6gkxv/RPYIpuOJ5fnunfKv6VWdSEFBh
         ljoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785621730; x=1786226530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mRPnZZvS2qFMF4MYzT26qlGn6HblvmPRKe4fqm9r0Zk=;
        b=azhtwLQTMEO5+BlV41w1gHvonWDe1ABeivKg697/1yilFA592LJRW8gEUCc2Kpi/oZ
         RsirJmHqMGTlRddLiKftG1cyXojtQgHWdt7W9naAujN71T4UdOy+KiAUEtbXdZpwvUON
         2qgYWkDmUGhHV1DTbciIEPDNWmIzEE6W195SRY3UwO6d/By/6zUd3ib8Iru3W3cXBDNi
         d/2dfTIYcVvqtU2X3PtTtzemRA3D/fPvJ/EUTOLAyb9rnUmc1ad8lEWdi07FoV5fCkuZ
         pmLR2V4+ZuYlu6tDLr0drITrS9t8ffy41peTCw+SctGOrxXUVCKII/v7oLM2ffurB+L7
         lCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785621730; x=1786226530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRPnZZvS2qFMF4MYzT26qlGn6HblvmPRKe4fqm9r0Zk=;
        b=h6GFPo7J+71bxWf2L4Rv6LMgAgioncXfPW26DMFmxWwi8Q6RHhWyeePcrTNchvZ8Cd
         M8tpm8YkPr4tywplmpfTAPiaCFV/Rz/9mTevNdQh5JgpcpiDUU926gsVlz8F9wYzXrbh
         080A/g70Y6vbpeBCALk6bSB5Jru1jJtuvKNe/GQVRwRY08HdkGcBueJ+Fps2a/AYQswi
         kWM1cYiul8vm1GrntedUmoXyMuv4cyJRxhSt865SxtdPxBAEiXRtmJGLCc8Cft4ox/ji
         qra2QqqWAErsPw0E+wMAvZqK4u1KlRtkDgAnTWUnm4M9ESFVrtB2ZDCJmCsSX6epyj8R
         VaSg==
X-Forwarded-Encrypted: i=1; AHgh+RrKbZOs9OhebhCdUYWv3OTXAu7fcinQmuJL+f35DgAYRZmKEpLG8RSdnnJJEWyXjU+T5NvQCssIVInt@vger.kernel.org
X-Gm-Message-State: AOJu0YwCJmwLhW3dUNlzfxGdtIp3AxSb9EQlrslC2HMS7+k3M4KalVbo
	4u0oAYrhGXklBxz10XULa2kUVfV0+i02sBO7i3txfugA8cj4u+NxHi3nvYJ9bMz1r/JPZLSoUEo
	SgjYDBV7PmrYVCPrkIgSXDDBV+mDSIaA=
X-Gm-Gg: AR+sD131xnR4/33jq8hTIrlPBENijXJGrxEuHocwspO0LFUcTUgKb7jn1NrkC2JIQu+
	Fii6H2u+yTdNexSK3LLhIjCsuI0LN1u1c/gXj1v+VAP1k6pq5FWeWEeKqwNO+X8MOkdzK3t9kW/
	7JKenXCw1XWg92xKElLUhmqPClbpL+jAM37ljJJHdFNt7XwmU3bmFw+dr5WzirWcO0rz9u7R7ca
	35W0MjGbY4vYsErpRKU9RL6Oj6dVGZurMiPbEmtDuSCvaJSc+rXELmKtQ8GnHWx0fevn95o8WLY
	D3JHgiOm1N2OPj0T9LGsxJtXBXrcNDy33vnJvIE6OOs=
X-Received: by 2002:a05:6402:a0c5:b0:6a0:a560:f6d with SMTP id
 4fb4d7f45d1cf-6a0a7c5ef88mr3046152a12.6.1785621730054; Sat, 01 Aug 2026
 15:02:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731215043.30392-1-maximpedraza@gmail.com>
 <am2mvECnCcO9IxuI@monoceros> <0219df57-06e3-4776-afb1-d167cad2e795@gmx.de>
In-Reply-To: <0219df57-06e3-4776-afb1-d167cad2e795@gmx.de>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Sun, 2 Aug 2026 00:01:58 +0200
X-Gm-Features: AUfX_mwycUF1fY8pRphTmL8dbgwqxDow6kFrZA_PElLtzrxC-GpVrweyge4UTDw
Message-ID: <CAEUXW=GUY+x1A72n99i1Cpgy03jTYv3FPAX5nY3DCHqmeq9YVg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Boot logo supplied by the device tree
To: Helge Deller <deller@gmx.de>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Uwe Kleine-K=C3=B6nig wrote:
> My 0.02=E2=82=AC: Usually you want to use the display using drm and not f=
b once
> the machine is fully booted. If you're using fb during boot to display a
> logo, it's hardly possible to switch to drm later in the boot process
> without flicker.
>
> So my recommendation for your usecase is to not use the kernel boot logo
> stuff, but something like https://github.com/pengutronix/platsch.

Thanks for the pointer, I did not know platsch and it looks like a good
fit for the problem it solves. It does not solve mine, though, and I
think the reason is worth spelling out, because it is not about how the
image gets drawn but about when.

These are industrial units, and the requirement is time to first pixel
after power is applied. If the panel stays dark for more than a moment
the unit reads as dead, and that is a support call. Anything running in
userspace is by construction later than the kernel: it needs the kernel
booted, the rootfs mounted and init far enough along to exec it. I can
measure the exact difference on our hardware if that is useful for the
discussion.

We do already paint a BMP from U-Boot, which is as early as we can
possibly be. The problem is the gap that follows: once the display
driver probes, the panel is cleared, and nothing puts anything back
until userspace is running. Moving the logo further out into userspace
widens that gap rather than closing it. The kernel boot logo is what
fills it, and that is the whole reason this series exists.

For completeness, since it is the usual answer to the U-Boot handover
problem: a simple-framebuffer node plus simpledrm does keep the
bootloader image on screen. It moves the gap rather than removing it,
though, because the real driver still has to take over at some point,
and it makes the logo a property of the bootloader instead of the board
description. The two are complementary rather than alternatives:
simpledrm covers up to the driver handover, the boot logo covers from
there.

> If you're using fb during boot to display a logo, it's hardly possible
> to switch to drm later in the boot process without flicker.

You are right in the general case, but I should be precise about what
happens here, because there is no fbdev to DRM switch on this hardware.
The display driver is tilcdc, which is a DRM driver; the logo ends up in
the fbdev emulation that drm_fb_helper provides, so DRM is scanning out
from the first pixel. Userspace then takes DRM over directly. The
transition that remains is the same one any solution has when the
application starts.

> Max, is this a viable option for your usecase?

Not for the reason above, no. Let me also be explicit about something
the cover letter only mentions in passing, because it is directly
relevant to Uwe's point and I would rather raise it myself.

This series does not draw anything anywhere new. It only teaches the
existing fbdev logo code where the image may come from: a device tree
node instead of a built-in PPM. With CONFIG_FRAMEBUFFER_CONSOLE the
drawing is still done by fbcon, exactly as it is today.

The piece that matters for a product with no text console is a separate
two patch series I have deliberately not posted yet. It exports a
fb_draw_logo() helper from fbdev and calls it from drm_fb_helper when
fbcon is not built in. I am aware that is pushing against the direction
fbdev dependencies are being removed from DRM, which is precisely why I
kept it out of this series: I did not want that discussion to decide the
fate of the binding.

So the honest summary of where I stand: if the device tree part is
acceptable I will post the drawing part separately to dri-devel and let
it be judged on its own merits. If the conclusion there is that DRM
should grow its own way to put an image on screen before userspace
exists, rather than reaching into fbdev, I would rather help build that
than carry a hook downstream forever. What I cannot do is wait for
userspace.

Thanks both for looking at this,
Max
