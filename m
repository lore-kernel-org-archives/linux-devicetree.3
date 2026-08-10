Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF434DCF3
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373115; cv=none; b=g8bJ34CGSLes5T9LfyizQ5a7E2IKUk5IImFgYOQyXWl/bXW/WL8Rr48C1j7MQIbM+unDJReSlQE5Ay0oQjbl7LhZUsqCATrNsGgiO0yEtsPauZkZP/haTazuhKqLFL9hE0LTsnOwrPnUIkJAMykChdCoUmmwwXez6XhC3gASuUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373115; c=relaxed/simple;
	bh=Bnwp9jqVKIAfs/y0mpNAldN8/vl6K6VBqOAFBG6md/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwLeLjpOBIz3nJ0QvAyVkhRL1VF7Oc+HMe4h8DTE8M2Q5L1o3knelyljp1teGmsQnZJMWx1SEwCxYaktMmBFbN5SF3uNVntmfIvPrSoQ5OkCN1YlT+d5nASp4Da15hFIPTt3ijsbwU6QYmkvYacHIiXe3xY1gvelPqC0iYChGcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bfaa014978so775081e0c.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373112; x=1786977912;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/J6pjqX1tkN7ol9r0yPzfB+nnpzebdTRaebsQQSoZo=;
        b=AN0sOKXJ5xunz+nJKbicX3GC7/nRPqyJtXNz9WvyleWgC7XcypimmUkDKAp7Lld8mw
         VNQ1Jr+XRgIYbxfckiGvOeooaegQd7GO3sMRLBvcwoMljRJu9P+m4yvbOxC6Pj4nCCT/
         +spU3ByxqsakrwWYwwo1LvA0KAdgMwHdYh3PYVLL8mD1iYB2VxI0xvSUedzLnoVWVxVa
         fY+uBizZ/22MQr1XRSPNpb63S1Bgrl5HjXCQGcyZL3nQSIgKpICDv3hXw6MMhbe4KKxS
         dz0t3k0Ac6jgNmgmCCVKHYR8f3jD39cgqDzv9r0oaH3mDt+API1Xl9EALwQMf6ytqJtB
         NNcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7/8UAM6HTI/OE1JHcMjJ88u2rc0p2bFyLA+QnTZi69bP+j2QPuixIRvetruaxVcjZn9eDtgV8MIeI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyirr7GAMksB5Um2FcDkcd31kjZHQZW9NgtkoozAHuGPJw/l/No
	ybD55PMHKnWiMcY3nuTN7kQyfjT3tawWjSvj5ohmhNJy+6hZH3DgenajMJjAxCoG
X-Gm-Gg: AR+sD100Ok9AX+vI4oAPam9ahhCpq2iNJ13VNrB322ghFP05GH4I4yS6G7m0Y0wQELi
	llL9JrMIJ9gPNbn61aTj80lQvj8U88RM+BY1k4a2JoZzLm5XDl9RXAVgUyj22O3x2lolgyZtKlt
	+Yh1HE1uzpwg4TTcDmY6V72XYvTkpRkYlwnRaW8ALZ3VlstFzWNZLDWi3wpsLmOSiOL3h3L3Gcw
	cCHvWESW+ytmO6ZMpJ7ygDphOaSIh4my9EXf7IvHxqYb50T6WM4O4nb+r/jI6XGuMZ+jKZDPsuu
	77Mfl4EuAejppHd4iPlx5AcVMspxVK9kJHDYQqHgOtKVDoOSS+Xj2ZCEwN5ofRAe8gBdB8RQu+J
	E49/Ez5u+XtGbaJoEKBqLiC720+NQuU6WGC+mWLSRDGKoXsg+R9Z0+eTDWnXhhwUctmkqAkaNWF
	XqFLu94D9Wk8BbDbZUOfEHbDvUBdcJie1S1Ng0kaNxclVMLDbKwhLKrKpy/ileWzFXk1cfMNTye
	YdC5iHLxEG7xLX+UZKGS6XDA7ybXMFt5MYVKCqD
X-Received: by 2002:a05:6102:4bc6:b0:740:2664:801b with SMTP id ada2fe7eead31-760e851e3e5mr9551319137.11.1786373112220;
        Mon, 10 Aug 2026 07:45:12 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763feadc5e1sm4791946137.6.2026.08.10.07.45.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:45:11 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bfaa014978so775059e0c.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:45:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp6u4Jh1XifGcKCetY9Hj94Z6EhP+1VKyUNO62O2fOm4EollQSzoe2RxIbZmXI/FkMVbRKb4baHSwCO@vger.kernel.org
X-Received: by 2002:a05:6102:3e03:b0:738:1fcb:f276 with SMTP id
 ada2fe7eead31-760e62c939emr10465315137.1.1786373111117; Mon, 10 Aug 2026
 07:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:45:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvPtnH0WUjp1+jTn=K9=RCydq8_O2Ri+FfedcanRWV8g@mail.gmail.com>
X-Gm-Features: AUfX_myZKLorDtb3K9UCtKfuAHnzr1O6LnLSBddvAzpsfFWqwMDXcCTUWFrA9oc
Message-ID: <CAMuHMdWvPtnH0WUjp1+jTn=K9=RCydq8_O2Ri+FfedcanRWV8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: cat875: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The RTL8211E reference manual [1] page 38 chapter 7.16. PHY Reset
> (Hardware Reset) states that the PHYRSTB pin must be asserted low
> for at least 10ms (Tgap in Figure 10) and the system must wait at
> minimum 30ms (for internal circuits settle time) before accessing
> the PHY registers. Use 15ms and 35ms respectively to provide some
> additional margin.
>
> [1] https://files.pine64.org/doc/datasheet/pine64/rtl8211e%28g%29-vb%28vl%29-cg_datasheet_1.6.pdf
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
