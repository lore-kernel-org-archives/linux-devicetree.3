Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C46D383992
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063757; cv=pass; b=sFO4gvNajmHVjKSLutV+QvvVE6IkAPlLoUK9qmRAN+4dy40qIZ0DdFeM00Ppng24DymbGhjlELGSBUbRlGSVHm6fxZRdCxjdvwaihJeIgM8N/EWUvkYJh8EaQd1s0M4dHtzv23kESiyW9eihVt1r6OC4JfQdLku5JD8f317DJ3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063757; c=relaxed/simple;
	bh=eK/OAvD5T3nAKg67fnkrfSipcDgxi3KnfRYcdUcekeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mwU1o5P0rIhanQ0sCWw6WkpFkhkre0qMQAQFUp8JJt5Vw8XwNMxqRafU8NwNdStHerco8gYAc+Qj5r25oB8hqmbJoII+89Z6KSh0XQK61OnFOUN83Mf9hyZ2yK5NjAMgTVsguw0/M0MmDr//9cY9B1i5CP90QfEm5i6xQKM7NlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlqfDp57; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlqfDp57"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47de0093c42so4121730f8f.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787063753; cv=none;
        d=google.com; s=arc-20260327;
        b=JRZCuRE+gyHquOjT2hMK2tmD7vCe+gB2vUPcB+HUwgSSxe4Lu+SMlSPlcBZYXsa4lX
         Hnm/4NUqAmQOHA5Z6OzTlxAiAuNbjXHCd9PJUxOS43sLdH+l0VOOakepVZ4MJV3p2Tqu
         DViVI4iHL7he+YrpaEHeiwDJsT0eq7CIOiK4S+6+Aa46QwYSh47KRNoLabWZtqqUmr2E
         PerIxrn/quu7YTDkSINBFFn7zh/Yhubqz/BLKL/hcnXZGRqgty+P892f+4+Gw5ibqGnn
         8DnL6zt6HUqLLAGaPsHBED8ZzInY6WyVtQurhG8C688is6tBXvYfwksyZ7c6YLrVjQNo
         q0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MVCvZ3mYxT1SbXEXSshkIkro7sM7s+vt95nIOeUmgDs=;
        fh=0BhhAAFXyRGim8tXyykW3lTOv/iTMRjSBQnkma6T6ss=;
        b=ntGhRsdwPPpuZtMPjeowUjKeWj4cL5SU17eA5b/haogS1bKm6BWfvX7y2fDn7E1YGv
         wOJEXjAgGjdhgD0jqpdKkUV0vaxwNZGWJlHRqcQFJgyPG/khPnzLDtPzV5vzNwjMLYMK
         qDtdDVgL2RUhljU9RtDzh869mrdkoSdDKxxl4a98MSnYTsAoH2LTtUNOdCpZQQSqaJvM
         2qK96Yvljy7rYr4nDCFeZS4ke/KKPzs9xh/CbD3EX8sr0yNWuWrASU1vlVYCadifVgA+
         43Rj6tzhxcuMgPfC7bSIcSTpotThpj5UIbACXHf4qkNUcpTWLpSE4iCuRWllcK06I3QN
         bFXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063753; x=1787668553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MVCvZ3mYxT1SbXEXSshkIkro7sM7s+vt95nIOeUmgDs=;
        b=DlqfDp57i/lLeOaBqF9kekje2l/CW/2I3oNPwNIjDtKLctzc5RlpZkKpQs7BSSr/AE
         BcIDqRmiveEeUcq9iMDhkrllYmw4AEePUazKMJA5vG8eBgMPhMvzKd/io9XjkCexZFJM
         IvG7+Bjw5edbntqftIjRmveoMay0sMuhJbadM4cAvdqZC1tU5mee64GUwT3tt1Vj5Vdd
         6tsGI3Dn2f73dnwC5R1qdUQz0UDjGrxMoYaqH/HYDjKxlKW7xm9ToO4enu8MfZlfAsi1
         aXMaWksIPCPARWgzJP2vxy1F9Ur+QeJv4l1UHX1MWdwzQIPhxq5M5qxphWnDjfQLmbFL
         y+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063753; x=1787668553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVCvZ3mYxT1SbXEXSshkIkro7sM7s+vt95nIOeUmgDs=;
        b=g2NPZCKSsOxVgmy2H61wzcKOp2l+hV+vIyDf21yhKhD2pYaDR13g2oUzeK++0hbmES
         pxBDD31QoiugZV32f55bBXXxlL1uFQ4XqfA6KgHSt9vPskEusWj0nWykaMKcak9IMu91
         +AuMsIoJPL3dnhb2UcQHhIwyG5IqEcIJpFFYxY6mUENoQnbLKWuqUFcE+i9d9nvhYlwf
         a+6jIH1lsk2Sluzbl2uJloM83DlIuAkDjoH6jw3wlhj8GUCbcdvD1snajYcECye9IBx1
         C13pVljljIkst8SidNdp8/Wjdac+HPCsL108MxrTyKy8sZydFwM1DhOmCl9p/UCBcKEO
         Bjnw==
X-Forwarded-Encrypted: i=1; AHgh+Rox3OpRgdft4SC+WHKP9vXXUVIMjZGfwpQJAgOEoQ9plBaWpMLhckSkjsRuI5HtmmVSBjj/thguP8RR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzczpiy6fA5kze24qwc1FTKDjkLpxgQ+v3Qx+i6qMHi96vK7k+M
	4DsIUPL51luureIIktiiflO1bBbF3EIK8Bxg/xGdRSbszWVvHNm88oiRm+ezHM5HkwMWCbVYaSw
	/u335RrHNAs5DlfCWM9WBZTSSj8mK8fk=
X-Gm-Gg: AR+sD10j3gchpRd39PVIKwr6LPcC5r4rStAO6tWboJaOaX1tj6kK32lfDSKbEk84nyr
	ueOEXwALjt4D4+n3TDCoDaLNAPhQk96K5BiNJirY0X4Qm1QpI37oubP02C1HIkuBmL7Y9b7jhMr
	HBfjt4sDzdIa8gV0zfIgHNktjotWFCN/4YbDBmfg6wAVx3RAXqvtogJQZtOslazfS/T6Sz7hlF5
	amQWbbqENhRY/tj6gCPgO4fB7Vjr8eBD36seK0OyCruqwZ8Tt13X2XqzLHEq3MEeBUSRO+35plx
	ZkkyUSLKeHZKuwRycbYZJuva3T4/rpVLb6YgRiqn7vocxnWmxuzkBuTtQWVVWDHeC48jm+mwbZM
	IwOwpL99snCwN4Pe23I9YAFED2ZN/WMVQsTMvuIGYzZ2HAZB6zhodXd/LZXr5l1A=
X-Received: by 2002:a05:6000:3109:b0:47f:e748:3ae3 with SMTP id
 ffacd0b85a97d-4816070bf1fmr51894142f8f.3.1787063752390; Tue, 18 Aug 2026
 07:35:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <aoQvrL8cnnK7uxqw@ninjato>
In-Reply-To: <aoQvrL8cnnK7uxqw@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Aug 2026 15:35:25 +0100
X-Gm-Features: AcwNN1XrTnnWQE0HKkObvyxUFu7X0N_3i8zbJm_vjvyoQd8C8mij4hA0jhrhrcM
Message-ID: <CA+V-a8sG47PCuKTR-K=sci2SOEWjYRDOWRWeamYysvNO0XAuNQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] rtc: rzn1: fix weekday underflow when alarm
 crosses month boundary
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Tue, Aug 18, 2026 at 11:10=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, Jul 06, 2026 at 06:51:29PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In rzn1_rtc_set_alarm(), the driver attempts to calculate the weekday
> > for an alarm by computing the day delta between the alarm time and the
> > current time:
> >
> >     days_ahead =3D tm->tm_mday - tm_now.tm_mday;
> >     wday =3D (tm_now.tm_wday + days_ahead) % 7;
> >
> > However, if an alarm is scheduled for the beginning of the next month
> > while the current time is at the end of the month (e.g., current day is
> > 31, alarm day is 1), `tm->tm_mday - tm_now.tm_mday` results in a negati=
ve
> > value (-30). Since `days_ahead` is an unsigned int, this underflows to =
a
> > large positive number, leading to an incorrect `wday` being written to
> > the RZN1_RTC_ALW register. As a result, the alarm fails to fire.
> >
> > Fix this by utilizing the already computed `alarm` time64_t timestamp.
> > Convert it back into an rtc_time struct via rtc_time64_to_tm(), which
> > automatically handles month boundaries and correctly populates the
> > `tm_wday` field.
> >
> > Fixes: b5ad1bf00d2c4 ("rtc: rzn1: Add alarm support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> These messages look a bit LLM-generated. Is this true? What about the
> code?
>
Yes the commit message was fine tuned by an LLM, but not the code.

> > -     days_ahead =3D tm->tm_mday - tm_now.tm_mday;
> > -     wday =3D (tm_now.tm_wday + days_ahead) % 7;
> > +     rtc_time64_to_tm(alarm, &alarm_tm);
>
> This conversion is superfluous, we already have 'tm'? So, I think we can
> skip the whole conversion block here and use?
>
>         writel(BIT(tm->tm_wday), rtc->base + RZN1_RTC_ALW);
>
> Only lightly tested, please double check.
>
Yes it does the trick. I tested with the below script:

#!/bin/sh
set -x
DEV=3D/dev/rtc0

for d in "2026-08-31 23:58:00" "2026-04-30 23:58:00" "2028-02-28
23:58:00" "2027-02-27 23:58:00"; do
    echo "=3D=3D=3D Testing boundary at: $d =3D=3D=3D"
    hwclock --set --date=3D"$d" -f $DEV
    hwclock -f $DEV --hctosys

    # -m mem/standby would actually suspend the board, which is disruptive
    # in an automated test loop. Instead, block on the alarm IRQ directly
    # via select(2) on the rtc fd -- this is what confirms the alarm
    # actually asserts, not just that it was armed.
    timeout 150 rtcwake -m on -d $DEV -s 130
    echo "exit: $?"
done

Without the fix I get timeouts as expected.

Cheers,
Prabhakar
