Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8347437CD24
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518260; cv=none; b=Ny/eLUofjOd9mde+ki2ClJDwGwQMFEZlDOWpAbU+nMMLPjFAiMz9CT5bvcsI/UA6/t3DFyejfN6inN7wCYZalgBdKisL2Cck8eqKpwzJ0bXXuVGMmH5JsDAOtk/GliAtpM8+QEpC2h8Vl99OB7kD4QYn0f5atY9Y5gpstgmuZM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518260; c=relaxed/simple;
	bh=R3cKDJFdV1o0Z9LWC1jP8EKrlGtKAxcQyYi3Y/CIRxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJ8xXTtP3N+SbfoLL2LhoaEnPnLMxarhsgCCHMdwhNRBqpteJ48dzi7EJI/qKxpPRgN6Vs8t2WTUwMNIKvO63q2OE6UUy9vvxIdHHRxjBawAh/Oh+9GrHw60URRDS2yL8T8o7rtQcmNblfuUhdoZidDhdBXt5bdig7bau22uMlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56cc67e01deso797274e0c.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518256; x=1775123056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLLjfS5BvDFcvjGePocKuzlspinwqEnC95/6wgf9NSk=;
        b=UDJ5Oa1g1vZyr1713OR0maDegNiWTbFEsutNL8scmDs8i+DlQMD0jx0DjUusFwlqQe
         2TkpthhYs8QfVgfLFDqoLEA5syOXb8EfB4ju3n5WkAb93A6RMwCcwYR8JMgkNRu8Wv2E
         8m2y6ovJLEEUsX5fw8cXyiYAg5ihOYZOigQwGlXHEMvqnQqI8S8UYcUcOaovqTa0C23q
         7/beMucebhtKCJxMwBNRw3Es+KRLItfQNRlHgu6S6PJHR57kYvNxbx7507RYkobjLHqs
         JOs88q4eZG5+aM7OAO8UDNRRZ1v+TfMnrqjVgF4bVaapX83a89xH0K9xAeHv/JpNte4Y
         31Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWG/iDlE6TWFcQLTKxgbmcGqxlnFJCdtfJTmBKK8nY/4zyyaLfmjSF7mSHyprYhpsrVT3kE/klTcc1q@vger.kernel.org
X-Gm-Message-State: AOJu0YyaoBN5eFuHbsuX6s3MATwM5QoYaDtiifFUdIEGGpRZ8WHtC2Km
	WqFPfaUVSwskbBnKiYPyKGrYeRikK7w+QALfX27mSaK3E1iUb38eBDZJK+3yhe/MZDA=
X-Gm-Gg: ATEYQzzcNDrYl6Abh7QFwISOi248AkHEmo5jRIsTvAf1Gg0woDcDNeUcwwviNSJKj+V
	4wwCoIfP8R1R08oRFZx/jVGxysXSszS8dasX7qHhJ3h5gBSPvhIKdojtPRsKQGAUmGoYd90RhqL
	+TCRfIzmkKrkajImvk5KPdnrmzSIJDtYJxhqcpHg3dZ62C8gxHUDR6zes2JQawF2exItRyb2erO
	wYC+sbGFmy684InafxZExGYMK0fbVay30VgJ8yZi7stffCUHAKE8mt6gdKOP4rUSrxYQ0SkqUhg
	7J86pMSlh1Y/7RJGzkV7GMnNvWX9Vb1JUW+Lnxo0gEjbUgp8W5PUKB0ifGIlEhmh8zEI1NJQaN3
	WA94lrGOUQ+RJDKoalIx966hCtzYmiyy+7JGh5sve7C+TSh1ywYdUtjDL6ZfR++b8UYg9Oq7KVP
	jKZkCl0Vk9c1CqzHTbUjSkFALDM1khy0GkJRIQU1i/3hqntD2Z+jmXoHccAqFk
X-Received: by 2002:a05:6122:3116:b0:56c:d5cd:1e7c with SMTP id 71dfb90a1353d-56d21f42a38mr3547304e0c.5.1774518256274;
        Thu, 26 Mar 2026 02:44:16 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31bf7190sm3688684e0c.3.2026.03.26.02.44.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:44:15 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6028fe7eaa6so497224137.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:44:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3rxmUZUUiBcoG/8UXd63MCbrmOmu8GAMIUqYhetYW15+oAT9ZNDz26eCJftTRG5z4LxCXat4nd+Qe@vger.kernel.org
X-Received: by 2002:a05:6102:84c1:10b0:5ff:d192:ff22 with SMTP id
 ada2fe7eead31-6038728e7b3mr2209468137.19.1774518254998; Thu, 26 Mar 2026
 02:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326045355.223529-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326045355.223529-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:44:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWM0zq2pAJAVEO=WkNyoVFFf-3OX2_+7fJxMWTPuG6hyQ@mail.gmail.com>
X-Gm-Features: AQROBzA5raX3WKUVOehzAlLaSiESouGRrUnc8wD5Mdt7U_rTWFsDl9lKV1nSlwY
Message-ID: <CAMuHMdWM0zq2pAJAVEO=WkNyoVFFf-3OX2_+7fJxMWTPuG6hyQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r8a7742-iwg21d-q7-dbcm-ca: Drop
 KSZ8081 PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 05:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Microchip KSZ8081 PHY schema indicates that compatible string
> "ethernet-phy-id0022.1560" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
