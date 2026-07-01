Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BE13F44C1
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906680; cv=pass; b=fQ+bHWO6DioX8zDNB2rZMp/aKUyQBCIYofZxXEs2FWsAwvJRo6BK9Z4ley/giW3F3A4ZmjxeYlYFH9W2Y3cBjgRD5RNSQIBkERgR7tUoGNU8FQ1KZiacNmG+qJInglO+py028LROnKYiPqMLCu4SA/IjbfgdD/6AdCipkHDpiU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906680; c=relaxed/simple;
	bh=M/+SMymne1NHIJ08br0Iv9r1FCtD6uezmPVTRy5NyM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIjCFQR7v5uur/7B6WoBCQG/Fe3FkodF98BNSRwgEDyALgbuROJtBv1aOEaqbkWE4kShUdSxGKTtDJJuBXNN2eHvR22XpKuZE8Y4dogrJ6BRo5BERDCLQaPiAesACpyBSe4mwj6DxWu94sKjqkda02Hw1exJ9c3epLph9JoaoDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVAj6bbp; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVAj6bbp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b691cb44so3798535e9.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 04:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782906677; cv=none;
        d=google.com; s=arc-20260327;
        b=Z5y/OpC4CEIXd8RLXYmRCsEL0oMIwyordq1m4oiBu4y75/nybeqwuOmJA7avv9A9vg
         F3mnvKU+HcJexdIFpez7UzX5eyOwAICW+nR0OEPIgbrPG6D6TZd+p5e9UgvEvtB8gIRf
         v2HBUnjosRFw14+pokPauRU+X+ZRgYmiEFDN/zvbfH2qZRc7Ccw6/SqoF8MjwByIU+vc
         YKIaLxd0xwpksXVsPwQ9jIHTgqYGkxBr0uBqq9Sartvv7kOCbUtTxm5j+i+k1LNTcnwW
         LHLzxAd94FFI3NB4B9tWO1fsTDuFzp7RrucgycdsdtrPlqvl6PZUwYG/IGZ1mRKuSKTb
         PcWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B3J8GjYCGvd0000CfDb3gYPn5ju8UCLM2F+SDI4mj1A=;
        fh=S0T9dvZ2Gzg4VejnjYZH4kSPVXePhCY2dNMlEBczsMA=;
        b=OOPWqIipEye8ACoWdAjsSwnNVVJ5ycQN13w5NqLX0GJ+E/ZZmIZZkTPVhi8n9G1L3F
         no7sJvs0h/rhYSH2GkoDK/XQF6JpYLML0NaPt9SDMo0uRLkwcpdQC7Uts72LPQT04ZGR
         chvJn2Qpo8lwNN05xDMI5lsCdbdMaNWzc8LrKj5OR42LM5XMeOktf6ZSkwiu3yxZ6SVz
         9d+HpFY74HgL+msFoY4WTrI4ZWTWHRmq5SkmAqZHcIIeRpPSZsWj1O/ISn/91uZaBXZs
         /Ko39RPCNCxm/zfKM5bSBkKulHulbVlANvusXFynrwwxGPXGYJa5jksy97lpRhkneasv
         bUfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782906677; x=1783511477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3J8GjYCGvd0000CfDb3gYPn5ju8UCLM2F+SDI4mj1A=;
        b=gVAj6bbpyXbiriGaQ171s9pQ8nbPtcOkzfjgh07dn4UZHye16BOaEyNw1Mxk6eHkuC
         jPW0cStj+mdVJZE3i4zwA0kKr6pq98dKNWachrOGrWBaailqI+N/h56BJa1peg4nRQX4
         IZCuXzAWR1HVu13QODpSdsnCWVUQbNldK1ZFjN9PfdTHwKdWrH4RlSZlLUu7N/547UR4
         ZaozG50nm6Ju5vRZtxlUWiPXN6PoOLBVN1jhYV6ljwN6OARQZZjuvW2jPJkFXFB6hmXJ
         otp0lwFcvVGJALLSXPrYlaXrjmIs5l1ec77rcY9swkiWy7PkH3vyfk4ucKIV07IUovHb
         xWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782906677; x=1783511477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B3J8GjYCGvd0000CfDb3gYPn5ju8UCLM2F+SDI4mj1A=;
        b=Nu5Nabem8GpClmwpwZZhMqQI8P9lJpvlBrT/v82uM8q+f/qdAseibFdFDuw8SSpykE
         y9nmQMbh5im+oy86tl1gb02Ve9MxOsbDvdBkpSRTTcmDDYpcc0eljAvz82DO5Tbt0A77
         4BrL1xu3TO6q11gilGZfsUdFNQXvl4uOufuMSQievbssiKGQ/o2h1H4oMNqZWgeG7fkM
         cATPYQnwoOTHedI3MZNa46C+lEk2T3RqItdpkzO/enHsSGgNdUJfserzVIuKpnXVY8NO
         Bp8dZXADLK0P+SYimp8z4sDMFtLwxByUDtrwGJmSUPWNqS48F4HVhBIhqdEVm7MztCBC
         O9nA==
X-Forwarded-Encrypted: i=1; AFNElJ8vK5FMgNiPLehunk1dy7BxD53iktHUCwKhBwQiRQO8YitS7Ry45vSjQjm6jKU+bIUSDScpa4otkbCi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdp+kgjmo/wESPfxrzsfyjkvCp3d35b3sYzvmYE9pvW6mExFTC
	eR05zvJG+t/nBnH2hbtZGjT/TGON4fdP7/NiA6RCaFI417IcuKk4Msi4nqS0Aww5Q+AVSYp7SAv
	B0cwQRlh0FJBuOA9We0vB7ofTudbGPaE=
X-Gm-Gg: AfdE7cnit5YETvvFDt8eFBv+ZzC9L7Tvr/FjQjxhbEMdIRpHl/YDADnEs5wZKZYCqz2
	npaJyDWqoDWR/2AEMvRSd89UXkQli+Nfl54lf5AtXInzl61PbeB/RXDtGjdFhGJPArSQTkknaBO
	t8K5dnj70MW/aNGtNeNyluUCWsf0WfeC2LRO8eA+aUFdaiba/ysbwXBsJtC8UcgJ6P/irmOAdpz
	z1PKZE0bILYvZ6NWGElOVVSzNKuD+Y12q1jYjWfsLcghdTeCaeqlzvPxhMU3l24TSE9FaKmVN3q
	n/niXAl2CU3C59cfHJMxEbzxC8xkPqCnu9iGGweVUkVkcibiHfqR1HzF2jI=
X-Received: by 2002:a05:600d:111:b0:490:9d1b:f086 with SMTP id
 5b1f17b1804b1-493c2b587e2mr16042265e9.14.1782906677184; Wed, 01 Jul 2026
 04:51:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ajJ9kNJtrY6DyQ-S@shikoro> <CA+V-a8u2wt6623mYjhipOvJPo4va+bXs3qirQewocFr2QmUFhA@mail.gmail.com>
 <ajr1wXCI2U23d1sY@shikoro> <CA+V-a8tfb5YFsh-K5F8OOBsuJi0PG72vQ=2PQb2avVNF8-kcrQ@mail.gmail.com>
 <akTzY0hQqwAprV4g@shikoro>
In-Reply-To: <akTzY0hQqwAprV4g@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 1 Jul 2026 12:50:50 +0100
X-Gm-Features: AVVi8CeeNRpSCaiae2snM5PVfRFJw2FRtdRpVxhyI4vTZki_LMyi3HTECaunbKs
Message-ID: <CA+V-a8vQhbpMYHqvARRAkqRd0tEgzmFnUmpsVcd95nn-e9FaKg@mail.gmail.com>
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Jul 1, 2026 at 12:00=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> So, when I improved this driver back then, 'rtctest' from within the
> kernel was my reference. This test still passes with the current kernel.
> However, setting an alarm one day in the future does not work for me. It
> just stays the old alarm. Without your patch series, that is. So, I
> think this issue should not affect your series. Especially if you can
> set an alarm more than one day in the future (and less than a week, of
> course, because of the HW limit). Can you? I recall I had issues with
> RTC programs compiled against uclibc. Despite I am sure I used a
> glibc-compiled version of the rtc-tools, I need to investigate this. But
> not now, but somewhen. I have to take care of other issues first. Let's
> assume for now that I am the problem.
>
All tests pass on the T2H/N2H EVKs. Maybe there is an issue on your
side with uclibc compiled tools as you mentioned.

#rtctest
root@rzn2h-evk:~# rtctest
TAP version 13
1..8
# Starting 8 tests from 1 test cases.
#  RUN           rtc.date_read ...
# rtctest.c:59:date_read:Current RTC date/time is 01/01/2000 00:03:09.
#            OK  rtc.date_read
ok 1 rtc.date_read
#  RUN           rtc.date_read_loop ...
# rtctest.c:124:date_read_loop:Continuously reading RTC time for 30s (with =
11ms
# rtctest.c:151:date_read_loop:Performed 2790 RTC time reads.
#            OK  rtc.date_read_loop
ok 2 rtc.date_read_loop
#  RUN           rtc.uie_read ...
#            OK  rtc.uie_read
ok 3 rtc.uie_read
#  RUN           rtc.uie_select ...
#            OK  rtc.uie_select
ok 4 rtc.uie_select
#  RUN           rtc.alarm_alm_set ...
# rtctest.c:262:alarm_alm_set:Alarm time now set to 00:03:49.
# rtctest.c:282:alarm_alm_set:data: 1a0
#            OK  rtc.alarm_alm_set
ok 5 rtc.alarm_alm_set
#  RUN           rtc.alarm_wkalm_set ...
# rtctest.c:334:alarm_wkalm_set:Alarm time now set to 01/01/2000 00:03:52.
#            OK  rtc.alarm_wkalm_set
ok 6 rtc.alarm_wkalm_set
#  RUN           rtc.alarm_alm_set_minute ...
# rtctest.c:394:alarm_alm_set_minute:Alarm time now set to 00:04:00.
# rtctest.c:414:alarm_alm_set_minute:data: 1a0
#            OK  rtc.alarm_alm_set_minute
ok 7 rtc.alarm_alm_set_minute
#  RUN           rtc.alarm_wkalm_set_minute ...
# rtctest.c:464:alarm_wkalm_set_minute:Alarm time now set to 01/01/2000 00:=
05:00
#            OK  rtc.alarm_wkalm_set_minute
ok 8 rtc.alarm_wkalm_set_minute
# PASSED: 8 / 8 tests passed.
# Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0
root@rzn2h-evk:~#
root@rzn2h-evk:~#

#Alarm for next day
root@rzn2h-evk:~# date -s "2026-07-01 12:45:00"; hwclock -w;
Wed Jul  1 12:45:00 UTC 2026
root@rzn2h-evk:~# rtcwake -m no -s 86400;cat /proc/driver/rtc
rtcwake: wakeup using /dev/rtc0 at Thu Jul  2 12:45:35 2026
rtc_time        : 12:45:34
rtc_date        : 2026-07-01
alrm_time       : 12:45:35
alrm_date       : 2026-07-02
alarm_IRQ       : yes
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#

#Alarm for next week
root@rzn2h-evk:~# rtcwake -m no -s 604799;cat /proc/driver/rtc
rtcwake: wakeup using /dev/rtc0 at Wed Jul  8 12:47:38 2026
rtc_time        : 12:47:38
rtc_date        : 2026-07-01
alrm_time       : 12:47:38
alrm_date       : 2026-07-08
alarm_IRQ       : yes
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#

> > I ran some tests for cases #1 and #2, and we see an out-of-range
> > error. By adding a 1-sec leeway when checking the ranges I don't get
> > the out-of-range error. Let me know what you think (I'll create a
> > seprate patch for it).
>
> From a glimpse, I think -ERANGE is correct. Increasing the already
> calculated 'farest' doesn't sound like a good idea to me TBH, unless I
> am missing something.
>
Ok, I will drop the leeway change.

Cheers,
Prabhakar
