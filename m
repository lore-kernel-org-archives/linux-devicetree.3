Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC9150E58F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069626; cv=none; b=RCvuJM1sbO2tq9FLMdvqEVQi342qBvT+6nROnTyASvl2uT9jQZA13BLKINhrsRv9g8PevmXmG3UubeY1UTI9HYaYxXdsr/jT2tSeu/OHj1Zl8jrJVBrPvJbOFrjhLIhHX3r00HjOv+oLSyiI4JmHPouMyBe6wyakTET8t8tGVPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069626; c=relaxed/simple;
	bh=fttiZBNkYD6sTLyS2zJ73b2MnknfJszx/6K5lwFPaaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/qFL1RGDjoe6rIgDLrOzpYUYIKs4O1C540pEWrBBrH4x07n1wBpxwyWqETK806D6tlk8QAwGRiXDB3PFLTcHzGChFKp9Q10aZy6swXv2d31wS8wfgFSFQ++QWIMuR790NjTHCjufHW1eD0QgszvOxAd4ht3fyRvLtxc7ZVJ9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e519c39196so1642888e0c.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069624; x=1792674424;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CSztrjFXDe2HY45Azvb46Y0IflWP3zkhLimwwlwMXh4=;
        b=FDufGvUgcMXX0ibB5V1x3IrsbrTyMiiCcBl/1w5ztdAVMyQiWJg4hazNWsq63aOApv
         BdUdQfThxjbnf9PgY929TIa1h/+hH5bLNBuJTSwrWXO5rMDfWaYfHum5y0ID8gOgtJwS
         1ZVzPaki+hefnig7j//G+YZkHQFmTwjcoUNAnpFm5dMgGL+UlhApIIeON9nkFP4gWkj7
         TpmXJ8OkxRDFMCcL0LF9RnIh0Lh/h4MU/vswVEDI4Rv7yOk6wL/kEx1gJ6ZrcvvAm42w
         S/aVfg7OFAMbNfp3b+3ECqTU+gWK77f14irCqSIJgAjnEmQqGoxYF2kbklJovFT0+WnH
         VW0w==
X-Forwarded-Encrypted: i=1; AKwUvByfouYE20aHU3S2Uazrjz45woIBtehC4tRvB+4lLxxi5oxy830Jb1KkmZKkosfAypCcOgvS3/QUM0+c@vger.kernel.org
X-Gm-Message-State: AFq9FYKVreogONeRtePcJ8SL3EYzfHs/L/GnoRPBBnvQpI4PkeXb6qkZ
	3Diawl1DJ6PvCjC1QOwwHnm+gI4v6W4/bSkYe2Z7zgE/id4L+6G7cU26M4NghYiZ8W4=
X-Gm-Gg: AYBFou3Wen1nI/c9t6IYy2piVvbBf3YZS/07Bg0CcM95Wrs7kwoLTpOtqASuyel6qDG
	q08E5ZeslIg3MqRwJIntgWTek+nYueamvrbpV8e2nTCSvzUqxhXwBKhifut1qoeYWI6Qoxi6xuz
	WjFoRk7rwIKG+oaKSBN+cqBbkdE8vHR9BhVOvUadIg+l9ov2H4xMdAZ6laZFPQhJuqNOcuWuM95
	HI1i7Rz9xHCY25mmIeZoPYfKB0vZutfBpPxQb6RGcOKMuTZC6CZc4QM97Jik8kdUiS3glTnI1CD
	oe5iQwO7FVmeJk5IRjkhR+5VEWnpLAq/QUqOZpV0B7Ik/hZcfrOR9ztsk8fLW5Zdr8u7D+0DD6D
	P91eSktAnNP3ZeIXxzjm4B9SfnU9DpowydHVyCnP5/q6o7EnN7EifVzvZWux6uUvCjn7e6eiRKc
	2BzvRCfKvRIk3LSXyJf5Akvs7ysASMkKN7+MvbeM+0ZMN2xW3OrVicnJ6dZg38zSK9Drt0aAr0n
	7PczdpeuDnbkMtWSvor7lL+AR25qRFfFPSlw7Cls29ChPX8
X-Received: by 2002:a05:6122:1da0:b0:5c9:a60d:3279 with SMTP id 71dfb90a1353d-5e91f4d6f14mr5910194e0c.13.1792069623822;
        Thu, 15 Oct 2026 06:07:03 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cc4044bsm13288458e0c.18.2026.10.15.06.07.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:07:03 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9907fa1d2d1so25311241.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:07:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjhqgIgGq20yQOlgzSjUGYTh/+adxGHc0biSPh1+1pj4dKZMb81esftl91U1AzRHGpQzMeBHfmKyco@vger.kernel.org
X-Received: by 2002:a05:6122:218f:b0:5d9:82c1:b343 with SMTP id
 71dfb90a1353d-5e91f250d84mr6152791e0c.1.1792069622761; Thu, 15 Oct 2026
 06:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013120831.1046590-1-gerg@linux-m68k.org> <20261013120831.1046590-5-gerg@linux-m68k.org>
 <20261014-expensive-shrewd-nautilus-abcab6@quoll> <d256f39c-6ed5-409a-a7ed-224165d00521@linux-m68k.org>
 <20261015-adamant-realistic-bettong-a24c4f@quoll> <4e9b365b-7c5a-44f4-bfaf-d24e9162fd94@linux-m68k.org>
In-Reply-To: <4e9b365b-7c5a-44f4-bfaf-d24e9162fd94@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Oct 2026 15:06:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW84xXV=msd7Sc3BY+50e-gxFxc5dKL7anhrU893NFVaw@mail.gmail.com>
X-Gm-Features: AclHuK-L4YrCSikdmKp4uyJvcLx1JbdRSylRALstebroE1ucg4vSZgEb4WIoJHw
Message-ID: <CAMuHMdW84xXV=msd7Sc3BY+50e-gxFxc5dKL7anhrU893NFVaw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: serial: create binding for mcf-uart
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Thu, 15 Oct 2026 at 14:53, Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 15/10/26 18:56, Krzysztof Kozlowski wrote:
> > But as proven already on the lists, no it WAS NOT tested. You have clear
> > a warning.
> >
> > Otherwise you claim that tests shown errors and then you decided to
> > still send it with errors, so then th enext question: why do you send
> > code which your tests tell it is wrong?
>
> Sorry, I have no idea what you are talking about.
>
> This series of 5 patches was tested before sending, on multiple targets
> that use this code (obviously all m68k/ColdFire platforms).
>
> Just in case I missed something I re-ran testing with a fresh 7.3-rc7
> code base. All 5 patches applied cleanly, with a clean compile. My testing
> showed no new problems in normal operation. Granted sashkio did find a
> couple of error case checking issues that you just do not normally encounter
> in practice (but I will of course fix those for v2).

make dt_binding_check dtbs_check

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
