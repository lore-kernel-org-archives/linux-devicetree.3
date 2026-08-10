Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E1D3D9DC7
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367741; cv=none; b=nSmaBnZJfY6rxMvFNdSPXvix0TdqeguvFhuEUbCffiZSDuTdAJLDI7gUbY6vilAm+KXfiMccrERp7kzkBrQWMNYYwDXQm9cVpTYVEBJUCpG0gOeFN7vGiT6t+0kLBB8huxfg6ZhoOYUakTptwUYbOAw5nh6+xilMDAQpU9GTR4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367741; c=relaxed/simple;
	bh=f/EWsaBqfGYqtSTvr+nbCLuWbwHMz6uqqnQeTngRaRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TeUtGfyuAXSQSqDH1QwXKHPuYJJCYJ+BL4rNHX/hCpAvffxf0WxTJVa8u+7cpxlB8vJzaDUG2yN4rl2vTn7sWatOXB0eHcV8Asb2Quac5BRvfA85d6FcYT/cgT3G6AxRkp/3+wODmOUA3s/JCBmxWBpt+NxJn+to+0rKs1xBdbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso499614e0c.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367739; x=1786972539;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cjoz+EifHARoRnDPa+woJccZc9C1BrhkE/YBcvHNPwQ=;
        b=m7nN9yQ48GUWzDICLl5uS2wHPeho59Ny/iCLmM3io4+5KFbB+n9pwA1x8YKqwjL9gP
         L8dcFUzqBb4L32MwbOIbcmweu7pF5u+lS0OKPGXITXOeMMmUzhxktFUJQsI9Zxvf+QJO
         J4b90j9b3/kCDpo7+A/rI/K5IpI2B+m5UA/d6sSKldosgJou4EGr0p/fuOx+0zmT4M0J
         7+3QFtcjTbL/DEZcqyPMUAjJYwEFc9uJ/qgrqskYaKZYOHpoxvlyiPMe6lJylq5+DR/U
         qPZENSd5s8VOdpw1PjcIeEaGgrAXjzNJzkCS/boNI58BWRlDADnF8jXpACn84IfzVwnM
         cnNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQtxrCdFYdrRxY4fk0e5G1Axfx9qk8E1oZicCIX8TfpTuLZU+jwN/V4DxUcpd1XpS+eQJ8opQmfe+h@vger.kernel.org
X-Gm-Message-State: AOJu0YwmHvx8ZUkWO8kYY6f1X8aRsV9e9pILnMWArliAkhTSQy0Vkn8A
	d9nnfkda/7zw0YknJn4Sk1CFe+amRh6qc2ak33oLBMxDeDr4YNZQ9ILpeIe13HHQ
X-Gm-Gg: AR+sD10Q91jkbvhZppFABit1I4WRo189X9LAG03rqI584+/E5uYHgCsth5qKfQjWn33
	p6uTU8h2DPgbcUfe4u/YAIAd8aJidg2oeLVhwXExmc3YbuG0qAHmX6bXC9wDPK36TK1S94SEcme
	iV/GuD2jHdzcJuuPC8jHHxj1VqYjE3qv1Fvliglnv/lhLIu1ZudxCjp1gFMtlSaHWVaWr0sAOdh
	KlO21/GyTqFrQ3tufl2Xbuno+yqhMZEwpOsV9cT6FqoExlbOxUxNCr+u7GILU0VMPeC7AXl3H0p
	oyN1/8JscCMjGIl1tHjgaBL3xJaI50lg2tkjt50/1iBIt3IodGjq2ScCx67n7MMU+VArE8F8lpT
	sU+ouEJqporjypk9YDunLHfUoDa6TRX2xxUHlli9IsqQJ4i0RtwEXwtaXnhBV+Ozg099k2w0eHH
	m+rxkce6pCDJ5hMmU7mDmJs5hhwjTffIJGjIBhKHidv3MVgUK3W8Z0VbLAyNYJ9NEc2ZpKI/hhs
	9bmrrkpkFo7JhGYrOYygGQVhQ==
X-Received: by 2002:a05:6122:8b0b:b0:5c2:c0ae:c2de with SMTP id 71dfb90a1353d-5c4418f90a6mr178302e0c.8.1786367739199;
        Mon, 10 Aug 2026 06:15:39 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b1a8f75sm4093384e0c.10.2026.08.10.06.15.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:15:39 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-754ac74c495so353081137.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:15:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RormtlltIOTXWPh9utOtOTTKbiYDMcmwiNOuSvu+LXZz2tLD2VB2c3nPr3pbC/bbnJGEu6m2CqUxHA3@vger.kernel.org
X-Received: by 2002:a05:6102:1492:b0:737:9edc:36f8 with SMTP id
 ada2fe7eead31-768e5d1e555mr321103137.1.1786367738750; Mon, 10 Aug 2026
 06:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716101030.15252-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260716101030.15252-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:15:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwUovSSQC2YMkWMpCJpYf4xZ0iQiC+YNr0MHdnhg=5bg@mail.gmail.com>
X-Gm-Features: AUfX_mz9Ge_uOoBEAXZRrsBhAljgE5JRYm5OavXM3Q4UhEdxtWBnLah-SR0vkRY
Message-ID: <CAMuHMdVwUovSSQC2YMkWMpCJpYf4xZ0iQiC+YNr0MHdnhg=5bg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032: don't set status to the
 default value
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 at 12:11, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> "okay" is the default for 'status', so don't encode it explicitly.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
