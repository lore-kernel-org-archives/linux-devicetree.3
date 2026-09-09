Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80648437845
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 22:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994216; cv=none; b=dNM8zp56FzRQ1mvNIsUNTZMjcc3HyYgHWHzUd15x2azJGXt8jHwIwQmvtevrn1e/V717YdCTkKSK6XquoRBbrIXLgwxt9abi4ngYRHaXyPskOo/j/uvI6QK5Yy7vqt9qaHEbJzIdnmrhMOuR5hR4YotWXQHLA8h+tYkwng83zxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994216; c=relaxed/simple;
	bh=UP3QHC6RGFG+fVhkB/5cTUsoeWzERQyR8G80FcVE2gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fRN1XGSrtv6gQs9QcxQnnH+JifVhxBJrSXCt/sAb9vV9kV+gxPFriWgW1dEtfA0TRSHBbjaQZk3NZA5rf1cURswqoYpEDLOsWi0+yEA860ud5OkhOaYnB+L/KUPq2l9ZWpT3aawXdAljHPlsWol2xcbT1xQn09/AHN6+rzhZngA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsbI9d24; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsbI9d24"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so929173e87.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788994207; x=1789599007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mohJO1C3Ec3h1EifombDVZn/MyOz6OHkpyWV2XyP7xs=;
        b=lsbI9d24Sg2BVEDLrMfSi05P7AXTR1v+4nWzFLfy1DbitWqRK090o2ckxdHwPgwVAo
         1Q06XcRH3hzsrMLTBzn4Ny3FBYtyRYk2pzwxKbc+P/FeMHtf1gyc1/JZOZhZdakJ1dgq
         M78nJahdzQVvdntNAzRyIKDIFye5TazshJE7F2LGR1i2RgD7e6oYFHWBNaY2fA39MnMI
         bJat3FIC7+GqxfAAjUyw8la4JXxW8Bvurk3P7iSyUOll8470mYBBQtVmQsaOPlxnoj0/
         jU6BSqX5eimtnpk9THIsk+ju16gjdTcNOvFaKx0nLe+5b1mqfxuMpiHIO6Xsx8rhNWjS
         eoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788994207; x=1789599007;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mohJO1C3Ec3h1EifombDVZn/MyOz6OHkpyWV2XyP7xs=;
        b=F2M4giO04koO4PCNgyumikYRBAcWJwPwk14iRjJtZ50y+Yw4gnJ/kO5lOiHzwbFHGa
         62Qzc+f2DIIDASWHcvqbADg/ABM/6myYweHPOust7YlOnPiKSBwarLtl4UNSk6q4QEaC
         0CaJJPzSOQqGj6wNJRB2YS/X4alxHJteT7+A+KiQlP5Y2zfBBYP4tHkFbiYKBGNrhDSz
         ytkX7eoI5QHGfrrgaDr+Iu58t7HhTLHYTEw9BuIraA8fXYoj6vAy4GZb3n3i01cmQyd6
         aPrmoQNNavnDS9wOK/vzsh/m9FhChsdldLMHToVCQMDVproA6f3bhzHJWE3Cis2K9x4x
         vMDg==
X-Forwarded-Encrypted: i=1; AKwUvByhomBMGHyRykTpFaYtrmFasDjNHKHCtikgKFHgnAi9eQ4aaLs8vj2DiaFOXqmTk2S1Ja7aamWg9/kQ@vger.kernel.org
X-Gm-Message-State: AFuF++lcUyggBoVSKqk6kiSHEBKogNYWHcpVGWcrxQtYCokmMGUlBERU
	j+U7Gm1Xcf1uKSyidv+wt438ZfzOIkgUWyA7d9xGpliWO6T1h7EOGI7t
X-Gm-Gg: AYBFou3njHHlFE1jtEkHaThg7in/ApVKDy7frMkIVEB1VPX6j0GC3v3xju9iMnofENY
	7qHUbGXmvlwwSDBJ0G6lnNdY773jLtykd4lA7e2UNK33MlXAl6bRLTeES3v9bSy6qhaibBup3rY
	XxA+OvTCYsWDBfTLRApFndpQ89Q9kayqonpfrGMRsSCvAW5fsXb71J8TnimsC6C/ub3IbmPKWEi
	CfnF1jkTPRaOqV9oQF+wdVudJ+Co1DXXU0HmutPQrRn5r0lStp184zg7nU8lU1EyPUm3nlf0hIH
	2alVSPFko5+0SctU4XFifKWz7moyks+MDPciVVhxLCkmtw5yxtSXDzMWQ1UfR9sBY+Yi5C2x6kn
	AwAZ95LLDRPVmvnToFr+Wz+BSIzTp8HaRfjf1zs3zqrcqnZ+UfY0HTQ6ZPEN8ucvu1kKqnRyoQF
	3dkE9J/htAQqzbbKx/I77RFes9pUgfBZlHMxoBnHDQcUtjksriFPFA6QPTejDrrNtUJxR5nqrcS
	WdKQM1oiPRBig==
X-Received: by 2002:a05:6512:6183:b0:5aa:62df:cd0f with SMTP id 2adb3069b0e04-5b89a2eb2a1mr255403e87.2.1788994207240;
        Wed, 09 Sep 2026 15:50:07 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74c409155sm3717504e87.73.2026.09.09.15.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:50:05 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: devnull+hystericaldragons.proton.me@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	jensenhuang@friendlyarm.com,
	diederik@cknow-tech.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] arm64: dts: rockchip: Reset the NanoPi Zero2 PHY from the MDIO bus
Date: Thu, 10 Sep 2026 01:50:02 +0300
Message-ID: <20260909225002.976-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260909-r28s-upstream-v3-1-ee3e1a34a353@proton.me>
References: <20260909-r28s-upstream-v3-1-ee3e1a34a353@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed Sep 9, 2026 at 10:33 PM CST, 安容 via B4 Relay wrote:
> Describe the reset on the MDIO bus instead. __mdiobus_register() asserts
> and releases the bus level reset-gpios before any device on the bus is
> registered, so the PHY responds whatever state the bootloader left it
> in.

Confirmed. And thanks for catching the deprecated properties I had
suggested - I had not read snps,dwmac.yaml, and dt-validate does not warn
on deprecated ones, so none of the checks I ran would have told me either.

I ran it both ways on a NanoPi R28S - same pin, same RTL8211F on mdio1 -
with two images that differ only in those nine lines of device tree. Both
are 6.18.44 with mainline U-Boot 2026.07 (generic-rk3528).

Reset in the PHY node, the way mainline describes it today:

  [    0.217516] mdio_bus stmmac-0: MDIO device at address 1 is missing.
  [   24.566496] rk_gmac-dwmac ffbe0000.ethernet eth0: cannot attach PHY

and the port stays down. Reset on the MDIO bus, as this patch does it:

  [   14.608938] rk_gmac-dwmac ffbe0000.ethernet eth0: PHY [stmmac-0:01] driver [RTL8211F Gigabit Ethernet] (irq=POLL)
  [   17.770103] rk_gmac-dwmac ffbe0000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx

So U-Boot 2026.07 does leave the pin asserted, the same as the 2025.10 I
first saw this on - the commit message holds for the current release too,
not just the one I happened to report it from.

The one thing I cannot confirm is the board in the subject: this is an
R28S, not a Zero2, which I do not have.

Tested-by: Andrey Korshunov <razor1702@gmail.com>

Andrey
