Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5222B4AB3BA
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595495; cv=none; b=aQMu1b9SY4ml5C1DMvbqlmhKIY9oGL8OvoXVGp3fYJ2mT+S+Ctosd2eis4FBjnAZSytjrJ+cEmmGHti7JCQhMfefuoM7ti18US9AJpRE+nLk3ELAZxxQ688a0N1Q4ze6QSbRXjhBXVUykEOmKYGlNVex4YVpqDtkU07KhH83vjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595495; c=relaxed/simple;
	bh=tKvl59UVQolgo2gX344Tqkbysa6udLoFwYeW240vcog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VS50S4hxkzBH8Ca+wx07sDgnd35nj1bdIcLopWPmRbux7W8YTvvk0WPgNYR/8J702dZ9fnPpk5BKTcRnBrW00yzvkoQX5Hwol/FbVd5w42FCAzQD7+yq31/S60GfW3VHKfzaf9B3I9Q7nPxv9KrANkaHqc50hDnRX0Nyfrl0GAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1289770241.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 04:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595492; x=1791200292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i6Axo3HGXtx4M0ZdgmZ+9VJvjH8NJrRWcx2B+NzBV5s=;
        b=P6vNfkLI03aMZPqQmNxmweL74LZK/zf5twAQxMT3K98QhmfK8qiAd0BaW+SA9s2YEl
         c97YLP3AHxFAu0iAWzHxw7+GrsTus0wE4re6Abzl38hSyf3bK3fzyymlQlrN8Nv7UXMx
         bcIvlMxSF2BF7h7XLWqCTzeitjtBuxzCfaXr7odgUG+s4Ok5tmvHg1eYDX45+H3i/6Ae
         JcK9BKr30QXZDNwjcAad5wl8CwVkrtqJsUL9fb8beFtsuZ4/EF5AQnOUMvx83r6v4Onf
         r/FxpM485WEmMJ4koCqma0NjyO0tUdUAhKtPQd6NMEswGmtAIchbj0026d+aNAdt7mOR
         9uFw==
X-Forwarded-Encrypted: i=1; AKwUvBxnlXtV47KBAypQGizCbZWYCyPPkPmWAG/MrLxxIhiSBSavRZ6IG2Jx+lXDldX1VttStDNQNf/h+EZ1@vger.kernel.org
X-Gm-Message-State: AFq9FYKyEGd5tO+4x9lInNA3r20J4S4c9z4/Lr62vjE9yiYAhdjfmPfG
	8Fcno/u30e/g7eoDF/mZPYYK7bKXWPBcrkApC/0JW54tlBxhHKnZLAHJI9ZkMq/J
X-Gm-Gg: AYBFou2CdO9IhaRo3zzKXN/wzSJ/qs9G48ij4F/qP9s17n91TQwEBTzcohdza7Id+XM
	dT2CTjsWmfIXFjVJ/JZpvScxgpebyvHTq/lzq8curCp0BIWZmP1B9bnejC+ii68KtYr4eHm49/M
	/tgwbt+G+l9qqILWfwAcOP9jRFuYrRN4gAWOP3KNvHeqi5vHMZrI13kIbinB5MUUmJCJxltS9bV
	Fcj9exDQW/kk/6NJEaJ6K03jxdw8wnxuWT7UrOZCSDFlq2uS1OokLWoWpZ1IvnaWLBlzYjBmdjw
	kdj7ZVnWwEpxC73pD/brkApWrXVyQ8b8C6/baRLwU0n8QVy4adOmRwdfG6Scr8N7xKPxrvH16ei
	Y//3lsqPdgrbZ9ro+yWoeeRGd6s117sPHd/P+qzqGRDzvPSonCRw7rat3tuwheiLGx5HzZp+fRS
	b6PS0h1m5Pz8H3Ir+mmExVGFk2w3wI6iF0wST8EXDt1W/Vk9uCEqT+0aKTFz3w0r6aXKn6SYl14
	wpBg1U0ADdIuY6yJO+ZvIcp177rzfC7QuHTrb8z0K9TCpx+
X-Received: by 2002:a05:6102:4b12:b0:7a7:19aa:8a84 with SMTP id ada2fe7eead31-7af1edec48amr4639287137.31.1790595491929;
        Mon, 28 Sep 2026 04:38:11 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b6a6272sm8960206137.7.2026.09.28.04.38.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 04:38:11 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1289756241.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 04:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwl8JRaqRMDaCldFXtgi8gMuphG8Lztkz25ixRan4klzshjWdYnXI1t56EXb42iTcAIV7f00mxRS1xi@vger.kernel.org
X-Received: by 2002:a05:6102:4422:b0:79e:373e:8216 with SMTP id
 ada2fe7eead31-7af1973fc40mr5035987137.0.1790595491034; Mon, 28 Sep 2026
 04:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790325809.git.geert+renesas@glider.be> <10e85f27b8ea4342f6f19a7c9e68fd641e58b54a.1790325809.git.geert+renesas@glider.be>
In-Reply-To: <10e85f27b8ea4342f6f19a7c9e68fd641e58b54a.1790325809.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 13:38:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJoy0pBHxfib-SmUf+2LCum3HAk1hftXyeV8CEwKWQ2A@mail.gmail.com>
X-Gm-Features: AclHuK_Ipn8bslrHX7mMK7Zs6CdI4c2l8ME7s7cvf6MpMmTS5OEzqaHYWA0OcRE
Message-ID: <CAMuHMdUJoy0pBHxfib-SmUf+2LCum3HAk1hftXyeV8CEwKWQ2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a78000: Add MSIOF nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sept 2026 at 10:53, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add device nodes for the Clock-Synchronized Serial Interfaces with FIFO
> (MSIOF) on the Renesas R-Car X5H (R8A78000) SoC.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a78000.dtsi | 104 ++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> index 9a07753b221541ed..d75a9e43f772f871 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1000,6 +1000,110 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               msiof0: spi@c1700000 {

[...[

>                 mdlc_cmnn: system-controller@ca410000 {

Hmm, something went wrong while rebasing.
Obviously I will fix the order while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
