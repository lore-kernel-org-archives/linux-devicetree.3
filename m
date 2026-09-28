Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E39B43DEA2
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600997; cv=none; b=riOZjskXwpYTdMJaatmUOqBwaNnOBJMgn7yaPGl1OpmWN4VxbiMEIXsMTC1humI5kG99z3DvumBo8XEHPrB2r1+mPSsT9URZEbXbZv9ak7nFKcf8vJQlILUv+OsBSR1F/o06kl9yPDx+uC5f1XaqPfvqFETzdbdGNEMtIA390R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600997; c=relaxed/simple;
	bh=MNgEkF9rzvNLwkhHa+USMkamAutraVbddo1NEhjIddg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qm7+WqwuenU5HWyFAHcKLI3DjyiySp0ix9q72HMEoyL2fzZuwz8S658wj/y2qV8vV0KuYx7ihUZHVY+/CtnldcXqe4fSFJJIGN3qvnaHNBeIIf/mwjGA/kjSWt3FmyI8s1xt5FL1CDSgaanaBsXMoUH/6S2jwoETHHV/W+1aiEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c3b639adbcso2848324b6e.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600995; x=1791205795;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2wjW2JTwOVXb3h1ozyQBNpHWe/T9o537b+crN9rr4kg=;
        b=PAhq4DV+mB0Su57D6uJ23GQ80FTwnaadGABVL+i5aH/EvD7OwMBea0JVXwLpb60Cnq
         ikJjgf8daNMTwsZOtyWc+81iqEwEcCIx8ej+ni3H7n0Dn81kq7/yHS4uU6vKrZGMS4QI
         paZa8picLgzxFUzXh01q1Qe1elmC+ZvmUkjA5Yr1LhaimqPM8hcs7ISY5yRSYatoiXPS
         O1LUN4H4tX3pSy6gDoFpjkEztguB+garAdINJ7c1RF3d5iaHWQVUVQTCbTPPPZDPItFf
         ZXsRnT99tVCuS6HaHGFnewZwDkSiUUDsK2eEURF8VM9fTw4csXSpOQR99KVqsDR11Pue
         Oxxw==
X-Forwarded-Encrypted: i=1; AKwUvBzDTPmX79ftsseKZUil0FKl48ue8/FKZ8v+nfDSjZgCI+BwqS8zYwu3UHQ+lBDLYZ0hK3sPyD1i9T0D@vger.kernel.org
X-Gm-Message-State: AFuF++lto61cxbmVgriS/3zuszMGqyuK0xiDZz5cfOcNrKkiFDcsjbZw
	9SKBlas4WvvNLXQc7zvz+QwJM03Ata3cl+FPyYtF9+nfU6j+V92Dnhae6ruvdhV+
X-Gm-Gg: AYBFou2vhhD/ECFzdnTzxqw32LFUNsQ9QtVxDlNAaQU2XYzb81DfKGmjDqa1aGQlkdt
	fPeAbEgSfYIcIDlpn5r50nwancOxodOQqQ3PLXfVDnun+ysPa39J1iJcHVg+QfY2WwTuSqg1tUA
	HBIZG1HoWF+VfbmKwt0QdQ8dOLnbUdFBt+WGVewWV18cOZZ8v2N3gZv2EpblO6TTj3Cu5NSDM61
	bKeSTgawTVAUONpSw60c1rZwYK+1S3Ji1FcRA7R9Dr7gOE+VfrOb10DAD00Swz7W25d1u+h0Yxx
	l6eCY8cZCWenM3Jw8xSud8SQUDZu3PY1HpIoJIK0FA7nbL/Sq1P3s92gz9xJUCi9m18TQpgAxaJ
	hChrpLZxsQTA3CwUvzesYH3co5qW93Cbcrlcsi6ZB9o2JSj7ny3hHAh/Om3jyeO6dkITj9yBQjg
	Yt2yhSuT67+GMqiNLUAU/cHDtso3kC6S+i7RJrWZPuewqB7mpCzYIMgejNqvbe0bROcyYGwgIgz
	GRUgaOSy1BtC2ybL/gFDKn85EeSOHPdMmJofQ==
X-Received: by 2002:a05:6102:2910:b0:7b3:54c7:7ce4 with SMTP id ada2fe7eead31-7b354d6cbb7mr2049452137.35.1790600546215;
        Mon, 28 Sep 2026 06:02:26 -0700 (PDT)
Received: from mail-ua2-f30.google.com (mail-ua2-f30.google.com. [74.125.226.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b1d413asm6709414241.10.2026.09.28.06.02.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:02:24 -0700 (PDT)
Received: by mail-ua2-f30.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed1so1791260241.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:02:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByB/QLz0JQjBXgUjAp/F0nuACWOaaXQIKUBOiMe6Rxu3vu0megp/3A3Q+UDdxtFbIe9VHd8sEUjLoN3@vger.kernel.org
X-Received: by 2002:a05:6102:3c8e:b0:7a7:c789:888 with SMTP id
 ada2fe7eead31-7af1c799ab1mr4246322137.5.1790600543175; Mon, 28 Sep 2026
 06:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903205153.283553-1-marek.vasut+renesas@mailbox.org> <20260903205153.283553-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260903205153.283553-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:02:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFm--o+J_dCEkQEJOYPCPhemwfujNm+j0veMPYn-g53Q@mail.gmail.com>
X-Gm-Features: AclHuK9PxP9o2Iptr30yrzx9bl3oQSb-6qLfwXQyJV5JcRh9RYQN0Hhi1zaXUYw
Message-ID: <CAMuHMdUFm--o+J_dCEkQEJOYPCPhemwfujNm+j0veMPYn-g53Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: r8a779h0: Add PCIe
 Application/Local register reset
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:52, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car V4M documentation R19UH0217EJ0110 Rev.1.10 , Jun. 30, 2026
> attachment R-CarV4M_UM_009_SRCRn_FSRCHKRAn_FSRCHKRBn_r1p10.xlsx row 411
> describes PCIEC ch0 Application/Local register reset. Add the reset into
> both RC and EP DT nodes of PCIe controller.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
