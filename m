Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936528;
	b=Z7YTVAiR7/T0idCvgJ1TDWL8LQGt+o8Vz38mlejOAruy7BG8X1dz/ccTihtIVxvxAbtx
	 k+NbNT/s8AqXH6O0md1UZPklY8SzVmsH8DYDBDVKjcFFYtHIN/h0GEYhpnC1bxnCNfNoY
	 A/nvSvd0tLPfAyy2+bHg9fis/05xdpUFc57gGqheJRDTK8de19Uc2+53wYj6XpgIjR6kD
	 kqzd+pWhakWgyjOjFDkbGtjkyY/pMIOO1plNjnl3ui+5uG0HM1VIt+tHiM2NyI+ghhhOx
	 7Kgf4rjZLAcPQX0KWgU5KW1MVe8LuHqohYOJCgdupPNBvqtVuItKvsuubkRkSQE9rSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ka7y97kjrP1N5aLm53cFojAaC0fJOtAirjVuWEljQwo=;
	b=l1ZYopylapbEpaffhlwkMwJTdJcKUDYUaxED+I6vtKGAv1HVKSYdvH4vOtHNurL4X2bW
	 w9kzvLFbkbNTGqRLuTYzIcczauF+kGl+2f5Kuphzf6W2PBwVZhKQ0Odah9xAhzdjdqg26
	 cZolHfh+LwDmgwNtbE6/d7Gu7cfX2qJQCGCuQWX0llhcPeC1PtaGL44Z9N+XrwWJH13+v
	 f2abApAivO8YHxIyvNcFpwX8piW8nylDPYGw/1uLsRn04kyi62mp+vjg4Yp1wcno/54z5
	 b8EMmCoeuRBAUYTPBAMvgT+ETgVkL0kSQra85k9VOwiq1CpIVgJGZ/meW7SKh0SpR9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7NPkbc8;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F20606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F20606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7NPkbc8
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso1048317fac.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936527; x=1795541327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ka7y97kjrP1N5aLm53cFojAaC0fJOtAirjVuWEljQwo=;
        b=O7NPkbc8YXE6vipiT2iOvKlBCkHb4wi3Xj0BESPetKwjukqy89o7UXLSQtZ9pFlV/H
         1MxZMAgA9VyYFZpiwT5QtSkGW1CZK/8o+qbmsLYWWyq80ewCVvGvZ316r0nmvRV+UPvC
         LyIIi9xNgi7jK42Jx/ENd03IVIVsgdxti1+fJQxl3H+f1U6NPMy2FGEJqFi4cyp5wT7t
         2/LGLH20SbGsw5KjhIpvTPs+GDiHfLkmHy5IVCKw8IArz6Gv7TLMrA/hKMLg6GyQVaZl
         Bl8UPr0QN6l7pGaHqQEJ8ajRAL6GncdDXfpO80oqAHrfJ5U2zbKOA25QkZwXLSdPA92L
         XGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936527; x=1795541327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ka7y97kjrP1N5aLm53cFojAaC0fJOtAirjVuWEljQwo=;
        b=kYRGnkN6TmM590llGek55YieYKpq7o9xnSl3iW9EPlO3HMMq6Yky9bZw8Dfx4tFlSf
         Rj/r1VN6AHs2wk3fHkObGwU2Q6nxKo8NSGUEKCnQ8KOWWJfRQZCThhQAxwaGpYC4w8Nm
         Qtw4+Ozi5NhLyzlJKFT4dCYMEtYeA2IP6sG2DG+FmnHs4mKNqGSsLDRm6x9y2X5F+AtN
         f8DdQT4Tn2ZOT7mPnoMboAM22wQJX0c79bgWXmZltCos1BYDSgFdAwSvvyrQDzKh+4UC
         x6MiSKR7Y1E+jY5344trTzxZW20wmOxqeOt411kGPoF+Tf6FXzPCzGQ/qcZg9rZSXfAe
         k/lA==
X-Gm-Message-State: APuU4Z8dC/THSVZ3DNWKRYxOM8zqRG8zpRfgrn1MQuVBqP6bGOy3pKOR
	v6PO4xh3o/tD0+/fLRqpBWIByg3ZPrey4Ldz9zQOp/h+CLOP5HEDk32Y
X-Gm-Gg: AYBFou36Q7f4qcPLdPq6YmR9GtyxL1DJfmyKDX/knOoOdNd8kpCifFATLsqthenrXVC
	okvou1jbMnX63jiekEXSCesAIMZRFk0TyFWWlmcKQhBTVIvjuuOF4hYUFPRY8qedEPFFSSnwdIU
	LB7BgIq023ctHdXKsQvKUoio2qLMEa7gViKFWUNesJgWEZrAOmyzPDYl+DXw4W/ZsGjJamVsvfH
	iQZhPhmPkh6Bvehw1tLaJIUQ0vc+qhfY+YrRDLz5utB5waWlVh1WNUEJTaxnmzTIvWgwiKUlsqH
	QZUv1Kbyq0FUiKk/X5xv5fSLqP0kdVWa3vkYyNoDAPjfK5WEkJhl1JBJmYEYrlUN6TYfqtkFRTE
	ut9/65kDa3Z+B8tPIKqY7mNoQ5/NbztMQNY6SyQwsmdaGDe295KnhZSXXRibvCBKPCw7yW5DO9q
	k9bud7e7xzZ+V7l9cW6fnBeSnmk1T3MylndYvr0tLNixRSv1nxhTPWtMMu2oK03Ipa12nij16ft
	QKFatWQsSSnE95IQCsFaQ4gExHmmyJQZAIpEIo7K078glnAumgWIoCGhdbbXU2Ach/RdxZKTLC6
	8y9XcRRFrRQgFFwyIAxMmqX9NVJ8yg==
X-Received: by 2002:a05:6870:32ce:b0:4a7:1d64:2695 with SMTP id 586e51a60fabf-4b415e97967mr2027034fac.43.1794936526492;
        Tue, 17 Nov 2026 09:28:46 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70d5b1c64sm148358fac.14.2026.11.17.09.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:28:45 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	david@ixit.cz,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 0/2] Add rockchip-timer for RK356X
Date: Tue, 17 Nov 2026 11:28:40 -0600
Message-ID: <20261117172842.65346-1-macroalpha82@gmail.com>
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

Add the rockchip-timer to the RK356x SoC. The timer for the RK356x is
register compatible with the rk3288. Address range taken from BSP
device tree and confirmed with rk3568 technical reference manual.

Changes Since V1:
 - Added additional missing maintainers that I forgot to send to for
   V1.

Chris Morgan (2):
  dt-bindings: timer: rockchip: Add rk3568 compatible
  arm64: dts: rockchip: Add timer node for rk356x

 .../devicetree/bindings/timer/rockchip,rk-timer.yaml      | 1 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi             | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.53.0

