Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7391B56B874
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884556; cv=pass; b=LSIIpphY+dbalOj7xuVNuc8Im251gXd5osLkKjHVXV8cCKK4wF2FBniplmKGoSJGtrqFuSIGNEHMCnbJtsHJASxeDZXzMgvhjSqLjngqdyzegIZnRkpgfibSdNgZsRL0+P25m+JLDkHt0+PVEWTsLyJiZOlfmspV8yHRs4GJ94Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884556; c=relaxed/simple;
	bh=gx0WNzHrzpR5Vg5y5KJZ32oxwshPQgn8Fi9efTzEQjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxVGjbEnR6toxEadmd4mq3bxkvneAJ6TnSAfUI8mvneEWnwlvoPnzir5dWRlx8wxpUlFv3ySxA3tdA6LJw1/1n1pdY7vgZanUEA5cCWJPdPl/uLST8pD0QoMdEEmENZ1rHDflrlBkVMT2NTS53nCOrYyXNpWEeA9dOOXL7dxMEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHI7JKr2; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHI7JKr2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e257a23aso3339021f8f.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 09:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788884552; cv=none;
        d=google.com; s=arc-20260327;
        b=p5bIoaMF+mWwlGFD67kzEkfWanqPdOseyVhNw/N9YrFw/qysRbA+8FuZtONkB1Nrci
         CzT6gDR5QW+FnyJCIobpQLvIevDMEALEu/Stq+99GI4z43O33Xn1ZkHeA97P4FnueOlA
         LV0uG0VYbVLqlv+pyuKsVFmavZUxeNyoD7gbasnEza+tu71G+NQ37kTVt3wsDWuPSnfb
         84wjSzAM9z1yCxSu7Rt5NaWJTaqMBCKxuycJom/iQBK8RDUtIT0uhfoRaZ6If2247or+
         /Pfhm1/WiFENIM772o96QmluviWQD9cwS8bZj5rFTrAFm779h+jaNu2vcruDK++qyruj
         WjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        fh=MV0jhWW/bn8jjw5QxZbuucvItFo7WQkY9G5eAtuHQ+0=;
        b=QlhnIVJ7Ipzhtksvz9ax4gAtjWAeAP6X00tJsk1BdiRwqUCvf31OUScDgK3I+g3XSZ
         iXIkqcRmws+VCM89SWINR2KEKXNJpL6TfBErTZYSUE8fmWlnZLHp+Aer1BaQqwmrZ6/Y
         t/Aq9nFmqqAfxP1LAuyMBR6Y2z4hhcysR9ASe1U9sooIbsnHiMI/T6vik2duBRCDw1UW
         r3TxPj9/xVtqR+3+PsBehzd9+ND6Xwjlwr7sNZM5drSosseb5dGK/9sCdfCFvbGZHnMb
         s0Zovn1xOjTgcGSTm8GuMFETyGkb66J3Rx+2H4Qr3YsS7k84PgIrCdfM25ThLw8QElNl
         WQCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884552; x=1789489352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        b=MHI7JKr2kkr24YW4snLpJdEML8QbgbEuKlTVoMWeXvxapQb9bE9iEJ/apSQfsEBCyF
         6UK7QNkxSB/f9xiBqGLkw/iBAFfKmaoStMFU0SS5vDwnJAGG+tC7GH189zop7UdBzH8w
         nwK+VulVgJKrc1YU+MG+M392P5la+71HfwYsPHAQAtL6Wmj11OiTlSRr3/2FVb7gcRtK
         kzeWmmZTOwgHWcLQ2wBGrFe/9jhFTHjnktsABOgWj2M/hW1C+S4I+XMRSJOVRPGTC81W
         1m9LjXgjk7Udg7NCQtPn+rsj5TDhUg6pzer5U/kGbQZXLXNO6XY0wDlRDF54Tgi9padj
         LwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884552; x=1789489352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        b=htMANQFfKCg0UeV5FfVZy0AwfA1CggXNHiHBAuT/phS22Bqt8ra98IHB2sWP0oBPiA
         cCgXhzBaNfzPhesfO6kRnyO608MI41joYCvF+4cw0lsBub1Ge50kFlXzIF5mpzWB7dHU
         CrbA3/dBIHMW3H7LIu+5It8+ysqPfepL2tTgB95tlIIrOeg/qQS3/2v+MXQ4P2M8mQLv
         zwcLE10MS9deUUnXNKiJ05PhdSYMO5Z7KyAFRds5B+iOXh6gwQ38AAMLZT4rdDf65ydC
         5dot1JwKYHDSsv5sx/S/Zz3gSCcP5UOH24j65dXin7BeOKGk90NYhKNB+tMStCTN6XC4
         vQnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmUJrUaGIQFx9GmRKYnV2U4E6lr9O0E6e49dSIbd+SjUep0aQADf7DV8WIR4T5LU78Q9y7m1ZlrvrA@vger.kernel.org
X-Gm-Message-State: AFuF++l4HsTGNvnxwY9qTtu32NebMjEOyv9MntekuS0wOurf/1syyQDO
	aMBJmzv3u7LpkR8jPLM2ztBp6LKvff9wN5bsBbL1jd1HZSDEEcNk+leNUVnq62phIYtSOkexKS0
	MKZYEBJLDmbm+cMrfllePrDk6tW863NQ=
X-Gm-Gg: AYBFou1ENpaBIXbhA5SoPj7YjhJBizWPmXSU1nTd5wboHHKPOKHoLzzHhx2v8vCJMmf
	bMdoEyUbkchkatj4j3nqr5KsNRE8ZQPJnA0BjdBOiv5Us27wTbOzsaypDUSvit7NNwoeeYxgeBT
	lXhrQ8/yrzhiPZuLbF6SrauiAtPumILWDjmOD/X5FaOJ1uaeFcoRf5h+DgK/K8LtUACVZWzYiVg
	EA0EFLiPkVbe29tfyEdBzZdLoqpnHSiClPGQn5a82HLUUB4VeDCa6sOiiBbnjnYBLjvpdyHx6W5
	qRo+MaBzfmRLLT82FayI2xdsHGigMK2rqNL8ShGcFTx8jvWwuFU9ivdKnT/N/DNvw1jUrhBQwhX
	0yzT8E1b8O3mARRPzDiNOjoHK2M8jsg==
X-Received: by 2002:a05:6000:29c9:b0:485:8ecc:9415 with SMTP id
 ffacd0b85a97d-4858ecc96bfmr18626346f8f.48.1788884552482; Tue, 08 Sep 2026
 09:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
In-Reply-To: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Sep 2026 17:22:04 +0100
X-Gm-Features: AcwNN1U9H3bV0zPtcgBr5_fY5_Ex_KcZm0AWkc_KXas88ZieEy0_hzjnmDi9vSA
Message-ID: <CA+V-a8uSR2jgpYqeUxteqhSD-FuxKBT_o2519y1z35cg+3XOig@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add syscon support for Renesas RZ/T2H & RZ/N2H in
 CPG/MSSR driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Sep 8, 2026 at 1:31=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 17 Aug 2026 at 21:25, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs
> > in the CPG/MSSR driver. The CPG/MSSR block on these SoCs is a
> > multi-function block that integrates several system-level features beyo=
nd
> > clock and reset control, including clock monitoring, write protection,
> > and peripheral configuration registers.
> >
> > For the other IP blocks to be configured a syscon support is provided i=
n
> > the CPG/MSSR driver. This allows other drivers to access the CPG/MSSR
> > registers via a regmap interface.
>
> > Lad Prabhakar (7):
> >   clk: renesas: r9a09g077: Register SYSC regmap
>
> Thanks, will queue in renesas-clk for v7.4.
>
> >   arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
> >   arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
>
> Thanks, will queue both in renesas-devel for v7.4.
>
Thank you for picking it up.

> >   dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon
> >     support
>
> This is now in watchdog-next.
>
> >   watchdog: rzv2h: Add syscon support for WDTDCR
> >   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
> >   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
>
> These two have a hard dependency on the first five patches, so they
> are postponed.
>
Agreed, once I sort out the series [0] maybe we can take all the WDT
driver changes via renesas-soc due to its hard dependancy.

[0] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-=
lad.rj@bp.renesas.com/

Cheers,
Prabhakar
