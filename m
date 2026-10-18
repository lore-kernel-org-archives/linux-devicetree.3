Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA66E4A2A4A
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 13:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331890; cv=none; b=b5aA1pz8OTGuFDBlDGizvh3aNDKswcfrHyhEpZmtW6xB8P96P4sUT1zGPKk8j77+V5Rhfx+JriLy0Pdix5R9nXGdli8RknBv1BtmLNKRWvxJzdPd7RaoRINCHJ1ueslbpYJR2x6OVMUcZZFgRdUnOkkF3+NbE98PM0hejPv88f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331890; c=relaxed/simple;
	bh=rCFulCS196Fw/DBDyF9OMjFHIxiu7hy/WMzgUHoLoLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYP7wN7ghbZ/lG9SeLycM6/jDyFy09qJAgXDhi0ke9Kvp1hnsDIoeHorfK7kJinl7PAFqFfuaxMrKUCEUDo70vW0jHos9nAyxfrzRbx1Jmm7ObxTkWYUzumaUGzSpFfshmGqbtzTwKm8u8ez2WIRhFMNXO/sN+uRe6y06ZdPENU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2db80fcdf8bso6869065ad.2
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331889; x=1792936689;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhGyumamsbJwvfAtfGydBWyfBrT9VHxtfq0yzwmUVgA=;
        b=L4Rad6iHoQW0s2I2qHOrAOPjNybdno2XXUIcSbU8t5V5gxszbWhnhJ9IZYv8V/b9Bn
         n49auvyHR8sEBAjdBWTMUXY/a3sxqbg6trbM03METbpejPDj9pRL2OHsQoYG6LACsYpo
         zEQtp+sNaZ6f96VFhkKN0ROBzjPgT919inMEd4ScP3yVOh5iF76Aa55aVN6GEMWjF9B7
         QwsqQHlxsda8p/bdxLZ3PHImnamCdI4yctBHoVlWsr0oPVPGK6SlX7xwPx6y1J1pS9qg
         b1JxSGm584hC/7YYxBXJoWDAvSsvSG/qQNmHuz31WxihlA5iW0M/w9061lPtAqMUqHnp
         yAFg==
X-Forwarded-Encrypted: i=1; AKwUvByrB7ZgMBre4vrt+BIietc2aRcO25/v2BX0VeXhlkuNNFEn4S6vKMWaBcPSNhq3TfCpsy+E+JWdKY1N@vger.kernel.org
X-Gm-Message-State: AFq9FYJiUpd9HDxXjE0iqnEHQUOUtLyRvEO7UNkC/dHxphWpvqRXX2UK
	zeBz3JKLBIXd4QBN8YLueoNSlxYYf/nSHwx8gN2VpzMFb6JiJ5ElJVag74fWEbJI
X-Gm-Gg: AYBFou0SQCqq3M8ykQFEmisPkHn682q5rLj31LUki8ACvEUPmRN68AMI7vZcv1AGg/j
	ndHDfxZKnp6qwNU3hFSPwLp7vxAzEAcPBwougVABghM5DKWzmpkWiOyAidChbJLjGfqk4EQertK
	WHPMty8hyXBnujMfp4C7gNUXN9yMEdgAJvG0oHfjJi/+9OB2U8vWo7xgdLVVJdgONQmHhhWP/Tk
	LJKHaj+ndrTlnnhxrLwMtcuK80LbJOAqwKGAIEuUqXaYAwPoPDaTGde1Zn6C86Psin/bP3btNDy
	+GWajSTvrX5ySoLfPQC96MhLSPZnNUlAyJtWOFMhHZyb3huAf9jvIoMzMv+TPdkWpWKhp/Jln2v
	vdfkCdLHhd0Z2nASnWXNq5lm8HER6tiskU4W3WdZHCQvOiCdlslJIjZs1WaLwv2GICYuH3bqibg
	U8dmu9vGs82DhuNJML0psILT4u7lAjijsUGQR6Gjk/ahfNHbz+TNEsynVs6YSlC0MBLuQvhLlcU
	AtCOkigUSrBuY04+Kwr41MdibsxKfh3pGitUsJGsufu0jhmiA==
X-Received: by 2002:a17:90b:3889:b0:3ac:17c:6e85 with SMTP id 98e67ed59e1d1-3acef0ffa0fmr4262592a91.47.1792331888681;
        Sun, 18 Oct 2026 06:58:08 -0700 (PDT)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd9c4b4eesm9557017a91.2.2026.10.18.06.58.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 06:58:06 -0700 (PDT)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so3153643eec.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:58:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxqBX1+vR6VrII1MKt8j9oLpIbSU/JZLLYSFrkjqK8C22uZ/dGDYu3dsmUVw7wDiRczYLnB2uTiolxk@vger.kernel.org
X-Received: by 2002:a05:6102:5249:b0:7cc:2a3c:9a33 with SMTP id
 ada2fe7eead31-7cc36b49079mr1291606137.34.1792331517781; Sun, 18 Oct 2026
 06:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <51d8ba05-76e5-45ab-91da-3c6cb02505d7@mailbox.org>
In-Reply-To: <51d8ba05-76e5-45ab-91da-3c6cb02505d7@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 18 Oct 2026 15:51:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzX8fd4NDQi8ow0m+48g8p-LBHMysFi+fOqp1oDtT8LQ@mail.gmail.com>
X-Gm-Features: AclHuK8HjL2MgNJEhgQ8UPYzZV_qfVLea-QA-Rw_khapKdsDEf1HaCakMPT5y5o
Message-ID: <CAMuHMdVzX8fd4NDQi8ow0m+48g8p-LBHMysFi+fOqp1oDtT8LQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 17 Oct 2026 at 19:34, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/16/26 5:55 PM, Geert Uytterhoeven wrote:
>
> [...]
>
> >   static int r8a78000_cpg_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev = &pdev->dev;
> >       struct r8a78000_cpg_priv *priv;
> > -     const struct clk_map *map;
> > -     int ret;
> > +     const struct clk_map_in *map;
>
> Super-nitpick, use reverse xmas tree ordering here if there will be V5.

I believe that's already the case. What am I missing?

>
> >       map = of_device_get_match_data(dev);
> >       if (!map)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
