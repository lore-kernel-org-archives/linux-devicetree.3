Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6533955EC
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294875; cv=pass; b=WLLx9qTKizmBo0lOB6WTyB8tcYDICE71V60tINaHcO99a9BLxtAWhzZ5e1bIs3XWpRjBSw5m8Qgo1UmkpLflYwCjFmmndAADy/FkHrn9R+3KYB7RLAXsWWArXd7F/2dr2uhBBi4422+zKnABLUzUsrgRA/99axeHF/wx7AZneqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294875; c=relaxed/simple;
	bh=G7McnGzDAgC/O+5kkADtYO2MXqBKflAE5Es+/QUD2pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1W1QwF1ak0gSE29BOkzd/b89VVlJS8l7mr9ST7/JCPsjEmyhC9+IdIsb8nbrZlwQN7ANn1l1SGEfckqx/NDXeFTQ73HExH0+T5qfdUdkYsxsGKEPzkAgEaedYbvNMSMbOVsoPfQrLen07/Z/p88gaPYmUk9BwGRIm3EzI3A6BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkaUqR50; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkaUqR50"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-46066e640easo550582f8f.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 02:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782294872; cv=none;
        d=google.com; s=arc-20240605;
        b=UFZWoagfDx4qVpiTgKHnP6N3vot/4wg9wO81ac4Ga7MTjg3YLuBzHMH/oBWbXmKqFB
         2ztBiDrr/0U+MVjdbBE2Vf4Ib8UwL11RQ8zMob/dE3YJzblWe/o1IhUNSJUrJ31nigJf
         aRKglWmXsBa3VVKmCTnhQRm0z1xg/qpK4b6ESzlv9zU8AZhQE9GQcXwxuh71qrutFV0t
         IQJGCnAuv8yoTrUy5k/3jZb0m7OyIjeJ/6f7Q9O7jY480kzO8lyDBa5c9ZlGWSl9pA5f
         b4CRcOnRryQKb7jRVxkLldIdB+G8YaU8Ag2RB8sefaYnkVN+NykLuSTZpMGQ4ARKj7By
         5jCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ObqsI1pCoD4Da2/XxZ9CqBQX9rgxlXpIUEI/2gcibd4=;
        fh=ZMi94/R4MfeTmozaTpLWV2W92vE9Fd3sz+Zc/q0jNa4=;
        b=SFGudhVYD6oZbiZLR7kXctdNkKqDzXJZJDhC8dGYXnBv4zDPmLz9fgKlPI8trUXFBe
         MhUtatq3bO0O1oBl3jrwFkCVJC2dUs5JJgVlaj2/kn50Z3MxevM5A/oiOMWeaf+GbYUE
         CHwWHJK7Vwb9VIDBbVVOB+lDViVaERbnm3sKt++7t0BLJxPIfP5HWaZFzdQG9JMF7fm8
         Tn3xp2I+ZsStAuvHxG7DcBsLBY7DzYepPQ1l4uIXx8weNeJSYJtUPO+4EM8d9TeygIPA
         cGSK5C3fIAEj92EYTbFdOrk+EbayNJpOamvKWP70wlrzn5ji04t5jNIiXIFs4cHWxkqk
         GT8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782294872; x=1782899672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObqsI1pCoD4Da2/XxZ9CqBQX9rgxlXpIUEI/2gcibd4=;
        b=dkaUqR50YTZlxtCAx72UdCM1RH7NxEvldd4TstWF1bQfzhwsIGA5bTSrQcByQCnqeH
         BIIquIz6sNMxeFubAAidHW/QfDgoBe6Se7/8lF5u448nmE6khdBcO3gh5uriBlcwSaV7
         dfnICjm+uf4oojzQjqINbkvK7GgEMrC/l+jam2jYd9++VcjD+Jr/msTMtT5u5Llv+AfM
         ydw9vr1SWMIRBub6Fnr+I0me72Z+1fLlVN3jr2PPwqC+8GL5b58Z8XycFO6L09UsOGdG
         BcPXuS4UsgRJbVZLO65YTVbaVAQ0pp+ALyCejnmhJY4ZR+bPb6s9VRCjxe6OuaO3kQ9V
         Zz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294872; x=1782899672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ObqsI1pCoD4Da2/XxZ9CqBQX9rgxlXpIUEI/2gcibd4=;
        b=eaCGolW876E/o0xgKBPyaeNU1PpRYd3veqewHApwF4fwn2HvaUKWYLjSTeHpZo4Ido
         +rbgyibJYqKbWwrKDjueL63e14QdQ+EEhJ9L60YUCfojDcUfyRu6txkdW2YM6AzzQIUb
         s7sixOjqCC40qhZMu+lZoHMHDVvXJ6lfJ/wfF5yJn9fz8YPvntKg+Q7lrQoyH1bR/zdY
         L6ZO8SBq5lIurmx91SNZlqUNGCSVOnIZwd9liXMnEcxcV02N3hbdZKK3lWureV0P9HWX
         4ZHylODET+3dpB9ErHY1uCSPFcLlUeqKQzo+5gTu2eiKci79UWs8jJF2yjPt2O7F2IMD
         nGIA==
X-Forwarded-Encrypted: i=1; AFNElJ/nWV5rscLFlUTEIZ1W5/UB0H+SRLylLOGZpAOFFjzfePF6LvQ79bt37BvmHC/ghxrKtzEAnqVB4VcT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8uYtVEdmbtt3c8kz+77EJB6AhZqhj5qfTrgYYVkAZ8uLlwGnM
	f70mAzEcgneRR0E5jRcnMd32abVs68E9QMoliXHC98xJv4vPGq8ApcLfyCROL/Y7mb/184uK4TF
	XlzEUKZAfxqKlYvwW/2d37RtoO0sZ1Dw=
X-Gm-Gg: AfdE7cmqW+y1UblGZEImQf+yWdAnANelBdRk7osz1Ag0ua2zSIVYKRWWqYYuB7biF0O
	aDU4WfvPhP8kMwBRSO0r338rsemo5T3A90Eqx80EF2nIIdG1YOXARePa0J7LYMk0i6XS57r384V
	/HozMTvBAENnW+ig94p/oyQ8yE2/BB4IDRS2BSeW4ND2HvWR7DZIITyF8DxXEzh7/LY2Ldb/LPO
	o/jgA0dnEzx1jvEjAZ043Nol5QCc8XgiSLlK5P/FWtrE6yd/0SbrSb8BoFS60wVKKGkW9Szm42b
	IYHGghQwc81a9uBUQpLpV3ItxjIuCsoBdYLKGVxnEnKiaVYnHbYsMnCVhtYp
X-Received: by 2002:a05:600c:4f93:b0:490:3f7a:108b with SMTP id
 5b1f17b1804b1-49260852341mr31752025e9.16.1782294871891; Wed, 24 Jun 2026
 02:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ajJ9kNJtrY6DyQ-S@shikoro> <CA+V-a8u2wt6623mYjhipOvJPo4va+bXs3qirQewocFr2QmUFhA@mail.gmail.com>
 <ajr1wXCI2U23d1sY@shikoro>
In-Reply-To: <ajr1wXCI2U23d1sY@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 24 Jun 2026 10:53:53 +0100
X-Gm-Features: AVVi8Cevqm9oqdlggQH1rMr7Spj8hW-dVFTCrlA4kct0_6oDoVWBpLIfXWaxx4Y
Message-ID: <CA+V-a8tfb5YFsh-K5F8OOBsuJi0PG72vQ=2PQb2avVNF8-kcrQ@mail.gmail.com>
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

On Tue, Jun 23, 2026 at 10:08=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Can you please share the commands you tried, I'll try and replicate it
> > on my side.
>
> Sorry, can't give you the commands, just from my head: I tried to set an
> alarm more than a week in the future, and the alarm was set to the next
> day. But I was in a hurry, maybe I overlooked something, because that
> handling used to work in the past IIRC. I can return to this topic on
> Friday earliest, sadly. Maybe next week only...
>
I ran some tests for cases #1 and #2, and we see an out-of-range
error. By adding a 1-sec leeway when checking the ranges I don't get
the out-of-range error. Let me know what you think (I'll create a
seprate patch for it).

Case #1 reverting this patch:

root@rzn2h-evk:~# date -s "2026-06-24 10:34:00"; hwclock -w;
Wed Jun 24 10:34:00 UTC 2026
root@rzn2h-evk:~#
root@rzn2h-evk:~#
root@rzn2h-evk:~# rtcwake -m no -s 604800;cat /proc/driver/rtc
rtcwake: set rtc wake alarm failed: Numerical result out of range
rtc_time        : 10:34:32
rtc_date        : 2026-06-24
alrm_time       : 10:34:33
alrm_date       : 2026-07-01
alarm_IRQ       : no
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#

Case #2 with this patch:
root@rzn2h-evk:~# date -s "2026-06-24 10:46:00"; hwclock -w;
Wed Jun 24 10:46:00 UTC 2026
root@rzn2h-evk:~# rtcwake -m no -s 604800;cat /proc/driver/rtc
rtcwake: set rtc wake alarm failed: Numerical result out of range
rtc_time        : 10:46:30
rtc_date        : 2026-06-24
alrm_time       : 10:46:31
alrm_date       : 2026-07-01
alarm_IRQ       : no
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#

Case #3: Add 1-sec  leeway:
root@rzn2h-evk:~# date -s "2026-06-24 10:48:00"; hwclock -w;
Wed Jun 24 10:48:00 UTC 2026
root@rzn2h-evk:~# rtcwake -m no -s 604800;cat /proc/driver/rtc
rtcwake: wakeup using /dev/rtc0 at Wed Jul  1 10:48:50 2026
rtc_time        : 10:48:49
rtc_date        : 2026-06-24
alrm_time       : 10:48:50
alrm_date       : 2026-07-01
alarm_IRQ       : yes
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#


Changes for case #3:

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 173526d50d41..8fdb5114a6d8 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -279,7 +279,9 @@ static int rzn1_rtc_set_alarm(struct device *dev,
struct rtc_wkalrm *alrm)
        /* We cannot set alarms more than one week ahead */
        farest =3D rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_ma=
x;
        alarm =3D rtc_tm_to_time64(tm);
-       if (alarm > farest)
+
+       /* Add a 1-second leeway for processing delay */
+       if (alarm > (farest + 1))
                return -ERANGE;

        /* Convert alarm day into week day */


Cheers,
Prabhakar
