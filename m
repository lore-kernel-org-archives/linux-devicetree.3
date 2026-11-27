Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807415;
	b=Plyf427cCJ/LUobmZmL/ieLFNtfP9eOJDpRxxAFac3KBx/W7mZUkgIKTLGALkpQehHsM
	 n+0ON/3UypUSJMPj1prAt8RMva6WjG8neAGPafr2dvu6FWRgIGaX9IXSAMpYkAdacrIo1
	 U4TjklZ2UI3btuktVNgKK8IOeNDBJCgqrBW08fU6dfWDaJ24NhHh5w28n7XNfsyuS29QE
	 AObu1lxGM5jzojbKcQfEbwTT5vwvWCYNJg2hxq7L6DXMYBBgdYPJ11Xdgzk56QoER1Lfo
	 Cit+SUpWE6ZFB42HDZFi6YOeErU4sFVk71wDLxaF+jVaZn5w13RiuIi/xFhaxUGH8Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YdE4huuvwKUfz6uZKmm4M7NAmc0tPYzip99VdkJjyKo=;
	b=Wf7SENx7yINyPPYL5Q/3ERZ20JP79o2Vo2jRbdBFlW9gJRsFofeMqxeImMkYCjfPrpax
	 EMjojgb08ehcN/MW4HJYylfws0f5Yy9eeplYaWAT4csvpNUSnmVqlWuLggeSa00Xl3xrn
	 RlEQW6WqsKm9yZPwFVcTB32RPWGN7gLg04XfMaus7fq0Iw5YM1y+9fAqPLjxkoHpMji+9
	 GwGPLRyX5tgJS/TzfWThErcGbMvWMkBUMP+nI912xFLM3GHbFVgpzutn3mh7dvEDPpJAV
	 ywyzinc9t+rdNtTRToy2q0+G1wa4wvZnpvN7ZHWTluZ9GzzJQGJsprBBYLqF8PVPG3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7l61vSI;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9432606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 19:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9432606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7l61vSI
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-70b875f6f1fso6627402eaf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807414; x=1796412214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YdE4huuvwKUfz6uZKmm4M7NAmc0tPYzip99VdkJjyKo=;
        b=B7l61vSIhdkOyAt3LUmrrzOhiZd1ahrzKQKN7sK4HQ9v4caE1EJkDi4v/eHzCS+4+1
         BSq2wbPDO6qWQqxOxSoZ7ldKfGivXziy2aAdrj6VhTl1D4mjvZcQdRY+lxGIQ3AnuuDN
         fbHIIadFA7GiMm5sBIENBAsC7EzAb9/zWXRtly9GomZKtMcntUuiP5TngKIXNShFmOFK
         QloMb+EBKwOfCHjmtc/j8KtmrNTNJWMjUUgSORUp1SxtMW+zCl0LM39DeerkcX4AmEqa
         N4JADi4m9QjXp94HkH8H33VhJmVD5HIZ6i0ZPFeGxkW5sWCqCVhBLUaBaJsauJ2XsLcd
         LG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807414; x=1796412214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdE4huuvwKUfz6uZKmm4M7NAmc0tPYzip99VdkJjyKo=;
        b=ogRfNaVQ3Jz88QBA8FR+mDpu5nAddcVxi6TfUlPgS2gBpUXQdvibkd8WBE2PJ3MLcW
         jhP7SbhzKolmHYxKRHin3biC/d9JSWTrCkO7PbPUTWkLMNJueZ07Z5TQ9bngwd/LPA3C
         sqbOrxkelT06mh4RO+a+EGwRSeSwrG2l4a3BNRg0Pi5VJ0qKZd8X9o9hwVPfWjm6F8X9
         XVao4lw7bbcFOgYYX72P1HP3ciVv6GmrrUqhpl+U2AnQO6tgzIQyqivCKt+/YguGVs5T
         PRH1MEpM8gcJTnS1kE9kH6hbrdwvaVHMI7LS9Qu6UZd19UEpwB8bKf4vZiexujK2fXh+
         jQkA==
X-Gm-Message-State: APuU4Z/9gmPvXHvfdTi9U8HIJYEIfPez4Z3ZlFYqFO19iYlwRy4jiwHC
	k6OhGfW1z4T2ym5o7oDrBrfTRjesValTai4No98GHL79M7iqicDlUqOB
X-Gm-Gg: AZFdTZcOu506MML0/yAqvFq1CnkG7lC7FURrknyyvr2I8agouO706NZ3ms2jbgdGnkc
	rY3CsNzwkynujsUUhULoyajw1OBbAsrtRxMOjdZRSJNOAcawWYI1VceiQLZo+7LgMzAnnOJ+hZ7
	c/oFG0QN0hkjv1yYLTurdudyJUIz0Hr7ndNegWfU1yr/pC+penjwDMb55VxQ2biIrspV9rJKvF5
	Gljv7h3pgOGk2ZHiHY872k/9LBPkCByO7fkftW+k+2gIdV7qVNiCYP+RxnJSUVnUp/hj/RcptnR
	gtdIeqGTXHnkPFdC79Qb6UX0i9W6VZjaWyd+BTg8GZD6zavz0c8mFaw/ebxQCyYGJVkzoVQbwU9
	DVgcHb+IbLIfSJ3PQ+Ql/dxKy9lpUdUEbfPkDjCwV7ExODhmOSDvM3BzuQubb88ZNvi3XcNAKQ0
	TDuso0mPf0ZfqdfyWD0U6An+WXohYWxh7rdJfsf4U9SKVbxmSkwGPyEiF0M/RZq11C83RtgqbM8
	QVL3aHddYJJ1XV2Yh+RkNbl9qs+rH2xZ20djy0ANcNVY8KnAg2T9tdsJAIZ3pQy5XzRe2gmH3YW
	lwg25c34awwWdMoIALU1mfRwIcul8Q==
X-Received: by 2002:a05:6820:3510:20b0:71a:efbe:ef21 with SMTP id 006d021491bc7-71b3920c4e2mr14032041eaf.5.1795807413607;
        Fri, 27 Nov 2026 11:23:33 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60891cf6sm24044850fac.13.2026.11.27.11.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:23:32 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	linux-pm@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	xsf@rock-chips.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V5 0/3] Add Cellwise CW2217
Date: Fri, 27 Nov 2026 13:23:27 -0600
Message-ID: <20261127192330.610452-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the Cellwise CW2217 battery gauge driver. This driver is based on
the sources used for Rockchip's Board Support package [1] but has
been updated to use the regmap API and devm helpers.

[1] https://github.com/rockchip-linux/kernel/blob/develop-6.12/drivers/power/supply/cw221x_battery.c

Changes Since V4:
 - Updated bindings to set 64 as the minItems and 80 as the maxItems
   for all battery profiles. 64 remains the min and max for the cw2015
   series and 80 remains the min and max for the others.
 - Renived the status okay line from the vita-pro device tree for the
   battery monitor since it is implied.

Changes Since V3:
 - Two more small fixes requested by Sashiko, one trivial fix for the
   to not always write CW2217_CONFIG_RESTART for the cw2217_active
   method and a small fix for the regmap writeable/volatile ranges.

Changes Since V2:
 - Fixed more bugs pointed out by Sashiko.
 - Corrected an integer overflow condition when measuring current.
 - Corrected logic for when we don't have a user specified battery
   profile.
 - Added power supply changed logic in the worker.
 - Updated the Kconfig text to note support for the cw2215 and cw2218.
 - Added a check to ensure polling interval cannot be below 250ms.

Changes Since V1:
 - Added a default value for the shunt resistor in the binding
   documentation, and updated the commit description to note that the
   min and max for the battery profile is now per-compatible string.
 - Fixed bugs pointed out by Sashiko bot, and corrected units for
   temp and shunt resistor values.
 - Corrected include pointed out by kernel test robot.
 - Noted in the commit message the patch is based on original work by
   Xu Shengfei at Rockchip. I did not list him as co-developed or
   signed-off since I did not have his permission (yet) to do so,
   but I have his authorship included in the file itself.

Chris Morgan (3):
  dt-bindings: power: cw2015: add cw2215, cw2217, and cw2218
  power: supply: cw2217: Add support for Cellwise cw2217
  arm64: dts: rockchip: Add Battery Gauge to Anbernic Vita-Pro

 .../bindings/power/supply/cw2015_battery.yaml |  41 +-
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  |  20 +-
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/cw2217_battery.c         | 878 ++++++++++++++++++
 5 files changed, 945 insertions(+), 6 deletions(-)
 create mode 100644 drivers/power/supply/cw2217_battery.c

-- 
2.53.0

