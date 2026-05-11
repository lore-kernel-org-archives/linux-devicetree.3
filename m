Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F4E391841
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485149; cv=none; b=oEeoa18oL8tSv3sM9mw1SrzOq9D5tElQLnsmkCymy0gqIJAJVQ+jZB9AyAKADJevZL9Y2K+yhAcLw8MOv1nk7fUVVFo2Z+rgmslHu3hBj4B7Va0Dxaaw3W4JlAnGgl2AX2/ojjo4hYnHMq3TAJNfJuKNnpmkiB8/OZlbWbwgYQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485149; c=relaxed/simple;
	bh=s65DhKGzlqdgx1hXmqJEwOu0B9ggiJ8RQ9fMSjlzAzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxhAdkDodfbwXzmYPUhi4zjBBXHjLsjAF0OteKVDxglyicPUG189cw7aCy9BpIOJzUbxt5diE+tJfv4XZvDnAVQB336dg6Z7DrXgwcKCje6aFUm65v+tZdyyMhne4T9iTHPqQINH4+WepxQNMWPc7ldeyj+hoyzk0ppOgtw/jJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5102582e23eso29518551cf.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485141; x=1779089941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ1YAZJS3C1bc4JV8cVyy/jeADBGGrNxPHy4hNy4Vlo=;
        b=sqpP/bfyuD8uOEG50GpPQBdE766grpUWdYTEv3ANiSs08tx049r4I7MRleecfn81DP
         OxCPCTVWaD/xobf3+1/ZUVBMufd7QkV8kQH405EYv7Qr1jaRbA2wbFKx0ZEiaDoObxzS
         HAFQRAFxMphGvVHaCrmLaDbX/ISKFfv2bnnJZtVui6dw4043MI2h2V9pgCGTkk1VcIaU
         cLv1pJ1KwjWRTrRobYeNMwV63TGGZolLmaictrmwKJeORL2giUHqTkf4MLS6vxdrYsoo
         ypD0qu1sPRwb/zQqA5PhuGJPbX0ZTAYB81CKAkPZQkG9h8xGi7M7jJcXsemQfBtxbE8G
         k8gg==
X-Forwarded-Encrypted: i=1; AFNElJ90A0zPUXXbFSSM3mRoqD7SCBjg2JxOjE6yEdKYtyo7FZkqSWPJJzOvZ/AMSB4BlEitKiW5EdpMxJ13@vger.kernel.org
X-Gm-Message-State: AOJu0Yy40C4iPt7UIDa5d3SBNpMc9TkgN5xsQbD7cNhYLWUcEoVhH665
	ysJdvLIwpuuwi1IjL010kDBALiI0eQ3SpvUzjf06PaCnZLLc+89RPd3xXV02ERAz
X-Gm-Gg: Acq92OGf94aYD2sWH5hhG9op9aEODnTN9J5hFxmmPioE+Ax8DGqEtJuN0Ztl6MJYdDW
	/c1uQJMqZ/f6GO0aedpK262fmRsOhlVXPG/yY2ReSJxQsyLEdx45TfnNjhnIDDduFioMEVvbwpq
	W0y9lX883YovXNd3Go4MPV9GIjCBmWU3rc4/6D3rW8yEAj7NRHq7LRBK5Xce+UpBFQUK8qzbn+4
	pdH7Ke0ynsY1tz25jNX+86G8xyKnDe4bFkLiTOIVw4dI82jjLstMXta44M+HO0DDyhKLm7ruf++
	orGNTmTXnI28LQqeSO6N1HQ1tItncw4pdM0mYmxuQiMnXjWPpEEOx6H8wmupdzKW1TdG0swHGjP
	nY3MzH+maklQERbMgDuKT+wn5iLmBcIy8AvphDIoMjpO09aLTMMkPHtH6LcFPRxIU3aSM3h9Jzx
	J7PkBTuEOK9sLABy3BO11yCzIJ8BwwQOrZ3EI59Z1WV8GeAFxFuu8Splqiti2KrPkmnLEp4+b7q
	bhCW/YiLt8RnA==
X-Received: by 2002:a05:622a:2b08:b0:509:348f:bc1a with SMTP id d75a77b69052e-514a0a91fbamr119326371cf.26.1778485140807;
        Mon, 11 May 2026 00:39:00 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-514a956cad9sm50004871cf.9.2026.05.11.00.39.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 00:39:00 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50e5b55062fso28976301cf.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+RZxQXQ/mwGlHH6PATaw+y5cclXXheGOyqdvFVpy7H0ISyjwByzutKjPsej5vHvf06VhkX/n9YtpRH@vger.kernel.org
X-Received: by 2002:a05:6102:441e:b0:631:3bbb:f23f with SMTP id
 ada2fe7eead31-631dc2a4197mr2908988137.26.1778484660482; Mon, 11 May 2026
 00:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com> <20260510084303.122426-2-phucduc.bui@gmail.com>
In-Reply-To: <20260510084303.122426-2-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 09:30:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrPChcwzbwrNLZBoRXGQ-Gm4e7UwbOm9gfAzQ-TQzFqw@mail.gmail.com>
X-Gm-Features: AVHnY4Jl1iI9-jny3Tp3PAtW_VwhT3ITP4kLVRV3eN_UqRHFiAafjgaCkehlGn4
Message-ID: <CAMuHMdVrPChcwzbwrNLZBoRXGQ-Gm4e7UwbOm9gfAzQ-TQzFqw@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: phucduc.bui@gmail.com
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi Phuc,

Thanks for the update!

On Sun, 10 May 2026 at 10:43, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
> accessing its registers. Without this clock, any register access leads to
> a system hang as the FSI block sits behind the SPU bus.
> Update the binding to support multiple clocks to properly describe the
> hardware clock tree, including:
>   - SPU bus/bridge clock (spu) for register access.
>   - CPG DIV6 clocks (icka/b) as functional clock parents.
>   - FSI internal dividers (diva/b) for audio clock generation.
>   - External clock inputs (xcka/b) provided by the board.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Please drop this tag: it is intended for giving credit to the person
who suggested the creation of this (full) patch, and not for crediting
review comments on a previous version.

> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
