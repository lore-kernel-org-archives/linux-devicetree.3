Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E9141C2F2
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683949; cv=none; b=MV/4nKlahHN460JcYrI3dtZ7KFwapCFaT2cPHazAKXgR0l8sJymmt/Z/z7hqHKJaDuW2gBtvaoqAZDQJbJCombQXtUEo1cMq6LXOQi6LQMyS2Y3HxWiVVYeMxO7zgCX5zJBxhelm+waZHASdpXsdEcZ+s3v/Vqzn13vk0nq5kZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683949; c=relaxed/simple;
	bh=EekNeqjV4N0gGnWuwGaCvsr4HCbdqEM0Tp8JVDwVAfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cozxFruGWMGg0wC/Nuiu+AyueckIIJbf7O3KbhpXCnXv2jBllmlas8LYHKRhsVko9vLYIk32DuhF+74VHtT6fFm4sIZVR+uNofA7AMI3H3EXjggqrNU0xIFbUmRkIHceMXlRK0ETKJu+efOTb6bqThlFmAjLry7+RLFAGvMirqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9691bfc9f81so472407241.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683933; x=1784288733;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fwdk8OQjfZ4g1oKCi9DzVNLxPRzraPZCDq7l76gWtBY=;
        b=DVyKQgth7s1PEPVPnkphloC6r1u/OITroCgMu1eaPAjsOk9z3rI/JXHPVj0/Gk+Nty
         jrbTIollumATVEwltlDpLBF9Yii5Hf5LY/CENnpwCr/QUa9oF3bQfmVKgAF4El0b6M5d
         nx2tNY/vQvHwjrtQ4lEPi1p3b1RkunRDIWPo+96UqWDH7Q0KTJ/jTST66Y+qd8TNeuHE
         pSkezE/zDKz/hEMoWXts6vg4cfgGp5tCwO9tf6gbfrwyz8P6Cn0/hMuHSrmPjtVSGMuT
         a9Cei+DbUF5p4ONSf1cKw1uoy7fgQcfqkMXKgO7LJy3JFSigh/p1lwHFaOaeqOXEXLnu
         U/6A==
X-Forwarded-Encrypted: i=1; AHgh+RqEO3kMaytk7LrFtNOEyTuejM29vXaeqDZREZEy1+sL4Wh08Nu69a1BY/i+EmeUv8rYyS3PCElXR2nM@vger.kernel.org
X-Gm-Message-State: AOJu0YxFv+l45cMfU0nvjr7FO6MnqNipaFJ+G1R5dS5/iKsMdXPhUOas
	Uv086Bvul3a8zUvGMJ+0it7WXJa1AxdrjXHtxv+jKc/1vOJf1qv61UsYW188U4t66Bc=
X-Gm-Gg: AfdE7cmplEcYutrl+bnvfdwCmYLpC3YF9V3y5/NxXNjt08M7gTCZme7BWGyGg6/gcWh
	RZ6sUQ9YluqzQ6IBW5ICxK6Kn4SE5ptbL1elO4foEuwiXQgiCgPRogyjtxLHTINhePbXKdx6iBU
	/FXJir1KFAASQWonGxZH5XL9IZh6EdwESwVWSsL6DCVMLb0ZPDAv6cITQIJP2PIxqOrTw4rF5Pc
	fvmPenwf2ggYupVE7kTPL8V+LCS2VJary4909yY3DrLtS6dKPB6OrBdrzQUYQcKAFbk7JcD3SVR
	8Bw+C8R0Qz6LtuxdT+ArtFH4r1oFMzrH/sU5Ixfxt6iAaD242bcDYQ+xFeboCmAVTFw2vuXfjKh
	76AK2oxsV3o0a3lk2roCcApZW698uzlKmZhx5YhnEsRnTLU2ouYx+b8N5uJ5FYq373p2HD3bHOj
	euKY+HVOhHzRd3Za+yQFW+vPAGXugB3Gj95G8r47wEhEcTqCreSQ==
X-Received: by 2002:a05:6102:2910:b0:737:bfe6:3b03 with SMTP id ada2fe7eead31-744dfe620bamr6946487137.7.1783683932893;
        Fri, 10 Jul 2026 04:45:32 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6deb1aasm5177101137.7.2026.07.10.04.45.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:45:32 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-73b7c3791dbso409079137.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:45:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq9AvW/8zzN+rbxKMgwHnVD62Ansg8xV+cvyP4Pw2sEO/wEuqCsQJ5OJaZ243Q0kVvgYhtDFMJWCnTY@vger.kernel.org
X-Received: by 2002:a05:6102:598c:b0:726:8813:2078 with SMTP id
 ada2fe7eead31-744dfebf3c1mr6762275137.11.1783683931945; Fri, 10 Jul 2026
 04:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113029.436415-2-manuelebner@mailbox.org>
In-Reply-To: <20260710113029.436415-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:45:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVN124Dnj3i70BpKaAAWCF4t1Anx2mBHXqXYXKWj2feiQ@mail.gmail.com>
X-Gm-Features: AUfX_myuyPuTjg5DZyr9KKKOqV5l0_ncCR0jCoB2bLPghzOOyFOUVx8su2-pqUY
Message-ID: <CAMuHMdVN124Dnj3i70BpKaAAWCF4t1Anx2mBHXqXYXKWj2feiQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: memory-controllers: renesas,dbsc: fix bracket
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 13:31, Manuel Ebner <manuelebner@mailbox.org> wrote:
> Remove needless ')'.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
