Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B67D2DFA4A
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780403695; cv=none; b=s7GkB3duU6NPDFREBpVzIkaY66+9x47zO91K600Y9bW+NFiZvZwAU8jPAeSCcM33lsLv91bQ21gb6VyOduu37OXT1iRzWEYZBMyRxmWxyXtT/kC/8S2jD2/IJaql7hm07zpq6YRQBd0TFc6Jz0/kRDS3dtxtJu9Da/R7qJV8HYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780403695; c=relaxed/simple;
	bh=g3+PolSFTvl+Dbxqo7LBVuF4Wk/ljZfu9PhVMO+r3Uk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZkYkjwl+BE3ReZ9MIAFxAWZTQwkiiDJyMAK1KtGpmlHDwGIJ/qh5r9sF9/jjtgYd6LO3w/kA86rVCUbpzPDNcoAd3KXnMBmNBxyCY3MEvjZtha3Z9lh/LvdDOOy/0rWTHMQ6PlRQaangyIg/jDCJ4zuuiLLb1jzU+OhOLbVx67g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAcko4UU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAcko4UU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49068493267so65006485e9.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780403693; x=1781008493; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3+PolSFTvl+Dbxqo7LBVuF4Wk/ljZfu9PhVMO+r3Uk=;
        b=CAcko4UUMDxvlDsleuegKtUOyjZCBwIlzUUbqhHjZwbDvuSW6lDgClh8WYh8DjkrJm
         9s/jeMp5xLRNbYYHz567f8aibGlAzJ2fCLCKtn3K65Um5JhYu70uORRpazGA23jLrtd9
         w56WifPZ2Kkd9qdV2KYeK1Ojy4A0oID1OMwLBdQXu4576uoe5JP3mcDflRbat8yvIlkV
         vHBc+LQMhRe2d3e8Xp7l8OAo94GWWTX8w3Ytgps5zyqIY7Bg89PwGhcfpNgUIvImFLM4
         dliUqn5zS2AtdIXWyy0dm2vgiIgF6Gpl3gMpfvM9C07BP3/qIAlxF74/gHk98y+JcqFk
         ATzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780403693; x=1781008493;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g3+PolSFTvl+Dbxqo7LBVuF4Wk/ljZfu9PhVMO+r3Uk=;
        b=N550UlsL9dxatKPbPmIpEZWPaXRZmXiSLIMevndVWLYNOU31H0V1q6XhZnSziF9q5B
         G1UYk278hHbgAo8odOjfHE8eINvWrFmYwa3DGI90zdTipI1BPXnEYlHCADwYV+uzA3rN
         JVregRlw/QnWUZpFApC31odWv41qq2+iYf6tsKET6AOY85EuJwvgMfPgT/is5oS+tOf7
         8c9SdImrKq0kmVWdsUqS1CrFGdiU0TkHcZf2sTXpJ+LgGmslJeTR2BbT/V6KHFpj5gfH
         fHMVu6qgqe2WS8K5cVlmB+BK+FyjR3LZlfpnkp2sE+M0sx7A6a90q1Ia58fHH/aExz4/
         OQIw==
X-Forwarded-Encrypted: i=1; AFNElJ/44+iK9mlKjCYRTqW6je9I0NtGG3VYxoBWyivELdCormP+PzyJBDloGXjaX/Glj+QqLT7kpbqfwuw7@vger.kernel.org
X-Gm-Message-State: AOJu0YxOY00xdBY4lgLVUjZLFQR6staCSuCAgy4WtZWwmlQSRjZPM9Qo
	PsXvU/Hz060cFYoF0UkPRrNSs8A/M/IZy5U82bmq2xe6vF2GwuRQWR1D
X-Gm-Gg: Acq92OFWfMEv6ls0Nmg7qjnSWafK17vWj/535/eAMkdL7wd3f89sSM06qWMrQN5Y7Om
	r/8PJKcNKdgxhOs6tfhv5cw2hXnLmf6B8K2onISLbPeyIeEUwDnZnJGDKlAF3009NSuOo7FFVmB
	Qp9fRqqR1wZfqzGsB4PTafz7XTlyFRq9hMIxVow0bSCYrA3sXChky1tlHtNlbaecbxMf/Fjwx3G
	t3TvkCDs75YyfEyrmxI7a6ohVJqu95ec4O6WhfqoNKMvF2XoDKWAxFGP6+Xjq9xIUPrRCDBJ7gY
	NnI/HmCmCWKYXeKWGkAD0zMHyksWZQ1RmTXrtC0Qp4fP2pGWgx26XH+JyfTE93+LLYee+VBacWI
	OVCpPNBx5t7AEdBFVHUNvpwJbR0YITNgdaGqDxXHXLKotkpopA+cqDb6sbFAbxL/5YsiFbNge0d
	Frr8bFqo4in3J4Uhlc1bGD4tgEY7PczJxhXZZjmuxH1TSIpL0=
X-Received: by 2002:a05:600c:8b2e:b0:490:6889:1ff with SMTP id 5b1f17b1804b1-490a2940dd2mr275892015e9.28.1780403692736;
        Tue, 02 Jun 2026 05:34:52 -0700 (PDT)
Received: from localhost ([2001:4bb8:152:df59:3b69:56ea:a39b:adb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0e8c1bsm137133085e9.3.2026.06.02.05.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 14:34:50 +0200
Message-Id: <DIYKFNVUW1RR.1KP94ER0FKNES@gmail.com>
Subject: Re: [PATCH v4 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Lars-Peter Clausen" <lars@metafoo.de>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Rishi Gupta" <gupt21@gmail.com>, "David
 Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Matti
 Vaittinen" <mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Joshua Crofts" <joshua.crofts1@gmail.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
 <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com>
 <ah6p-f2RCW8VcuDR@ashevche-desk.local>
 <DIYI40YK6CSX.2P4017PHVJHCT@gmail.com>
 <ah66ljSiIc0ywFC2@ashevche-desk.local>
 <CALoEA-wdakU-Ei2FE3WpGR+CYRDN1bjv2sZ=XJ01ZeH3NP8xeA@mail.gmail.com>
 <DIYJ5ZACTWVS.13T8L275VHTKM@gmail.com>
 <CALoEA-w3TqD=2YP36=ScmRttmmG3BBCKvtfSqeJL0PVxRxEbuQ@mail.gmail.com>
 <DIYK6APQQX6S.2KLGTD0G5GCDA@gmail.com>
 <CALoEA-wXRhiTr1gA8GdLAmt2PO29N9S9FrX4ueab7P7FJ+HOPw@mail.gmail.com>
In-Reply-To: <CALoEA-wXRhiTr1gA8GdLAmt2PO29N9S9FrX4ueab7P7FJ+HOPw@mail.gmail.com>

On Tue Jun 2, 2026 at 2:33 PM CEST, Joshua Crofts wrote:
> On Tue, 2 Jun 2026 at 14:22, Javier Carrasco
> <javier.carrasco.cruz@gmail.com> wrote:
>>
>> On Tue Jun 2, 2026 at 1:47 PM CEST, Joshua Crofts wrote:
>> > On Tue, 2 Jun 2026 at 13:35, Javier Carrasco
>> > <javier.carrasco.cruz@gmail.com> wrote:
>> >> Thank you, Joshua. One question, though: maybe you remember that your
>> >> last driver was missing one header (which I am not criticizing at all=
,
>> >> as you can see I missed some too!), and I am wondering if it was beca=
use
>> >> iwyu missed it and if so, how that could be avoided.
>> >
>> > About that - I didn't actually run iwyu on my driver, I recently migra=
ted to
>> > Fedora and forgot to set up LLVM and iywu-tool :-)
>>
>> I installed IWYU and added your mapping for a quick test, and it wants
>> to add a million headers or so:
>> If that is correct, I bet there is almost no driver prior to IWYU that
>> has all the headers :D
>
> Well, as Andy said - it's still far from ideal. It generates unnecessary =
noise.
>
> Question: did you run `make compile_commands.json` before running iwyu?
>
> iwyu_tool -p compile_commands.json drivers/iio/magnetometer/ak8975.c -- \
> -Xiwyu --no_default_mappings -Xiwyu --mapping_file=3D/home/josh/iio.imp
>
> This was the command I used when I did some cleaning up on the ak8975.

I used the compile_commands.json generated by
scripts/clang-tools/gen_compile_commands.py, which I always use to have
a better experience with clangd and Neovim.

Should it make any difference?
