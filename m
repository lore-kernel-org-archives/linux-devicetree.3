Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328D3DEFFE
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 19:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080327; cv=none; b=mJSqwov8XeQ87A7jwknBMCoW1xQnNSYd6fe/g99OrdRV/x4M5qZ39a6xNBkqE9L+ZSFXsBwRq6Fs9/hhF+ztyzoHwNg8Xd+6NrF9RRr64ntH31d9bjgeB2xBWVlT/jkyh+8pbjgoYi25GK6T2KQuTKAoNVEYRSazqSJknj488Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080327; c=relaxed/simple;
	bh=aFH/RtkadQBoSpCLWig67N9HtD1tu2cQ2bxMv5Qe0dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mSR6RJYUqkQ6f1qJqGMh4Nl1mRvH+IObHP6f5KzBANRWWUAe2LxYzWNyJ3yHfIA3Mt5vJLOikdb8tvOn3nH0JZm6DU+wz7nGvovMizm6YmtrpWa1lVfmbO09x1xI1bCBst06xENsb8XXlYH4+Ac6xbNGo9KNvlYrx5dQTO4plnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f84023916so124108f8f.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080324; x=1787685124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bax9W38/JMIaV0Z2sDQmJSHm0aG/QQBKaWLZNsB4ByY=;
        b=Vu/qpuVsfeaVCMfsjoCOTKQoFPv2pIzRPFxHyLlKyY0iky4Q2jXsLiFcWNjV30eUb3
         sCfI5ugDHCpk2gFEReXvwAiOEgayT2pEGvrN5bAIU2DqimtmAh0LAm8C3tz85UMdlLkK
         SgrehyI7oXTveMYuAlS52ybk1BDZivskwVkUkbcIbrUGQ4N3PoX4F5bQFDec+ZXTC+zJ
         rU+6+4qgGzcQBDequai4L2CI3ezANJiJa9ftj4P5jCrIF3XrYqMQ/6DBmkOjD4uyjIRv
         AFrhUvL2J3vFhN9BV8S2gufF4sNszzZxETPp37KwFzksrGZVT8ABI2bvGdIfdSKYndhu
         yrqA==
X-Forwarded-Encrypted: i=1; AHgh+RpSxOYoefy1nueFVs5z1K050yDIf/3KqxjgrH6amI6GiJPg1qUNQUAsYpkA1BocL8fgAW7xZOVlZ85T@vger.kernel.org
X-Gm-Message-State: AOJu0YxyQ5uhzCkYpMY5YBhYOE6uKZ/JoC/a8Up7H+86h9HKPrUq6Pta
	l3ljrD7zh2YKHhNxL0MLLODDfu0/Ef5UAvO6QrRct0v6T2dwVv6gVAAi
X-Gm-Gg: AR+sD11g41V0ZgGbiHk9ZwZx6LIKxpCvTyMh0X5znTOaII2XgrPlowekkBpKB8U4Jes
	SN/eXuR0aKHlAHBgUz/Z8PL0rgBZ6uFgvt+pm8IV/7WuudLqIGyMsXqVnsLTh9CSRLLDpNHhYXA
	eO7ZRu0HR64BCzG+oZjd+LyUSBWx87z6x8AntXMSohbnnxKXwQIWXGFoowVsFV9iknovpr2dXoz
	V3P/6a3mVoUh8MXH2cnCNMUZ86p32Rv4DuDmSuUczdJmyLZFwzbuDGLqmu2nkfxn8jiIbXM5xq0
	FLjn5HFC1TIZmU8KHJpP1GgHEYRKQ6m1/AQ7flvWtSwsO2jU+n40oBS+zbFt9ah4cceyDaO1SyE
	1M2IETz/IALTxe7W2FqzohGbGtHOE4pIOs6Le4GDhgcg4/y97oxHER6RfFUjp42MIKAORYPYL+g
	qHkFG6qC/HAMOIkv/kD4hjMe4YUI43zlAyQEARXyO4aN8sszs+5IDKF64wTdifxwBEOaUw/U/Ha
	HRRfr+bKKG0EgNrLavshiw+oQo=
X-Received: by 2002:a05:6000:480f:b0:482:a36c:a5e1 with SMTP id ffacd0b85a97d-482b07c826dmr482120f8f.1.1787080324198;
        Tue, 18 Aug 2026 12:12:04 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm14673154f8f.31.2026.08.18.12.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:12:03 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: amlogic: t7: fix UART clock and SD card recovery
Date: Tue, 18 Aug 2026 20:11:57 +0100
Message-ID: <20260818191159.11523-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes found while booting mainline on a Khadas VIM4.

The first one wires uart_a to the real UART bus clock. It was pointed at
the 24MHz crystal as a placeholder, because the T7 clock controller
driver did not exist when these boards were added. That leaves the real
clock without a user, so the kernel turns it off when it disables unused
clocks at the end of boot, and the board hangs with the console gone.

The second one drops regulator-always-on from the SD card supply. A card
that refuses the 1.8V UHS switch can only be recovered by removing its
power, which that property prevents, so the card never initialises and
the MMC core retries forever.

Both were tested on a Khadas VIM4 booting v7.2 from the SD card.

Lucas Tanure (2):
  arm64: dts: amlogic: t7: use the real UART pclk
  arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power
    cycled

 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 3 ---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
 3 files changed, 4 insertions(+), 5 deletions(-)

--
2.55.0
