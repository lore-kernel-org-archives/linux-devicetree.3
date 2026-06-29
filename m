Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7128238B14C
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 20:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764379; cv=none; b=XauU30m3vFW7aUDGCv6nQvuSCEakejkbcar+JOmkJ1K6haHRoGJOeFM1/m2aaHk2mwvtARxpuNPhFYow6o261Pqk5F5uF56+bXOosblXKv2PWUkl3zKw1YEM2cmfuDdbN83915XOtyJZZwnk6Gd1YMW2aG7hjHUmDmtQ+4u7NLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764379; c=relaxed/simple;
	bh=pdYxeBI9YkOpfxIvVwA9F4HdzieF6uivgjdrMwZAkmk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GtwHGbGoByRdG06QDU3bw4D1eq2pd3KjCwL36DIlScojkQysFKhZu/C+vGbCFsX34Irl2stFpqkthoYq54Qvv9tDzufbgGPrb+P/F2p5qb0qFK16IYPL0Zv47oAr3nRym6K8Ovz9f+Emkzga8s8NTsuWSegvf+CLf6XEVVfh8pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QIze/DRA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QIze/DRA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c9b42be8feso20740825ad.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782764373; x=1783369173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZg/W7O3xMrPOVncSfqHtuO2PvBNacKXPKLTL7Ha6Q0=;
        b=QIze/DRAV+9cyF54qAB57jhEkjkG9jxPaV91RrUxRXIOrRtvu7S753TGME+MIyHI9f
         n9GbosdCnh2HoGIxV9rxoK88+OvpvvR8+f2cO53Y6hBhweHnMOLG1ZTq1cK7VUwq2liA
         DuSmmy2qTHkNfEV7lNDSQH8C+4ERxRZLEvPSzPra3rgYGEM+zJdNM5bB8ui4L3fctkHk
         8HZAiZngsANdUGN9ZKZkpWVQXUSDYb83IjchKnGw0Q9sfGIsyjxQd2QR+lMmBgQ0bWwo
         LKaSm8245l8POJTygYnkzLBAVxnVxm6NeFBO1VoecXCgvyHrmwp559G8UwdAAQJvjyh8
         tCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764373; x=1783369173;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZg/W7O3xMrPOVncSfqHtuO2PvBNacKXPKLTL7Ha6Q0=;
        b=PgsSkCf754jiBGUe6wnJLRTk3M0qzge6zS4Ie0q1lLtdDDRAYAjeaxWs3NWWHbRJO8
         Dn2CwB3WtJv0UNx7zhDED4ktfiCUQZNSz6T+3IpIkIjusUqk2BoWS6ZNFKYrUm16lqwN
         wpdJboKoYVJH/3Lr16O4m9HTNHYICEl3gWsVDmu8pKDLddYmJk36JbPFT+efYCOT8HAy
         w33mUuzetVUyuzJvdGYYb07vqyXc8k7/6YZSQ+LJsgW1eknMoPLYFbH+5eD6bQvaZJPd
         GgvNGR1dTrgu/QiUY4ZAFQuEM/T/d+86zeDA6sKonwVBoFF3IVpBUQs+fDhlOnMFLU1C
         ThSg==
X-Gm-Message-State: AOJu0YxzGSPyvRH1i0lGy90twXv6es45+wEYy8f0gi9A01D5G54GYmqa
	RHix7dflNOazG8VglP/QfykDcqnKJMOFoI5qBUAtp717adDd5rZbjrMKJnEaa0CGitk=
X-Gm-Gg: AfdE7ckzImuvvV9UCOJv3EU2KgTTHoHCBAjP23Hredg1F8CxF9yY5GAV9XPqb6HZlte
	nySFizNZYqTh7hoir6Mq012juWNVtW8YW0rABsTBPU/p0mzpYIivDZPAYd2WDOjuSBv0s/NBh2q
	hfIqVp+zVOZpxl8oj7A/Xnuv9ku8AJNTn2r4oCk/LyH1xKTVYMsLgYpM7n0YoD9Rh5Yi+O5Igiz
	7sTetBqOef5mwDp7Q8Pw5WFkJpxNBJMhA+bNGE0QOLDoOxBR/Y9WRcmynq+kkCb+tWsxo8ihUz0
	N7hjcxkr4hbTwDRXDePSZU+K4XQOwEerqclQIGQGUsfXgHj+uQMWGnYEpBmApCbCzQ84ZwImn2X
	NxGRs21vWkCPfmMd6nxysg5ttbhyiR6zhSYn+Me7x0cOa9zptX3vMuqaM6jbE8djTDVS4p1yXll
	iNwVGkK0MxRA==
X-Received: by 2002:a17:903:1c2:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2ca2d3d202emr6219205ad.0.1782764373360;
        Mon, 29 Jun 2026 13:19:33 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2ca37c908e7sm102735ad.35.2026.06.29.13.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:19:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] dt-bindings: mfd: syscon: Tighten
 checks
Message-Id: <178276437217.1055800.1836973932721840283.b4-ty@b4>
Date: Mon, 29 Jun 2026 13:19:32 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Mon, 08 Jun 2026 22:44:23 +0200, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Drop patch #2:
>   dt-bindings: mfd: syscon: Drop unneeded case for syscon + simple-mfd
> - Bump dtschema requirement
> - Link to v2: https://patch.msgid.link/20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com
> 
> Changes in v2:
> 1. New patches #2 and #3
> 1. Add missing part of patch #1, thus not adding Rob's Ack.
> https://lore.kernel.org/all/20260531110404.12768-3-krzysztof.kozlowski@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[3/3] ARM: dts: ti: Add specific compatibles for SCM conf nodes
      commit: 68f994ec51e279e63c8fc40c1bfa8add4b708111

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

