Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610960;
	b=fOKGaRezlgS8KJx8UHaVEjYmD+vGGjFthgvoP+EU4sVaZLjB9T0go9K3PQyDBuAIkxRH
	 eq+5nZ08W5TCrUYhKBElT5hwZNeK8ckWxt1ZYGwq2G2g2HIfYZN9hvDHFnW33jiAhGPGV
	 uqtxKFWQ5wMQgym8TY2baJWvSCLiKGLRdwOtqyxCo0ITh2eDSIUJC1eDfQlCNiVFtk8cI
	 ln5wHMgskfG768vFWAV4bztBBTxesyxRG4Sz3WDtskMnMVYLe/jZOvlaOls7CNTWYpMoZ
	 8hqDb96h/d0tcRMQ6aoESgPK991iFJJcuOtSjwhzGg97mADqOiVKkpBPFoUXVc+Bmcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610960;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ac+xpJrvd6zfAE97WIurl+pYtHzF00Lzr1WG7VTrgAw=;
	b=frZjUS7EFWZNZYSiQnroOfAoLu2jSByg2sE5E14w9fgMGo5Zl3WIfqGovhZ1lXPTCDto
	 5UyNIhfHlHNAJ0yXnjzz1QONZX3bHRNKe0ZtkJXBsoGs73w1TBkRyU6GbFRtMooj1X1Xu
	 4FZYmXflLU/RYKMb/DyfSHpHxz4RMuJDYX/DutkEAKmBq6QOZ6Ys6CUmMsw2+h6MaJ9XP
	 afE0ZVSF4Cryflhnu+ge4YEd0S5mm8Qey6oeSJFyUJgO/YOzEoeMZwdvcJ/G5OfMKfIQI
	 OJ0zdY30ZhmHosrNPI5UEr5fOfKOcoRFs9IUovGTs8aB1g8a7+BQlXKBBkpyqq62fyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BA7606A33D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BA7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53653e30353so50708311cf.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610959; x=1794215759;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ac+xpJrvd6zfAE97WIurl+pYtHzF00Lzr1WG7VTrgAw=;
        b=iMN4aTgAKLDMQfA+g/DCiRDGTLW1ugNM3L0RvBhiKZGOJekXB/LX9d/+meppmMt3KT
         tSudJIrZEZIUATKXzOK/6OmoT68XXJwcffa0ZWJheH4obE00jh/0dEb6h872NN0C/GFt
         7oqjF8tvdX6UnPCrIfb2wuCfHdks66b+pFFw7X/0AkZDrTbMpsnWXhCNFnJkWEna353d
         2e2CU8B8foKawLeB2gMld8REWzMZY8orCpmk8aR/aon1i5ZvtVNFpHh5KzBUmrwjOdRu
         grB3x/uGCNbOVrj2Jhv3Bekr3yZfDidGjaIAGxVktclzz2l15MxC3F1L4L8uo7/oD0TT
         dtFA==
X-Forwarded-Encrypted: i=1; AKwUvBwyZVvJJosou65wqhYyk3Udr/vs3ClErmYy0jxaZpTKZmKius8QDOjuvIu6NCwgiJM3hRuO6FmefGKu@vger.kernel.org
X-Gm-Message-State: APuU4Z8xW8GThOXLxERWffJDxc+JHAde4O4WqlRWILvnMMbC+7laFNTL
	B0E9YVtbDxz4OWxmiC0/SKZaTLV3ZuD+YFuFdn9MuT4fXVfCs3kejDVUT7ICZWrH
X-Gm-Gg: AYBFou1ITdWbmkQcIAiZ51pfjxI0chUSBfR4OXNpEQMSc1cSjAdfNLIyqBXZyVRMfMd
	f1er6ZKKx91p1CiKS++4EwgXlLk93a/RSL/coPTLGNENxqH5g9vvU3eBFVKkObdQDiwG1ZlUFbT
	kazDvBPq680NzWB0KHVSnibPF3vL3v5n7MUI2L/AyoFDtLJB71Fkl9AiSErqPbNY1LsE+Y4Jc7J
	Gyx9noOfXuAuojQ5KCMLBs3hALFUOH/5phJhStJ036GDxHlfbXY+0EUcx5osJKx66dzObUWVjnM
	4PV6oifQnPfTaXOYj7sUXOQ+TT5pOJvCzmDpAyX7xSUF6N6llcYFNR3hsq93YOhEAmXDxZjYGyO
	eEEdZstgIx8ZoU4Y2AKgWwiAYgUdHtwh8jHb0lsXMhxj9KZ+fdwDLzVkj6r1Hxt/S9m2SaXFOdc
	2LZOMgnScm8ojnAxwtLlvWTc5lZeoUfC2Iv/6h2gmI+b7A7FDaZevIayk1N1T4elLnU1+hx8Z57
	jcnMm5mG2Hohl3UcU45o3A0bMazjHA1j4cbitE6wxDMhf1V+wwK9mIBfIiFXhGIVE76iZmxpUFP
	V3haxWxmsSddOaKo30R0yzuyX5mTRBxcpkgfxyftVsZWRU2G/wivINTOH6aSg/0nf4/7CQ==
X-Received: by 2002:a05:622a:950:10b0:537:8403:3a80 with SMTP id d75a77b69052e-542b3a7904bmr106780961cf.5.1793610958805;
        Mon, 02 Nov 2026 01:15:58 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5430cb79c85sm80457921cf.0.2026.11.02.01.15.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:15:58 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53653e30353so50708061cf.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:15:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzKLrd4l35IKYfyf4jnLyVFuugW1kKeIdhqExmuT7DI0cXusmlDWgMY9NyyS7EGgxKutbY0mQ2kYGVa@vger.kernel.org
X-Received: by 2002:a67:f403:0:b0:7d0:9587:1b90 with SMTP id
 ada2fe7eead31-7d0958732b2mr1205111137.13.1793610463593; Mon, 02 Nov 2026
 01:07:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-3-e052903a3832@ideasonboard.com> <20261030220549.GH3178046@killaraus.ideasonboard.com>
In-Reply-To: <20261030220549.GH3178046@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 10:07:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1czCW_KTW8Z+_jb3egLxqBu7bOUmqyXy3PqYhmUfLNg@mail.gmail.com>
X-Gm-Features: AclHuK-1v1dRSgyK1HeeK29l-3g4aKIGNPop6k2nHA1eLryORdmauRDpRhHjRsM
Message-ID: <CAMuHMdX1czCW_KTW8Z+_jb3egLxqBu7bOUmqyXy3PqYhmUfLNg@mail.gmail.com>
Subject: Re: [PATCH DNI v3 03/15] pmdomain: renesas: r8a78000: Add maps for
 VIO for SCP FW SDKv4.36
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 23:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Oct 15, 2026 at 04:51:43PM +0900, Paul Elder wrote:
> > Add maps for VIO for the VSP and FCP power domains and reset domains.
>
> s/reset domains/module control/ as its not just reset (and there's no
> "reset domain") but also module control clock ?

FTR, SCMI calls it "reset domain", but I agree "module controle" fits
better here.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
