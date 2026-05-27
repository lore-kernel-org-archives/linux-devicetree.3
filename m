Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC00F429831
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893837; cv=none; b=RgFLI6xsGf8+RA1nwLVrXkYquyZGB8HQWzU5kkTwe6aVG1XEMaSB8VVurRDbgJBMNjN5+o4mQtL9AmO/C+S1OoTbxeQJ+MQBWE+2OYoDS84nGrkvCPVP5kuViYZ8If4MLIGQeUyjWXzb5PvC3SaY9w+VozpClnf1Wqk1Fhe5R0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893837; c=relaxed/simple;
	bh=DcaIkOnu2qFiNVWG8uKRptjS0gHzV/XmFDChIo3exKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpJbjBkNAE49aMYkSN5oH6EJNWEK6eq2VORUCbZUzYsNG3VNuQigW6tllrHLAh7nGLWCGJ6MIDQczCtr535325KA4zkLucgQ+OfHBRpy5XChRe868qgruqnrvSWL3ZiKH+mSrLpZ51VCTa2otFgqiYWt7VjBRhXNr8wHgCKxgRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-63a3977145fso3847877137.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893835; x=1780498635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSha8LAAaJOu6KHbf0LfPH49giEnF7hSPozKiiNNtTA=;
        b=XolwXn54nwiIXtcRYoCuySEDBb65Ye1lnCJWJBNPzGC8J8HH09zcfVyhsnmZAq9yx6
         JRRnBiy/EhT/LDwLMBY3mJ4cJMy0/cYYnILy4zIwWJ5jw8DgGxR+tZjhAKjFbdJU0jVt
         j9+0b1foTwYfOGqpUIeBPg4bosHdWpc1HvdMKvQZsbGrRdcxX3ic/XISI68Ibmjs23Qc
         4kuIKGRD1rxJOiMjk6RGz/MTnN00KPOx+1NjZ2Ok3ZEHD2XghlCJylndgDn+pLTSeS2n
         7mEEpbhg7l26PJpOw+jX7+SPztN2H4x991J6kzl43xuo5hPFMiffoI2HYeOuijZdSjT6
         N8eQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XDgGDZFxo2LP0JUC7uitg6YiM5I56i5ahAuY7TnkxWgVX8vAPedZGd0RukxRoH7MqjybzRNNDoV/b@vger.kernel.org
X-Gm-Message-State: AOJu0YwZpwDozrxyi2h0zr0Lhx2UHEHc61L1D//FRsY/FqgLr1FTPev/
	ictZqafI+0sRNUHrTYmS/GDySMSDsd+KW8Zep3VZJh1kJzgW2wOxDzDkmrMoXlJVoEI=
X-Gm-Gg: Acq92OE06b9vsqLRb3rGSU9hknIq6lgfd+qrwNOE4PhQqCWRkTVu/jPywkInkgFBMSE
	wtN1gnNeKtFJko3EcgNDWFuz21TqzHU75MEMLrixBUnG/+aRANzQ5uKJ6yAqzYVASr58aFvY2Cp
	ZNAQatCE2tU/3NPmsA9KIsdaBdYhZ/bySEWCsw20k9Y+uUu8X0g+JvomwEuKCK/9F6mKO8Zhd66
	j7+VelHRDL2jLusAOlhlB56t9r+i0RRBBXnWiW2QnJqWdyw0VdfWFVFwIH60mppkijgi2PrOnJh
	ytMtteZiY1ScBQyIlSQ5HCbKpCo9+n9P8I4qNWls9kq9dGARw+1CRCv5NW+TlpYQm7OQdL1c8vl
	LTUMXhEJCABYCMunaScG3VIIUJaWg5lvPpP2umeg3rNpR4zTTao67jrmUuMdp+xUl1oU2PhgvRS
	SzKpVN6KM1llroc86sIsWR95n760NAShYfprOLNuFlQfT97p3PLBOzOLi25lvK
X-Received: by 2002:a05:6102:3f9f:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-67c7300bc83mr11202535137.11.1779893834694;
        Wed, 27 May 2026 07:57:14 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173baf56bsm17263232241.13.2026.05.27.07.57.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 07:57:14 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-63319183a49so4519326137.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:57:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+PbTiyZWocHu2FtPYe8ntcDrLf6cyEtBPcokpFI/fB55XNLZP7rbvES6NSlZbVjJVd+mCLH1KC4hsT@vger.kernel.org
X-Received: by 2002:a05:6102:1621:b0:608:9a34:c8ea with SMTP id
 ada2fe7eead31-67c7300bc13mr11464897137.10.1779893833833; Wed, 27 May 2026
 07:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com> <20260505070206.7932-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505070206.7932-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 16:57:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMroQsJpmuA2zD75t88PJkEyc0w1azKjVaK-PsCkiapw@mail.gmail.com>
X-Gm-Features: AVHnY4JP3NMEceEVoPKwkUHHjX1lg1TgZYFfh8s8DtDqG0A0XFH35vzd-hfGd2o
Message-ID: <CAMuHMdUMroQsJpmuA2zD75t88PJkEyc0w1azKjVaK-PsCkiapw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a08g046: Add scif{1..5} device nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 5 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add scif{1..5} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi

> +               scif5: serial@1004e000 {
> +                       compatible = "renesas,scif-r9a08g045", "renesas,scif-r9a07g044";

renesas,scif-r9a08g046

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
