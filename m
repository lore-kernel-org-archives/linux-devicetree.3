Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D3E46985B
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851949; cv=none; b=TWqUTTI2Skvn9Ng4kpGK0RA3atpnxTaB8yumjIJKha48aucXELETruwWJP+kLdFlQbwEA0/aVAfCsxSEYnLUJ8eUpaynHZ2W7c8ZzB7aWcB83rQjs5vhr+AKB2+LaH9kwwOxZFVlPRUKSb8i/LG2LxlAXhnfEeOf8/kHqYrW3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851949; c=relaxed/simple;
	bh=bijMh6YVN02L/DmihwClxQpYomd+j6W5tABqliS3/J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ka2hVlB1xeJ4WnDPITxlQRSbb9+QpLR9U3PrLn1mnn1tzqHULrU9zhPRBahsGm4HGMXUUeAlksTn/ubZ+Kds+Un5ut1jVYnk6yXqfyxAgQ3+8cTKrVcKtxrjdmn+Do1d+iiOm0kBA63nwNreP+uVyzR9Bu6hV12rJz5H2TOhqKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9693bbb962eso2732100241.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851945; x=1786456745;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jMZGg3Hr90Da/te9ZK4e2PlgcVa8qZPpj3G51Zmu8Ic=;
        b=DOQq4At1T025tKIeOPrqw4pYd6K8paG5QVG+ruALyAm51fwO95gVsylLPaywtlcIkD
         i6/kQx32gJcQ+4Z60R5sKRfmEKasKR2EVYKDHEY6+10hbKHJgFC8MdTG+M5C3zOLHWFX
         6626n6xnNkfL3OkZ+ccLcCk++qND5y60FORO4Gf9zYbcJeyDZmJ3SnoItqIEh/e5TD+g
         daW+ZCsQonq32p4La+9fRjqutr73rydIJ+1x0xKMx368dlXJuccuiGsnQ8wzsNIDXKlB
         r4C9dtOCTJPucRivMY9uFZqqUz+U4o2XPhgLQOlku+JW8+jIqbFvGUmITn2joarH+dOg
         wJ1A==
X-Forwarded-Encrypted: i=1; AHgh+RrZDQgg/DfIffYxwpd5BnAWoap2V9DCZIBENnt5q/GTwebKA6KS5qrX+3/pXEaC27NUcYnmql6rTERa@vger.kernel.org
X-Gm-Message-State: AOJu0YyNH4DTvesULsnD9gDmkUl3jZDXe93cnDiurhXavmBltluJicG0
	cgrxHO97fcsGuHQ2VSJyeyjUVyDnSdkYl++hENvWTQGitqsni67ghZvfflwzj7AD
X-Gm-Gg: AR+sD100MMECrmiFUnBG6cLex+7etinzhBpBN1GZRK2jI/ZtuUqcWc2JmNHDb3GgNW3
	GE8TuQrNitPZw57jhq/vj/cSKfXicViMWONxnkRVLXZ1Y9VJMS89eg2O4tNjObqwnKJ9a6o3D6d
	28Tx6KQ7Rcw6DxuOcAto5+A2MSKpmoYUmIRA1dG/hq+sZMAzEPEmoJbSXaCt87/OgiraQoN8aJo
	kb2JPhG7IQxvxSJQkfHJYP853jpUfxH1uJ6cPDsJ2BJ2OQqt7S956w7MOMzUBArVbSUtxNthkbC
	czX1Is5JXqje9AU+tThB7RW0AmsatBrL/tz2rqqT8tVYPlcOnHZX9qcBErgBsaS9wNtiuQ2a6VA
	VGYHwKizkhcJno2usiCdmCsW115Hm4rhsEWmU649+JgCuRcopnsFzDbX7LCGM3mmN+KLBbFDdM4
	jBF31psgV7BFTTHU8ys+2eARQztE5HzgrJSRTh41RFOfFDST1bVKdxxT/BJq8xF9xsd3D5lgZd7
	6/HZmGxQHUYVvHBWqA0FI9oXsfy5ATHE9RxHusn
X-Received: by 2002:a05:6102:1496:b0:74a:9ac9:792c with SMTP id ada2fe7eead31-75b243758c1mr10937571137.12.1785851945425;
        Tue, 04 Aug 2026 06:59:05 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9782c7e4d96sm147843241.6.2026.08.04.06.59.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 06:59:03 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c276bd3692so3158419e0c.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:59:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrpNe+LSaLtSaWEtK0+4jbn74M88z7h8IY1/zay339bvgV1Oc8dgezzvK0NmyvfuM4/tLDTCvzWbXGg@vger.kernel.org
X-Received: by 2002:a05:6122:178a:b0:5bd:ea6e:52f4 with SMTP id
 71dfb90a1353d-5c3878da56dmr4433506e0c.10.1785851943093; Tue, 04 Aug 2026
 06:59:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731215043.30392-1-maximpedraza@gmail.com>
In-Reply-To: <20260731215043.30392-1-maximpedraza@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Aug 2026 15:58:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrmpZibxnP5k8wCr_Jpx2WzAe1bcUt9k_hWrreDs_-Eg@mail.gmail.com>
X-Gm-Features: AUfX_mxuzkKCO3FqjKUxMjQ1O7E0RvhlBOsj8RUg6kF0tqsdz7CSmr5lOxZ_jd0
Message-ID: <CAMuHMdVrmpZibxnP5k8wCr_Jpx2WzAe1bcUt9k_hWrreDs_-Eg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Boot logo supplied by the device tree
To: Max Pedraza <maximpedraza@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Max,

On Fri, 31 Jul 2026 at 23:56, Max Pedraza <maximpedraza@gmail.com> wrote:
> Embedded products routinely need their own boot logo. Today the only way to
> get one is to replace one of the logo_*_clut224.ppm files in the kernel
> source tree, which bakes the image into the kernel image. Two products that
> share a board support package but differ in branding therefore need two
> kernel builds, and rebranding an existing product means rebuilding and
> requalifying a kernel for what is purely a cosmetic change.
>
> This series lets the logo be described by the device tree instead: a node
> compatible with "linux,boot-logo-clut224" supplies the image in the same
> paletted format the built-in CLUT224 logos already use, and the kernel
> prefers it over the built-in ones when it is present and enabled. If the
> node is absent or disabled, nothing changes.
>
> The image can come from the node itself (patches 1-2) or from a reserved
> memory region the bootloader filled in (patches 4-5), because the image and
> its placement are independent axes of variation. One board sold to several
> customers wants several device trees differing in the logo. One customer
> with several products built on that board, with different panels, wants the
> same logo placed differently on each: there the image belongs in a shared
> binary and only the placement belongs in the device tree. Patch 3 adds that
> placement.
>
> We have been carrying a cruder version of this downstream on an AM335x
> product since 2020, across a handful of board revisions, and it has removed
> a real maintenance burden for us. This is an attempt to find out whether
> something along these lines is wanted upstream, and if so in what shape --
> hence RFC.

Thanks for your series!

> I am aware of the contentious part: a bitmap is not hardware, and the device
> tree is not an obvious place to put one. The argument for it is that the
> logo identifies the board in the same way the model property does, it is
> available before any filesystem is mounted, and it is per board rather than
> per kernel. The argument against is presumably that this is policy and
> belongs in userspace or in the bootloader. I would rather hear that
> explicitly than keep the patch downstream on a guess, and if the concept is
> rejected I would still like to know whether a smaller subset -- say the
> placement properties driven from the fbcon command line, without any image
> in the device tree -- would be worth submitting separately.

The standard location for configuration that is not hardware
description is under /chosen...

IIRC, real Open Firmware used to have some logo configuration, too...
Yep, /options/oem-logo on CHRP LongTrail[1].
And it's even documented[2], but fixed to 64x64 monochrome.

[1] http://g33rt.be/migrated/Linux/PPC/DeviceTree.html
[2] https://www.djc.id.au/2008/IEEE1275-1994.pdf

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
