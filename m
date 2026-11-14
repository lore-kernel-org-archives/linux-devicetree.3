Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663035;
	b=Vj6E9RvA+NP9ZjHs6642LETYb9TvHcc7BZoWXDPWv8yIrTtGMjn5Ek2SEc9Wr7ntsdOL
	 0++js8AhpfOthYzChUMp3foc6jlUA6u2cA3873EE7akIE9988NZyYXOTTavQriGjlI0Gf
	 eBYRFyqDg/A+tzPe0mdrQUIJte5RKRK6OCWi4gG3TCYwnKF3f1RtsN3ccnBbPys7kENCQ
	 QOkNpTRqL4ae7YYt10nUFz7llXX+4HCF7JEfPIHNrWpsWuTDMXrE81UjEXy1JiNSFnHHJ
	 8X0QG6kMjpD3zpgRWv6CFMN3j8btwIu33sllCE02bBNmtC3+4tQc/nwmkzXyg1dNYFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663035;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4kdsxrLqnYOpX1QyU0iNFte1eOYe1nCLmGqKY73MdjQ=;
	b=QESUTMwfheh4MAaQY/dx1uHXa0nRLmBOPII2XbHGH/Z3SxeufNHk8RRhTcv7ZyiQLRSz
	 icPaDHsZ6ExHlKN7oBO52PE09MBk2wk78yCd3qR5yWalk0Icm9taaZxCcVF8TM88/Ovgs
	 odvinVXbMufXfoRvyvJw1ALqFse9fG/zHcVgud9S4Fe8OPV1iul3QUpffnCqdSYGz+CzD
	 QPUgTtaZtgG/CdMIfADqAFcdv0ssQI8ox60XljJven5dNmu/KJzS1Nne1QDNmdVfN73V6
	 3ERCsx+qJ1vyl3gBwSCaZhMEhmyB4NDxfdqlu/7SeYqrsPd8QRSxY+ertfr22VJI6JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbe77+1G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FB4606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbe77+1G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA0D1F000C4
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794663035;
	bh=4kdsxrLqnYOpX1QyU0iNFte1eOYe1nCLmGqKY73MdjQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mbe77+1GhvODI+6mWq5hPRR5d8VCtc9UMyfbjr+wccQGdxYPb9nXX6Y3s8yGz6kIb
	 fARVMe7B9b5Et13NlB8hB5LeWaFryaB7pJSkHiyWDoClDmPB2TlzhG/YI8qDTjQyE/
	 WDYvttsj6kL3Jr40rcFF7sVzzMxutqB1pjXLA3LPT/3vG60X33w+vhS0JbUTe+7ifG
	 pRaQ8FCones0hTHahfg6b0pKCSEghuci+Q5h5pGV3/RP7te5YPKnzUWRAgSWqWAJJm
	 1x/N9wO2eWU3JIquYC91FWUiwJsvg9fCcORSszU+M2uU6/IAYsisGgX7mvKHBJlkZ3
	 /lEINIMPlev0w==
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491aaed7565so841787f8f.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:30:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFLhttP1Ho/9ikQgJQ8pHAntbS4Ck0yLVOzqN7XyL8GSl0KJzbJcojHrOb3lbvq32g96h4cpFqxRJVZ@vger.kernel.org
X-Gm-Message-State: APuU4Z82OBWZvOoX9urNiioBq3RKZ9rO9wyBQ1fTvcX5W19EckBb8yg/
	QPYGikSDmV4lNiqym1luG+fjvB5M8huAvcNwC+Pyy+hjMbjSu/det0waLDI8eGKm36J5lUO/8jE
	xgEQtu9aO1FKR8tIWGJhUCnhm+WSRrC4=
X-Received: by 2002:a05:6000:288c:b0:49d:1ce3:1849 with SMTP id
 ffacd0b85a97d-49d1ce31d46mr9587940f8f.21.1794663033180; Sat, 14 Nov 2026
 05:30:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:30:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRDcAVjTu5N+-8zhPJRvgCBiTtt3xZRbF_1s7D+yXXJ+A@mail.gmail.com>
X-Gm-Features: AclHuK8K2OPl8wvZJVK74a7K9gwaF5hUGnQfkFwAnJJ_kB4aFWWolyDhl3_PTvA
Message-ID: <CAJF2gTRDcAVjTu5N+-8zhPJRvgCBiTtt3xZRbF_1s7D+yXXJ+A@mail.gmail.com>
Subject: Re: [PATCH 04/19] dt-bindings: timer: add the Allwinner V861 CLINT
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:33=E2=80=AFAM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>
> From: Han Gao <gaohan@iscas.ac.cn>
>
> The V861 uses the XuanTie C900 CLINT implementation, like the D1. Add an
> SoC-specific compatible with "thead,c900-clint" as the fallback.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index d53f52e80d88..313fb39bd453 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -49,6 +49,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-clint
> +              - allwinner,sun252i-v861-clint
>                - canaan,k230-clint
>                - sophgo,cv1800b-clint
>                - sophgo,cv1812h-clint
>
> --
> 2.55.0
>
>
Oh, my misunderstanding, thead,c900-clint is used by opensbi. Please
keep this in the commit log.

Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
