Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA6B5616B5
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968012; cv=none; b=FszQ6dMcaBVD/oI2CsLS2SFfvg4zTiukrhEXKUFiOTeOfIrq8xCs11AopMLK4AO+004Wu7b7aebBZWRg0kgP3ZkZdEXB429lElWChsOlENheqDEpHFmprEHQorc2HjAzFd/szftcrgdi2zH4FdaxKJ3Y6t9izNj45i7iT8LYdx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968012; c=relaxed/simple;
	bh=NMIEtDYycWmV484GpSBkjLc+PGlo5yjc2c6VK3ydHI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TltjbjM+9w6GOK2G/J5GFSGLy6eZpaPec5yj1j/5hUHQ/39l6Hw+IrkJR4aolzCzTbKiWhgyaHY+Wr1dNERhFqxwhyfNWeS9yBZtSEt8TJHBVXIEFOWap8+L4mPxh87pvHjK7m04jjFyVQHAGKqxLkdTXoLgS7N6etP0UddgBFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c7afda4515so3409872e0c.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968010; x=1789572810;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=seHJEHV+vbkaWfT2PmVXZhUQLZRva7SU7v2d3J1NVwM=;
        b=bBj2fL73UUo5LOMTdbH0LDMgZu6v6z0bh5qsVKU2aASev8STXqT11x/F05j1nXbV5Z
         rhr+AzQTsYNA6wK+tdbbFZew+QhAB/f0kOF9jcqIZt+eHfCg3vja3MH7GBg3JWzJGsLY
         UOEwQlL02FvSByKEHShjqU9IIXy+3wFMEnLzCbrW7GBWwMQF6W0wqgwOea1G6Fz23jKY
         EUM6dob33iCGj3LdvA9sPyv0hP0MeY2rfZZUL/ArpQ32C+MYNGR0cms9+wTUpOCyTwuU
         r77EMmXOmMMz0U/GfoiZ2SNerq91LPl3dNOrz7BLfcgdjuBjj4L1PTwwLcJ4EekAox5g
         BSxg==
X-Forwarded-Encrypted: i=1; AKwUvBycGMK4J3S1pRtd4kceHHO+UnvXx59pCr3a//BBHeeqlylnoUWMa75f0wvFtl3NTAz8YHO+KJUiAjEp@vger.kernel.org
X-Gm-Message-State: AFuF++nwtObZm1DPUW0/2Mmzyi7s2mJde2Te3n+6tuoYHbIZg6r48oKH
	svmA5zDjict8hAbV6YBU0quZdZ16GOWwwMJhLOTuCVc+JhbZzrUXdd2Okaa7FTKh70M=
X-Gm-Gg: AYBFou1ZOec6fitOcTra72/fpNzUwsL+7nvZNFIwUeLcWp4OjcWtHmLSrAS/lzFS/Qj
	Bo4KQgCUmsw0AQbJYub3xIzcpTRhKFY+l5VVVye5oG5tuldSKoRUNCy87CRp8lKPtQpFi1+bc2L
	JsTzMJtgQD75h9fRvUeB4G+Ae0VmOkbFa7d5INUptSmUtcSvq5JxZHk7H7qCmKZ5rYbMk9yXOSQ
	OvjHz6xweQTa4P0Fe8MIGqzHkeMFUAJaqcnHTKKz1nGnv5Qjd20a/1o2k2pJYLh3hUkMfsnz8LA
	Fn/mPwHFt88rwxzDSCaUsaKvYhc9h0kt3mrhlwTyKdlyNUoiA1LSQt+Apyt1ighwGqHpcuR3Anp
	o0qLGSf+Qf0Xb6A+U0kdi8HputYbl5BGFoiMP1H67FcZfsfk2D2HZfxQ1UhyN4vZl+PGsE7HoBn
	oivDnwxy2xZu4s18l/eF3KUYHR07RTzxYlXbh2K6+vMYMwxO3u0Xw+p7rIEvFfWMuwelBO6Vcvw
	gufkKiOVs131kyRFPT8HX38HugNCR+4Zeui8Q==
X-Received: by 2002:a05:6122:4689:b0:5bd:81fc:ebe9 with SMTP id 71dfb90a1353d-5c7ed087c0cmr18801725e0c.0.1788968009704;
        Wed, 09 Sep 2026 08:33:29 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1d832sm12523256241.4.2026.09.09.08.33.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:33:26 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97cad2f51edso1829489241.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:33:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwijRnZ7z5utXduOGvHBARZh2gg8l0RFu9D9JWyVr+hyl/pWbCq7txwqQjXd+uFwIFyQvV317fi3l0f@vger.kernel.org
X-Received: by 2002:a05:6122:4f82:b0:5c2:ac92:eb18 with SMTP id
 71dfb90a1353d-5c7ed3f6d2bmr14626613e0c.7.1788968005930; Wed, 09 Sep 2026
 08:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:33:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsfPrHQ-bPSbZnQq8q-t6erDebddnf5Mr9+6L-8oXC7A@mail.gmail.com>
X-Gm-Features: AcwNN1UdM4cUGYydPQaEaeecPmIzkWQH4nuP4PrjWCOhXFLM5sncau6pHe3OeUM
Message-ID: <CAMuHMdVsfPrHQ-bPSbZnQq8q-t6erDebddnf5Mr9+6L-8oXC7A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 18:23, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fill in missing #msi-cells = <1> into the GIC ITS node, update
> its-parent phandles and fill in 1:1 msi-map .
>
> Fixes: 7fe73a3a3f2c ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As the original commit is not yet in soc, I will fold this fix into
the original while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
