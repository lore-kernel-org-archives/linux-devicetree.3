Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917473AA9F3
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787831866; cv=pass; b=M8X7QSaL06A3YObTvSfp5aZzLiOyseJV69IMfIHeOJGJPIitDodY45EXT+LsQpjFW09nDAH5x0I/YOMivQVE4egccfCBan8w2V6eje9GkTZouBstew22SXPW5NSMLYtgiGn85I5yDsQCdwGDizcPNcY4VhDnCmIo7UpsGVas01s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787831866; c=relaxed/simple;
	bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBhvDJg2bHp/W3l7S4OxZvpiBumjtoXUEQwmKa4ElzeK2KHCvi7AQCf33t/i/Isefxs/w3jMRyzW6dgEw91GHmMYvIMt4WeYA7r7aHmm4LEfqQdU9MZWUZdpzkX34aDmBjVbXj2tzUQNPTFEI6WBMs6I5x+o/H1C6XTokcwRmO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw22IXTw; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw22IXTw"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c20ce3c118aso189867166b.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787831864; cv=none;
        d=google.com; s=arc-20260327;
        b=CKJhXHpxduAnvE+f0ZAJLc3HFEgm6ja6S/KscL25tM7fV6S5EyNOtdB09+Vs0j4R6E
         sJN86FiYq7hgMwLeosii3LzwMC36CqgLWYPI5Y7X+HnjdwlZWQDUM6wrRNFirXSBiNDL
         aPWTiw7f1dEBe62ArR8w+saO/AZkElwrJWJMi9fRmRheILR21cKON9I7jKG++4cHY7FS
         w1jmJezzkqiUon5Z5+KyMPmXl44A2jK+BSt6guIeOgfLN7lNP12rsCyEATmeQ1q1zjZn
         PZt/9Kmduew2mgctP4Pq57yzuiFRvDd1l50bsWqrtrBRLtx0kfl+RhlYvN+1zy8aYbbK
         XKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        fh=UveMiqRTtbpE2dDbGdS6oki1zHcpRW2WHnLmkg4EzdY=;
        b=Sui5MgbKf+3bc8MW1EaGrzczCfYGc6iMQjnC5jFI4ZD47qjoVmLVF7sLg/bV1PM1R/
         vbCcLZgY5t133sMm3ZrkCdGr8Ojy+UntgS10eDBtei0ymNWhSGJ5TDLQaLvuwTwNo4af
         i6uMqjG6gt3c9QA/3qOqQXSxsiwe59dZW1nVFPRci87p7b6Un1hTmo1tXUKZcVN8iEiC
         /oTqodj1DtFvxO3EewXnVu2r7tRtpMQdrNtCujnp7xKfGqDGFSfC6n0PNYDmjiLdLxEM
         KZHgnhYPwWafJDnYT5i2eruZO0RO+WYiiMSemtYUfEZCuNufQsBYimgNBsyRqTLM1sni
         VSXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787831864; x=1788436664; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        b=Bw22IXTwgHN75sAceHvrr7MFp/nbbM+A92yH9eFDnMLzb1DvBiaNYIWBWyfjtvm2Ul
         jqhky/f7Djmfld0kEnHwztrBMs+x2vW12DXwliNr8MSRF8/pMSnaLjCE4+W0Hahd7wm9
         4yR9ksktbwqUgvJeBOtT3RjX592+rc6SY/IZjm9tKHJiwyjQs5E5xXiJiG/2rz/I9aEQ
         76T10yeSK9LHsTgO8FE5+v0RdKBwE+JISB6qG4b9ZwA04mkTdZGxgvJaFCBlICPoLKjb
         GG+KH0d9lXUWlpShVFMgtwhN7ZvX/0oAsUHN0/4SneV4aVod5VweF43LzTZxMxxFx4Hy
         XkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787831864; x=1788436664;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        b=PQtXU9CEr03505C3o0bWEvEK04dMfosF9f/5A7Ipy38WozZi628GoEZRxouzrMXjx8
         TUPCNSDd6z80uyztevgzUk8XCHhPEbUn7eXqBYhR/sfOnsyYtW6XQ9QSuGlm17Z080J1
         iLyVmMFTMcarEhqRxpbucdNpHU0yJMDYAojlPXclLjG5jNg+3Ip0shoZGw3tRlJIfSCt
         cmJU5WCTgM+PI7yMrE8kw5HpNsecZaI1lnrfi+WIcTNA9DWrW4mWL80ZL5NipERShF0r
         zz2U5xLUxHuSF/QGuoibgdcka3s6tlWbvE4WwjywjK7eASx7QCUFPKlT7rN5pdjtoPAL
         PoqA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9mpssDgw7WhBylpMAJJ4tx0k0fCWnP6DJawfRHL8sloAKUbkJiYvMRDg/iZ7/mJVxRNTDsUifR/yS@vger.kernel.org
X-Gm-Message-State: AFuF++kWshtEFrHM290sdELpl9xBNrBirSRTS7hO4kaiySR6SJVtX3DJ
	VzaykqR7WPoz1hL5wQOpHXEMMvL2eIkdVjC1/pm8OyI1Q3nI8L1RINQFc0lStORnKFf+JNtncoj
	qt3QgX4NzCE0d1qvDWzM12l7ESh2pYgA=
X-Gm-Gg: AR+sD11ZBiRyVKxkFn1Vz3+fYNLxULyjeaLV3s0MphIaQkTWrhX8Czq3l3Rm/X/Up8B
	oD1b87PDbv0DUZH4kv8W9KhEEidOwe7Yr2y+4dWrgNcoEVPcubAQsF5hrRTvvbeAHh1Cc/oYJw6
	UtNoH5BYn6RoCoRNKE+iAPbKhOLGMqnQgT2yVOmMwURkQGUjLs8O4NB6d6IxnBhl9ikGLcB71bK
	TW6SfiZRtlXGckvWpG6/wIc6HqpJZfI8/leX025BE156KWIXiHgVQAqHH9f6a7svr3kHw3nrGYX
	JKf0JHrtHq1kX07KE90DHD0HUz9Zw95gK3K52iw9pQU=
X-Received: by 2002:a17:906:4784:b0:c1c:49d9:4c34 with SMTP id
 a640c23a62f3a-c25360ae6f6mr459116966b.11.1787831863644; Thu, 27 Aug 2026
 04:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll> <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
 <20260812-smooth-artichoke-kittiwake-f6e85e@quoll> <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
In-Reply-To: <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 13:57:32 +0200
X-Gm-Features: AcwNN1X9AttqB8t1bj6TQbgbNwwMvZ74IM7YuKbj9WRorR3Nx4t8S9M-g6F42ms
Message-ID: <CAORyz2JbOsiDYzCw--Y-tiRXEaZ69B8S9Hjvs-j5WZmtck-ynQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> > Then these bits stay as is in DTS but bindings header is not needed. You
> > can have of course DTS header, as we did in the past multiple times for
> > such hardware constants.
>
> So I wrote above this to myself and can be ignored completely? Then why
> would we not ignore your patches?

I am sorry, I'm definitely not ignoring reviews and I'm actually
trying to understand and fix my mistakes.
This reply refers to v3, but in v4 you reviewed earlier today I added
reset table support in the driver, therefore in v4 those constants are
IDs instead of bits (and it should help cleanup the other MediaTek
existing bindings if deemed necessary).
If they're IDs that describe actual hardware capabilities, shouldn't
they be located under devicetree/? (Again, I understood my mistake in
v3, but in v4 it should be fixed).

I feel like I am missing something that's very clear to experienced
kernel devs about the boundary between kernel sources and device
trees, but I can't seem to figure out what exactly. I'll try reading
the kernel docs again.

Thank you for your time and patience.
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
