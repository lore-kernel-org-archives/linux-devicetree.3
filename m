Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AD238657D
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207005; cv=none; b=rbTRWow17c2Z2PlpZlPQzK8wTcRyfInQPDbm/AYqfH3tIZHfONwvSR2mm8dPjhmxbxgStPgNfkiZQd1yDtXPug/U3uBfm+pyoHChvEVt71rIdDMpIdQ+FYOusDL5p58nQ1IwfJms+hZBMtDU1oimHQmN/qQ/GrF9NpxDhqzJGMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207005; c=relaxed/simple;
	bh=JEJTNt6yJrQY8C1EF2vPzaNXrIXOVaxrHd5bFcJyLeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDwgFyTqphVfpi37LF3oUrwhBazuJNSDA/tiK5R4e9MW+z/sPM3LTfeo6wAhZm1vRpXQ/7/DRXc6n3yFhrPgGb2eiUn3QJjlI+aEK3n7/EScU4wBupy7RdqP35qzq6OHQ8fVR1ZbHGQXi/Ln45kwjCb08wsRyuFrohvRsOWxWao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5637886c92aso763490e0c.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207003; x=1775811803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrMS3BmPgb8kmzZIH9W4BGKhy4JgCpGMmlju1jJRqIE=;
        b=J6iFacZme/g/t5wNTMX6V2mcEqqldP9lIPs2el/pJ+hzxfq64+Altjdn2i5rs7EeT7
         +y4+IvyrAdKJYnoZBy50xNnBMdj58dckBiyEGtEVdjVInYPxJ1mdqE6ViZ9aqRVdgrI/
         8dFNfmsKsxf5ga6OLVrVYwy9hmclFnlZzOCKPGczbMmEmPwClmYaHUylSK4XRZuHxTux
         H+gS2RclVGfhxjkFK0CrBN/9eFOU8IocE0/qxM6o0s45aq5RlBwUZ3m8s3npoDF8NXvV
         PQvikTtH3CRYl1RUBMHtgptyCJvoUUFoqZdyznJEDfE2ib+BHBLiLOzEGegTvchQ7dIt
         0s6w==
X-Forwarded-Encrypted: i=1; AJvYcCVs6IzgTmBdrWFbW+9ME4czDaA6+XS0l31r2ljFYWaCxgVvXcebdrZa3DSWQAmmAxqQNvcxz2NdNkZt@vger.kernel.org
X-Gm-Message-State: AOJu0YwSGSeBDsSzPagJFfDpV0UBA1KmOtjjXyYgfyt+h9qZxwzdNmY1
	KZjOUtydlRpnBs05zxO7dSkvElZ1hWwzVnt3U2NZTrezY37YqLhHyznR3pBjFnzK
X-Gm-Gg: AeBDietpcr+bLfvalovxQEHcv4gfdkwPTc2HQaWTJj9uOxOXbUuS3Vig/8zptz9ZtV8
	XcbRnjJK/1nHalG45D5pbeAVf8AKIsULoxIzJdA7mZJkyQwpaxPgozzBM/a8HZZwwdFL2/cv6jH
	MnoXzM+LX24EZpG7oSpDc+ZcfS8wkepKadnNJ0bGT0Ecg1pueW8DSRgatpTZagr1crjkquVozKU
	/d0Txe+8VvTQTXvFosBR1ORZStuBzbavixerg6Hq/YkoFGY/Zra+Qs8iMMWxgKNaWkF1AFjZnkW
	yqJDyp/1w9cRaZYb78EwwsOUtviv+ZsAlhpEbLFnf0foGEO3yOpl78hIw8qKx5QCQUJWlVDEQ9G
	8uO0PYsDBlEpAvDB8rotONNTxPI5yy59WiigGv3E7jYzcAIPfdYEPtCQtfMnKm5lV0/NUd/ULBP
	qtBjB0opT3vY5FFqKv/5QgT0EnKiZAxhYD7PtvBg9guJTVBiBWuHuzG/f6FrsUiDcQ9yJ6C7Rpz
	w0=
X-Received: by 2002:a05:6122:21a0:b0:56a:f576:cfca with SMTP id 71dfb90a1353d-56dab813f09mr690297e0c.2.1775207003306;
        Fri, 03 Apr 2026 02:03:23 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9baff553sm6245622e0c.8.2026.04.03.02.03.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:03:23 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a857578a8so670054e0c.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:03:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZUZe7H4zVGWI0yP8iOzavmc4vl4TOmCAsssXdXdRurrAup+IRaD2wiBMopiwMkdqrKxQ6PslXa+7K@vger.kernel.org
X-Received: by 2002:a05:6122:6992:b0:56d:3c26:20a8 with SMTP id
 71dfb90a1353d-56dab8146e9mr655900e0c.3.1775207001558; Fri, 03 Apr 2026
 02:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:03:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJsrB6vTHafKnpGDqb-Lc461T9Hd-nWPOVdm7E0MukDw@mail.gmail.com>
X-Gm-Features: AQROBzAUWGgjsdDp3P5htV2JBQzE4EKlybGyOmFyU2VyK7rwylLSVOUsW4xN9NQ
Message-ID: <CAMuHMdVJsrB6vTHafKnpGDqb-Lc461T9Hd-nWPOVdm7E0MukDw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells
 and reg into CSI2 subnode
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into CSI2 subnode to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi:49.10-55.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
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
