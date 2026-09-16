Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BE84F7979
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565135; cv=none; b=OGM3X67Z0MKwZsEMlqHy5Ni7Zapd5p9liUn8qukyRgpv+BBx6jdkYdYPzFkWCtIz+dZxxtxIuw9Ta0T32FtcgLopYs/RcDke5ehLR+Uo76gfsB+NcVebYaTc0ix7bWCAKpT0PydwiCoyUcsgjHWzh6prSC0eDXD3A0WDLBBw4mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565135; c=relaxed/simple;
	bh=VaZO6FpC/C798PMj+SstywprO1Bb9VWpsfjFhN0hby4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hglC/O5EOdyDMshDEze6DClEWX5DdQwjSRVMeJ6Ci3tNGzb1Sb0hASl4gZMXg3Sgcf1Q8Ck7NCvdzN5GUBZMa2jaj9TCyZtq9f7xF/wak6rr1IxH2z0pUUuXh2EJZJZcyRG86anu+adxoO7jreewJSUUk9TnadR0DP0rU/MZeFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so348778e0c.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565130; x=1790169930;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=70KfOfVtjXROnDjC5Hg+f4UYV3SMq76n+6MTLdlSG2E=;
        b=XGj+BzkQu7gsA6FSL1njLsdPc9OvOYKJqRz1iFxKQqz4TEOOTvmGC81Dp4/fJvZFjQ
         RKrHhnGEEeLeva5WUzvO87UUOPIqwnml6UuFSunTQFrmynpF3XOuAFkP8TkHtVB/hq2S
         wYsPvQuxQi4kFz73SW96NsQW3KynyF3r/U8Q0ujOywf9Wga//ah4Stw1iGM9pY6HfOx4
         xvGEzCcjy8bCA3uG1+fzF9KynfMVicHcgGJl/nI3rR/FA4rGrpAu0f2RbxvbfCndOqv4
         BeOe2n1tngBsGsma8UUVLBiuGqQGXDn/9+9Sl1Z6KeWpxFqIQ6VTEtaCfPwB8l99rYuG
         Xz/g==
X-Forwarded-Encrypted: i=1; AKwUvBzx6WUEbwp4qbXLwzyuwMat4g+/mEIPXUlOF4mE9VIaonFIYpwemJVeTYz073zO26tYhfHHWeXseDKq@vger.kernel.org
X-Gm-Message-State: AFuF++mz0ltYbWN0Kzqdj5ztO4KyYA1FAlRtU3+5iDeYB7QwOImjJWRv
	p0EfdmI1cF+9edMowcIKL7kiKVzjmhYGKrOONeGipVa/55VBiBqHdFpw9XToLq+wRI4=
X-Gm-Gg: AYBFou3rO05UqGNhhXxM8ex8hCbQRHMy93QGhYtiB91nE0+ye39swYEx0CrLT8L1Txi
	+jo3aKn2X9tpVC3A76g+rwzYJIbL3jE+GVzAOhvRaKvSpvyETNJURRVW3u5ntDOvlHmCiPJZLrA
	v8fhMJh93HsZDOvNbrYfpLNjb2i0u2y8PKpTvqdqYzXH547zWhVMjFdOS+uYRmyAe2NY5ZuiVGy
	qrsxt45yhPp4ds0czvapbdJzAkQ7VAL2bCK+A1MF9wi6sy6gKTiaB/mv0kGWUy5TTM5VBKARARb
	HNRYd/06UmZ4x88H14Fd1vdByNTdYyTPPKShcd9W3EpLZXxfyiHk3OZjXnx8jcifErQ8bLh58GG
	gbh/GYGVxe6RkB07eEGHAVk2LIxvR4/3SZH2pNFEW+sNz5rgBGHgLnKBoykgZ0gHbhSk/OVGa5S
	ysMx6CQA5vl4p6WoORdgVrP2Jj/HoVWqevBjTzWsL7BZz3N2Xuhy2sN62/AIs8aoh4jX7woqGKU
	PkGQdYRixI0OTHNnL9gh6QujFqa+qYWrPh2cCS9Nz1ziJg=
X-Received: by 2002:a05:6122:6612:b0:5c8:4409:602a with SMTP id 71dfb90a1353d-5c99ad237fdmr2658812e0c.8.1789565129811;
        Wed, 16 Sep 2026 06:25:29 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9831526a49dsm2633377241.9.2026.09.16.06.25.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:25:29 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c963a787c9so342015e0c.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:25:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBys6viu8Xe4Os5Tjps/Q8AvUHmw4Y64wp+M+rMeEUa/3TE+Prqsyik9hhVXpwpCK8xjSrgSMpxn67bh@vger.kernel.org
X-Received: by 2002:a05:6122:4f99:b0:5c9:8bbb:3f13 with SMTP id
 71dfb90a1353d-5c99acfb6bamr2956169e0c.7.1789565128380; Wed, 16 Sep 2026
 06:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916102520.24288-1-wsa+renesas@sang-engineering.com> <20260916102520.24288-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260916102520.24288-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 15:25:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4kdESvFx5WSx4-YaTOY7jSFLQccmdwO34ThBfcKkcMg@mail.gmail.com>
X-Gm-Features: AcwNN1XaFS6p2vYEAlcQENUeFmrdt2wF7zxOMeCmx7cdZwqbLkrcHjWXnlR9UCM
Message-ID: <CAMuHMdX4kdESvFx5WSx4-YaTOY7jSFLQccmdwO34ThBfcKkcMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: rtc: rzn1: add R-Car Gen5 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 12:25, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> In general, the RTC on R-Car Gen5 is identical to RZ/T2H. X5H is an
> exception, though, because interrupts are not wired. X5H2 will have them
> wired again.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
