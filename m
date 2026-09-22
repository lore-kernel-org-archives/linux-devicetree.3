Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4902255C1B2
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091109; cv=none; b=uO7efxMbQSGQcq+jAn/up0Uu9pyA3WpTwyXv+yCYO4c+GgppE5nD/axJqgDmB8few0dIrTFZWlOnMoJIAmw7fhQXs8+qnrcVf/hGI9JZg5NSNgCAZ/5fiWEMjQscjgJNGNUXGBX7y7SRL0fDU52NuMrtMI5DHZBxeyczh5Pg0Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091109; c=relaxed/simple;
	bh=/ukrFcJMdNfUbd95Oysy1/fsP+8xyb8tq0z0ZJZKRFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lod3I1GuyD23cJ88hl7IA5YCHhtQd7VjcVeG+yLukLGUDy8yX7ZC35q7cI6kO6Ag8CCRGe9q2bGIIah/LqKyXHD0aNgZwBO7jLCit8mk233jVg2Y9tjyZMy5jAsTsyoqQ/2fudronHHBNlvNptG8sCO0BWqzsmfryqp9bkkCjAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so1734874e0c.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091107; x=1790695907;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A0rEYpC8SPWX296ZTPGePNnfJTd5Ihf4si8iFoObZU8=;
        b=ywQJOrh4d74gfxIN60vykee7GeNtbcwLdpJkGsHpbFGCX0OPLhInzM31i6fQBlETET
         jb5yENfENFc9KxfVntDCjBbdkzxyxxsSRmE0fIbINepKRTyO17wSI7kekUOiwBnTupE5
         jJQ/7HkwTRQ6x7yPidmpVGbP7Xh4t6q7MeUFXKQoWRluB19H8aESqpuL6+6Mvip0XWP0
         KnJgmqSRkC/hFU7aPs3TcaYwDJd+vNtPywhgYkxUsxlUggR/l/OQpIqcMyS3MAAktx27
         xZVwpTURYkAMc0p61gzrf7IjjlutQq7FsuhOqNd3tFq37BNmjnqB5ygxXaXapxs4Gxhr
         XdSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdPHvAHSbuq/teS5quu0wX3dJ62L/kxwnT/NXKLBKpQa8BwfNpaV47QzYe4lamuhe7PZgFlg34ydaW@vger.kernel.org
X-Gm-Message-State: AFuF++njbkbXOJxCL2T8Nw4oQ9qHk5B3d9qS3pzCv4XmPTGwjoDleTd3
	SPJ3aL9mtckF54VuUXq8n6EviCZrCrzWXMR1MtSqO5lQlZrJWGTEEhLE
X-Gm-Gg: AYBFou1ZSFY3aJpqcspZOzcYFHlIm951j40r7HVJlp9tZ3qWTrKO9af0ZzYen8g7Kmh
	zG3Ah4ODiRmBgOJEBS4ZbWYmtjUbMqKmvbc/0GYZLF2FqIRKFm71SEOB0bwFN/weCOKz1znsXGp
	ZeGdo5ujOQm0bGZwmZqJHRKlYmrPt2IIZLO5E9PcIV26JV4M2pORdNCOmYPpYWTb6nAAELLWUX6
	cPvnjNOJqXrBVX6A1NCXl8XFw5MuvC/QS3h31VKoib1yBG9fi8H101dVY5i1roOe4lhgpuGrQUK
	uVFXv/eOYCk+KI4Jv7OlAJ/ZfyVMOSSH4IGKwBdNG8XzHTm/AnYAnk7yoNQLsANbdJ/rfuqDYEZ
	X6g0WZQwdIO+w2v0RF8NPbko0CTwPSubFihfZ7acgBgIle7BvaniTP859KgzRzgAVnrIgggyVuB
	rhrBERjav40jyilgXPopuyG1xDDJmbO6nV3ULA5/ImDPwPqWN1pyEPoF5z7ddNCaJbpg==
X-Received: by 2002:a05:6122:e266:b0:5c8:4409:602a with SMTP id 71dfb90a1353d-5c9b593001emr9894841e0c.8.1790091107197;
        Tue, 22 Sep 2026 08:31:47 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f03c7966sm182021e0c.2.2026.09.22.08.31.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:31:46 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5168ceso1448206e0c.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:31:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBypieTk/3oArLdMeeLscNZrFmKuWvXGy3TDaPXBAJbg9RBpgl/UMnDNtmRfU9fXn3x+CtHs1f3Tgfal@vger.kernel.org
X-Received: by 2002:a05:6122:893:b0:5c9:c60a:e9af with SMTP id
 71dfb90a1353d-5c9c60af4cdmr7442761e0c.21.1790091105880; Tue, 22 Sep 2026
 08:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260921110144.44425-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260921110144.44425-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 17:31:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5srt57ABpHqXjM=hiYv+iAHBPu5LPsKb1u1N5q2ub5A@mail.gmail.com>
X-Gm-Features: AclHuK9iMHOIXZ9MmnycyGypUmOvSRrnhUAGxYcsZMveRI3d88Yc1uUP9CxLaUQ
Message-ID: <CAMuHMdU5srt57ABpHqXjM=hiYv+iAHBPu5LPsKb1u1N5q2ub5A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts
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

On Mon, 21 Sept 2026 at 13:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the compare match and compare mismatch interrupts from the ADC
> device nodes, as these interrupts are not wired to the GIC according to
> the hardware manual Rev.1.30.
>
> Fixes: 4ed27b4fdeb1 ("arm64: dts: renesas: r9a09g087: Add ADCs support")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
