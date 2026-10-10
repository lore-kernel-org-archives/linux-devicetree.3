Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952113612FE
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626823; cv=none; b=HQHIeAvHAjuPYiBZ3rAFvUsj7l/3pAFr/r69+tw9bxhzz4hhiTqM4nLkAzmqM9cQuxyeZdDyHC/Vmil/4ACxHKT2XTKJI3SLrEn5grd2/BLrZfyY03cnLo3Ik7nYR/pGYpfJpii1ZnZ2opd8HaNVzynXeOBCGvTonfJAa9jVfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626823; c=relaxed/simple;
	bh=G+OmJo6KHk1Dz1mbCFgc9+lDQS9rLz/nyFsb9jkmjTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WL8K22TjlrWWTzI5AWBar3WIE6sKKQSPUhrCt07z72DWsyoIvuR3pkfpHwMx7aG2J4yrqyi/MuwWlvGRX+aDYCqLzdZX8roc6QZngP5OlOTCDlZhSoriNjA78fbuCWMEggjPJl7ZSPh8PaYC4XS1+AmtYnHfRJNzgho0s83f0H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d68cN/PS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="d68cN/PS"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso267538f8f.3
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791626818; x=1792231618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElWk8fKGydcvVdEATDJFrXGRGjE67AASQOUO8YEQCOc=;
        b=d68cN/PS96BgvaIVEbW2urVOHeTHY7+qz2vq3ZYroJ7w6D2flGUHlTYleNncFvf4vO
         puUb3WbeX7NaZjNdQ17BYEefqc7aCo6zwUFZ//ichHmHw2uvxkUYlqip+MoobynRH+Ma
         h46VywE+M2rCQUhdXxzsXBSp2DNt5+uNyLjvoh0yGSVenUen61/flVwvUqVCr3FtKWKO
         zY96L61c0UjNnt1Sxg1utoRuwI4rOX9hJdDjmmXYXprqHZJ+4cF2h3Nbq8Oc+v51FzEa
         VjFySdR3C4kLh7p/pvbtWP0Lrnvl8JKnt58lPu6Km54GKt3h6KTjcga9YUY+czD/duZk
         7xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791626818; x=1792231618;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElWk8fKGydcvVdEATDJFrXGRGjE67AASQOUO8YEQCOc=;
        b=li2p6CsDA3S09CcWCBQLxwe56MAprbWZsXV2S12XQo/09Z8PDxC+ZXQ7LvicT1ptj/
         nlbPYYQ+a+2JK8QNyFWhEJ9TrT8zATsg5BCtFV4FYwU4wiG7DIUIoS+3SUIvsattP6ct
         De+JCPExWr7b9nbuVrcyaPHQ8XRHgm+CPiGsXDIRH8KS6WhAQZL7aLpfee7SFtf5kZiZ
         roslzzqvzIUNcfwQ364E6HSeeEcQoT5L+wi7Z9H1tsLHjPJ+ZrzyESM+Dt0fLzMoV1B2
         Px3vcMNmEsf6lzUfDS8WwHAUqhw33TOEijmCCytSaaf6QbWvNvp2jc1DVfYz/xLcGK7/
         tVSA==
X-Forwarded-Encrypted: i=1; AKwUvBx1WTiUbKAIHeIOEZ/uVSgvY78yBtSAWTNZYI0PpPK2P1nQjQjlN68iYc9i203vVknfTYcvJ/dd6Sfv@vger.kernel.org
X-Gm-Message-State: AFq9FYIXIRbL43aXIgeqFbHtIKa2bkx/MuSKHWJkwzTj3H9F8rikLsce
	7qgGH9jFZfaNdDTVJpfv6zYpZ2+3HyJXl3/+qDJrpCj8fPunm1U23c95DgF4twhMn/uZqzX4uw3
	gO5csb7W5wg==
X-Gm-Gg: AYBFou0sityBPMAUxzH4RtgEEaIb1XmwDd8ca2EmgYMHVQR8SrhLQ0kBiY9NMJ2RNtw
	riofzaVoWMmmPDbBHPmNBYKafnAwJ5XLHwe5rWMNvSjSYZaBBtJQLAqDrrzVZFnuGqBHRQpg1KH
	arjEmTXlZKAwFmIium/gffXlhkyR9bMTBkmP9tNg7yvkwh0ua3US17S6E3H1+LeK/XjqIErJByz
	a9ajdRd2vW8kBwAiywzV9HlYeLnnirfgCTJD91QY6Xq9cowMiKp3divtpS5/3t4lbjPBTTQhcID
	O32yHsI3q31UILQuIxP5t2bNSvoMZqeU7bIREfo72Pm1mdgidiE+2Lx96k7/oPGyCqo4tSZXxmk
	udK/jWYucfns/IUF9LYK4RYfMNF3CLtNQx/SHifdNL2PP4I3XzersZpeH4s1Mo4TlmZv5zMNSLc
	6nUlOPyecxczbLsQRJ2aV2ehL9cMPL6oxukqXXoDxBD1ZeOyFs2MHM9+Yy4NnFjDyyPDpedrE41
	svEhAH2/iZZfVf5YQ==
X-Received: by 2002:adf:f2cf:0:b0:48a:fe3b:64b7 with SMTP id ffacd0b85a97d-48dbacf6ef6mr5914261f8f.53.1791626817764;
        Sat, 10 Oct 2026 03:06:57 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm7389151f8f.41.2026.10.10.03.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:06:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Subject: Re: (subset) [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline
 clock real consumers
Message-Id: <179162681558.457042.13976808955805070898.b4-ty@b4>
Date: Sat, 10 Oct 2026 12:06:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

Applied to git@github.com:BayLibre/clk-meson.git (clk-meson-next), thanks!

[4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
      commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb

Best regards,
--
Jerome

