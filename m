Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71464BC00B
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178820; cv=none; b=SyO49fsY8EUk8FhVTKhHWx1rpH7LTrlQQPsimHMYtoHBIliEEt+rchjEqFcArnj5VLduJOh7ddcfKOcNQCNFis67Zvh6n9vh3iSsLPCFImqTXIBxaw9lSQlfw2ogjQ0UuRHIsNfX07SZSvk2NGxMMqil6gHTf9TveiWunW6USF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178820; c=relaxed/simple;
	bh=XiHxmRhF//Sc8lw0GeHrf2mkkRn2wmshFyT7bRDBSuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d0kISVngP76Ud0EoMTXTathxHygJNlhjyp0pVlYYCKyF/Rn7wWxIPoBz9TeA9D6CN+buIN8fxADXXtLTRhSxeV6qGC0sU+sXOTVN+NakvmiYW8lsBL2hTDmPorLc6Y4SlQqwaaP/kqKHYg4S+dJu7ejEPy8foj4vfbTwZmRBcS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=JYbst4MR; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JYbst4MR"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so7683625e9.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790178817; x=1790783617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hk0sQ453lNEysdZfourfxsn4kfTAj/appBmgqJA7CQ=;
        b=JYbst4MRDZjcBBj6ATSCVPY1pLSS5LgW6PF6SGluQBoBMQcLZ0SW+aSwh1P9HcRpjY
         pf3uY5WTmqN2veWIFKjy8l9VTQ2AKt3BXk1nYn+zPF6YHUsXNSt8H/p5cKV2g36vXCaa
         FYxGj6MJ8jRjjs+UJGEN9xig37gOYBHz/n49A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178817; x=1790783617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hk0sQ453lNEysdZfourfxsn4kfTAj/appBmgqJA7CQ=;
        b=sJEG4Ao5Y5/Tl1M+dqSqR4nQ1f30TPYYFI9xtal4ZzFftgJ42oArifMTTLcOaQTMzr
         cJe0wnt8ztQJZXk2RknjTkNJ52GtOS3/3YxjE+J9sOQggWn0xIip+8mkvZGGsfuWzXpQ
         ZNkysRxAygn8l7vlDT4LH0Cu7UpHdifFhpgW/+9wMJ6DbvZcRyuDfnXpbZ5EpPDxD9L3
         MA5lB3B7nTgcu7PmBSi/hmuR6E3JD4pGtRvNkKUzjYpIwksqHX1qjftm4nnka/xqt/jg
         9xwweV+cEohdVJJ9dMq1i88EXSC0LSWNZDoRTONW/iaOFeBWTDg/WrmXeouODwQSJeeh
         ImUg==
X-Forwarded-Encrypted: i=1; AKwUvByMhlUgQ8DrHL6qdEJJEdyCM9dK0FIQVsiZ56PiranMpe7Ayh7ZCSjygXG4bG0b4HFzdlPlRANXiHQs@vger.kernel.org
X-Gm-Message-State: AFuF++mK/aA6+cpnlwTIyJoDV6G/sOYiIziGBNNIknpCJ0/U6Fzm57a/
	D5/somnc9zS17aUPJd2I/ScqbGA5M47k+qdyepiYE0eLC1OwuVj3wg19zBGHdB5WvLl3RUkISsQ
	HcWVdMtY=
X-Gm-Gg: AYBFou1BvmeNZa7r052s0PhB0fpwQBrFNvWmaMmB1eB6S3+L5iW1won9mLMD+cCI5qo
	+ZW/MQaLicPD4eKZQ0cmeJEmOFhUFCYiSR0GDGlxENmaLjde/BpoC9IRP2fdJJMTgd9okCNQ8bc
	pcjj6nBLObDgSWTHIFEpQXsKq8zPPK9P4hbuk15uaqg9XF9yoTH2DrjNeUvqRFBxVw4XcTIqcGF
	4sWHchR4FDwPqXmLtln4w83krp4Dsvbeq2JmtmltjhqEzUhMym04t00n8sQKOtvThqFGqa7mUDw
	+PRwBCdGwoHdQB3Sxn29AzUW+WDW24gZ5Ol0eLL/E4x1t1mp1F1ZJlQGUVf9hERrX5yT/D4LgJw
	wXfntEfc6815YvTZpQKAmFWHGQmx3S/Z2DhjZRSb9QY1PtWJEnP8gg0RVTqA92zO+MQTZ7RhdbK
	SzXkjOBtn3FqZ8QJLT7Dy11KkKxP7LdV1i8poHsCIXz4T+ygH2nbPxw7c72kJngWayVUO38plXz
	cZndFOVb0rWJo+9MmSfdgsn5lA+ZOzLQwWfijUYx9vHr3TKh1jPtnVX6ToBP9Gw5lE=
X-Received: by 2002:a05:600c:609a:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fdf0f9fb7mr45229825e9.14.1790178817000;
        Wed, 23 Sep 2026 08:53:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm81858555e9.8.2026.09.23.08.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:53:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>,
	francesco.utel@engicam.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH v2 0/2] arm64: dts: st: add display overlays for Engicam MicroGEA-STM32MP257D-RMM
Date: Wed, 23 Sep 2026 17:53:08 +0200
Message-ID: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The board is produced in variants fitted with different displays. Move
the current RGB panel to a device tree overlay and add one for the LVDS
variant, so that the board dts describes only what is common and each
display gets its own overlay.

Changes in v2:
- Keep the full cs-gpios in the board dts, the overlay only adds the
  panel node. Suggested by Sashiko.

Dario Binacchi (2):
  arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an
    overlay
  arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display
    overlay

 arch/arm64/boot/dts/st/Makefile               | 12 ++++
 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 67 ++++++++++++++++++
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 68 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 48 +------------
 4 files changed, 149 insertions(+), 46 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso

---
base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
branch: engicam-rmm-overlays

-- 
2.43.0

