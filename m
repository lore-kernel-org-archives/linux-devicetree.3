Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF84274FD0
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 20:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776718671; cv=none; b=MozeA7ph9uU0IesQ0+yyb38jla8pdbCXg83hHwhCTZNpll6gZdonXEvjzDFbrEFIzUo8id7FxIUj8APn52KF+2kOc8G4AmYuC6xg/DfIb15RKddlQmBZeoFEwlrkryykYeYP9r+E41aFr1htQDkhLEg6L54G1Ph6tiPRVkw2tSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776718671; c=relaxed/simple;
	bh=ulA/E3omBV0/ANHTKXtHQdfXIzWGQ3Qsywuk4gNKI20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQ9SyuMZ6O6kp8a8lrIjJYYYnabAAjgxPDExBQY1tbHuJEuAqptBnkY0yUYBeX6btFMI0CgLBCNosookTm149O14GXz65g4xqQUH6+lYnEaYD2vgSuZRXy37E9C+wQusq/lHhTsDI9mlRN6WaCOwQhDoB2uM5fODxkXO2jFGY4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ahSWxL4E; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ahSWxL4E"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c637089ccso8422720c88.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776718668; x=1777323468; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJTy7ISgMbSZNylSWRqrfmNeCOG0G9Vq8ABg0zDPRJQ=;
        b=ahSWxL4EtDmp/jyqVaK/DLuO7XSXkccgc53hOz7e5nOB6z2w02VsZX5E9ROXvkfsHB
         MfH/RlA5MQwZ0ZxlRB8Pbodwx1mXi9ipojgdBhR2jhCqGE6QhBCCSfliPDpqoCTGseSq
         XgWMbTV6bJy6WV2aP+jArAewL7y5R2rno75A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776718668; x=1777323468;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJTy7ISgMbSZNylSWRqrfmNeCOG0G9Vq8ABg0zDPRJQ=;
        b=DXWJaMJ/i1DfMzv0TH5Bm2vYNH4g10DvWcax1VfMipNXK7/zQxslN7nswauZ9ZeHjj
         wZEKSCO9UqDyqCEr2WcuZarJpTpuc1gsoGDJULvP6cGrsxC5eUBUVI+D3HYHAn1Xwenc
         KiRY1a6ev2jTkzjXUklOtEQ4248yfrwce7pBekTFky4HO50TcfyZx3De/ZpkGSGb7hE8
         O104C84hncdZ0VbQTNNtZQx2FWpEhV81ihX9ywq/I0+3NwKUS5DiPzoR5mux2aYasX9h
         ACUQehZTYc28CMj3hjfdFcl17EvDrtcr0zVvlmzVOeRfrltoZ63u1DNfpTEXKysq6G1H
         /MaA==
X-Forwarded-Encrypted: i=1; AFNElJ85kV4VlcHl8Oh91YJb1ljV78mMy0JLpMuka0hgDMaM9C0vG2BOa5//GzA8S/4CIWp1kPSQh5JVNtBG@vger.kernel.org
X-Gm-Message-State: AOJu0YwNa1PWoiFODdtHdeoFWf25efD+KMmDTGhtrl6ZedVV8ZRPrlmb
	xPsXqFae+hDbqQXIJkCO5G7+6Td6dooVnDzUAzeNBg9Vpo+u1h4FyFFmCjtc/xHklA==
X-Gm-Gg: AeBDieupEGmuzBM9zwYeSIKvstSqERnfN7ZtJeAAQawuaqGCdQFgtn6LdIb6obz0g0f
	udQBQOe7500LJ1Vzbqh7zUCwBSozph+8Hg4iABE3L3GpbF5nIDbpmA2dAZLm5odpWPjP8hXr2vo
	9mt4NpPYtwkpvcthilHgl1eGtYLnlxtM/MsmchF/M61ZMkJfdqrEocBU/EGbubbxcWCUNLV/q8I
	6+bLjFubCgU8O6MjjiABWDzelzIscTz+e4l0tihNTxacg1nt+EWWAHRSr4+CjQAhiKAgzGGlBpo
	Vhgb7jFFTqhsR6jcTTO/jWPptYdUIxUO/qYusAvM+mOuxjxrvbuuC/8es6aG087wrJtKEf9DCH4
	FZo/Ls7zSB3jOC+Y8cyJI8BEFPxG1Pm/Om5wQ9GF7VUGQyXJ23BIfhZ2dOOv+lTyePkobJZ385P
	4/tk4rwnGdHq+AOF27QTeW4R+NgOrDTyC06P8lWPwmwjmahAiMsc0mAyMuQIG/qRpw8nM/inbH
X-Received: by 2002:a05:7022:513:b0:12a:94ab:e20 with SMTP id a92af1059eb24-12c73f930cemr8621290c88.20.1776718668238;
        Mon, 20 Apr 2026 13:57:48 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b635:62cc:359d:682d])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12c74a20b9csm16321311c88.12.2026.04.20.13.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 13:57:47 -0700 (PDT)
Date: Mon, 20 Apr 2026 13:57:45 -0700
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Sasha Levin <sashal@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Doug Anderson <dianders@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [regression] of: mis-parsing Depthcharge's /firmware
Message-ID: <aeaTSYyaqQjuP29U@google.com>
References: <Z0NbeyTwxo-M4Lgi@sashalap>
 <936bf452-3d1f-4940-9a91-69efcdc6985e@collabora.com>
 <CAGXv+5FLkZbZVHNkfRWuT+OioZ0TG=u2WfaFCx-jZFi73QHnVg@mail.gmail.com>
 <19ba4910-f909-41b4-ba62-c904bc37d41d@linaro.org>
 <e77669ea-9edd-4321-8d17-4da40161b59d@linaro.org>
 <Z0R6myuCR4Jpmc_y@sashalap>
 <CAL_Jsq+QBweDZ+1=FXq7Hez=+mhiOxOvurr3rP0+3y_FCd49Ew@mail.gmail.com>
 <20241209092809.GA3246424@google.com>
 <aeKlYzTiL0OB1y3g@google.com>
 <CAL_Jsq+UCYbKMXG5m8BRNVRA_03Ki8aGF0uoaDs8HHvOSCZ2Mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+UCYbKMXG5m8BRNVRA_03Ki8aGF0uoaDs8HHvOSCZ2Mg@mail.gmail.com>

Hi Rob,

On Mon, Apr 20, 2026 at 07:57:40AM -0500, Rob Herring wrote:
> On Fri, Apr 17, 2026 at 4:26 PM Brian Norris <briannorris@chromium.org> wrote:
> >
> > Hi all,
> >
> > (New subject; was "Re: [GIT PULL] Devicetree updates for v6.13")
> >
> > On Mon, Dec 09, 2024 at 05:28:09PM +0800, Chen-Yu Tsai wrote:
> > > steelix.dtb is the same, plus the firmware now inserts #address-cells
> > > and #size-cells under /firmware. This fix has landed for all future
> > > ChromeOS devices via our main firmware branch [1].
> > >
> > > AFAIK they also have a bad FDT END symbol. This was only recently
> > > discovered and fixed for future devices [2].
> > >
> > >
> > > ChenYu
> > >
> > > [1] Gerrit: https://crrev.com/c/6051580
> > > [2] Gerrit: https://review.coreboot.org/c/coreboot/+/85462
> >
> > This all comes back to bite us, since nobody went back to patch the
> > existing Chromebook device trees, and now we've added a true regression
> > on top:
> >
> > In commit 6e5773d52f4a ("of/address: Fix WARN when attempting
> > translating non-translatable addresses") we now reject devices without
> > '#address-cells', and this breaks the DTs generated by bootloaders
> > without Chen-Yu's https://crrev.com/c/6051580 fix (this is ... pretty
> > much all Chromebooks). Specifically, Linux now refuses to add 'reg'
> > resources to the /firmware/coreboot device, and we fail with:
> >
> > [   11.886271] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22
> >
> > This is almost certainly a DTB ABI regression.
> >
> > This was noticed here (OpenWrt supports some Chromium-based WiFi routers
> > that use Depthcharge-based bootloaders from many years ago):
> >
> > https://github.com/openwrt/openwrt/issues/21243
> >
> > For now, I just patched up the OpenWrt DTS files like so:
> > https://github.com/openwrt/openwrt/pull/22951
> >
> > But what should we do going forward? I note that Rob says "We may
> > revisit this later and address with a fixup to the DT itself" in commit
> > 8600058ba28a ("of: Add coreboot firmware to excluded default cells
> > list").
> >
> > That never happened, and a ton of Chromium devices are still broken.
> 
> The above just silenced the warning. If they are broken, then
> something else broke them.

Right.

To be clear, the regression is in commit 6e5773d52f4a, not 8600058ba28a.
But 8600058ba28a (and this thread I'm replying to):

(a) started the precedent of treating this known-problemtatic DT pattern
    specially;

(b) started to consider "fixing" those old DTs (but notably, not
    reliably/proactively -- even if Google updates official bootloaders,
    many devices are far out of Google support; or even if supported,
    don't have a systematic way of receiving Google-provided updates
    because they run non-Google software); and

(c) because (a)/(b) hid the problem partially, it was less noticeable
    that commit 6e5773d52f4a *really* broke things a month later, in the
    last days of the v6.13 cycle. (Official Google testing probably
    didn't notice, because they only tested devices with the latest
    Google bootloaders. Only people with old bootloaders / non-Google
    software noticed.)

> > (They don't have WARNINGs, but /sys/firmware/vpd, etc., is still
> > missing.)
> >
> > Can we patch of_bus_default_match() to accept an empty 'ranges' [1]? Or
> > should I go patch every Chromium-device DTS file I can find? So far, I
> > think I can get that done in 17 files in the upstream tree...
> 
> Both.

To be clear, my options were:

1. fix up kernel parsing to accept these /firmware/coreboot node
   structures (with empty ranges / no #{address,size}-cells)
2. add #{address,size}-cells into the kernel-included dts(i) files (this
   will merge safely with the DTB modifications patched in by old
   bootloaders).

I wouldn't call #2 "kernel fixup the DT", personally. I'd call it "fix
up the DT source that happens to be provided by the kernel." This
assumes no one is using device trees that are exclusively maintained
outside the kernel. (I believe that's generally true, except for
OpenWrt. And even there, it's still acceptable to patch the DT source,
and I've already done so.)

> Though I'd rather the kernel fixup the DT rather than relax the
> parsing code for everyone. Then we know what platforms need this and
> don't let new ones in.

I'm not sure how to parse this. This paragraph sounds like a 3rd option:

3. "kernel fixup the DT" -- sound like you want the kernel to identify
   these specific /firmware/coreboot structures, and activtly
   modify/patch the FDT at runtime

Is that an accurate interpretation? If so, that sounds rather novel, and
nothing like "both" (#1 + #2 above). It's certainly possible, but seems
like a large lift for this particular incompatibility.

So I assume you actually meant something else, possibly a clarification
or narrowing of #1 or #2. Can you help un-confuse me on what you think
the best route or routes are?

Brian
