Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A4396D38
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 18:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251360; cv=pass; b=FBEQc5NepnSOP8WqAE7edO7Ag192WEVzfnBeP/DmNJcSCjJjVgrmOwVyBmp+1GIFH0cZU17Jx//PD9LDEMR4uk1vZeKIZBqLS/3vILGTF0+pkAAe8M1qCYic6mkBqu29u86ft+llwxrN2JVqTLT9L1XEsHG9vKlTQkhOkpP1MJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251360; c=relaxed/simple;
	bh=60Gy80AqDCDF922FU4MPaATM1vUz9hD66trB84dzQvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJapYY8Xe9OypFrvzQQ0WwL9yfcFOaXEkv/95h/OguGYETV28lMcP2C/40KW+t8Nkkl3ti1cNgFWyOafWL1tJQM4VX6zUz7PBV5MuxIgcuYeFm6ECiHg7IjeQ9wozQSXnklTmcqRIDqyGUeVYBMUveV0woD0vHOUA3vzYKq2V+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHg0bXf6; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHg0bXf6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so862775e9.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787251357; cv=none;
        d=google.com; s=arc-20260327;
        b=XNgYczUIXTzofy35gmAQPxyYjOTIKi8K9fbKe/Ch5Xi67bFpKBeGJWLzMM17kNSRjm
         Qj/Arvxo8YXDf2iHGUvhID4YX6JHySCsB90ohr8xuf1AP/tyTKHvreVUGQ/krL/rjXbv
         g72ODqe6Z/OxVdzBQt6ksWFnIxeZBMcAW5r12QFf+eBbjJKDRf30Nzu+VSJLlNzLxTie
         uX5S6iofNsE3noLH6A5OiCqMq17odYKwZ/AoWG2h97Q38Xe8/E4Qn7kqAQS2zuUfk3UJ
         Q9pKJX25jjWSlwqkP94AsYyZQss6INGxQ7rzrcBB9Jy5mNs62L3uK4nlL9y+gxNNJH8C
         JykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vFqOYk3/urySuBJFd4x7IjPcpec6+kX2wN+yqUz6ICg=;
        fh=DcJ3KOI3/atVcaecxR+D558uK+Mj63QcJHGh5o1hYtE=;
        b=QcGc5JZFUXLyO4sbejdktaDDDBobRZB1lvuMNIyCCiIejREIhG9dkT6tIZq0meG6bM
         ESuoj4GtfLQgnCpIwmdPpUdG5lhIpjC90CRcNrTagZCMZOEnR12AFvtcVC4JSR7ZNTFU
         0MV3A/2+Lfn4Jw3Gig2VHG4EW+86yMi6RRLpHQR/d7wJeRUevYMEO+0D6Ihnn3uOocV9
         i0hz0vsQbpCTrmqp0q9mSh6KoP0n+MDE+w9ZiNNSE3Sz4/N5wcfYwjdRJzcx3bEKf77I
         JBjaBiljTlHQD3sGv5ucA6sZ67jnJlDQVzI1i0pr3wUXrhkD5XqCvNyPKg3i1ob+EjZJ
         UOSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251357; x=1787856157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vFqOYk3/urySuBJFd4x7IjPcpec6+kX2wN+yqUz6ICg=;
        b=MHg0bXf6ov77SfAhQcjwPP+2cN+kEIUCvFuKF7tA/NqBPaiY2y0gsHF1cO9MU5IzzG
         1b7i7TpVl9MYWedORqC1ktIen4H6GB3gTehwobXvrBiCMvt398aE1Xelp7btCPP+Us7c
         gPyRp6KYHIBxzAulqUqTpoNO3yqFSzIQdoLlGSm94El+0IX9l0y72I1fBYYQ2FiFI5U9
         duiu37kc5vnyUfcnbl0MQiFwoo8JKoqi0Pux5HW21zi1YnViRGbF/dwpUd5nf5O7pvoN
         w4SIULmfVIxR38OJcg1UtJ5DNDg1XCY83mfrGRSzt3YzU/vmoTi+4AwvAdFKK/j4J90y
         pZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251357; x=1787856157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFqOYk3/urySuBJFd4x7IjPcpec6+kX2wN+yqUz6ICg=;
        b=dWuDW7HmQqXIiXol1mwfNeSttirpbp/4tUJXEO2mvVWGbQ9QMZfIucjB/r2JBJO6X8
         YD20LwqiIoOXY5DpDU+3Md5p/0SEf1H+D4Y5huGcB9ahL58Tgi1CcbjGQSha5IAuzYDh
         L0V+4M3595qYgS7WSJQEBy2MOOmVe7bcT8XeRCbQsAYzydQ/CfPOyhgU0TnWbxNHnwyi
         y3qJVajVbSPyaTRyYIvzP6/7zj/Hu+WajKNLprjIR6nw448q964vfuRpSETyhhW1dRcC
         wDAl3gzUjqgt6Q10sm6WMJ9S03wlSJonFNr4ReuUl/dZiaSR3gdqOxSINyt321Z6FEoq
         NGEA==
X-Forwarded-Encrypted: i=1; AHgh+Rrz94d++7vjxT7EnPwTwsloC/7EyyyFIlQtt/dr9APTGdaBUlkTYDNHONgusGBH70NHSsbAaVgFWxKR@vger.kernel.org
X-Gm-Message-State: AOJu0Yws9/pGjaE9DVHkHXC0G4aCGkX/KBTV+4Sy1qTYjfCTULUhPLtP
	yKUbfS84iOFfikH3U+g2ptleYQQQXCMq97M9CTFqV1iwaEI8+qV3yVAY6lzW9CUKlJ7AD1sTGGU
	/0E1brPT0JSY7wFLUIcE9elmU23eFrY4=
X-Gm-Gg: AR+sD12irNKCrZt+/kJpdqJbbmEu02oPn7BwcevUwfs7Fp8vjy3cyI0hshCV6LDIbq9
	Artj9aEcFGz+b3CJyK0UYRcoGvVRX/2eqPpKB10uK0/rBKZgtt+Bc1FWvrmW+xuKv0iloPXMmQW
	JTRWdYjrdrJcTE3tYTbdtVTnPQMoKSAjYzkLuzuATfJEDKSqsXb+cNYMnJ6fZ91CWw8IEBBtUNh
	t0DeV4aPYLkTjfJ1CAREer594tojxQMHYec1WFZHYWdW1zvU/ApDozwwhRbvEL8PdhIy1neXwuO
	JCGdrewtXdhJkyxNC/7HmXtsCc7/gfnP1slRYzlOKQWWa1GT73q9yfGamNT6KRjiD57AM0O+9vW
	I+beEnNFIZrJuYgEfTC2qALIcjBO0ye7I1g06xtHQIlnqQA==
X-Received: by 2002:a05:600c:a102:b0:499:b81d:f580 with SMTP id
 5b1f17b1804b1-499b81df6a4mr20364505e9.2.1787251356632; Thu, 20 Aug 2026
 11:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819105028.70F3A1F00A3A@smtp.kernel.org> <aoWqIxFRItjNu6uN@shikoro>
In-Reply-To: <aoWqIxFRItjNu6uN@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 19:42:09 +0100
X-Gm-Features: AcwNN1V8xZnCN6jYwc1rWmadht_y4_htRRVcU3U6J7W20ZY6lIODI2Uy1wnE-ec
Message-ID: <CA+V-a8vuA5EnPP8iCsCi2e3HY-qO6iNs=1bP-NnfQMDrrQK0vQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/15] rtc: rzn1: Fix alarm range check truncation on
 32-bit systems
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org, robh@kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 2:05=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > [Severity: High]
> > This is a pre-existing issue, but can this sequence of register writes
> > trigger a spurious interrupt?
>
> I think this is true.
>
Agreed, I will add a patch to disable the interrupts before
programming the ALx registers.

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 44e8db466cb7..09631a3a5134 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -280,6 +280,11 @@ static int rzn1_rtc_set_alarm(struct device *dev,
struct rtc_wkalrm *alrm)
        if (alarm > farest)
                return -ERANGE;

+       /* Disable alarm interrupts before reprogramming the alarm. */
+       ret =3D rzn1_rtc_alarm_irq_enable(dev, 0);
+       if (ret)
+               return ret;
+
        writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
        writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
        writel(BIT(tm->tm_wday), rtc->base + RZN1_RTC_ALW);

Cheers,
Prabhakar
