Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A1D29AB1A
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687646; cv=none; b=OGeNRlzyBw8KqTpsvX6aR5jB+VbkpwP/p0QOKI05RE2SIACJDbkRrVoW2UlCCevlYFhj6lqrxsOdbntdHlD6W/9WyFAHbgtArvyMii4V48m5ASdPavTIxwI4NXcdq6Na6Bw/QwmW2jI10J405yE4XTOvWF75tiSKN1/pMn8E5zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687646; c=relaxed/simple;
	bh=a/bru3jPKJt+ms/kPKynkW1KIeDXQs3ZGvF/z5hbxB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ggAiX1RKPnPvkvu6qyfVkEsvsHdEQX/2Af5qgMUy87QoWZq6vFHINpCgY90SX1PGJrKks4Qs7/XJNqAAd+n2fIVpdnRpXJFY6KY+yHkQio9njOuJX+E7YpPaQW6uLAqt3PebLUwV0ocJ0jI5+RnK8IoBAcSf/YCowUSu8ryyK6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sd0LnBzp; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sd0LnBzp"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13809223fd4so3217670c88.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 16:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782687644; x=1783292444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7IyQ7+lfeLZPfYuSv6PDTk5mfq4Ex6emC2k3dW0k7M=;
        b=Sd0LnBzpnLzrebMC4Mn5/uUdbb2cjVNchC8Vl8nMeGZ5RPW3eWuP5plIyHBPYFxCHy
         71l5C07JvEHtaC6be4RWZBCzhGiyAHSBpV/K2FDrTuPEVuO7rpyCsmhceXAor1HvyIBt
         Wh9Y+zcWd80WJUPFxaqugy6SB17kYbsoqBmLcTBokdqd+P7gUuXvBrLxWhHA3iO6pvH6
         O3D0hWDBe0MSZHxHVZSpaBk5TXgheqa0sBnrVnEoS99hnwQbzGuhp90/FnaxniSCpLAe
         vC8s4EscknaBXV0k6pY609Shuu8TjziPD52189yXX80p2LMoty9+CWw1hZjx/20z7qnH
         vIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687644; x=1783292444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7IyQ7+lfeLZPfYuSv6PDTk5mfq4Ex6emC2k3dW0k7M=;
        b=fUL1XKJoCSSqKsF7blSf7kR2OQ36HMkcglTM0Wm77UVsYHsBCrqihjBvORYasD695g
         ULOJtUofHSBJIXlHKiYQnvvLsf09n8LhupQmKq/gHMKGJyRBpzCys9oewapdOJ0t28MS
         Z6mrX921d/THkMwO5sMye3GLUykIGGlE50tHkbjRuVe8irher3Xjum5au1eU0jWCoqXV
         yUE6t+i1jF8pTi7PSXh2BjN91dO1I1bagfyuJWm8vLi1ItfBO41zS7L37+Dvm2h8bBFM
         HmKEQW/D1hRnGdC7Vv6bhKenK4F9sWP5fsxdLD21nYhMkTHUbAJorbdpMZfWvlW+NGQA
         cqbg==
X-Gm-Message-State: AOJu0YyejW5x4TlPULgP/nnOMB+Wn81R4HLm/jjI0Le0pZF9ISV+2C3i
	F6wWD4uwtWu5QfiA4YMr8rwT6NS4X7v9Twf4XiQL1QrDIKnD4yy1PkFD6Rs1+w==
X-Gm-Gg: AfdE7ckqK7Qyd31xLyzrLX8jnRg0tCIR9PYHaljqPzafvgu36tvdYN7bg+OGlwpYdTA
	dcVUPjWjfbqSu27KJV6Qj4+7FFpNvT8vrUQQTe4T7RqD7JTvs3I/Ld2Qjjp8exM/nvKwt5vvD/6
	Jjx0BToDz03aFzbbp+lkAFggY/R3ThJ3J72DsQcZu/8qrNgeX1QjGtSxV5/xD/XAgMiydhkt0wg
	JlH2/xmi4h7b+BAoR8+c7IwrqUW8XqQX+YVPnbXYaQj8pqWDNQ+vshUQHL/IT75olSwH02Ju8xz
	mZp0pGRvySwlkfaAlBbhrV9eTZMDr6wJNdWm0mN03WtTlkL17ZgslVdp6TlfMeo9qKknKcsEix9
	+ffDKpXQwl9bJd80eoXnXIh2ncUegF+dAjIjJlD4mOtzyIaKy324hvom/bo6m/oynf32H2WYAUZ
	g05tfTKpLHX+xIDnpyep6Bm191ZjTEBORJNz4mxQgJFQjoKB1cnH8USkb6J/bRnG6E+YzFQlgs6
	PMiwXZJHQ==
X-Received: by 2002:a05:7022:381:b0:139:ed5d:5c9e with SMTP id a92af1059eb24-139ed5d5d76mr5557357c88.39.1782687644290;
        Sun, 28 Jun 2026 16:00:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm41359030c88.3.2026.06.28.16.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:00:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/4] ARM: dts: helios4: add regulator supplies and thermal cooling
Date: Sun, 28 Jun 2026 16:00:38 -0700
Message-ID: <20260628230042.1204293-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds missing vcc-supply properties to the EEPROM and GPIO
expander on the Helios4, adds SATA regulator supplies, and wires the
on-board LM75 temperature sensor into a thermal zone with active fan
cooling.

Rosen Penev (4):
  ARM: dts: helios4: add vcc-supply to EEPROM
  ARM: dts: helios4: add vcc-supply to GPIO expander
  ARM: dts: helios4: add SATA regulator supplies
  ARM: dts: helios4: wire LM75 into a thermal zone with fan cooling

 .../boot/dts/marvell/armada-388-helios4.dts   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

-- 
2.54.0

