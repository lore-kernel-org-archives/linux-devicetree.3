Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBA8314A73
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780403607; cv=pass; b=hcRpOpjftMKad+Lnf6sSvsAypfp0z3oLeYqPvin2C3iQOH5iMQQ4S2SCnMRjH145F+dLvgaPXRk2n6FUlV0w/S+bfyt2SdmbU3GZaHAH12rTivDLIMkopPkKjjX81ttQe2Q6IPcg08NOhh/Lp/nUTz2A70hZfBvO/NnQQdubwrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780403607; c=relaxed/simple;
	bh=7rr7i1DeFDlRQ4sV8bk/3mLvsybuK8FZyPk5gbKEYII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzUwaB9vQImIIionpNn+eAi++oR+LWWzCoFe5ek7R3Msc07LpPuh9yxTfarzSs3xVjyRmMFYYpNUOe4iVGVY/A9fmvBiyq0xlhkLGmck0+yIOns/Jak2KiPcEm8aBgtneVx0COs9BxL2cUurKyk0wQaTxS1G0SBhtza0g/mgELo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgurOTpI; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgurOTpI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so4616925e9.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 05:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780403602; cv=none;
        d=google.com; s=arc-20240605;
        b=G+fHuRrxWFo/SanujTvrwWsC6Mofut71VQClUYiV1TIhsqqIRUo4G1LZLofzTsXS75
         V/aVe3IJml4CN+ntXwnn4AUIJ/76YK9sa+AlBP9Iik+ZYi8xg/noRLryHclr3EyVVhz0
         h4PtlbNH7L8OrplwbLobQwL3woX63QzU7gfquVfIcvpTkOtXrhSHBRAYw/dsHYe72jWR
         VBMZdSadaKz2KYiLq1c4PQtCPKyfEp/vT88dX9c91Eu0u3X+cUZfdfRGnHrxSCqjyrVt
         MeOOUHqZ+lAXMQvZAzVAQM+nfxnSNgdhk969Ahola2wR5mGGVQriWFTDgpGZUOl7HLZj
         qRuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E16/X02NEFh/HWi6uxt/+AI8HBUQVZR6eLcIHEdYo+4=;
        fh=y7c414UOi9jdFeg8JSx0JDUduHJizpTixvZAOMaKWys=;
        b=jqCEf2/dhR8+qLLctN491LkVyqWMAbuL4EZ5H+23xMBymWZwrJaoVANjXdqCQyZyFA
         p0VIAnubRPGNaQaJbHcJWR+QBNKOSGFKsKTQ95CqfvlIrD/P83tZaSkC/SVfJIv0j9Nl
         KJbjdCiZkgfhWgHe2UToMkP+RoMvMlqAzN0j7o4l6PJvvB7I53723X5uFqeZ8fA4oauV
         Ys2hN/k/c+v96V9mLvdRNNpjshGKlX9TCUk3QqLamFdVYzN3oCwFlFLg2rgZcC8BzvvX
         DIuIOR+aT3rtBETD+O8b5U40vO5DL831izVaDeKsElczI9dqR9kKwQ34IGEQbNgYs9u0
         7jVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780403602; x=1781008402; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E16/X02NEFh/HWi6uxt/+AI8HBUQVZR6eLcIHEdYo+4=;
        b=EgurOTpIaukWScF9m7NpEbumAyjSLxCaWXRJmSuQceuO7oNviJFcvE5g9Opa4LvDAZ
         FczwtSyhxBKSENMu6bkUmFcZSEZK6IaLTDzNo7vnYQqCvekPiHHf4foTkkIUqEyd/Ma0
         sBaR7QdKEj+TFxnlw6pCxbBeLsBF4Hoh2vN6dS0Ah9AvFY2k6hWD2Jx+BJ3cChZg0/bA
         EOnetq1qP8GLpaTSxGuByhO6k5VFYch4QbWsBva/eyL/wNIUGBeyEAm8ijJM0uhrM1PS
         J3+zlEUe6eYzJrHbzU/lnRrUjnCS1RsL9CWz4Ai6zYgQhosFdv4ZWwQxkJaCi7sYuVsL
         b26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780403602; x=1781008402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E16/X02NEFh/HWi6uxt/+AI8HBUQVZR6eLcIHEdYo+4=;
        b=rI2BfFS98VOhcbKIDjXQZ8zJPHv1il2f9XYX34wuS1YokpqS9Uqri5RlVWAWJ98i3X
         eoyhrlw3dR8oY9v4/yU0VH1MbjzY7Sea0O1QnSMsaAqyyCbYOSY2pGuz5cCANEL+2JnK
         9NbsunRLwx6K20jBDf783AwtV/e4FIFi6bFumbkZWe65Gl+WsPO891xVvrfgMT6QCeDO
         DrH8qyyewwOg7t+XnGJbM+AUnpEMN2zHlAWHSTdeIa4jTGaXA4erNOFLianic5t3066z
         XIuCPu0h3z4KRwv7Qgza8F9vDJI3lqIn/M/BxTQr7epPRBYnuzB2qaLd81RwJpzHUpbo
         X/qg==
X-Forwarded-Encrypted: i=1; AFNElJ9EX6vmUWBYszKSaSW5Jpba0cDVAX/BSk5KLeRzFndA2yfdZxqzzbZerbKcxTsV58jsV7bCqyrO1xPR@vger.kernel.org
X-Gm-Message-State: AOJu0YxbGLZfTEbmCrn4ugvTfW85O7hfp4NjAk6VY2/JTKIkhXR67MiI
	ONlZp13BQpy1+qD95CNWh/T1eZtisOlxd8ExERFLz6blCtoZO62KOh7YUde4fODtw6+0EQ4EjFh
	I41CLqAuGWQohwXL607/dPePC+I6lyjc=
X-Gm-Gg: Acq92OHf6gdijtAKDmL1NhuObe4L0v/mHNUXm4msjCRg8iPXqRkjij9yDf5VAcBWITY
	P4t7M640pm8r4QZz4fWh5csr6tM3f70kKDvAPf//+zjNmDAUxtdSg8lHqflktiVWIOOdtQlHkQz
	oazEfR/ehB9IU3nhcyvgdQna9Mfgw+ikM6OImCFLGVccGEYTyLvkZ6brDoFwMKtoiS2J4CTnmbG
	gST3yuUUXqAAYRbwF5OQpO0yU4MOl06LwtcisoEHgN1dFeqKWRMSiksmsBejh4o/KvafI3uhvmx
	siX1pR9EVzml8zy87HX/UazS+gjbNkxtF7WF/knRUfdRW1qnDdBQJYX2yQ4RQ2vdE0Pcjbg8I2/
	7sZ5LmiGjHmVbeeGqRzywxuXE7NSM3wXl7FzFoMHt6vTjeQUhN3iHpt9S++exGJo4V5niTtsDNn
	f6kqpB2vDE62+WnI/c
X-Received: by 2002:a05:600c:46cc:b0:490:b0dc:6999 with SMTP id
 5b1f17b1804b1-490b0dc6a2dmr72712985e9.29.1780403602255; Tue, 02 Jun 2026
 05:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
 <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com> <ah6p-f2RCW8VcuDR@ashevche-desk.local>
 <DIYI40YK6CSX.2P4017PHVJHCT@gmail.com> <ah66ljSiIc0ywFC2@ashevche-desk.local>
 <CALoEA-wdakU-Ei2FE3WpGR+CYRDN1bjv2sZ=XJ01ZeH3NP8xeA@mail.gmail.com>
 <DIYJ5ZACTWVS.13T8L275VHTKM@gmail.com> <CALoEA-w3TqD=2YP36=ScmRttmmG3BBCKvtfSqeJL0PVxRxEbuQ@mail.gmail.com>
 <DIYK6APQQX6S.2KLGTD0G5GCDA@gmail.com>
In-Reply-To: <DIYK6APQQX6S.2KLGTD0G5GCDA@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 2 Jun 2026 14:33:10 +0200
X-Gm-Features: AVHnY4L1aNrp6X9UJAt4paTN1MSnCrIzKR0xmd01VQ0YJFvsJazQhY76BG307BA
Message-ID: <CALoEA-wXRhiTr1gA8GdLAmt2PO29N9S9FrX4ueab7P7FJ+HOPw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] iio: light: add support for veml6031x00 ALS series
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 14:22, Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> On Tue Jun 2, 2026 at 1:47 PM CEST, Joshua Crofts wrote:
> > On Tue, 2 Jun 2026 at 13:35, Javier Carrasco
> > <javier.carrasco.cruz@gmail.com> wrote:
> >> Thank you, Joshua. One question, though: maybe you remember that your
> >> last driver was missing one header (which I am not criticizing at all,
> >> as you can see I missed some too!), and I am wondering if it was because
> >> iwyu missed it and if so, how that could be avoided.
> >
> > About that - I didn't actually run iwyu on my driver, I recently migrated to
> > Fedora and forgot to set up LLVM and iywu-tool :-)
>
> I installed IWYU and added your mapping for a quick test, and it wants
> to add a million headers or so:
> If that is correct, I bet there is almost no driver prior to IWYU that
> has all the headers :D

Well, as Andy said - it's still far from ideal. It generates unnecessary noise.

Question: did you run `make compile_commands.json` before running iwyu?

iwyu_tool -p compile_commands.json drivers/iio/magnetometer/ak8975.c -- \
-Xiwyu --no_default_mappings -Xiwyu --mapping_file=/home/josh/iio.imp

This was the command I used when I did some cleaning up on the ak8975.

-- 
Kind regards

CJD
