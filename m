Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03733E867F
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176774; cv=pass; b=OtC9cDQYB9wR/VWdIXxmsa8EeVDMdj8/wZkSlT+meU8Oe7ec7GPBE9uiB7xy740QdwqGKEM6obm++cWzukg8ddfzl6C+WlsodAg3rGw7BOER2AkYWRVk+LOMT6LkUhQHE7tG2ylM6P6wHRNNRWA+caobo9Oo6yNDhH+blsxLhDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176774; c=relaxed/simple;
	bh=WtbIduDkfCpWDk4TAOwYPiVOm1oN2PtC34wtUbnB0xY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCw35JKnqo/EVhpbTvy70Ew10WPJ1hrwFA5BgzR4VnBpHSBicPt99tdqX2AemaZnpp7YVxVCl/8Q7JnoGIDL0ug38Thm7x2+T6+lUabbEdQTkfHK47DTZHoRZjZxoxOKuMCQG2qJD2lVqi6ysBIfuYvEhJTacI508zcKbUMbwho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BU5kaHqT; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BU5kaHqT"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so2168015a12.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776176772; cv=none;
        d=google.com; s=arc-20240605;
        b=YAfRqezb3bvOTMyTxeIXT/LdiePptRQ8xuwsWCHahIEFBMP+GAlREtFAWRlrB/pRqd
         d66B06KW8WXedTmDKfLUZGTHoYa0LWKTSa+m1JgK8Ujbn1cbUMsqtQrFq+aKvUeBkaz9
         QtxFvZ2JgtGzGyj+bpuYrAAUpvXM7XMzA90qn4+yGN2YmAvWoPStKIsZc7l6XPlsA9bQ
         0rJhGQ7B/1pt+rXF75ZGOxLQmyZuZfqexVHLbj5QqYIbiT8ucmRPZjC11x2PqlPVROr4
         TI/GVjpmqwxA9GbktG4jZgtRVQO7VxE5HB4Y4mriT1cAn3ahwIBtrbLwMQ2p4TpYEZj7
         xfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7hxS+4h2mTHNnfCCFBW5o+c1P1K7al7DuWkrX1QY474=;
        fh=LobzW8ZS75eN80Wbbh6vOppFewt9VrsB2GDvrfzwDNo=;
        b=fZ3xqOb1hbq2A7hIZD7iCcd2wYdIYUZA5Bnyp6mUrpMUyLPsP2uqmyYWbBYRVXBB10
         eh9mE0sMEg/TCchHfLsLj0ZzfD+ZCbhCgzW/HEr2ER1EF/t+4mhfCCJUTzbHxHizck/i
         dY8DFckFHq8RCEMWh5ixDMhTURIzOEtsEtAR4ROW6jH+pp/U4XOdge/Tv+TdYcymBGLX
         T2BhMYDCaIhSin5O4UbSizZWU3KaSXaOXyOOt5CCxEzbIwi0jMHDlsvhscE8G6fzV2Og
         3xOZQzwFi+VoeCrDt0VRr6FfSjoRGUhLMxecJKE/EwHPPz7KAJ5lx4iS5Wg87yiuXX59
         9mtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776176772; x=1776781572; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7hxS+4h2mTHNnfCCFBW5o+c1P1K7al7DuWkrX1QY474=;
        b=BU5kaHqTGID5MtW2WtiFqTkndo1KbDYdL7mhEmWv7s4l9Sz3A8b0anh2uaovR/UKHk
         fLJbZ6q6AXZ4o8ZlLOiSv7tolpfhcsQ0vlE+HgBgcIpJXcwEoQQ3+wcxDWm+GX6IBohO
         nvseID3GT2Xg0Xb8KrgUfHGLDjUKaFTihr4brr44SdEczxJoE0rH5WQV62ab6Who4w1T
         4VMWFv/Tld6J6UtbupblpQqM0Sk+Oe1cMKM4yCgAC8gzhITRxbs2yudB7B/0Y97ylakc
         EC9vbq9x4qqmpO2uUxrx1ACquOsOnwRrvuiGTgv+TNiNIN75Ep0k5UtputCD+YIvDR2H
         XUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176772; x=1776781572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hxS+4h2mTHNnfCCFBW5o+c1P1K7al7DuWkrX1QY474=;
        b=cFEp+tpAoYRZIXUAwa6KjxbpQFjZjkUY/VtxxbeYK5yHDgNlyfWCrPzGxE0pW1OR9L
         s4URQkUSBoJsJkLSthBuUY8Y0TUv7OzdTKkLkLWQWvJMUV5j7FzEPg9AACTmPIg6jtND
         aQGLQqOSabLyijelY3vJOqQmHvkVR6OcyeLlOwz/vuRU434GkXuLKZeJ5DzqzfaNHBgc
         qtRrcYz4axnpufMDDYlK7ejcewlLYLXvlneai4Ke8dvbw6BfVzIQkMdS64cgCBgfUa+3
         Y9gWEtbhZE/OPNCzD6mtQ/Dzy5oqCnb5W6AA2NRmdyprKpFdQZQS9jPAGiejV3DSB6Qz
         a/Iw==
X-Forwarded-Encrypted: i=1; AFNElJ961T3LdGnuDAOxWbldAVqy8Z1sarjqv+E4CLoY9UHZwxTlqBkyLY61tyKAEbUqRtKND+UPMOQQMH8o@vger.kernel.org
X-Gm-Message-State: AOJu0YweV2165IovWA3cUMn/fGA1hAY1Bk8AUKFqeLkTNph4d15tA+B+
	NDNFN+bfSrW+5baoASxA3CgxY0tcs3PoWHWq23AvQZPhg5vMSgwAab0mZmMNJW1N0oisrvuUUy7
	y7+5Ct6S23+rx+kMdPR1WON7AVRC3LmQ=
X-Gm-Gg: AeBDiev1SoNEmJaFJ1Ygp2P2R/GQi6QGyGpwy/sKxEi6Fs2mHIp+puwVySD2RVOEHui
	5F5pAuqxCa5Pl5OgS2V76grm8OgGeOKW7WTJL1x4tnuWMK0Ygfn7bfkfMQkuIlS1OSHlbn3ZzZi
	8yGvkpzNconmykaUzyDyV2NOD+dgIY5SS1eoT58vizb+qzw2I3RFd3N5Hz2qFctmryRYJTU8KA4
	1uj/w/0QymdcXHVjT/TQmCV/pTNCkzkAEI+y9N1FNR20jpdJ1frFtk0DTe4ZqE9stsDi0/lB6wG
	KnZX9BV24YS2JzqcafFwIYPlFKEzEiueiLhLArIcoj/5AA7MLGGztAusR38DQtXm48U7/9z0
X-Received: by 2002:a17:903:1207:b0:2b0:5ec1:97c1 with SMTP id
 d9443c01a7336-2b2d5939275mr182858285ad.7.1776176767396; Tue, 14 Apr 2026
 07:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-5-phucduc.bui@gmail.com>
 <87qzoipdo4.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87qzoipdo4.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 14 Apr 2026 21:25:54 +0700
X-Gm-Features: AQROBzD5HBObKJ_ac8QE6DfolgiMCYAEtU4p5CM8HBqKzDEM1G5e1fuL3SWF1sY
Message-ID: <CAABR9nERzKW=2vZTWNuTcjz4KuVyc+eaCKBNP6ZGb4UAYw3qUQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Thank you for the review.

> I have mentioned in previous mail to just move fsi_clk_init(), but why do
> you need to move it ? It works without any issue without moving function,
> I guess ?

I moved fsi_clk_init() below the two functions fsi_clk_set_rate_cpg
and fsi_clk_set_rate_external because, inside fsi_clk_init(),
I assign these functions to clock->set_rate. Moving the function was
necessary to avoid compilation errors.

+       if (is_cpg) {
+               xck = 0; ick = 1; div = 1;
+               clock->set_rate = fsi_clk_set_rate_cpg;
+       } else {
+               xck = 1; ick = 1; div = 0;
+               clock->set_rate = fsi_clk_set_rate_external;
+       }

Would you prefer that I use forward declarations instead of changing
the function order?

> Note is that the comment /* clock function */ is not only for fsi_clk_init()
> but for all fsi_clk_xxx() functions. Here is that position.

Understood, I will fix the comment placement accordingly.

> > -     if (fsi_is_clk_master(fsi)) {
> > -             if (fsi->clk_cpg)
> > -                     fsi_clk_init(dai->dev, fsi, 0, 1, 1,
> > -                                  fsi_clk_set_rate_cpg);
> > -             else
> > -                     fsi_clk_init(dai->dev, fsi, 1, 1, 0,
> > -                                  fsi_clk_set_rate_external);
> > -     }
>
> You removes fsi_is_clk_master() check in new fsi_clk_init() ?

At the probe stage, the Master/Slave status has not yet been determined
because it depends on a subsequent set_fmt() call. Therefore, I am not using
the fsi_is_clk_master() function inside the new fsi_clk_init() during
the probe process.

Instead, the new fsi_clk_init() function acquires all resources
(including the mandatory SPU clock) upfront using
devm_clk_get_optional().
The actual fsi_is_clk_master() check remains strictly enforced in
fsi_hw_startup() before enabling any functional clocks.

/* start master clock */
if (fsi_is_clk_master(fsi))
return fsi_clk_enable(dev, fsi);

> Why don't use fsi->clk_cpg ?

You're right, using fsi->clk_cpg is cleaner since it's already
initialized in fsi_port_info_init().
 I will use it in the next version.

> And why you need to call fsi_clk_init() twice ?
The FSI controller has two independent ports (Port A and Port B).
Each port requires its own clock resource initialization and configuration.

Best regards,
Phuc
