Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6FA2874E1
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609411; cv=none; b=VoMtvZibYjqKbQg6vIEguoSkSZVkW/uRfoMJyNKGO/vRNK3mYk8KH5YdrnrOqQHk+SIMZpa4ZyYAjerfDoNqzSzGnVJxkIyOrmF4T+utENSwczZTnnMnefA7WbbZo5nPKIhwEvQpOIaXS10aSYOD6T6YPL3urWPgphRCxAGgpuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609411; c=relaxed/simple;
	bh=Ywx5XHcvMXEATTIxBq1F6f4GLGgI9GxM1jMgq6ZA5Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PK9+cNtbFMpfvbSxqI9qQTP8Bd+cChiOVr10UnRP1Oj6lIU5ijrEGLhwmTukthEFZBs4g3OpZziKHd5JphzL/SUFAZ5Za7zlxglxuTQ/9Q7XHG4L5p7OeUUhh/ALnqUA5xibSz9Fw8k1/fEglOERU9xSgv/3YsKOxCJsZe5ytn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c029505b389so169036866b.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609408; x=1784214208;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhJA8BeE3pPaGDlrUUvedWi+hMG2tf39b7PewxLsBUk=;
        b=CgV5MAHjQRk2SbjjtP03ah9IVO0vJ5ODJmD0YUGspzqEJF9l4CfGvOqE8C7kK/jDEY
         HL+ZSYP3g0lBkw5ZFQk7YJxGm12u0oMWzx5wc4zSCh5Z88hFtI7bj/Ri3rzlCb6lE0O4
         LyfOpfmlaGmB09KeRQ/Eh4V1HXeDnvx2gJVpObuOJ4WUm9rzo6/y1m2YNzqF9jmnWFvq
         X8yPQwavVyBcKcxiPoAicDZxwMN8svsgXs7iwOAJF5aI6yKPTSVIKW/ywJoz4EdN8p6J
         ScmmhyWMVSrgzOfsNWZKv2dtZrGVNoMFnBU9KOCbKBy0M6sJtqwOUYnhERoLOFM2G7O7
         UNqA==
X-Forwarded-Encrypted: i=1; AHgh+RoJ8YCF5r6C9yHxBP1Iql+wazm+q7fPdFRhTJ7WvZhvYZdjYX6YC/dZFTCFrbHBfRbx/b8MaqUXR+6l@vger.kernel.org
X-Gm-Message-State: AOJu0YwOmUnIc/8Ye5YPRYCgf6zf8sCmRA72lPe6lJod7atklIQAveOZ
	V8zJABpi10pvVbWUR4hKnUrJvFRQIEbQbceQsco/+ktlhqvADQ/uxuliNyeOnqNwEvk=
X-Gm-Gg: AfdE7cntZmjwsO0MRDV1Ln8s5E5FfvsRR7IHdd49GOuflr5gaE32pcg9nBWyGdr2oEg
	J46WXpe3rRb8kt+YPV9OEmYPNZm0uB1495QhfIcrvIlhbgbVb8q4u+zZJqW1tR++b1OjC4vgK3c
	f6IPQlJbbVNV2eC+uktKLFEI+uJH7HORuE1zorgjtnU2YJPDG8t+7m6F244qVKalC80VCX3hKgA
	vr9//V2wFSHq50oTeEiqtZcki4/YrL2CuHWEgeypgurnsxaqqySQd4cPKurqvhoDvfLf2pJ2u31
	uLV7TqpioQ5UGpePKkJXgtSrqrvdyftifG9Xau6tK69AUcFuzr5hOeqEDB9dp6XtlAs1nYjpVDR
	JRWTXw1kVRmUeI2RLrTlwypFqs0dL7rJVm70AqS2+W8cXqDN/44w8/nuacobsOg8lBUh009hsRe
	vfn5XsZ4uqQN6KLTdESD8yK1tB8gXEh73qIsOR+zd7Yfs8EPw0Rg==
X-Received: by 2002:a17:906:bf45:b0:bd2:15b5:bf60 with SMTP id a640c23a62f3a-c15e740e2f6mr153623966b.3.1783609408420;
        Thu, 09 Jul 2026 08:03:28 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad844cacsm516185566b.19.2026.07.09.08.03.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:03:26 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba320so2447112a12.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:03:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RofiO82zOP5dDw0KH8DpUtUTndK+Fhwy58tu60y5OELDx6pOSItT8VWpEhJ2oc22gTCh6dF5Fzq0liO@vger.kernel.org
X-Received: by 2002:a05:6402:a29b:10b0:69c:20b8:f1e with SMTP id
 4fb4d7f45d1cf-69c20b811camr18850a12.18.1783609404940; Thu, 09 Jul 2026
 08:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260708172849.227915-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260708172849.227915-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 17:03:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ04fbFGK5vOyQF6ED9d=1bv=khtPZOZVUv25r5TKQAQ@mail.gmail.com>
X-Gm-Features: AUfX_mwiu6IJcbWIAEAJjxVY7iWOVhxZgcxDH221GNBhFtNI0GgJXWs_ZUqzb1w
Message-ID: <CAMuHMdWJ04fbFGK5vOyQF6ED9d=1bv=khtPZOZVUv25r5TKQAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Fix PCIe dma-ranges
 memory space code
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 19:29, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/V2N SoC supports up to 8 GiB of memory. Update the PCIe dma-ranges
> property to use the 64-bit prefetchable memory space code.
>
> Fixes: 4c443296ff17 ("arm64: dts: renesas: r9a09g056: Add PCIe node")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
