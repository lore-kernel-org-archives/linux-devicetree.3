Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8F556061F
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419479; cv=none; b=rpTo2j8J2Lz67PfTR+4zHCygIEi0iSeCht8zP12jWUepLcKasIZCj61v6f8KsqAHbFEvd6HhlXFqEM0BwYT2yIt9H/zSt54/XE26zi/HMnwzKMdIezZp2+o0BeNwkbuDBY/1cPNElHmEIAKgn9PwyM5mt+I9SFTnxDN8+4WMhCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419479; c=relaxed/simple;
	bh=gEkTb6R44VHT7GxETUcQDEgxO+rMUGdHk6yjf37a7BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQ0E0Eg8xjuut5RbxtZN3/MkASpgLUkBBJ+Vs1+WxIDXGobbj6MVJykUAp892t78GLz+1iiAycYur3F/1s1UPTD6XfFW3wufSmDRP1kDhm8ncyqH1qxQc8iDMcvK/Jim+ZTJuIDH8cWN2biTBE9ag78+08W5LxFUSa22ui4NhDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSwubVJh; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSwubVJh"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a05effaf8dso674452b3a.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419478; x=1793024278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEkTb6R44VHT7GxETUcQDEgxO+rMUGdHk6yjf37a7BQ=;
        b=pSwubVJhDHMGhiX/NWATXv9OmjcPmQZyfaBxM6C1JkHPXiK63WHqeQfGNrG8tRxwgQ
         5o4YwVGrWPxibnDG+qEaSUgHzLKi03XwjImEOIfuUIsoJ8Ad4VDcEVZvntdXTeP+W6wS
         ynUmnqdal+OCQw5ODaD0rETCYM2SNj1HbvHwoaf+QOwUgrVtoK/SNBdTEAIt2bxIzb9s
         AovBiA1lKjI5Bi3vzGN+edbmno+mRj76ddTbeKrrzUTM/s11BemeYFK+0HG64o9n/ATR
         vrQFF7MD2Y37lumoEhE+n0xPZbS/vOAq2hlLMkBt5fdnzKk0LbM+GNlzPBHtNm8FB/dI
         gnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419478; x=1793024278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gEkTb6R44VHT7GxETUcQDEgxO+rMUGdHk6yjf37a7BQ=;
        b=cv8/aHllJ3+6OrgS8ZymjlG1gwmTvGAN3QM32q1xTX9U1f2UFGk7c1Z/fNuKUJBQCP
         m+03ZpsA5l/mQ39aOoZlIQI8IDDuBZ+zp29fsM59hLjPIL7YHkfRAbltyGe+QnxcGqO1
         xFAbAiHJ5F+t4SInVm7h4ioQbmX/VxFKT/crttm+Rc0LTIjoC7JKlSMN8w5vtS2mMiOC
         pYF1sJLII5Q+X+ii8MFeGUoc6wwmSDSC8QkqgQmD9UuBilo+k7/CC2SDjh9bErrkVf2D
         Dg6CyPyXKO6wiJjF0kVbYD1NhbeY2R7rLxNfuwwV9uXMZrwe9YXgHa6YxhVK3C9FUhN3
         /rvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEdxmt9NC/y1UJqTRJ5lR9luoh94eHPmKe1Br6eU0KKgsF36mocM2yEKWltYLqStel+d0JxdjHjsMg@vger.kernel.org
X-Gm-Message-State: AFq9FYKbqQD4jddFzxlI12FgF046eqG1aFSH8W7tV9F1Oh9uyjqc8kYl
	yK0+SnoEqgCzooCdnZnkRxbfT2HpiAqxrLi7n/eOedaGGCaCueCjtboh
X-Gm-Gg: AYBFou2Ps9LAEWJAZxPXYKzSiwBuTIyhN43gtlbE45BKwuaZ7FwNj7yQkyAiz5lE/rA
	q0mqjAg11c7z299VaR76CrerlWJgATFngAHjQsRM+cRbOiFPcDmxioH588Ltwfh0fJOr82FKWX8
	9DemOkwQnw//iv9ffVFBYtSJovvvYpB3l/KH/YGZ9Q/TcBabgrdUem10M4DFUaANzTxdCLzQVxU
	8mCXqX6tqq7keOIHKzkeBSO+03bYQlflKRmvuliKyN9OVrwNidOcyCOywfiHw9klmZdmS2jGzQF
	5Oq+v9d2qjlBxOo2V5/5dbuUy2QkQS1IAPUwRJQuYa99ciHc+27sMho8RrC8zXPxbqCpxZWX3ig
	M9blTEnrUk4GHBVueI9hDPGxwBud3Dt5GQ5snGmw4ur6Op/nZ07GB2UXrZCemOP7vxn8PhgA+c8
	QPXCAPQNgT4ZT0qWGKJDemL5tNrox5twz66GnI6IPeyyUCPa0yPHxZ1/7dhiN7yoivJoErErMo7
	hv1tdFHXXVKzjaXGTrlrTl/phtxZteLjvyakkArJvpI0/VfH92TkigQhUCATeA5d4vaId+AWlTY
	wVUl5CgGKhaHurkWyiUrO0i8oE1woE5l2FgvC/VOm8E7AWEVWlNYIw==
X-Received: by 2002:a05:6a00:a8f:b0:89d:af47:905e with SMTP id d2e1a72fcca58-8a04cb096b0mr5594670b3a.25.1792419477810;
        Mon, 19 Oct 2026 07:17:57 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f8aa31341sm3825523b3a.51.2026.10.19.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:17:57 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Mon, 19 Oct 2026 22:17:48 +0800
Message-ID: <20261019141752.2077207-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com> <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi E,

E Shattow wrote:
> Does BootROM configure the EEPROM peripheral for access? If not, I
> think the justification is weak here to include this.

As far as I know it does not. The EEPROM is only read to tell the
boards apart, so I will drop the i2c2 and EEPROM tags in v3 and keep
the PMIC, whose rails are set before DRAM can be brought up, and the
SPI NOR flash, which the BootROM can boot from.

Yixun, is there a public description of the BootROM boot flows, or of
which peripherals it sets up in each? That would give a clear basis
for which nodes to tag.

Thanks,
Hung-Chun
