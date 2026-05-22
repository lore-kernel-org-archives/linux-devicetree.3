Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9ED3CC338
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456860; cv=none; b=MOQQNiWs4sLTx6vEncyqBXokGhDTVM32nbebKFwdDESmmeb+oFXekb6VkT5dN0j6hsaDhmNODQmwX56CuLmbrBxIzJFEcSJmqZhwQ4DXg6KC6hIWKFWIOrfyO6/AUfXfCdszXUojUK8pF3dkgamJlliyhUHeFLRZVlL+vU6hOXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456860; c=relaxed/simple;
	bh=oCVQeqNkgLC+A8DsyABQmEoKPm1VZ97E3MIdW+uHGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOcEL4iivSqEuzuo6uk2BtQHWcofqqrmDRTKo8DdZfk/NeOrthevE3VSKsiAqD5R3Q0lFWzt/NWpi+RWsJo5EnQoITQxz15QZXBl0FEbmSORoiu4IsvyjW3ufXKk59VmMno+Er5ZFSIeFz2jugxf6hGpJiDxPRuabRhrftbSRro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-575171b1ce7so2360112e0c.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456858; x=1780061658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=rupKQ/vgEiF5Oqm4tLPBFyLnZalDHsGfj1cOd6XcGZ8bCiPX/NxKvQloxf1ov01aTn
         ZIjJ1xB+Fp/j4XmqwLnnzD+J4O1JTXSQuTqaKaUAf/4Gb3g6+wA4iyZ48ozp5boMCdKn
         X+ZMmqUsCTMs48XQIDau+Ko3c7VFiqaSxUEI2uvhGYA5magI2V/tkuwFUiJOZwgGXr53
         KfMwcwSUF2tOTdgUqA66t7uELwY3dDKq6b+XVt4G+g1+S/XfxronqHJXHRlA8SF23Bhm
         L/V6pO1KXbKnTVoAjUWBgB/QzdnoeKxpIpYHxPoqhEQGnovEe6JrP5hS1Cdi0FflYmKA
         Qo1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Nx+3g8lLiMrw81ZTBrtzkYL45Db7tdpynsGc5X/NOhg4/IWAA+qqazoERneQ6vfe0tHfhM32cXvGQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxValV2+xI7Pi8jKGvCxtWFJMcGF4Xa06aseKC1o8zAKtdOJeG4
	RRmHkMlFegn9490OJV0OoYDrEINfIE/ZQUb8HgjIZI8I7y6gKZjp20Yo/YmRr1aK+/4=
X-Gm-Gg: Acq92OGogkLIKgUCZJKxNJCZAAqFNtzUgEnppuHv55fX18iCULj4teNZPX9EIPUXnp0
	ssMmwf1txvjhxxzXgeA54rz9Z8zwweL/E/vaQ3ynSCgdNzv5h6sRm+XcXcgkqjkpSRHIKWO4VHb
	9TKtqpziNPBxev+QWbDwqeCWRHTBCP37ThG8twtAbhk5D4vxVAzq4r+pEsuGFT7QVULkWl5XJGT
	V5mnr0fXVCLnS28Guh5RdIVPySO2tSutcP2WYUg2lwnByu2tvjXA8KrU2Z0h8XWBbBiTSPAXTk1
	n1wcTsCSMUI9hvJr0kfu7nNg9lNjv6DEJnnlXTvsWHVRQrs+GntPF931SMALk1DXo9v+QSHIeKG
	p74BidHtmQ2voJvmwC4Eksk8rOOMBhjrU4Kc/RRxc7axyDivo8OLs4udoDfDywFjMpH0rnc2bbS
	RSRhGmKEOeBrYjJ43kx2Y2hgK1RYgW+Sp+8nohFw+WWMAyr0EiRaS4o+DrtEGzY1WI35hW/isqX
	Ss=
X-Received: by 2002:a05:6122:32c5:b0:575:fea0:559 with SMTP id 71dfb90a1353d-5865f05be53mr1897944e0c.4.1779456858533;
        Fri, 22 May 2026 06:34:18 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961738b2babsm1558016241.7.2026.05.22.06.34.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:34:17 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57611a6a69eso2170880e0c.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:34:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9HmyTWnVdpMRznn63DFMbK0oE/+eIUikrGUkNKf/Ut+Dfau+6dqF4bez+GE5ohKaWvC80eQ7DC/vg+@vger.kernel.org
X-Received: by 2002:a05:6122:3214:b0:56f:2609:cd95 with SMTP id
 71dfb90a1353d-586626bd8acmr2048945e0c.9.1779456857164; Fri, 22 May 2026
 06:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:34:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7cQ8N3L0g6K4nsJSy8UUut2hNcP7=FovSf+UK_VzwDw@mail.gmail.com>
X-Gm-Features: AVHnY4L1t-E-4KNi3I0TSerFd7ad9ospqXgo4JNrc9drpmUktdoXOv4OmGqhgvQ
Message-ID: <CAMuHMdX7cQ8N3L0g6K4nsJSy8UUut2hNcP7=FovSf+UK_VzwDw@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: ulcb: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
