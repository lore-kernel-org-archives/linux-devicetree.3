Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E77C372EF3
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967272; cv=none; b=DcO7OP49AnQgDEEZ+ZChvCcmHKuKr/3r3h3u96anyuABw9FpK7aRatcYfep+aLZS3/YSJ1ePP3bHr4c/eP5dxcECZU63Wp2fnbJucWmAQVADor8kOLC3aMyWWVaykhQPYoAkF8ZNi0VbeZjo87AZv3fMl0jXcmdWUt/yMu5a0fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967272; c=relaxed/simple;
	bh=XkIfu4GFpqkkfkfU2ELXJLd/gzXud8DjECfS0dWQbGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EupGdCbxnlPWvsEI3qcnXFSFPadneLCYzOl5GUBnqR8PZT0aLDcYfWlUugZxGMdYMMuUuGl8zsb323LOVnKFyj3zGAdPEhsydcYEjGhvd1tqh29IKV3hmfLC5C18p5xl4pJZoqceBb5yftcTvvkCVwmOjKo4qS5J+UBNqeE2oSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7e8a17839so362491e0c.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967270; x=1789572070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xIh1wPKDMe5t+fT3IE0obOGyRNurvI4tDRD2p56gTg=;
        b=HemBzBC7yn4fJRDWex+Vth1jMeM3s5Ks7qBXeyEHUSCmkwt02pnucnB744FQaa7qas
         Fsd650gxL72wBlM0b8szdaHjimSPMBHoi6iAOZXsU9tl8RnOr5jXCIrd13yeDhsMnZwy
         ort17y88fOWHn26COsC5xOnGWWyfBhDUtdsSjuvFWfkFN+GQhd5H6GWcQ4AZTyhfjRzt
         5Ie3KCo6tIxx3cRYlxjj1zUdqgqzZ3UZ0rZGK+mbTdte6N+bOeUfHqY98u3Go5k6Pt/m
         Em4D0RNziH8vamvkPcrVKFCxdooLYRHdW30B2MIjR8695HYYr/8D9Nvk+XbR6p+gubre
         SPBg==
X-Forwarded-Encrypted: i=1; AKwUvBzttXE63PffGsDdnXqtHm98aU5g/xShaKSq9IB1RfgcGVHSgIZ5DWSvjnDG/qdphxV/9zWEYTmKVYkT@vger.kernel.org
X-Gm-Message-State: AFuF++nfJTqfBuM+3WpadFjRPj7l9fQKCS+tWT+1gdwg8rrNfiaMykkt
	bvsnoEbERcMUvYi0+4ciVJ04bL4237aiI8l5lMZWXlHq16ME2iVnG3VIHNAGySSZiWU=
X-Gm-Gg: AYBFou01BUbWvQ7l8svHhIsN4TUcOE416LGQP8tf1guPfKo/eEG+v1qNIw10EBd1mOb
	JyUc2XNTNKzaSpXEb1EfXRq+PhKMBqg7WXjEI1UEAhTZNth1IoGRkhTX1k6MsP86xMRCmSXRMrr
	5z4ZinwO1TkGNKiSBKo/c4444JvSZ7pPAySpbo7uu8AM7z3J873ihidE3Mx4TDDXhAD1WO1UvJw
	mpIZ+TRJKUIQEGpTmn0MBbA180rbtw4DmLXOb0qC4rHuO3dIGEswfKdciANu5Qt6w/QqLFf0Udr
	5wHgEm94/vLxczOYh0yYiMYhLgSj9cMefbZidThwiuTWLIg6vf7eeqMj9MhnWcJ5OJZyEoEhWle
	RwlvRz9O1k9DleCul/elg1xTXxG8Ar7ulOO65XT/peWDNStpWbBFE+WzBEvQOQpziOUli/gjCJU
	HfPIrF/oqgfFb47FFNUWyjlT/rVxiaMAoECbvJeFe7JfrFx/5kz5ULp/tWL+Z+q0rtL21X2uvck
	qnJzGrUfyW3yJz0FIDzJ7CQuS4ChE7hwR9V
X-Received: by 2002:a05:6122:d21:b0:5c8:32c5:4296 with SMTP id 71dfb90a1353d-5c832c54729mr768604e0c.1.1788967269819;
        Wed, 09 Sep 2026 08:21:09 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097e5sm12779769e0c.2.2026.09.09.08.21.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:21:09 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97cc700fcf5so3868359241.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:21:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+QIJY8iXxAJqBOaxcJ0XWYY1o2wcxhdQzvJp3IvMt7O1zTOlaIUAP90lxNk/OJlVKVtjspDvoCYtZ@vger.kernel.org
X-Received: by 2002:a05:6102:8308:b0:76b:2548:560a with SMTP id
 ada2fe7eead31-78a2efe5c6fmr8198191137.16.1788967264493; Wed, 09 Sep 2026
 08:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
 <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org> <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
 <c784aab5-c0c9-424f-9f9d-a0330f60a0ef@mailbox.org>
In-Reply-To: <c784aab5-c0c9-424f-9f9d-a0330f60a0ef@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:20:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWi7ou=pbTfHXHfjCLShwqWOcYYd3vpLPmUHzMMNFJ+fA@mail.gmail.com>
X-Gm-Features: AcwNN1X2mn0ov-erdE-79oChYQokKwSLC2Xb3xUhMRJG7PmcUAF6Kj0jO0aTaU0
Message-ID: <CAMuHMdWi7ou=pbTfHXHfjCLShwqWOcYYd3vpLPmUHzMMNFJ+fA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, 9 Sept 2026 at 17:16, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/9/26 9:56 AM, Geert Uytterhoeven wrote:
> > On Tue, 8 Sept 2026 at 19:02, Marek Vasut <marek.vasut@mailbox.org> wro=
te:
> >> On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:
> >>>> +&pfc {
> >>>> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
> >>>
> >>> Node name should be "msiof0".
> >>
> >> Do we also have to fix up
> >> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:
> >>
> >> "
> >>    755         msiof1_pins: sound {
> >>                             ^^^^^
> >> "
> >> ?
> >
> > Might be a good idea, to increase consistency.
>
> Submitted as
>
> [PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node name
> with label

Thanks!

> >> But I wonder, shouldn't the DTOs contain unique pinmux node names, whi=
ch
> >> cannot accidentally overlap with the base DT or other DTO node names ?
> >
> > In general, the answer is yes.
> > In this case it is about pin control subnodes. If the base DTS already
> > uses msiof0, its original user needs to be disabled by the overlay
> > anyway.
>
> The original DTS does not use MSIOF0 .
>
> I think the proper solution here would be DT connector ?

Keeping an eye on Herv=C3=A9's work...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
