Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536E8485955
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396663; cv=pass; b=fPlIYLcrK86FSlEgdG1t23q1Ub5ApFfdMYDqmEPYWBh93AydBbX4wQ54pJqPgwS/ODY5rtbRXtPOBHb9wk1wwDREEfH/PnnLXpXjzibwPNrj0i1K2s3GIAr4IlPZwS4oqtahFwPQEaAa6gjSk/65eqWzepRIP6qywW8KU3AV414=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396663; c=relaxed/simple;
	bh=MPcEmjZPn0U1HR0YqbRJlGEJNlJcmuvq9yIqrqLbn/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+0z3faj5KzBSq2Wdx30+N2c6ko3/VLIzLpW2tdZMCW2kMJgY54+s/Tg7b+2hq7hcyc2lABGeG6B9z/J60kBrsMRn7zomCM3mG/wxtxgGUgfvtkqB07V80lIgMjSEgaqGxvvfRRCEOQkTgImsUYtTxigkULS/Sj7ldpC8sAchzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTuflbtj; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTuflbtj"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06c60065fso365428b3a.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 00:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792396662; cv=none;
        d=google.com; s=arc-20260327;
        b=G2AEQYbecWwNZPrHMDCtCPeUvBXLhyzZ5IWBerzb9B3vmCOoZyJv75CQAV2dxb9Akn
         w75h/So4Ex3YJ8jGHHeyuKCdXhyOnnQoqZTYKkAESN6UeyWj1nIoGlDOYenQjGP4nQjo
         t2WjrrfMcZUJlwBWdmNCHbYpeQa6S0+PfZMflOVgLo8hTqfJvWk164zZ+IfIDntnaE6P
         JYgMg1c4T5FjKJSkHhqaamzuwXhzvGNOmGrINgXrrqxcjxhPPs4T98SfnEPWAzD4Nhds
         vvv42gXUZjAj7QZ16fnYGyykVG1vlf45lLEXBf+qmc91wRYSkRLJ87HC7qikszktCUYn
         EkWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MPcEmjZPn0U1HR0YqbRJlGEJNlJcmuvq9yIqrqLbn/k=;
        fh=dzZbiCbbzpLxDqo2C81dlZNcK93/mZrpobeqf01Zn+U=;
        b=hXJdIt/2u6pguWgbEHq6IwRFIFkuA+zqfDLKdB9pbVTxti+pAvdpcatLbQOxNrclpO
         HxdjXhWqBudTl7ZMUFsWcn83blL0f0WjPCqullKraXUOh7/lHlVM+MH8X7iPqKBDI+uK
         FdiEnWNE1P+brZSU/PnmA/uHYC908T+4oXmewRgSKEU+zDR1UBA+tl2EaiBj6ZVjlcwr
         9Q368Y6rvHG36rzWwJn4ybk0rkuubs2EUXgYVPUn9YXpPjgCwqmg7RFqEa8CNByeNPk3
         2TjfOTGP3Yco64fzDqvaM6IecgqA2Uhv1Ot1eH0nZLSSiBMOhzCarm1I4UgDYA4AobhN
         NTvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792396662; x=1793001462; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPcEmjZPn0U1HR0YqbRJlGEJNlJcmuvq9yIqrqLbn/k=;
        b=JTuflbtjqRg0kNyO3t8Scwuwio0mdIoM/hFSJxzrmOl7mrVni/ryJ1Jpf1H16IaAH7
         EMJ8J1Hr/wyJumDoouhgMsbMBLETo3OdNpvvgwVVbpYYAvW4SidOU6agPx17dlPDPTzU
         ydh6yghiottVbZPC0+mCFnc23HpgJ4wh3xeyUf99hmxvMnDndGsh/vW7DPLmuAa1lyDf
         O71+3GHpcpSJzsFT4nGZzuFH8G3AXcmnwkgChAY89+qziSHkEnLVafHdAVleIc3KL8Rg
         kmYQeKLq+fN+7DcpJKDIemtjp4g7WJ8FerVImtT6nsyMJ0oM+qSTTFjhWgkdlDpv5qEd
         QLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396662; x=1793001462;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MPcEmjZPn0U1HR0YqbRJlGEJNlJcmuvq9yIqrqLbn/k=;
        b=Ae3pcxQv8kcTXpKCYkpt7+JahbP9yNkiloidoAG+0VX2icY6sZfuzR9ql9rh6LZFol
         sbrQtRFY9rFCF5YtqR8GRfk2DI73q/ZbMDfkjD8Sg4Rds8gVZ9R1WCiA1ufUEpntCTni
         9laft0GRC9zp0cW94I5RMAKkdbLRTWSZfPkl3VzDHG0C/PvImdAZGVTjUzfhnVPCe6ck
         hvYM/icnVJVaZMkaR66V2vkoR0/kikX9YWhm13MUaeukEK9R+caPVPux1L2lJX0yUaUO
         uMXcg5UfWUaqtan6gmbaocL4Sbz7ssv7EED1t7BwpTN+1C8eI2g66y1KqS3+G1Pbb4tC
         WCRw==
X-Forwarded-Encrypted: i=1; AKwUvBxRNW7pZum/2+S889z8QtFk5QsuWx9rHktXyL1U5TZnq2SwVze3zHR+8i2ObYb5mEjg1bjfT2/gl2qH@vger.kernel.org
X-Gm-Message-State: AFq9FYJLxLveI1NE39eafA0viTrFyLNa6TWm8jfku438qceSu+jrdH3u
	gjbrZV8ROM8IkzjfQuUhx1ef9s/OG7Upqi4m59X2UkwMrqe2bbCLysLWPoDHKNH/vNW9XzOrxvb
	WI/NUtkdcrDEvfDNUH+SCl1DMRmk/4/g=
X-Gm-Gg: AYBFou3fsPd2g8AkTIxo3p/hx0VJtkIXcJDzdy1smfTY+mehOuCvelXaSTJqU2UYo0w
	Q0kRddeSn2c8Tc1VX1nif9fonw4errX0mfzquk4TypmMeGSUa3vu9NZz7ee2PgX6zSWzp4nETXH
	LOwxpUpSbqp5B8mSYNypjOp7mnlqhyffEGwIh+l1B+dIrmx0tsxUhOICkaQuHIEq/njq//nXoLZ
	+x60U3za80QEEtqzZU4U2BOsU39Lt0Y2gRyVL3MhwcVixrkLct0szuVjHDrlUiVZxkywENXxYnl
	7xaAosT3D6Lc8fStGy2g8ACy6Vhws4VhgrQ7bRaivA/F/GKozZ+z+dn9Ftshfzlhs9OE/cuYs8H
	pdW7HmI+pGm96zNrKAZcdSKljEQHsNsw13+nMwpMPAFJVTiZO18w2LG0QvVqOiXnmE2jN5YWsA8
	79V5X2Dg==
X-Received: by 2002:a05:6a00:f8c:b0:874:705d:f64e with SMTP id
 d2e1a72fcca58-8a04ba30be6mr5022138b3a.28.1792396661246; Mon, 19 Oct 2026
 00:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017140827.290666-1-lukapanio@gmail.com> <20261017140827.290666-7-lukapanio@gmail.com>
 <atW_DkB9H0oV6U8v@monoceros>
In-Reply-To: <atW_DkB9H0oV6U8v@monoceros>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 09:57:28 +0200
X-Gm-Features: AclHuK-MehupUeh6pNNKQQ7CplFtLMUS6VR_BXN9elAOlhRnJMBhoDSEjrXhQXI
Message-ID: <CACi=Ov77_J3N=5UoY8A9XRuQgcprojpV=KahGQ9e3gZz_yErqA@mail.gmail.com>
Subject: Re: [PATCH 6/7] Input: edt-ft5x06 - add SPI transport and FT8722 support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Uwe, both make sense, will fix in v2.
