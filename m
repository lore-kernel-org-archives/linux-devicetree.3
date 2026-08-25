Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835FC426431
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660604; cv=none; b=jnNLJZngIsPadb2j6ck/xpzeWer8/UA5OmNdqGdBBJsGIjxN//RtFleJRnKrpXzWK+AfinBuupNJ5rqFKhDbVwOjlpJxAc/bUvYJqhfV3mPg/K/0pVwDM68aaVDNnoBGSiJLNq8sFrr4aMr83goxL20vyfUg9HcS8dpGQ7uPHZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660604; c=relaxed/simple;
	bh=LOeXVgjlcIXEQ1tqGQ4m9pgLcIwtFwgr8SSVlIDD8fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iy0DMDOY7Ng1/PE+zXWcz8yOQOFY7E1D/rRYv5YLPwckKNwbuYPjgkpE86mQxdx5cF86H6kPDfemq5Dk5d7W3nalzHSo+QtbL8TAkSdzq7I30X/JuLcdNi4/yaFeHEmkAuELl3AUHV1+NMrSfFiUWhm6aEvOP44zFAy5c2jjogY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c38568d9e1so2108988e0c.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660600; x=1788265400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VSaEplTD+A5C9DDSEOr1c2p2iCRAHpRcr8ETlhYSmI8=;
        b=jtJR5fRRGM6qVWHOsQS+btsYLRXasa858/BhKkpJWFAtrxTsd4JeAkLNlT0NH4+HXi
         E7OhHMUMR4F/WMQMDq+Ciz6ZzNJdNhFHLoUwPMntydviej7leT76xYmf6nj4M+StZqXl
         ECLUnaYl8YZFhy0ofVVhjUghtJsknoWRUzzKfGBZLUB8Zp5PxMyRBETmJJNCYBsgtcFp
         tleabT90nE4I7fYmivypE/cjLBNWWeTIhMk9iEvfqMp7dyb8CaGOdGwJjXGhUtvaBMdK
         GANtDU2k9fHb49pFwBy2W7BMKxiC2pXKiwBXkjPk0T7tikum+wFQF52eeLa3Vl8ot5LI
         y+/g==
X-Forwarded-Encrypted: i=1; AHgh+RotzfB5tbF3T3W/9sXgzKquCE+6a8SnFEBVlmJ0wrY5Prtm5saXnYfj4bj3e1sBOjIYeaP7EI9xT/VN@vger.kernel.org
X-Gm-Message-State: AFuF++klBjRX+uI5eM4B05Bfyt+1XGw8D8zIsa+3fZcKiiOhQmvhgLog
	mp8trN5mTDKr2nDYh/l4rWpvKXav7FGiWJhwNM6uNIa/KGIE7YHrdssVeAUcFlB030o=
X-Gm-Gg: AR+sD11g0ziIRNkqCdQY8xT6JcVlPgC6ENrrmlqzDSLD8LN05PlMXqZJbwYP4QC7ctV
	al6j7kfQj/lyYO8HbNl5COX9IAQnuUqYnbtXSC50J24fhB521KsKomL5yCXCOpfmx/yf0GvjlVO
	nux74jOBzamqkxD67sKeOh445SA9I3Ztjw2giWPbjl/KmT7tdJmGIzt0W0FOlL1GqDeE8WNLHUv
	zfVEL6odmEXmtDk5i7p8h0L9GuyNiLEAu8AXwV/vAyTqBwLIgR9tqKYw37zgJDSabI4/mnwkerM
	G6xULuqYPd4AfAOHRYAKh3/Mej/t25YiziHy7bn50TZOiJbHA0reofomd0FXKvrYgXOrUeFZIYO
	ziRgdDyr2tQpbDsiChfHPDGngy8maaYqVF885Picd8W2LPzKrEarU3aK2zT357NcDC1tf+YJroo
	hIXIiUQXQVpsT0q2YXi2Z0fUHVK5FIWK3ZEOxD8NRnTrUCOjwzRXZE0QFlGMy4M2qtXz4yuJZRL
	kGSn4kyUydXLDCDTaMJvs25pTI=
X-Received: by 2002:a05:6122:c91:b0:5c3:61c2:9ec6 with SMTP id 71dfb90a1353d-5c5ff72d7d8mr14156255e0c.7.1787660600038;
        Tue, 25 Aug 2026 05:23:20 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623eee7fesm5927995e0c.15.2026.08.25.05.23.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:23:19 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97bf91b2e6eso962987241.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:23:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrjebWVqmEOE+XHvu9r2kWdWxkHFKVGqABATz0hARP806cIui180CVUyVqMWgRSNXkLu6M19PGVBdzE@vger.kernel.org
X-Received: by 2002:a05:6102:8020:b0:780:2dd5:cbee with SMTP id
 ada2fe7eead31-7802dd5ce25mr1216153137.0.1787660599476; Tue, 25 Aug 2026
 05:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:23:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0nnZNJwaPqhYJ05ECfQ-LcqcYQntE9kKnGNfae60zxw@mail.gmail.com>
X-Gm-Features: AcwNN1WjYRX8O6IrodLLxR7Yl56xuPwu0CaevncebLMlgS2jY6mtOAwxWyPEJUI
Message-ID: <CAMuHMdU0nnZNJwaPqhYJ05ECfQ-LcqcYQntE9kKnGNfae60zxw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 10:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable RTC support on RZ/T2H and RZ/N2H EVKs.
>
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
