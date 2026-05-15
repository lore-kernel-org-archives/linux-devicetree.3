Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B17C30674B
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847548; cv=pass; b=tI6/Cs/a1rABqybmv6pgZvc6Cl8JjNLYbxVkkH6ABCox7mnZ6Pj8ZDryw+P3/briFprsV10BGAkvq1y03hPxQHU1G0ULORTYCiNzUh3GXiazsJN0J9HTsKdSIhD1flVhI05pcNQ7tKdhA2ZrHAJQMkJ4JEuwDIS5Ek7ZsAir+cU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847548; c=relaxed/simple;
	bh=l+sfxOPWo2bPFL9VE0PjEz8c8seHDEjamNot0fi4WhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQfnU5/Kaqwml0C0glCFnEkBPVYPhdyavgfWuR996ZoBBzWFsoIAqVpYwmHicqxdbbxXQrWiOLa8wjeY1MSfJ6Vr24adn6k/oSXVggtjr79jxeylsJk5sbxDXo8oOi9EieFis/f+0qmxxnNlDJpO3PqlUJwcX2JYbqUAx+9vpn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJLnf/gQ; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJLnf/gQ"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-651c366f7efso11780360d50.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778847547; cv=none;
        d=google.com; s=arc-20240605;
        b=XWE6J76DLpe14miPTkCqGhcVit1Tbvr1EgFgBJGQ4NpG3YRki4VHvso0HaBONGogGg
         lHcxLdRYXQ56qSsjUttwM+q0CC4fZj8iLcaNDE49klfXXi8ROoUeBM6mOLhHHKzvxGqS
         7ACdIgygaWDITKuWQ2H1DFf1C5ijp2M8wmgXPjGtkr0Q1v188N4r1kV2cUXKPM2Hm4uC
         DCl+IdgTxcT74DqcTf3Cq/CbYfwOJY2Pv2h0pbhS9KaY6Oy3Bj8iWyCjGxUc3tVPFJK4
         Z+F3nujLsSvoFudyCeX901f80Xlflo4xMfH3Pzl1SaKC+WXid6tcktdAu4xkRYPjR+Ly
         t/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+sfxOPWo2bPFL9VE0PjEz8c8seHDEjamNot0fi4WhY=;
        fh=rqaPbkPHIUzsKtDzZBSBhrutzFqObxPm8G0GWixPyg4=;
        b=TvN1UgtO581XrdFIemJryJRYgAPYhEh2ibjTb6FJTDuBfrHXNSRlhdkNGI/3hNUYpR
         pZHzFpt8ZFcDnn3zuUWTplUhOSEuhA3pfnwxA22lvqC6/IaQGcopea1O/VSaKCNWau7S
         LRYuOgy6bsR2WQnUO9VfbW0jlqrBk9vSfyAm5MlbS3xULIEF2OpD69OykRXFWxk9rxHY
         NUSG5rJVj+cjyTVZGihaPrRgE7Y3QuXJBKbmDD4yTY3afpPoRKmoIz5Bcy2Ps/4hLmGM
         3LTFqDLTAOJ7BNJHC0xcC+TeeSrbwrYlUYIUHtTsgRNpG4DoufIzzrRuwm9CrquZOhMV
         sfdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778847547; x=1779452347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+sfxOPWo2bPFL9VE0PjEz8c8seHDEjamNot0fi4WhY=;
        b=ZJLnf/gQA+uY7jXGaHvBKhnQ1Mf7pvN7HQcSoyUhQ0ycE+xJQpc3plxkYZNjzIiVF0
         UsBo/01Pj2hy5HprfheRHkwg0iLHEUfpx9QhUFnBQxCDAIHhyn4aJKipriKun3i8qJQz
         1uGgmKjnAY7nC6wPZPrnQVsm1s5EXyWDJEDuN085f/Guuf2FqHTNrEA6FZIjYRu74Vpa
         6YUFB7kcbaWYQuXnAylAbXfF1aZif5X0M8g2QiZlp7WXeHXNimAV4Z6Jqc/Yv/nphzcX
         PlTpY1bWMooJjWcjbal9D8leZF/OJv9rm/U/XNA8Np2+eHEK7ZxbDV0ExWZk39blq/VC
         bQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847547; x=1779452347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+sfxOPWo2bPFL9VE0PjEz8c8seHDEjamNot0fi4WhY=;
        b=cpWsW1ESV8rxv3DaaRR/AY8FkmJkG9SzO4s0T/cB0AdIq2A3eFwvaW7B2AzQKK5bsa
         u6X1KP6HNOHBvxFW0/vlVhxsY9B+UK90ZslyPlEpJaQ/V/bP8NktBaTHgSwFeM3nKual
         l6wYCZ5u7aUTjGW/dUtYSbS8iMaq8+4wgt/DxzddpoLZoCS2sDyA21ql11MxeYtPGCyo
         dFccrHda0RWB2bC7IntV5+aHYng4P8Mli09GnOpe7js3ZThCIVxH7PvtL5UQE7G5NrLf
         seKRFcKPKuFS8gfCG13sXjqEJMyLnlVi3b9a2BdJ9fQKngDhZnMS2O2/oYUMhzYQmQQu
         dfXg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZEkE/NnhG7Pfi32Z6zAtnvLWdgiH8n3I9xRKiOoffBQwL1gLYKOYh9Q9FkiVHk1yOi36UtWI0OwsK@vger.kernel.org
X-Gm-Message-State: AOJu0YwTt2dEYB3d/HmG7I73OjToD/0qoQ1TUwoHVTzq8i+QSxWBMUWp
	606FUJPojPmeCaUvG1OTzFknKjqkNgtCng+NoMqxyemULXjCBNnnWhlrDMw9U1j/55z1z7t4/CR
	DWi0cQrQ2YZgP+ZWrREYPHcqvLrQcyUA=
X-Gm-Gg: Acq92OGYZQhMC8wW6wCUoQWFuS1Wi+pCTfh+UpW5mZn06aA7bLd2UMvd2sbenAGtvmX
	nZXfpD1Fxj2pj94awlE/l7xRZT/fJNVTOT5yt9mNMn/rF/HP8m4gH0h0aHZPD5MpDr1sQbSNVLZ
	zCoad61SUvBdbyvcaQ34ZfCR/G1LgUwfPP79fwStTM6fA7BRhxqoeECoU1HsmnzBhjjYcUDWfGc
	LP4Vbu0g1Lwu2jbKgTLU5q94H0bR/EvnVPd2sX0upg56oo+MCl0Nl0FLMWnv53TiTUqJsikuemO
	7CD2
X-Received: by 2002:a05:690c:ed5:b0:7bd:4a12:f08b with SMTP id
 00721157ae682-7c959b9161dmr40400137b3.3.1778847546596; Fri, 15 May 2026
 05:19:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515011639.28570-1-m32285159@gmail.com> <20260515-peculiar-purple-bug-c96bea@quoll>
In-Reply-To: <20260515-peculiar-purple-bug-c96bea@quoll>
From: Maxwell Doose <m32285159@gmail.com>
Date: Fri, 15 May 2026 07:18:56 -0500
X-Gm-Features: AVHnY4K41amtZmEaK0t551qK137IzOLK4chNTTOZayOWnIdoxLUHq2a9uBFl_Jw
Message-ID: <CAKqfh0EBjb2OR+cSw2gU33+ROoKFS-tiPYMPYvA=kFT8y1Fi1w@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: iio: chemical: sensirion,scd30: Update
 maintainers field
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Tomasz Duszynski <tomasz.duszynski@octakon.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, May 14, 2026 at 08:16:39PM -0500, Maxwell Doose wrote:
> > Tomasz Duszynski is no longer the maintainer of the SCD30 driver.
> > Replace his entry with mine.
> >
> > Link: https://lore.kernel.org/linux-iio/20260507172404.80435-1-m3228515=
9@gmail.com/
> > Signed-off-by: Maxwell Doose <m32285159@gmail.com>
>
> This was supposed to be part of that patch.
>

Yeah, sorry about that. I hadn't realized that he also had an entry here.

best regards,
max



> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
