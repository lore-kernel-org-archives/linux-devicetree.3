Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320244;
	b=JT5OVmi5ZDa7SbvqtI/4AL0WplYrrgDOggpu0d+bsrz2+JuahLx7TrT2YrRoEHzeMRQS
	 w0J74c5qEjq2GE/dFAn7M0RqOOMZn8st5nZO99J41g+Fh0vxKJBK+tSeQH1S4umNiI+er
	 BhOLLbuoEi+ijxkKMFwI2XdZviQORUle47LHqEqs2wgVrzpYcnLz9ZSPL7wFfDS9es6Ew
	 CUfqdA6I1irUWYaemyBEKbxuPB7/dZLm9Wr0Gf4gIMflXtYbEGMXjajLNSh2Pm6AZMsmO
	 wEGM6W2QNxh3KQGC29Zj+K0Rww0OkmzIHupKqWKiUnhHxek6YUe04PR4HxYS0LR3OAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320244;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=1sO8TShiJNFb0KYXxNfr4n78remHhHZjTgn2fa5N6SM=;
	b=0tt8MhD4ahlb9y/hNCoqKGtI6VCEb8P92kCCpAXlP8xpeWsIRjXvHX8mBgSHsWBZzFsy
	 Bj6AbwkFKmobp56MIAoOPfQghpA06ngJOwzlhTIwtouPOgeYwCyljOIBfGaexqEzPILOn
	 cBwDS6X46mQbg4G95AaD5SKk07zGBWuamjOinO2tLc8rSdgJWDc4pNdKZ7nYut7PoPRjI
	 n6sCQojUvYNGW5U4FFxCJWWw0WMT01dTOW3VL3xL9THcaaotPNl179EUO3pIiveiZBosi
	 LGSnqRtYPCqROmKNrHkGx1AWBuOlVMQ1+7CddUaVTjAAi39rhYn2jk5JIxk3hR7G0Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CF660A2612
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 14:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CF660A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so1350646a12.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 06:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320243; x=1794925043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1sO8TShiJNFb0KYXxNfr4n78remHhHZjTgn2fa5N6SM=;
        b=WEhrSdc5JEHCwchAaUl1ibGGKLsLU4YVhnLs/rggvsxc1ifkgkXTVNoUrtg8yd3tbP
         kQGxJ29n6pcQadE8RukewF6Ts0rRkMvH9/huEkFxQE6hgQgLPzBxPrjKggoZB6foxdeB
         m9FL8GwyC6H2ruWDZttD2PhXSUVs0pCyCDdkHiPRbfmLQRnUTtGJ7FMhsqQW0/11XDUx
         RmensztsZaSXONA8D3/CU2wBDoJLVdt7arWm5BroRrOED52IhvYw9QzD9fo2Np4NJYQO
         g7iXYF38GlW/ZbEzdkluJJwmp/hbf06+X4LrDHR0ov1hglBB2eO9uozZ8ioZgmFQyMao
         WDxA==
X-Forwarded-Encrypted: i=1; AL+hErEJZfYSgJ6/YAI9ORwQnJ8KaCqiu2IpcBHUSEMt+vwOJoK73KH88EpV04TOOQiHiMnqssLqk0N3LsK+@vger.kernel.org
X-Gm-Message-State: APuU4Z+TfeiUXzn7ORowy+Yje+1cH6Aiw3JAmDJlLckZiJK43xH5xEIh
	WK9can/heNdyuD19bIlbSyNU01L2Uekjg6NmW6pmjqpy5U0an6FMUE9A2YaXWGdjRC4=
X-Gm-Gg: AYBFou2kQefmQymoERVEd0p1WQIwaKzh7PqyQAW/e9VaBjdTFBVL1QkKMZqFZf/g37o
	UrGrx9xVPQg0zkpUOM3rwopEtdgOEzaJ4yU7+GvV0k+ZGWLF8ewCxr/Y8Mp2Uq+x254MRrZHUqw
	LYjAMzl8jIGYlMFyMEpYYucqYGgR3iE7RGx7RZYYvWGO4ZyLsPzhsWf6lNdyDPn12L+WbOrfycB
	ZSTE6f0Jbofo0PVW26qCBTCaBRjrKWdt76q6DnA7TfEhZvXsmqhOEM4XswqA3hE+mqlm1DpuMnt
	Rb/xzKBV2+5/yWswWb8T0iM/Sfu8RXU0dR12yMb79SiB4YAoFY4AEcWXgnXvQSKc8Wfy37hriV3
	ztyAWxzHVDG7IJb4FO/U0ecAEbq4trYjS/V+d8rfUVpyBoJjqjTKmnGwKGcy/0txcrQ2v6DEPh1
	i7r+lXT0fqe5WEV106+OrFeMftRiDVFfeVKnN/kq2cidN3fBNqx/fuyRM49pUEfmYPkaqE7vHu+
	jxiUGNeNrdsQuRWIwUwNtDoEwfcLopPrnGtlwFm1MA3XJRrFmiL0o6Vo2wpueVOD4wjk4iEQWSV
	8HRbBFXik74Yxres/nrYypudGophiF/4QtadAQbJ+/w9rm8k3BR6CUM89Mqe6iW+hSg=
X-Received: by 2002:a17:906:4e87:b0:c46:74f6:e149 with SMTP id a640c23a62f3a-c504952ce0bmr186759966b.16.1794320242459;
        Tue, 10 Nov 2026 06:17:22 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a62a91bsm112356966b.57.2026.11.10.06.17.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:17:19 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso2270763a12.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 06:17:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEu8yojtKhIACsFKzFd4fynlRvCPLNFp088I2aC3U+yzsz/vOGI816eiOWfat+h16It1dEPIPEGydYT@vger.kernel.org
X-Received: by 2002:a05:6402:43cd:b0:6b5:7140:e2f9 with SMTP id
 4fb4d7f45d1cf-6b756af3757mr2247392a12.33.1794320239029; Tue, 10 Nov 2026
 06:17:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026063942.3173469-1-den@valinux.co.jp>
In-Reply-To: <20261026063942.3173469-1-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 15:17:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXoxM-e0i=WTz3pgugmrxWb=BHfkCvsbWORvNO6eQTVzg@mail.gmail.com>
X-Gm-Features: AclHuK-Nj7_0nF4taJQudffw83bvsSL8D-xjCW71vcQzgkfQMu5qEkMjXoji9MU
Message-ID: <CAMuHMdXoxM-e0i=WTz3pgugmrxWb=BHfkCvsbWORvNO6eQTVzg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: spider: Add overlay for PCIe ch0
 endpoint mode
To: Koichiro Den <den@valinux.co.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 07:39, Koichiro Den <den@valinux.co.jp> wrote:
> PCIe channel 0 on the R-Car S4-8 Spider board can work either as a Root
> Complex (the default) or as an Endpoint. Add an overlay that disables
> the RC node and enables the EP node, to let it work in EP mode.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v2:
>   - Polish the header (Marek)
>   - Link to v1: https://lore.kernel.org/r/20261022082113.3163666-1-den@valinux.co.jp/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
