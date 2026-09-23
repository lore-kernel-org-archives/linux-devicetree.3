Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C37547A0C4
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157577; cv=none; b=m9TWqfSzyt3jxFenBpX2CJFKiK0qL2ErT6pkxX+Vy/O1GEvyBK8guufp5+Y51aDsNB/SKASWN2XiEIa1LqexATIYBy70hPDRuQW2HJM3ZoM67DplGsZK8eG+rW1FFzqTYJDmd9OhYjXNKhf22Sigplx7CI0gdDGK8ylQVXVIxjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157577; c=relaxed/simple;
	bh=CFOCKeg4iQzVjtAet34BLf47zzvngdQLba8Dz89LtMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qzDGqQ+U84leFqGd/mYXHolYpQmKgwJuaiWX6myXLNtdRspRB6kCLD8rPGYkWWCi8y2zTTXlBJksczpXCEiCe+OTwvmc0evmuNxoFbo+Sb1J6+/bXcN8e8smVUDkWMaC25O9DD8E/UoJ3dy0BoxZFcwJe1icTsDJfQ19eNRePiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98334af2ca0so240270241.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157574; x=1790762374;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZAUfWTzk2vrn13xOUws34cNgXar+RdYHbZnk3nf0APo=;
        b=HjWerZJwxZ7rNMNcL34zBFxruEgRTTM7aJ0hSIh0jsqo0L8W8c78RuCqIdliC1ZIvc
         09UQoCaqaZ5xm5RfuF8CahLSXb+zMteO2Cg7xX+wYDFK8Wmso3BQj9YStFgluVF1WaLZ
         c1Ukl4uzRh4iV+pPRhYMZX2MnNKkZzNOcAGf0oCYmyXJ/jxdaZ/avOVrP5MnYCc6qtQL
         Tj2P97tZIkKNFNknR1quwMwP2squa8aESN3BXJEj0EvDnR3OA1EwJjxzx9SzQMckdaLD
         OI+FM44uKzFsZsBIDRFFyYZa7CUYmAh25F9mhQTMDMAuVN/OtKVsnGlYgzzXvMWO7EID
         wAhw==
X-Forwarded-Encrypted: i=1; AKwUvByZqyRcH6NhjeCqS9fUG/EwYlxYcs31qBJx6euhRsWmEZRxzePxRvnKl2X0a9ioRhssy3C30AqrfZuZ@vger.kernel.org
X-Gm-Message-State: AFuF++nbHf4oWRKe3uNvEoyHJ0LzxQn0iNizMFxgw9vi0BHuG/U7MaJ0
	QGJr2fOsgJM5UfT+NGXSR4u+XHfShMz4bwD4OkkTXXTNZ5aUWkjVn1BHRodR6JmtG5I=
X-Gm-Gg: AYBFou0PnyvKFplKQoglmWDHgcOVy00jV0cjuv9LLQkDl4dkwVyD6KzxYJlLWeEuDx+
	FnWO2NgEiasCoRurP52yV42wIhO0Lah+eOSHfCVskVFyCszrWeexQvLVzMUK3DVzCCnvFpBVg+o
	+DjUskUxVi+zObQ4UBg1wsGtzWKLqv5UwK95xirFthpX/s+R6efXPqgczxwuHYa0b1d8ocwKNTV
	/Rp9yPnzjOWM0mv+coTXVuBp+LySLUP412zVQe2Uo3oKOWxqEBUQQCpJrcTpaCGwBjAfwmMUEze
	j76aN5Vp2PlSpaHnOPi9+IBTeRVsqnvyiYXuC9x5AkplUJPCm1AqCcvLRFEShFlKKzco4v6r4Q4
	toB2NCoS6wXy3BMEIy5A+8fMFI10JDbriunv9CUP+B5IlhSr7KatJVucrHmvzw4jniTL/IUdR/0
	Y3QHh7Loi4PjM8ycHVJqMlY0JD2UhzdIK/TZgQ7u4LvLc/0jSV1m8HmUR1vujICQfy8wYyyZ8tW
	Clc04LA4UsJQYtSJPKImroc9CXDL2Fvy0zT
X-Received: by 2002:a05:6102:b08:b0:7a6:c647:cf58 with SMTP id ada2fe7eead31-7ac1b31038cmr1865142137.6.1790157574139;
        Wed, 23 Sep 2026 02:59:34 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf65b6a0esm2911019137.12.2026.09.23.02.59.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:59:33 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78564421fdbso242042137.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:59:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwmiyTpdXt71pB7rwUnq2gCGWHAQBbBrgZlF0jhiLYAGADZb7U0m50H4+bGRbxKbLOvF7wPsCLv0UmX@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:7a1:fa0f:1106 with SMTP id
 ada2fe7eead31-7ac1e65caf8mr1733659137.36.1790157573285; Wed, 23 Sep 2026
 02:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org> <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:59:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYe87S_fEQo8zj_VujmRB5yQKyKCEDazHGM6qk0MbOGA@mail.gmail.com>
X-Gm-Features: AclHuK8WjDB7V2CQNwZO4G_mraK9sglGs33f4ItFn_8kEnfCQnx4H75r4eqopEg
Message-ID: <CAMuHMdUYe87S_fEQo8zj_VujmRB5yQKyKCEDazHGM6qk0MbOGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP
 and IVC nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 15:34, Linus Walleij <linusw@kernel.org> wrote:
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.
>
> [Rebase onto v7.3-rc1 and sort the board overrides by label.
>  - Linus Walleij]
>
> Assisted-by: LLM
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
