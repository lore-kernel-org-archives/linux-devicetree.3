Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FBE47669C
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235893; cv=pass; b=SSY0cH18T+A6/mtefCodGm21CIJy4O0oc6gzFqPhAA5zSBXFTaqV8tGohyETzh9yeokGsn2YSpe2MlH3nS2idnYq1ALEUVGC7yy/gI75AZcCQnthSRJCTVXot9/hiFPvoxGkwcMgrFoBmIzwMrS+U1pnRx2MGIblc3ByG3N2Pho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235893; c=relaxed/simple;
	bh=4ua3cxV8dhkHOIff05LR1Y3qFBHcVH6d6nazxugRB7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5bbdduSQYfLU756ksnoD0/zwVkN9xElpjhNW+Qu78BgfswjgglSrbwfF2bEyAbBfG3nXnIl8qn/xKojS9i31q2CBErIfM+wuycCeqsjHUzgeCiKxX0LkdpR0W+AZg7/I7z5jTIFI3mve7bgLrCLZHRpmVQ2UD8X8t3YUMkKiBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgJHC9aj; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgJHC9aj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49954b88fffso24274545e9.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787235890; cv=none;
        d=google.com; s=arc-20260327;
        b=W/tmqGoVN2jsrOrIHyLtLLJ/dtvyvKH+4UT/tp4+pPNK/LjkSliaGriV2N5cC7n1di
         vbutvqbpglmLh46dFM24kMLLeFzhVP46OPNpWQ3rWSKqBLhjKLwthdaobOrDgv8qcDxN
         KGiWaLm74gfeOvp2Lc/pGnFCH8vC75he6Dnv5WgNk2YO98VBSdfs7t7IfUL85Y8eyj6o
         IWJ8lJjtbpSJ3d+beotvm7R1qQZXOSJZoRnn/5TQEljsps4ef1mcELXEhC5Mbiw7TnKp
         tBKdK0zmN+5NcHdJVJV48pd+Vftj6LX8qDyi7f1PyqwvH7Gi2x0JvFBT/52vux/LPT5/
         wPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vGtwPp5SElePleI/4XLp2bHhqRVpPgOhFZ40qM1IKko=;
        fh=OMoSC2ueZkCvPy1rGjTpwZFHdJfNObRSDbscisM6g6w=;
        b=MYsEnrM+29wCstXE98mRmc8Ob92V59Przi98dFEXRuFdYOTsSSua/2ia0swY1pg0BT
         5bTAPpuLYSr6zSUSakDoqM0VfkkmGq/a/lYwXdF4aWtryUsIsoOIzKD2FLlYz8I4GOVu
         eZPMhmwCbifHNRkEFCwvl1bQku388IdTnqV1ITFrHlTMZao2zgaFZN46zV4P581MDMIO
         5+fWDSXmzT+Y/XEq8V5cJ5Fe9093oUjZsGrZO+lx3EOtRCUVsa5Rwo0Y4Qj1OMt197nY
         rO4RYhckAGmj5N/77x594Z8rQ9T866kQ9ZYXx+o0UDMmf5AYvMcLipWeuhbX12bNUKp7
         wkLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787235890; x=1787840690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGtwPp5SElePleI/4XLp2bHhqRVpPgOhFZ40qM1IKko=;
        b=LgJHC9aj52KmTMuxMcUaG13G6DhAzNQIkedGybzGV56eGW4huMGy1TNr07pv7TOFCo
         yxApEc+jjb6vMBimUS2n5xpfE4H9fFEcHZ2S2dzKXDaByjL4oHV/sTSF1OPxN/T9WsF6
         5LIfu4he6Lllas4kcu7CiPyoPTsq48J8q0rtkelOgzTP93oX1LzK73Q1jLHEur9rhYP0
         FcZAqsWXokIJZKB1ytF/rdXgYFXYpBIwIgkYrT8y4OtDplU513IvnMPORLKje2PZkAzX
         dD7pOf0oGYioJDeDk5tuhKw1ObaUZrLwOKYbglRz8ALK36fz/QSFLyaVswfQ7+SyHSGN
         uv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787235890; x=1787840690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGtwPp5SElePleI/4XLp2bHhqRVpPgOhFZ40qM1IKko=;
        b=Ny5X6KMZwCw2uuKSD2pi43OSk9uEhSDJYynjkcDle5VLxa+s566PazeHK9fcNHDVct
         pltq2l2A53x3jClQ7DImCaUBUxVbRavbVaVdyNM/TKXxvyHeVTNUDJb9f0lD2VcP6eZh
         m0zj0Z3N6+dCaMN7i7lJ4B0nHS6LzTRDYwCZ63+5BCDa+F0JmENb4CiUKsaiRb10EdqU
         FqBr2xa2dNz2TGxhQzsctXSpZpcqhkxADCVJZmYTic20Ihn0Q+ONYrq5BcjsR/1J5LgW
         VxjCxp+X6pQq700ocJZfHpvuVsFRnNOuNoBSNTOwIlSsppabjCjl/JT9ONGA01eCyBmn
         ZBuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGSW0quO3pG2rSbhq1phxopwyzf+jNvMTBN0KvAoTY78PY4mm4SlsL0wCqsv0BEO5gFK91C09f6w6t@vger.kernel.org
X-Gm-Message-State: AOJu0YzYQ9iyFiIlpyrim/N3e4lgUDSz4N0WKPvLVmES2O/geB5xtgmC
	Jp/L8bbtPPLsk+PHBjqLfXXK5NrfwLWzKNS5kFTFWKgvmecKkLx3EClF3qlV4q8JD6LKWYcKgjK
	DidwCAAMVAaeWwPxorlTC6ghIc3wDZvY=
X-Gm-Gg: AR+sD12fvyMImPU6voUumAAW/WLTlr3FVcwbVChs+oE3d8L694boo8aPdRcS7ElPGmO
	BC13g48Ir0ymi2X6dUdy28Yiz2p2djnPpZi3ryC8LPB+t4ai1XJPkcztwUDkBjhjEk9IrYxKhV1
	V03tO99ZUKkI/p8Zmq7QErOfxaLQ2s7OUfh4RfqJbB3OjjwGWNPEWp0funlqoYzKDMZGWyNFeKq
	ZpCXT1wSjTJvcs02kDuQwnbRMBiotIlvOOHTHL1Cdl09V5ZOL/D0FX/E8XyazYHp6+HrfK1Hjf2
	xAUzqi9HoReWMSneRFwGTpBRJI6VpP3GFf6lrxm3P1PTAg9/2SvTZiaybw0kYmDbDZczHjqDayb
	XVhmTXE8578tQvjLmCHR/M/m8NmSbas1qKDiP7p5m
X-Received: by 2002:a05:600c:3590:b0:493:a966:d5b5 with SMTP id
 5b1f17b1804b1-499aa14a75bmr231032105e9.2.1787235889336; Thu, 20 Aug 2026
 07:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819105356.BD7731F000E9@smtp.kernel.org> <aoWpLvrNGHBPvFY5@shikoro>
In-Reply-To: <aoWpLvrNGHBPvFY5@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 15:24:23 +0100
X-Gm-Features: AcwNN1XjPbCVWInvwnEJK7fURmifV1Jum9U6XzA0i7unkeraDGkwFi5MdsHj34Y
Message-ID: <CA+V-a8v23+zevx_xRS-GeHG2yk2k-M2UkPxoC76t-0JewRk9Dw@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] rtc: rzn1: Fix weekday underflow when alarm
 crosses month boundary
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	linux-rtc@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 2:01=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > [Severity: High]
> > This is a pre-existing issue, but does this time_after() comparison
> > allow bypassing the 1-week hardware limit on 32-bit systems?
>
> This is fixed later.
>
> > [Severity: Medium]
> > This is a pre-existing issue, but what happens if the RZN1_RTC_ALW regi=
ster
> > is uninitialized and wday is 0?
> >
> > Calling fls(0) - 1 would evaluate to -1. If the current time is a Satur=
day
> > (tm_now.tm_wday =3D=3D 6), delta_days evaluates to 0, which bypasses
> > the if (delta_days) block and leaves tm->tm_wday =3D -1.
> >
> > Since the core function rtc_valid_tm() does not check tm_wday, would th=
is
> > propagate a bogus alarm date to the caller?
>
> This looks worth investigating to me. On RZN1, ALW is default 0.
>
On T2H/N2H too.

I'll create a below patch for it:
diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 8c70dbf8c7ec..e0fdb591ba91 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -234,13 +234,24 @@ static int rzn1_rtc_read_alarm(struct device
*dev, struct rtc_wkalrm *alrm)
        if (ret)
                return ret;

+       ctl1 =3D readl(rtc->base + RZN1_RTC_CTL1);
+       alrm->enabled =3D !!(ctl1 & (RZN1_RTC_CTL1_ALME | RZN1_RTC_CTL1_1SE=
));
+
        min =3D readl(rtc->base + RZN1_RTC_ALM);
        hour =3D readl(rtc->base + RZN1_RTC_ALH);
-       wday =3D readl(rtc->base + RZN1_RTC_ALW);

        tm->tm_sec =3D 0;
        tm->tm_min =3D bcd2bin(min);
        tm->tm_hour =3D bcd2bin(hour);
+
+       /*
+        * If wday is zero, no bit is set in RZN1_RTC_ALW. This is the
+        * register's power-on reset value.
+        */
+       wday =3D readl(rtc->base + RZN1_RTC_ALW);
+       if (!wday)
+               return 0;
+
        delta_days =3D ((fls(wday) - 1) - tm->tm_wday + 7) % 7;
        tm->tm_wday =3D fls(wday) - 1;

@@ -249,9 +260,6 @@ static int rzn1_rtc_read_alarm(struct device *dev,
struct rtc_wkalrm *alrm)
                rtc_time64_to_tm(alarm, tm);
        }

-       ctl1 =3D readl(rtc->base + RZN1_RTC_CTL1);
-       alrm->enabled =3D !!(ctl1 & (RZN1_RTC_CTL1_ALME | RZN1_RTC_CTL1_1SE=
));
-
        return 0;
 }

Logs:
    On a cold-booted board with no alarm configured, the following was
    observed before the fix:

        root@rzn2h-evk:~# cat /proc/driver/rtc
        rtc_time        : 00:00:19
        rtc_date        : 2000-01-01
        alrm_time       : 00:00:00
        alrm_date       : 2000-01-07
        alarm_IRQ       : no
        alrm_pending    : no
        update IRQ enabled      : no
        periodic IRQ enabled    : no
        periodic IRQ frequency  : 1
        max user IRQ frequency  : 64
        24hr            : yes

    After the fix:

        root@rzn2h-evk:~# cat /proc/driver/rtc
        rtc_time        : 00:00:25
        rtc_date        : 2000-01-01
        alrm_time       : 00:00:00
        alrm_date       : 2000-01-01
        alarm_IRQ       : no
        alrm_pending    : no
        update IRQ enabled      : no
        periodic IRQ enabled    : no
        periodic IRQ frequency  : 1
        max user IRQ frequency  : 64
        24hr            : yes


Cheers,
Prabhakar
