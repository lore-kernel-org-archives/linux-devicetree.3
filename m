Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE9D47F783
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159414; cv=none; b=LuXcaNTCBDAMVoxzrjp5QWxGpYKA49CV1e/RxH1aw+/gi/sWRjIZj+6XcYFfZCX1lVtQU3V2fwNidamis2ojleFCHpNXSdGsImQuLLrNpZKtnJSknjabuLGxoHiC4CJp80o+JPNY2oc1WH5xa3SsIHx5GpwUsDKdWSbcdlfgTmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159414; c=relaxed/simple;
	bh=4vSnFRyrnWw1NiPCPc0UvaiFDOqzvmfhZ4d+f3+l7pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MccD6wcNML6NChYU6lpphb9idu/iP5vptsbFH+2e1PiOnyxWfzPAZjufACBEuFGMai4tHLICeFBl3eWTeyfkFq4wOuLL9qmDhPPpZHDeTf5DRMGTgGVJ/ZlD/2y1/tp0CpopKDwICpxjBWqlpV5MAIRjavnmPRGyDIX+Nsp4eCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97cc700fcf5so1247713241.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159403; x=1790764203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4+0mGr2LVa/kdmweLtRn6u4eyOMGZ0oEuJRaGtsK3Ck=;
        b=u7b4ZPp/mdoiIkpxHUGDtvbctZKgMTUG+SPXelylDNSjxo0FLwMVCkZe3GsnqNLHkt
         8kzKCtOwacCR8xj7ZH7w8atkrq7jcGrq0bjUUsOR1F0Li+SipltAVk52Z61osYUG7zJA
         +ySGR9pDnvCLrBhqJ6nXuPH/Bmvzbz06jnEc9bGjV91lQB7+pDFmTa3iTHKuISGTvL/W
         KYoLqRDGQyevJ/xoElyqf6iMREFOOYMkeHHWqocqlqfUZLADVrwW46+Q1DUGR0nYn4ze
         FpitXxGvaZD75V4mMO3zbqDTniwvZhcVCUtEW/JFdBeEQwmhjV9YRBbM9w4Rrxw6phwD
         iNUw==
X-Forwarded-Encrypted: i=1; AKwUvByJppXZX5ZUcc0SJuZXMGaFe2m/BZNfzLK314JN4clt/tWcDcL7BlYMfssGDx9aa6rtrmmet87dMNIk@vger.kernel.org
X-Gm-Message-State: AFuF++mxbTGIgRH75y3lHu8dV3bOwCKKMZiRVfkJAktv0F7yQiI7N8rB
	zJcmSn9f8CqbATGsyPDgSswRrkURvOPvhZDwyhqjbXOwIt2qdrljI7xCrohw/R6BYcI=
X-Gm-Gg: AYBFou0DdnaGd0t2Ue6pxvHybrci/qyeMfsjT4BTfDAZFXlqHoyDWvUBWmahsp89idm
	ioYVsiHUsLEGpTzMwyB7i3f5LCxIEM5Tpvf4xOfcUkwcWmsApvopmGa5ZWZKBKhw6M/hFHTGM39
	VmS5bkuhwZ2T7RGNLpQbl0nSN57gazmyJNUykFKhguy3gx+aKwNyBTRQjmOd7XEkxFPudFZI8v6
	AQp0dGzNjEYhWXEwr63uiip4c1xtYnb6ARwH3lKHpVqKQb+jwZExQmgfQlgdw09VRgUjbERvgRe
	j5JRnFjb34GWj7a8AdgZ1IXrbBfz5j25IaItAdMJmIPl7ZPhl/RI2T9qdizm2JCb1zdhzJN7lh9
	aVtwA/5LSxEs/mr1mvISrWkzdZuJtujX1Xevs2hilJ95fC2h3kos+S8kp7805W3DVs2hKP6EztR
	p26eQ062J0UOgyNX3Md1yRqCu3PziOKjZYLeEhVDp83JY9G4OJ7Ml0FAk8a1e1onRt+pjs+DJyJ
	mOG82/IhaXWDoXWMD+PaEHc7nhgHHAk1qXQPGT2UfH8Aro=
X-Received: by 2002:a05:6102:f0a:b0:7a7:69a1:add2 with SMTP id ada2fe7eead31-7aaa0708f72mr5706325137.30.1790159403605;
        Wed, 23 Sep 2026 03:30:03 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985167e6fcfsm3033838241.0.2026.09.23.03.30.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:30:02 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98515937bcdso470650241.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:30:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByIEf2N7GwgoOkMZQLAryTVeex5BNEnhk6/YxtYNEp5bqNE+9vNPnBwd30UMdD+saYb1MpFjHEiFswV@vger.kernel.org
X-Received: by 2002:a05:6102:1446:10b0:7ab:7e3b:bfba with SMTP id
 ada2fe7eead31-7ab7e3bd9f5mr3203843137.14.1790159402747; Wed, 23 Sep 2026
 03:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-2-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-2-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 12:29:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeWfoqLiJQXBbbha8LwQ=HSYnoXs92A11gjFDZ-f9eHQ@mail.gmail.com>
X-Gm-Features: AclHuK_YPTNd9n99xYnNvuCZvr7Q9bz_jkhp3XejRIht4VqBRuZcUWZrT97Imys
Message-ID: <CAMuHMdVeWfoqLiJQXBbbha8LwQ=HSYnoXs92A11gjFDZ-f9eHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: power: renesas,rcar-sysc: Document
 vendor-prefixed header paths
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Andi Shyti <andi.shyti@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Update the top-level description to also explicitly mention
> vendor-prefixed header paths and what the asterisk wildcard represents.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
