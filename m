Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19B5361DA8
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782553128; cv=none; b=Cj/dU6FH4FHlMQCf1KNlb6bevXbOjnRliHTG75Lp2e4zcWcuOMviFkmYjlagnsxmHjMUBk2fHaVbhzzhiWa9shgvjOrhjGMKHec4OWiOJLNUHWIaj22WZPT6QEU8T6FKbTiXARyE00IyoWY7tdNP6dcEx+q6zqr4ACVx4Zx5Pi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782553128; c=relaxed/simple;
	bh=gPJVixmTtYX5+gtvBorc1Sto8wQDPB+Zy4awIHGprAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WLBoBpG4fvRU95veMkGhYA9Cfl8udpiaQmfFtQttgPLZnnaTMZ/Cv3H99rPDM+p2V8RfAT3rPZ+Z7uloPGdpHljHCKoMHPYtVHgjU0cC3E2Z/HD7KSxkqyCK/RNxCucv9MI8+MJxpfmmHReV0xQBUTJIA+ZtNYQmpWPKvqvPy8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VovHcHx1; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VovHcHx1"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30b9e755555so1960025eec.1
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 02:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553126; x=1783157926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BrzVHDAthuvQX8kZRzEkQTt99BQ7t+ZkrFrff05bWS0=;
        b=VovHcHx1Ot3YzkLUNbkQpNdnVkk50LiupKNMBx2r3hxxTo+F+JHXp9pc9bTS052B4a
         ojU2V2Wj8cZUvK7579dw6tBHGVDhDldg6nTe5kUAYQCT8gPhmZ2rKqtusSVz0nsPWBpl
         WPY8EYpPAHLRTmY5nn3TPe2/ne8YqZixlD/s6MNQaqY9wQFFe1Udf0WS5T69Gw7g5+Lg
         +wZ4ZY9m+FQhawykhjsQBBDkv1MyWXwzrKN9gM/BjhujtXCcowGMGxabfNlVi4Bp56Rl
         q+iKQbfygxo7jL3TE8ZP9L/arCpkcnc80N/8y5JsPWl1858DynkZMFvjRU7AAVwbEg6c
         99FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553126; x=1783157926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrzVHDAthuvQX8kZRzEkQTt99BQ7t+ZkrFrff05bWS0=;
        b=e+NEBMOfYE/C7BDY/6JKZa3mPf/ZMQAs9JIWStn7OFmmLR+U+9KxNqJL7fDSC693c8
         1WtUT446Ge8SdBgDjo4pmhxCLSQmvQzp8YwO2VfXJ8cyAszUhHOoYPTDLojCi4GGrVC5
         NiH0j2xRxiKDmH5uOXwCFc3ubbLYRNP70aSemqB3tvm0S06ck4leABLvA9dYoZOgPVTS
         tPPjnokp328O/24RWQtsInehCHex4kHMqrZ24lvOMT+g6wiDTfhAeloMGqjkEdJqb3RQ
         1apzjczG2dXcFPH9gTfqZEA90Yduj2L/T3z/b70jEuO70QwjxYT9ftAorRVO7uW1N0sa
         a9KA==
X-Forwarded-Encrypted: i=1; AHgh+RqNmQ3JayR/lay+jDgT3aqzHlmyW/YsFvYYCXOESDZL8IZ/zROvipgE33O6vHqtOG7eYw4/BCAO/N6n@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2oUEr9NYYgWdpwTv74VDMPSLuzFGBzN8z50QH9Ll560wSjmw4
	T5sI6hhHFyTxBV2UiKINXiBE+pAkRLBtevIgtEv2yaDTSVevOzLmBUZK
X-Gm-Gg: AfdE7cmqxK+FABn8+nP315m9JX7rnV5mA9I6JXA/fFGaYINwf7t5FaDhK2dFA5qywM5
	i47hvkRpXfbG9qQ1YgolpJZuKibLZL4pMB4/0HwhAEUZJBs+laY/+VK+74qH0qafABwHJlUf1ka
	B4f+UT+v+yWg0WLvQudwTMw58rAbTd3u22ktORPn+ditGLPU1H+o0HxqUxLhNeZ+t3i8Ps1oMjm
	rGsMDL6Luj6ywwnwPXCZ5xPOjZsMLubGWeA3q5o61acTofVEaxzatHEAr0WFSWSAL7//SVNL9IG
	5y1vKsg8tqdbw3GYgJTQSzZaOGW2R9aJKz/uRuPB15xSs2Pjd+rd9l3goIerGuhc1WK6JAiFe3W
	jWZc0PPssdhrXbi3t9oJDhru5LxDoBlRu6FCTbhpSipAfqyF4m0pSl/3p3fMH7H3P8vXn0QnNtS
	kaYW4wlT30uvU0jxtoBgs=
X-Received: by 2002:a05:7300:748d:b0:30c:ab4f:46c4 with SMTP id 5a478bee46e88-30cab4f495cmr3536469eec.42.1782553125976;
        Sat, 27 Jun 2026 02:38:45 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30cf86deed5sm4902948eec.1.2026.06.27.02.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 02:38:45 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: heiko@sntech.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Sat, 27 Jun 2026 15:08:28 +0530
Message-ID: <20260627093831.80495-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds device tree support for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

The Vaaman2 board features include:
- RK3588 SoC
- eMMC storage and microSD support
- RK806 PMIC and multiple RK8602/RK8603 regulators
- Real-time clock and status LED
- UART serial console and SARADC

Note: This series was generated on top of the pending Vicharak Axon
board support patches (v7) and includes the Axon entry in the context
of the YAML binding patch.

Patch 1 adds the binding documentation for the Vaaman2 board.
Patch 2 adds the actual device tree file and Makefile entry.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman2
  arm64: dts: rockchip: Add Vicharak Vaaman2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
 3 files changed, 553 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts

-- 
2.47.3

