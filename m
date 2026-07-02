Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3F538E5DE
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983164; cv=pass; b=rGVsG87I6Fs4sA/yg4oisgedr6nHJuZp8bm1mkKZTvQL1xR4Lr2wFQIOX628/DB2hg3eDSlQ8bHmOrfcUNbwikh2p/cRbjLrufvxdGF3xbYoz4vRChE4FwY6WBApgzpTwd2228ZaXxOTfMZFfhhr3YEElr7df9GyMhJAbe2YYHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983164; c=relaxed/simple;
	bh=OLbJZmEN48Bpb3YwVZB+cvbIxBezJ3Tv0MKyhyRFS2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0PEM94bCZ72GaoahsAy2Goda54tR8aZyHk8s2x5RnmyN13DZcHKs7f3De68tXKpzw8hSIXmOQoor75Hdc2DfqF/xE6lun/ZFPu3WEpmEPtK4iboNFGNILfMCRlObf1SJe9YkXIBISPYY6xdVkOU3IXByJ2zAOjLt/actxm3/w0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=js42Jsn0; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="js42Jsn0"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c96d2bebca3so811828a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782983162; cv=none;
        d=google.com; s=arc-20260327;
        b=Z5FCFVvgsnADFaeoF6YXzOZe+N2K6Fkxg49LA50XREmEeGaKDUNc913H5EDCJR8RNb
         KmTabwEieXSSig3ttxGYa73RG1VpyEC/feqI3Fai+fMFFAEgxqk8us6uIb1RZWRAN1NB
         P8eYQXOAzHHFX9u/mR8Xm4Y7wrvQJjCo7e6ky7KqAQqCPmNc0dtRMHLWkd6J1mCFL+H+
         eOe3F7ZPbZ5CmLWVCmu0qnyGY5DFkRZ+VmM4baBcrsaz4Wp/0jVDlJPKQwxoaJKBABC3
         CQNy8/Gfeisje1ittF3pxz6ZRCo0aocEA0vf+7dPT/fY1MhOGOTu9+DPpSbQNqeXFNIS
         KlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OLbJZmEN48Bpb3YwVZB+cvbIxBezJ3Tv0MKyhyRFS2c=;
        fh=7lKKt7zNhevpdyzMZc6m/VyS2Idb7LaMvFoEWNeJycs=;
        b=cCHT98U2BLH4eTFizTwL61V4ntD42kbGQkif2tFsjyjex+6esmI+cvHUlnc3Zdixny
         D8DbaIHGbYexgXf0ENWXHCJVyR8VehXf2csvifAYGwO0H6Hr67lIYfkJ8ktdcHnWht+A
         TJqPb1Swrg0LZfhdLF1lfVKTedqDLKJZKGXDEoPGSDd789GSTHacn+9O7xZ0936Hyz7h
         tYiobkppyuoZODn6hXC5OP39CUtcIO60O5fTpRoGx9DeYQv/sY3GzUIKSHHmRzBDUG9+
         Jvfir1+w7fwadqZkjMvobSW9qSfNrQRBjEjncRwqNJHYe9s4XlHuGujXPs1kR4+DRzRh
         25lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1782983162; x=1783587962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OLbJZmEN48Bpb3YwVZB+cvbIxBezJ3Tv0MKyhyRFS2c=;
        b=js42Jsn03/prpdYz9xPxnTQSEFbcbdDZoQ/rDV5M/lMzOI3BO54oaAdSfKeQJogULZ
         RO310UvUibVhhD3LY6KBNm6HBSeg8fkNoA2AFwEHimkyfRBjWWmT4tGtAbGOMNZOB5wQ
         I1urdtavd0xi3LSm8+HVpXCyrx3qp9+MoeTxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983162; x=1783587962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLbJZmEN48Bpb3YwVZB+cvbIxBezJ3Tv0MKyhyRFS2c=;
        b=dpSSNfv1VQL7PX8l5q4lAq62bEwgd6ZkrivNC30PXa8xIsLdQL4F3G7Qmlyis99Ys6
         g6w9W6AL+FkFGcfvGndXCxQQJ8/vIReusYK8JIgrV4EhRrtbGtjpmb4k6+OobnyAWUAM
         vnWSvLCRUkv3sNedJieogwMunCWkvr87VbziznKD7gxaTCFA9DP2axUnMkVpUwbmflF1
         FNCsibB0A0NYBiCetbjSqJkQ8RiDSgyRz6xelwm8BwRgRu/lO3vKIeqmZr5+6jLNzleP
         ui+UnmRab3DgIAF6Aq/qP2tExY6J5+KWPjRpgezj5sjiUfSMabub4mLiAGMSfB/p2iOK
         CUfA==
X-Forwarded-Encrypted: i=1; AFNElJ/yiobhdoQUtB3bHL1onvGUHZMpMpO6YAuUNo7IUaHgWypChHDT1mU5oP6hQoGYhFdEK574vCoSSrXI@vger.kernel.org
X-Gm-Message-State: AOJu0YwGSMmoCXjp5sKAjJR9ULiqA+zhE/ArQFtBf2z9qy3hSt0h2FT2
	Oa4t7VDGV2xRuFIhpLukL3MkICgQ/CSLQrMTmYvUBZOSv3b0xBTcBhm3y6eYZNwoP8+A+iB98tu
	opWe9qGNEKvQwbtG7emoQa9p/BgOxNMdjtOHXTJQZHQ==
X-Gm-Gg: AfdE7ckTtpe79gl0M1f+WORSu62p3d4k1XZsejJwktllXuX95KS8Q46P9Y0D0tbYlVR
	jZd7rw7MzF5rDqt3c/vNKcbVvtw/bAQ0cQDKYVe31vXnVPYXkIniJjJsV7ut511Klr5L46oypJo
	DekradXrJLprl7DD07zXv3ou5psGSAdFpnMJ7xpLqW2hY5Fo5e/ASvTnJoD8z8wV2XXCpThPwSQ
	nNRODD9q7sJvsVIwtGbwxA3jnpczmeyziPP8erUIf5tPS6ZukVQHVP8JO6meClj3zbinGWtz6aM
	BeYR4HTBNlIRhirAZxxTVR1p/YOBplA=
X-Received: by 2002:a05:6a20:729f:b0:3bd:394d:addd with SMTP id
 adf61e73a8af0-3bfed470172mr6117379637.33.1782983162281; Thu, 02 Jul 2026
 02:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626171906.476688-1-daniel@thingy.jp> <CAFr9PXmAtnLSzA3GLb4qKvrs1X6aD+DNPSoEBXhSzkL7oPHBig@mail.gmail.com>
 <20260630164804.GA3920230-robh@kernel.org>
In-Reply-To: <20260630164804.GA3920230-robh@kernel.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 2 Jul 2026 18:05:47 +0900
X-Gm-Features: AVVi8CcpyFXk8N1oXXA3N0fWYxrJuxEd4xgluAOW0hV3iND-geXqEiQpHEjA-WA
Message-ID: <CAFr9PXkG9CKAF-cGQfOKhkysADTKSNmmyNmbC8kG1cOp=dcBfA@mail.gmail.com>
Subject: Re: [PATCH] of/address: Drop ISA parts when !CONFIG_ISA
To: Rob Herring <robh@kernel.org>
Cc: saravanak@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Wed, 1 Jul 2026 at 01:48, Rob Herring <robh@kernel.org> wrote:
> > I made a series that adds CONFIG_OF_ISA to enable this code, selects
> > it in the places that needs it, and then does the original part of
> > disabling the code if not needed. I will wait a bit before sending.
> > The reason to do this is I am using devicetree to boot a machine with
> > 4MB of RAM and a 7MHz CPU. Removing dead code/data like this helps.
>
> I tend to not want more CONFIG_OF_foo options, but okay I guess.
>
> Alternatively, maybe CONFIG_ISA should just be enabled with these
> drivers. Doesn't really look like there's actually much or any code for
> CONFIG_ISA. The biggest issue might be the option doesn't exist on
> arm64.

I guess I'll try sending a patch for arm64 to add CONFIG_ISA and
select it for the drivers that need the ISA bits in address.c

Thanks,

Daniel
