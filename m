Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5CC549378
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091407; cv=none; b=J1nGQB0GumuDoTPqnCn3luWMcSx2e4UOLp97DmqV3gYZa2XoXtwBTlpbUQCGMPCzu2uv6MMjGomP0TH25Kx5kh2lnVynPBE9yBLn1Lo6V2JoG24DNpjB8UV9w5xzET1q1XMzh88vLfdulbzrGCfMcTFAqzFUtp27gHZurCZUJfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091407; c=relaxed/simple;
	bh=0IK9+EwvsBoYDJYGUac8cxaRSG01Rz8fKvCBOkF5H0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koYCbG0rFaYhmIZ2V0ZPr+38G7rhnXM8I/R7+7Zlw39KHbPF1cZasGC1WPHAktEhV4CIjtwHFzVOCdAcsVy7tIp6WvDZz2+yQ1aAN3vAEFfD/52zAI9yNt4L1Zx87fzDPesPat1DA5o4VB6BAR2RYBCXxuS0ud+gi27QwVRzpaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfa7b2093so5750885a.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091405; x=1790696205;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Ivia3s8tcpv+jz42ruOpNgJ1iPkEln4U/VwumY2Fss=;
        b=fEEMQR/odmIm/3+xMvaSpcPvi7duF8HUBiQSGgmd6hKkX0xvY8srpgId8uBU6STdeu
         rXHAhu/Ui+Ltqk9b6ZmAk3DfBg0jtfty+iHVLaAXiqSNSx3GDWeOxUvB8npid+63Qpwe
         sELpTtFDeKvonyexipoCNEqbXCEkpl9d0dv402bQZOuE4dwsjanpxVGpYOmvDb0j3nbb
         7gJwedbzAI3a2UwqHVwxhDuP+QFQTNRjl7oMtE9MhB+UquXq9HTwQYN2rxzuSgbicebC
         QQTlojysNtPCSlAH2hKHiQioFyv4Zy9w+ocN04iDAPlO1LBJOFdfCb7XwQ/9ZQES9F0J
         5ruw==
X-Forwarded-Encrypted: i=1; AKwUvBzKmD8YkGEyBtfC98rDHwcvEYZTzhvJIFhoYA84MBIQm0GhftPGqmE/pebYonNQP+Z7tZE+eGF5Biub@vger.kernel.org
X-Gm-Message-State: AFuF++l0L3HVfOoA+gPF4rNwcdPZtMw1BL+pnK+abxg4KW5X+5oDNmWN
	LV1WTAH/L7kj+IUg0+XnVk6humEPO9ss7ab2a0MoyLHriUEVO5XzfxkgWXKsoJ1e
X-Gm-Gg: AYBFou1gnEZaGy5TBc+LRYfli8AEqW4UphQj68jpjDUaEDi9AjMznzhENNnRh3qD6vU
	QTSE/v/qD4Uq+dZcMr2rd1zELlaXlb5jA3FeLIEZymi/UlGPFZPq2Q5YPZ6S/3pa1lSN0Pw8O+7
	VEyUEPhsUG7oeq75I0+epFH7axKEZfhgQ3Ur1HenVX8CnBTzYNM2gfVqUYkogL5jCqt2gMm49GY
	1Brq6Y4PlfNG842SoDikFlhaS51a/LK3j+i6x/EMCOwbhVi7u4eQqi6qbwveDrwSdcS2jR0ziw9
	fXD0Ngt62UsRbVpqyN0A+imyvDqKv/v+Qcl59j2s6+jtbfwARyfpLRdEGkKGPNI4tWJD/+s80RF
	Sc4aYcAjcp2wSv3t3BplAbjOaJCZ2rreZaFV4Y9cJSB/531avqYwEMq6xgkR6HikeN41qlNutkW
	NJz/ZWo7h1Gu+rk0/VYlX3X+iZZs5WB2jQZGlPjckEGiIWBt0H0VBytNKJ2WtC2bpDB21DMguk7
	V/jh5IhWCPGErR+hDY2fdTWg8CR5759UatMIA==
X-Received: by 2002:a05:620a:459f:b0:93b:e448:2630 with SMTP id af79cd13be357-93c15ee9f89mr597200185a.72.1790091404976;
        Tue, 22 Sep 2026 08:36:44 -0700 (PDT)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com. [74.125.230.235])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24823976sm57885a.13.2026.09.22.08.36.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:36:44 -0700 (PDT)
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-5309a20a55bso502371cf.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:36:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw/Zn13nOABKKI6fUOZ65Og65LyBiTXojgDcGWrU4ztGaidygfKVXazfpojk78byLTDFB3LxDzJ6J6b@vger.kernel.org
X-Received: by 2002:a05:6122:e230:b0:5bd:b2e1:e1f5 with SMTP id
 71dfb90a1353d-5c9b58fd54cmr8860951e0c.2.1790091060069; Tue, 22 Sep 2026
 08:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260921110144.44425-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260921110144.44425-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 17:30:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUX9s1q6SdrgiMciGfHYAvCp1kFzGYL4pHf7PzzipEPUw@mail.gmail.com>
X-Gm-Features: AclHuK_p5w8PzHnOOSGm4t2QYnyy-nd81aSQvB28I4MJvz8KTxnmCW8kHjNnqd8
Message-ID: <CAMuHMdUX9s1q6SdrgiMciGfHYAvCp1kFzGYL4pHf7PzzipEPUw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: renesas,r9a09g077-adc: Drop
 unwired interrupts
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your patch!

On Mon, 21 Sept 2026 at 13:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the compare match and compare mismatch interrupts from the binding,
> as these interrupts are not wired to the GIC on RZ/T2H and RZ/N2H SoCs
> according to the hardware manual Rev. 1.30.

These are indeed only wired to the DMAC and Event Link Controller.

>
> While this change introduces an ABI break, the expected impact on existing
> users is minimal, if any, since the interrupts are not wired to the GIC
> and are not used by the driver.
>
> Fixes: 4d8d58987cb5 ("dt-bindings: iio: adc: document RZ/T2H and RZ/N2H ADC")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
