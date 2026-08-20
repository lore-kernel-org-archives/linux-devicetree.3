Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69622417355
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223335; cv=pass; b=FtL8AH/4bz60dJA4f/IJHSjjVDDI2pWF00Tzi7ZCnlAE7ofVoHmXYd9+rMbZnV2fsasMp72+6BnZDOJ5VZwCLe9PcJinjBOo9ay+6iyp1vO9hY4tEwRBMme/3ADzUZFNpZ5876D6RLHLes0V0kL74GAu0yWfXjJahlNGJzMlVhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223335; c=relaxed/simple;
	bh=Mz6eKL1dO/yVMh2gKnHIXdjclEc7dkcJ+5LpUg0VdfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRqXwcweiESMLqx7RDVAfnm94ULxf69T00wLsOpXV9vYF9Giw4jOkTxrb98pgseyw+Kl2n+5V/rOM2NeWAoUBKWTljAQrXDKCU3calhShZVGbUdvgyzc2s3GFEnaGV9eHJWK6H6h8bFiflX8M8vWs4YYFImVJbE3610Gx5qApzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAdzc55T; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAdzc55T"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15e2dab83eso359091966b.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787223332; cv=none;
        d=google.com; s=arc-20260327;
        b=ec43tCHSvjTE2PgkGnr04DRn/Sb3WpPd1bAfc8eSAaFTyEWuXNRfXfI1JveHhpPqZX
         3PlHGYHMHFS3lKDRduLZ6+L6s3pEFOkoIqwKxQ3OOyoe2/age0hQecJsWtwLStMIbVqF
         lb8qUW7oFCHYKloKit5nHzv4Rck7BPSr3bSqjnk6T0uzvmOKh/5YLYSlijGvunFpGapQ
         4eRryMrh/reJucWQC7jIo4+/YmgqDTbXgXFwCiUStiWmGYg3G8JU+1anxRjIwRBKOo9E
         3QrVniOAGDw/zV72DCm67dZPEhMqR0BT544igVtAPGpyOE7I7avgwI0bcKNdudJt/wL7
         Ndxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ipmbXrGZuUTW3clkvLRtCtAeLwQH+jlck342QgUqPnQ=;
        fh=fd4QrUSSUmHjUqh5+y+31DmsbfsOrc6Nt+QDp/7/bTM=;
        b=DtdhA+RAf3yhysY92DDwVlQih0duCkfROn9C9oMJHic8Jz9/Zi/pv7n16P66cD9m/F
         bxrvl53o3cigCQKRSHmeLVhtBM7t+tQDchkTOS4/5Cnx7NWrRkpa7QNoPdo136mi3lAO
         na8jLWGfZfAdY3sTLtxargsNgBmWjgJDunjSHicONyAPhkNaRGkyi6yC6YXq6vQKfWyq
         mJDIRP/Me3q7kwW+CGvyyvJBRxUfdP4wejOQ3yvXpYTXpsdbE2MlmMlsoqEQsP+r463X
         s2oFITk+0c08KQPiJjo16Kibt07IyOg3+i3GXto6vPcQ8NytM23cQ0pOleW+Eg2Iuyn/
         pOFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223332; x=1787828132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipmbXrGZuUTW3clkvLRtCtAeLwQH+jlck342QgUqPnQ=;
        b=EAdzc55TT02QA4hkh4myhdz4iSOZQx9WpLaxCXwn3Y+HbZIXNXASvbL9zYsFSQEpot
         EEe+MIq/B4fQvOTQB+uiA3FK+nJo6fVRG6IgxstVjbwJvdnKwYpR4UMxpTlH97dyV6H2
         8EK6QIJCVVOQt7yHbvNAc8sJcp0CqAfHqLLpVRxa13mvMAFIzHRrfxdijKtg4yNM7S+F
         Bt1rPw/Ik/i1U/eXXFyZl25NTEgFPw7tXEQrH2EkX7sjtqEGQ7IZeCc9ToYOQjYIhPil
         zTwdaB/3JZFaMBt0+xIbxLNOvkLfQsRpqF0RlNKTjvbX+CXJnfFVeTks33dllXFkhtVw
         rGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223332; x=1787828132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ipmbXrGZuUTW3clkvLRtCtAeLwQH+jlck342QgUqPnQ=;
        b=q8OtQRVzoXz/VJ3u0vDu9BSQt6O1XmkfIr0lySxDJ7nORFQG678tKBzKYwTjxje6z4
         81SZzuZMZz3idI/WmE2HY6R7d6b69GPVxow8lJ8Zr0vo2NOjQ6tZdW/wc/Dw4oic0cMP
         5wVrsbAhW8vW85ETNUjKCqKWK46xgkSbQRZX4ZVdYn4H0e9rUxE0fLADA9/l09CSmJ13
         LqjYWfRgX5MJDapffmCr4BTTGY2aRHsGhrHekzK37zMRQhlPccZfhEDyxdIptT1qlUpw
         CjuOCE3BgurVWKtEoxBwW3oo4Xruq3r/2assqJ0XlKN0O46AG2toE91KMJ9RYpAlUQuD
         HT0w==
X-Forwarded-Encrypted: i=1; AHgh+Rr4SvQC2DB3ZuN9Eo3fO/Vo3ZtAQIX+Lbefvyi9hDoijb1io3DYfWNBlPoDNwt9emb/ZzSJawbpIioG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf0jVY0JetYE33O+5d6ZJf3zAZXPkfQii5J/gyPYxja+DEv+Vj
	bVqe1WikwcFteqoDFuZIklo7cweJXjrRpnKfW+k9SPWtXf9YfAvTVICY62Z5+xQePtjclDCpDI8
	5Mf4d+Irg73YTY8TwKf0WDP4lVnc9AG4=
X-Gm-Gg: AR+sD10mPL9ZeynF6qzQ3x7vUl4H4aHO/0lmNC8uJnX8djDKz74Wi7PO/BgiMTNPCmn
	T76MYGTilnV696ssYzfCy8ni2GHQT8uKqlqA0II5QscCzWWgdw0+wZ3JjNSeYoKbM8XPp5Lqmww
	Ezzp0HWhqn63GeQnSsmCmf4YKunC6HHrm59HvpEola/bnPMLdhBPvNNMTHzEGhiit+MWZYREPKY
	2L6rclgn+VLqa9zNLyJbuun6u/2cPT5E6G+j6KYIGTiyppPLbteotehqB9UkpF4O4l2hmJIaJTE
	NWlOWw/DN2d5azgS4mh7r3ESmXokCLcNJ0LlVcEhmN0=
X-Received: by 2002:a17:907:1c99:b0:c1c:2173:d412 with SMTP id
 a640c23a62f3a-c23f93178a1mr798064166b.1.1787223331499; Thu, 20 Aug 2026
 03:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819101853.44681-1-l.scorcia@gmail.com> <xqnpukvhtezpqhwjnxbqeddiaqlro4m5yjukpplv5mjfxodlfp@ijaf2trst7p4>
In-Reply-To: <xqnpukvhtezpqhwjnxbqeddiaqlro4m5yjukpplv5mjfxodlfp@ijaf2trst7p4>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 12:55:19 +0200
X-Gm-Features: AcwNN1UZv97CCo3bWTxILn7aTXSi7ZUKBM5jaDSq07HQRpTQTLXr653YW63gQJQ
Message-ID: <CAORyz2Kp-LzLdUp=qWfF2xC4kCuUufj0seBKPcKEaebrXnhhYQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Properly describe mt6589 and mt8167 toprgu resets
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Akari,
thank you for the detailed report!

> This is somewhat outside the scope of this series, but adding TOPRGU
> reset support for MT6589 exposes a pre-existing problem with the
> mtk-wdt binding that I think should not go unnoticed.
>
> Until now, using `mediatek,mt6589-wdt` as a fallback compatible for
> other SoCs was mostly harmless, since the driver did not expose the
> TOPRGU reset controller.
> This series changes that by adding reset controller support for MT6589.

This is the exact reason that led me to touching the MT6589 code. I
have been working on improving upstream support for MT8167 and its
TOPRGU reset is required for audio support, but the current fallback
on MT6589 does not allow resets. If I changed MT8167 only, a reviewer
might have thought that the new MT8167 resets should have been applied
to MT6589 instead.
This series should cause no regressions as the addition of
#reset-cells itself only registers the reset controller for
mt6589-derived boards and it does not trigger any reset on its own.

I agree that fixing MT6589 should be an initial step and that upstream
would greatly benefit from the cleanup you described. From a
high-level standpoint it seems like all of MediaTek's WDTs include a
sw reset controller, it's just that the reset table is different for
each SoC. If I'm not mistaken, fixing it shouldn't have particular
repercussions on existing ABI since the existing fallback could be
deprecated and their compatibles relisted as independent devices, i.e.
basically what I'm doing with MT8167.

> ## MT8516
>
> According to the downstream kernel, its reset layout appears to be
> compatible with MT6589:
> [...]
> Note that a downstream kernel claiming compatibility does not necessarily
> mean that the SoCs are actually compatible. In my experience, MediaTek's
> downstream kernels contain substantial amounts of copied code between
> different SoCs, so I would not consider such compatibility claims
> sufficient evidence on their own.

Kudos for finding MT8516 sources, I have been looking for them for
ages! They actually reinforce what you say above.
MT8167 hardware is currently described upstream as MT8516 + display
blocks, but the MT8167 resets as described in the data sheet are quite
different from MT6589. That said, I've also noticed that sometimes
parts of MediaTek's data sheets are copied from other SoCs too, and
sometimes contain mistakes of their own... unless it's possible to
test on an actual device, some kind of guessing is probably
inevitable.

> I also noticed that the v3 link is missing from the cover letter:
> [3] https://lore.kernel.org/linux-arm-kernel/20260809160643.33991-1-l.scorcia@gmail.com/

Thank you for spotting this, I will list it in the next iteration!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
