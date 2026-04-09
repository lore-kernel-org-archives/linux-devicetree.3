Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031EC220F49
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 05:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775713080; cv=pass; b=oTIKwz3Xn8oS65TWs1iGSZq5imXB4lCjas2614MwI1Qb1XEnIdLuHBXZsKLX9NWoiZgYUTI+eIjeyBay4xYcri+zx1V5oWXdYOE2Gad4ICy+ANdYair8K8RQaKnIGNGKQ6UthzRc4pPPWwHTFf1ZDsw6h7SPRiEAP3/jkjY4ygA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775713080; c=relaxed/simple;
	bh=i3XyCP+obrtYFom9qmKraRyXOU/Ju05wWrz/nQcIo2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xq7qa0RfxiRH4qpiXC+bFRdQENJuGZMBBLjgzaRu7LVeQvwl8mRoPm4eUZoOnB8t17nWyqAS5NN+lYg8uHjE+8Seok3TmdNquk8FKj/cCZWs9HgAQv17j3dBedUiUxOgiTukiFtkK7ijiJwIKD8JXWSb+0LJogecdXqDrl+++vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=IYBm4kMR; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="IYBm4kMR"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79a46260385so5280477b3.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 22:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775713078; cv=none;
        d=google.com; s=arc-20240605;
        b=ku7kTfdFWknfdpoW6feQHpvUfpalDmNCrKl4Z+zmYtwzpfUoTW7EktgCE6txXD5CfN
         d1cTWTUGxTwQzl9YxORcPtSjdE9VOcQnxLqwjrZK3IFbRTu+SGlMdzXuu7+4dfZ0PM+4
         evOhZMC3hmqU3frRrYIHtfs8Z5xqAMW9v1zIldbiSiZfIXUZZlfnGZSj/4Sqc8QUlwbz
         T4a4DPRfWws3Psjp3YzhXZg9g+QPVpm3bajf5T+W27FZ01aFJ8wpoTrKO6UsaD7L2qSz
         tNKoMMR1/H1wKrUHCqNJZrcoBLo7dlxbboAIGrgWq6baMNcXql9h4lGCrSUIR4/BLLfB
         FdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i3XyCP+obrtYFom9qmKraRyXOU/Ju05wWrz/nQcIo2w=;
        fh=79y2jPkMO8eRoawvWMRb9m4Rs5iK1YVa8KMtBvi/is8=;
        b=jerCZurQhFPUVDcDU9msMZ3PFb6q2sZk+MLGg3LRLiLmJBeYvgXNrGMbmyJgdxRulW
         UNlWvmmDjCQwXBLmd2yrmiusj7TOMcOrwy/xQWF2YqASbFNeqRWhrVHVf7HkA+QSmmoo
         JgVD/guHr81q+T3/EToQR8WMoi2i1EU91IVi1VZ4jfBIR7YCTqPHg+xQzFYkSkg0bZDX
         VjZzlDduvLpbTfVQixZ9sjvTb4RCXg8OhlEHDHBavm3XkdQiixX/4Ba2tP65bYzdpJ/i
         CWBREYXzE11ViPZdBDf5kxhySz8zumob8vHLn1XUbta7REIfp6kSOrv1rQw37D0WPgF3
         sKOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1775713078; x=1776317878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3XyCP+obrtYFom9qmKraRyXOU/Ju05wWrz/nQcIo2w=;
        b=IYBm4kMRETyw6Q+Mlsmusq0UgAH9lJ307+vTpYA5JLLGwqVZFq6vc7FflZtqnHa4Qd
         bnhCiwucaU4cYlHj4tAf/9hBJZZxTgRcmCp75EK+TPYLUGOotjINE9BSoZ2o/iCdEDpC
         I8xJrjivERfDRQr1MYJaotP3o7SasHItWfIPnYORutMvKODlqHYjydDmQlk7NUB3mxNo
         +s0/WGw90XGwP8NEi3ZJTPGWUEFGM7Yfs196n4yEt9YHGh+WQ/yHIuYXSduzlEPUW/Kz
         Hdbgr6+p7NnZEwidzCsC+/DD2PFzOHV64FfocbZaHnhJOZE87kvQJlZfRgp+5VwAl1x4
         tGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775713078; x=1776317878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i3XyCP+obrtYFom9qmKraRyXOU/Ju05wWrz/nQcIo2w=;
        b=QVtCPkeZqbHd2QJQFTr1KVvFtXLHycA+cKhlTBGLwrAILCkwTjaYZWRMo0LgtkVt1W
         yQlKH0ORXcY/+zbpFndS0fYOL12AXsn0pKfMCRzb2juLwIsSNkkti3OFAIRQepBCLJSV
         r+8LAbcFN9Abugqa9mECc1Q8ITEbYz4DTYOF1s1TB9VKAekx7qNA7ABdPPt4VTgtTuf0
         b4MTz05JQuYFMY/+QgTECu8PWt8oLlY3DOydBHCWag5dOvbBsKVg9/xpc/39hrl8BcRv
         /h95xR8OAj1ur8C4SVCOHgu6z4ZpRxYRbZp7FNeyKxco0slE0qbBP4u+GEaDxGmknQJS
         QwFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa31vMu5pP0k33MHNY0/7V34OXxxbxYSy5QHgaSbmMR0qy4rMKCNdujVY9mZ/lF6t0kf7/Zj6OfL6t@vger.kernel.org
X-Gm-Message-State: AOJu0YzkXgj0sa3NfyD4638kEs+2MRs5KKFVAJWMcSWcepUPKVjGeGLN
	i3e8irqSMhFHz9/5aNQ0Ostvh1JkxegBUJEazl+VQNWBlsfyTOSd2DiyYl65BSCPjH3cjgrB4av
	G1j2WZYtJ73w3w/fPJO2k091HLjbi9JhLn1oKabsqIA==
X-Gm-Gg: AeBDietrqF7A2fkM7p/lP4u05iFrNQ/yX5SiMRsuexs4s7/fQW7LAC215I/RkTQ/N5L
	kPX9TU1y08hPZnOE490NVIBYKFoAYwLDPDT2c8BVdAZPlIX7AqBsBfdNaO+hWZ3G1sMgAj9oTkz
	k4+E9VbIyJ0sMWbGKjm3d6Ezu6d3mYZcD4y7G5NASaQI133fyV7+a/zEB30RMZxkxmyuib88jbf
	bGQ0duRaMn1agNIAHZzCXpeK8ymguZNbq5/i65uFPTEJJGrvB5IfW3R6BNGa75ibldHI+GTOL0a
	5IwW+vkkoQ==
X-Received: by 2002:a05:690c:5c1a:b0:79a:b766:c034 with SMTP id
 00721157ae682-7a4d41b69aamr250652307b3.25.1775713078165; Wed, 08 Apr 2026
 22:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321083507.25298-1-nick.hu@sifive.com> <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
 <CAKddAkCZXmw95XN6ypd_i=JqkMUooD=riTisHUMrY8Kqkebbqw@mail.gmail.com> <adZo84i4jfoWZnb2@bby-cbu-swbuild03.eng.microchip.com>
In-Reply-To: <adZo84i4jfoWZnb2@bby-cbu-swbuild03.eng.microchip.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 9 Apr 2026 13:37:46 +0800
X-Gm-Features: AQROBzBOMRLMyPW1IxjFIvzYLs1WKX-TeC10rrZj9pOqwnojeXqFrZDa0fuKyLU
Message-ID: <CAKddAkC-okFpyHcbFXQwTFmLfwBdBow=mAJBxirEdbcrYmOcyQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
To: Charles Perry <charles.perry@microchip.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 10:41=E2=80=AFPM Charles Perry
<charles.perry@microchip.com> wrote:
>
> On Wed, Apr 08, 2026 at 02:15:19PM +0800, Nick Hu wrote:
> > On Fri, Mar 27, 2026 at 4:56=E2=80=AFAM Charles Perry
> > <charles.perry@microchip.com> wrote:
> > >
> > > On Fri, Mar 21, 2025 at 04:35:06PM +0800, Nick Hu wrote:
> > > > Add compatible string and property for the SiFive CLINT v2. The SiF=
ive
> > > > CLINT v2 is incompatible with the SiFive CLINT v0 due to difference=
s
> > > > in their control methods.
> > >
> > > Hello Nick,
> > >
> > > Can you help me understand what is this different control method? I'v=
e
> > > found that both OpenSBI [1] and U-Boot [2] use the same match data in=
 their
> > > clint driver which would indicate that they are compatible.
> > >
> > Sorry for the late reply.
>
> Hello Nick, no worries.
>
> > Unlike v0, v2 requires a write to the mtime register to kick the timer.
>
> A kick once at the beginning or every time a machine timer interrupt fire=
s?
>
A kick once at the beginning

> >
> > > Also, do you know if there's an easy way to tell if a sifive clint is=
 a v0
> > > or v2?
> > >
> > sifive,clint2 introduces additional MMIO registers
>
> Is that the high resolution timers (HRT) mentionned in the description?
>
> And last question, would you happen to know if sifive made a clint v1 tha=
t
> does NOT require the mtime kick but does have the HRT?
>
Yes, that's correct.

> I'm trying to figure out what should be the compatible for PIC64-HPSC.
> Some code from a repository called "FSFM" used "sifive,clint1" for the
> compatible. I'm wondering if I should add the clint v1 to this file.
>
> Thanks,
> Charles
>
