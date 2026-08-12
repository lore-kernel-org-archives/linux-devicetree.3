Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2AB3FF1B5
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 21:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571467; cv=pass; b=CINCnBVm7liYcAEzMAkQ4HRTbE7nlvvfgseF43OVt1InJMxN7IP3NHWcgtL2inYryw7CaFj24oJHHz/vyoJyzILYsVHHowv442wICMNUq1m2a4fkazGFC2V/PO8FGZ7kkORrbKm0FE8KbC123VBbyL/s6Zw0iIxuPfd0MGZ5dLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571467; c=relaxed/simple;
	bh=Bs1zT6EItoduMrKgHUcacdfBpYcIQ+zl7jV0rmHLxas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIl99Cyfj0I8up50qVl++eN54P4xZBpWMQ/B++i5zQqjcANSbFEFMAivEGa1nGoS3VH8Edi9yLxwR2to4bhMCgUkl3sUTteVsCrTQDcf1YYi7cyXBaV3X6Z9zPwgRLqgaU4IsXL0tjTuGPdKL/R4pEn/tjDOvlIqMhEvF9AC5QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2Fk9Ju4; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2Fk9Ju4"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so2254785a12.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786571463; cv=none;
        d=google.com; s=arc-20260327;
        b=T6n12LhZb08YvzOCqZe1YYYck6/ZDk2tZLsik6nhFTFDYxv02WIEI9YNZdwspe82aD
         LulkNFOnzyV7yT2lz4UChBYPq7y8393t8YmEAH4PBUAMvySXI5CbT9E3Zp5OAkv1P2Jp
         5EAIds/8QcyW9dE2WOigaloMMjrQWEXnsyrKAjdRcK2cuKg/rKZBx6uGRBkQFLT4hyZU
         pTvF3FCR+AflxtTysfLNZqzHAJoA0PV9OsYJUVx1qjxlw7SajsFZMwvTTjoXS2sMTd2Q
         rpTOFnPo+/bRa5hY5vW4fQtKCLSJlRzUUZOasJrpZYPyZi0L+fQXDHskHqU1W1S57O+z
         2kQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZRbb1QL5HOmY6fyxJkNCzzNheSCQLGJpJYrLwNUFf0s=;
        fh=AcZ09XdkMZhSu+mmwUEyIRL0STXfn7UcdNQ3pNE/KCI=;
        b=LePSycBh7G4BO5b90MlX7eO7IIEIZhzv6a9toR2c346Osom6l/hh4P7VufPl7Yttrx
         5XG5iGLuTcVdQj7U2jh7P9Pn0rbmizs/+PP1DC9gmSQDy92GMZ87Jj4ej8lplylwghxl
         3yGxES3G16frm5eYAUvnbogoZAfeF4Q6XtVR7aWrJCtRdBGql9xQM2oC7omKC8KR7DGF
         NyKpkiAOLxvaFw7RsjNmGsgHsQEm75lVPEYW0rC2TAfVGLvJzBGTSNRWGFM3aJj8Cpp7
         TjQEDYAPTe3t1dCobpoEO5anocJrAWNxit5vZiqsVh6NCSwZGL766yPrQ0siGg2ZU8ZL
         MkqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786571463; x=1787176263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZRbb1QL5HOmY6fyxJkNCzzNheSCQLGJpJYrLwNUFf0s=;
        b=E2Fk9Ju4boY6GlSIebI6Ohz52aHPWqyArUMnk6OURe2xcx7eltFFTjxyFJMNcFuGzA
         gRyMCisuVPZ/Bq1TUFPlnwncQiwij/S1TLtzfHmuR2SpJooWa5nQYPHtjBoGCYihHApz
         ww7Uf2FlzaBK8Ki/yi4Ncbvl3qxZbGOawhvy5FU2V0QrLy9dBAnmUKpv5tuMNV379waM
         PcasgDm1TrGa4bTlg37BaZlNlJxUhaSqPQfW2NnFJxUyoilkYizyEAlR5w+hDC6OwkS1
         +Dyz4kMGNpyoNgD+E64Ez5PIMsU3n5D5zMdkXiaHhJFWT+/KYPr5/aW9GWXYbXCR29eO
         Qi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786571463; x=1787176263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRbb1QL5HOmY6fyxJkNCzzNheSCQLGJpJYrLwNUFf0s=;
        b=jfaaMh5d0iO7cQGU3zuggpCrQS6WSvLtVahWMN4k2y/KAE0MWEnClocy7qZ2ggKcmJ
         fBdB0Oa/Botm0+jHVzBaQ3rROk99DqCyZk+qblyO38gfkA/qNyyqIpm0jtVwy4KbJK26
         nWXSbxU9s+foyyykYmljknreL2Qu1Zdra1h38vgDzgZat2IXl+8v8M7BBrSSJKZKAkjM
         qld/eNHp/zEJEEE/B4aYYNWgIJOe3EnRmVZrxhbu2274fRDjQ+ovhdijgD6cOY9xIrEi
         R1icXluJk4tr2hW6eikZakgBh31MYhux6xx623V/VT6xB6VpuMclOHcruWMAuUfwldYy
         9zJA==
X-Forwarded-Encrypted: i=1; AHgh+RoY1Js4FsQhfQTBCVYkLFvWVnKvgJyJ81S7Zabmam1FbvlKzhuwfW3tYQMbVwdoliwFv56OexV5ux6C@vger.kernel.org
X-Gm-Message-State: AOJu0YwbPk4p2KgxxheQIiU3WCUOMAP8Y5LUDb4nTBF2gsiAOfhTofdf
	Ti2J0PbDGciaNaFHsYOPHJEvj0pXhK1b1iN+xXcdcbFw3vejFFQscrv8yL8ejwUaHPcdNY5xbUk
	gKCSILO5TnXOzRAw9aMVElIcLBNoSbB8=
X-Gm-Gg: AR+sD12wWGfeKd+Evt8ZjbuWGUL3LnauSWLK4uOyTa9sthApOuSINaIvWzHaThJ6s2P
	hSVgfh7JvHGIdfjPTsU0/Fvv8FZGqce6R6C+Ty32f2bj2nzyISUCquZwRLwyjaQ82Mafv83HTOo
	FVJLcGpNTm4qQGbT0XkOaqI2b9IIFUytcv9WbnITZ2EcSPhaMnzfuAG5gvcnFeYMj599aHqIb/J
	Pl2Oqm9bBrz0sNru5yyyALpODe44UzDXmfA1jEfaGTAHCVBRSuu7ozzCWrKyie5uWveWCADwI6T
	2TgVrZ1G8kqW8UuXqjvJPR1snE9Hze/8NIAJHNXhjUc/
X-Received: by 2002:a17:906:f59c:b0:c20:f913:9337 with SMTP id
 a640c23a62f3a-c2108f7b604mr49396666b.20.1786571463233; Wed, 12 Aug 2026
 14:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731215043.30392-1-maximpedraza@gmail.com>
 <am2mvECnCcO9IxuI@monoceros> <0219df57-06e3-4776-afb1-d167cad2e795@gmx.de>
 <CAEUXW=GUY+x1A72n99i1Cpgy03jTYv3FPAX5nY3DCHqmeq9YVg@mail.gmail.com>
 <20260810-devout-pig-of-performance-595ccc@houat> <CAEUXW=GuHypVE5Xre8AQBmkrcUbPQxh03Lq8os=kjcLeGahOgw@mail.gmail.com>
 <20260812-neon-asp-of-completion-e9349e@houat>
In-Reply-To: <20260812-neon-asp-of-completion-e9349e@houat>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Thu, 13 Aug 2026 01:50:47 +0200
X-Gm-Features: AUfX_mxyPKLYJzGR3BRhvwNIy9Y09lt45MHF5IGyuCsk2Z_DBdXDroK9BGIUrgQ
Message-ID: <CAEUXW=H-o+fqBjH1UQG7=UTm5x1a9Cj++XJM7twvFU4vJC4UrQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Boot logo supplied by the device tree
To: Maxime Ripard <mripard@kernel.org>
Cc: Helge Deller <deller@gmx.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mi=C3=A9, 12 ago 2026 a las 9:42, Maxime Ripard (<mripard@kernel.org>) e=
scribi=C3=B3:
> In such a case, you can (and really should) use KMS, and you should use
> an initramfs and setup the splash screen there.

Agreed that readout is the right answer where it applies, and I am not
looking to duplicate it. Three cases where it does not:

  - Hardware whose only in-tree display driver is fbdev. There is no KMS
    state to read at all, and there are still around a hundred of those
    drivers.
  - DRM drivers without readout implemented, which today is all of them
    but tidss.
  - Falcon mode, where U-Boot proper never runs, so there is no image and
    no programmed CRTC to inherit.

On the initramfs: it moves the splash earlier, it does not close the gap.
Measured on our 4.19 product kernel:

  1.09 s  tilcdc registers fb0, the logo can be drawn
  2.68 s  ubi0 starts attaching        <- 1.59 s of built-in driver probes
  3.39 s  Run /sbin/init               <- 0.70 s of UBI attach + UBIFS moun=
t

An initramfs removes the 0.70 s of storage. It cannot remove the 1.59 s,
because PID 1 does not exist until the initcalls have run. So the gap goes
from 2.3 s to roughly 1.6 s, before the splash binary has loaded and drawn
anything. That figure is an estimate; the breakdown it comes from is not.

It is also worth saying what this series is and is not. The kernel has
drawn a boot logo for decades; this does not add that. It changes where the
image comes from, so that one kernel binary can serve products that differ
only in branding. If the position is that the kernel should not draw a logo
at all, that is an argument about CONFIG_LOGO rather than about these
patches -- and drm_panic already calls fb_find_logo(), so the logo is not
purely an fbdev concern either.

On doing it through KMS: you are right, and the follow-up series should be
a DRM client alongside drm_log rather than a hook in drm_fb_helper. I will
rework it that way before posting it.

Max
