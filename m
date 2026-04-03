Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2039E38238F
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206984; cv=none; b=K3935NW9/9AJlt0MUnU/jlHDHzdAMSHF+hCb0/B2INFyQmNNRLmXz5+cTLYi3fq0gXwYQHC/foYdeyaPig/Ce+MGMBzVYqBKRO1/qK3SO78ZuEJaSjNZt7oDek1fs4VZZ5Wy9klb2CLFsFgP86k/ybqZ/RKMFeAz2BNqk8ASQMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206984; c=relaxed/simple;
	bh=cP8YSmhgi1YuGHKrhpk8W7JVu/It1uzDhcipHOHidYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3ah0gCCWfJKDOuTMeluoqmL0KXZi/87bhXt1+w51P8rSlCj1+LgJCRz8aoE1V9XK7cfbXDhSmb+smyeujK9OVUKXgZgnBTvgJIepluBx9EtIZVfeRBG6h8WWieGTNaerdKSAma5lfxFrerbMZ6iAoeai+85lchML6Hqwpsw7YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56d93355337so1271087e0c.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206982; x=1775811782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeTldaeFKLb1jw+lVjLCkjUpuPTt3MmHsJN8YKLGAfM=;
        b=I3ktceSiDcm4LhPACMaw4USHG08bXx/AzsZ+TPVJ+od5hOS7Dc02ucXorNGZUx7di/
         nCmtyO4W2TdDFg+UFkMgt2MsBHxTXS78TAmL7YQCK4sHW2KvvCGn0mo/S06d1QjocauH
         SVCLf82+Gj6X1P3w+JlIz1c3RMogGfTwkG/3pKb1cgDxtnWAOtU8/RNfV1a45HDhfBm7
         /Vatw6/xGg36uMFC5mDmgSY3uMeoWHPkph2llKdJQqZZP8Ov6FSNo0GkzdbZ3i0mwJ9M
         joXarVIMnbYp3oEm5oRSwSa3SI6gg7pBeIXRAqNzg2n+xi/TnV6s/6YrEr0KymgOWWWD
         bucw==
X-Forwarded-Encrypted: i=1; AJvYcCW4s64AQ5hUnyH5ySQDoHuqQtdKUbjjpUeAPD+loOFvOVY+Jgox3YYOSuhRJx/o2UzGVnyYcsTaGncb@vger.kernel.org
X-Gm-Message-State: AOJu0YycQvxwCWLOdmIL604cIWpavZsOPZPhCYCo5Pmq1Q82bqtVZVIi
	5NfZq11jBn6xdTWe1Ili5JV5stE/i2LdublZyWxVKx8sH+oYQkF8Bqj3JOwWhTgT
X-Gm-Gg: AeBDievknHDrH2KesMSprc4eGm4rX0N3qVgFSD2iG/SnpUX+yG/j48USqTG8vR/+jyn
	R/mmYeErPym4f2bjwZqwXgDWZThK10kEHDz4W99fWqX3oFE93MwqWKerwC/yBzSNZaMQgaOwbpq
	qYkvmKRu3ZkGWoTw+/qU+LTX9UGFj6me6qedH+xbHYjyOQJ8bgc1DPUPpZGG41ygMcADUI0NCGw
	Bi33FaHgqQfS/BVsIcIIGUNWbkLYezYSKMURVopZJxrelzR2P264Yp2PP2JhvInJb94Gl2pIwUj
	WBaOgJC8+zoaZspQzLW9ODRKOcNf/muT973LioksAtwKp74A87dis2sjbwCzPtTg6mGbBGehI2C
	QiLizxURpD5eWZcl/2OSJuonJoVHqLPahO+7LkjroHmwntuLMSeGIXgV6LUD6I/bTetL0r15bq7
	a26wkWm/GudH6sOwqxiqF3PldPS/6AJYzDUejDIplPXJV4ZF/S9aiJGWBSDyIB
X-Received: by 2002:a05:6122:4893:b0:56b:8b85:70c2 with SMTP id 71dfb90a1353d-56dab9e00b9mr809940e0c.13.1775206981997;
        Fri, 03 Apr 2026 02:03:01 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9bc41sm6158379e0c.11.2026.04.03.02.03.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:03:01 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-953b9fd8ebdso1142293241.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:03:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeE2wzu3WyefxoPDqgH9EdwE9iwyce69URIeCunUBvPt2Cg01i2JlsQ3vmug5Xz1IrGH1jDBJgQvqk@vger.kernel.org
X-Received: by 2002:a05:6102:801a:b0:605:8280:5e6b with SMTP id
 ada2fe7eead31-605a5006639mr842406137.16.1775206980479; Fri, 03 Apr 2026
 02:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:02:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWrKfQSO4LHdDG6KV5tKahzpxN6073Mz4kjtF2MQRH_Q@mail.gmail.com>
X-Gm-Features: AQROBzDCJPmdFGO3WLCOdZ77NkJ3IqtNsdBGX_ONT98Xal23qSXaiQziWiGG0kg
Message-ID: <CAMuHMdVWrKfQSO4LHdDG6KV5tKahzpxN6073Mz4kjtF2MQRH_Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: Fix missing cells and reg in
 Salvator-X panel DTO
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into Salvator-X panel DTO to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
