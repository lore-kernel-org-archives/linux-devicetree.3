Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C65D189BB6
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398167; cv=none; b=B5qlDxyqgsvB++jSH28RPN/sbhEtmcdAOC8k+o0S1tcD4DM5rUrgW/7H3XMXYHQvRANX5Ohrc0jEHU6vze+qNo8UH7p9ZBVUK5B5nVkgMa8Gtdch4Kr+EpjKjC9/hnDthQp3M4fk8l0NakfJsSrcryWYZokkz1uvvp8rTBSIEjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398167; c=relaxed/simple;
	bh=TFnnbTIC9o19/HLCf7RRUSX0316kx/uZhdRjEgeR9LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lrIyqO5o5cmKDWhHHJmKx1PMZ+ZvWV6P0lFDabI6kH1VfgECvBZXMf7kNyUKGB37QAKoR6Sz+mcxbT2dOaJ19U/M0MjjFNU8+1mAWu3teHyxVoFxKFyBsmJQXobX7t+yPVfKyK3S80rP+S4Lk7/LeuGEbXJFE1cukIwEZluo6Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFcM3sAG; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFcM3sAG"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50904a8f421so43488911cf.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398165; x=1775002965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/L1QpJi1pkLlnS2R1iZ460CX5uyexB55OG07HYgp2s=;
        b=bFcM3sAGhoHCFOPHA4XK1SnPq8pQZ72yKHpsld/T7C2LIASfmCNyFrwIrFCovR0xId
         QwEqghFlklpqjXegPqzc+iloLkuxIbU4r4nGZx0s7mZI9W1ndbHAcngqQ4QtXHW837Gh
         tlkFLWleS+5ch9pTOgStyTE1iXd2NxhWwrCjZXizxtRBCIzTWcxPPG/vOtNLzzmHhrHu
         Hp5bDkGxgsEPnF//ZnF5r/B2QLMeQOSYFZct+NV59Daw23YgRhWnfJmuvGFwp0n/7RWn
         xG8tYOFWz9BTBj2LHoOj903mgm2XrNgC7mZ4Bw5TKb1kyQTO4ZQiSGtYbQ5RWoQs7jhX
         Sfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398165; x=1775002965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/L1QpJi1pkLlnS2R1iZ460CX5uyexB55OG07HYgp2s=;
        b=QsXzesP3NAwfaP9kpb+kMK+aNoIuJynzUIrK3eNTb99YGH23P+92rH2SzjqoLLD6aI
         SsmE0EFvBeKXHdY66pdUyhWurES9kodNxaBXsP80wBN6ftX42QjjNO++4+LsGE4iY/Lv
         OSw+9bbGzyPQEIqeOxsvLJ7qHEaJJtiipz9zcO5HiHnqt81QpRRb6EStVfW8XmnS7x+c
         xRXTqLMTP/EaiLYExOzK5NUo6XWrsDP9qzHgNNrrwyZuzfXBnsrIDpOJMtB0cy6sUv9E
         4FMCg2/QBG2ko8TDZPcmHkflxwBRnDBPcYdSX8thfFLZ4wq84JSVwc4Y3O3vKxiZHDLi
         MCAQ==
X-Gm-Message-State: AOJu0YxN/F3HZYEYOO20OcW7E7QXneDOIt5H7QU7RN7O4g7lnjzmfXGh
	0CHcUSuyyUy8u2NGdCSkiGeVaF+C1aCqOjhYgkjM7yidYJPz+j6CAj9a
X-Gm-Gg: ATEYQzzJYoPQcU/xOLJCQOrU4/ULCkOwO3+D85aFzwpDr3K1QrcY106Ms9Uh6FX6BC3
	IzUZF6W22wpcrErQwZNpJRmqZMct30HeiZAs7kQW89KzPE9jiDQD1+SghLaAVdwEaCv4Y2TQLA/
	aYEHaLjQEAfxVg1Rpo45b6Q46al6J3Eo0HDyfEMarrFLj3Ic/NpG9fQ8KWgacwzAB463nRa90zb
	u4dWXsbN1EGGYitOl2/z/v74ev9X6DCPZcpvqcoOEk6uib+S3AvtdUfKZNUAqjZGnDwgm57XNId
	+MNsKsyr4exWJwqZS3y+/GZ9EaCtE1LhAfZ3S+yE4B/D6IiqJREMfhJUoHu9ZOO8dWjveYB8Fil
	hdFoBzwG0hI4E9CNp8d3C5cpMDEVIza5jGNfysntKcXj2jIXgUkf6Aitdoj99ZNja7gu1tsyhf6
	Wt+KKyYbbpag2CcKR+z/xVkNQL4sJP/UPFMZpvT7qsz/r8F1W/Dmx6tg/ga6gR1uPKaWyHYxkCi
	865i3v7lT6GDQ==
X-Received: by 2002:ac8:5905:0:b0:50b:26d7:eaa0 with SMTP id d75a77b69052e-50b80e59457mr26782481cf.40.1774398165131;
        Tue, 24 Mar 2026 17:22:45 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36d23237sm150693321cf.13.2026.03.24.17.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:22:44 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: sram: Document Allwinner H616 VE SRAM
Date: Wed, 25 Mar 2026 01:22:42 +0100
Message-ID: <13973231.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20260324164357.1607247-2-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:49 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The Allwinner H616 has two switchable peripheral SRAM regions:
>=20
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
>=20
>   The mux value for this region is different from previous generations,
>   and thus needs a completely new compatible.
>=20
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
>=20
>   The mux value for this region is the same as on the A64 and H6. The
>   existing compatible for the A64 already covers this.
>=20
> Add the compatible for the VE SRAM to the list of covered compatibles in
> the generic SRAM region binding.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


