Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325380;
	b=AhIm0WYX93Demo+RHG1Ywbiu6+L2+NbenAhAVPAQWJf3unC2YsfPFTm1dhgk+l+qnBwz
	 rvQZyCEGQgFH9UaTPeUPLAsUXjM6Ykf/eutAgQw41z8mkIWKXYy5c8pBbLKjO43iu8L0Y
	 toElSYGTzuxNbW3wrHPqgCmKx1I+ljge8xbxJpjo6LmBhTkTRFOop63blm/ukM8UDHCcR
	 Kc4hdia8cP5f8AN4tY3bljzmRkWE1ugOvao+hG/Ruvh1Fjt69CheGwx6ljAFIFDHr2Dpx
	 td2N1aTAJVdIHUm7ACpZ+j0GyYlKXwqO0lGMcELRi3QzitlyE9OQES7ka6Mh7p73vgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4jRjHl81EF7Up+etusJDBfF6O2vx8cD/qRLceIcvSnE=;
	b=rdEd2BImdIk5rdEW2ruVc5vDmPfafmDW5EABBIQzMon6p2y1Iztjoce64r/DaVoG9WuV
	 zbhfkDCM8M82RmvzdtB+yeN4sSnpXcXQiVNBatcJwRl90XvYmZ0EscmwAfrJbXEe3wvTn
	 bSDNADmN67kMNABftIm89svcRmIWszjBIi1jvbWVpchY0rF2WWk/yePhZP6Bqh9x5lgzY
	 tAN1clsuvhYxqejgYr5mQEAgYN/VtEb/EMOnK+lPg1OELucn81rmFlYlNPReopJ+GMM+k
	 Uo8kardjzWnHX8C5yPD+QibrQ+gZn8+q7fdwN9wU37vVhRE83YFRwMUkLUVJREpiQbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5AEAHyv;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B83606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 15:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B83606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5AEAHyv
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so18722461fa.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794325378; x=1794930178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4jRjHl81EF7Up+etusJDBfF6O2vx8cD/qRLceIcvSnE=;
        b=l5AEAHyv8z+xulJVwemyoKO1nMLJoW+0E/Ca3zvhcOYCWcwLTpnla9Us4ZMoYZhRwt
         7D/Bt7S60gk5MjmfbWwFBma7zl4e+M+3SeYfldkBWxgY+g9v6lgfKF+FfeyoxMsIp17i
         IX+nH54etlVjQl5/and1ir8fTJVCeTVV5MXnQRsjxDf5vW+iKaIqR4uAhRhOWKChdmX+
         Iyntsj6tex8XP0yk5L1n1DblWV7pVcDQ2YEjjhsTrv/VibzeLYiZg1MFsZMMNJXSi3qF
         nA3wkyWxZBeQtkT+OBHdxH3R5nFzWx+LojB6FzA/xmcP0V4jUdPA7Ka8EqIdYoevtyho
         xE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325378; x=1794930178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jRjHl81EF7Up+etusJDBfF6O2vx8cD/qRLceIcvSnE=;
        b=1ILzLMGOAIrqGBkKcvQJVmltW+nDweLhxiGtaAoTipDzXSAz/bN9R+qIYm0YVA6o9L
         xBMkRUsfjRK0jHBuNtj8BNWsbFqKktRGyjgMkSIElwfQVvLXcYTEO6oRhymELdz/u+qx
         MRuY78pzUBBNwIC61nkAUOfSKfVP4Hdfgr839h9taKaa1B3IySLZvxCJkvr538XdxxJX
         07NecNVU0y2G7gJfyv2dDPN5k+58zD4ii/JiMQAMgdqo9AXzxRAAgtN+IqeCs+cgz/Hk
         7UHCXAKyMmEQUnJKyfWn+l5o0m18QoF6E+QqslGUU/UNFCGuWBffZMIhNWq6PfZ0yohy
         HZ7g==
X-Gm-Message-State: APuU4Z9CvRpaOYntY0S+9I0mmjdQesRZHf2szj+BO9QIqoTqmjbkxoyQ
	p+59oKobDQmXc8iBbc5t41iEhe77NrLsvAhEcVZBM84F6gSiZd1MEDzQ
X-Gm-Gg: AYBFou3xobtjpMRGfmfc8CjvoF4jOL7mQU7VPJVhT1G6ov9hpILp/yaJ5zBapUqPT83
	zFEIqC05C3gyB8pZbT7W1ROixbDA37U4Lp5Woib34n5vCHMD/AOOd2WY3C3zys1h7oCjRtYG8lI
	WPrK5hLi5jusfpbHyrzvtfpyWjF7UZtxXTfoWjDn7DAlOyEQ5qc8kMrEZu0yWY5O5Af9tLlhD0y
	VEckOL4BLyMACAnqP8yJ5vZJ15eg7elI1DqGBKgD0fPjDYkFttGA8x0gi/bdb0GfJp5iJV9GCD+
	gwAWr/tTYQ+AD28ul0L+6o7Y4dG1HRFYU9dmgNBtRkAIOcI0O/D/oXsgEm24X8Pjw0zQrOtcgpj
	mqf7l7lG+NDWmqoHJt/o1+d1ZH3sHxLDYk728p661l3omk5B/Fvfr3+wRzQ37o6lhrYDR2S4nJY
	oKknQaX52i+8bTHHWx4dxdolxm2MvejDXgFrDyy0waLV2b4ifosJVt5cWOZjfyll1xFT+iFQTXp
	Ejfq1vEBWwx2akeDN42yiK18GNGZOtQk5TqfMY+WQuVauCA3M8BtK5/6qzl273RslXva0yUbZGj
	mGPcvYTCKgFdbQ7J/woGRqzDHmrt/pIAGafBLYdITyperVCtxAqq3/9P7C1CS2PU2/vmbAIb1Wx
	UxDY4Y6GyN61wpxGRgycNClxcTSzdzqX8lFbyNA==
X-Received: by 2002:a2e:a9a5:0:b0:3a7:6d4a:1c9f with SMTP id 38308e7fff4ca-3ae0963162bmr6483001fa.15.1794325377875;
        Tue, 10 Nov 2026 07:42:57 -0800 (PST)
Received: from yantra.. (nekmmqt3kfwnocz4ivv-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:453b:19fe:80e1:2b9b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0923d583sm5751481fa.21.2026.11.10.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:42:57 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 0/2] iio: pressure: dps310: data-ready trigger
Date: Tue, 10 Nov 2026 17:42:52 +0200
Message-ID: <20261110154254.39092-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
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

DPS310 can raise an interrupt on SDO for each new result. Document it
and use it for a data-ready trigger, so triggered captures follow the
measurements and are stamped with the interrupt time.

Tested on a DPS310 breakout (0x77) on a BeagleBone Black with SDO to a
GPIO, level-low and falling-edge: one scan per pressure result at 1 and
8 Hz, gaps steady to 0.15 ms where the handler timestamp moved 1-2 ms.
Without an interrupt nothing changes. Not tested: active high, which
needs SDO strapped low (0x76), and ZTS8032.

If the chip stalls, the case the timeout reset is for, the trigger stops
firing until the buffer is disabled and a read resets the chip.

Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

Rupesh Majhi (2):
  dt-bindings: iio: pressure: infineon,dps310: Add interrupts
  iio: pressure: dps310: add a data-ready trigger

 .../iio/pressure/infineon,dps310.yaml         |  10 ++
 drivers/iio/pressure/dps310.c                 | 129 +++++++++++++++++-
 2 files changed, 135 insertions(+), 4 deletions(-)


base-commit: b70566610b48ba49dec636019da4d696db64b085
-- 
2.43.0

