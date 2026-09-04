Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE174CB8D8
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535421; cv=none; b=qkdO/vgmBQ5QFjVLJSj3JlyTOpiRwy9NV9M6dTC1RhwUq3SYLaBOVYQ39Kbq1IBgGrhvb2uqxsIuR5Kp2bNkgy+GvnjS+Mfmvz38bazvJ6UXWw1/v3rpts4JT56o79N7X/f4pEr7Spn6olRlGm20M9OKqRvttR/OpptCYdLo1Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535421; c=relaxed/simple;
	bh=nCrntIDhyuwP8BQpdMv2tSN81fhquB9QOVe0SeizZYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScGYfme7ffndhs3+5ZiOyJnrATv4vXuBXXXQMl4tGh2PkGXFw/x6YWaO1s5pJ0tpMxoYO3JKQxvPohd6Pxc8aG2vqd+YUiw9qL10ywzHEvUEW9GEfVQSHnM5N0YU/h2rZhCL8Y/9ubeSKz4vV38AFbNFml2DntK7DW9kMDX5nSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-782e0fc1e55so385434137.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535419; x=1789140219;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mr7nrVkZKYZ/vaRmGYmX7E824Q9vDG1RqRG5Sn6gSeM=;
        b=aAyrSHSvKnyK4WNt6G/PQ9XmPv9F/QE9d3SSegBqn4gVuDpxeZ6PU21IYBaqzU/IlI
         vg3TJdOhIlYC8C93RVWJfx4v4L0G4eKb3gGwXno0jRmId364GrGx84chRv8+PILMtZHj
         TA3Y6r0ypdFMAMpcYI48uTwCMHPgIIC64j4o/A2Dsl0rMLwjkP7LLSlLDdylzxiqvndX
         Av/vGhpuz/ex+85zecGc3PGRlrkkrjMTAjqwOPw7mv6SZPO/ssC53O8wOPwb4IT1k01c
         OeFQAYObJY1DLd8X6eJlyELRw/0VEauCJOHp3ToBR0+BpFOm+022xfaJaHheK4FaTnUC
         /Fxw==
X-Forwarded-Encrypted: i=1; AKwUvBxkMRzaR90vUg2VBJ74Y0A+U7K2eOCu1IQ5NwGGuo9jmK5k6msj4o6XrvaV21zbwIsHXL8p6g4pWQgv@vger.kernel.org
X-Gm-Message-State: AFuF++k0hCyZyBEbRVhzJunv5dNaNzeWXK+K6bIRPRUAZZ2o9x/9qN0L
	jcbTkLKtKF7BPUgDRdnJfC/MPZXrqwt6HRaPf5coqoLjm6S98SHbDRIf6LXsYhkp
X-Gm-Gg: AYBFou3sYUS5yLxkbb29ZSHdyLz53sZFOziMQ5wgG7izWCcYKtEYOTK2A7LQIrWO40F
	zYh0+vGCYr/vmzhA81V89uTxnVo3yPsaekzwvNfkGTdq5d9s/7G0gEDnAmSJxSFb5EkAYYMVra6
	Vf3/y99e0tRS5eN/oTOX5Ye+lTSHCusnx4mPEj3JBQf2C19/HL6MdLs1Ucx1UXdliIm5vX5yjuN
	b+81TJTgAzzzedYVk14Jco9WMZrmL6CGC/mCtX3l+C1Xu92WutP/JF3JelVsCrEamAvUTWZ9lMR
	88rmk5/WoQ0XJCHVzo4/AsDecbeU0d9FRBU46nd/GJxFujMe3esikhGAsJPYaLime30D6Ktmmfs
	kt3Rtptkvas8Vh92VjErCB7qOcgYVnwNNFQjSSaHgngMI2sx7Ffm3wT16w+7ufc0j434DxWY4o5
	vuMTPKOUXTmYELqet3MBsykZzC7OpcnJDxOYM3hl2pjTejC9wme8dMnBGBc9kPKyKp6ntiRq9et
	+6fFbk2bH4K1HvECV5YkJ/uN3XnNw==
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr2008395137.7.1788535419010;
        Fri, 04 Sep 2026 08:23:39 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm1990957137.5.2026.09.04.08.23.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:23:36 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c7afda4515so704077e0c.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:23:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz/Gdjzg6TcnTmrsMl7Bz2uOJ63A/Dx9htFcHn7UxDewpUQ1KegJ8a19HgWRBhUFsHwPQgOPp6/2Xm9@vger.kernel.org
X-Received: by 2002:a05:6122:32d6:b0:5c7:a3a3:a4bd with SMTP id
 71dfb90a1353d-5c7ed3a528fmr2695851e0c.4.1788535415032; Fri, 04 Sep 2026
 08:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:23:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyPbUEy1sPZWmosVtL9GQviEB+d8RW8Xus9wpxZREgRA@mail.gmail.com>
X-Gm-Features: AcwNN1VarzxavclKk9EMuPnWIySi6CxTEUYbBFaUC14MO-nuKk5tEQAZbU7dyfM
Message-ID: <CAMuHMdWyPbUEy1sPZWmosVtL9GQviEB+d8RW8Xus9wpxZREgRA@mail.gmail.com>
Subject: Re: [PATCH 08/10] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

With the cosmetics pointed out by Krzysztof fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
