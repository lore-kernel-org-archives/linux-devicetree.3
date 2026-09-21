Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911113AD539
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974800; cv=none; b=rKwKizTpBZgikML6oWQm/+rGJUdtVrO+VxCKKjEUoVda+5B/eoKtD59J3O2GuN/iKzDb+yQnX0ptZmJMGepE2CpSgRSJmnUGpf/wwkj8XNMUcMWitrYrFNF/2vzygTmQplGeWd2j5pstynmew0rH1g6fgbq2QH7wQkDKQ0hsLxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974800; c=relaxed/simple;
	bh=mlXvSVm/Lq7qa7w+AV7HA/L3OjWuvTwojTve2NS37ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENPTmLUyCczqXHmilwbZBFfjMso+osbIm2wyuR3sUoKFycJN508GAVJo1zi3PcEzbm0zzmrPtaz1yUETFd2ZEarHoh7HqJAv5aSlX0bwcJhDnOay9xm46+malmH1UewY/WYkIwwxL3vbpZXuB6KRwZ2M2c3tpA3fekWx91iAfq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0299c787so204509585a.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974798; x=1790579598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HB8j5/kP2XPOkdK+SCbhJLf9Uj+WB32C7OC3D9kNjGQ=;
        b=aZKl2oO+dAzQgkkd/FPXA/xD+e9/wxkp52ltwVZK1M6qbOXNQ1oz40j2pE2wHAnGz5
         ruwXPIgHdx+nXR3JMkGCLwE1Xm9unfZxPywnzO8tR/3AILCD5gBYxztXGU6SeIY/yTHR
         2L529ZP/tqH8vBUPinyUXIyGtdIqkzZ3jrwAJVheKOd1ard4Hy3oJCR38WRb34mom51W
         4DnM2UHddDiSwoNoJhHZxvbxNvOFoAFh3Cl9GEKORekJQbdQICH0KbJmJ1J839w3iQ+2
         vIIjfVIaApqzG2/tvVr8ST4QuwiUgcsEq89Qs8e/po4DZ2ywjW1y3iKDujab5N6KLM4b
         M0rw==
X-Forwarded-Encrypted: i=1; AKwUvBy/Av6GKanIjdP4oBru5pomFBfOaU3h5jDJRSlSD/8Yl8rlifrRDnPI+sA9RFD57f9eT8KVaR3hxG/w@vger.kernel.org
X-Gm-Message-State: AFuF++kjXZ34jHbT/nRzlX0/9m4OuC4PmUfJMd6BdsnUZRaEMyBnebTa
	w4AdGJArgill17y4U44hCZSGP3Mt75F4Xjz8Zy7xiX0U9PpL/vkeb5g860FByOAO
X-Gm-Gg: AYBFou3RNzlwoMt+nQPFoCKqnFm2Nli4pIEjOHfzyv/BB4tGBKOLAI2/fUpphkwyBOb
	LtwURSlKR2n6Y5Yx4uoSHufy0maLjufTpznlGQNFovasBx/DVGE/5tFWbIkRwB+Govg0k9lqZsw
	svjcJ37hNQyHaQ9CEjCu1H0bGKsHhETxzB+06iha8J2rZ2X7AdtKxmjbC2o365O1r7Dvv4dSf90
	1e3VKI/+96jIYR81G9PnBxJV1Nxca6cwi7Jm+bRosnLE+0EQ5QTNFX6N11ypG2e0PwthynVVNoz
	+eTmfb5c9jZz6++/+mH/GokjZW1O3vw2cqQkSx/kXk2oHBuHrY3hqME/YeqNby54j9Ffiu+6GIt
	6Fpqs7J2F01ny0vN9LZMEe2WD6fQSFEnZJP9FF9vx0JBRD0oAz4+62ZDrbBNyxSVNmqW4M+/irA
	2pkq6wHrSbqo0bvR7pFL/QkAQp/rIENIo6weRnyMl3/SE/0ZZP4Onv2icioKNrCqKjMK8z5Raeh
	DZmOlj2y6RhJP+pMTPJr9M1pXaV22f2jfYt9g==
X-Received: by 2002:a05:620a:4142:b0:93b:d7a3:45ce with SMTP id af79cd13be357-93bf5799fc7mr826822985a.55.1789974798318;
        Mon, 21 Sep 2026 00:13:18 -0700 (PDT)
Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com. [74.125.230.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedaef96csm579265985a.29.2026.09.21.00.13.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:13:18 -0700 (PDT)
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-910537b51a0so23779336d6.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:13:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByTQyuiZFlAan/dTSIWdfUIhiBrdvPkB7yHj0wyHWH70xe9k1Wsjkpcuq4SerYWK0/R/EwwKo+l80Bg@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:7a4:da60:acfb with SMTP id
 ada2fe7eead31-7a55af3177fmr4503081137.8.1789974432591; Mon, 21 Sep 2026
 00:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
In-Reply-To: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:07:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
X-Gm-Features: AcwNN1XBDwh6z17IsaQFiDrYFydSgUDFMGU_5lJeAdoD724Pjbvrq8QmlAe59_g
Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Kieran,
>
> On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> > Add a new dt-bindings/media/video-interface-devices.h header that
> > initially supports the Orientation types and convert existing users
> > throughout the code base.
>
> Just noticed these are already in since commit 6ab5acfb8dd38729
> ("dt-bindings: media: Add macros for video interface devices") in
> media/master (next-20260903 and later)?
>
> > v3 collects tags, and fixes the typo, but drops all hunks that do not
>
> [...]
>
> > v2:
>
> Interesting changelog order ;-)
>
> [...]
>
> > v3:
>
> [...]
>
> > -v4:
>
> [...]
>
>
> > -v5:
> >  - Definitions now accepted in linux-media, rebased to get conversions in.
>
> Oh, you say so here ;-)
>
> >       arm64: dts: renesas: Convert to new media orientation definitions
>
> So it's been safe for me to pick this up since v5?

No it's not, there is a hard dependency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
