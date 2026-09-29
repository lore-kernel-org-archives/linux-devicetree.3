Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FB53B2FDC
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670052; cv=none; b=C53+SC5F+kf2jjS9/FTGEr7tZIbkbd/j/ILudc9+enkg9Jgw7o7UwiuTQ/09dxR1lHbCD9WBpnC0w2Lb1LXK1B6OlkFILOorFZmG9fJYYyWIYtkCDFyiu4ECSh70ynuE3xY5ikf8TkFPdRTvshaEOFDf94D/gV68aLXJ80qzsdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670052; c=relaxed/simple;
	bh=e8jTQ59tb4Ke+Zmo+wcDDbIer2Daet/lCXTrHvU+JBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S59xwqG5nYpfwyWAqyXKidEMJawH3t6PgKTGTabeugkzcln2a6B4lO/2gAmychZ6sRtt8Bx8yI3Vsior48kMMi6PdbeRmMzmeW0FSCiGx5bZuMYwocy7gPoZZIMb6FUK4JjXBTKNMkc1lZ1Tr387TDFRdwcgEKyNmh2kEC8yZKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo2-f41.google.com with SMTP id 46e09a7af769-7fcb425fb68so2361245a34.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 01:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670045; x=1791274845;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wKTPnbd7pHw8WKn97YDxHbj3C025J4UMPNethHoNt9I=;
        b=Z/bh9Oe0j5BIdNnrAObBTNHkGAqB3yQjnmK7j+STypNTq95zqpnDtvsixHDzPr2ZPj
         m3ytLneurF0hJj+ZdWhMwi3M1ml8LHJdzot5CvM8gKjK2X42K1XRVw5U/D/WgSZWrcis
         DoIBUYo94w6lytaJdsxJGXVd7wZ6q5A+iM4D8Ao5SPqR5NrxU/twnJWTJeuBxr5B5ycj
         rA+tx8YcAMwwRlBeQ6Y/z6Ar5/5ezwXiXiUqSkcG3TgP6lYZ9StiVyupUOfXVzodCqSj
         mMXpASj9yiGVG7mb1yHAC5ubQMOb+8IxaledfbepLzdp0TY3YONF/StAEk+G8X/julMa
         zzsw==
X-Forwarded-Encrypted: i=1; AKwUvBzaIJsdY2jcWV03xa8KbgneENHy5K12QaZ5St6JzdP2iSxkItuTM9obvJC1Tt7oMKW+trlgqTNQ/K/j@vger.kernel.org
X-Gm-Message-State: AFuF++mM3TNHW9eEu7CuYakTo6RCuy2Sdu24sDxQU2KHvY2bjupYTOnr
	aMeGvt6oXS9fgU/m3IXSEHfH4bPqLZGmFSmA2HA3Dsa+GoRtcBhZxyHkHOS7UwFNjoo=
X-Gm-Gg: AYBFou2p9R4tA7Dk3CWNxf50Q4ZLa/pZO7fwGQv/uXy+bWtQyzorkcbbRB45NP+1vrq
	2ZgHwBjHzMch3js1u2LbCS8oRG46lmXAHSofLdrOPgOCJWniPDvaSA5WE7tR30vO2ldwX8aKx4j
	NGLpax3FRfKDvsa5PMtH+EMlm2+EFeV+DkeXUgr9VsNardXwXw3D2Cp7CyXNsLu91htLBKgaggZ
	MywYC8VKY/v1wmMKt9uUC9Fqe0/sm+2RWjOhkdm2+BWJ2xa5Z9NelfodFQvUPLaJ3XS5Fu05bDl
	mW7xDA74TNE1TieBTnGv948XtG0GBHuP7WJ51hBNaR4mkJORr/dZ8nfh3CJc7dB5Tl1VSPnueWC
	wNwanGERcSqrNH+/YEJZMhDgNXSkHqF3Hyvits7trVhIYPrzn81grpbcx2/foQ2/S/h+WCfLrqh
	FSFhNGRaVCWk4sfpVY0DlVDJrMvgwz03iotWvkTkPjflid1vaw4BOVXh7+DMChYj9n/gpqmlAgQ
	QqgggUX1bAIdHmgq+1wIfY0vItey8iqDkCNdA==
X-Received: by 2002:a05:6808:4f1f:b0:4c3:ee9e:200b with SMTP id 5614622812f47-4d72cf497a0mr18338320b6e.28.1790670044986;
        Tue, 29 Sep 2026 01:20:44 -0700 (PDT)
Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com. [74.125.231.166])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ebbd25cf71sm3825608b6e.16.2026.09.29.01.20.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:20:44 -0700 (PDT)
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-805cc8b4231so2702424a34.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 01:20:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByxjGZc69W2I8P50he1zNPFD8q/q+Fz1aybI5VsI3q1Fbch6/n1B6qMl4hwUkXvijgfkb12A8sIrAIi@vger.kernel.org
X-Received: by 2002:a05:6102:5346:b0:7a8:15b9:dd34 with SMTP id
 ada2fe7eead31-7af1c58fb71mr6318332137.2.1790669548884; Tue, 29 Sep 2026
 01:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 10:12:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
X-Gm-Features: AclHuK9FhwKj6JL-kiqTsnzPxsKOECrpai_keY8LaopHP5dfC3Vjj3Wu8JulErc
Message-ID: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of SolidRun RZ/G2 based SoMs and both
> HummingBoard IIoT and HummingBoard Ripple Evaluation boards.

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
