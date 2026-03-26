Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BFA2DCC1C
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533247; cv=none; b=doqeiOO+MtIv5jFRgaoFWEanLI6+lzZ1CW2HsynH5XCmH9PrVek0NRMY7ilSe4RLQpVOWQmTi5Gyyrc/GbvlF0KbRyWfUCWsPUk+1+oL8h0RXdTAaV6NLEXs6/hjevQJ85HCZqisPz8UJP8j4+1A7qcflaTECwNyvh8KOfxmPSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533247; c=relaxed/simple;
	bh=b16+BSqdwlKxZBrsPvrCeqq7HQ5axnaRp8F/iq1oASM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a40bJlqZVnihpHLMW/kaSb8i/hP8UHkEv0NyaGVxoWYtMRu/2cIF3BRbJi77/PIxpPyKh5ve3bOjEIutYm3fZaJ+H3VQvWuW4sw/mv7FfKd0LebOuKnpjC58i70TZYHs5jec3z11O85S1p60ngRiLLh1e+X54uwbu1y1KVkEbw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-951a4e8d1b5so297764241.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533246; x=1775138046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPgufzjj/8gFlVMbLfwFgxSo/amYWDhD7/KxZ1lJMuY=;
        b=piEdfxjSHLa5QjAwqTI7DIzK+6zAI3ofInLbK+dAOSFDw5v1T1rBIz7gdYY5imKmIP
         JKg7ZVJlm7lyvfgtyEGhg5oDXOv3VKOZHP6FAiAAJvwjL9QF4zysEMSv1mAyGgR0OHCV
         ojGZ8xQmG66ISieBGUpgjVvax/WzdxXQrjfJQ2bA2VSWFDI/CK4P5FQxlAAm9rxDc4LU
         /2eaOujz6QuhRD7/HuaPtoMqG51/gz4mR4KbuEIAom6SfT8LrJYBp9ASF+fnk5Kytj0a
         I9++TmakSLGP/HCGMt3ApE0gMN9jvIOAr2ysmdsN0Y7NgKAxb8YqAk6Kk9eyDD0uHlKS
         K5uw==
X-Forwarded-Encrypted: i=1; AJvYcCXSkZpsScg4zGlYE4DuZ7bqNwfCYEN31hZhVQOBdPYJ3No07d1uUTTlQnkzNJ7ytONKsmnI7cIGN9mU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkk03y7I7oxY+RD721h1l17Qf9pFWf6K93nL2o6OWE1HBEQ2hS
	OYVojqoaKevfUdVWrcSuJ83BYMeEQXPKS4zB/FS0M3c7e9Ngx6xj6hkmloN2aWONr5o=
X-Gm-Gg: ATEYQzwsvBpoUdhmtpHPBNp5QmKDfmjBmG/MFF9UEPgFkp1R/A62bMYczb3CKY5cbFi
	3yZZ9ps6GqbfXfDz+lACEWL0vNRlo5cbPDDAjK2I1Yw/23pb78u7/zveT0XszNqAY07SlGPm1LI
	zrCewH+vGVnjPYHOAhFpJMJvgJ7afmir//ORkRqdvV9IGnFhf673MLmfyHY46XjcS/UjKJOKMlA
	Ge5K5t9Uf4A8zx+YwrDg2/TfOdZzstIr/YDco2ojG9Zne0rB8tdkMca0VmU8DJfizM7Kj9s90qC
	C8xGM9q+5WLpTPDa82XrzGBAXgKXp+Pf1ZoQsZ1ey8eBCQ2p4GkIgd2N/3eM8Yx9Uu8ysTuxQ2d
	6dJg6jdQ12l/DikFJ5/fIFgNd7926NkJjgP3q/FxHK0NiYHy9pdswnMYE0lDQWCgJWVwYEPg0Mn
	D7EWjP8pAP+gX9AaqUe8dEu2uEa0NY3jlJLIyfHEebKuyCLsa/6ysVbprHd3TX
X-Received: by 2002:a05:6102:94f:b0:602:9a1b:ce65 with SMTP id ada2fe7eead31-603870c1f9bmr3315293137.12.1774533245484;
        Thu, 26 Mar 2026 06:54:05 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be56f28esm3540039241.10.2026.03.26.06.54.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:54:03 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-604d6ad884eso301979137.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:54:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRfEvwejMFcv3jgsMxRyKaMGpLWc0IZ4MQsobErv8/H02bktl2TGtOSuhAkvKV6nmOz0ytOe/eCb5t@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:602:71a7:63c2 with SMTP id
 ada2fe7eead31-603872883d4mr3233233137.23.1774533242461; Thu, 26 Mar 2026
 06:54:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:53:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTOZbrL2qaL1yTjByXqFD7-bDfB=9tj5v39THPapFHqg@mail.gmail.com>
X-Gm-Features: AQROBzC5DZ2dGbpREwOcqTdD2PAJeG6c74VA05uhYgFpR_8VB7C_frMsrRmWAiE
Message-ID: <CAMuHMdWTOZbrL2qaL1yTjByXqFD7-bDfB=9tj5v39THPapFHqg@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the initial DTSI for the RZ/G3L SoC.
> The files in this commit have the following meaning:
>   - r9a08g046.dtsi:    RZ/G3L family SoC common parts
>   - r9a08g046l48.dtsi: RZ/G3L R9A08G046L48 SoC-specific parts
>
> Add placeholders to reuse the code for the Renesas SMARC II carrier
> board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
