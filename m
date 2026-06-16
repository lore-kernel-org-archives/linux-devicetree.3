Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2553E411664
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600140; cv=none; b=O6FuHRQ64/Ob6D+b352bsgwP6BZWxLpLuM7MWwQLlnmY2qbKmr73JVIOjgxrPRIdag0oK5PpMHsHGdBTagBk590QJ0o4bfEsiK0f8hf5T06hNPdkJKpDP95sm3sqvnMyhm8jOn/+43fJ7qgR7Rvo9mhh01XemHTFacTTB6yUNy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600140; c=relaxed/simple;
	bh=4xrzWiPUPLpe/cLXPoITvQw+GLIajO+n8AwKDTD1XRg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K5YmdaEbC1nPNhJlvNRus+HbWpOSX7A75elIHgrzeEQKSGlaVo3K31xTDGIHcYIET/QEkCTx3qGnlsAZr9nbcaLBewI8YZj5uf/3dmEqSqkFzRCOeEXFJm7emFuryGVwK+gdRx2RpIrFlSMyaTgp2saXXJoHrv0eG86WMEkazNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=avsx/M6t; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aLKP4+8L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="avsx/M6t";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aLKP4+8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781600138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mAyn5kESksTVfnvqgVzJ356M4lj5kuXhDk0e0cXq2jQ=;
	b=avsx/M6thGN+GaQF3Vd4XmJqMkoORGrlHiVp2HQKQ2bf3X8gT5SyF/BZfCXLo58D5eeCJf
	BS9AIAfPR3eYsxmSbOv1zImnEBTODXcaN5hfJc9ws3J/A9G4cO10AdbndCc26VPTZJOmzz
	ezV7vyvH3sCyVIDCtAxnuUstH8f2iwY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-pWmGDMLzMcGsc3Sou0DVpg-1; Tue, 16 Jun 2026 04:55:36 -0400
X-MC-Unique: pWmGDMLzMcGsc3Sou0DVpg-1
X-Mimecast-MFC-AGG-ID: pWmGDMLzMcGsc3Sou0DVpg_1781600135
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490b8adf8b8so40868715e9.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781600135; x=1782204935; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mAyn5kESksTVfnvqgVzJ356M4lj5kuXhDk0e0cXq2jQ=;
        b=aLKP4+8LT+5aZjlOBuUDYKi56G7kmlR4dIDMlqcza0nzrCU2j0moS4w3D7apgyvOZ5
         gszbLYIR5xIzgoiL9OufwVmRQUjSJwGJvbQPN62ya7BdjH2aYxNRG6o/0AtjM3kFyp82
         4O3y3aN97rXdbJKAHSLycY2BbUqz1YWq36ezc2VlzSUTCExxCjyrc7reHUaRvFLBu2j2
         BsbKjhgdL0hsgj6MeTzwDo5IcGBYs5M9jIiMYJw/5Kpdmd8Xa/Jz84fsGsOvDInc85Zl
         PyWP/ZPcdz0pbl6frMFdJmChVeChLpG+3Of0oqVQP2x6Byxgbtd7PBPnZTpOS3OCC7zy
         aEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781600135; x=1782204935;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAyn5kESksTVfnvqgVzJ356M4lj5kuXhDk0e0cXq2jQ=;
        b=W/v7d7OwP8kOE6aO/xZkKem5PkyjHepZUIwRW+fWUxwff8VMDaH7RmsipxC5WlzXXZ
         m7HtZ3xfVK7C+aDHtQfQSHoZbKs1rRuBIrysXzEh3xqfRoxfIXwZ2PGT3ISQUPvLLa5z
         HUS0VapJ5sMiPlGxD9p7+/CWezIBuZgPAe+A4XVJX7NRCK4NPoK/eQIv49QNnqM2Gr8j
         O+9KsYg4qru87PeYjLPYVNjbW3cqz1UseQ8RjrybfnsfKFXal4gBnksf8JROe2S/o5X5
         EkoKSUEPoqZREManBh8bKYDG6yuaYh7g1vDQ1Ju5CUs2EmoqHKYDUidwS7UnlG37xCQ5
         ryLg==
X-Forwarded-Encrypted: i=1; AFNElJ8z2jNWFLFAQaUlv2d/cev1ZlaGGcprXnIKFVgDUFxBPs5Y+G10r2GGZN4ttVT1tZhb/Y9YgLDw21pR@vger.kernel.org
X-Gm-Message-State: AOJu0YxR9E4EOfRmQyH/tDsbOGZJPESUXYeJu7Lbxe2xfXWTKvJ3LaI7
	GZWDrHiEd/sP2YKMFKy4ZvacnH+hwNncYuRcdAnHcJL7O0hxlQAieW4Wlwi9M3trTHBuPSbJN95
	5zLZ544XdktOd3pWO95jzXMMonMh6sdsW6Gu2f3wqUrotyEW97jXjSmcF+e/yeV4=
X-Gm-Gg: Acq92OHnD4aF3xamt78fwu0LpbictK2n6HVT3SWVUbm8vVHuGEY5Dv/jkmx6nqF3JqX
	tIwlJ8oZiWcjWhxol9vzTEyZSBP77qeo4BDftADWrqHYxC+HP7WstxjY/HYbpsXQzSMx28HZj8H
	8ohvCwzSkcr/il2DHlVQrq8n+FWtDZJkuCzA0cct5yzQDjYiDZEG28p5orspEY698eColiOG5q1
	L6JJPf7xKolS/YTN47nX9hr0ezTFFkBcAnVLJg1v3EemYrrozEw0b7Fr/3FzSZdO30VUj0caUIO
	cVmbmxrj5ZXYuy/LISGA2lSFfSkIbfKBRbWkfAUUtf3WWtgVtkgX87bKzghAQxJ3ZecipUvREby
	IFauMRHeM/4icd9Kna6loPgCeKajommXp+VYY5FdG5m4LkNF4p/TAqrvTj0oGU1CdJvpl1c9Tq1
	Chx9MV
X-Received: by 2002:a05:600c:6812:b0:490:adb6:793d with SMTP id 5b1f17b1804b1-4922ffb7525mr40889355e9.26.1781600134977;
        Tue, 16 Jun 2026 01:55:34 -0700 (PDT)
X-Received: by 2002:a05:600c:6812:b0:490:adb6:793d with SMTP id 5b1f17b1804b1-4922ffb7525mr40888885e9.26.1781600134534;
        Tue, 16 Jun 2026 01:55:34 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f450sm46481919f8f.10.2026.06.16.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 01:55:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: Amit Barzilai <amit.barzilai22@gmail.com>, airlied@gmail.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 Alberto Ruiz <aruiz@redhat.com>
Subject: Re: [PATCH 0/2] drm: Add driver for the Solomon SSD1351 OLED
 controller
In-Reply-To: <20260615181253.97551-1-amit.barzilai22@gmail.com>
References: <20260615181253.97551-1-amit.barzilai22@gmail.com>
Date: Tue, 16 Jun 2026 10:55:32 +0200
Message-ID: <87cxxqzwxn.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

> Hi Javier,
>
> Thanks you for the detailed review and for the Reviewed-by on the binding.
>

You are welcome.

> I agree with folding the SSD1351 into ssd130x rather than keeping it
> standalone. My plan for the v2 driver series follows your two steps:
>
>   1. Add RGB565 support to the existing SSD133X family (so the SSD1331 gains
>      65k color), gating the format on a per-variant flag in device_info so the
>      existing RGB332 path is untouched.
>   2. Add a new SSD135X family for the SSD1351 on top of that, reusing the
>      ssd133x data path (the update_rect window logic is already
>      format-agnostic) and adding only the SSD1351-specific bits - the 0x5c
>      write-RAM command and its init sequence.
>

These make sense to me.

> I'm deferring step 3 (native 256k color) for now since, as you suspected, 
> there's no matching DRM fourcc, and I'm dropping the 0/180 rotation support
> to keep the series focused; it can come back later.
>

This also makes sense. Having 256k color support is nice to have, but so was
65k color for SSD1331, that didn't prevent me to add support for that family.

> Two things I'd like to confirm before I send the series:
>
>   - I have an SSD1331 panel, but it is currently unsoldered and I don't have
>     the means to solder it myself. I'm trying to arrange testing through
>     someone else - I can't promise it will work out. If it doesn't, the
>     SSD1331 RGB565 change would be compile-tested only (I do have SSD1351
>     hardware to test the new family). Is compile-tested-only acceptable for
>     the SSD1331 part, or would you prefer I hold that piece until it can be
>     verified on hardware?

That's OK. I've a SSD1331 that I used to test the SSD130X support when I was
working on it. So I can test your SSD1331 changes without any problem.

>   - Could you confirm the RGB565 byte order the SSD1331 expects? The
>     standalone SSD1351 code used big-endian (drm_fb_xrgb8888_to_rgb565be);
>     I want the shared conversion helper to match the SSD1331 datasheet.
>

If I read the SSD1331 data sheet correctly I see that it support different 65k
formats but it does support the same 64k color depth format than the SSD1351.

Only supporting that variant is totally fine so that you could reuse it for 
both chip families.

> Separately, I've sent the DT binding as a standalone v2. Since I dropped the
> width/height and rotation properties per Krzysztof's review, I did not carry
> your Reviewed-by forward - please re-review at your convenience.
>

Yes, that looks good to me. I already gave it my r-b again.

BTW, I just added some cleanup patches from Alberto that simplify how the driver
send multiple commands. Please base your v2 on drm-misc-next branch to ensure it 
does not conflict with your changes.

> Thanks,
> Amit
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

